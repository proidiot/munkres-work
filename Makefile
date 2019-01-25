cleanfiles =
distcleanfiles =
recursive_cleanfiles = *.aux *.fdb_latexmk *.fls *.log
recursive_distcleanfiles = *.dvi *.pdf

all: ch1/s1.pdf

clean:
	-if [ "x$(cleanfiles)" != 'x' ]; then \
		rm -rf $(cleanfiles); \
	fi
	-for f in $(recursive_cleanfiles); do \
		find . -name "$$f" -delete; \
	done

distclean: clean
	-if [ "x$(distcleanfiles)" != 'x' ]; then \
		rm -rf $(distcleanfiles); \
	fi
	-for f in $(recursive_distcleanfiles); do \
		find . -name "$$f" -delete; \
	done

%.pdf: %.latex
	latexmk -cd -pdf $<

