#/bin/sh

. $HOME/.config/wms/wms_var

FLAG=$1                                         # flag
TARGET=$2                                       # image target
WALL="$HOME/.wall.png"                          # path to current wallpaper
BITMAP="$HOME/.bitmap.xbm"                      # path to current bitmap
RES=$(xdpyinfo | awk '/dimensions/ {print $2}') # screen resolution

# makes a bitmap of the given image and sets it as wallpaper
bitmap() {
	convert $TARGET -negate -resize "!$RES" $BITMAP
	xsetroot -fg "#$AC" -bg "#000000" -bitmap $BITMAP
}

# pixelate the given image and set it as wallpaper
pixel() {
	convert -scale 10% -scale 1000% $TARGET $WALL
	display -resize "!$RES" -window root $WALL
}

# copy the given image and set it as wallpaper
wall() {
	cp $TARGET $WALL
	display -resize "!$RES" -window root $WALL
}

# let's proceed with the given images
if [ -n "$TARGET" ]; then  # if a new image is to be set
	if [ -f "$TARGET" ]; then # if the provided name is a file
		case $FLAG in
		-b)
			bitmap
			;;
		-p)
			pixel
			;;
		-w)
			wall
			;;
		esac
	fi

else # if the name of an image is not passed as the second argument
	case $FLAG in
	-b)                                  # just wall.png to desktopk
		if [ -f "$HOME/.bitmap.xbm" ]; then # if .bitmap.xmb exist
			xsetroot -fg "#$AC" -bg "#000000" -bitmap $BITMAP
		fi
		;;
	-w)                                # just bitmap.xbm to desktop
		if [ -f "$HOME/.wall.png" ]; then # if .wall.png exist
			display -resize "!$RES" -window root $WALL
		fi
		;;
	esac
fi
