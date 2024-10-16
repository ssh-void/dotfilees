-c -r -v --show-progress --restrict-file-extension=unix--ignore-errors --verbose  --no-warnings  --no-mtime --no-part --quiet --external-downloader aria2c --external-downloader-args '-c -j 5 -x 5 -s 10 -k 1M' --prefer-ffmpeg --sponsorblock-remove default --retries 20 --retry-sleep exp=1:20 --geo-bypass --embed-thumbnail --embed-metadata --write-auto-sub --sub-lang 'en.*,fr.*,ar.*' -f "bv[ext=mp4]+ba[ext=m4a]/bv+ba" --cookies '/storage/emulated/0/seal/cookies.txt' -o "/storage/emulated/0/seal/seal-video/%(title).50s.%(ext)s" --merge-output-format mp4
--no-abort-on-error
--cookies "F:\mpv\cookies.txt"
--downloader-args ffmpeg:"-loglevel warning -stats" 
yt-dlp --ignore-errors --verbose --no-warnings --no-mtime --no-part --quiet --external-downloader aria2c --external-downloader-args '-c -j 5 -x 5 -s 10 -k 1M ' --prefer-ffmpeg --sponsorblock-remove default --retries 20 --retry-sleep exp=1:20 --geo-bypass --geo-bypass-country US --embed-thumbnail --embed-metadata --write-auto-sub --sub-lang 'en.*,fr.*,ar.*' --write-subs --convert-subs srt --no-abort-on-error --paths home:"/tmp/ytdl/" --paths temp:"/tmp/ytdl/tmp/" --extractor-retries 4 --file-access-retries 4 --fragment-retries 4 --retry-sleep extractor:exp=4 --retry-sleep file_access:exp=4 --retry-sleep fragment:exp=4 --retry-sleep http:exp=4 --retry-sleep exp=4 --force-ipv4 --buffer-size 1M --concurrent-fragments 4 --http-chunk-size 10M --socket-timeout 4 --live-from-start --windows-filenames --restrict-filenames --merge-output-format mp4/mkv --remux-video webm>mkv/ogg>mkv/mkv>mkv/mp4>mp4 --convert-thumbnails jpg>jpg/png --audio-multistreams --video-multistreams --check-formats --embed-chapters --sponsorblock-mark all -f "bv[ext=mp4]+ba[ext=m4a]/bv+ba" --cookies '/storage/emulated/0/seal/cookies.txt' -o "/storage/emulated/0/seal/seal-video/%(title).50s.%(ext)s"
yt-dlp -i -v --no-warnings --no-mtime --no-part --external-downloader aria2c --external-downloader-args '-c -j 5 -x 5 -s 10 -k 1M' --prefer-ffmpeg --sponsorblock-remove default --retries 20 --retry-sleep exp=1:20 --geo-bypass --geo-bypass-country US --embed-thumbnail --embed-metadata --write-auto-sub --sub-lang 'en.*,fr.*,ar.*' --write-subs --convert-subs srt --no-abort-on-error --paths temp:"/tmp/ytdl/tmp/" --retry-sleep --extractor-retries 4 --file-access-retries 4 --fragment-retries 4 --retries 4 --retry-sleep extractor:exp=4 --retry-sleep file_access:exp=4 --retry-sleep fragment:exp=4 --retry-sleep http:exp=4 --retry-sleep exp=4 --force-ipv4 --buffer-size 1M --concurrent-fragments 4 --http-chunk-size 10M --socket-timeout 4 --live-from-start --restrict-filenames --merge-output-format mp4/mkv --remux-video webm>mkv/ogg>mkv/mkv>mkv/mp4>mp4 --convert-thumbnails jpg>jpg/png --audio-multistreams --video-multistreams --check-formats --embed-chapters --sponsorblock-mark all -f "bv+ba" --cookies '/storage/emulated/0/seal/cookies.txt' -o "/storage/emulated/0/seal/seal-video/%(title).50s.%(ext)s"

