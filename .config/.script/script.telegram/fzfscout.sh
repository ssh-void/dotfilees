#!/bin/sh

fzf --bind="ctrl-d:execute(rm -i {}),\
ctrl-s:execute(fileshare.sh {}),\
return:execute(vi-nuke.sh {})" \
	--preview="fzfpreview.sh {}"
