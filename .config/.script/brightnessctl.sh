#!/bin/bash

# Vérifier l'argument et ajuster la luminosité en conséquence
case "$1" in
    up)
        # Augmenter la luminosité de 10%
        brightnessctl set 5%+ > /dev/null 2>&1 
        ;;
    down)
        # Diminuer la luminosité de 10%
        brightnessctl set 5%-> /dev/null 2>&1 
        ;;
      *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac
