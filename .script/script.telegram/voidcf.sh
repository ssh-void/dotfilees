!/bin/bash

_user="$(who|awk 'NR==1 {print $1}')"

clear
echo "build-voidcf"
echo ""
sleep 1

echo "Creando VoidCF iso.."
echo ""
sleep 1

cd /usr/share/ronin/void/.mklive
./mklive.sh -k "es" -l "es_AR.UTF-8" -o "voidcf" -T "voidcf" -p "grub-x86_64-efi dialog xorg-minimal xorg-input-drivers xorg-video-drivers xrandr setxkbmap xauth lxappearance font-misc-misc terminus-font dejavu-fonts-ttf linux-firmware-network NetworkManager network-manager-applet ntp wget xfwm4 pcmanfm tint2 tint2conf octoxbps ntfs-3g exfat-utils fuse-exfat gvfs-afc gvfs-mtp gvfs-smb udisks2 gparted gptfdisk firefox xterm sakura nitrogen rofi unzip vim micro nano volumeicon xdg-user-dirs xdg-user-dirs-gtk vlc" -I ".includedir"
echo ""
sleep 1

echo "Finalizado, moviendo iso a tu escritorio"
echo ""
sleep 1

chown $_user:$_user *.iso
mv *.iso /home/$_user/Escritorio
sync
