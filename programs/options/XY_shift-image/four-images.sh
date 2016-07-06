# Note the values of -X and -Y are prepended with »a« so that the current location
# moves back to the origin after plotting the image.

pscoast                -JM9c -R0/360/-70/70 -Ba60f30/a30/f15 -Dc -G240 -W1/0  -K    >  /tmp/time-tag.ps
pscoast  -Xa14c        -JM9c -R0/360/-70/70 -Ba60f30/a30/f15 -Dc -G240 -W1/0  -K -O >> /tmp/time-tag.ps
pscoast         -Ya10c -JM9c -R0/360/-70/70 -Ba60f30/a30/f15 -Dc -G240 -W1/0  -K -O >> /tmp/time-tag.ps
pscoast  -Xa14c -Ya10c -JM9c -R0/360/-70/70 -Ba60f30/a30/f15 -Dc -G240 -W1/0     -O >> /tmp/time-tag.ps

gv /tmp/time-tag.ps
