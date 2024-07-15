sudo xbps-install -Syu pipewire pamixer alsa-pipewire pipewire-devel libjack-pipewire wireplumber wireplumber-devel pavucontrol  
# active
sudo ln -s /etc/sv/dbus /var/service/
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo mkdir -p /etc/alsa/conf.d
sudo ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
sudo ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d
