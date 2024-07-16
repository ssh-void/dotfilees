mkdir Videos Images Downloads Documents Music 

echo "Updating The System"
sudo xbps-install -S && sudo xbps-install -u xbps && sudo xbps-install -Syu

clear

# You install the following package 
sudo xbps-install -Syu neovim fastfetch most sxhkd aria2 git htop opendoas base-devel tmux sxiv chromium yt-dlp ffmpeg alsa-plugins-ffmpeg nv-codec-headers  xrdb xmodmap  #octoxbps 

clear

sudo xbps-install -Syu dunst notify-send.sh numlockx xautolock bash-completion gcolor2 colordiff
sudo xbps-install -Syu redshift # Night light
sudo xbps-install -Syu xsetroot  yaru # papirus-icon-theme # icons
sudo xbps-install -Syu tealdeer  # tldr en rust
clear

echo "Installing The Necessary Stuff"
sudo xbps-install -Syu xorg base-devel xrandr arandr xdotool xdo xrdb xf86-input-synaptics dbus bind libinput-gestures libX11-devel libXft-devel libXinerama-devel fribidi-devel harfbuzz-devel libXrandr-devel lm_sensors tree man fzy inxi	

clear
sudo xbps-install -Syu socklog ufw gufw apparmor # seurtié
sudo xbps-install -Syu tesseract-ocr tesseract-ocr-eng flameshot maim xclip cloc 
sudo xbps-install -Syu wmname # contourner certains bogues liés aux gestionnaires de fenêtres. 
sudo xbps-install -Syu net-tools # ifconfig netstat .. 
sudo xbps-install -Syu p7zip # free
sudo xbps-install -Syu unrar # free
#sudo xbps-install -Syu p7zip-unrar # nonfree
clear
# bluetooth && pipewire		
sudo xbps-install -Syu rfkill util-linux bluez libspa-bluetooth blueman

clear

# active
sudo ln -s /etc/sv/dbus /var/service/
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo mkdir -p /etc/alsa/conf.d
sudo ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
sudo ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d

clear

sudo xbps-install -Syu terminus-font cantarell-fonts noto-fonts-ttf fonts-roboto-ttf dejavu-fonts-ttf ttf-ubuntu-font-family
sudo xbps-install -Syu NetworkManager vscode eclipse xbanish 
sudo xbps-install -Syu mpv python3-pip  
sudo xbps-install -Syu megatools

clear

sudo xbps-install -Syu kdenlive krita  # video editor

# firefox

sudo xbps-install -Syu chromium firefox firefox-i18n-en-US firefox-i18n-ar firefox-i18n-fr ipafont-fonts-otf  
sudo xbps-install -Syu duf eza # lsd exa 
sudo xbps-install -Syu tor obfs4proxy  # tor
sudo ln -s /etc/sv/tor /var/service/
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
sudo xbps-reconfigure -f fontconfig


clear
echo "===== pdf ===== "
sudo xbps-install -Syu zathura zathura-pdf-mupdf ntfs-3g
# non free répo
sudo xbps-install -S void-repo-nonfree # add void-repo-multilib-nonfree
xbps-query -L
#intel

clear

sudo xbps-install -Syu intel-ucode # nonfree 
sudo xbps-install -Syu linux-firmware-intel # free 
sudo xbps-install -Syu intel-video-accel # free 
sudo xbps-install -Syu intel-media-driver # free 
sudo xbps-install -Syu libva-intel-driver # free 
sudo xbps-install -Syu mesa-vulkan-intel # free
sudo xbps-install -Syu mesa-vaapi # free #video acceleration

clear
#nvidia & intel
sudo xbps-install -Syu nvidia  # nonfree 
sudo xbps-install -Syu nvidia-opencl # nonfree 
sudo xbps-install -Syu vulkan-loader # free  
sudo xbps-install -Syu mesa-vdpau  # free #video acceleration
##################################################################
cd /opt/
git clone --depth=1 https://github.com/garabik/grc.git
git clone --depth=1 https://github.com/void-linux/void-packages
sudo xbps-install -Syu xtools # xi ...
doas chown -R sh:sh .
cd grc/
sudo ./install.sh
sudo cp /etc/profile.d/grc.sh /etc/
####################################################################
sudo xbps-reconfigure -fa
fc-cache -fv
sudo sv down dhcpcd
sudo ln -s /etc/sv/NetworkManager /var/service/
sudo ln -s /etc/sv/dbus /var/service/
sudo rm /var/service/agetty-tty3
sudo rm /var/service/agetty-tty4
sudo rm /var/service/agetty-tty5
sudo rm /var/service/agetty-tty6
sudo rm /var/service/wpa_supplicant
sudo rm /var/service/dhcpcd
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo shutdown -r now # reboot   
