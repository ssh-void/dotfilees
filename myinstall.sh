bypass() {
	sudo -v
	while true;
	do
		sudo -n true
		sleep 45
		kill -0 "$$" || exit
	done 2>/dev/null &
}

sudo chsh -s /bin/bash sh
sudo chsh -s /bin/bash root

sleep 3s
bypass
clear
echo "Updating The System"
sudo xbps-install -S && sudo xbps-install -u xbps && sudo xbps-install -Syu
sudo xbps-install -Syu umbrello # uml systeme
sudo xbps-install -Syu alacritty
clear
sudo xbps-install -Syu xorg-minimal xorg-fonts pkg-config base-devel gcc gdb xset xrandr arandr xdotool xdo xrdb xf86-input-synaptics xf86-input-evdev lm_sensors tree man man-db fzy inxi flameshot maim xclip cloc awk neovim picom dnsmasq openresolv tealdeer fastfetch most sxhkd aria2 git htop opendoas base-devel tmux sxiv feh yt-dlp ffmpeg alsa-plugins-ffmpeg nv-codec-headers xrdb dunst notify-send.sh numlockx bash-completion gcolor2 colordiff brightnessctl xsetroot xbanish yaru lxappearance qt5ct ttf-ubuntu-font-family noto-fonts-emoji noto-fonts-cjk dbus python3-dbus libinput-gestures libX11-devel libXft-devel libXinerama-devel fribidi-devel harfbuzz-devel libXrandr-devel 
mkdir -p $HOME/Downloads/{Aria2,Qbittorrent,Firefox,Brave,yt-dlp/{audio,video}}

# You install the following package 
#sudo ln -s /etc/sv/dnsmasq /var/service/
clear
#sudo xbps-install -Syu jq # Command-line JSON processor
sudo xbps-install -Syu rhythmbox # misque read
sudo xbps-install -Syu Thunar xfce4-appfinder
sudo xbps-install -Syu socklog ufw gufw apparmor # seurtié
sudo xbps-install -Syu xdg-utils slock
sudo xbps-install -Syu tesseract-ocr tesseract-ocr-eng tesseract-ocr-ara  
sudo xbps-install -Syu wmname # contourner certains bogues liés aux gestionnaires de fenêtres. 
sudo xbps-install -Syu net-tools NetworkManager # ifconfig netstat .. 
clear

sudo xbps-install -Syu dejavu-fonts-ttf noto-fonts-ttf terminus-font # cantarell-fonts noto-fonts-ttf fonts-roboto-ttf dejavu-fonts-ttf ttf-ubuntu-font-family
sudo xbps-install -Syu vscode eclipse 
sudo xbps-install -Syu mpv python3-devel python3-pip  
sudo xbps-install -Syu megatools # mega
sudo xbps-install -Syu libselinux # matlab 
# KVM & qemu...
sudo xbps-install -Syu virt-manager libvirt qemu-img qemu-system-amd64 qemu-common qemu-firmware openbsd-netcat dnsmasq vde2 bridge-utils spice-vdagent
# tar
sudo xbps-install -Syu zip unzip
sudo xbps-install -Syu p7zip tar xz bzip2 bsdtar gzip
sudo xbps-install -Syu gtkedit # text editor
sudo xbps-install -Syu zramen # zram
sudo xbps-install -Syu octave # matlab 
sudo xbps-install -Syu libreoffice xdg-utils
sudo xbps-install -Syu android-tools
sudo xbps-install -Syu cronie

clear

#sudo xbps-install -Syu kdenlive krita  # video editor

# firefox
sudo xbps-install -Syu firefox speech-dispatcher firefox-i18n-en-US firefox-i18n-ar firefox-i18n-fr font-sil-doulos font-liberation-narrow-ttf
sudo xbps-install -Syu tor obfs4proxy torsocks # w3m w3m-img # tor
sudo xbps-install -Syu qbittorrent
sudo xbps-install -Syu duf eza # lsd exa 
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/


clear
echo "===== pdf ===== "
sudo xbps-install -Syu zathura zathura-pdf-mupdf ntfs-3g exfat-utils
sudo xbps-install -Syu void-repo-nonfree # add void-repo-multilib-nonfree
sleep 3
sudo xbps-install -Syu void-repo-nonfree # add void-repo-multilib-nonfree
#xbps-query -L
sudo xbps-install -Syu unrar # nonfree 

clear
sudo xbps-install -Syu intel-ucode # nonfree 
sudo xbps-install -Syu linux-firmware-intel # free 
sudo xbps-install -Syu intel-video-accel # free 
sudo xbps-install -Syu intel-media-driver # free 
sudo xbps-install -Syu libva-intel-driver # free 
sudo xbps-install -Syu mesa-vulkan-intel # free
sudo xbps-install -Syu mesa-vaapi # free # video acceleration
sudo xbps-install -Syu mesa-dri # free , OpenGL (alacritty)

clear
# nvidia & intel
sudo xbps-install -Syu intel-video-accel
sudo xbps-install -Syu nvidia  # nonfree 
sudo xbps-install -Syu nvidia-opencl # nonfree 
sudo xbps-install -Syu vulkan-loader # free  
sudo xbps-install -Syu mesa-vdpau  # free # video acceleration
sudo xbps-install -Syu mesa-vulkan-intel # free
sudo xbps-install -Syu xf86-video-intel # free

##################################################################

cd /opt/
sudo git clone --depth=1 https://github.com/garabik/grc.git
sudo git clone --depth=1 https://github.com/void-linux/void-packages
sudo xbps-install -Syu xtools-minimal python3 # xi ...
#sudo chown -R $(whoami):$(whoami) .
cd grc/
sudo ./install.sh
sudo cp /etc/profile.d/grc.sh /etc/

sudo xbps-reconfigure -fa && fc-cache -fv && sudo xbps-reconfigure -f fontconfig

sudo sv down dhcpcd
sudo rm /var/service/agetty-tty{3,4,5,6}
sudo rm /var/service/wpa_supplicant
sudo rm /var/service/dhcpcd
sudo ln -s /etc/sv/crond /var/service
sudo ln -s /etc/sv/acpid/ /var/service/
sudo ln -s /etc/sv/bluetoothd/ /var/service/
sudo ln -s /etc/sv/chronyd/ /var/service/
sudo ln -s /etc/sv/crond/ /var/service/
sudo ln -s /etc/sv/dbus/ /var/service/
sudo ln -s /etc/sv/libvirtd/ /var/service/
sudo ln -s /etc/sv/NetworkManager/ /var/service/
sudo ln -s /etc/sv/sshd/ /var/service/
sudo ln -s /etc/sv/tor/ /var/service/
sudo ln -s /etc/sv/udevd/ /var/service/
sudo ln -s /etc/sv/ufw/ /var/service/
sudo ln -s /etc/sv/virtlogd/ /var/service/
sudo ln -s /etc/sv/zramen/ /var/service/
#echo "permit nopass $(whoami) as root" | sudo tee /etc/doas.conf > /dev/null
echo "zram" | sudo tee /etc/modules-load.d/zram.conf > /dev/null
sudo sed -i 's/^FONT=.*/FONT="ter-v20b"/' /etc/rc.conf
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
sudo sed -i 's/^APPARMOR=complain/APPARMOR=enforce/' /etc/default/apparmor
sudo mkdir -p /etc/apparmor.d/disable
sudo ln -s /etc/apparmor.d/usr.lib.libvirt.virt-aa-helper /etc/apparmor.d/disable/
sudo apparmor_parser -R /etc/apparmor.d/usr.lib.libvirt.virt-aa-helper
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo update-grub
sudo shutdown -r now # reboot   
