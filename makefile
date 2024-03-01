#===============================================================================
# File Name     : <makefile>
# Description   : GNU makefile
#-------------------------------------------------------------------------------
# Author        : Amit Manohar Manthanwar
# Mailer        : manthanwar@hotmail.com
# WebURL        : https://manthanwar.github.io
#-------------------------------------------------------------------------------
# Copyright     : ©2024 Amit Manohar Manthanwar
# License       : MIT
#===============================================================================
# GNU make also has -s, --silent, --quiet options to quieten globally
#===============================================================================
#---------------+---------+-----------------------------------------------------
# Revision Log  | Author  | Description
#---------------+---------+-----------------------------------------------------
# 27-Feb-2024   | AMM     | Initial Version
#---------------+---------+-----------------------------------------------------
#---------------+---------+-----------------------------------------------------
#---------------+---------+-----------------------------------------------------
#===============================================================================

file := main

all: clean dvi ps pdf run

dirpath := $(shell pwd)
dirname := $(shell basename ${dirpath})

TIMES = @date '+%s%3N' > $@_time
TIMEE = @read started < $@_time ; stopped=$$((`date '+%s%3N'`));\
python -c "print('time elapsed = ',\
'{:6.2f}'.format(($$((stopped))-$$((started)))/1000,2)\
,'s for $@')";\
rm $@_time

print:
	@echo ${dirpath}
	@echo ${dirname}

dvi: ${file}.tex
	mkdir -p TeXAux
	latex -time-statistics -output-directory=. -aux-directory=TeXAux -quiet -synctex=-1 -job-name=${file} ${file}.tex

biber: ${file}.bcf
	$(TIMES)
	@biber ${file} -quiet
	$(TIMEE)

ps: ${file}.dvi
	$(TIMES)
	@dvips -q ${file}.dvi -o ${file}.ps
	$(TIMEE)

pdf: ${file}.ps
	$(TIMES)
	@ps2pdf -dNOSAFER ${file}.ps ${file}.pdf
	@rm -f ${file}.ps ${file}.dvi
	$(TIMEE)

pdflatex: ${file}.tex
	@pdflatex ${file}.tex -synctex=-1 -quiet -time-statistics

latex: ${file}.tex
	$(TIMES)
	@latex -time-statistics -output-directory=. -quiet -synctex=-1 ${file}.tex
	$(TIMEE)

latex2pdf: ${file}.tex
	$(TIMES)
	@latex -time-statistics -output-directory=. -quiet -synctex=-1 ${file}.tex
	@latex -time-statistics -output-directory=. -quiet -synctex=-1 ${file}.tex
	@dvips -q ${file}.dvi -o ${file}.ps
	@ps2pdf -dNOSAFER ${file}.ps ${file}.pdf
	@rm -f ${file}.ps ${file}.dvi
	@sumatrapdf ${file}.pdf &
	$(TIMEE)

latexbibtex: ${file}.tex
	$(TIMES)
	rm -f ${file}.pdf
	@make clean
	latex -time-statistics -output-directory=. -quiet -synctex=-1 ${file}.tex
	bibtex ${file}
	latex -time-statistics -output-directory=. -quiet -synctex=-1 ${file}.tex
	dvips -q ${file}.dvi -o ${file}.ps
	ps2pdf -dNOSAFER ${file}.ps ${file}.pdf
	@make clean
	$(TIMEE)

latexbiber: ${file}.tex
	$(TIMES)
	@rm -f ${file}.pdf
	@make clean
	@latex -time-statistics -output-directory=. -quiet -synctex=-1 ${file}.tex
	@biber ${file}.bcf -q
	@latex -time-statistics -output-directory=. -quiet -synctex=-1 ${file}.tex
	@latex -time-statistics -output-directory=. -quiet -synctex=-1 ${file}.tex
	@dvips -q ${file}.dvi -o ${file}.ps
	@ps2pdf -dNOSAFER ${file}.ps ${file}.pdf
	@make clean
	$(TIMEE)


CLEANFILES = aux log out dvi ps synctex bbl blg brf bcf run.xml
clean:
	@for i in $(CLEANFILES); do \
		rm -f ${file}.$$i; \
    done
	@echo done clean latex
	

build: latexbiber run


run:
	@sumatrapdf ${file}.pdf &

