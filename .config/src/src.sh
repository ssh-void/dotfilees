sudo make -s -C ~/.config/src/dwm/ clean install &> /dev/null 
cd $HOME/.config/src/stt/ && sudo make -s clean install &> /dev/null
cd $HOME/.config/src/slstatus/ && sudo make -s clean install &> /dev/null
cd $HOME/.config/src/dmenu/ && sudo make -s clean install &> /dev/null
cd $HOME/.config/src/nsxiv/ && sudo make -s clean install &> /dev/null
# rm *.o and config.h
cd $HOME/.config/src/dwm/ ; rm -rvf *.o config.h 
cd $HOME/.config/src/stt/ ; rm -rvf *.o config.h 
cd $HOME/.config/src/slstatus/ ; rm -rvf *.o config.h 
cd $HOME/.config/src/dmenu/ ; rm -rvf *.o config.h 
