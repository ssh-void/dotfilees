sudo xbps-install -S && sudo xbps-install -u xbps && sudo xbps-install -Syu
sudo xbps-install -Syu wget curl picom opendoas
sudo xbps-install -Syu xorg-minimal xrdb base-devel xset xrandr arandr xdotool xdo xrdb xf86-input-synaptics xf86-input-evdev 
sudo xbps-install -Syu ttf-ubuntu-font-family dejavu-fonts-ttf noto-fonts-emoji noto-fonts-cjk libinput-gestures libX11-devel libXft-devel libXinerama-devel fribidi-devel harfbuzz-devel libXrandr-devel 
sudo xbps-install -Syu lm_sensors tree man man-db fzy inxi flameshot maim xclip cloc awk dbus picom sxhkd xbanish feh brightnessctl numlockx firefox eza most  
cd ~ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.bashrc
cd ~ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.bash_profile
cd ~ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.profile
cd ~ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.aliases
cd ~ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.xinitrc
mkdir -p ~/.config/.script/ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.config/.script/scratchpad.sh  -O ~/.config/.script/scratchpad.sh && chmod +x ~/.config/.script/scratchpad.sh
mkdir -p ~/.config/sxhkd/ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.config/sxhkd/sxhkdrc -O ~/.config/sxhkd/sxhkdrc
mkdir -p ~/.config/nvim/ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.config/nvim/init.vim -O ~/.config/nvim/init.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sudo mkdir -p /etc/X11/xorg.conf.d/ && sudo wget -c https://github.com/ssh-void/dotfilees/main/xorg.conf.d/00-keyboard.conf -O /etc/X11/xorg.conf.d/00-keyboard.conf
sudo mkdir -p /etc/X11/xorg.conf.d/ && sudo wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/xorg.conf.d/10-evdev.conf -O /etc/X11/xorg.conf.d/10-evdev.conf
sudo mkdir -p /etc/X11/xorg.conf.d/ && sudo wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/xorg.conf.d/40-libinput.conf -O /etc/X11/xorg.conf.d/40-libinput.conf
sudo mkdir -p /etc/X11/xorg.conf.d/ && sudo wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/xorg.conf.d/50-mouse-acceleration.conf -O /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
sudo cp ~/.bashrc /root/.bashrc
sudo cp ~/.aliases /root/.aliases
sudo cp ~/.profile /root/.profile
sudo cp ~/.bash_profile /root/.bash_profile
sudo mkdir -p /root/.config/nvim
sudo cp ~/.config/nvim/init.vim /root/.config/nvim/init.vim
echo "permit nopass $(whoami) as root" | sudo tee /etc/doas.conf > /dev/null
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
sudo xbps-reconfigure -f fontconfig
cd /opt/
sudo git clone --depth=1 https://github.com/garabik/grc.git
sudo chown -R  $(whoami): $(whoami) .
cd grc/
sudo ./install.sh
sudo cp /etc/profile.d/grc.sh /etc/
sudo xbps-reconfigure -fa
fc-cache -fv
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
sudo sed -i 's/GETTY_ARGS="--noclear"/GETTY_ARGS="--noclear --autologin $(whoami)"/' /etc/runit/runsvdir/current/agetty-tty1/conf
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo rm /var/service/agetty-tty3
sudo rm /var/service/agetty-tty4
sudo rm /var/service/agetty-tty5
sudo rm /var/service/agetty-tty6
sudo shutdown -r now # reboot   
