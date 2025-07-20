#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input.md> <output.pdf>"
    exit 1
fi

# Check if eisvogel exists
if [ ! -e /usr/share/pandoc/data/templates/eisvogel.latex ]; then
    echo "Eisvogel template missing. Installing..."
    wget https://github.com/Wandmalfarbe/pandoc-latex-template/releases/latest/download/eisvogel.tar.gz
    tar -xvzf eisvogel.tar.gz
    sudo cp eisvogel.latex /usr/share/pandoc/data/templates/
fi

# Check xelatex
if ! command -v xelatex >/dev/null; then
    echo "xelatex is not installed. Please run:"
    echo "sudo apt install texlive-xetex"
    exit 1
fi

# Generate PDF
pandoc "$1" -o "$2" \
--from markdown+yaml_metadata_block+raw_html \
--template eisvogel \
--table-of-contents \
--toc-depth 6 \
--number-sections \
--top-level-division=chapter \
--highlight-style tango \
--pdf-engine=xelatex

if [ $? -eq 0 ]; then
    echo "PDF generated successfully: $2"
    evince "$2" &
else
    echo "Failed to generate PDF."
fi
