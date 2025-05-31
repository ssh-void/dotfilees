USERNAME=$(logname)
sudo xbps-install -Syu docker
#sudo xbps-install -Syu nvidia-docker
doas ln -s /etc/sv/docker /var/service/
doas usermod -aG docker "$USERNAME"
doas sv status docker
doas docker pull alpine
#doas shutdown -r now
