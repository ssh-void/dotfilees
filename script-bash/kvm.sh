
USERNAME=$(logname)

echo "### insatll requirment...\n"
doas xbps-install -Syu qemu-img qemu-system-amd64 qemu-common qemu-firmware  #  x86_64
doas xbps-install -Syu xf86-video-qxl spice-vdagent spice-protocol
doas xbps-install -Syu NetworkManager virt-manager libvirt openbsd-netcat dnsmasq vde2 bridge-utils
doas xbps-install -Syu qemu
clear
echo "### usermod ...\n"
doas usermod -aG kvm "$USERNAME"
doas modprobe kvm-intel
doas usermod -aG libvirt "$USERNAME"
clear
echo "### config file *.conf ...\n"
doas sed -i 's/^#\?listen_tls =.*/listen_tls = 0/' /etc/libvirt/libvirtd.conf # tested
doas sed -i 's/^#\?unix_sock_group =.*/unix_sock_group = "libvirt"/' /etc/libvirt/libvirtd.conf # tested
doas sed -i 's/^#\?unix_sock_ro_perms =.*/unix_sock_ro_perms = "0777"/' /etc/libvirt/libvirtd.conf # tested
doas sed -i 's/^#\?unix_sock_rw_perms =.*/unix_sock_rw_perms = "0770"/' /etc/libvirt/libvirtd.conf #tested
doas sed -i 's|^#\?unix_sock_dir =.*|unix_sock_dir = "/run/libvirt"|' /etc/libvirt/libvirtd.conf # tested
doas sed -i 's/^#\?auth_unix_ro = "polkit"/auth_unix_ro = "none"/' /etc/libvirt/libvirtd.conf # tested
doas sed -i 's/^#\?auth_unix_rw = "polkit"/auth_unix_rw = "none"/' /etc/libvirt/libvirtd.conf # tested
doas sed -i 's/^#\?uri_default =.*$/uri_default = "qemu:\/\/\/system"/' /etc/libvirt/libvirt.conf # tested
doas sed -i 's|^#\?group =.*|group = "libvirt"|' /etc/libvirt/qemu.conf # tested
doas sed -i "s|^#\?user =.*|user = \"$USERNAME\"|" /etc/libvirt/qemu.conf # a teste ?
clear
echo "### sv on service ...\n"
doas ln -s /etc/sv/libvirtd /var/service/
doas ln -s /etc/sv/virtlogd /var/service/
doas sv down dhcpcd # runit
doas rm /var/service/dhcpcd
doas ln -s /etc/sv/virtlogd/ /var/service/
doas ln -s /etc/sv/libvirtd/ /var/service/

doas mkdir -p ~/.config/libvirt/
doas cp /etc/libvirt/libvirt.conf ~/.config/libvirt/
# dyn disk
cd /var/lib/libvirt/images && doas qemu-img create -f qcow2 -o preallocation=off 50-disk.qcow2 50G # tested
cd /var/lib/libvirt/images && doas qemu-img create -f qcow2 -o preallocation=off 20-disk.qcow2 20G # tested
cd /var/lib/libvirt/images && doas qemu-img create -f qcow2 -o preallocation=off 70-disk.qcow2 70G # tested
#doas reboot
