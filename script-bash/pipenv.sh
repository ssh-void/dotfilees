#!/usr/bin/env bash
set -e  # Exit the script if any command fails

TOOLS_DIR="$HOME/.local/share/tools"
VENV_DIR="$TOOLS_DIR/.env"

# Create the tools directory
mkdir -p "$TOOLS_DIR"

# Create a uv virtual environment if it doesn't exist
if [ ! -d "$VENV_DIR" ]; then
    cd "$TOOLS_DIR"
    uv venv .env
fi

# Activate the virtual environment
source "$VENV_DIR/bin/activate"

# (Optional) Initialize a uv project to use uv tree
if [ ! -f "$TOOLS_DIR/pyproject.toml" ]; then
    uv init "$TOOLS_DIR"
fi

# Install or upgrade packages
uv pip install --upgrade instaloader
uv pip install --upgrade gallery-dl
uv pip install --upgrade --pre "yt-dlp[default]"
uv pip install --upgrade telethon
uv pip install --upgrade gTTS
uv pip install --upgrade autosub
uv pip install --upgrade browser-cookie3
uv pip install --upgrade git+https://github.com/openai/whisper.git

# Reload profile if needed
source "$HOME/.profile"

echo "Setup complete. Activate the virtual environment with: source $VENV_DIR/bin/activate"

ln -s /home/${USER}/.local/share/tools/.env/bin/yt-dlp $HOME/.local/bin/
ln -s /home/${USER}/.local/share/tools/.env/bin/instaloader $HOME/.local/bin/
ln -s /home/${USER}/.local/share/tools/.env/bin/gtts-cli $HOME/.local/bin/
ln -s /home/${USER}/.local/share/tools/.env/bin/whisper $HOME/.local/bin/
ln -s /home/${USER}/.local/share/tools/.env/bin/gallery-dl $HOME/.local/bin/
