# https://www.soest.hawaii.edu/gmt/gmt/pdf/GMT_Tutorial.pdf
#
# Chapter 3.1 Contouring gridded data sets

gzip -d -c /usr/share/doc/gmt/tutorial/bermuda.nc.gz > /tmp/bermuda.nc

# grdinfo /tmp/bermuda.nc

CONTOUR_INTERVAL=250               # meters
COUNTOUR_ANNOTATION_INTERVALL=1000 # meters
SMOOTHING=-S4
TICK_HIGH_AND_LOWS=-T
SKIP_SMALL_FEATURES=-Q10

grdcontour /tmp/bermuda.nc -JM15c -C$CONTOUR_INTERVAL -A$COUNTOUR_ANNOTATION_INTERVALL -P -B2 $SMOOTHING $TICK_HIGH_AND_LOWS $SKIP_SMALL_FEATURES > /tmp/map.ps
gv /tmp/map.ps
