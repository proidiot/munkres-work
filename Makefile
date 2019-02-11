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
	latexmk -C main.latex

distclean: clean
	-if [ "x$(distcleanfiles)" != 'x' ]; then \
		rm -rf $(distcleanfiles); \
	fi
	-for f in $(recursive_distcleanfiles); do \
		find . -name "$$f" -delete; \
	done

%.pdf: %.latex *.latex */*.latex */*/*.latex */*/*/*.latex */*/*/*/*.latex
	latexmk -cd -pdf $<

