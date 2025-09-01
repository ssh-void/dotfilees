#!/bin/sh

# this fetch was born from the search for a simpler way to get system info. Several lines and ways of doing are the product of the exchange of ideas with other users who share my convictions.
# simplefetch by @root.sti

OS=$(awk -F '"' '/PRETTY_NAME/ {print $2}' /etc/os-release)
read -r KERNEL </proc/sys/kernel/osrelease
ARCH=$(getconf LONG_BIT)
read -r HOSTNAME </etc/hostname
UPTIME=$(uptime -p)
INIT=$(if [ -f /sbin/runit ]; then echo runit; else echo openrc; fi)
CPU=$(awk -F ":" 'NR==5 {print $2}' /proc/cpuinfo)
GPU=$(lspci 2>/dev/null | awk -F ":" '/VGA/ {print $3}' | cut -c 1-62)

if [ -n "$DISPLAY" ]; then
	SCREEN=$(sed 's/,/x/' </sys/class/graphics/fb0/virtual_size)
	WE=$(xprop -root WM_NAME | cut -d\" -f 2)
else
	SCREEN=$(stty size | awk '{print $1 " rows " $2 " columns"}')
	tty=$(tty)
	WE=tty${tty##*/}
fi

MEM=$(awk '/MemFree/ {print $2/1024}' /proc/meminfo)
MEMTOTAL=$(awk '/MemTotal/ {print $2/1024}' /proc/meminfo)
SWAPTOTAL=$(awk '/SwapTotal/ {print $2/1024}' /proc/meminfo)
SWAPFREE=$(awk '/SwapFree/ {print $2/1024}' /proc/meminfo)
PKG=$(xbps-query -l | wc -l)
SHELL=$(printf '%s' "$(basename "$SHELL")")
TERMINAL=$(printf '%s' "$TERM")
FONT=$(awk -F ': ' '/faceName/ {print $2}' "$HOME"/.Xresources)

cat <<EOF
 + OS: ................ ${OS}
 + Linux Kernel: ...... ${KERNEL}-${ARCH}
 + Init: .............. ${INIT}
 + Hostname: .......... ${HOSTNAME}
 + Uptime: ............ ${UPTIME}
 + Processor (Cpu): .. ${CPU}
 + Graphics: ......... ${GPU}
 + Screen: ............ ${SCREEN}
 + Ram: ............... ${MEM}Mib / ${MEMTOTAL}Mib
 + Swap: .............. ${SWAPFREE}Mib / ${SWAPTOTAL}Mib
 + Packages: .......... ${PKG}
 + Work Environment:... ${WE}
 + Shell: ............. ${SHELL}
 + Terminal: .......... ${TERMINAL}
 + Fonts: ............. ${FONT}
EOF
