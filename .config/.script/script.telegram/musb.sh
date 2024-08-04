#!/usr/bin/env sh
echo "Monta usb, adaptado x Manuel H.C. "

DIRECT=~/tmp

if [ -d "$DIRECT" ]
then
	continue ;
else
	mkdir ~/tmp
fi

prompt="nombre del dispositivo [por ejemplo, sdXn] ('l'ist, 'q'uit):" 

lsblk

printf "\n.Asegúrese de no estar todavía en el dispositivo montado. \n"
printf "%s" "$prompt"
read -r dev2

while [ -n "$dev2" ]
do
    if [ "$dev2" = "l" ]; then
        lsblk
    elif [ "$dev2" = "q" ]; then
        exit
    else
    	if [ "$(ls $DIRECT)" ]
    	then  
		doas umount  ~/tmp/
         	echo "Dispositivo desmontado de ~/tmp"
    	else 
    		doas mount /dev/$dev2 ~/tmp/
     		echo "Dispositivo montado en ~/tmp"
         
     	fi
    fi

    echo
    printf "%s" "$prompt"
    read -r dev2
	
done
