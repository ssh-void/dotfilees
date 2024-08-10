sudo xbps-install -S && sudo xbps-install -u xbps && sudo xbps-install -Syu
sudo xbps-install -Syu wget picom
sudo xbps-install -Syu xorg-minimal xrdb base-devel xset xrandr arandr xdotool xdo xrdb xf86-input-synaptics xf86-input-evdev 
sudo xbps-install -Syu ttf-ubuntu-font-family dejavu-fonts-ttf noto-fonts-emoji noto-fonts-cjk libinput-gestures libX11-devel libXft-devel libXinerama-devel fribidi-devel harfbuzz-devel libXrandr-devel xf86-input-synaptics xf86-input-evdev 
sudo xbps-install -Syu lm_sensors tree man man-db fzy inxi flameshot maim xclip cloc awk dbus picom sxhkd xbanish feh brightnessctl numlockx
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo shutdown -r now # reboot   
sudo rm /var/service/agetty-tty3
sudo rm /var/service/agetty-tty4
sudo rm /var/service/agetty-tty5
sudo rm /var/service/agetty-tty6
cd ~ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.bashrc
cd ~ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.bash_profile
cd ~ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.profile
cd ~ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.aliases
mkdir -p ~/.config/.script && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.config/.script/scratchpad.sh -o ~/.config/.script/scratchpad.sh
mkdir -p ~/.config/sxhkd/ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.config/sxhkd/sxhkdrc -o ~/.config/sxhkd/sxhkdrc
mkdir -p ~/.config/nvim/ && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.config/nvim/init.vim -o ~/.config/nvim/init.vim
sudo cp ~/.bashrc /root/.bashrc
sudo cp ~/.aliases /root/.aliases
sudo cp ~/.profile /root/.profile
sudo cp ~/.bash_profile /root/.bash_profile
sudo mkdir -p /root/.config/nvim
sudo cp ~/.config/nvin/init.vin /root/.config/nvin/init.vin

sudo echo "permit nopass $(whoami) as root" > /etc/doas.conf
