#!/usr/bin/env bash

# Read each line from the file and append it to the array
values=$(cat "$HOME/.projects.txt")
# Prompt user to select a value using dmenu with styling options
selected_value=$(echo -e "${values[@]}" | dmenu -i -fn "Ubuntu Font:style=Medium:size=15" -nb "#333333" -nf "#ffffff" -sb "#c61169" -sf "#f9f102" -p "Open-Project:")
if [[ "$selected_value" == "add" ]]; then
    # Show dmenu and capture the selected option in the variable "result"
    result=$(echo "" | dmenu -i -fn "Ubuntu Font:style=Medium:size=15" -nb "#333333" -nf "#ffffff" -sb "#c61169" -sf "#f9f102" -p "Enter something:")
    tilda=$(echo "$result" | grep "~" | sed 's/~/\/home\/moatsem/g')
    if [ -z "$tilda" ]; then
        echo "$result" >>"$HOME/.projects.txt"
    else
        echo "$tilda" >>"$HOME/.projects.txt"
    fi
# Check if a value was selected
elif [[ $selected_value == "rm" ]]; then
    selected_value=$(echo -e "${values[@]}" | dmenu -i -fn "Ubuntu Font:style=Medium:size=15" -nb "#333333" -nf "#ffffff" -sb "#c61169" -sf "#f9f102" -p "select:")
    if [ -n "$selected_value" ]; then
        data=$(grep -v "$selected_value" ~/.projects.txt)
        echo "$data" >~/.projects.txt
    fi
elif [[ -n $selected_value ]]; then
     code-oss --disable-gpu --log off  2> /dev/null "$selected_value" &> /dev/null
fi
