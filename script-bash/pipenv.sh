#!/usr/bin/env bash

cd ~ && python3 -m venv .env
source /home/${USER}/.env/bin/activate
pip install --upgrade pip
pip install --upgrade instaloader 
pip install -U --pre "yt-dlp[default]"
pip install --upgrade telethon
pip install --upgrade gTTS
ln -s $HOME/.env/bin/yt-dlp $HOME/.local/bin/
ln -s $HOME/.env/bin/instaloader $HOME/.local/bin/
