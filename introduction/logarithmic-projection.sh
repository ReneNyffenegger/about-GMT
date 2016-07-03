
X_FROM=1
X_TO=10000
Y_FROM=1e20
Y_TO=1e25

psbasemap -R$X_FROM/$X_TO/$Y_FROM/$Y_TO -JX18cl/12cl -B2:"Y Values":/a1pf3:"X Values":WS > /tmp/plot.ps
gv /tmp/plot.ps

# adding g3 to each side of the slash adds a grid
psbasemap -R$X_FROM/$X_TO/$Y_FROM/$Y_TO -JX18cl/12cl -B2:"Y Values":g3/g3a1pf3:"X Values":WS > /tmp/plot.ps
gv /tmp/plot.ps
