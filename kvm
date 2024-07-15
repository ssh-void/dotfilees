doas xbps-install -Syu virt-manager libvirt qemu openbsd-netcat dnsmasq vde2 bridge-utils
doas usermod -a -G libvirt $(whoami) 
doas modprobe kvm-intel  
doas usermod -a -G libvirt $(whoami)  
doas sed -i 's/auth_unix_ro = "polkit"/auth_unix_ro = "none"/' /etc/libvirt/libvirtd.conf  # tested
doas sed -i 's/auth_unix_rw = "polkit"/auth_unix_rw = "none"/' /etc/libvirt/libvirtd.conf # tested
doas sed -i 's/user = ".*"/user = "'"$(whoami)"'"/' /etc/libvirt/qemu.conf # tested
doas xbps-install -Syu NetworkManager
doas sv down dhcpcd # runit
doas rm /var/service/dhcpcd
doas ln -s /etc/sv/NetworkManager /var/service/
doas ln -s /etc/sv/dbus /var/service/
#doas reboot
#doas nmcli device wifi connect SSID password PASSWORD
