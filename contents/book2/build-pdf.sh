#!/bin/bash
#
# Build PDF for Book 2: Protecting the Open Source Supply Chain
#

INCLUDE_COVER=1
BOOK_DIR="$(cd "$(dirname "$0")" && pwd)"
OUTPUT_FILE="$BOOK_DIR/book-2-protecting-the-open-source-supply-chain.pdf"
COVER_IMAGE="$BOOK_DIR/cover.svg"

# Check for cover image
if [ ! -f "$COVER_IMAGE" ]; then
    echo "Warning: Cover image not found at $COVER_IMAGE"
    echo "PDF will be generated without cover. Add cover.svg to include it."
    COVER_OPTS=""
else
    COVER_OPTS="--metadata=cover-image:$COVER_IMAGE"
fi

echo "Building Book 2: Protecting the Open Source Supply Chain..."

# Convert all SVG images to PDF for better quality in LaTeX
OVERWRITE=1
echo "Converting SVG images to PDF..."
for svg_file in $(find "$BOOK_DIR/chapter-"* -name "*.svg" -type f); do
    pdf_file="${svg_file%.svg}.pdf"
    if [ "$OVERWRITE" -eq 1 ] || [ ! -f "$pdf_file" ] || [ "$svg_file" -nt "$pdf_file" ]; then
        echo "  Converting: $svg_file"
        # rsvg-convert with --zoom keeps text vector while rasterizing
        # filter effects (drop shadows) at ~300 dpi; fall back to magick.
        if command -v rsvg-convert &> /dev/null; then
            rsvg-convert -f pdf -z 3.125 "$svg_file" -o "$pdf_file" 2>/dev/null || \
                magick -density 300 -gravity center -background white -quality 100 "$svg_file" "$pdf_file" 2>/dev/null
        else
            magick -density 300 -gravity center -background white -quality 100 "$svg_file" "$pdf_file" 2>/dev/null
        fi
    fi
done
echo "SVG to PDF conversion complete."

# Collect all markdown files in order
FILES=(
    "$BOOK_DIR/index.md"
    "$BOOK_DIR/../frontmatter/preamble-author.md"
    "$BOOK_DIR/../frontmatter/preamble-legal.md"
    "$BOOK_DIR/chapter-11/index.md"
    "$BOOK_DIR/chapter-11/ch-11.1.md"
    "$BOOK_DIR/chapter-11/ch-11.2.md"
    "$BOOK_DIR/chapter-11/ch-11.3.md"
    "$BOOK_DIR/chapter-11/ch-11.4.md"
    "$BOOK_DIR/chapter-11/ch-11.5.md"
    "$BOOK_DIR/chapter-11/ch-11.6.md"
    "$BOOK_DIR/chapter-12/index.md"
    "$BOOK_DIR/chapter-12/ch-12.1.md"
    "$BOOK_DIR/chapter-12/ch-12.2.md"
    "$BOOK_DIR/chapter-12/ch-12.3.md"
    "$BOOK_DIR/chapter-12/ch-12.4.md"
    "$BOOK_DIR/chapter-12/ch-12.5.md"
    "$BOOK_DIR/chapter-12/ch-12.6.md"
    "$BOOK_DIR/chapter-13/index.md"
    "$BOOK_DIR/chapter-13/ch-13.1.md"
    "$BOOK_DIR/chapter-13/ch-13.2.md"
    "$BOOK_DIR/chapter-13/ch-13.3.md"
    "$BOOK_DIR/chapter-13/ch-13.4.md"
    "$BOOK_DIR/chapter-13/ch-13.5.md"
    "$BOOK_DIR/chapter-13/ch-13.6.md"
    "$BOOK_DIR/chapter-14/index.md"
    "$BOOK_DIR/chapter-14/ch-14.1.md"
    "$BOOK_DIR/chapter-14/ch-14.2.md"
    "$BOOK_DIR/chapter-14/ch-14.3.md"
    "$BOOK_DIR/chapter-14/ch-14.4.md"
    "$BOOK_DIR/chapter-14/ch-14.5.md"
    "$BOOK_DIR/chapter-14/ch-14.6.md"
    "$BOOK_DIR/chapter-15/index.md"
    "$BOOK_DIR/chapter-15/ch-15.1.md"
    "$BOOK_DIR/chapter-15/ch-15.2.md"
    "$BOOK_DIR/chapter-15/ch-15.3.md"
    "$BOOK_DIR/chapter-15/ch-15.4.md"
    "$BOOK_DIR/chapter-16/index.md"
    "$BOOK_DIR/chapter-16/ch-16.1.md"
    "$BOOK_DIR/chapter-16/ch-16.2.md"
    "$BOOK_DIR/chapter-16/ch-16.3.md"
    "$BOOK_DIR/chapter-16/ch-16.4.md"
    "$BOOK_DIR/chapter-16/ch-16.5.md"
    "$BOOK_DIR/chapter-17/index.md"
    "$BOOK_DIR/chapter-17/ch-17.1.md"
    "$BOOK_DIR/chapter-17/ch-17.2.md"
    "$BOOK_DIR/chapter-17/ch-17.3.md"
    "$BOOK_DIR/chapter-17/ch-17.4.md"
    "$BOOK_DIR/chapter-17/ch-17.5.md"
    "$BOOK_DIR/chapter-17/ch-17.6.md"
    "$BOOK_DIR/chapter-17/ch-17.7.md"
    "$BOOK_DIR/chapter-18/index.md"
    "$BOOK_DIR/chapter-18/ch-18.1.md"
    "$BOOK_DIR/chapter-18/ch-18.2.md"
    "$BOOK_DIR/chapter-18/ch-18.3.md"
    "$BOOK_DIR/chapter-18/ch-18.4.md"
    "$BOOK_DIR/chapter-19/index.md"
    "$BOOK_DIR/chapter-19/ch-19.1.md"
    "$BOOK_DIR/chapter-19/ch-19.2.md"
    "$BOOK_DIR/chapter-19/ch-19.3.md"
    "$BOOK_DIR/chapter-19/ch-19.4.md"
    "$BOOK_DIR/chapter-19/ch-19.5.md"
    "$BOOK_DIR/chapter-20/index.md"
    "$BOOK_DIR/chapter-20/ch-20.1.md"
    "$BOOK_DIR/chapter-20/ch-20.2.md"
    "$BOOK_DIR/chapter-20/ch-20.3.md"
    "$BOOK_DIR/chapter-20/ch-20.4.md"
    "$BOOK_DIR/chapter-20/ch-20.5.md"
    "$BOOK_DIR/chapter-21/index.md"
    "$BOOK_DIR/chapter-21/ch-21.1.md"
    "$BOOK_DIR/chapter-21/ch-21.2.md"
    "$BOOK_DIR/chapter-21/ch-21.3.md"
    "$BOOK_DIR/chapter-21/ch-21.4.md"
    "$BOOK_DIR/chapter-21/ch-21.5.md"
    "$BOOK_DIR/chapter-21/ch-21.6.md"
    "$BOOK_DIR/chapter-22/index.md"
    "$BOOK_DIR/chapter-22/ch-22.1.md"
    "$BOOK_DIR/chapter-22/ch-22.2.md"
    "$BOOK_DIR/chapter-22/ch-22.3.md"
    "$BOOK_DIR/chapter-22/ch-22.4.md"
    "$BOOK_DIR/../appendices/index.md"
    "$BOOK_DIR/../appendices/appendix-a.md"
    "$BOOK_DIR/../appendices/appendix-b.md"
    "$BOOK_DIR/../appendices/appendix-c.md"
    "$BOOK_DIR/../appendices/appendix-d.md"
    "$BOOK_DIR/../appendices/appendix-g.md"
    "$BOOK_DIR/../appendices/appendix-j.md"
)

