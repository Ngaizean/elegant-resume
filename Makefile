MAIN ?= elegant-resume

.PHONY: all clean distclean

all:
	latexmk -xelatex $(MAIN).tex

clean:
	latexmk -c $(MAIN).tex

distclean:
	latexmk -C $(MAIN).tex
