printf "make install ...\n"
doas make -s -C ~/.config/src/dwm/ clean install &> /dev/null
cd $HOME/.config/src/st/ && doas make -s clean install &> /dev/null
cd $HOME/.config/src/slstatus/ && doas make -s clean install &> /dev/null
cd $HOME/.config/src/dmenu/ && doas make -s clean install &> /dev/null
cd $HOME/.config/src/nsxiv/ && doas make -s clean install &> /dev/null
printf "make clean ...\n"
doas make -s -C ~/.config/src/dwm/ clean &> /dev/null
doas make -s -C ~/.config/src/dwm/ clean &> /dev/null
doas make -s -C ~/.config/src/dwm/ clean &> /dev/null
doas make -s -C ~/.config/src/dwm/ clean &> /dev/null
