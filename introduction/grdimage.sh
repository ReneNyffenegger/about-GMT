# https://www.soest.hawaii.edu/gmt/gmt/pdf/GMT_Tutorial.pdf
#
# Chapter 4.3 Color images

gzip -d -c /usr/share/doc/gmt/tutorial/us.nc.gz > /tmp/us.nc

makecpt -Crainbow -T1000/5000/500 -Z > /tmp/topo.cpt

grdimage /tmp/us.nc -JM6i -P -B2 -C/tmp/topo.cpt -V -K            > /tmp/topo.ps
psscale -D3i/8.5i/5i/0.25ih      -C/tmp/topo.cpt -I0.4 -B/:m: -O >> /tmp/topo.ps

gv /tmp/topo.ps
