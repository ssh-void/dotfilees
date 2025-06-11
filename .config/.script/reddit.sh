#!/usr/bin/env bash

x=$(xclip -o -selection primary)
#BROWSER="firefox"
#BROWSER="brave-browser-stable"
$BROWSER "https://www.reddit.com/search/?q=$x"
