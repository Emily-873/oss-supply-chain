# Chapter 9: Ecosystem-Specific Supply Chains

## Summary

This chapter examines supply chain risks across specialized technology ecosystems that extend beyond traditional package managers. Each ecosystem presents unique attack surfaces shaped by its distribution models, permission structures, and execution contexts.

Mobile application supply chains introduce risks through platform-specific dependency managers (CocoaPods, Swift Package Manager, Gradle) and the opaque nature of third-party SDKs. The XcodeGhost attack demonstrated how compromising development tools can infect thousands of legitimate applications, while malicious advertising SDKs like Goldoson show how attackers piggyback on trusted apps to reach millions of users.

Browser extensions pose exceptional risks due to their broad permissions and automatic update mechanisms. Attackers acquire extensions through account compromise, purchase, or abandonment takeover, as seen with The Great Suspender and MEGA.nz incidents. Manifest V3 provides some mitigations by restricting remote code execution.

Content management systems, particularly WordPress, represent high-impact targets given their roughly 40% web market share. Plugin supply chain compromises like AccessPress can expose hundreds of thousands of websites. Automatic updates accelerate both legitimate patches and malicious code distribution.

Client-side JavaScript introduces real-time supply chain risks where compromises affect users instantly without site operator intervention. The Ledger Connect Kit attack stole over $600,000 in cryptocurrency within hours. Subresource Integrity and Content Security Policy offer partial protection but see limited adoption.

Serverless architectures create hidden dependencies through Lambda Layers, managed runtimes, and ephemeral execution environments that complicate forensics. Overly permissive IAM roles amplify the blast radius of any compromised dependency.

Infrastructure-as-Code tools like Terraform, Ansible, and Helm introduce supply chain risks at the infrastructure level. Modules and roles execute with elevated privileges during provisioning, making compromises particularly dangerous. Organizations must apply the same dependency vetting practices to IaC that they use for application packages.

## Sections

- 9.1 Mobile Application Supply Chains
- 9.2 Browser Extension Supply Chains
- 9.3 Content Management System Ecosystems
- 9.4 Client-Side JavaScript and CDN Supply Chains
- 9.5 Serverless and Function-as-a-Service Supply Chains
- 9.6 Infrastructure-as-Code Supply Chains
