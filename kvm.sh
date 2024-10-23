sudo xbps-install -Syu qemu-img qemu-system-amd64 qemu-common qemu-firmware  #  x86_64
sudo xbps-install -Syu xf86-video-qxl spice-vdagent spice-protocol
sudo xbps-install -Syu NetworkManager virt-manager libvirt openbsd-netcat dnsmasq vde2 bridge-utils 
#sudo xbps-install -Syu qemu
sudo usermod -aG kvm $(whoami) 
sudo modprobe kvm-intel  
sudo usermod -aG libvirt $(whoami) 
sudo sed -i 's/^#\?user = ".*"/user = "'"$(whoami)"'"/' /etc/libvirt/qemu.conf  # tested
sudo sed -i 's/^#listen_tls =.*/listen_tls = 0/' /etc/libvirt/libvirtd.conf # tested
sudo sed -i 's/^#unix_sock_group =.*/unix_sock_group = "libvirt"/' /etc/libvirt/libvirtd.conf # tested
sudo sed -i 's/^#unix_sock_ro_perms =.*/unix_sock_ro_perms = "0777"/' /etc/libvirt/libvirtd.conf # tested 
sudo sed -i 's/^#unix_sock_rw_perms =.*/unix_sock_rw_perms = "0770"/' /etc/libvirt/libvirtd.conf # tested
sudo sed -i 's|^#unix_sock_dir =.*|unix_sock_dir = "/run/libvirt"|' /etc/libvirt/libvirtd.conf # tested
sudo sed -i 's/^#auth_unix_ro = "polkit"/auth_unix_ro = "none"/' /etc/libvirt/libvirtd.conf # tested
sudo sed -i 's/^#auth_unix_rw = "polkit"/auth_unix_rw = "none"/' /etc/libvirt/libvirtd.conf # tested
sudo sed -i 's/^#\?user = ".*"/user = "'"$(whoami)"'"/' /etc/libvirt/qemu.conf  # tested
doas ln -s /etc/sv/libvirtd /var/service/
doas ln -s /etc/sv/virtlogd /var/service/
sudo sv down dhcpcd # runit
sudo rm /var/service/dhcpcd
sudo ln -s /etc/sv/NetworkManager /var/service/
sudo ln -s /etc/sv/dbus /var/service/
sudo cp /etc/libvirt/libvirt.conf ~/.config/libvirt/
#sudo nmcli device wifi connect SSID password PASSWORD
cd /var/lib/libvirt/images && sudo qemu-img create -f qcow2 -o preallocation=off 50-disk.qcow2 50G # tested
cd /var/lib/libvirt/images && sudo qemu-img create -f qcow2 -o preallocation=off 20-disk.qcow2 20G # tested
cd /var/lib/libvirt/images && sudo qemu-img create -f qcow2 -o preallocation=off 70-disk.qcow2 70G # tested
sudo reboot
