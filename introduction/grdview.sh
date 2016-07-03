# https://www.soest.hawaii.edu/gmt/gmt/pdf/GMT_Tutorial.pdf
#
# Chapter 4.5 Perspective views

gzip -d -c /usr/share/doc/gmt/tutorial/bermuda.nc.gz > /tmp/bermuda.nc

# 4.5.1 Create a mesh plot

grd2cpt /tmp/bermuda.nc -Cocean > /tmp/bermuda.cpt

grdview /tmp/bermuda.nc -JM5i -P -JZ2i -p135/30 -B2 -C/tmp/bermuda.cpt > /tmp/mesh-plot.ps

gv /tmp/mesh-plot.ps

# 4.5.2 Color coded view

gzip -d -c /usr/share/doc/gmt/tutorial/us.nc.gz > /tmp/us.nc

grdgradient /tmp/us.nc -Ne0.8 -A100 -fg -G/tmp/us_i.nc

grdview /tmp/us.nc -JM6i -p135/35 -Qi50 -I/tmp/us_i.nc -C/tmp/topo.cpt -V -B2 -JZ0.5i > /tmp/color-coded-plot.ps

gv /tmp/color-coded-plot.ps
