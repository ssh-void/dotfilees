#sudo xbps-install -Syu xtools git
#=============================================================#
cd /opt/
#sudo chown -R $(whoami):$(whoami) .
cd /opt/void-packages/
git clean -fd && git reset --hard && git pull
#=============================================================#
./xbps-src binary-bootstrap # xbps-src cannot be used as root
echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf
#=============================================================#
./xbps-src pkg torbrowser-launcher && xi torbrowser-launcher
#./xbps-src pkg google-chrome &&  xi google-chrome
#./xbps-src pkg discord && xi discord
./xbps-src bootstrap-update && ./xbps-src update-sys
./xbps-src clean-repocache
