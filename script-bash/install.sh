#!/usr/bin/env bash

set -e  # Exit on any error
set -o pipefail

USERNAME=$(logname)

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Updating The System ...\n"
sudo xbps-install -S && sudo xbps-install -u xbps && sudo xbps-install -Syu
clear


cd $DIR && bash xbps-src.sh && bash path.sh
bash qemu.sh && bash pipewire.sh && bash compression.sh
bash python.sh && bash net.sh && bash neovim.sh
bash intel.sh && bash nvidia-install.sh && bash zshinstall.sh
bash pipewire.sh && bash NetworkManager.sh && bash ufw.sh
bash docker.sh && bash firefox.sh && bash flathub.sh
bash font.sh && bash grc.sh && bash xdgmime.sh && bash pipenv.sh


echo "Reconfigure all packages & Update font cache ... \n"
# Reconfigure all packages
doas xbps-reconfigure -fa

doas shutdown -r now