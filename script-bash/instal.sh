#!/usr/bin/env bash

set -e  # Exit on any error
set -o pipefail

USERNAME=$(logname)

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Updating The System ...\n"
sudo xbps-install -S && sudo xbps-install -u xbps && sudo xbps-install -Syu
clear

sudo chsh -s /bin/bash "$USERNAME"
sudo chsh -s /bin/bash root


sudo xbps-install -Syu opendoas
echo "permit nopass "$USERNAME" as root" | sudo tee /etc/doas.conf > /dev/null


echo "Add void-repo-nonfree & installing packages...\n"
doas xbps-install -Syu void-repo-nonfree # add void-repo-multilib-nonfree
clear

cd "$(dirname "$DIR")"
cp -rf .config/ .fonts/ .icons/ .local/ .themes/  $HOME/
cp -rf .bash_profile .bashrc .gitconfig .lesskey .octaverc .profile .xinitrc0 .zshenv $HOME/
doas cp -rf xbps.d/ /etc/
doas cp -rf xorg.conf.d/ /etc/X11/

cd $DIR 
bash sucklees-devel.sh 
doas xbps-install -Syu font-inconsolata-otf terminus-font

# Build suckless programs
SUCKLESS_DIR="$HOME/dotfilees/.config/src"

for prog in dwm dmenu st slstatus nsxiv; do
	PROG_PATH="$SUCKLESS_DIR/$prog"
	if [ -d "$PROG_PATH" ]; then
		echo "Building $prog..."
		cd "$PROG_PATH"
        doas make -s -j 4 && doas make -s clean install
		doas make clean install
        doas rm *.o ; doas rm *.orig ; doas rm *.rej ; doas rm config.h ; make clean
	else
		echo "Warning: $PROG_PATH does not exist, skipping."
	fi
done

cd $DIR && sudo xbps-install -Suyf $("cat" utilites.txt)
cd $DIR && bash zram-grub.sh
echo "Reconfigure all packages & Update font cache ... \n"
# Reconfigure all packages
doas xbps-reconfigure -fa

doas shutdown -r now
