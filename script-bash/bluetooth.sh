# bluetooth
doas xbps-install -Syu rfkill util-linux bluez blueman libspa-bluetooth
doas rfkill unblock bluetooth
doas useradd -G bluetooth ${USER}
doas ln -s /etc/sv/bluetoothd/ /var/service/
#doas shutdown -r now
