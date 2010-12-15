DOC1 = cv
DOC2 = grades_b
DOC3 = grades_m
OUT  = jaroslavVazny

all: $(OUT).pdf

clean:
	-rm *.aux *.dvi *.log *.pdf *.ps *.bbl *.blg *.ind *.ilg *.idx *.out
vlna:
	vlna -r -l -v KkSsVvZzOoUuAaIi $(DOC1).tex
$(DOC1).pdf: $(DOC1).tex
	@echo -e "\n### Vytvarim PDF... ###"
	pdflatex $(DOC1).tex
	# optimalizace
	mv $(DOC1).pdf $(DOC1).in.pdf
	pdfopt $(DOC1).in.pdf $(DOC1).pdf
	rm $(DOC1).in.pdf

$(OUT).pdf: $(DOC1).pdf $(DOC2).pdf $(DOC3).pdf
	@echo -e "\n### Spojuji dokumenty... ###"
	pdftk $(DOC1).pdf $(DOC2).pdf $(DOC3).pdf cat output $(OUT).pdf
