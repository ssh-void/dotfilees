doas xbps-install -Syu pipewire pamixer alsa-pipewire libjack-pipewire wireplumber
doas xbps-install -Syu pavucontrol
doas xbps-install -Syu util-linux
#doas xbps-install pipewire-devel wireplumber-devel
# sv on
doas ln -s /etc/sv/dbus/ /var/service/
doas mkdir -p /etc/pipewire/pipewire.conf.d
doas ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
doas mkdir -p /etc/alsa/conf.d
doas ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
doas ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d