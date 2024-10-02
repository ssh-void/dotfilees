numlockx on &
brightnessctl set 75%
st &
xrdb -load $HOME/.config/X11/Xresources &
#nvidia-settings --load-config-only &
#picom --config /home/${USER}/.config/picom/picom.conf &
picom --backend glx --vsync --dbus &
feh --bg-fill $HOME/.config/sh.png &
xbanish -t 2 &
pipewire &
pipewire-pulse &
sxhkd & 
dunst &
slstatus &
xset -dpms # Disable DPMS
xset s off # Disable screensaver
xset s noblank # Disable screen blank
xset r rate 225 75 & # mouvment vitesse
dbus-run-session dwm 
