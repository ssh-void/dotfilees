numlockx on &
brightnessctl set 75%
st &
xrdb -load $HOME/.config/X11/Xresources &
#nvidia-settings --load-config-only &
picom --config /home/${USER}/.config/picom/picom.conf &
feh --bg-fill $HOME/.config/sh.png &
xbanish -t 2 &
pipewire &
pipewire-pulse &
sxhkd & 
dunst &
slstatus &
dbus-run-session dwm 
