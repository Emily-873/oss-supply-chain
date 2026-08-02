# Software Supply Chain Security

This repository contains a three-book manuscript collection on **open source software supply chain security**. It is designed as a practical guide for developers, security teams, and technical leaders.

- **Book 1 (Ch. 1-10):** Understanding the Software Supply Chain
- **Book 2 (Ch. 11-22):** Protecting the Software Supply Chain
- **Book 3 (Ch. 23-33):** Governing the Software Supply Chain

## Read It

- Read online: [sscsecurity.dev](https://sscsecurity.dev)
- Download published PDFs: [GitHub Releases](https://github.com/scovetta/oss-supply-chain/releases)

## Repository Layout

```text
contents/
  book1/          # Chapters 1-10
  book2/          # Chapters 11-22
  book3/          # Chapters 23-33
  appendices/     # Shared appendices (A-J)
  frontmatter/    # Home, preamble, legal pages

scripts/
  build-all.sh      # Build all three books into dist/
  local-serve.sh    # Prepare docs/ for local Zensical preview
  zensical.toml     # Zensical site config
  package.json      # Mermaid/markdown tooling dependencies
```

Chapter content lives in `contents/book*/chapter-XX/` as `ch-X.Y.md` files.

## Build PDFs Locally

### Prerequisites

- `pandoc`
- XeLaTeX (`xelatex`)
- Image/PDF tooling used by scripts (`magick`, `pdfunite`, and optionally `rsvg-convert`)
- Python 3
- Node.js + npm (for `mermaid-filter`)

### Install script dependencies

```shell
cd scripts
npm ci
cd ..
```

### Build all books

```shell
./scripts/build-all.sh
```

### Build an individual book

```shell
./contents/book1/build-pdf.sh
./contents/book2/build-pdf.sh
./contents/book3/build-pdf.sh
```

`./scripts/build-all.sh` writes consolidated outputs to `dist/`.  
Individual `build-pdf.sh` scripts write each book PDF in their respective `contents/book*/` directory.

## Build PDFs with Docker

This repository includes a root `Dockerfile` and helper script `run_build_docker.sh` (no Compose file is currently used).

### Option 1: Helper script

```shell
./run_build_docker.sh
```

This script:

- builds image `oss-supply-chain-book:dev`
- runs the container with:
  - `-v "$(pwd):/data:ro"` (repository input)
  - `-v "$(pwd)/output:/output:rw"` (built PDFs copied here)

### Option 2: Equivalent manual commands

```shell
mkdir -p output
docker buildx build --load -t oss-supply-chain-book:dev .
docker run --rm -it -v "$(pwd):/data:ro" -v "$(pwd)/output:/output:rw" oss-supply-chain-book:dev
```

## Optional: Local docs preview with Zensical

```shell
pip install zensical==0.0.52
./scripts/local-serve.sh
cd scripts
zensical serve -f zensical.toml
```

## Contributing

Please see [CONTRIBUTING.md](CONTRIBUTING.md) for contribution workflow and quality standards.

## License

This work is licensed under the [MIT License](LICENSE).
