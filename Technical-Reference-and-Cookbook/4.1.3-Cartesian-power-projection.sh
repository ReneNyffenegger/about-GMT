
psxy -R0/100/0/10 -Jx1.5cp0.5/2.2c -Ba1p/a2f1WSne    -Wthick -P -K input/sqrt.d   >  /tmp/plot.ps
psxy -R           -J               -Sc0.2c     -Gred -W         -O input/sqrt.d10 >> /tmp/plot.ps

gv /tmp/plot.ps
