# first command: only -K
pstext -K  -R0/10/0/6 -JX10 -Ba2f1g2WS -P <<END > /tmp/four_strings.ps
3 1 First string
END

# all commands except first and last: -K -O
pstext -K -O  -R0/10/0/6 -JX10 -Ba2f1g2WS -P <<END >> /tmp/four_strings.ps
3 5 Second string
END

pstext -K -O  -R0/10/0/6 -JX10 -Ba2f1g2WS -P <<END >> /tmp/four_strings.ps
6 1 Third string
END

# last command: -O
pstext -O  -R0/10/0/6 -JX10 -Ba2f1g2WS -P <<END >> /tmp/four_strings.ps
6 5 Fourth string
END

gv /tmp/four_strings.ps
