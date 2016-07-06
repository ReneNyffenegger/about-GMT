
X=5
Y=3
FONT_SIZE=30
FONT_NO=4
FONT_COLOR=red
ANGLE=45
# ? JUSTIFY=3

pstext -F+a$ANGLE+f$FONT_SIZE,$FONT_NO,$FONT_COLOR -R0/10/0/6 -JX10 -Ba2f1g2WS -P <<END > /tmp/pstext.ps
$X $Y Some text
END

gv /tmp/pstext.ps
