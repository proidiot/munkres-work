cleanfiles =
distcleanfiles =
recursive_cleanfiles = *.aux *.fdb_latexmk *.fls *.log
recursive_distcleanfiles = *.dvi *.pdf

all: main.pdf

clean:
	-if [ "x$(cleanfiles)" != 'x' ]; then \
		rm -rf $(cleanfiles); \
	fi
	-for f in $(recursive_cleanfiles); do \
		find . -name "$$f" -delete; \
	done
	latexmk -C main.tex

distclean: clean
	-if [ "x$(distcleanfiles)" != 'x' ]; then \
		rm -rf $(distcleanfiles); \
	fi
	-for f in $(recursive_distcleanfiles); do \
		find . -name "$$f" -delete; \
	done

%.pdf: %.tex *.tex */*.tex */*/*.tex */*/*/*.tex */*/*/*/*.tex
	latexmk -cd -pdf $<

