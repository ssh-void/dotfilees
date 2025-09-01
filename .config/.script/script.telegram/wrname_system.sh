#!/bin/bash

## set modules ##
timer() {
	dwm_timer.sh
}

updates() {
	dwm_updates.sh
}

mails() {
	dwm_mail.sh
}

keys() {
	dwm_keys.sh
}

memory() {
	dwm_memory.sh
}

youtube() {
	dwm_youtube.sh
}

network() {
	dwm_network.sh
}

bat() {
	dwm_bat.sh
}

vol() {
	dwm_vol.sh
}

weather() {
	dwm_weather.sh
}

date() {
	dwm_date.sh
}

## output ##
output() {
	echo " $(keys)$(memory)$(timer)$(youtube)$(mails)$(updates)┋$(network)$(bat)$(vol)┋$(weather)$(date)"
}

## rootwindow ##
while true; do
	xsetroot -name "$(output)"

	sleep 1

done
