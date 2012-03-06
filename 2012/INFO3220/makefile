# Makefile for UniNotes
# To create pdf of notes from latex files

# Get subject from directory
INFO3220 = $(lastword $(subst /, , $(CURDIR)))

notes: $(INFO3220).tex
	pdflatex INFO3220
