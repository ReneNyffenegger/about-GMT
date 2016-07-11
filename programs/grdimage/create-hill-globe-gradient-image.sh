grdimage ../grdmath/hill.nc -JX18c -I../grdhisteq/hill-gradient.norm -C../grd2cpt/hill-globe.cpt -B0.25 > hill-globe-gradient-image.ps
gv hill-globe-gradient-image.ps
