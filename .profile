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
export WGETRC="$HOME/.config/wget/wgetrc"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/config"
export GTK_THEME=Adwaita-dark:dark
# QT5 Fix
export GDK_DPI_SCALE=1.02
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_PLATFORM_PLUGIN="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1
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

echo "Xft.dpi: 102" | xrdb -merge
# startx 
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