# Filter to only existing files
EXISTING_FILES=()
for f in "${FILES[@]}"; do
    if [ -f "$f" ]; then
        EXISTING_FILES+=("$f")
    else
        echo "Warning: File not found: $f"
    fi
done

# We want this to be chapter-01:chapter-02:... for each chapter in the book
CHAPTERS=""
for dir in "$BOOK_DIR"/chapter-*; do
    if [ -d "$dir" ]; then
        if [ -z "$CHAPTERS" ]; then
            CHAPTERS="${dir##*/}"
        else
            CHAPTERS="$CHAPTERS:${dir##*/}"
        fi
    fi
done

# Build the PDF
MERMAID_FILTER="$BOOK_DIR/../../scripts/node_modules/.bin/mermaid-filter"
ADMONITION_FILTER="$BOOK_DIR/../../scripts/admonition-filter.lua"
SVG_PDF_FILTER="$BOOK_DIR/../../scripts/use-pdf-images.lua"

# Render mermaid diagrams at 3x resolution (default 800px is ~140 dpi in print)
export MERMAID_FILTER_SCALE=3
pandoc \
    --from=markdown \
    --to=pdf \
    -F "$MERMAID_FILTER" \
    --lua-filter="$ADMONITION_FILTER" \
    --lua-filter="$SVG_PDF_FILTER" \
    --pdf-engine=xelatex \
    --template=../../scripts/custom_template.latex \
    --toc \
    --toc-depth=2 \
    --top-level-division=chapter \
    --metadata=title:"Protecting the Open Source Supply Chain" \
    --metadata=subtitle:"Practical Security Defenses for the Modern Software Organization" \
    --metadata=author:"Michael V. Scovetta" \
    --metadata=keywords:"software supply chain, open source security, software security, supply chain attacks" \
    --metadata=date:"$(date +%Y)" \
    --metadata=language:"en-US" \
    --metadata=documentclass:book \
    --metadata=fontsize:10pt \
    --metadata=geometry:"paperwidth=7.5in,paperheight=9.25in,top=0.75in,bottom=0.75in,inner=1in,outer=0.75in" \
    --metadata=colorlinks:true \
    --metadata=linkcolor:black \
    --metadata=urlcolor:black \
    --metadata=toccolor:black \
    --resource-path="$CHAPTERS:$BOOK_DIR/../appendices" \
    $COVER_OPTS \
    --output="$OUTPUT_FILE" \
    "${EXISTING_FILES[@]}"

# Add cover image as first page if it exists
if [ -f "$COVER_IMAGE" ]; then
    magick \
        -size 4000x2250 \
        -background white \
        -gravity center \
        -units PixelsPerInch \
        -density 300 \
        "${COVER_IMAGE}" \
        book-2-cover.pdf
fi

# Front Image from the PNG
magick \
    -size 938x1088 \
    -background white \
    -gravity center \
    -units PixelsPerInch \
    -density 300 \
    "$BOOK_DIR/cover-front.png" \
    book-2-cover-front.pdf

if [ "$INCLUDE_COVER" -eq 1 ]; then
    pdfunite book-2-cover-front.pdf "$OUTPUT_FILE" temp_output.pdf
    mv temp_output.pdf "$OUTPUT_FILE"
fi

if [ $? -eq 0 ]; then
    echo "Successfully created: $OUTPUT_FILE"
else
    echo "Error: PDF generation failed"
    exit 1
fi
