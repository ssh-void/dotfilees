sudo xbps-install git base-devel xtools
#=============================================================#
cd /opt/
sudo git clone --depth=1 https://github.com/void-linux/void-packages.git
sudo chown -R $(whoami):$(whoami) .
cd void-packages/
sudo git clean -fd && git reset --hard && git pull
#=============================================================#
./xbps-src binary-bootstrap # xbps-src cannot be used as root
echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf
#echo XBPS_CHROOT_CMD=uchroot >> etc/conf
#echo XBPS_CHROOT_CMD_ARGS=-t >> etc/conf
#=============================================================#
./xbps-src pkg torbrowser-launcher && xi torbrowser-launcher
#./xbps-src pkg google-chrome &&  xi google-chrome
#./xbps-src pkg discord && xi discord
./xbps-src bootstrap-update && ./xbps-src update-sys
./xbps-src clean-repocache
#delete .xbps .... clean 
