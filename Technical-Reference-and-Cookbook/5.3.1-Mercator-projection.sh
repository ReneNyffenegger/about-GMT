gmtset MAP_FRAME_TYPE fancy  

pscoast -R0/360/-70/70 -Jm7.0e-2c -Ba60f30/a30f15 -Dc -A5000 -Ggray > /tmp/plot.ps

gv /tmp/plot.ps
