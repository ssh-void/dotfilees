numlockx on &
brightnessctl set 75%
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
doas mount -a &
doas zramen toss && doas zramen -s 8192 -m 8192 -a zstd make &
dbus-run-session dwm 
