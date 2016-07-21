grdimage ../grdmath/hill.nc -JX17c -I../grdhisteq/hill-gradient.norm -C../grd2cpt/hill-globe.cpt -B0.25    >         hill-globe-gradient-image.ps
grdimage ../grdmath/hill.nc -JX17c -I../grdhisteq/hill-gradient.norm -C../grd2cpt/hill-globe.cpt -B0.25 -K > ../psxy/hill-globe-gradient-image.ps

gv hill-globe-gradient-image.ps
