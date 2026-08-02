#!/usr/bin/env python3
"""
Analyze NVD enrichment delays using the CVE History API.

This script uses the NVD CVE History API to accurately determine when
CVSS scores were first added to CVE records, providing true enrichment delays.

Metrics calculated:
- Median enrichment delay
- 90th percentile delay
- By year: 2021, 2022, 2023, 2024, 2025, 2026

Usage:
    export NVD_API_KEY=your_api_key_here
    python analyze_nvd_enrichment_accurate.py [options]

Examples:
    python analyze_nvd_enrichment_accurate.py                       # Sample 1000 CVEs (default)
    python analyze_nvd_enrichment_accurate.py -n 500                # Sample 500 CVEs per year
    python analyze_nvd_enrichment_accurate.py --api-key KEY -n 1000 # With API key + sample
    python analyze_nvd_enrichment_accurate.py --seed 42             # Reproducible sampling
"""

import argparse
import json
import os
import random
import sys
import time
import statistics
from datetime import datetime

import requests
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry


def create_session_with_retries(retries=3, backoff_factor=1.0, status_forcelist=(429, 500, 502, 503, 504)):
    """
    Create a requests session with automatic retry logic for transient errors.

    Args:
        retries: Number of retry attempts
        backoff_factor: Multiplier for exponential backoff (sleep = backoff_factor * (2 ** retry_count))
        status_forcelist: HTTP status codes to retry on
    """
    session = requests.Session()
    retry_strategy = Retry(
        total=retries,
        backoff_factor=backoff_factor,
        status_forcelist=status_forcelist,
        allowed_methods=["GET"],
        raise_on_status=False,
    )
    adapter = HTTPAdapter(max_retries=retry_strategy)
    session.mount("https://", adapter)
    session.mount("http://", adapter)
    return session


# Global session with retry logic
_session = None


def get_session():
    """Get or create the global requests session with retry logic."""
    global _session
    if _session is None:
        _session = create_session_with_retries()
    return _session

def fetch_cve_history(cve_id, api_key=None):
    """
    Fetch the change history for a specific CVE.

    Returns the first timestamp when CVSS data was added, or None.
    Uses automatic retry logic for transient HTTP errors.
    """
    base_url = "https://services.nvd.nist.gov/rest/json/cvehistory/2.0"

    headers = {
        'User-Agent': 'NVD-Analysis-Script/1.0'
    }

    if api_key:
        headers['apiKey'] = api_key

    params = {
        'cveId': cve_id
    }

    try:
        session = get_session()
        response = session.get(base_url, params=params, headers=headers, timeout=30)
        response.raise_for_status()
        data = response.json()

        # Look through change history for when CVSS was first added
        changes = data.get('cveChanges', [])

        for change_wrapper in changes:
            change = change_wrapper.get('change', {})
            change_date = change.get('created')
            details = change.get('details', [])

            # Check if this change added CVSS data
            for detail in details:
                action = detail.get('action', '')
                detail_type = detail.get('type', '')

                # Look for "Added" action with CVSS type
                if action == 'Added' and 'CVSS' in detail_type:
                    return change_date

        return None

    except requests.exceptions.RequestException as e:
        print(f"    Error fetching history for {cve_id}: {e}", file=sys.stderr)
        return None

