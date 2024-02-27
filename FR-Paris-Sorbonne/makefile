#===============================================================================
# File Name     : <makefile>
# Description   : GNU makefile
#-------------------------------------------------------------------------------
# Author        : Amit Manohar Manthanwar
# Office        : Imperial College London
# Mailer        : amit@imperial.ac.uk
# Caller        : +44.207.594.6632
# Mobile        : +44.795.461.7111
# Mobile        : +44.853.081.3398
# WebURL        : www.imperial.ac.uk
# GitHub        : https://manthanwar.github.io/
#-------------------------------------------------------------------------------
# Copyright     : ©2023 Amit Manohar Manthanwar
# License       : Restricted, No-Copyleft, Business Confidential
#===============================================================================
# GNU make also has -s, --silent, --quiet options to quieten globally
#===============================================================================
#---------------+---------+-----------------------------------------------------
# Revision Log  | Author  | Description
#---------------+---------+-----------------------------------------------------
# 09-Jan-2024   | AMM     | Initial Version
#---------------+---------+-----------------------------------------------------
#---------------+---------+-----------------------------------------------------
#---------------+---------+-----------------------------------------------------
#===============================================================================

# file := europasscv-latex-template
file := europasscv-amit
file := cl-amit-sorbonne

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
	@echo -e '\uE0B0'

latex: ${file}.tex
	$(TIMES)
	@latex -time-statistics -output-directory=. -quiet -synctex=-1 ${file}.tex
	$(TIMEE)

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

etime:
	$(TIMES)
	@# @pdflatex ${file}.tex -synctex=-1 -quiet -time-statistics
	$(TIMEE)
	@rm $@_time
	@ls

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
	@make cleanall
	@start sumatrapdf ${file}.pdf &
	$(TIMEE)

latexbiber: ${file}.tex
	$(TIMES)
	@rm -f ${file}.pdf
	@make clean
	@latex -time-statistics -output-directory=. -quiet -synctex=-1 ${file}.tex
	@biber ${file} -q
	@latex -time-statistics -output-directory=. -quiet -synctex=-1 ${file}.tex
	@latex -time-statistics -output-directory=. -quiet -synctex=-1 ${file}.tex
	@dvips -q ${file}.dvi -o ${file}.ps
	@ps2pdf -dNOSAFER ${file}.ps ${file}.pdf
	@make clean
	@start sumatrapdf ${file}.pdf &
	$(TIMEE)

pdflatexbiber: ${file}.tex
	rm ${file}.pdf
	$(TIMES)
	@pdflatex ${file}.tex -synctex=-1 -quiet -time-statistics
	@biber ${file} -quiet
	@pdflatex ${file}.tex -synctex=-1 -quiet -time-statistics
	@rm ${file}.aux ${file}.bbl ${file}.bcf ${file}.blg \
	${file}.log ${file}.out ${file}.run.xml
	@code -r ${file}.pdf
	@ls
	@#@start sumatrapdf ${file}.pdf &
	$(TIMEE)

build:	dvi ps pdf

clean: clean-pdflatex
	@rm -f *.aux *.out *.log *.dvi *.ps *.fls *.fdb_latexmk *.gz *.tmp *.bak
	@echo Clean done
	@ls

clean-pdflatex:
	@rm -f *.aux *.bcf *.blg *.bbl *.log *.out *.xml
	# @echo Clean-pdflatex done

cleanall: clean clean-pdflatex
	@rm -rf TeXAux *.synctex
	@echo Cleanall done
	@ls

run:
	@start sumatrapdf ${file}.pdf &


# dodo:
# 	@make pdflatex
# 	@make biber
# 	@make pdflatex
# 	@make cleanall
# 	@make run
# 	@# code ${file}.pdf
# 	@# @ls

#  ETIMEN = @read timestarted < $@_timeNano ; \
# timestopped=$$((`date '+%s%3N'`));\
# timeelapsed=$$(($$timestopped - $$timestarted)) ;\
# echo "started  = " $$((timestarted));\
# echo "stopped  = " $$((timestopped));\
# echo "elapsed  = " $$((timeelapsed));\
# python -c "print('startedp =',$$((timestarted)))";\
# python -c "print('stoppedp =',$$((timestopped)))";\
# python -c "print('elapsedp =',($$((timestopped))-$$((timestarted)))/1000,'s')"
