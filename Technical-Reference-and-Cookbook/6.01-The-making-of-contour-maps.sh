# https://www.soest.hawaii.edu/gmt/gmt/html/GMT_Docs.html#x1-870006.1
#
# http://gmt.soest.hawaii.edu/projects/gmt/repository/entry/trunk/doc/examples/ex01/example_01.sh

if [ ! -f input/osu91a1f_16.nc ]; then
  svn export svn://gmtserver.soest.hawaii.edu/gmt5/trunk/doc/examples/ex01/osu91a1f_16.nc input/osu91a1f_16.nc
fi;

gmtset MAP_GRID_CROSS_SIZE_PRIMARY  0
gmtset FONT_ANNOT_PRIMARY          10p

# Draw a box around the (future) maps.
psbasemap -R0/6.5/0/7.5 -Jx1i -B0 -P -K > /tmp/plot.ps


# Twice the sequence pscoat, grdcontour, grdcontour
#
# The grdcontour uses the -L flag to limit what is ploted.
#   -L-1000/-1: plot negative values
#   -L1/1000  : plot positive values
#
# -T: cause tickmarks pointing in the downhill direction.

#   Centered on Greenwich
pscoast -Rg -JH0/6i -X0.25i -Y0.2i -O -K -Bg30 -Dc -Glightbrown -Slightblue >> /tmp/plot.ps
grdcontour input/osu91a1f_16.nc -J -C10 -A50+f7p -Gd4i -L-1000/-1 -Wcthinnest,- -Wathin,-  -O -K -T+d0.1i/0.02i >> /tmp/plot.ps
grdcontour input/osu91a1f_16.nc -J -C10 -A50+f7p -Gd4i -L-1/1000                           -O -K -T+d0.1i/0.02i >> /tmp/plot.ps

#   Centered on the dateline
pscoast -Rg -JH6i -Y3.4i -O -K -B+t"Low Order Geoid" -Bg30 -Dc -Glightbrown -Slightblue >> /tmp/plot.ps
grdcontour input/osu91a1f_16.nc -J -C10 -A50+f7p -Gd4i -L-1000/-1 -Wcthinnest,- -Wathin,-  -O -K -T+d0.1i/0.02i+l >> /tmp/plot.ps
grdcontour input/osu91a1f_16.nc -J -C10 -A50+f7p -Gd4i -L-1/1000                           -O    -T+d0.1i/0.02i+l >> /tmp/plot.ps

gv /tmp/plot.ps

rm -f gmt.conf
