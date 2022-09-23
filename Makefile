SHELL=/bin/sh
TEX_COMPILER=pdflatex
TEX_OPTIONS=--interaction=nonstopmode
TEX=$(TEX_COMPILER) $(TEX_OPTIONS)

A4_CMD=$(TEX) -jobname=oracle_a4 "\documentclass[bg=full, 10pt, a4paper, twoside, twocolumn, openany, nodeprecatedcode]{dndbook} \input{oracle}"
A4_PRINT_CMD=$(TEX) -jobname=oracle_a4_print "\documentclass[bg=print, 10pt, a4paper, twoside, twocolumn, openany, nodeprecatedcode]{dndbook} \input{oracle}"
LETTER_CMD=$(TEX) -jobname=oracle_letter "\documentclass[bg=full, 10pt, letterpaper, twoside, twocolumn, openany, nodeprecatedcode]{dndbook} \input{oracle}"
LETTER_PRINT_CMD=$(TEX) -jobname=oracle_letter_print "\documentclass[bg=print, 10pt, letterpaper, twoside, twocolumn, openany, nodeprecatedcode]{dndbook} \input{oracle}"

.SILENT:
.IGNORE:

all:  a4 a4_print letter letter_print preview

a4: oracle.tex
	$(A4_CMD)
	$(A4_CMD)

a4_print: oracle.tex
	$(A4_PRINT_CMD)
	$(A4_PRINT_CMD)

letter: oracle.tex
	$(LETTER_CMD)
	$(LETTER_CMD)

letter_print: oracle.tex
	$(LETTER_PRINT_CMD)
	$(LETTER_PRINT_CMD)

preview: oracle_letter.pdf
	pdftoppm -jpeg -rx 80 -ry 80 -f 3 -l 3 oracle_letter.pdf preview
	mv preview-3.jpg preview.jpg

.PHONY: clean
clean:
	echo Cleaning ...
	rm -f *.gz *.aux *.log *.out *.bbl *.blg *.bak *.bcf *.xml *.toc
	echo ... done
