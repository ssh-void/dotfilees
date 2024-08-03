sudo xbps-install -Sy xtools
#=============================================================#
./xbps-src binary-bootstrap
sudo echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf
#=============================================================#
./xbps-src pkg torbrowser-launcher && xi torbrowser-launcher
./xbps-src pkg google-chrome &&  xi google-chrome
./xbps-src pkg discord && xi discord
./xbps-src bootstrap-update
./xbps-src clean-repocache
