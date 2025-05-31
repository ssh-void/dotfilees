sudo xbps-install -Syu firefox speech-dispatcher
sudo xbps-install -Syu firefox-i18n-en-US
#sudo xbps-install -Syu firefox-i18n-ar firefox-i18n-fr firefox-i18n-ru firefox-i18n-zh-CN firefox-i18n-zh-TW
# firefox font
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
sudo xbps-reconfigure -f fontconfig
