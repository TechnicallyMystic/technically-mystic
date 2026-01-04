#!/bin/bash
set -euo pipefail

# Compiles Technically Mystic into a PDF

# Function to append file content + pagebreak
process_files() {
    for file in "$@"; do
        cat "$file"
        # Add newlines before/after to ensure markdown parses the latex command correctly
        printf "\n\n\\\newpage\n\n"
    done
}

# Create/Overwrite manuscript.md
# We pass the globs as arguments to the function
process_files README.md \
              Level-0/*.md \
              Level-1/*.md \
              Level-2/*.md \
              Level-3/*.md \
              Field-Notes/*.md > manuscript.md

# Run through Pandoc
pandoc -f markdown manuscript.md \
       -H hack/header.tex \
       -V geometry:margin=1.5in \
       -o TechnicallyMystic-v$(cat VERSION).pdf
