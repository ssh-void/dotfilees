#! /bin/sh

entry="$1"
FNAME=$(basename "$entry")
ext="${FNAME##*.}"
if [ -n "$ext" ]; then
    ext="$(printf "%s" "${ext}" | tr '[:upper:]' '[:lower:]')"
fi

    case "${ext}"  in
        ## Archive
        a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
        rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zst|zip|rar|7z)
                extract  "$entry"
                exit 0;;

        ## PDF
        pdf)
		zathura "$entry"
            	exit 1;;

        ## Audio
        aac|flac|m4a|mid|midi|mpa|mp2|mp3|ogg|wav|wma)
            	ffplay -showmode 1 -x 600 -y 200 -autoexit "$entry"
            	exit 1;;

        ## Video
        avi|mkv|mp4|gif)
            ffplay "$entry"
            	exit 1;;
        
	## Image
        png|jpg|jpeg|PNG|JPG|JPEG|svg)
            	fim "$entry"
            	exit 1;;

        ## Log files
        log)
            	emacsclient -t --alternate-editor="" "$entry"
            	exit 0;;

        ## BitTorrent
        torrenti|magnet)
                rtorrent "$entry"
                exit 0;;

        ## OpenDocument
        odt|ods|odp|sxw)
		chromium "$entry"
                exit 0;;

        ## Markdown
        md)
                emacsclient -t --alternate-editor="" "$entry"
                exit 0;;

        ## HTML
        htm|html|xhtml)
            ## Preview as text conversion
	    	chromium "$entry"
                exit 0;;

        ## JSON
        json)
                jq --color-output . "$entry"
                exit 0 ;;
	## scripts and text
	bash|txt|py|sh)
	    emacsclient -t --alternate-editor="" "$entry"
	    exit 0;;

    esac
