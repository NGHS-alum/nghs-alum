
GEN := gen/alum.html gen/Internships.html gen/HS_Internships.html gen/Jobs.html
MARKDOWN := $(patsubst %.md,gen/markdown/%.html,$(wildcard *.md)) gen/markdown/index.html
all: html

html: $(GEN) $(MARKDOWN)
	mkdir -p html
	find gen -type f -name '*.html' | xargs -I{} ./html_gen.sh {} html
	cp *.css html/

gen/alum.html: alum.csv
	sed "s/,/<\/td><td>/g; s/.*/<tr><td>&<\/td><\/tr>/g" alum.csv > $@

gen/%.html: % | gen
	find $^ -type f | xargs -I{} ./script.sh {} > $@

gen/markdown/index.html: gen/markdown/README.html
	cp $^ $@

gen/markdown/%.html: %.md | gen/markdown
	smu -n <$^ | sed "s/\.(md|csv)/.html/g" > $@

gen:
	mkdir -p $@

gen/markdown:
	mkdir -p $@

clean:
	rm -rfd gen/*

.PHONY: html clean
