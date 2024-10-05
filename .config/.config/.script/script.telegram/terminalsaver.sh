#!/bin/sh

GIF=$1                                    # path to gif
WID=$(pfw)                                # window id "wmutils"
GEO=$(wattr wh $(pfw) | sed 's/ /x/g')    # geometry "wmutils"

sxiv -ab -z 120 -g $GEO -e $WID $GIF


#### WID and GEO widh "xdotool" ####
# WID=$(xdotool getwindowfocus)
# GEO=$(xdotool getwindowfocus getwindowgeometry | awk -F " " '/Geometry/ {print $2}'
