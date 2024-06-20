#!/bin/sh

## use the windows on the desktop as screensavers by moving them randomly

INPUT=$1                   # input
SW=$(xdpyinfo | grep "dimensions" | awk '{ print $2 }' | cut -d x -f1)    # screen width
SH=$(xdpyinfo | grep "dimensions" | awk '{ print $2 }' | cut -d x -f2)    # screen height
WW=$((SW * 40 / 100))      # windows width = 80% of the screen
WH=$((SH * 40 / 100))        # windows height = 80% of the screen
MAXX=$((SW - WW))          # max X coordinate
MAXY=$((SH - WH))          # max Y coordinate
FREQ=4                    # refresh frequency


xdotool windowresize $WW $WH

while true; do
    for wid in $(wmctrl -l | cut -d ' ' -f 1); do
	x=$(shuf -i 0-$MAXX -n 1)    # random x coordinate
	y=$(shuf -i 0-$MAXY -n 1)    # random y coordinate
	xdotool windowmove $x $y $wid
    done
    sleep $FREQ
done
