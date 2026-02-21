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
echo "Build complete. Open build/index.html (or relevant .html) in browser."

