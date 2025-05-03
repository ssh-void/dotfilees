#!/usr/bin/env bash

winclass="$(xdotool search --classname scpad)" # i xdo xdotool
if [ -z "$winclass" ]; then
	st -f "Iosevka:size=14:weight=Regular" -g "100x30" -n "scpad" -e tmux &>/dev/null 
       # st -f "Iosevka:size=14:weight=Regular" -g "120x33" -n "scpad" -e tmux &>/dev/null 
       # st -f "Iosevka:size=16:weight=Regular" -g "150x40" -n "scpad" -e tmux &>/dev/null 
else
    if [ ! -f /tmp/scpad ]; then
	touch /tmp/scpad && xdo hide "$winclass"
    elif [ -f /tmp/scpad ]; then
	rm /tmp/scpad && xdo show "$winclass"
    fi
fi
