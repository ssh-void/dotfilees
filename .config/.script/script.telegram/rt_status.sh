#!/bin/sh

. $HOME/.config/wms/wms_var 

RTPID=$(pgrep root-tail)    # root-tail pid
if [ -n "$RTPID" ]; then     # if pid exist
    pkill root-tail    # kill'em

else    # if not exist
    status.sh > /tmp/status    # create file
    root-tail --noflicker --shade -g 1280x25+0+0 -color "#$AC" -font '-b&h-*-medium-r-*-*-20-*-*-*-*-*-*-*' /tmp/status -reload 4 'status.sh >  /tmp/status'    # launch root-tail
    rm /tmp/status    # rm file 

fi

