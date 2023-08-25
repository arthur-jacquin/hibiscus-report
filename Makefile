OUTPUT_FILE = main
LATEX_COMPILATION_COMMAND = pdflatex -jobname="$(OUTPUT_FILE)" main.tex
BIBLIOGRAPHY_COMPILATION_COMMAND = biber $(OUTPUT_FILE)

fast-pdf:
	# it might be needed to run this twice to get correct references
	$(LATEX_COMPILATION_COMMAND)

.PHONY: fast-pdf

bib:
	$(LATEX_COMPILATION_COMMAND)
	$(BIBLIOGRAPHY_COMPILATION_COMMAND)
	$(LATEX_COMPILATION_COMMAND)
	$(LATEX_COMPILATION_COMMAND)

.PHONY: bib

clean:
	(while read -r FILES; do rm -rf $$FILES; done) < .gitignore

.PHONY: clean
