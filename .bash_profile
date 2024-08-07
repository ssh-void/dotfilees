[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# XDG_RUNTIME_DIR:
if [ -z "$XDG_RUNTIME_DIR" ]; then
	XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"
	mkdir -pm 0700 "$XDG_RUNTIME_DIR"
	export XDG_RUNTIME_DIR
fi

# Exports:
export PATH="$HOME/.local/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export TERMINAL="st"
export READER="zathura"
export VIDEO="vlc"
export TERM="xterm-256color" #getting proper colors
export HISTCONTROL=ignoredups:erasedups #no duplicate entries
export FILE="ranger"
export BROWSER="firefox"
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim +Man!" # manpages
export LANG="en_US.UTF-8"
export PAGER="most" # export PAGER="less"
export IMGVIEWER="sxiv"
export IMAGE="sxiv"
export WM_NAME="LG3D" # contourner certains bogues matlab

## No screensaver
xset -dpms # Disable DPMS
xset s off # Disable screensaver
xset s noblank # Disable screen blank
#xset r off # Disables key repeat
xset r rate 225 75 &

## xrandr
xrandr \
    --dpi 96 \
    --output HDMI1  --mode 1920x1080 --pos 0x1920 --rotate normal --rate 60 --brightness 1 \
    --mode 1920x1080 --pos 1417x0 --rotate right --rate 50 --brightness 0.8 \
    --output HDMI2 --off \
    --output DP1 --off \
    --output HDMI2 --off  \
    --output VIRTUAL1 --off
# startx 
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
