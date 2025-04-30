#!/usr/bin/env bash

x=$(xclip -o -selection primary)
BROWSER="firefox"
#BROWSER="brave-browser-stable"
$BROWSER "https://voidlinux.org/packages/?arch=x86_64&q=$x"
