winclass="$(xdotool search --classname scpad)" # i xdo xdotool
if [ -z "$winclass" ]; then
	st -f "Ubuntu Mono:size=15" -g "100x30" -n "scpad" &> /dev/null 	
else
    if [ ! -f /tmp/scpad ]; then
	touch /tmp/scpad && xdo hide "$winclass"
    elif [ -f /tmp/scpad ]; then
	rm /tmp/scpad && xdo show "$winclass"
    fi
fi
