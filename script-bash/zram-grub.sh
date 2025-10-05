doas xbps-install -Syu zramen
# zram
echo "zram" | doas tee /etc/modules-load.d/zram.conf > /dev/null
doas sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
# GRUB
doas sed -i 's|^GRUB_CMDLINE_LINUX_DEFAULT=".*"|GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4 i915.enable_guc=3"|' /etc/default/grub
doas grub-mkconfig -o /boot/grub/grub.cfg
doas update-grub
doas ln -s /etc/sv/zramen/ /var/service/
