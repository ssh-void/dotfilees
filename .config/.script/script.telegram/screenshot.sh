#!/bin/bash

OPTIONS="desktop\nwindow\nselection\nedit"
LAUNCHER="dmenu -i -x 280 -y 260 -z 700 -l 8 -p screenshot"

option=`echo -e $OPTIONS | $LAUNCHER | awk '{print $1}' | tr -d '\r\n'`
if [ ${#option} -gt 0 ]
then
    DATE=`date +%m-%d-%Y_%H:%M:%S`
    case $option in
      desktop)
        scrot -q 100
        ;;
      window)
        scrot -q 100 -u
        ;;
      selection)
        $(sh -c 'sleep 0.1' && scrot -q 100 -s)
        ;;
      edit)
      scrot -q 100 -e 'pinta $f'
      ;;
      quit)
	exit 0
	;;
      *)
        ;;
      esac
fi
