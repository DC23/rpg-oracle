SHELL=/bin/sh
TEX_COMPILER=pdflatex
TEX_OPTIONS=--interaction=nonstopmode

.SILENT:
.IGNORE:

all:  oracle_a4.pdf oracle_letter.pdf

%.pdf: %.tex oracle.tex
	$(TEX_COMPILER) $(TEX_OPTIONS) $<
	$(TEX_COMPILER) $(TEX_OPTIONS) $<

.PHONY: clean
clean:
	echo Cleaning ...
	rm -f *.gz *.aux *.log *.out *.bbl *.blg *.bak *.bcf *.xml *.toc
	echo ... done
