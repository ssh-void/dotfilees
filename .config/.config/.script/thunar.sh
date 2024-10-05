winclass="$(xdotool search --classname filemanager)" # i xdo xdotool
if [ -z "$winclass" ]; then
	Thunar &> /dev/null  	
else
    if [ ! -f /tmp/filemanager ]; then
	touch /tmp/filemanager && xdo hide "$winclass"
    elif [ -f /tmp/filemanager ]; then
	rm /tmp/filemanager && xdo show "$winclass"
    fi
fi
