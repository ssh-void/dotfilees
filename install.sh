mkdir Videos Images Downloads Documents Music .config
mkdir -p Downloads/YouTube 

# update and upgrade 
sudo xbps-install -S && sudo xbps-install -u xbps && sudo xbps-install -Syu

# You install the following package 
sudo xbps-install -Syu neovim aria2 git htop opendoas base-devel tmux chromium yt-dlp ffmpeg ufetch

sudo xbps-install -Syu dunst notify-send.sh numlockx  brightnessctl bash-completion

sudo xbps-install -Syu xorg-minimal base-devel xrandr arandr xdotool xdo xrdb dbus libinput-gestures libX11-devel libXft-devel libXinerama-devel fribidi-devel harfbuzz-devel libXrandr-devel lm_sensors tree

sudo xbps-install -Syu tesseract-ocr tesseract-ocr-eng flameshot  maim xclip sxhkd cloc 

sudo xbps-install -Syu terminus-font cantarell-fonts
sudo xbps-install -Syu NetworkManager
sudo xbps-install -Syu mpv python3-pip 
# firefox
sudo xbps-install -Syu firefox firefox-i18n-ar firefox-i18n-fr  
sudo xbps-install -Syu tor  obfs4proxy  # tor
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
sudo xbps-reconfigure -f fontconfig

echo "===== pdf ===== "
sudo xbps-install -Syu zathura zathura-pdf-mupdf

sudo xbps-install -S void-repo-nonfree # add void-repo-multilib-nonfree
xbps-query -L
#intel 
sudo xbps-install -Syu intel-ucode # nonfree 
sudo xbps-install -Syu linux-firmware-intel # free 
sudo xbps-install -Syu intel-video-accel # free 
sudo xbps-install -Syu intel-media-driver # free 
sudo xbps-install -Syu libva-intel-driver # free 
sudo xbps-install -Syu mesa-vulkan-intel # free
udo  xbps-install -Syu mesa-vaapi # free #video acceleration
# nvidia
sudo xbps-install -S nvidia
sudo xbps-install -Syu nvidia  # nonfree 
sudo xbps-install -Syu nvidia-opencl # nonfree 
sudo  xbps-install -Syu vulkan-loader # free  
sudo  xbps-install -Syu mesa-vdpau  # free #video acceleration


sudo xbps-reconfigure -fa
fc-cache -fv
sudo sv down dhcpcd
sudo ln -s /etc/sv/NetworkManager /var/service/
sudo ln -s /etc/sv/dbus /var/service/
sudo rm /var/service/agetty-tty3
sudo rm /var/service/agetty-tty4
sudo rm /var/service/agetty-tty5
sudo rm /var/service/agetty-tty6
