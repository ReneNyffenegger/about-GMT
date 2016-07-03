# https://www.soest.hawaii.edu/gmt/gmt/pdf/GMT_Tutorial.pdf
#
# Chapter 2.2 Plotting text strings

cat << EOF | pstext -R0/7/0/8 -Jx1i -P -B1g1 -GDarkOrange > /tmp/map.ps
1 1 30 0 4 BL It's P@al, not Pal!
1 2 30 0 4 BL Try @%33%ZapfChancery@%% today
1 3 30 0 4 BL @~D@~g@-b@- = 2@~pr@~G@~D@~h.
1 4 30 0 4 BL University of Hawaii at M@!a\225noa
1 5 30 0 4 BL x@+2@++y@+2@+=z@+2@+
1 6 30 0 4 BL @a@c@e@h@i@n@o@s@u / @A@C@E@H@N@O@U
1 7 30 0 4 BL ené
EOF

gv /tmp/map.ps
