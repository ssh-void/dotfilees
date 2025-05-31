sudo xbps-install -Syu apparmor zramen
sudo ln -s /etc/sv/zramen/ /var/service/
# zram
echo "zram" | sudo tee /etc/modules-load.d/zram.conf > /dev/null
sudo sed -i 's|^#\?FONT=.*|FONT="ter-v20b"|' /etc/rc.conf
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
sudo sed -i 's/^APPARMOR=complain/APPARMOR=enforce/' /etc/default/apparmor
sudo mkdir -p /etc/apparmor.d/disable
#sudo ln -s /etc/apparmor.d/usr.lib.libvirt.virt-aa-helper /etc/apparmor.d/disable/
#sudo apparmor_parser -R /etc/apparmor.d/usr.lib.libvirt.virt-aa-helper
# GRUB
sudo sed -i 's|^GRUB_CMDLINE_LINUX_DEFAULT=".*"|GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4 i915.enable_guc=3 apparmor=1 security=apparmor"|' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo update-grub
