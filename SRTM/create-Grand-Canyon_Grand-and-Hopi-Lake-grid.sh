NC_DIR=~/Digitales-Backup/Development/datasets/GeoSpatial-etc/SRTM/NCs/
BIL_DIR=~/Digitales-Backup/Development/datasets/GeoSpatial-etc/SRTM/BIL-HDR/

GRID_SIZE=10s


  grdblend -R-115/-106/33/40 -I$GRID_SIZE ${BIL_DIR}n{33,34,35,36,37,38,39}_w{115,114,113,112,111,110,109,108,107}_1arc_v3.bil=gd -GGrand-Canyon-and-Hopi-Lake.nc
# grdblend -R-113/-110/35/37 -I$GRID_SIZE ${BIL_DIR}n{35,36}_w{113,112,111}_1arc_v3.bil=gd -GGrand-Canyon-and-Hopi-Lake.nc

exit 0

if [ ! -d "$NC_DIR" ]; then
  echo "NC directory $NC_DIR does not exist"
  exit -1
fi

for n in $(seq 33 39  ); do
for w in $(seq 107 115); do

  nc_file=n${n}_w${w}_1arc_v3.nc

  nc_file_with_path=${NC_DIR}/$nc_file

  if [ ! -f $nc_file_with_path ]; then
     echo "$nc_file_with_path does not exist"
     exit -1
  fi

  nc_file_down_sampled=n${n}_w${w}_$GRID_SIZE.nc

  if [ ! -e $nc_file_down_sampled ]; then
    echo "grdsample $nc_file_with_path -I$GRID_SIZE -G$nc_file_down_sampled"
          grdsample $nc_file_with_path -I$GRID_SIZE -G$nc_file_down_sampled
  fi

done;
done;


function paste() {
  in1_ns=$1
  in1_we=$2
  in2_ns=$3
  in2_we=$4

  in1=${in1_ns}_${in1_we}_$GRID_SIZE.nc
  in2=${in2_ns}_${in2_we}_$GRID_SIZE.nc

  if [ ! -f $in1 ]; then
     echo "Error in paste: $in1 does not exist"
     exit -1
  fi

  if [ ! -f $in2 ]; then
     echo "Error paste: $in2 does not exist"
     exit -1
  fi

  if      [ "$in1_ns" == "$in2_ns" ]; then

    out="${in1_ns}_${in1_we}+${in2_we}_$GRID_SIZE.nc"

  elif [ "$in1_we" == "$in2_we" ]; then

    out="${in1_ns}+${in2_ns}_${in1_we}_$GRID_SIZE.nc"
  else

    echo "in ns: $in1_ns $in2_ns"
    echo "in we: $in1_we $in2_we"
    exit -1

  fi

# Create new file if it doesn't alread eixt
  if [[ -f "$out" ]]; then
     echo "$out already exists"
  else

     echo "grdpaste $in1 $in2 -G$out"
           grdpaste $in1 $in2 -G$out
  fi

}

paste n33                          w115                                         n33                          w114
paste n34                          w115                                         n34                          w114

paste n33                          w113                                         n33                          w112
paste n34                          w113                                         n34                          w112

paste n33                          w111                                         n33                          w110
paste n34                          w111                                         n34                          w110

paste n33                          w109                                         n33                          w108
paste n34                          w109                                         n34                          w108

paste n35                          w115                                         n35                          w114
paste n36                          w115                                         n36                          w114

paste n35                          w113                                         n35                          w112
paste n36                          w113                                         n36                          w112

paste n35                          w111                                         n35                          w110
paste n36                          w111                                         n36                          w110

paste n35                          w109                                         n35                          w108
paste n36                          w109                                         n36                          w108

paste n37                          w115                                         n37                          w114
paste n38                          w115                                         n38                          w114

paste n37                          w113                                         n37                          w112
paste n38                          w113                                         n38                          w112

paste n37                          w111                                         n37                          w110
paste n38                          w111                                         n38                          w110

paste n37                          w109                                         n37                          w108
paste n38                          w109                                         n38                          w108

# ---

paste n33                          w115+w114                                    n34                          w115+w114
paste n35                          w115+w114                                    n36                          w115+w114
paste n37                          w115+w114                                    n38                          w115+w114

paste n33                          w113+w112                                    n34                          w113+w112
paste n35                          w113+w112                                    n36                          w113+w112
paste n37                          w113+w112                                    n38                          w113+w112

paste n33                          w111+w110                                    n34                          w111+w110
paste n35                          w111+w110                                    n36                          w111+w110
paste n37                          w111+w110                                    n38                          w111+w110

paste n33                          w109+w108                                    n34                          w109+w108
paste n35                          w109+w108                                    n36                          w109+w108
paste n37                          w109+w108                                    n38                          w109+w108

# ---

paste n33+n34                      w115+w114                                    n35+n36                      w115+w114
paste n33+n34                      w113+w112                                    n35+n36                      w113+w112
paste n33+n34                      w111+w110                                    n35+n36                      w111+w110
paste n33+n34                      w109+w108                                    n35+n36                      w109+w108

# ---

paste n33+n34+n35+n36              w115+w114                                    n37+n38                      w115+w114
paste n33+n34+n35+n36              w113+w112                                    n37+n38                      w113+w112
paste n33+n34+n35+n36              w111+w110                                    n37+n38                      w111+w110
paste n33+n34+n35+n36              w109+w108                                    n37+n38                      w109+w108

# ---

paste n33+n34+n35+n36+n37+n38      w115+w114                                    n33+n34+n35+n36+n37+n38      w113+w112
paste n33+n34+n35+n36+n37+n38      w111+w110                                    n33+n34+n35+n36+n37+n38      w109+w108

# ---

paste n33+n34+n35+n36+n37+n38      w115+w114+w113+w112                          n33+n34+n35+n36+n37+n38      w111+w110+w109+w108

# ---

  #  Top row

paste n39                          w115                                         n39                          w114
paste n39                          w113                                         n39                          w112

paste n39                          w115+w114                                    n39                          w113+w112

paste n39                          w111                                         n39                          w110
paste n39                          w109                                         n39                          w108

paste n39                          w111+w110                                    n39                          w109+w108

paste n39                          w115+w114+w113+w112                          n39                          w111+w110+w109+w108

paste n33+n34+n35+n36+n37+n38      w115+w114+w113+w112+w111+w110+w109+w108      n39                          w115+w114+w113+w112+w111+w110+w109+w108

# ---

  #  Eastern most row

paste n33                          w107                                         n34                          w107
paste n35                          w107                                         n36                          w107

paste n33+n34                      w107                                         n35+n36                      w107

paste n37 w107 n38 w107
paste n37+n38                      w107                                         n39                          w107

paste n33+n34+n35+n36              w107                                         n37+n38+n39                  w107

# ---

   # Final paste

paste n33+n34+n35+n36+n37+n38+n39  w115+w114+w113+w112+w111+w110+w109+w108      n33+n34+n35+n36+n37+n38+n39  w107

mv n33+n34+n35+n36+n37+n38+n39_w115+w114+w113+w112+w111+w110+w109+w108+w107_10s.nc Grand-Canyon_Grand-and-Hopi_lake_$GRID_SIZE.nc
