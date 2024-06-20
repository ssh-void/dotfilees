#/bin/sh

HELP="ffmpegcleaner.sh <original_file> <clean_file>"

case $1 in
    -h)
	echo $HELP
	;;
    *)
	ffmpeg -i "$1" -map 0 -map_metadata -1 -c:v copy -c:a copy -c:s copy "/tmp/ffmpegcleaner_$1" &&
	ffmpeg -i "/tmp/ffmpegcleaner_$1" -c copy -fflags +bitexact -flags:v +bitexact -flags:a +bitexact -flags:s +bitexact $2
	;;
esac

