#!/bin/sh

## monitor battery status and do a few things ##

read -r STATUS < /sys/class/power_supply/BAT0/status     # battery status
read -r LEVEL < /sys/class/power_supply/BAT0/capacity    # battery level

# alarm function
alarm() {
    if [ -z "$(pgrep wms_bbthr.sh)" ]; then
	wms_batlarm.sh &
    fi
}

# hibernate function
hibernate() {
    doas pm-hibernate
}

# if status and level match send alarm 
if [ $STATUS = "Discharging" ] && [ $LEVEL -le "30" ]; then 
    alarm
fi

# if status and level match, hibernate
if [ $STATUS = "Discharging" ] &&  [ $LEVEL -le "20" ]; then
    hibernate
fi

    
    
