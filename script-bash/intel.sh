#intel
doas xbps-install -Syu intel-ucode # nonfree
doas xbps-install -Syu xf86-video-intel # free
doas xbps-install -Syu linux-firmware-intel # free
doas xbps-install -Syu intel-video-accel # free
doas xbps-install -Syu intel-media-driver # free
doas xbps-install -Syu libva-intel-driver # free
doas xbps-install -Syu mesa-vulkan-intel # free
doas xbps-install -Syu mesa-vaapi # free # video acceleration Intel
