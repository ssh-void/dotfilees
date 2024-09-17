#!/bin/bash

pactl set-sink-volume @DEFAULT_SINK@ +40%
pactl set-sink-mute @DEFAULT_SINK@ toggle
