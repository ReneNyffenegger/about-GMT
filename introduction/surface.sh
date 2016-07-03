# https://www.soest.hawaii.edu/gmt/gmt/pdf/GMT_Tutorial.pdf
#
# Chapter 3.2.3 Preprocessing

gzip -d -c /usr/share/doc/gmt/tutorial/ship.xyz.gz > /tmp/ship.xyz

blockmedian -R245/255/20/30 -I5m -V /tmp/ship.xyz > /tmp/ship_5m.xyz

surface /tmp/ship_5m.xyz -R245/255/20/30 -I5m -G/tmp/ship.nc -V

psmask -R245/255/20/30 -I5m /tmp/ship_5m.xyz -JM6i -B2 -P -K -V >  /tmp/map.ps
grdcontour /tmp/ship.nc -J -O -K -C250 -A1000                   >> /tmp/map.ps
psmask -C -O                                                    >> /tmp/map.ps

gv /tmp/map.ps
