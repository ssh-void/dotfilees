#!/bin/bash

# Destination directory
output_dir="$HOME/Images"
mkdir -p "$output_dir"  # Create the directory if it doesn't exist

# File name with timestamp
filename="$output_dir/Friday_$(date '+%Y-%m-%d_%H-%M-%S').bmp"

# Define the region coordinates (x, y, width, height)
region="1077x617+0+651" # lci
#region="1069x731+10+656" # cnews
# Take a screenshot with scrot for a specific region
maim -f bmp -g "$region" "$filename" 

# Success notification
if [ -f "$filename" ]; then
    notify-send "Screenshot" "Screenshot saved"
else
    notify-send "Error" "Screenshot failed!"
fi
