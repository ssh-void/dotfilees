doas xbps-install -Syu cronie
doas ln -s /etc/sv/cronie /var/service
doas sv restart cronie
crontab crontab.txt
doas sv restart cronie
