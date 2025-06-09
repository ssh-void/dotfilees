doas xbps-install -Syu ufw
doas ln -s /etc/sv/ufw /var/service
doas sv restart ufw
clear
printf"### status ...\n"
doas ufw status verbose
doas ufw enable
