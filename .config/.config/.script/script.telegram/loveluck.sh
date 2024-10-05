#!/bin/sh

LUCK=$(shuf -i 0-1 -n 1)

case $LUCK in
0)
	echo "I hate you! :("
	;;
1)
	echo "I love you :)"
	;;
esac
