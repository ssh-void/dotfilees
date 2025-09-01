#!/bin/sh

# rp_musicplayer by @root.sti

. $HOME/.wmvar

MDIR="$HOME/Música/" # music dir

INPUT=$(echo "play\nwaves\nvolume\nstop\nexit" | $XMENU)
case $INPUT in
play)
	for f in $(find $MDIR -type f | $XMENU_XL); do ffplay -showmode 1 -x 600 -y 200 -autoexit $f; done
	;;
waves)
	for f in $(find $MDIR -type f | $XMENU_XL); do
		title=$(basename $f)
		ffplay -autoexit -f lavfi "amovie="$f",asplit [a][out1];[a]showwaves=size=600x200:mode=p2p:colors=#$ACTIVE:r=50,drawtext=text='$title - %{pts\:hms}':box=1:boxborderw=5:x=(w-text_w)/2:y=h-(text_h*2):boxcolor=black@0.4:fontsize=18:font=JetBrainsMono:fontcolor=#a0a0a0[out0]"
	done
	;;
volume)
	for f in $(find $MDIR -type f | $XMENU_XL); do
		title=$(basename $f)
		ffplay -autoexit -f lavfi "amovie="$f", asplit=3[out1][asplit1][asplit2];[asplit1]showvolume=w=600:h=10:r=50:v=disable:[v0];[asplit2]showwaves=mode=p2p:size=600x200:colors=#$ACTIVE:r=30,drawtext=text='$title - %{pts\:hms}':box=1:boxborderw=5:x=(w-text_w)/2:y=h-(text_h*2):boxcolor=black@0.4:fontsize=18:font=JetBrainsMono:fontcolor=#a0a0a0[v1];[v0][v1]vstack[out0]"
	done
	;;
stop)
	pkill musicplayer.sh
	;;
exit)
	exit 0
	;;
esac
