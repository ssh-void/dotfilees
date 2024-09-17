#!/bin/sh

## alternating window border colors depending on battery charge ##

. $HOME/.config/wms/wms_var 

FREQ=0.5                  # freq
COLORS="aa0000 $FG"       # alternate colors

while :; do
    read -r STATUS < /sys/class/power_supply/BAT0/status     # battery status
    if [ $STATUS = "Discharging" ]; then    # if status discharging
	for c in $COLORS; do    # alternate border colors
	    chwb -c $c $(pfw)
	    sleep $FREQ
	done

    else    # if not
	chwb -c $FG $(pfw)    # default border colors
	break    # exit loop

    fi
done
    
