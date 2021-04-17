# Insert Title Here

## Build website
```
make
```

# Run
Use whatever webserver you want and point it to `html/` IE
```
darkhttpd html
```

## Job Directories
* HS_Internships - for any internships for incoming HS students (not graduation seniors).
* Internships    - internships for graduating HS seniors, undergraduate students and graduate students.
* Jobs           - Full time jobs
Inside each director should another directory with the company name. Inside their should be a file with the job title. The file can contain the following fields
* Field          - Field of study. Examples: CS, EE, ME
* Pay            - The approximate pay. Units $/hr, $/mo and $/yr for each category respectively and can be omitted. EG: 8000
* Location       - City, State of internship or remote
* Link           - Link to application or if not available contact info
* EXP            - Some experience required. For Internships means no freshmen/HS seniors. For full time jobs, non-entry level. Only add if relevant
* Notes          - MISC info
Assume living expensive will be covered out of state internships and a relocation bonus for regular jobs unless otherwise stated.

Full example
HS_Internships/CompanyA/JobA:
```
# Comments are ignored
Field: CS
# Leading white space before the value is fine.
Pay:   $10,000/mo
Location: Garland, TX
Link:  https://companya.com
```

## Contact Alumni
See alum.csv for a list of alum info. The format is Name, contact info, NGHS graduation year, Major, Interests, College

## FAQ
See [FAQ.md](FAQ.md)
