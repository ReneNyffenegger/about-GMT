gmtset FORMAT_GEO_MAP              ddd:mm:ssF
gmtset MAP_GRID_CROSS_SIZE_PRIMARY 0  

pscoast -R0/-40/60/-10r -JA30/-30/25c -B30g30/15g15 -Dl -A500 -Glightgray -Wthinnest  > /tmp/plot.ps

gv /tmp/plot.ps

rm gmt.conf
