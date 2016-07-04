grdmath -R0/360/2/4 -I6/0.1 X 4 MUL PI MUL 180 DIV COS Y 2 POW MUL = /tmp/coords.nc  

file /tmp/coords.nc

grdcontour /tmp/coords.nc -JP18c -B30Ns -P -C2 -S4 --PLOT_DEGREE_FORMAT=+ddd > /tmp/plot.ps
gv /tmp/plot.ps

rm /tmp/coords.nc
