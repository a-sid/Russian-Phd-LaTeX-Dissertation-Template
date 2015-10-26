#!/bin/bash

set -e

rm synopsis.{aux,bbl,blg,fb.*,pdf} || true

pdflatex synopsis.tex
bibtex synopsis
bibtex synopsis.fb
pdflatex synopsis.tex
pdflatex synopsis.tex
