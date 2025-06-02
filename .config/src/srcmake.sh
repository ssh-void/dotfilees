print "### make clean install"
# install make
doas make -s -C ~/.config/src/dwm/ clean install &> /dev/null
cd $HOME/.config/src/stt/ && sudo make -s clean install &> /dev/null
cd $HOME/.config/src/slstatus/ && sudo make -s clean install &> /dev/null
cd $HOME/.config/src/dmenu/ && sudo make -s clean install &> /dev/null
cd $HOME/.config/src/nsxiv/ && sudo make -s clean install &> /dev/null
clear
print "### rm -f dwm ${OBJ} dwm-${VERSION}.tar.gz *.orig *.rej config.h ..."
# clean make
make clean -C ~/.config/src/st/ &> /dev/null
make clean -C ~/.config/src/dwm/ &> /dev/null
make clean -C ~/.config/src/slstatus/ &> /dev/null
make clean -C ~/.config/src/dmenu/ &> /dev/null
make clean -C ~/.config/src/nsxiv/ &> /dev/null
print "### fin ..."
