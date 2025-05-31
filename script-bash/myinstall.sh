# my install
USERNAME=$(logname)
sudo chsh -s /bin/bash "$USERNAME"
sudo chsh -s /bin/bash root

echo "Updating The System========================="

sudo xbps-install -S && sudo xbps-install -u xbps && sudo xbps-install -Syu
mkdir $HOME/Images/
mkdir -p $HOME/Downloads/{torrent,firefox,brave,ytdlp/{audio,video}}

sudo xbps-install -Syu void-repo-nonfree # add void-repo-multilib-nonfree
sudo  xbps-install -Suyf $(cat pkg_list.txt)
cd /opt/
sudo git clone --depth=1 https://github.com/garabik/grc.git
cd grc/
sudo ./install.sh
sudo cp /etc/profile.d/grc.sh /etc/

# root user
#sudo sh -c 'test -f /root/.bashrc && > /root/.bashrc && wget -c https://raw.githubusercontent.com/ssh-void/dotfilees/ main/.bashrcrot -O /root/.bashrc' # tested
sudo mkdir -p /root/.config/nvim
sudo cp ~/dotfilees/.config/nvim/init.vimroot /root/.config/nvim/init.vim

# Reconfigure all packages
sudo xbps-reconfigure -fa

# Update font cache
fc-cache -fv

#sudo sv down dhcpcd
sudo rm /var/service/agetty-tty{3,4,5,6}
#sudo rm /var/service/wpa_supplicant
#sudo rm /var/service/dhcpcd
sudo ln -s /etc/sv/crond /var/service && sudo ln -s /etc/sv/acpid/ /var/service/
sudo ln -s /etc/sv/bluetoothd/ /var/service/ && sudo ln -s /etc/sv/chronyd/ /var/service/ && sudo ln -s /etc/sv/crond/ /var/service/
sudo ln -s /etc/sv/dbus/ /var/service/ && sudo ln -s /etc/sv/libvirtd/ /var/service/ && sudo ln -s /etc/sv/NetworkManager/ /var/service/
sudo ln -s /etc/sv/sshd/ /var/service/ && sudo ln -s /etc/sv/tor/ /var/service/ && sudo ln -s /etc/sv/udevd/ /var/service/
sudo ln -s /etc/sv/ufw/ /var/service/ && sudo ln -s /etc/sv/virtlogd/ /var/service/ && sudo ln -s /etc/sv/zramen/ /var/service/
# zram
echo "zram" | sudo tee /etc/modules-load.d/zram.conf > /dev/null
sudo sed -i 's|^#\?FONT=.*|FONT="ter-v20b"|' /etc/rc.conf
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
sudo sed -i 's/^APPARMOR=complain/APPARMOR=enforce/' /etc/default/apparmor
sudo mkdir -p /etc/apparmor.d/disable
sudo ln -s /etc/apparmor.d/usr.lib.libvirt.virt-aa-helper /etc/apparmor.d/disable/
sudo apparmor_parser -R /etc/apparmor.d/usr.lib.libvirt.virt-aa-helper
# GRUB
sudo sed -i 's|^GRUB_CMDLINE_LINUX_DEFAULT=".*"|GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4 i915.enable_guc=3 apparmor=1 security=apparmor"|' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo update-grub
echo "permit nopass "$USERNAME" as root" | sudo tee /etc/doas.conf > /dev/null
#sudo shutdown -r now # reboot
