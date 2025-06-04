USERNAME=$(logname)
echo "installing grc bash color... ========================="
cd /opt/
doas  git clone --depth=1 https://github.com/garabik/grc.git
doas  chown -R "$USERNAME":"$USERNAME" grc
cd grc/
doas  ./install.sh
doas  cp /etc/profile.d/grc.sh /etc/