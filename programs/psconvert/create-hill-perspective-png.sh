OUTPUT_FORMAT_PNG=g
psconvert ../grdview/hill-perspective.ps -W -T$OUTPUT_FORMAT_PNG -Fhill-perspective.png
xdg-open hill-perspective.png
