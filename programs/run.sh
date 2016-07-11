(
  cd grdmath
  ./create-hill.sh
)
(
  cd grdinfo
  ./info-hill.sh
)
(
  cd grdgradient
  ./create-hill-gradient.sh
)
( 
  cd grdcontour
  ./create-hill-contour_Cfile.sh
  ./create-hill-contour_C0.1.sh
)
(
  cd grd2cpt
  ./create-hill-globe-cpt.sh
)
(
  cd grdview
  ./create-hill-perspective-view.sh
)
(
   cd grdhisteq
   ./create-normalized-hill-gradient.sh
)
(
   cd grdimage
   ./create-hill-globe-image.sh
   ./create-hill-globe-gradient-image.sh

)
(
  cd psconvert
  ./create-hill-perspective-png.sh
)
