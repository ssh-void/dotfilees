numlockx on &
brightnessctl set 80%
st &
xrdb -load $HOME/.config/X11/Xresources &
nvidia-settings --load-config-only &
picom --backend glx --vsync --dbus &
feh --bg-fill $HOME/Images/sh.png &
xbanish &
pipewire &
pipewire-pulse &
sxhkd & 
dunst &
slstatus &
dbus-run-session dwm 
