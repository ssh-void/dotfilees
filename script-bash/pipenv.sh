#!/usr/bin/env bash
doas xbps-install -Syu uv
mkdir -p /home/${USER}/.local/share/tools/
cd /home/${USER}/.local/share/tools/ && uv venv .env
cd /home/${USER}/.local/share/tools/ && source .env/bin/activate
uv pip install --upgrade instaloader
uv pip install --upgrade gallery-dl
uv pip install --upgrade --pre "yt-dlp[default]"
uv pip install --upgrade telethon
uv pip install --upgrade gTTS
uv pip install --upgrade autosub
uv pip install browser-cookie3
ln -s /home/${USER}/.local/share/tools/.env/bin/yt-dlp $HOME/.local/bin/
ln -s /home/${USER}/.local/share/tools/.env/bin/instaloader $HOME/.local/bin/
ln -s /home/${USER}/.local/share/tools/.env/bin/gtts-cli $HOME/.local/bin/
ln -s /home/${USER}/.local/share/tools/.env/bin/whisper $HOME/.local/bin/
ln -s /home/${USER}/.local/share/tools/.env/bin/gallery-dl $HOME/.local/bin/
