#!/bin/sh

. $HOME/.nextcloud_data 

help() {
    echo "syntax: --------------------------------------------------------------------------
    	  nextcurl.sh  <flag> <path_to_remote_file/folder> <name_of_the_download/upload_file>
	  --------------------------------------------------------------------------"
    echo "options:
       	  -u	updoad file.
    	  -d 	download file.
    	  -c 	create folder.
    	  -r    delete folder.
    	  -l    list files in folder.
	  -L	list folders.
    	  -h    print help.
	  -----------------------------------------------"
}

echo "________________________________________________________________________________"

case $1 in
    -d)
	curl -X GET -u $USER:$PASS $URL/remote.php/dav/files/$USER/$2 --output $3
	;;
    -u)
	curl -X PUT -u $USER:$PASS $URL/remote.php/dav/files/$USER/$2 -T $3
	;;
    -c)
	curl -X MKCOL -u $USER:$PASS $URL/remote.php/dav/files/$USER/$2
	;;
    -r)
	curl -X DELETE -u $USER:$PASS $URL/remote.php/dav/files/$USER/$2
	;;
    -l)
	curl -X PROPFIND -u $USER:$PASS $URL/remote.php/dav/files/$USER/$2 | sed 's/<\//\n/g' | grep $USER | sed "s/${USER}/ /g" | cut -d ' ' -f 2
	;;
    -L)
	curl -X PROPFIND -u $USER:$PASS $URL/remote.php/dav/files/$USER | sed 's/<\//\n/g' | grep $USER | sed "s/${USER}/ /g" | cut -d ' ' -f 2
	;;
    -h)
	help
	;;
esac
