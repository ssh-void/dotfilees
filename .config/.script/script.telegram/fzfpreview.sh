#!/bin/sh

entry=$1
FNAME=$(basename "$entry")
ext="${FNAME##*.}"
if [ -n "$ext" ]; then
	ext="$(printf "%s" "${ext}" | tr '[:upper:]' '[:lower:]')"
fi

case "${ext}" in
## Archive
a | ace | alz | arc | arj | bz | bz2 | cab | cpio | deb | gz | jar | lha | lz | lzh | lzma | lzo | \
	rpm | rz | t7z | tar | tbz | tbz2 | tgz | tlz | txz | tZ | tzo | war | xpi | xz | Z | zst | zip | rar | 7z)
	cat "$entry"
	exit 0
	;;
## Audio
aac | flac | m4a | mid | midi | mpa | mp2 | mp3 | ogg | wav | wma)
	ffprobe "$entry"
	exit 1
	;;
## Video
avi | mkv | mp4 | gif)
	ffprobe "$entry"
	exit 1
	;;
## Image
png | jpg | jpeg | PNG | JPG | JPEG | svg)
	chafa -c full -s 40x40 "$entry"
	exit 1
	;;
## log files
log)
	less "$entry"
	exit 0
	;;
## plain text
*)
	cat "$entry"
	exit 0
	;;
esac
