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
	sudo xbps-install -Sy firefox firefox-i18n-it

clear

echo "Installazione programmi video..."
sleep 3s
	sudo xbps-install -Sy ffmpeg ffmpegthumbnailer

clear

echo "Installazione programmi grafica..."
sleep 3s
	sudo xbps-install -Sy gimp feh gcolor2 lximage-qt

clear

echo "Installazione programmi utilità..."
sleep 3s
	sudo xbps-install -Sy atom aria2 file-roller p7zip ldm whois testdisk filezilla leafpad gparted gvfs qarma rsync

clear

echo "Installazione programmi non free (UNRAR)..."
sleep 3s
	sudo xbps-install -Sy void-repo-nonfree
	sudo xbps-install -Syuv
	sudo xbps-install -Sy unrar

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

read -p "Fine! Premi INVIO e riavvia!"
	sudo shutdown -r now
