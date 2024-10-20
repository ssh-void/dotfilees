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
while true; do picom --backend glx --vsync --dbus &>/dev/null; sleep 2; done &
doas zramen toss && doas zramen -s 8192 -m 8192 -a zstd make &
exec dbus-run-session dwm 
