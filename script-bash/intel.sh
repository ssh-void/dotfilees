#intel
doas xbps-install -Syu intel-ucode # nonfree
doas xbps-install -Syu xf86-video-intel # current
doas xbps-install -Syu linux-firmware-intel # current
doas xbps-install -Syu intel-video-accel # current
doas xbps-install -Syu intel-media-driver # current
doas xbps-install -Syu libva-intel-driver # current
doas xbps-install -Syu mesa-vulkan-intel # current
doas xbps-install -Syu mesa-vaapi # current # video acceleration Intel
