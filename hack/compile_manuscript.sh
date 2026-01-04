#!/bin/bash
set -euo pipefail

# Compiles Technically Mystic into a PDF

# TODO: Add front matter, TOC, etc.

cat README.md > manuscript.md
cat Level-0/*.md >> manuscript.md
cat Level-1/*.md >> manuscript.md  
cat Level-2/*.md >> manuscript.md
cat Level-3/*.md >> manuscript.md
cat Field-Notes/*.md >> manuscript.md

# Run through Pandoc
pandoc -f markdown manuscript.md -o TechnicallyMystic-v$(cat VERSION).pdf