def fetch_nvd_data(year, api_key=None):
    """
    Fetch ALL NVD data for a specific year using pagination and date chunking.
    Note: NVD API 2.0 has a 120-day maximum range limit, so we chunk by quarters.
    Uses automatic retry logic for transient HTTP errors.
    """
    base_url = "https://services.nvd.nist.gov/rest/json/cves/2.0"

    headers = {
        'User-Agent': 'NVD-Analysis-Script/1.0'
    }

    if api_key:
        headers['apiKey'] = api_key

    all_vulnerabilities = []
    session = get_session()

    # NVD API has 120-day max range, so split year into quarters
    quarters = [
        (f'{year}-01-01T00:00:00.000Z', f'{year}-03-31T23:59:59.999Z'),
        (f'{year}-04-01T00:00:00.000Z', f'{year}-06-30T23:59:59.999Z'),
        (f'{year}-07-01T00:00:00.000Z', f'{year}-09-30T23:59:59.999Z'),
        (f'{year}-10-01T00:00:00.000Z', f'{year}-12-31T23:59:59.999Z'),
    ]

    print(f"Fetching CVEs from {year}...", file=sys.stderr)

    for quarter_num, (start_date, end_date) in enumerate(quarters, 1):
        print(f"  Quarter {quarter_num}/4...", file=sys.stderr)

        start_index = 0
        results_per_page = 2000  # Max allowed

        while True:
            params = {
                'pubStartDate': start_date,
                'pubEndDate': end_date,
                'resultsPerPage': results_per_page,
                'startIndex': start_index
            }

            try:
                response = session.get(base_url, params=params, headers=headers, timeout=30)
                response.raise_for_status()
                data = response.json()

                vulnerabilities = data.get('vulnerabilities', [])
                if not vulnerabilities:
                    break

                all_vulnerabilities.extend(vulnerabilities)

                total_results = data.get('totalResults', 0)
                print(f"    Fetched {len(vulnerabilities)} CVEs (total: {len(all_vulnerabilities)})...", file=sys.stderr)

                # Check if we've got all results for this quarter
                results_fetched = start_index + len(vulnerabilities)
                if results_fetched >= total_results:
                    break

                start_index += results_per_page

                # Rate limiting: with API key = 50 requests per 30 seconds
                # To be safe, wait 0.7 seconds between requests (allows ~43 requests per 30s)
                if api_key:
                    time.sleep(0.7)
                else:
                    # Without API key = 5 requests per 30 seconds
                    time.sleep(6)

            except requests.exceptions.RequestException as e:
                print(f"    Error fetching data for {year} Q{quarter_num} at index {start_index}: {e}", file=sys.stderr)
                break

        # Small delay between quarters
        if api_key:
            time.sleep(0.5)
        else:
            time.sleep(2)

    print(f"  Total CVEs fetched for {year}: {len(all_vulnerabilities)}", file=sys.stderr)
    return all_vulnerabilities

def calculate_enrichment_delay_accurate(cve_item, api_key=None):
    """
    Calculate accurate enrichment delay using CVE History API.

    IMPORTANT: Filters out CVEs enriched on day 0 (CNA-provided CVSS),
    only measuring true NVD enrichment delays.

    Returns delay in days, or None if data is missing or was CNA-enriched.
    """
    try:
        cve_id = cve_item.get('id')
        published = cve_item.get('published')

        # Check if CVSS scores exist
        # NVD API 2.0 uses: cvssMetricV2, cvssMetricV30, cvssMetricV31, cvssMetricV40
        metrics = cve_item.get('metrics', {})
        has_cvss = any(metrics.get(f'cvssMetricV{v}') for v in ['2', '30', '31', '40'])

        if not has_cvss or not published or not cve_id:
            return None

        # Fetch when CVSS was first added from history API
        enrichment_date = fetch_cve_history(cve_id, api_key)

        if not enrichment_date:
            return None

        # Parse dates
        pub_date = datetime.fromisoformat(published.replace('Z', '+00:00'))
        enrich_date = datetime.fromisoformat(enrichment_date.replace('Z', '+00:00'))

        # Calculate delay in days
        delay = (enrich_date - pub_date).days

        # Sanity check
        if delay < 0:
            return None

        # FILTER: Skip CVEs enriched on day 0 (CNA-provided CVSS, not NVD enrichment)
        if delay == 0:
            return None

        return delay

    except (KeyError, ValueError, AttributeError):
        return None

def analyze_year(year, api_key=None, sample_size=None, seed=None):
    """
    Analyze enrichment delays for a specific year.

    WARNING: This makes one API call per CVE to fetch history, which is slow!
    Use sample_size to limit to a random sample for testing.
    Use seed for reproducible sampling.
    """
    cves = fetch_nvd_data(year, api_key)

    if not cves:
        print(f"No data available for {year}", file=sys.stderr)
        return None

    # Optionally sample for faster testing
    total_fetched = len(cves)
    if sample_size and len(cves) > sample_size:
        if seed is not None:
            # Combine seed with year for reproducible but distinct samples per year
            random.seed(seed + year)
        cves = random.sample(cves, sample_size)
        print(f"  Analyzing sample of {sample_size} CVEs (out of {total_fetched} total)...", file=sys.stderr)

    delays = []
    total_cves = len(cves)
    processed = 0

    print(f"  Analyzing enrichment history for {total_cves} CVEs...", file=sys.stderr)

    for vuln in cves:
        cve_item = vuln.get('cve', {})

        delay = calculate_enrichment_delay_accurate(cve_item, api_key)

        if delay is not None:
            delays.append(delay)

        processed += 1
        if processed % 100 == 0:
            print(f"    Processed {processed}/{total_cves} CVEs...", file=sys.stderr)

        # Rate limiting for history API calls
        if api_key:
            time.sleep(0.7)
        else:
            time.sleep(6)

    if not delays:
        print(f"No enrichment data found for {year}", file=sys.stderr)
        return None

    # Calculate statistics
    delays.sort()
    median = statistics.median(delays)
    percentile_90_idx = int((len(delays) - 1) * 0.9)
    percentile_90 = delays[percentile_90_idx]

    result = {
        'year': year,
        'total_cves': total_cves,
        'enriched_cves': len(delays),
        'enrichment_rate': f"{(len(delays)/total_cves*100):.1f}%",
        'median_delay_days': median,
        'percentile_90_days': percentile_90,
        'max_delay_days': max(delays),
        'min_delay_days': min(delays)
    }

    return result

