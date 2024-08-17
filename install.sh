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

mkdir Videos Images Downloads Documents Music 
mkdir -p $HOME/Downloads/{Aria2c,Qbittorrent,Firefox,Brave,yt-dlp/{audio,video}}

echo "Updating The System"
sudo xbps-install -S && sudo xbps-install -u xbps && sudo xbps-install -Syu

clear

# You install the following package 
sudo xbps-install -Syu neovim picom fastfetch most sxhkd aria2 git htop opendoas base-devel tmux sxiv feh yt-dlp ffmpeg alsa-plugins-ffmpeg nv-codec-headers xrdb # xmodmap  # octoxbps 

clear
#sudo xbps-install -Syu ipafont-fonts-otf # japnis lang
sudo xbps-install -Syu dunst notify-send.sh numlockx bash-completion gcolor2 colordiff brightnessctl   
sudo xbps-install -Syu xsetroot xbanish yaru # papirus-icon-theme # icons
sudo xbps-install -Syu lxappearance qt5ct # conf the themes
sudo xbps-install -Syu tealdeer  # tldr en rust
sudo xbps-install -Syu elogind
sudo ln -s /etc/sv/elogind /var/service/
sudo xbps-install -Syu dnsmasq openresolv
sudo ln -s /etc/sv/dnsmasq /var/service/
clear

echo "Installing The Necessary Stuff"

sudo xbps-install -Syu xorg-minimal base-devel xset xrandr arandr xdotool xdo xrdb xf86-input-synaptics xf86-input-evdev 
sudo xbps-install -Syu lm_sensors tree man man-db fzy inxi flameshot maim xclip cloc awk	
sudo xbps-install -Syu ttf-ubuntu-font-family noto-fonts-emoji noto-fonts-cjk dbus bind libinput-gestures libX11-devel libXft-devel libXinerama-devel fribidi-devel harfbuzz-devel libXrandr-devel 

clear
sudo xbps-install -Syu socklog ufw gufw apparmor # seurtié
sudo xbps-install -Syu tesseract-ocr tesseract-ocr-eng tesseract-ocr-ara  
sudo xbps-install -Syu wmname # contourner certains bogues liés aux gestionnaires de fenêtres. 
sudo xbps-install -Syu net-tools NetworkManager # ifconfig netstat .. 
clear

sudo xbps-install -Syu dejavu-fonts-ttf noto-fonts-ttf # terminus-font cantarell-fonts noto-fonts-ttf fonts-roboto-ttf dejavu-fonts-ttf ttf-ubuntu-font-family
sudo xbps-install -Syu vscode eclipse 
sudo xbps-install -Syu mpv python3-pip  
sudo xbps-install -Syu megatools 
# KVM & qemu...
sudo xbps-install -Syu virt-manager libvirt qemu openbsd-netcat dnsmasq vde2 bridge-utils spice-vdagent
# tar
sudo xbps-install -Syu p7zip unzip tar xz bzip2 bsdtar gzip

clear

#sudo xbps-install -Syu kdenlive krita  # video editor

# firefox
sudo xbps-install -Syu firefox speech-dispatcher firefox-i18n-en-US firefox-i18n-ar firefox-i18n-fr font-sil-doulos font-liberation-narrow-ttf
sudo xbps-install -Syu tor obfs4proxy torsocks # w3m w3m-img # tor
sudo xbps-install -Syu qbittorrent
sudo xbps-install -Syu duf eza # lsd exa 
sudo ln -s /etc/sv/tor /var/service/
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/


clear
echo "===== pdf ===== "
sudo xbps-install -Syu zathura zathura-pdf-mupdf ntfs-3g exfat-utils
# non free répo
sudo xbps-install -S void-repo-nonfree # add void-repo-multilib-nonfree
xbps-query -L

clear
echo "=====""""""" NVIDIA intel """""""" ===== "
sudo xbps-install -Syu intel-ucode # nonfree 
sudo xbps-install -Syu linux-firmware-intel # free 
sudo xbps-install -Syu intel-video-accel # free 
sudo xbps-install -Syu intel-media-driver # free 
sudo xbps-install -Syu libva-intel-driver # free 
sudo xbps-install -Syu mesa-vulkan-intel # free
sudo xbps-install -Syu mesa-vaapi # free # video acceleration

clear
# nvidia & intel
echo "=====""""""" NVIDIA intel """""""" ===== "
sudo xbps-install -Syu nvidia  # nonfree 
sudo xbps-install -Syu nvidia-opencl # nonfree 
sudo xbps-install -Syu vulkan-loader # free  
sudo xbps-install -Syu mesa-vdpau  # free # video acceleration

##################################################################

cd /opt/
sudo git clone --depth=1 https://github.com/garabik/grc.git
sudo git clone --depth=1 https://github.com/void-linux/void-packages
sudo xbps-install -Syu xtools python3 # xi ...
#sudo chown -R $(whoami):$(whoami) .
cd grc/
sudo ./install.sh
sudo cp /etc/profile.d/grc.sh /etc/

####################################################################
sudo xbps-reconfigure -fa && fc-cache -fv && sudo xbps-reconfigure -f fontconfig
####################################################################
sudo sv down dhcpcd
sudo ln -s /etc/sv/NetworkManager /var/service/
sudo ln -s /etc/sv/dbus /var/service/
sudo rm /var/service/agetty-tty{3,4,5,6}
sudo rm /var/service/wpa_supplicant
sudo rm /var/service/dhcpcd
#echo "permit nopass $(whoami) as root" | sudo tee /etc/doas.conf > /dev/null
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo update-grub
sudo shutdown -r now # reboot   
