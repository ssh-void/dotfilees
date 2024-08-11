#!/bin/bash

# Mettre à jour le système et les outils
sudo xbps-install -Syu xbps
if [ $? -ne 0 ]; then echo "Erreur lors de la mise à jour de xbps."; exit 1; fi

# Installer les paquets nécessaires
sudo xbps-install -Syu \
    xorg-minimal xrdb setxkbmap base-devel xset xrandr arandr xdotool xdo xf86-input-synaptics xf86-input-evdev \
    bash-completion ttf-ubuntu-font-family dejavu-fonts-ttf noto-fonts-emoji noto-fonts-cjk \
    libinput-gestures libX11-devel libXft-devel libXinerama-devel fribidi-devel harfbuzz-devel \
    libXrandr-devel lm_sensors tree man man-db fzy inxi flameshot xclip awk dbus wget curl picom \
    sxhkd xbanish feh brightnessctl numlockx firefox eza most git 
if [ $? -ne 0 ]; then echo "Erreur lors de l'installation des paquets."; exit 1; fi

# Télécharger et configurer les fichiers de configuration
BASE_URL="https://raw.githubusercontent.com/ssh-void/dotfilees/main"
FILES=(
    ".bashrc"
    ".profile"
    ".aliases"
    ".xinitrc"
    ".config/.script/scratchpad.sh"
    ".config/sxhkd/sxhkdrc"
    ".config/nvim/init.vim"
    ".Xresources"
    ".config/sh.png"
)
for FILE in "${FILES[@]}"; do
    curl -fLo "$HOME/$FILE" "$BASE_URL/$FILE"
    if [ $? -ne 0 ]; then echo "Erreur lors du téléchargement de $FILE."; exit 1; fi
done

# Configurer les permissions et les liens
chmod +x $HOME/.config/.script/scratchpad.sh
cp $HOME/.profile $HOME/.bash_profile
sudo cp $HOME/.bash_profile /root/.bash_profile
sudo cp $HOME/.config/nvim/init.vim /root/.config/nvim/init.vim

# Installer vim-plug
sudo xbps-install -Syu curl
if [ $? -ne 0 ]; then echo "Erreur lors de l'installation de curl."; exit 1; fi
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ $? -ne 0 ]; then echo "Erreur lors du téléchargement de vim-plug."; exit 1; fi

# Configurer les fichiers Xorg
XORG_CONF_URLS=(
    "00-keyboard.conf"
    "10-evdev.conf"
    "40-libinput.conf"
    "50-mouse-acceleration.conf"
)
sudo mkdir -p /etc/X11/xorg.conf.d/
for CONF in "${XORG_CONF_URLS[@]}"; do
    sudo curl -fLo "/etc/X11/xorg.conf.d/$CONF" "$BASE_URL/xorg.conf.d/$CONF"
    if [ $? -ne 0 ]; then echo "Erreur lors du téléchargement de $CONF."; exit 1; fi
done

# Cloner et installer les outils suckless
SUCKLESS_REPO="https://github.com/ssh-void/suckless6.5.git"
mkdir -p $HOME/.config/.suckless
git clone $SUCKLESS_REPO $HOME/.config/.suckless
if [ $? -ne 0 ]; then echo "Erreur lors du clonage du dépôt suckless."; exit 1; fi

SUCKLESS_DIRS=("dwm" "dmenu" "st" "slstatus" "slock")
for DIR in "${SUCKLESS_DIRS[@]}"; do
    cd $HOME/.config/.suckless/$DIR
    make && sudo make clean install
    if [ $? -ne 0 ]; then echo "Erreur lors de la compilation de $DIR."; exit 1; fi
done

# Configurer doas
sudo xbps-install -Syu opendoas
if [ $? -ne 0 ]; then echo "Erreur lors de l'installation de opendoas."; exit 1; fi
echo "permit nopass $(whoami) as root" | sudo tee /etc/doas.conf > /dev/null
if [ $? -ne 0 ]; then echo "Erreur lors de la configuration de doas."; exit 1; fi

# Configurer les polices
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
sudo xbps-reconfigure -fa && fc-cache -fv && sudo xbps-reconfigure -f fontconfig

# Installer et configurer grc
cd /opt/
sudo git clone --depth=1 https://github.com/garabik/grc.git
sudo git clone --depth=1 https://github.com/void-linux/void-packages
if [ $? -ne 0 ]; then echo "Erreur lors du clonage des dépôts."; exit 1; fi

sudo xbps-install -Syu xtools python3
if [ $? -ne 0 ]; then echo "Erreur lors de l'installation des outils xtools et python3."; exit 1; fi

sudo chown -R $(whoami):$(whoami) .
cd grc/
sudo ./install.sh
if [ $? -ne 0 ]; then echo "Erreur lors de l'installation de grc."; exit 1; fi

sudo cp /etc/profile.d/grc.sh /etc/
sudo xbps-reconfigure -fa && sudo update-grub
if [ $? -ne 0 ]; then echo "Erreur lors de la configuration de grub."; exit 1; fi

# Configurer grub et agetty
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
sudo sed -i 's/GETTY_ARGS="--noclear"/GETTY_ARGS="--noclear --autologin $(whoami)"/' /etc/runit/runsvdir/current/agetty-tty1/conf

sudo grub-mkconfig -o /boot/grub/grub.cfg && sudo update-grub
if [ $? -ne 0 ]; then echo "Erreur lors de la mise à jour de grub."; exit 1; fi

# Supprimer les services agetty non nécessaires
sudo rm -f /var/service/agetty-tty{3,4,5,6}

# Redémarrer le système
sudo shutdown -r now
