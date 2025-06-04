# doas xbps-install -Syu qemu qemu-common qemu-firmware qemu-img qemu-system-amd64
doas xbps-install -Syu qemu-img qemu-system-amd64 qemu-common qemu-firmware
doas usermod -aG kvm $(whoami)
doas modprobe kvm-intel
mkdir ~/qemu/ && cd ~/qemu/ && qemu-img create -f qcow2 voidlinux.img 10G
#cd ~/qemu/ && qemu-system-x86_64 -enable-kvm -cdrom void.iso -boot menu=on -drive file=voidlinux.img -m 2g -cpu host -smp 4 -vga std -display sdl,gl=on
