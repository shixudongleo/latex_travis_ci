LATEXMK = latexmk
LATEXMKOPT = -pdf
PREVIEW = -pv
CONTINUOUS = -pvc

MAIN = main
TEXFILES := $(shell find *.tex -type f)
SOURCES = Makefile ${TEXFILES}
FIGURES := $(shell find figures/* images/* -type f)

all: ${MAIN}.pdf

${MAIN}.pdf: ${SOURCES} ${FIGURES}
	${LATEXMK} ${LATEXMKOPT} ${CONTINUOUS} ${MAIN}

once: ${SOURCES} ${FIGURES}
	${LATEXMK} ${LATEXMKOPT} ${PREVIEW} ${MAIN}

clean:
	${LATEXMK} -C ${MAIN}
	# rm -f ${MAIN}.pdfsync
	# rm -rf *~ *.tmp
	rm -f *.toc *.bbl *.blg *.aux *_aux *.nav *.snm  *.end *.fls *.log *.out *.fdb_latexmk *.synctex.gz *.tex.project.vim

.PHONY: clean once all
