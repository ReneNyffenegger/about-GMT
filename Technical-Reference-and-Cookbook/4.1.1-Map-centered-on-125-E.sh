

# Set paramters
#   MAP_GRID_CROSS_SIZE_PRIMARY:
#      Size of grid cross at lon-lat intersections. 
#
#   MAP_FRAME_TYPE:            
#
#   FORMAT_GEO_MAP:             
#      How to format geographical coordinates.
#        ddd - fixed format integer degrees
#        F   - use WESN suffix
gmtset MAP_GRID_CROSS_SIZE_PRIMARY 0.3c
gmtset MAP_FRAME_TYPE              FANCY
gmtset FORMAT_GEO_MAP              dddF

#
#  NOTE the g flag in the -R option. This is necessary for
#  the »wrap around«.
#
#  -A2000:      Don't plot features with a size smaller than 2000 km².
#  -Glightgray: Fill dry areas with light gray.
#  -Wthinnest:  Draw shorelines.
#  -Dc:         Use (c)rude resolution of data.
pscoast -Rd-55/305/-90/90 -Jx0.07c -B60g30f15/30g30f15WSen -Dc -A2000 -Glightgray -Wthinnest   > /tmp/plot.ps

gv /tmp/plot.ps

# remove file created by gmtset
rm gmt.conf
