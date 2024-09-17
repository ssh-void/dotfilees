#!/bin/sh

INPUT=$1

if [ $(echo $DISPLAY) ]; then
    ffplay $INPUT
else
    mplayer -vo fbdev2 -vf scale=640:480 $INPUT
fi

