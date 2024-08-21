#!/bin/bash
case "$1" in
    up)
        # Augmenter la luminosité de 10%
        brightnessctl set 5%+  &> /dev/null &
        ;;
    down)
        # Diminuer la luminosité de 10%
        brightnessctl set 5%- &> /dev/null &
        ;;
      *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac
