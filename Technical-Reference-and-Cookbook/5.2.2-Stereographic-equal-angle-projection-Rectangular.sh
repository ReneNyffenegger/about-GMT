gmtset OBLIQUE_ANNOTATION 30  

pscoast -R-25/59/70/72r -JS10/90/11c -B30g10/5g5 -Dl -A250 -Glightgray -Wthinnest  > /tmp/map.ps

gv /tmp/map.ps

rm gmt.conf
