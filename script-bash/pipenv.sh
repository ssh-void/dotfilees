#!/usr/bin/env bash
set -e  # Exit immediately if any command fails

TOOLS_DIR="$HOME/.local/share/tools"
VENV_DIR="$TOOLS_DIR/.env"

# Create the tools directory if it doesn't exist
mkdir -p "$TOOLS_DIR"

# Create a uv virtual environment if it doesn't already exist
if [ ! -d "$VENV_DIR" ]; then
    cd "$TOOLS_DIR"
    uv venv .env
fi

# Activate the virtual environment
source "$VENV_DIR/bin/activate"

echo "[*] Updating Python tools..."
pkgs=(
  instaloader
  gallery-dl
  "yt-dlp[default]"
  telethon
  gTTS
  streamlink
  browser-cookie3
  "git+https://github.com/openai/whisper.git"
)

# Upgrade each package inside the virtual environment
for pkg in "${pkgs[@]}"; do
  echo "→ $pkg"
  uv pip install --upgrade "$pkg"
done
echo "All Python packages are up to date."

echo "Setup complete. To activate the virtual environment, run:"
echo "source $VENV_DIR/bin/activate"

# Create symlinks for the main command-line tools
bins=(yt-dlp streamlink instaloader gtts-cli whisper gallery-dl)

for bin in "${bins[@]}"; do
    ln -sf "$HOME/.local/share/tools/.env/bin/$bin" "$HOME/.local/bin/"
done

# Reload user profile if necessary (to ensure $HOME/.local/bin is in PATH)
source "$HOME/.profile"

