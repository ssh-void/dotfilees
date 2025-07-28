doas xbps-install -Syu ufw
doas ln -s /etc/sv/ufw /var/service
doas sv restart ufw
clear
printf"### status ...\n"
doas ufw status verbose
doas ufw enable
doas ufw status verbose
doas ufw default deny incoming   # Bloquer toutes les connexions entrantes par défaut
doas ufw default allow outgoing  # Autoriser toutes les connexions sortantes par défaut
