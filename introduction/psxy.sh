# https://www.soest.hawaii.edu/gmt/gmt/pdf/GMT_Tutorial.pdf
#
# Chapter 2.1.2 Excercises

cat  /usr/share/doc/gmt/tutorial/data
psxy /usr/share/doc/gmt/tutorial/data -R0/6/0/6 -JX6c/6c -P -B1 > /tmp/plot.ps
gv /tmp/plot.ps
