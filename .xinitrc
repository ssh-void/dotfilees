#doas mount -a &
#OpenGL Settings | 0 High Quality | 1 Quality | 2 Performance | 3 High Performance
nvidia-settings -a OpenGLImageSettings=1 &
#PowerMizer |1 Prefer Maximum Performance | 0 Adaptive | 2  Auto
nvidia-settings -a "[gpu:0]/GpuPowerMizerMode=0" &
#Antialiasing Settings
nvidia-settings -a FSAAAppControlled=0 & # Override Application Settings
nvidia-settings -a FSAA=5 & # 5 MSAA | 10 CSAA
numlockx on &
xbanish -t 1 &
pipewire &
pipewire-pulse &
sxhkd &
#dunst &
slstatus &
xset -dpms && xset s off &
xset +fp ~/.fonts && xset s noblank &
xset fp rehash && xset r rate 225 75 &
xset mouse 5 1 &
doas zramen toss && doas zramen -a zstd -s 75 make &
xrandr --output eDP1 --primary --mode 1920x1080 --rate 60 --rotate normal --brightness 1 &
xrandr --setprovideroutputsource NVIDIA-0 modesetting &
xrandr --auto && xrandr --output eDP1 --set "PRIME Synchronization" 1 &
echo "Xft.dpi: 107" | xrdb -merge
xrdb -load $HOME/.config/X11/Xresources &
brightnessctl set 80% &
while true; do picom --backend glx --glx-no-stencil --xrender-sync-fence --no-vsync --glx-no-rebind-pixmap --no-ewmh-fullscreen --no-use-damage --no-fading-openclose --no-fading-destroyed-argb ; done &
#while true; do picom --backend glx --glx-no-stencil --vsync --use-damage &>/dev/null ; done &
exec dbus-run-session dwm
