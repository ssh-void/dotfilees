#!/bin/sh

. $HOME/.config/wms/wms_var 

FLAG=$1
COLORS="
-menu-background-color 0x000000 \
-menu-foreground-color 0x$AC \
-scroll-bar-bar-color 0x$AC \
-scroll-bar-frame-color 0x$IC
"                                                                       # foreground / background menu colors
XB="links2 -g $COLORS"                                                  # browser
XTB="links2 -g $COLORS -socks-proxy 127.0.0.1:9050 -only-proxies 1"     # tor browser
TORSOCK="9050"

# torcheck (depends of nc)
torcheck() {
    if ! nc -z localhost $TORSOCK; then
    herbe "tor is NOT running" &
    exit 0
fi
}

usage() {
    echo "
xbrowser.sh [-d, -n ]
-d) default browser
-t) torsock browser"
}

case $FLAG in
    -d)    # default browser
	browser=$XB
	;;
    -t)    # torsock browser
	torcheck &&
	browser=$XTB
	;;
    *)
	usage
	exit 0
	;;
esac

INPUT=$(awk '{print $1}' < $HOME/.bookmarks | dmenu.sh)       # chose website
URL=$(cat ~/.bookmarks | grep ^$INPUT | cut -d ' ' -f 2)    # grep url's

if [ -n "$INPUT" ]; then    # if input exist grep url's
    if [ -n "$URL" ]; then    # if match url exist search it
	$browser $URL

    else    # if not match exist open the url or search the string
	echo "$INPUT" | grep -q "^https://" && $browser $INPUT \
		|| $browser "https://librex.revvy.de/search.php?q=$INPUT"
    fi

else    # if not input exitst just exit
    exit 0
fi

## .bookmarks example: ##
## website_1 https://website_1_example
## website_2 https://website_2_example
