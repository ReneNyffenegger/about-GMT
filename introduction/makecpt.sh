# https://www.soest.hawaii.edu/gmt/gmt/pdf/GMT_Tutorial.pdf
#
# Chapter 4.1 Cpt files

makecpt -Crainbow -T-20/60/10    > /tmp/disc.cpt
makecpt -Crainbow -T-20/60/10 -Z > /tmp/cont.cpt

psbasemap -R0/8.5/0/11 -Jx1i -P -B0  -K                              > /tmp/bar.ps
psscale -D3i/3i/4i/0.5ih -C/tmp/disc.cpt -B:discrete:         -O -K >> /tmp/bar.ps
psscale -D3i/5i/4i/0.5ih -C/tmp/cont.cpt -B:continuous:       -O -K >> /tmp/bar.ps
psscale -D3i/7i/4i/0.5ih -C/tmp/disc.cpt -B:discrete:   -I0.5 -O -K >> /tmp/bar.ps
psscale -D3i/9i/4i/0.5ih -C/tmp/cont.cpt -B:continuous: -I0.5 -O    >> /tmp/bar.ps

# TODO:
#  above commands print
#   psscale: ERROR: Bad interval in -B option (x-component, a-info): :discrete: gave interval = 0
#   and the like

gv /tmp/bar.ps
