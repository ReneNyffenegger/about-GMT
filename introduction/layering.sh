# https://github.com/amoodie/gmt_repo/blob/master/scripting/scripting_eg.sh

WEST=-13
EAST=30
NORTH=73
SOUTH=34

pscoast -R$WEST/$EAST/$SOUTH/$NORTH -JM11c -Xc -Yc -B2 -V -Dh -A0/0/2 -Glightgrey -N2/0.2p -W0.1p -K  > /tmp/map.ps
pscoast -R$WEST/$EAST/$SOUTH/$NORTH -JM11c -Xc -Yc -V -Dh -Ir/0.3p,blue -K -O                        >> /tmp/map.ps
pscoast -R$WEST/$EAST/$SOUTH/$NORTH -JM11c -Xc -Yc -V -Dh -I1/0.8p,blue    -O                        >> /tmp/map.ps

gv /tmp/map.ps
