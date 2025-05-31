# sudo xbps-install -Syu qemu qemu-common qemu-firmware qemu-img qemu-system-amd64
sudo xbps-install -Syu qemu-img qemu-system-amd64 qemu-common qemu-firmware
sudo usermod -aG kvm $(whoami)
sudo modprobe kvm-intel
cd /var/lib/libvirt/images && sudo qemu-img create -f qcow2 -o preallocation=off 50-voidlinux.qcow2 50G # tested
cd /var/lib/libvirt/images && sudo qemu-img create -f qcow2 -o preallocation=off 20-voidlinux.qcow2 20G # tested
cd /var/lib/libvirt/images && sudo qemu-img create -f qcow2 -o preallocation=off 70-voidlinux.qcow2 70G # tested
