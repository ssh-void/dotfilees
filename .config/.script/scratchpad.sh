#!/usr/bin/env bash

#              st -f "Terminess Nerd Font Mono:style=Bold:pixelsize=22:antilias=true:autohint=true" -g "116x35+203+47" -n "scpad" -e "tmux" > /dev/null 2>&1 & # xwininfo
winclass="$(xdotool search --classname scpad)" # i xdo xdotool
if [ -z "$winclass" ]; then
	#             st -f "Iosevka:size=14:weight=Regular:pixelsize=22:antialias=true:autohint=true" -g "122x33+295+49" -n "scpad" -e "tmux" &>/dev/null  # i xwininfo
	st -f "Terminess Nerd Font Mono:style=Bold:pixelsize=24:antialias=true:autohint=true" -g "115x33+152+25" -n "scpad" -e "tmux" >/dev/null 2>&1 & # i xwininfo
else
	if [ ! -f /tmp/scpad ]; then
		touch /tmp/scpad && xdo hide "$winclass"
	elif [ -f /tmp/scpad ]; then
		rm /tmp/scpad && xdo show "$winclass"
	fi
fi
