numlockx on &
xrdb -load $HOME/.config/X11/Xresources &
xrandr --setprovideroutputsource modesetting NVIDIA-0 & 
xrandr --auto &
xrandr --output eDP1 --set "PRIME Synchronization" 1 &
nvidia-settings --load-config-only &
xbanish -t 2 &
pipewire &
pipewire-pulse &
sxhkd & 
dunst &
slstatus &
xset -dpms &
xset s off &
xset +fp ~/.fonts &
xset s noblank &
xset fp rehash &
xset r rate 225 75 & 
xset mouse 5 1 &
# doas mount -a &
xsetroot -cursor_name left_ptr &
while true; do picom --backend glx --glx-no-stencil --vsync --use-damage && pkill -f picom &>/dev/null; sleep 0.2; done &
# doas zramen toss && doas zramen -a zstd -s 75 make &
exec dbus-run-session dwm 