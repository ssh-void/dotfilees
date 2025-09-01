#!/bin/bash

xbps-install -Suy

xbps-install -y xorg-minimal xorg-fonts xf86-video-amdgpu

xbps-install -y i3-gaps i3status nitrogen dmenu lxappearance lxsession lxdm pcmanfm gvfs gvfs-smb xdg-user-dirs adwaita-icon-theme rxvt-unicode urxvtconfig

xbps-install -y elogind nano firefox-i18n-it setxkbmap leafpad

ln -s /etc/sv/dbus /var/service/

ln -s /etc/sv/lxdm /var/service/

echo Fine!
