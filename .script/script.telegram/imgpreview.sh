#!/bin/sh

FLAG=$1                                                            # input flag
TLIST=$(find . -maxdepth 1 -type f | grep -E ".jpg|.png|.jpeg")    # target list
WID=$(pfw)                                                         # window id "wmutils"
GEO=$(wattr wh $(pfw) | sed 's/ /x/g')                             # geometry "wmutils"


usage() {
    echo "usage:
imgpreview.sh [ -c, -i, -s ]
-c) chafa preview
-i) imagemagick preview
-s) sxiv/nsxiv preview"
}

if [ -n "$TLIST" ]; then
    case $FLAG in
	-c)    # chafa preview
	    chafa --stretch -d 2 $TLIST
	    ;;
	-i)    # imagemagick preview
	    for f in $TLIST; do
		convert $f -geometry 400x400 sixel:-
		printf '%s\n' "$f"
	    done
	    ;;
	-s)    # sxiv/nsxiv preview
	    nsxiv -t -g $GEO -e $WID $TLIST
	    ;;
	*)
	    usage
	    ;;
    esac

else
    echo "no image files"

fi

#### WID and GEO widh "xdotool" ####
# WID=$(xdotool getwindowfocus)
# GEO=$(xdotool getwindowfocus getwindowgeometry | awk -F " " '/Geometry/ {print $2}'
