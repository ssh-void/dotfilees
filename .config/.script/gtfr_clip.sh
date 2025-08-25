#!/bin/bash
# Récupère texte du presse-papier, nettoie et lit
text=$(xclip -o | sed 's/\[[^]]*\]//g; s/"//g')

gtts-cli -l fr --slow "$text" | oniux mpv --no-config --no-video \
    --af-add="volume=2" \
    --term-osd-bar \
    --ytdl-format=bestaudio \
    --user-agent="Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0" \
    --input-conf=<(echo -e "UP add speed 0.1\nDOWN add speed -0.1") -

