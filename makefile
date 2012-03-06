# Makefile for University Notes
# To Create a directory and default content for new subjects

# Default year
YEAR = 2012

# A template directory for new subjects
TEMPLATE_DIR = template
# Template subject name and year used in template directory files
TEMPLATE_SUBJECT = --SUBJECT--
TEMPLATE_YEAR = --YEAR--

subject: $(YEAR)
ifdef SUBJECT
	-mkdir $(YEAR)/$(SUBJECT)
	cp -r $(TEMPLATE_DIR)/* $(YEAR)/$(SUBJECT)/
	rename 's/$(TEMPLATE_DIR)/$(SUBJECT)/' $(YEAR)/$(SUBJECT)/*

	sed 's/$(TEMPLATE_SUBJECT)/$(SUBJECT)/' -i $(YEAR)/$(SUBJECT)/*
	sed 's/$(TEMPLATE_YEAR)/$(YEAR)/' -i $(YEAR)/$(SUBJECT)/*
else
	echo "Please define the SUBJECT variable"
endif
