-- Pandoc Lua filter: rewrite image sources from .svg to the pre-converted .pdf.
--
-- build-pdf.sh converts every chapter SVG to PDF (rsvg-convert --zoom) before
-- invoking pandoc. Without this filter, pandoc re-converts the .svg itself by
-- calling rsvg-convert with no resolution hints, which rasterizes SVG filter
-- effects (drop shadows) at the file's nominal pixel size (~100 dpi in print).
-- The pre-converted PDFs keep text vector and raster patches at ~300 dpi.

function Image(img)
  img.src = img.src:gsub("%.svg$", ".pdf")
  return img
end
