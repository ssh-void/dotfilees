numlockx on &
brightnessctl set 80%
st &
xrdb -load $HOME/.config/X11/Xresources &
#xmodmap  $HOME/.config/X11/Xmodmap &
picom --backend glx --vsync --dbus &
feh --bg-fill $HOME/Images/sh.png &
xbanish &
#xrandr --output DP-1 --off --output HDMI-2 --off &
#xrandr --output HDMI-1 --mode 1920x1080 --pos 1307x0 --rotate right --rate 50 --brightness 0.7 &
#xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x1920 --rotate normal --rate 60 --brightness 1 &
pipewire &
pipewire-pulse &
sxhkd & 
dunst &
slstatus &
exec xset r rate 225 75 &
dbus-run-session dwm 
