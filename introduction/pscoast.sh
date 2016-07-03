# http://andrewjmoodie.com/2015/01/brief-introduction-to-the-generic-mapping-tools/

WEST=-13
EAST=30
NORTH=73
SOUTH=34

RESOLUTION=l # f=full, h=high, i=intermediate, l=low, c=crude
COLOR_DRY_AREAS=chocolate
COLOR_WET_AREAS=blue

POLITICAL_BORDERS=-N1

PROJECTION=M # Mercator

DRAW_COASTLINES=  # -W 
RIVERS=0

pscoast -R$WEST/$EAST/$SOUTH/$NORTH -J${PROJECTION}11c $POLITICAL_BORDERS -Xc -Yc -B5 -D$RESOLUTION -A0/0/2 -G$COLOR_DRY_AREAS -S$COLOR_WET_AREAS $DRAW_COASTLINES -I$RIVERS > /tmp/map.ps
gv /tmp/map.ps

pscoast -R$WEST/$EAST/$SOUTH/$NORTH -J${PROJECTION}11c $POLITICAL_BORDERS -Xc -Yc -B5 -D$RESOLUTION -A0/0/2 -W0.25p            -S$COLOR_WET_AREAS $DRAW_COASTLINES -I$RIVERS > /tmp/map.ps
gv /tmp/map.ps
