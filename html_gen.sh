#!/bin/sh -e

baseFile="$1"
outputdir="$2"
[ -f "$baseFile" ]
srcFilePrefix="$(echo "$baseFile" | sed s/gen/src/)"
target="$outputdir/$(basename "$baseFile")"

cat "src/header.html" > "$target"
[ -e "$srcFilePrefix.pre" ] && cat "$srcFilePrefix.pre" >> "$target"
cat "$baseFile" >> "$target"
[ -e "$srcFilePrefix.post" ] && cat "$srcFilePrefix.post" >> "$target"
cat "src/footer.html" >> "$target"

sed -i "s/\${title}/\u$(basename "$baseFile" .html)/g; s/\${sitetitle}/NGHS/g; s/<a href=\"\(\w*\).md\">/<a href='\1.html'>/g" "$target"

