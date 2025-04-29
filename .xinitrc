numlockx on &
xrdb -load $HOME/.config/X11/Xresources &
nvidia-settings -a OpenGLImageSettings=3 &
nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=1" &
nvidia-settings -a FSAAAppControlled=0 -a FSAA=4 &
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
#doas mount -a &
xsetroot -cursor_name left_ptr &
doas zramen toss && doas zramen -a zstd -s 75 make &
xrandr --output eDP1 --primary --mode 1920x1080 --rate 60 --rotate normal --brightness 1 &
xrandr --setprovideroutputsource NVIDIA-0 modesetting
xrandr --auto
xrandr --output eDP1 --set "PRIME Synchronization" 1
brightnessctl set 75% &
#xcompmgr -n &
while true; do picom --backend glx --glx-no-stencil --xrender-sync-fence --no-vsync --glx-no-rebind-pixmap --no-ewmh-fullscreen --no-use-damage --no-fading-openclose --no-fading-destroyed-argb ; done &
exec dbus-run-session dwm 
