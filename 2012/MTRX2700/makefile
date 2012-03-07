# Makefile for UniNotes
# To create pdf of notes from latex files

# Get subject from directory
SUBJECT = $(lastword $(subst /, , $(CURDIR)))

notes: $(SUBJECT).tex
	pdflatex SUBJECT
clean:
	rm *.aux *.log
