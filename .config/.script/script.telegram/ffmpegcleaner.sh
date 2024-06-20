#/bin/sh

HELP="ffmpegcleaner.sh <original_file> <clean_file>"

case $1 in
    -h)
	echo $HELP
	;;
    *)
	ffmpeg -i "$1" -map_metadata -1 -c:v copy -c:a copy -fflags +bitexact -flags:v +bitexact -flags:a +bitexact "$2"
	;;
esac

