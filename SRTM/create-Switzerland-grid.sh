NC_DIR=~/Digitales-Backup/Development/datasets/GeoSpatial-etc/SRTM/NCs/

# Cut 45
grdcut $NC_DIR/n45_e005_1arc_v3.nc -G45_005.nc -R5:57/6/45:45/46
grdcut $NC_DIR/n45_e006_1arc_v3.nc -G45_006.nc -R6/7/45:45/46
grdcut $NC_DIR/n45_e007_1arc_v3.nc -G45_007.nc -R7/8/45:45/46
grdcut $NC_DIR/n45_e008_1arc_v3.nc -G45_008.nc -R8/9/45:45/46
grdcut $NC_DIR/n45_e009_1arc_v3.nc -G45_009.nc -R9/10/45:45/46
grdcut $NC_DIR/n45_e010_1arc_v3.nc -G45_010.nc -R10/10:30/45:45/46

# Cut/Copy 46
grdcut $NC_DIR/n46_e005_1arc_v3.nc -G46_005.nc -R5:57/6/46/47
cp     $NC_DIR/n46_e006_1arc_v3.nc   46_006.nc
cp     $NC_DIR/n46_e007_1arc_v3.nc   46_007.nc
cp     $NC_DIR/n46_e008_1arc_v3.nc   46_008.nc
cp     $NC_DIR/n46_e009_1arc_v3.nc   46_009.nc
grdcut $NC_DIR/n46_e010_1arc_v3.nc -G46_010.nc -R10/10:30/46/47

# Cut 47
grdcut $NC_DIR/n47_e005_1arc_v3.nc -G47_005.nc -R5:57/6/47/47:50
grdcut $NC_DIR/n47_e006_1arc_v3.nc -G47_006.nc -R6/7/47/47:50
grdcut $NC_DIR/n47_e007_1arc_v3.nc -G47_007.nc -R7/8/47/47:50
grdcut $NC_DIR/n47_e008_1arc_v3.nc -G47_008.nc -R8/9/47/47:50
grdcut $NC_DIR/n47_e009_1arc_v3.nc -G47_009.nc -R9/10/47/47:50
grdcut $NC_DIR/n47_e010_1arc_v3.nc -G47_010.nc -R10/10:30/47/47:50

# Merge 45
grdpaste 45_005.nc 45_006.nc -G45_5+6.nc
grdpaste 45_007.nc 45_008.nc -G45_7+8.nc
grdpaste 45_009.nc 45_010.nc -G45_9+10.nc

grdpaste 45_5+6.nc      45_7+8.nc  -G45_5+6+7+8.nc
grdpaste 45_5+6+7+8.nc  45_9+10.nc -G45_5+6+7+8+9+10.nc

# Merge 46
grdpaste 46_005.nc 46_006.nc -G46_5+6.nc
grdpaste 46_007.nc 46_008.nc -G46_7+8.nc
grdpaste 46_009.nc 46_010.nc -G46_9+10.nc

grdpaste 46_5+6.nc      46_7+8.nc  -G46_5+6+7+8.nc
grdpaste 46_5+6+7+8.nc  46_9+10.nc -G46_5+6+7+8+9+10.nc

# Merge 47
grdpaste 47_005.nc 47_006.nc -G47_5+6.nc
grdpaste 47_007.nc 47_008.nc -G47_7+8.nc
grdpaste 47_009.nc 47_010.nc -G47_9+10.nc

grdpaste 47_5+6.nc      47_7+8.nc  -G47_5+6+7+8.nc
grdpaste 47_5+6+7+8.nc  47_9+10.nc -G47_5+6+7+8+9+10.nc

# Merge 45+46+67 into output file Switzerland_1s.nc
grdpaste 45_5+6+7+8+9+10.nc    46_5+6+7+8+9+10.nc -G45+46_5+6+7+8+9+10.nc
grdpaste 45+46_5+6+7+8+9+10.nc 47_5+6+7+8+9+10.nc -GSwitzerland_1s.nc
