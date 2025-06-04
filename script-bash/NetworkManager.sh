doas xbps-install -Syu NetworkManager
doas sv down dhcpcd
doas rm /var/service/dhcpcd
doas ln -s /etc/sv/NetworkManager/ /var/service/
#doas reboot
#doas nmcli device wifi connect "SSID" password "PASSWORD"