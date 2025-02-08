if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

[ -f $HOME/.bashrc ] && . $HOME/.bashrc
[ -f $XDG_CONFIG_HOME/X11/Xresources ] && xrdb -merge $XDG_CONFIG_HOME/X11/Xresources

# XDG_RUNTIME_DIR:
if [ -z "$XDG_RUNTIME_DIR" ]; then
	XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"
	mkdir -pm 0700 "$XDG_RUNTIME_DIR"
	export XDG_RUNTIME_DIR
fi

# ----------------------------------- #
# ----------->  Exports  <----------- #
# ----------------------------------- #

export PATH="$HOME/.local/bin:$PATH"
# XDG defaults
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
# UTF
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export USER=$(id -un)
export SHELL="bash"
export WGETRC="$HOME/.config/wget/wgetrc"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/config"
# QT5 Fix
export GDK_DPI_SCALE=1.02
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_PLATFORM_PLUGIN="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1
# TERMINAL
export TERMINAL="st"
export TERM="xterm-256color" # getting proper colors
export READER="zathura"
export HISTCONTROL=ignoreboth:erasedups # no duplicate entries
export INPUTRC="$HOME/.inputrc"
export FILE="Thunar"
export BROWSER="firefox"
export HISTORY_IGNORE="(ls|cd|aria2c|wget|pwd|exit|history|cd -|cd ..)"
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim +Man!" # manpages
export PAGER="most" 
export IMGVIEWER="sxiv"
export IMAGE="sxiv"
export WM_NAME="LG3D" # contourner certains bogues matlab
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
# xbps xtools
export XBPS_DISTDIR="/opt/void-packages"

echo "Xft.dpi: 102" | xrdb -merge

# startx 
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
