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
  cd grdview
  ./create-hill-perspective-view.sh
)
(
  cd psconvert
  ./create-hill-perspective-png.sh
)
