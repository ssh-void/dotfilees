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
wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.bashrc
wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.bash_profile
wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.profile
wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.aliases
wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.config/.script/scratchpad.sh -o ~/
wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.config/sxhkd/sxhkdrc
wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/main/.config/nvim/init.vim
sudo echo "permit nopass $(whoami) as root" > /etc/doas.conf
