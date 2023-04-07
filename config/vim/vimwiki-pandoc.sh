#!/usr/bin/env bash

# overwrite an existing file
FORCE="$1"

# syntax chosen for the wiki
SYNTAX="$2"

# file extension for the wiki
EXTENSION="$3"

# full path of the output file
OUTPUT="$4$(basename "$5" .$3).html"

# full path of the wiki page
INPUT="$5"

# path of the css file for the wiki
CSSFILE="$(basename $6)"

# path of mathjax library
MATHJAX="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"

# Add HTML extension to link
sed -E 's/(\[.+\])\(([^#)]+)\)/\1(\2.html)/g' < "$INPUT" |

# Convert Markdown to HTML
pandoc --mathjax=$MATHJAX -s -f $SYNTAX -t html -c $CSSFILE --shift-heading-level-by=-1 -o $OUTPUT
