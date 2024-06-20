#/bin/sh

. $HOME/.wmvar 

TARGET=$1    # new image file
BITMAP="$HOME/.bitmap.xbm"    # path to current bitmap 
RES=$(xdpyinfo | awk '/dimensions/ {print $2}')    # screen resolution

if [ -n "$TARGET" ]; then    # if a new image is to be set
    if [ -f "$TARGET" ]; then    # if the provided name is a file
	convert $TARGET -negate -resize "!$RES" -layers Flatten $BITMAP    #  convert given image as bitmap 
	xsetroot -fg "#$ACTIVE" -bg "#$NEUTRAL" -bitmap $BITMAP  # bitmap to desktop
	
    fi

else
    xsetroot -fg "#$ACTIVE" -bg "#$NEUTRAL" -bitmap $BITMAP    # just bitmap to desktop
fi

