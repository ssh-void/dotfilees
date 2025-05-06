#!/usr/bin/env bash

case "$1" in
  up)
    amixer set Master 5%+ unmute > /dev/null
    ;;
  down)
    amixer set Master 5%- unmute > /dev/null
    ;;
  toggle)
    amixer set Master toggle > /dev/null
    ;;
  *)
    echo "Usage: $0 {up|down|toggle}"
    exit 1
    ;;
esac
