doas xbps-install -S docker nvidia-docker
doas ln -s /etc/sv/docker /var/service/
doas usermod -aG docker sh  # pour utilise docker sans sudo  [ reboot]
doas sv status docker
doas docker pull alpine
doas shutdown -r now
