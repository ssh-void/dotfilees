sudo xbps-install -Syu pipewire pamixer alsa-pipewire libjack-pipewire wireplumber
sudo xbps-install -Syu pavucontrol
sudo xbps-install -Syu util-linux
#sudo xbps-install pipewire-devel wireplumber-devel
# active
sudo ln -s /etc/sv/dbus/ /var/service/
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo mkdir -p /etc/alsa/conf.d
sudo ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
sudo ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d
# bluetooth
#sudo xbps-install -Syu rfkill util-linux bluez blueman libspa-bluetooth
#sudo rfkill unblock bluetooth
#sudo useradd -G bluetooth ${USER}
#sudo ln -s /etc/sv/bluetoothd/ /var/service/
#sudo shutdown -r now
