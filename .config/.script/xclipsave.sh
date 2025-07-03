#!/bin/bash

# File where copied items will be stored
output_file=$(mktemp /tmp/xclipsave-XXXX.txt)

# Initialize the clipboard with an empty value
previous_clipboard=""

# Infinite loop to monitor the clipboard
while true; do
    # Get the current clipboard content
    current_clipboard=$(xclip -o -selection clipboard)
    # If the clipboard content has changed from the previous one
    if [[ "$current_clipboard" != "$previous_clipboard" && -n "$current_clipboard" ]]; then
        # Append the content to the file
        echo "$current_clipboard" >> "$output_file"
        # Update the previous clipboard variable
        previous_clipboard="$current_clipboard"
    fi
    # Wait 1 second before checking again
    sleep 1
done
