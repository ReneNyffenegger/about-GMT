gmtset FORMAT_DATE_MAP          o
gmtset TIME_WEEK_START          Sunday
gmtset FORMAT_CLOCK_MAP         hh # also try: hham
gmtset FORMAT_TIME_PRIMARY_MAP  full  

# -B
#    K: ISO week day (starting with parameter TIME_WEEK_START, see gmtset above)
#    k: ?
#    H: Hour, format using parameter FORMAT_CLOCK_MAP (see gmtset above)
#    h: Hour, plot with 2 digits
psbasemap -R2001-9-24T/2001-09-29T/T06:59:59/T15:00:01 -JX15c/-8c -Ba1Kf1kg1d/a1Hg1hWsNe  > /tmp/plot.ps

gv /tmp/plot.ps

# remove file created by gmtset
rm gmt.conf
