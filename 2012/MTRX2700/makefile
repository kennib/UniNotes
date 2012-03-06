# Makefile for UniNotes
# To create pdf of notes from latex files

# Get subject from directory
MTRX2700 = $(lastword $(subst /, , $(CURDIR)))

notes: $(MTRX2700).tex
	pdflatex MTRX2700
