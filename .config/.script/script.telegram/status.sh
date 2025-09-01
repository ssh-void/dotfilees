#!/bin/sh

## set modules ##

net() {
	lan_state="$(cat /sys/class/net/eth0//operstate)"
	wlan_state="$(cat /sys/class/net/w*/operstate)"
	ipaddr="$(ip addr show $INTERFACE | grep wlx0022438c5aa5 | grep inet | cut -c 10-20)"

	echo "Lan: $lan_state - Wifi: $wlan_state"
}

mail() {
	COUNT_1=$(ls ~/.mail/disroot/INBOX/new | wc -l)
	COUNT_2=$(ls ~/.mail/cock/INBOX/new | wc -l)

	echo "Mail: $COUNT_1 - $COUNT_2"
}

vol() {
	echo "Vol: $(amixer sget Master | awk -F "[][]" '/Playback/ {print $2}' | tr -d '\n')"
}

bat() {
	read -r STATUS </sys/class/power_supply/BAT0/status
	read -r LEVEL </sys/class/power_supply/BAT0/capacity

	if [ "$STATUS" = "Charging" ] || [ "$STATUS" = "Full" ]; then
		echo "Bat: $LEVEL% charge"

	else
		echo "Bat: $LEVEL% discharge"
	fi
}

mem() {
	memtotal=$(awk '/MemTotal/ {print $2/1024}' /proc/meminfo)
	memavailable=$(awk '/MemAvailable/ {print $2/1024}' /proc/meminfo)
	swaptotal=$(awk '/SwapTotal/ {print $2/1024}' /proc/meminfo)
	swapfree=$(awk '/SwapFree/ {print $2/1024}' /proc/meminfo)
	ram=$(echo "(($memtotal-$memavailable)*100)/$memtotal" | bc)
	swap=$(echo "(($swaptotal-$swapfree)*100)/$swaptotal" | bc)

	echo "Ram: $ram% - Swap: $swap%"
}

ytp() {
	podcast=$(ls ~/Descargas/ytdl | grep -v trash | wc -l)
	echo "Podcast: $podcast"
}

weather() {
	awk -F "=>" '{print $2}' /tmp/weather
}

## output ##
echo "  $(bat) |  $(net) |  $(mem) |  $(vol) |  $(mail) |  $(ytp) |"
