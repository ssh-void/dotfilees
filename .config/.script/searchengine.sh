#!/usr/bin/env bash

x=$(xclip -o -selection primary)
#BROWSER="firefox"
#BROWSER="brave-browser-stable"
$BROWSER "https://duckduckgo.com/?q=$x&t=newext&atb=v484-6&ia=web"
$BROWSER "https://duckduckgo.com/?q=$x&t=newext&atb=v484-6&ia=web"

