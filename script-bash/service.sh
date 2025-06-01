sudo rm /var/service/agetty-tty{3,4,5,6}
sudo rm /var/service/wpa_supplicant
sudo rm /var/service/dhcpcd
sudo ln -s /etc/sv/crond /var/service
sudo ln -s /etc/sv/acpid/ /var/service/
sudo ln -s /etc/sv/bluetoothd/ /var/service/
sudo ln -s /etc/sv/chronyd/ /var/service/
sudo ln -s /etc/sv/crond/ /var/service/
sudo ln -s /etc/sv/dbus/ /var/service/
sudo ln -s /etc/sv/NetworkManager/ /var/service/
sudo ln -s /etc/sv/sshd/ /var/service/
sudo ln -s /etc/sv/tor/ /var/service/
sudo ln -s /etc/sv/udevd/ /var/service/
sudo ln -s /etc/sv/ufw/ /var/service/
sudo ln -s /etc/sv/zramen/ /var/service/
sudo ln -s /etc/sv/virtlogd/ /var/service/
sudo ln -s /etc/sv/libvirtd/ /var/service/
