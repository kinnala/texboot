default: compile
	@echo "Done."

build:
	@mkdir build

refs.bib:
	@echo "@article{example," > refs.bib
	@echo "    author = {Example, Ernest and Arbitrary, Annie}," >> refs.bib
	@echo "    journal = {Journal of Examples}," >> refs.bib
	@echo "    number = {5}," >> refs.bib
	@echo "    pages = {5--10}," >> refs.bib
	@echo "    volume = {10}," >> refs.bib
	@echo "    title = {{Presentation of an Example}}," >> refs.bib
	@echo "}" >> refs.bib

main.tex:
	@echo "\documentclass{scrartcl}" > main.tex
	@echo " " >> main.tex
	@echo "\usepackage{amsmath}" >> main.tex
	@echo "\usepackage{amssymb}" >> main.tex
	@echo "\usepackage{amsthm}" >> main.tex
	@echo "\usepackage[utf8]{inputenc}" >> main.tex
	@echo "\usepackage{graphicx}" >> main.tex
	@echo " " >> main.tex
	@echo "\\\title{Lorem ipsum}" >> main.tex
	@echo "\\\author{Annie Arbitrary, and Ernest Example}" >> main.tex
	@echo " " >> main.tex
	@echo "\\\begin{document}" >> main.tex
	@echo " " >> main.tex
	@echo "\maketitle" >> main.tex
	@echo " " >> main.tex
	@echo "\\\begin{abstract}" >> main.tex
	@echo "    Lorem ipsum dolor sit amet." >> main.tex
	@echo "\end{abstract}" >> main.tex
	@echo " " >> main.tex
	@echo "\section{Introduction}" >> main.tex
	@echo " " >> main.tex
	@echo "Lorem ipsum dolor sit amet. \\\cite{example}" >> main.tex
	@echo " " >> main.tex
	@echo "\\\bibliographystyle{unsrt}" >> main.tex
	@echo "\\\bibliography{refs}" >> main.tex
	@echo " " >> main.tex
	@echo "\end{document}" >> main.tex

compile: main.tex refs.bib build
	pdflatex -output-directory build main.tex
	bibtex build/main
	@pdflatex -output-directory build main.tex
	@pdflatex -output-directory build main.tex

clean:
	@rm build/*

delete: clean
	@rmdir build
	@rm main.tex
	@rm refs.bib
