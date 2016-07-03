# https://www.soest.hawaii.edu/gmt/gmt/pdf/GMT_Tutorial.pdf
#
# Chapter 3.2.1 Nearest neighbor gridding

gzip -d -c /usr/share/doc/gmt/tutorial/ship.xyz.gz > /tmp/ship.xyz

gmtinfo /tmp/ship.xyz
nearneighbor -R245/255/20/30 -I5m -S40k -G/tmp/ship.nc -V /tmp/ship.xyz

grdcontour /tmp/ship.nc -JM15c -P -B2 -C250 -A1000 > /tmp/plot.ps
gv /tmp/plot.ps
