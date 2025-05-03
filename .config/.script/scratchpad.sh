#!/usr/bin/env bash

winclass="$(xdotool search --classname scpad)" # i xdo xdotool
if [ -z "$winclass" ]; then
      st -f "Iosevka:size=14:weight=Regular" -g "122x33+295+49" -n "scpad" -e "tmux" &>/dev/null # xwininfo
else
    if [ ! -f /tmp/scpad ]; then
	touch /tmp/scpad && xdo hide "$winclass"
    elif [ -f /tmp/scpad ]; then
	rm /tmp/scpad && xdo show "$winclass"
    fi
fi
