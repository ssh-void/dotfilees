numlockx on &
brightnessctl set 75% &
xrdb -load $HOME/.config/X11/Xresources &
nvidia-settings --load-config-only &
xbanish -t 2 &
pipewire &
pipewire-pulse &
sxhkd & 
dunst &
slstatus &
xset -dpms &
xset s off &
xset s noblank &
xset r rate 225 75 & 
doas mount -a &
/usr/bin/syncthing serve --no-browser --logfile=default &
while true; do picom --backend glx --glx-no-stencil --vsync --use-damage &>/dev/null; sleep 1; done &
doas zramen toss && doas zramen -a zstd -s 75 make &
exec dbus-run-session dwm 