------------------------------------------------------------------------------------------------------------------------------
#yv
--ignore-errors --ignore-config --force-ipv4 --geo-bypass-country US --verbose --no-warnings --no-mtime --no-part --no-embed-info-json --prefer-ffmpeg 
--external-downloader aria2c --external-downloader-args "-c -j 5 -x 5 -s 10 -k 1M --dns-server=8.8.8.8,8.8.4.4" 
--sponsorblock-mark all --sponsorblock-remove all
--no-abort-on-error --retries 20 --retry-sleep exp=1:20 
--embed-thumbnail --embed-chapters --embed-metadata 
--sub-format "ass/srt/best" --write-subs --write-auto-sub --sub-lang "en.*,fr.*,ar.*" --convert-subs srt 
-f "bv[ext=mp4]+ba[ext=m4a]/bv+ba" --cookies "/storage/emulated/0/seal/cookies.txt" -o "/storage/emulated/0/seal/seal-video/%(title).50s.%(ext)s" 
--merge-output-format mp4 
-------------------------------------------------------------------------------------------------------------------------------------
--ignore-errors --verbose  --no-warnings  --no-mtime --no-part --no-abort-on-error  --downloader 'dash,m3u8:native' --external-downloader aria2c --external-downloader-args '-c -j 5 -x 5 -s 10 -k 1M' --prefer-ffmpeg --sponsorblock-remove default --retries 20 --retry-sleep exp=1:20 --geo-bypass --embed-thumbnail --embed-metadata --sub-format ass/srt/best --write-auto-sub --sub-lang 'en.*,fr.*,ar.*'  -f "bv[ext=mp4]+ba[ext=m4a]/bv+ba" --cookies '/storage/emulated/0/seal/cookies.txt' --paths temp="/tmp" -o "/storage/emulated/0/seal/seal-video/%(title).50s.%(ext)s" --merge-output-format mp4 
--downloader-args ffmpeg:"-loglevel warning -stats" --force-ipv4 --geo-bypass --geo-bypass-country US --write-subs --convert-subs srt 
------------------------------------------------------------------------------------------------------------------------------
#yvp
--ignore-errors --ignore-config --force-ipv4 --geo-bypass-country US --verbose --no-mtime --no-part --no-embed-info-json --prefer-ffmpeg 
--external-downloader aria2c --external-downloader-args "-c -j 5 -x 5 -s 10 -k 1M" 
--sponsorblock-mark all --sponsorblock-remove all
--no-abort-on-error --retries 20 --retry-sleep exp=1:20 
--embed-thumbnail --embed-chapters --embed-metadata 
--sub-format "ass/srt/best" --write-subs --write-auto-sub --sub-lang "en.*,fr.*,ar.*" --convert-subs srt 
-f "bv[ext=mp4]+ba[ext=m4a]/bv+ba" --cookies "/storage/emulated/0/seal/cookies.txt" -o "/storage/emulated/0/seal/seal-video/%(title).50s.%(ext)s" 
--merge-output-format mp4 
---------------------------------------------------------
#--write-subs --convert-subs srt == --write-srt not wored
--sponsorblock-mark all --sponsorblock-remove all
--no-abort-on-error
--retries 20
--retry-sleep exp=1:20
--embed-chapters
########################################################################################
--remux-video mp4
--merge-output-format mp4 
--recode-video "mp4" 
########################################################################################
--use-postprocessor "FFmpegSubtitlesConvertor:when=post_process;format=srt"
#Metadata
--write-info-json
--clean-info-json
------------------------------------------------------------
--write-comments
--extractor-args "youtube:comment_sort=top;max_comments=60,30,2,2"
#""""""""""""""""""""""""streaming"""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""
--ignore-errors --ignore-config --force-ipv4 --geo-bypass-country US --verbose --no-mtime --no-part --no-embed-info-json --prefer-ffmpeg --external-downloader aria2c --external-downloader-args "-c -j 5 -x 5 -s 10 -k 1M" --sponsorblock-mark all --sponsorblock-remove all --no-abort-on-error --retries 20 --retry-sleep exp=1:20 --embed-thumbnail --embed-chapters --embed-metadata --sub-format "ass/srt/best" --write-subs --write-auto-sub --sub-lang "en,fr,ar" --convert-subs srt -f "bv[ext=mp4]+ba[ext=m4a]/bv+ba" -o "/storage/emulated/0/seal/seal-video/%(title).70s.%(ext)s" --merge-output-format mp4
"""""""""""""""""
--buffer-size 1M (by defaulte)
yt-dlp --hls-prefer-ffmpeg --downloader "m3u8:ffmpeg" -f "bv+ba" --buffer-size 1M --no-abort-on-error --retries 20 --retry-sleep exp=1:20 --cookies "/storage/emulated/0/seal/cookies.txt" -o "/storage/emulated/0/seal/seal-video/%(title).50s.%(ext)s"
--------------------------------
---------------------------------------------------------------------------------------------------------------------------

--ignore-errors --ignore-config --force-ipv4 --geo-bypass-country US --no-warnings --no-mtime --no-part --no-embed-info-json --prefer-ffmpeg --sponsorblock-mark all --sponsorblock-remove all --no-abort-on-error --retries 20 --retry-sleep exp=1:20 --embed-thumbnail --embed-chapters --embed-metadata --sub-format "ass/srt/best" --write-subs --write-auto-sub --sub-lang "en,fr,ar" --convert-subs srt -f "bv[ext=mp4]+ba[ext=m4a]/bv+ba" --merge-output-format mp4 
-------------------------------------

--external-downloader aria2c --external-downloader-args="--conf-path=/storage/emulated/0/seal/aria2.conff"

"/storage/emulated/0/seal/cookies.txt"

yflac
yt-dlp -i --no-mtime --no-part --quiet --embed-thumbnail --no-warnings --sponsorblock-remove default --downloader aria2c --external-downloader-args aria2c:'-c -j 3 -x 3 -s 3 -k 1M'  -o "/storage/emulated/0/seal/seal-audio/%(title).50s.%(ext)s" -x --audio-format flac
ypfalc
yt-dlp -i --no-mtime --no-part --quiet --yes-playlist --embed-thumbnail --no-warnings --sponsorblock-remove default --downloader aria2c --external-downloader-args aria2c:'-c -j 3 -x 3 -s 3 -k 1M'  -o "/storage/emulated/0/seal/seal-audio/%(playlist_title)s/%(playlist_index)s - %(title).50s.%(ext)s" -x --audio-format flac   


yt-dlp --config-locations "/home/hassan/.config/yt-dlp/yv.conf" 
yt-dlp -i --no-mtime --no-part --quiet --yes-playlist --embed-thumbnail --no-warnings --sponsorblock-remove default --external-downloader aria2c --external-downloader-args aria2c:'-c -j 5 -x 5 -s 10 -k 1M' --perfer-ffmpeg --embed-metadata --embed-subs --write-auto-sub --sub-lang en.*,fr.*,ar.*  -o "/storage/emulated/0/seal/seal-video/%(playlist_title)s/%(playlist_index)s - %(title).50s.%(ext)s" --merge-output-format mp4
--yes-playlist --ignore-errors --ignore-config --force-ipv4 --geo-bypass-country US --no-warnings --no-mtime --no-part --no-embed-info-json --prefer-ffmpeg --external-downloader aria2c --external-downloader-args="--conf-path=/storage/emulated/0/seal/aria2.conff" --downloader-args ffmpeg:"-loglevel warning -stats" --sponsorblock-mark all --sponsorblock-remove all --no-abort-on-error --retries 20 --retry-sleep exp=1:20 --embed-thumbnail --embed-chapters --embed-metadata --sub-format "ass/srt/best" --write-subs --write-auto-sub --sub-lang "en.*,fr.*,ar.*" --convert-subs srt -o "/storage/emulated/0/seal/seal-video/%(playlist_title)s/%(playlist_index|3)03d - %(title).70s.%(ext)s" 

--ignore-errors --ignore-config --force-ipv4 --geo-bypass-country US --no-warnings --no-mtime --no-part --no-embed-info-json --prefer-ffmpeg --external-downloader aria2c --external-downloader-args="--conf-path=/storage/emulated/0/seal/aria2.conff" --downloader-args ffmpeg:"-loglevel warning -stats" --sponsorblock-mark all --sponsorblock-remove all --no-abort-on-error --retries 20 --retry-sleep exp=1:20 --embed-thumbnail --embed-chapters --embed-metadata --sub-format "ass/srt/best" --write-subs --write-auto-sub --sub-lang "en.*,fr.*,ar.*" --convert-subs srt -o "/storage/emulated/0/seal/seal-audio/%(title).70s.%(ext)s" -x --audio-format flac --audio-quality 0 
--concat-playlist always --recode-video "mp4" --ignore-errors --ignore-config --force-ipv4 --geo-bypass-country US --no-warnings --no-mtime --no-part --no-embed-info-json --prefer-ffmpeg --external-downloader aria2c --external-downloader-args="--conf-path=/storage/emulated/0/seal/aria2.conff" --downloader-args ffmpeg:"-loglevel warning -stats" --sponsorblock-mark all --sponsorblock-remove all --no-abort-on-error --retries 20 --retry-sleep exp=1:20 --embed-thumbnail --embed-chapters --embed-metadata 
-----------------------------
#--cookies /path/to/cookies. txt
--cookies-from-browser firefox
--ignore-errors
--continue
--no-overwrites
--download-archive archive.txt
--ignore-config 
--force-ipv4 
--geo-bypass-country US 
# --verbose
--progress
--no-warnings
--no-mtime 
--no-part 
--no-embed-info-json 
--prefer-ffmpeg 
--sponsorblock-mark all 
--sponsorblock-remove all 
--no-abort-on-error 
--retries 20 --retry-sleep exp=1:20 
--embed-thumbnail --embed-chapters --embed-metadata 
--sub-format "ass/srt/best" --write-subs --write-auto-sub --sub-lang "en,fr,ar" --convert-subs srt
--restrict-filenames
--sponsorblock-mark all 
--sponsorblock-remove all 
--external-downloader aria2c 
--external-downloader-args="--conf-path=/home/hassan/.config/aria2/aria2.conff"
--downloader-args ffmpeg:"-loglevel warning -stats"
-o "/home/hassan/Downloads/yt-dlp/video/%(title).70s.%(ext)s"
-f "bv+ba" 
--merge-output-format mp4 
