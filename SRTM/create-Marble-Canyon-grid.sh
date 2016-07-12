NC_DIR=~/Digitales-Backup/Development/datasets/GeoSpatial-etc/SRTM/NCs/

W=-112.3
S=35.95
E=-111.5

grdcut -R$W/-112/36/37      ${NC_DIR}n36_w113_1arc_v3.nc -G/tmp/MarbleCanyonTmp_1.nc
grdcut -R-112.0/$E/36/37    ${NC_DIR}n36_w112_1arc_v3.nc -G/tmp/MarbleCanyonTmp_2.nc
                           
grdcut -R$W/-112/$S/36      ${NC_DIR}n35_w113_1arc_v3.nc -G/tmp/MarbleCanyonTmp_3.nc
grdcut -R-112.0/$E/$S/36    ${NC_DIR}n35_w112_1arc_v3.nc -G/tmp/MarbleCanyonTmp_4.nc

grdpaste /tmp/MarbleCanyonTmp_1.nc /tmp/MarbleCanyonTmp_2.nc -G/tmp/MarbleCanyonTmp_5.nc
grdpaste /tmp/MarbleCanyonTmp_3.nc /tmp/MarbleCanyonTmp_4.nc -G/tmp/MarbleCanyonTmp_6.nc

grdpaste /tmp/MarbleCanyonTmp_5.nc /tmp/MarbleCanyonTmp_6.nc -GMarbleCanyon_1s.nc

grdimage MarbleCanyon_1s.nc > /tmp/x.ps
gv /tmp/x.ps
