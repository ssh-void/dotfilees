#!/bin/bash

in=$(cat .bookmarks | cut -d '-' -f 1 | dmenu -p web-marks:) # dmenu input
match=$(cat .bookmarks | grep $in | cut -d '-' -f 2)          # check match with ~/.bookmarks file

    if [ "$match" != "" ]; then
    surf -z 1.2 $match                                        # exec bookmark url

    else
    surf -z 1.2 "https://search.disroot.org/search?q=$in"       # search in searx

    fi
