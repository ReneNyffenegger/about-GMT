gmtset MAP_GRID_CROSS_SIZE_PRIMARY 0  
pscoast -R110/140/20/35 -JB125/20/25/45/25c -B10g5 -Dl -Glightgray -Wthinnest -A250 > /tmp/plot.ps
gv /tmp/plot.ps

rm gmt.conf
