gmtset MAP_FRAME_TYPE              FANCY
gmtset FORMAT_GEO_MAP              ddd:mm:ssF
gmtset MAP_GRID_CROSS_SIZE_PRIMARY 0.15c

pscoast -R-130/-70/24/52 -Jl-100/35/33/45/1:25000000 -B10g5 -Dl -N1/thick -N2/thinner -A500  -Glightgray -Wthinnest > /tmp/plot.ps
gv /tmp/plot.ps

rm gmt.conf
