#!/bin/sh 2024-06-04 | 08:19:46 PM tested 
#==================================== X servers ======================================
xrdb -load ~/.config/X11/.Xresources & # -merge not propli worked
xmodmap  ~/.config/X11/.Xmodmap &
#=====================================================================================
# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
#=============================== Launches programs ====================================
numlockx on &
feh --bg-fill ~/Images/evning.png &
sxhkd & 
dunst &
slstatus &
exec xset r rate 225 75 & # Allows for faster output when holding down a key, very useful for vim
#===== Exec dwm through dbus makes some things work, like notifications ================
dbus-run-session dwm 
