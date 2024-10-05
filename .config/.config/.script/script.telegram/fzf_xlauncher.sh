#!/bin/bash

export FZF_DEFAULT_OPTS='--height 60% --color gutter:#224528,bg+:#4b6983,fg+:#000000,hl:#4b6983,hl+:#cc0000'

xterm -name xlauncher -g 60x10+300+280 -e bash -c 'cmd=$(compgen -c | sort -u | grep -v fzf | fzf); setsid -f $cmd'
