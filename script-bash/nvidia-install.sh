doas xbps-install -Syu void-repo-nonfree # add void-repo-multilib-nonfree
doas xbps-install -Syu xorg-server-devel pkg-config # !doas nvidia-xconfig //current
doas xbps-install -Syu nvidia # current
doas xbps-install -Syu nvidia-opencl # nonfree
doas xbps-install -Syu vulkan-loader # current
doas xbps-install -Syu mesa-vdpau  # current # video acceleration nv
doas xbps-install -Syu nvidia nvidia-opencl nvidia-vaapi-driver
#doas xbps-install -Syu nvtop # GPUs process monitoring for AMD, Intel and NVIDIA
#doas xbps-remove -Rv xorg-server-devel
#doas ln -s /etc/sv/nvidia-powerd/ /var/service/
