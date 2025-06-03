USERNAME=$(logname)
doas xbps-install git base-devel xtools-minimal python3
echo "#===================================================================================#"
cd /opt/ && doas git clone --depth=1 https://github.com/void-linux/void-packages.git
cd /opt/ && doas chown -R "$USERNAME":"$USERNAME" void-packages
#git clean -fd && git reset --hard && git pull
echo "#====================================================================================#"
cd /opt/void-packages && ./xbps-src binary-bootstrap # xbps-src cannot be used as root
echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf
echo XBPS_CHROOT_CMD=uchroot >> etc/conf
echo XBPS_CHROOT_CMD_ARGS=-t >> etc/conf
sudo usermod -a -G xbuilder void
echo "#===================================================================================#"
cd /opt/void-packages && ./xbps-src pkg torbrowser-launcher && xi torbrowser-launcher
#./xbps-src pkg google-chrome &&  xi google-chrome
#./xbps-src pkg discord && xi discord
cd /opt/void-packages && ./xbps-src bootstrap-update && ./xbps-src update-sys
cd /opt/void-packages && ./xbps-src clean-repocache
#delete .xbps .... clean
