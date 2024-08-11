bypass() {
	sudo -v
	while true;
	do
		sudo -n true
		sleep 45
		kill -0 "$$" || exit
	done 2>/dev/null &
}
sleep 3s
bypass
clear

echo "Update && package..."
sleep 3s
sudo xbps-install -S && sudo xbps-install -u xbps && sudo xbps-install -Syu
clear
sleep 3s
sudo xbps-install -Syu opendoas tealdeer neovim fzy xorg-minimal xrdb base-devel xset xrandr arandr xdotool xdo xrdb xf86-input-synaptics xf86-input-evdev bash-completion ttf-ubuntu-font-family dejavu-fonts-ttf noto-fonts-emoji noto-fonts-cjk libinput-gestures libX11-devel libXft-devel libXinerama-devel fribidi-devel harfbuzz-devel libXrandr-devel tree man man-db inxi flameshot xclip awk dbus wget curl picom sxhkd xbanish feh brightnessctl numlockx firefox eza most git  
echo "changer shell in bash"
sleep 10s
	sudo chsh -s /usr/bin/bash
clear
echo "changer shell in bash"
sleep 3s
cd $HOME && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.profilevm -O $HOME/.profile && cp $HOME/.profile $HOME/.bash_profile
cd $HOME && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.aliasesvm -O $HOME/.aliases
cd $HOME && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.xinitrcvm -O $HOME/.xinitrc 
clear
echo "scratchpad.sh && sxhkdrc init.vim .Xresources"
sleep 3s
mkdir -p $HOME/.config/.script/ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.config/.script/scratchpad.sh  -O $HOME/.config/.script/scratchpad.sh && chmod +x $HOME/.config/.script/scratchpad.sh
mkdir -p $HOME/.config/sxhkd/ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.config/sxhkd/sxhkdrcvm -O $HOME/.config/sxhkd/sxhkdrc
mkdir -p $HOME/.config/nvim/ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.config/nvim/init.vimvm -O $HOME/.config/nvim/init.vim
cd $HOME && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.config/X11/Xresources -O $HOME/.Xresources
cd $HOME/.config && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.config/sh.png
clear
echo "xorg & plug"
sleep 3s
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sudo mkdir -p /etc/X11/xorg.conf.d/ && sudo wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/xorg.conf.d/00-keyboard.conf -O /etc/X11/xorg.conf.d/00-keyboard.conf
sudo mkdir -p /etc/X11/xorg.conf.d/ && sudo wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/xorg.conf.d/10-evdev.conf -O /etc/X11/xorg.conf.d/10-evdev.conf
sudo mkdir -p /etc/X11/xorg.conf.d/ && sudo wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/xorg.conf.d/40-libinput.conf -O /etc/X11/xorg.conf.d/40-libinput.conf
sudo mkdir -p /etc/X11/xorg.conf.d/ && sudo wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/xorg.conf.d/50-mouse-acceleration.conf -O /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
clear
echo "build suckless "
sleep 3s
mkdir -p $HOME/.config/.suckless && git clone https://github.com/ssh-void/suckless6.5.git $HOME/.config/.suckless
cd $HOME/.config/.suckless/dwm/ && make && sudo make clean install
cd $HOME/.config/.suckless/dmenu/ && make && sudo make clean install
cd $HOME/.config/.suckless/st/ && make && sudo make clean install
cd $HOME/.config/.suckless/slstatus/ && make && sudo make clean install
cd $HOME/.config/.suckless/slock/ && make && sudo make clean install
clear
echo "root config & doas "
sleep 3s
sudo cp $HOME/.bash_profile /root/.bash_profile
sudo mkdir -p /root/.config/nvim && sudo cp $HOME/.config/nvim/init.vim /root/.config/nvim/init.vim
#echo "permit nopass $(whoami) as root" | sudo tee /etc/doas.conf > /dev/null
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
clear
echo "xbps-src && grc "
sleep 3s
cd /opt/ && sudo git clone --depth=1 https://github.com/garabik/grc.git && sudo git clone --depth=1 https://github.com/void-linux/void-packages
cd /opt/ && sudo xbps-install -Syu xtools python3 # xi ...
cd /opt/ && sudo chown -R  $(whoami): $(whoami) .
cd /opt/ && cd grc/ && sudo ./install.sh
sudo cp /etc/profile.d/grc.sh /etc/
sudo xbps-reconfigure -fa && sudo update-grub
clear 
echo ".bashrccc "
sleep 3s
sudo sh -c 'test -f /root/.bashrc && > /root/.bashrc && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.bashrcrot -O /root/.bashrc'
test -f "$HOME/.bashrc" && > "$HOME/.bashrc" && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.bashrc -O "$HOME/.bashrc"
clear 
echo "grub && autologin"
sleep 3s
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
sudo sed -i 's/GETTY_ARGS="--noclear"/GETTY_ARGS="--noclear --autologin $(whoami)"/' /etc/runit/runsvdir/current/agetty-tty1/conf
sudo grub-mkconfig -o /boot/grub/grub.cfg && sudo update-grub
sudo rm /var/service/agetty-tty{3,4,5,6}
clear
echo "fontconfig & fc-cache"
sleep 3s
sudo xbps-reconfigure -fa && fc-cache -fv && sudo xbps-reconfigure -f fontconfig
sudo shutdown -r now # reboot   
clear
