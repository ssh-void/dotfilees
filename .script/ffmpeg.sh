#!/bin/bash
# tested in 6/1/24
#python3 -m pip install https://github.com/yt-dlp/yt-dlp/archive/master.tar.gz --break-system-packages
#python3 -m pip install --force-reinstall https://github.con/yt-dlp/yt-dlp/archive/master.tar.qgz --break-system-packages
url=$1
[ -d youtube_folder ] || mkdir youtube_folder
cd youtube_folder || exit
yt-dlp -f "bv[ext=mp4]+ba[ext=m4a]/best[ext=mp4]/best" --merge-output-format mp4 "$url"
for i in *; do
   echo "file '$i'" >> list.txt
done
ffmpeg -f concat -safe 0 -i list.txt -c copy output.mp4
ls | grep -v output.mp4 | xargs -I  _ rm '_'
shopt -s extglob
rm !(output.mp4)
