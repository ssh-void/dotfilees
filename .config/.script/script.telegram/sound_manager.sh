#!/bin/bash

OPTIONS="-speaker\n-headphones\n-mute\n-unmute"

LAUNCHER="dmenu -i -p sound-manager"

SPEAKER="pacmd set-sink-port 0 analog-output-speaker"

HEADPHONES="pacmd set-sink-port 0 analog-output-headphones"

MUTE="pulsemixer --mute"

UNMUTE="pulsemixer --unmute"


option=`echo -e $OPTIONS | $LAUNCHER | awk '{print $1}' | tr -d '\r\n'`
if [ ${#option} -gt 0 ]
then
    case $option in
      -speaker)
      $SPEAKER
        ;;
     -headphones)
        $HEADPHONES
        ;;
     -mute)
	 $MUTE
	 ;;
     -unmute)
	 $UNMUTE
	 ;;
      *)
        ;;
    esac
fi

