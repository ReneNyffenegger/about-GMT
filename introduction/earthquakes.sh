gzip -d -c /usr/share/doc/gmt/tutorial/quakes.ngdc.gz | awk '{ if (NR > 3) print $5, $4, $6, 0.02*$7}' - > /tmp/quakes.d

pscoast -R130/150/35/50 -JM6i -B5 -P -Ggray -Lf134/49/42.5/500 -K > map.ps
psxy    -R              -J    -O -C/usr/share/doc/gmt/tutorial/quakes.cpt /tmp/quakes.d -Sci -Wthinnest >> map.ps
gv map.ps
