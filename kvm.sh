sudo xbps-install -Syu virt-manager libvirt qemu openbsd-netcat dnsmasq vde2 bridge-utils spice-vdagent
sudo usermod -a -G libvirt $(whoami) 
sudo modprobe kvm-intel  
sudo usermod -a -G libvirt $(whoami)  
sudo sed -i 's/auth_unix_ro = "polkit"/auth_unix_ro = "none"/' /etc/libvirt/libvirtd.conf  # tested
sudo sed -i 's/auth_unix_rw = "polkit"/auth_unix_rw = "none"/' /etc/libvirt/libvirtd.conf # tested
sudo sed -i 's/user = ".*"/user = "'"$(whoami)"'"/' /etc/libvirt/qemu.conf # tested
sudo xbps-install -Syu NetworkManager
sudo sv down dhcpcd # runit
sudo rm /var/service/dhcpcd
sudo ln -s /etc/sv/NetworkManager /var/service/
sudo ln -s /etc/sv/dbus /var/service/
#sudo nmcli device wifi connect SSID password PASSWORD
#sudo reboot
