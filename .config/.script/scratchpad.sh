#!/usr/bin/env bash

winclass="$(xdotool search --classname scpad)" # i xdo xdotool
if [ -z "$winclass" ]; then
#             st -f "Iosevka:size=14:weight=Regular:pixelsize=22:antialias=true:autohint=true" -g "122x33+295+49" -n "scpad" -e "tmux" &>/dev/null  # xwininfo
              st -f "Terminess Nerd Font Mono:style=Bold:pixelsize=22:antialias=true:autohint=true" -g "116x35+203+47" -n "scpad" -e "tmux" > /dev/null 2>&1 & # xwininfo
else
    if [ ! -f /tmp/scpad ]; then
	touch /tmp/scpad && xdo hide "$winclass"
    elif [ -f /tmp/scpad ]; then
	rm /tmp/scpad && xdo show "$winclass"
    fi
fi
