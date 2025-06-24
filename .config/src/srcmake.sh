printf "make install ...\n"
doas xbps-install -Syu make
cd $HOME/.config/src/dwm/ && doas make -s -j 4 && doas make -s clean install &> /dev/null
cd $HOME/.config/src/st/ && doas make -s -j 4 && doas make -s clean install &> /dev/null
cd $HOME/.config/src/slstatus/ && doas make -s -j 4 && doas make -s clean install &> /dev/null
cd $HOME/.config/src/dmenu/ && doas make -s -j 4 && doas make -s clean install &> /dev/null
cd $HOME/.config/src/nsxiv/ && doas make -s -j 4 && doas make -s clean install &> /dev/null
printf "make clean ...\n"
cd ~/.config/src/dwm/ && doas rm *.o ; doas rm *.orig ; doas rm *.rej ; doas rm config.h ; make clean
cd ~/.config/src/st/ && doas rm *.o ; doas rm *.orig ; doas rm *.rej ; doas rm config.h ; make clean
cd ~/.config/src/slstatus/ && doas rm *.o ; doas rm *.orig ; doas rm *.rej ; doas rm config.h ; make clean
cd ~/.config/src/dmenu/ && doas rm *.o ; doas rm *.orig ; doas rm *.rej ; doas rm config.h ; make clean
cd ~/.config/src/nsxiv/ && doas rm *.o ; doas rm *.orig ; doas rm *.rej ; doas rm config.h ; make clean
