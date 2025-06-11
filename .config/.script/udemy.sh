#!/usr/bin/env bash

x=$(xclip -o -selection primary)
#BROWSER="firefox"
#BROWSER="brave-browser-stable"
$BROWSER "https://www.udemy.com/home/my-courses/learning/?q=$x"

