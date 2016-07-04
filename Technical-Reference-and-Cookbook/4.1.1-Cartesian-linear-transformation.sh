# http://gmt.soest.hawaii.edu/projects/gmt/repository/entry/trunk/doc/scripts/GMT_linear.sh

# -Bag              : Plot both annotations and grid lines with same spacing.
# -BWSne            : Plot and annotate (W)est and (S)outh axes; annotate (n)orth and (s)outh axes.
# -B....+givory     : Paint color of interior of canvas
# -W                : Pen
# -S                : Plot symbols
#   t0.3c           :   symbols are: (t)riangles (0.3 cm)
# -N                : do NOT clip symbols that fall outside map border

psxy -R0/100/0/10 -JX3i/1.5i -Bag -BWS+givory -Wthick,blue,- -P -K input/sqrt.d   >  /tmp/GMT_linear.ps
psxy -R           -J         -St0.3c -N -Gred -Wfaint           -O input/sqrt.d10 >> /tmp/GMT_linear.ps

gv /tmp/GMT_linear.ps
