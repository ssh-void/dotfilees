# .bash_profile
# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
[ ! -f $HOME/.config/mpd/pid ] && mpd
if [ -z "$XDG_RUNTIME_DIR" ]; then
	XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"

	mkdir -pm 0700 "$XDG_RUNTIME_DIR"
	export XDG_RUNTIME_DIR
fi

doas loadkeys .config/loadkeys/loadkeysrc 

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
