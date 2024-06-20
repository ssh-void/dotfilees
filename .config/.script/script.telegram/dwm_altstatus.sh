#!/bin/bash

clear() {
    wrname_clear.sh &
    echo "$!" > /tmp/status.pid
}

date() {
    wrname_date.sh &
    echo "$!" > /tmp/status.pid
}

disk() {
    wrname_disk.sh &
    echo "$!" > /tmp/status.pid
}

mounted() {
    wrname_mounted.sh &
    echo "$!" > /tmp/status.pid
}

weather() {
    wrname_weather.sh &
    echo "$!" > /tmp/status.pid
}

mpd() {
    wrname_mpd.sh &
    echo "$!" > /tmp/status.pid
}

memory() {
    wrname_mem.sh &
    echo "$!" > /tmp/status.pid
}

system() {
    wrname_system.sh &
    echo "$!" > /tmp/status.pid
}


killstatus() {
    pid=`cat /tmp/status.pid`
    kill $pid
}
    

OPTIONS="clear\ndate\ndisk\nmounted\nweather\nmpd\nmemory\nsystem"
LAUNCHER="dmenu -i -p altstatus"

option=`echo -e $OPTIONS | $LAUNCHER | awk '{print $1}' | tr -d '\r\n'`
if [ ${#option} -gt 0 ]
then
    case $option in
	clear)
	    $(killstatus); $(clear)
            ;;
	date)
	    $(killstatus); $(date)
	    ;;
       	disk)
	    $(killstatus); $(disk)
	    ;;
	mounted)
	    $(killstatus); $(mounted)
	    ;;
	weather)
	    $(killstatus); $(weather)
	    ;;
        mpd)
	    $(killstatus); $(mpd)
	    ;;
        memory)
           $(killstatus); $(memory)
	    ;;
	system)
	    $(killstatus); $(system)
	    ;;
       	*)
	    ;;
    esac
fi

