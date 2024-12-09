#!/bin/sh

## upload files and share with transfer.sh ##

TARGET=$1

# do the thing
if [ -n "$TARGET" ]; then
    filename=$($TARGET##*/)    # file name

    # upload file and save stdout to paste
    curl --upload-file "$TARGET" https://transfer.sh/"$filename" | xclip    

    # to paste somewhere else other than terminal 
    xclip -o | xclip -sel c
fi

