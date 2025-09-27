#!/bin/bash
# Récupère texte du presse-papier, nettoie et lit

text=$(xclip -o -selection primary | xclip -i -f -selection clipboard | sed 's/\[[^]]*\]//g; s/"//g')

torsocks gtts-cli -l en --slow "$text" | mpv --no-config \
    --no-video \
    --speed=1.5 \
    --af-add="volume=2" \
    --ytdl-format=bestaudio \
    --user-agent="Mozilla/5.0 (X11; Linux x86_64; rv:143.0) Gecko/20100101 Firefox/143.0" \
    - > /dev/null 2>&1
