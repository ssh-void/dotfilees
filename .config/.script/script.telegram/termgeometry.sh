#!/bin/sh

FW=$(pfw)
RW=$(wattr w $(lsw -r))     # root width
RH=$(wattr h $(lsw -r))     # root height
FWW=$(wattr w $FW)          # focused window width
FWH=$(wattr h $FW)          # focused window height
CENTERX=$(((RW - FWW) / 2)) # center xcalcuate
CENTERY=$(((RH - FWH) / 2)) # center y calculate

wtp $CENTERX $CENTERY $FWW $FWH $FW # center the window

columns=$(tput cols) # terminal columns
rows=$(tput lines)   # terminal rows
xoff=$(wattr x $FW)  # terminal xoff
yoff=$(wattr y $FW)  # terminal yoff

# print the output
printf "

-g ${columns}x${rows}+${xoff}+${yoff}

"
