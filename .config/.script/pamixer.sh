#!/usr/bin/env bash

case "$1" in
  up)
    # +5
    pamixer -u && pamixer --increase  5 &> /dev/null 
    ;;
  down)
    # -5
   pamixer -u && pamixer --decrease 5 &> /dev/null
    ;;
  toggle)
    # mute
    pamixer --toggle-mute &> /dev/null
    ;;
  *)
    echo "Usage: $0 {up|down|toggle}"
    exit 1
    ;;
esac
