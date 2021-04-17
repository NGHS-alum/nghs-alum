#!/bin/sh -e

outputdir="$2"
baseFile=$1
[ -f "$baseFile" ]
target="$outputdir/$(basename "$baseFile")"
rm -f "$target"
cat "$(dirname "$baseFile")/header.html" >> "$target"
[ -e "$baseFile.pre" ] && cat "$baseFile.pre" >> "$target"
cat "$baseFile" >> "$target"
[ -e "$baseFile.post" ] && cat "$baseFile.post" >> "$target"
cat "$(dirname "$baseFile")/footer.html" >> "$target"

sed -i "s/\${title}/\u$(basename "$baseFile" .html)/g; s/\${sitetitle}/NGHS/g" "$target"
