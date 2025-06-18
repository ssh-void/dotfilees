doas xbps-install -Syu firefox
#doas xbps-install -Syu speech-dispatcher
#doas xbps-install -Syu firefox-i18n-en-US
#doas xbps-install -Syu firefox-i18n-ar firefox-i18n-fr firefox-i18n-ru firefox-i18n-zh-CN firefox-i18n-zh-TW
# firefox font
doas ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
doas xbps-reconfigure -f fontconfig
cp -rf ~/.config/mimeapps.list ~/.local/share/
