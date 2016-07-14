# Plot points on a line form (10,3) to (11.5,4)
perl -e 'for ($x=10; $x<=11.501; $x+=0.05) {printf "%f %f\n", $x, 3 + ($x-10.0)/1.5}' > track

# cat << F > track
# 10 3
# 11.5 4
# F

grdtrack track -G../grdmath/hill.nc | awk '{print ($1-10)/1.5 "   " $3}' > profile.d
