#!/usr/bin/env bash
sudo xbps-install -Syu python-pip
cd ~/.local/share/tools/ && python3 -m venv env
source /home/${USER}/.local/share/tools/env/bin/activate
sleep 1
pip install --upgrade pip
pip install --upgrade instaloader
pip install -U --pre "yt-dlp[default]"
pip install --upgrade telethon
pip install --upgrade gTTS
pip install git+https://github.com/openai/whisper.git
#pip install coqui-tts
#pip install gradio-client
ln -s /home/${USER}/.local/share/tools/env/bin/yt-dlp $HOME/.local/bin/
ln -s /home/${USER}/.local/share/tools/env/bin/instaloader $HOME/.local/bin/
ln -s /home/${USER}/.local/share/tools/env/bin/gtts-cli $HOME/.local/bin/
ln -s /home/${USER}/.local/share/tools/env/bin/whisper $HOME/.local/bin/
