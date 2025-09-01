#!/bin/sh

. $HOME/.config/wms/wms_var

MENU=$(echo "documentos\nimágenes\nmúsica\nvídeos" | $XMENU)
case $MENU in
documentos)
	filter=".pdf"
	;;
imágenes)
	filter=".png|.jpg|.jpeg"
	;;
música)
	filter=".mp3|.flac|.wav|.ogg|.webm"
	;;
vídeos)
	filter=".mp4|.avi|.mkv"
	;;
esac

if [ -n "$filter" ]; then
	filepath=$(find $HOME -type f | grep -E "$filter" | $XMENU_XL)
	filename=$(basename $filepath)
	curl --upload-file "$filepath" https://transfer.sh/"$filename" | xclip
	xclip -o | xclip -sel c
fi
