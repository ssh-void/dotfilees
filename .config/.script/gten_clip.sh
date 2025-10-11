#!/bin/bash

# Attendre un peu (certains lecteurs PDF mettent du temps à copier)
sleep 0.2

# Récupère le texte depuis le clipboard, sinon le primary
text=$(xclip -o -selection clipboard 2>/dev/null || xclip -o -selection primary 2>/dev/null)

# Nettoyage du texte : suppression des [trucs entre crochets] et des guillemets
text=$(echo "$text" | sed 's/\[[^]]*\]//g; s/"//g; /^\s*$/d')

# Si rien à lire, quitter
[ -z "$text" ] && exit 1

# Lecture audio avec gTTS et mpv
gtts-cli -l en --slow "$text" | mpv --no-config \
    --no-video \
    --af-add="volume=2" \
    --speed=1.5 \
    --ytdl-format=bestaudio \
    --user-agent="Mozilla/5.0 (X11; Linux x86_64; rv:143.0) Gecko/20100101 Firefox/143.0" \
    - > /dev/null 2>&1 &

