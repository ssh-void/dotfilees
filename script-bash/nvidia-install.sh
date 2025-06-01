sudo xbps-install -Syu void-repo-nonfree # add void-repo-multilib-nonfree
sudo xbps-install -Syu xorg-server-devel pkg-config # !sudo nvidia-xconfig
sudo xbps-install -Syu nvidia  # current
sudo xbps-install -Syu nvidia-opencl # nonfree
sudo xbps-install -Syu vulkan-loader # current
sudo xbps-install -Syu mesa-vdpau  # current # video acceleration nv
sudo xbps-install -Syu nvidia nvidia-opencl nvidia-vaapi-driver
