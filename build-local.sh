#!/bin/bash
mkdir -p build/uploads build/logos
find . -name "*.adoc" -print0 | while IFS= read -r -d '' file; 
do
  out="build/${file%.adoc}.html"
  mkdir -p "$(dirname "$out")"
  asciidoctor \
    -a stylesheet="$PWD/stylesheets/readthedocs.css" \
    -d book \
    --base-dir "$PWD" \
    -o "$out" \
    "$file"
done
cp -rv uploads/* build/uploads 2>/dev/null || true
cp -rv logos/* build/logos 2>/dev/null || true
find . -type d -name "reference-data" -print0 | while IFS= read -r -d '' dir;
do
  target="build/${dir#./}"
  mkdir -p "$(dirname "$target")"
  cp -R "$dir" "$(dirname "$target")"
done
find . \( -path './build' -o -path './build/*' -o -path './.git' -o -path './.git/*' \) -prune -o   -type f \( -name '*.svg' -o -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' -o -name '*.gif' -o -name '*.webp' -o -name '*.pdf' \) -print0 | while IFS= read -r -d '' asset;
do
  target="build/${asset#./}"
  mkdir -p "$(dirname "$target")"
  cp "$asset" "$target"
done
echo "Build complete. Open build/index.html (or relevant .html) in browser."

