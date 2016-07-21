# -W 3: thickness, red color (alternatively: use #rrggbb notation.

psxy -JX17c -R10/12/2/4 -W3,red   ../grdtrack/track -O >> hill-globe-gradient-image.ps
gv hill-globe-gradient-image.ps
