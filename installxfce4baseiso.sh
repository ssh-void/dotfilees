bypass() {
	sudo -v
	while true;
	do
		sudo -n true
		sleep 45
		kill -0 "$$" || exit
	done 2>/dev/null &
}

echo "Avvio script configurazione Void Linux..."
sleep 3s
	bypass

clear

echo "Aggiornamento VOID LINUX..."
sleep 3s
	sudo xbps-install -S && sudo xbps-install -u xbps && sudo xbps-install -Syu
        mkdir -p $HOME/Downloads/{Aria2c,Qbittorrent,Firefox,Brave,yt-dlp/{audio,video}}
clear

echo "Configurazione VOID LINUX..."
sleep 10s
	sudo chsh -s /usr/bin/bash sh
        sudo chsh -s /usr/bin/bash root
	sudo loadkeys fr

clear

echo "Installazione XORG & NETWORK MANAGER..."
sleep 3s
	sudo xbps-install -Sy neovim xorg-minimal fonts-roboto-ttf ipafont-fonts-otf xf86-input-synaptics NetworkManager network-manager-applet dnsmasq
        sudo xbps-install -Syu xorg-minimal base-devel xset xrandr arandr xdotool xdo xrdb xf86-input-synaptics xf86-input-evdev lm_sensors tree man man-db fzy inxi flameshot maim xclip cloc awk neovim picom dnsmasq openresolv tealdeer elogind fastfetch most sxhkd aria2 git htop opendoas base-devel tmux sxiv feh yt-dlp ffmpeg alsa-plugins-ffmpeg nv-codec-headers xrdb dunst notify-send.sh numlockx bash-completion gcolor2 colordiff brightnessctl xsetroot xbanish yaru lxappearance qt5ct ttf-ubuntu-font-family noto-fonts-emoji noto-fonts-cjk dbus libinput-gestures libX11-devel libXft-devel libXinerama-devel fribidi-devel harfbuzz-devel libXrandr-devel 
clear

echo "xfce4 ..."
sleep 3s
	sudo xbps-install -Sy xfce4-plugins lightdm-gtk-greeter-settings papirus-folders papirus-icon-theme xfce4-panel-profiles
clear
echo "Instalation PIPEWIRE & ALSA..."
sleep 3s
       sudo xbps-install -Syu util-linux pipewire pamixer alsa-pipewire pipewire-devel libjack-pipewire wireplumber wireplumber-devel pavucontrol  
       # active
       sudo ln -s /etc/sv/dbus/ /var/service/
       sudo mkdir -p /etc/pipewire/pipewire.conf.d
       sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
       sudo mkdir -p /etc/alsa/conf.d
       sudo ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
       sudo ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d
       # bluetooth
       sudo xbps-install -Syu rfkill util-linux bluez libspa-bluetooth blueman
       sudo rfkill unblock bluetooth
       sudo ln -s /etc/sv/bluetoothd/ /var/service/
       #sudo shutdown -r now
clear

echo "Installazione LIGHTDM & XFCE..."
sleep 3s
	sudo xbps-install -Sy lightdm lightdm-gtk3-greeter elogind sakura xfce4-panel xfce4-settings xfce4-session xfwm4 xfdesktop xfce4-alsa-plugin tumbler breeze-icons

clear

echo "Installazione programmi navigare..."
sleep 3s
	sudo xbps-install -Sy firefox speech-dispatcher firefox-i18n-en-US firefox-i18n-ar firefox-i18n-fr font-sil-doulos font-liberation-narrow-ttf

clear

echo "Installazione programmi video..."
sleep 3s
	sudo xbps-install -Sy ffmpeg ffmpegthumbnailer

clear

echo "Installazione programmi grafica..."
sleep 3s
	sudo xbps-install -Sy gimp feh gcolor2 lximage-qt

clear

echo "Installazione programmi grafica..."
sleep 3s
        sudo xbps-install -Syu NetworkManager virt-manager libvirt qemu openbsd-netcat dnsmasq vde2 bridge-utils spice-vdagent
        sudo usermod -aG kvm $(whoami) 
        sudo modprobe kvm-intel  
        sudo usermod -aG libvirt $(whoami) 
        sudo sed -i 's/^#auth_unix_ro = "polkit"/auth_unix_ro = "none"/' /etc/libvirt/libvirtd.conf # tested
        sudo sed -i 's/^#auth_unix_rw = "polkit"/auth_unix_rw = "none"/' /etc/libvirt/libvirtd.conf # tested
        #sudo sed -i 's/^#\?user = ".*"/user = "'"$(whoami)"'"/' /etc/libvirt/qemu.conf  # tested
        sudo ln -s /etc/sv/libvirtd /var/service/
        sudo ln -s /etc/sv/virtlogd /var/service/
        sudo sv down dhcpcd # runit
        sudo rm /var/service/dhcpcd
        sudo ln -s /etc/sv/NetworkManager /var/service/
        sudo ln -s /etc/sv/dbus /var/service/
        #sudo nmcli device wifi connect SSID password PASSWORD
        #sudo reboot
clear

echo "Installazione programmi utilità..."
sleep 3s
	sudo xbps-install -Sy atom aria2 file-roller p7zip ldm whois testdisk filezilla leafpad gparted gvfs qarma rsync

clear

echo "Installazione programmi non free (nvidia)..."
sleep 3s
	sudo xbps-install -Sy void-repo-nonfree
	sudo xbps-install -Syuv
        sudo xbps-install -Syu p7zip unzip tar xz bzip2 bsdtar gzip
clear

echo "Ottimizzazioni..."
sleep 3s
	cd ~ && wget -c https://raw.githubusercontent.com/nazionlinux/bashrc/master/.bashrc
	cd ~ && wget -c https://raw.githubusercontent.com/nazionlinux/nanorc/main/.nanorc
	sudo cp ~/.bashrc /root/.bashrc
	sudo cp ~/.nanorc /etc/nanorc
	sudo sed '/listen-address=/s/^#//' -i /etc/dnsmasq.conf
	sudo sed '/resolv-file=/s/^#//' -i /etc/dnsmasq.conf
	sudo sed '/name_servers/s/^#//' -i /etc/resolvconf.conf
	sudo sed '/listen-address=/s/$/127.0.0.1/' -i /etc/dnsmasq.conf
	sudo sed '/resolv-file=/s/$/\/etc\/resolvdnsmasq.conf/' -i /etc/dnsmasq.conf
	sudo echo -e "nameserver 1.1.1.1\nnameserver 1.0.0.1" > /etc/resolvdnsmasq.conf

clear

echo "Configurazione servizi..."
sleep 10s
	sudo ln -s /etc/sv/dbus /var/service/
	sudo ln -s /etc/sv/elogind /var/service/
	sudo ln -s /etc/sv/dnsmasq /var/service/
	sudo ln -s /etc/sv/NetworkManager /var/service/
	sudo ln -s /etc/sv/pipewire /var/service/
	sudo ln -s /etc/sv/lightdm /var/service/

clear
#sudo shutdown -r now
