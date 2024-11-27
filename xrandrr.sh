#!/bin/sh
# Configure the primary display (eDP1)
xrandr --output eDP1 --primary --mode 1920x1080 --pos 1080x350 --rotate normal --brightness 1 

# Disable DP1
xrandr --output DP1 --off

# Configure HDMI1 with rotation to the right
xrandr --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate right --brightness 1  

# Disable HDMI2
xrandr --output HDMI2 --off

# Disable VIRTUAL1
xrandr --output VIRTUAL1 --off
