sudo xbps-install -Syu void-repo-nonfree 
sudo xbps-install -Syu nvidia  # nonfree 
sudo xbps-install -Syu nvidia-opencl # nonfree 
sudo xbps-install -Syu vulkan-loader # free  
sudo xbps-install -Syu mesa-vdpau  # free #video acceleration nv
sudo xbps-install -Syu void-repo-nonfree # add void-repo-multilib-nonfree
sudo xbps-install -Syu nv-codec-headers nvidia nvidia-opencl nvidia-vaapi-driver
