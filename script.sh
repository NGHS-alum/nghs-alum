#!/bin/sh -e
[ "$1" = . ] && exit 1
printf "
<tr>
    <td>%s</td>
    <td>%s</td>
    <td>%s</td>
    <td><a href='%s'>Link</a></td>
    <td>%s</td>
    <td>%s</td>
    <td>%s</td>
    <td>%s</td>
</tr>
" "$(basename "$(dirname "$*")")" "$(basename "$*")" "$(grep ^Field "$*" | cut -d: -f2-)" "$(grep ^Link "$*" | cut -d: -f2-)" "$(grep ^Location "$*"| cut -d: -f2-)" "$(grep ^Pay "$*"| sed 's/[^0-9\.]*//g')" "$(grep -q ^EXP && echo 1 || echo 0)" "$(grep ^Notes "$*" | cut -d: -f2-)"

