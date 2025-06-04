doas xbps-install -Syu apparmor
# zram
doas sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
doas sed -i 's/^APPARMOR=complain/APPARMOR=enforce/' /etc/default/apparmor
doas mkdir -p /etc/apparmor.d/disable
doas ln -s /etc/apparmor.d/usr.lib.libvirt.virt-aa-helper /etc/apparmor.d/disable/
doas apparmor_parser -R /etc/apparmor.d/usr.lib.libvirt.virt-aa-helper
#GRUB
doas sed -i 's|^GRUB_CMDLINE_LINUX_DEFAULT=".*"|GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4 i915.enable_guc=3 apparmor=1 security=apparmor"|' /etc/default/grub
doas grub-mkconfig -o /boot/grub/grub.cfg
doas update-grub