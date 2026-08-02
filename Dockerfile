# syntax=docker/dockerfile:1
#
# Development build environment for the Software Supply Chain Security book
# series — a leaner image than the main Dockerfile: pandoc and all tooling
# come from the OS, and Node dependencies are expected in the mounted
# workspace (run `npm ci` in scripts/ on the host).
#
# Usage:
#   docker build -t oss-supply-chain-book:dev .
#   docker run --rm -it -v "$(pwd):/data:ro" -v "$(pwd)/output:/output:rw" oss-supply-chain-book:dev

FROM debian:forky

ENV DEBIAN_FRONTEND=noninteractive

# ---------------------------------------------------------------------------
# System packages (mirrors scripts/BUILDING)
# ---------------------------------------------------------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        unzip \
        # Build tools
        build-essential \
        libpng-dev \
        libfreetype6-dev \
        libjpeg-dev \
        pkg-config \
        libfontconfig1-dev \
        # Document conversion
        pandoc \
        # TeX engines and LaTeX packages used by custom_template.latex
        # (fontspec, tcolorbox, tabularray, beamerarticle, newunicodechar, ...)
        texlive-xetex \
        texlive-luatex \
        texlive-latex-recommended \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        # Image and PDF processing (magick, gs, rsvg-convert, pdfunite, inkscape)
        imagemagick \
        ghostscript \
        librsvg2-bin \
        poppler-utils \
        inkscape \
        # Fonts referenced by the template beyond Libertinus
        fontconfig \
        fonts-freefont-otf \
        fonts-noto-color-emoji \
        fonts-inconsolata \
        fonts-symbola \
        # Cover generator (build-all.sh invokes plain `python`)
        python3 \
        python-is-python3 \
        # Mermaid diagram rendering
        nodejs \
        npm \
        chromium \
        dos2unix \
    && rm -rf /var/lib/apt/lists/*

# ---------------------------------------------------------------------------
# Libertinus 7.051 fonts (template uses Libertinus Serif/Sans/Mono)
# ---------------------------------------------------------------------------
RUN curl -fsSL -o /tmp/libertinus.zip \
        https://github.com/alerque/libertinus/releases/download/v7.051/Libertinus-7.051.zip \
    && unzip -q /tmp/libertinus.zip -d /tmp/libertinus \
    && mkdir -p /usr/local/share/fonts/libertinus \
    && cp /tmp/libertinus/Libertinus-7.051/static/OTF/*.otf /usr/local/share/fonts/libertinus/ \
    && rm -rf /tmp/libertinus /tmp/libertinus.zip \
    && fc-cache -f \
    && luaotfload-tool --update --force || echo "warning: luaotfload cache update failed"

# Point mermaid-filter's Puppeteer at system Chromium (the workspace
# node_modules won't have a downloaded browser inside the container).
ENV PUPPETEER_SKIP_DOWNLOAD=true \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
COPY <<'EOF' /opt/puppeteer-config.json
{
  "executablePath": "/usr/bin/chromium",
  "args": ["--no-sandbox", "--disable-gpu", "--disable-dev-shm-usage"]
}
EOF
ENV MERMAID_FILTER_PUPPETEER_CONFIG=/opt/puppeteer-config.json

WORKDIR /work

COPY <<'EOF' /work/build.sh
#!/bin/bash
[ -d "/data" ] || { echo "Missing data directory, mount /data read only to repository root." >&2; exit 1; }
[ -d "/output" ] || { echo "Missing output directory, mount /output to capture results." >&2; exit 1; }
cp -R /data /work
cd /work/data/scripts
./build-all.sh
cp /work/data/dist/*.pdf /output
EOF

RUN dos2unix /work/build.sh && \
    chmod +x /work/build.sh

ENTRYPOINT ["/work/build.sh"]
CMD ["/work/build.sh"]
