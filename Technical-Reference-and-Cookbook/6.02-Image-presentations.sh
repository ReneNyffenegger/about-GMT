# https://www.soest.hawaii.edu/gmt/gmt/html/GMT_Docs.html#x1-880006.2
#
# http://gmt.soest.hawaii.edu/projects/gmt/repository/entry/trunk/doc/examples/ex02/example_02.sh

if [ ! -f input/HI_geoid2.nc ]; then
  svn export svn://gmtserver.soest.hawaii.edu/gmt5/trunk/doc/examples/ex02/HI_geoid2.nc input/HI_geoid2.nc
fi;
if [ ! -f input/HI_topo2.nc ]; then
  svn export svn://gmtserver.soest.hawaii.edu/gmt5/trunk/doc/examples/ex02/HI_geoid2.nc input/HI_topo2.nc
fi;

gmtset FONT_TITLE         30
gmtset MAP_ANNOT_OBLIQUE   0  

makecpt -Crainbow -T-2/14/2 > /tmp/g.cpt  

grdimage input/HI_geoid2.nc -R160/20/220/30r -JOc190/25.5/292/69/4.5i -E50 -K -P  -B10 -C/tmp/g.cpt -X1.5i -Y1.25i > /tmp/plot.ps

psscale -C/tmp/g.cpt -DjRM+o0.6i/0+jLM+w2.88i/0.4i+mc+e -R -J -O -K -Bx2+lGEOID -By+lm >> /tmp/plot.ps

grd2cpt input/HI_topo2.nc -Crelief -Z > /tmp/t.cpt

grdgradient input/HI_topo2.nc -A0 -Nt -G/tmp/HI_topo2_int.nc

grdimage input/HI_topo2.nc -I/tmp/HI_topo2_int.nc -R -J -B+t"H@#awaiian@# T@#opo and @#G@#eoid@#"  -B10 -E50 -O -K -C/tmp/t.cpt -Y4.5i --MAP_TITLE_OFFSET=0.5i >> /tmp/plot.ps

psscale -C/tmp/t.cpt -DjRM+o0.6i/0+jLM+w2.88i/0.4i+mc -R -J -O -K -I0.3 -Bx2+lTOPO -By+lkm >> /tmp/plot.ps

pstext -R0/8.5/0/11 -Jx1i -F+f30p,Helvetica-Bold+jCB -O -N -Y-4.5i >> /tmp/plot.ps << END
-0.4 7.5 a)
-0.4 3.0 b)
END

gv /tmp/plot.ps

rm gmt.conf
# rm -f HI_topo2_int.nc ?.cpt gmt.conf