def parse_args():
    """Parse command line arguments."""
    parser = argparse.ArgumentParser(
        description='Analyze NVD enrichment delays using the CVE History API.',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  %(prog)s                           # Sample 1000 CVEs (default)
  %(prog)s -n 500                    # Sample 500 CVEs per year
  %(prog)s --api-key KEY -n 1000     # With API key + sample size
  %(prog)s --seed 42                 # Reproducible sampling
  %(prog)s --years 2023 2024         # Analyze specific years only
        '''
    )
    parser.add_argument(
        '-k', '--api-key',
        default=os.environ.get('NVD_API_KEY'),
        help='NVD API key (default: $NVD_API_KEY environment variable)'
    )
    parser.add_argument(
        '-n', '--sample-size',
        type=int,
        default=1000,
        help='Number of CVEs to sample per year (default: 1000)'
    )
    parser.add_argument(
        '--seed',
        type=int,
        default=None,
        help='Random seed for reproducible sampling'
    )
    parser.add_argument(
        '--years',
        type=int,
        nargs='+',
        default=[2021, 2022, 2023, 2024, 2025, 2026],
        help='Years to analyze (default: 2021-2026)'
    )
    return parser.parse_args()


def main():
    """Main analysis function."""
    args = parse_args()

    api_key = args.api_key
    sample_size = args.sample_size
    seed = args.seed
    years = args.years

    if not api_key:
        print("WARNING: No API key provided. Analysis will be VERY slow due to rate limiting.", file=sys.stderr)
        print("Provide API key via:", file=sys.stderr)
        print("  - Environment variable: export NVD_API_KEY=your_key", file=sys.stderr)
        print("  - Command line argument: --api-key YOUR_KEY", file=sys.stderr)
        print()
    else:
        print(f"Using API key: {api_key[:8]}...", file=sys.stderr)

    print(f"Sampling mode: analyzing {sample_size} CVEs per year", file=sys.stderr)
    if seed is not None:
        print(f"Random seed: {seed} (reproducible sampling)", file=sys.stderr)
    print()
    print("NVD Enrichment Delay Analysis (Accurate Method)")
    print("=" * 60)
    print("This method uses CVE History API for accurate enrichment timestamps.")
    print("Note: Makes one history API call per CVE analyzed.")
    print("=" * 60)
    print()

    results = {}

    for year in years:
        result = analyze_year(year, api_key, sample_size=sample_size, seed=seed)
        if result:
            results[str(year)] = result
            print(f"\n{year} Analysis:")
            print(f"  Total CVEs: {result['total_cves']}")
            print(f"  Enriched CVEs: {result['enriched_cves']} ({result['enrichment_rate']})")
            print(f"  Median delay: {result['median_delay_days']} days")
            print(f"  90th percentile: {result['percentile_90_days']} days")
            print(f"  Range: {result['min_delay_days']}-{result['max_delay_days']} days")

    # Print summary table
    print("\n" + "=" * 60)
    print("SUMMARY TABLE")
    print("=" * 60)
    print()
    print("| Year | Median Enrichment Delay | 90th Percentile |")
    print("|------|------------------------|-----------------|")
    for year in years:
        year_key = str(year)
        if year_key in results:
            r = results[year_key]
            print(f"| {year} | {r['median_delay_days']} days | {r['percentile_90_days']} days |")
        else:
            print(f"| {year} | No data | No data |")

    # Save results to JSON file
    output_file = "nvd_enrichment_analysis_accurate.json"
    with open(output_file, 'w') as f:
        json.dump(results, f, indent=2)
    print(f"\n\nResults saved to: {output_file}")

if __name__ == '__main__':
    main()
