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
while true; do picom --backend glx --glx-no-stencil --vsync --use-damage &>/dev/null; sleep 1; done &
doas zramen toss && doas zramen -a zstd -s 75 make &
xrandr --output eDP1 --primary --mode 1920x1080 --rate 60 --pos 1080x350 --rotate normal --brightness 1 &
brightnessctl set 74% &
exec dbus-run-session dwm 
