# The imagined view of northwest Europe from a Space Shuttle at 230 km looking to east.

pscoast -Rg -JG4/52/230/90/60/180/60/60/16c -B2g2/1g1 -Ia -Di -Glightgray -Wthinnest --MAP_ANNOT_MIN_SPACING=0.25i > /tmp/plot.ps

gv /tmp/plot.ps
