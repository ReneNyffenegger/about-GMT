psxy -R1/100/0/10 -Jx8cl/2.5c -B2g3/a2f1g2WSne -Wthick,- -K -P input/sqrt.d   >  /tmp/plot.ps
psxy -R           -J          -Sc0.3c  -Ggreen -W -O           input/sqrt.d10 >> /tmp/plot.ps

gv /tmp/plot.ps
