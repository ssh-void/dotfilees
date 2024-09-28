sudo xbps-install -Syu qemu-img qemu-system-amd64 qemu-common qemu-firmware  #  x86_64
sudo xbps-install -Syu xf86-video-qxl spice-vdagent
sudo xbps-install -Syu NetworkManager virt-manager libvirt openbsd-netcat dnsmasq vde2 bridge-utils 
#sudo xbps-install -Syu qemu
sudo usermod -aG kvm $(whoami) 
sudo modprobe kvm-intel  
sudo usermod -aG libvirt $(whoami) 
sudo sed -i 's/^#auth_unix_ro = "polkit"/auth_unix_ro = "none"/' /etc/libvirt/libvirtd.conf # tested
sudo sed -i 's/^#auth_unix_rw = "polkit"/auth_unix_rw = "none"/' /etc/libvirt/libvirtd.conf # tested
sudo sed -i 's/^#\?user = ".*"/user = "'"$(whoami)"'"/' /etc/libvirt/qemu.conf  # tested
doas ln -s /etc/sv/libvirtd /var/service/
doas ln -s /etc/sv/virtlogd /var/service/
sudo sv down dhcpcd # runit
sudo rm /var/service/dhcpcd
sudo ln -s /etc/sv/NetworkManager /var/service/
sudo ln -s /etc/sv/dbus /var/service/
#sudo nmcli device wifi connect SSID password PASSWORD
sudo reboot
