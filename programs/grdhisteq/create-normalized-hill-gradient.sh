grdhisteq ../grdgradient/hill-gradient.nc -N -Ghill-gradient.hist

grdinfo hill-gradient.hist
# -> z min/max = -3.611 .. 3.611

grdmath hill-gradient.hist 3.7 DIV = hill-gradient.norm
