gmtset FORMAT_GEO_MAP ddd:mm:ssF
gmtset MAP_GRID_CROSS_SIZE_PRIMARY 0.05i  
pscoast -R-88/-70/18/24 -JD-79/21/19/23/25c -B5g1 -Di -N1/thick -Glightgray  -Wthinnest  > /tmp/plot.ps
gv /tmp/plot.ps

rm gmt.conf
