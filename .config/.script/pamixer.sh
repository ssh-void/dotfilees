#!/bin/bash 
case "$1" in
  up)
    # +5
    pamixer -u && pamixer --increase  5 > /dev/null 2>&1 
    ;;
  down)
    # -5
   pamixer -u && pamixer --decrease 5 > /dev/null 2>&1 
    ;;
  toggle)
    # mute
    pamixer --toggle-mute > /dev/null 2>&1 
    ;;
  *)
    echo "Usage: $0 {up|down|toggle}"
    exit 1
    ;;
esac
