# TODO
echo '-4 128 5 128' > gray.cpt

INTERVALS_XY=0.5
INTERVALS_Z=1

Z_AXIS_SCALING=-JZ5c

# Perspective
#   0: N
#  ...
# 180: S
# 225: SW
LOOKING_FROM=189
LOOKING_ANGLE=25
PERSPECTIVE=-p$LOOKING_FROM/$LOOKING_ANGLE


#PLOTTYPES
# m: mesh
# s: surface  (s and m can be combined)
# i: image
# mx/my: waterfall plot
PLOTTYPE=s

# TODO?
# SMOOTH=-S

# TODO
# LEVEL=-N-1+gwhite


grdview ../grdmath/hill.nc -JX12c $Z_AXIS_SCALING -B$INTERVALS_XY -Bz$INTERVALS_Z -BSEwnZ $SMOOTH $LEVEL -Q$PLOTTYPE -I../grdgradient/hill-gradient.nc  -Cgray.cpt  $PERSPECTIVE > hill-perspective.ps

gv hill-perspective.ps
