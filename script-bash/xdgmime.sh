doas xbps-install -Syu xdg-utils firefox nnn
xdg-mime default nnn.desktop inode/directory
#xdg-mime default thunar.desktop inode/directory
xdg-settings set default-web-browser firefox.desktop
#xdg-settings set default-web-browser brave-browser.desktop
xdg-mime default firefox.desktop text/html
xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https
xdg-mime default vlc.desktop video/x-matroska
