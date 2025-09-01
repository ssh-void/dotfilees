#!/bin/bash

# Lo utilizo para sincronizar la hora en Void sin instalar chrony o ntpd
# Colocar en /etc/rc.local (si no tienes /etc/network/if-up.d/) con /root/synctime.sh 150 &

Pausa=$1

sleep $Pausa
curl -s --head https://tuservidor.com | grep '^Date:' | cut -d' ' -f 2- | xargs -I {} date -s "{}"

#hwclock --systohc           # La sincroniza con la BIOS
