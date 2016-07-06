
# Lowercase: specify scale.
#   Here: 0.07 cm per degree
#   Width in following image 360° * 0.07 cm/° = 25.20 cm
pscoast -Jm0.07c -R0/360/-70/70 -Ba60f30/a30/f15 -Dc -G240 -W1/0 > /tmp/Jm.ps
gv /tmp/Jm.ps

# Uppercase: specify map width
#   We use 25.20, so the resulting image should be equal in size
#   to the prior one.
pscoast -JM25.20c -R0/360/-70/70 -Ba60f30/a30/f15 -Dc -G240 -W1/0 > /tmp/JM.ps
gv /tmp/JM.ps
