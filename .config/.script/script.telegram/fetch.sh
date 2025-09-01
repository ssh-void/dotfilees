#!/bin/sh

# this fetch was born from the search for a simpler way to get system info. Several lines and ways of doing are the product of the exchange of ideas with other users who share my convictions.
# simplefetch by @root.sti

os=$(awk -F '"' '/PRETTY_NAME/ {print $2}' /etc/os-release)
read -r kernel </proc/sys/kernel/osrelease
arch=$(getconf LONG_BIT)
read -r hostname </etc/hostname
uptime=$(uptime -p)
init=$(if /sbin/openrc --version 1>/dev/null; then if /sbin/init --version 1>/dev/null; then echo sysvinit; else echo openrc; fi; fi)
cpu=$(awk -F ":" 'NR==5 {print $2}' /proc/cpuinfo)
gpu=$(lspci 2>/dev/null | awk -F ":" '/VGA/ {print $3}' | cut -c 1-56)
screen=$(xdpyinfo | grep "dimensions" | awk '{ print $2 }')
memtotal=$(awk '/MemTotal/ {print $2/1024}' /proc/meminfo)
memavailable=$(awk '/MemAvailable/ {print $2/1024}' /proc/meminfo)
swaptotal=$(awk '/SwapTotal/ {print $2/1024}' /proc/meminfo)
swapfree=$(awk '/SwapFree/ {print $2/1024}' /proc/meminfo)
pkg=$(dpkg-query -f '${binary:Package}\n' -W | wc -l)
wm=$(xprop -root _NET_WM_NAME | cut -d\" -f2)
shell=$(printf '%s' "$(basename "$SHELL")")
terminal=$(printf '%s' "$TERM")
font=$(awk -F ': ' '/faceName/ {print $2}' "$HOME"/.Xresources)

echo "
 + OS: ......................................... ${os}
 + Linux Kernel: .......................... ${kernel}-${arch}
 + Init: ........................................ ${init}
 + Hostname: .............................. ${hostname}
 + Uptime: ...................................${uptime}
 + Processor (Cpu): .................... ${cpu}
 + Graphics Processor (GPU): ..... ${gpu}
 + Screen: .................................... ${screen}
 + Ram: ....................................... $(echo ${memtotal}-${memavailable} | bc)Mib / ${memtotal}Mib
 + Swap: ...................................... $(echo ${swaptotal}-${swapfree} | bc)Mib / ${swaptotal}Mib
 + Packages: ................................ ${pkg}
 + Window Manager: .................. ${wm}
 + Shell: ...................................... ${shell}
 + Terminal: ............................... ${terminal}
 + Fonts: ..................................... ${font}
"
