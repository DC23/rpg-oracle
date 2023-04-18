SHELL=/bin/sh
TEX_COMPILER=pdflatex
TEX_OPTIONS=--interaction=nonstopmode
TEX=$(TEX_COMPILER) $(TEX_OPTIONS)
TEX_FILES=$(wildcard *.tex)

A4_CMD=$(TEX) -jobname=gtsv_a4 "\documentclass[bg=full, 10pt, a4paper, twoside, twocolumn, openany, nodeprecatedcode]{dndbook} \input{gtsv}"
A4_PRINT_CMD=$(TEX) -jobname=gtsv_a4_print "\documentclass[bg=print, 10pt, a4paper, twoside, twocolumn, openany, nodeprecatedcode]{dndbook} \input{gtsv}"
LETTER_CMD=$(TEX) -jobname=gtsv_letter "\documentclass[bg=full, 10pt, letterpaper, twoside, twocolumn, openany, nodeprecatedcode]{dndbook} \input{gtsv}"
LETTER_PRINT_CMD=$(TEX) -jobname=gtsv_letter_print "\documentclass[bg=print, 10pt, letterpaper, twoside, twocolumn, openany, nodeprecatedcode]{dndbook} \input{gtsv}"

ESSENTIAL_A4_CMD=$(TEX) -jobname=gtsv_essential_tables_a4 "\documentclass[bg=full, 10pt, a4paper, twoside, twocolumn, openany, nodeprecatedcode]{dndbook} \input{gtsv_essential_tables}"
ESSENTIAL_A4_PRINT_CMD=$(TEX) -jobname=gtsv_essential_tables_a4_print "\documentclass[bg=print, 10pt, a4paper, twoside, twocolumn, openany, nodeprecatedcode]{dndbook} \input{gtsv_essential_tables}"
ESSENTIAL_LETTER_CMD=$(TEX) -jobname=gtsv_essential_tables_letter "\documentclass[bg=full, 10pt, letterpaper, twoside, twocolumn, openany, nodeprecatedcode]{dndbook} \input{gtsv_essential_tables}"
ESSENTIAL_LETTER_PRINT_CMD=$(TEX) -jobname=gtsv_essential_tables_letter_print "\documentclass[bg=print, 10pt, letterpaper, twoside, twocolumn, openany, nodeprecatedcode]{dndbook} \input{gtsv_essential_tables}"

.SILENT:
.IGNORE:

all:  a4 a4_print letter letter_print preview

a4: $(TEX_FILES)
	$(A4_CMD)
	$(A4_CMD)
	$(ESSENTIAL_A4_CMD)
	$(ESSENTIAL_A4_CMD)

a4_print: $(TEX_FILES)
	$(A4_PRINT_CMD)
	$(A4_PRINT_CMD)
	$(ESSENTIAL_A4_PRINT_CMD)
	$(ESSENTIAL_A4_PRINT_CMD)

letter: $(TEX_FILES)
	$(LETTER_CMD)
	$(LETTER_CMD)
	$(ESSENTIAL_LETTER_CMD)
	$(ESSENTIAL_LETTER_CMD)

letter_print: $(TEX_FILES)
	$(LETTER_PRINT_CMD)
	$(LETTER_PRINT_CMD)
	$(ESSENTIAL_LETTER_PRINT_CMD)
	$(ESSENTIAL_LETTER_PRINT_CMD)

preview: gtsv_a4.pdf
	pdftoppm -jpeg -rx 150 -ry 150 -f 1 -l 1 gtsv_a4.pdf preview
	mv preview-1.jpg preview.jpg

.PHONY: clean
clean:
	echo Cleaning ...
	rm -f *.gz *.aux *.log *.out *.bbl *.blg *.bak *.bcf *.xml *.toc
	echo ... done
