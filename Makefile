
GEN := src/contact.html src/Internships.html src/HS_Internships.html src/Jobs.html
all: html

html: $(GEN)
	mkdir -p html
	find src -type f -name '*.html' | xargs -I{} ./html_gen.sh {} html
	cp *.css html/

src/contact.html: alum.csv
	sed "s/,/<\/td><td>/g; s/.*/<tr><td>&<\/td><\/tr>/g" alum.csv > $@

src/%.html: %
	find $^ -type f | xargs -I{} ./script.sh {} > $@

clean:
	rm -f $(GEN)

.PHONY: html clean
