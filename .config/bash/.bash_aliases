# -------------------------------------------------------------------------------------- #
# --------------------------------->      vim       <----------------------------------- #
# -------------------------------------------------------------------------------------- #
set -o vi
set editing-mode vi
set keymap vi

# -------------------------------------------------------------------------------------- #
# ----------------------------------->     XBPS-*     <--------------------------------- #
# -------------------------------------------------------------------------------------- #
alias qi="xbps-query -vs"
alias q="xbps-query -Rs"
alias u="doas xbps-install -S && doas xbps-install -u xbps && doas xbps-install -Su"
alias i="doas xbps-install -Su"
alias c="doas xbps-remove -RoO && doas vkpurge rm all"
alias d="doas xbps-remove -Rv"
alias pkgxbps="doas xbps-reconfigure -fa"
alias manxbps="man /opt/void-packages/./xbps-src"

# -------------------------------------------------------------------------------------- #
# ---------------------------------->     runit     <----------------------------------- #
# -------------------------------------------------------------------------------------- #
alias svart="doas sv restart "
alias svtus="doas sv status "
alias rvdown="doas sv down "
#alias svup="doas sv up "
#alias svtop="doas sv stop "

# --------------------------------------------------------------------------------------- #
# --------------------------------->     Other     <------------------------------------- #
# --------------------------------------------------------------------------------------- #
alias vsxh="vim ~/.config/sxhkd/sxhkdrc"
alias uuidl="ls -l /dev/disk/by-uuid/"
alias font="fc-list : family | sort | uniq"
alias rsynccpp="rsync -rvphWP --info=progress2"
alias dtouch="doas touch"
alias img="nsxiv"
alias sxhkdreload="pkill -USR1 -x sxhkd"
alias transmissionreload="pkill -HUP transmission-daemon"
alias taillog="tail -n 5 -v -f "
alias fr="free -h"
alias echo='echo -e'
alias qemux8664="qemu-system-x86_64"
alias vscode="code-oss --disable-gpu --log off . 2> /dev/null"

# --------------------------------------------------------------------------------------- #
# ---------------------------------->     log ...    <----------------------------------- #
# --------------------------------------------------------------------------------------- #
alias xx='exit'
alias blkidl="doas blkid -o list"
alias lsblkl=" lsblk -rno size,name,label,mountpoint,fstype,uuid"
alias pw='bash -c '"'"'echo `tr -dc $([ $# -gt 1 ] && echo $2 || echo "A-Za-z0-9") < /dev/urandom | head -c $([ $# -gt 0 ] && echo $1 || echo 30)`'"'"' --'
alias logk="doas dmesg --clear &&  doas dmesg --ctime --follow"
alias pls='doas $(fc -ln -1)' # Runs the last command with doas
alias perms="doas chmod 664"
alias chownuser="doas chown -R $(whoami):$(whoami) ."
alias h='history | cut -c 8- | tac | fzy -l 20 | xclip -selection clipboard'
alias xp="xclip -selection clipboard"
alias fontlist="fc-list : family | sort | uniq"
alias sb="source $HOME/.bashrc ; source $HOME/.profile ; source $HOME/.bash_profile"
alias sz="source $HOME/.config/zsh/.zshrc ; source $HOME/.profile ; source $HOME/.bash_profile"
alias vimaliases='nvim ~/.config/bash/.bash_aliases'
alias vimfunc='nvim ~/.config/bash/.bash_function'
alias zconf='nvim $HOME/.config/zsh/.zshrc'
alias bconf='nvim $HOME/.bashrc'
alias vimsh='nvim $(find . -name "*.sh")'
alias vimex='nvim $(find . -type f -executable)'
alias bmpsc='maim -s -c 0.2706,0.2510,0.2392,1.0 -n 2 -b 2 -f bmp'
#alias screenshot='scrot -q 100 '%Y-%m-%d_%H-%M-%S.png' -e 'mv $f ~/Images''
#alias nf='clear && fastfetch -s 'Title:OS:Host:Kernel:Packages:Uptime:Break:WM:Shell:Terminal:Break:CPU:GPU:CPUUsage:Memory:Swap:LocalIp:Break:Display:Disk:Break:Colors' --packages-disabled 'nix' --color-keys 'red' --color-title 'cyan' --title-color-user 'green' --logo-color-1 'blue' --logo-color-2 'white''
alias nf='clear && neofetch --colors 4 6 1 3 7 5'
alias wcl='wc -l'

# --------------------------------------------------------------------------------------- #
# --------------------------------->     cp mv ...    <---------------------------------- #
# --------------------------------------------------------------------------------------- #
alias rm="rm -vI"
alias drm="rm -rf"
alias rmyt='rm *.m4a-Frag* ; rm *.mp4.* ; rm *.aria2 ; rm *.mp4-*'
alias mv='mv -iv'
alias dcp='doas cp -iv'
alias dmv='doas mv -iv'
alias mkdir="mkdir -pv"
alias cp='cp -iv'
alias cal="cal --twelve"
alias cl="clear"
alias m="man"
alias cloc="cloc --timeout 0"
vf() { nvim $(find ~/ /usr/ /etc/ /media/ -type f 2> /dev/null | fzy -l 20 -q "$1") ; }

# --------------------------------------------------------------------------------------- #
# --------------------------------->     ls & eza     <---------------------------------- #
# --------------------------------------------------------------------------------------- #
alias l="ls -Flh --color=always --group-directories-first"  # long format
alias ll="ls -Fh -dlg .* --group-directories-first --color=auto 2> /dev/null"
alias lls="ls -Fa --color=auto --group-directories-first"
alias ls="ls --color=auto --group-directories-first"
alias ld="ls --color=auto -d */ && ls --color=auto -d .*/ &> /dev/null "
alias lsgrep='ls -l | grep -i'
# eza (color icons ...)
#alias l="eza -Fl --color=always --group-directories-first"  # long format
#alias li="eza -Fl --color=always --group-directories-first --icons" # long format with icons
#alias ll="eza -F -dlg .* --group-directories-first --color=auto 2> /dev/null"

# --------------------------------------------------------------------------------------- #
# --------------------------------->      neovim      <---------------------------------- #
# --------------------------------------------------------------------------------------- #
alias v="nvim" vim="nvim" vi="nvim"
alias dvi='doas nvim' dvim='doas nvim' dv='doas nvim'
alias pdf="zathura "
alias ppt="loimpress "
alias word="lowriter "
alias exel="localc "
alias tldr="tealdeer"

# --------------------------------------------------------------------------------------- #
# --------------------------------->     shutdown     <---------------------------------- #
# --------------------------------------------------------------------------------------- #
alias pweroff="doas shutdown -P now"
alias rboot="doas shutdown -r now"
alias tfi="doas shutdown -h"

# --------------------------------------------------------------------------------------- #
# --------------------------------->     Archives     <---------------------------------- #
# --------------------------------------------------------------------------------------- #
alias lzip="unzip -l "
alias ltar="tar -ztvf "
alias lxz="tar -Jtvf "
alias cxz="tar -cvJf "
alias ctar="tar -cvzf "
alias czip="zip -r "
alias lrar="unrar l "
alias l7z="7z l"

# --------------------------------------------------------------------------------------- #
# --------------------------------->     android     <----------------------------------- #
# --------------------------------------------------------------------------------------- #
alias adbrootshell="adb root && sleep 2 && adb remount && sleep 2 && adb shell "

# --------------------------------------------------------------------------------------- #
# --------------------------------->       cd        <----------------------------------- #
# --------------------------------------------------------------------------------------- #
alias cd-='cd -'
alias cd..='cd ..'
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias cf='cd "$(find ~/ -type d -not -path "*/\.*" 2> /dev/null | fzy -l 25)"'

# --------------------------------------------------------------------------------------- #
# --------------------------------->      tree       <----------------------------------- #
# --------------------------------------------------------------------------------------- #
alias treed="tree -d -h --du "
alias treef="tree -i -f -s -h "
alias treesh='tree -P "*.sh" --prune -s -h '
alias trees="tree -s -h --du -a "

# --------------------------------------------------------------------------------------- #
# ---------------------------------->      du       <------------------------------------ #
# --------------------------------------------------------------------------------------- #
alias T='du -sh'
alias duf='du -sh * '
alias usage='du -d 1 -h | sort -rh '
alias duone='du -h --max-depth=1 '
alias disk='doas du -h --max-depth=1 ~/ | sort -rh '
alias ncduhome='ncdu --one-file-system --exclude-caches --si --show-hidden --show-graph --show-percent --disable-delete --fast-ui-updates ~/'

# --------------------------------------------------------------------------------------- #
# ------------------------------>     net wifi ...     <--------------------------------- #
# --------------------------------------------------------------------------------------- #
alias pingvoid='ping -c 5 voidlinux.org'
alias ssgrep='doas ss -atpu | grep -i'
alias myip='curl -s -m 5 --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0" https://ipleak.net/json/ | jq "{Country: .country_name, Region: .region_name, Continent: .continent_name, City: .city_name, TimeZone: .time_zone, IP: .query_text}"'
alias myiptor='curl --socks5-hostname 127.0.0.1:9050 -s -m 5 --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0" https://ipleak.net/json/ | jq "{Country: .country_name, Region: .region_name, Continent: .continent_name, City: .city_name, TimeZone: .time_zone, IP: .query_text}"'
alias wifilist="nmcli device wifi list | more"
alias wifitus="nmcli device status"
alias wifishow="nmcli connection show | more"
alias wifiup="doas nmcli con up "
alias wifiwn="doas nmcli con down "
alias ttor='curl -X POST --socks5-hostname 127.0.0.1:9050 -s --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0" https://check.torproject.org/api/ip | jq -r '.IsTor''
alias curltor='curl --socks5-hostname 127.0.0.1:9050 -L -O --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0" --progress-bar -C - '
alias curll='curl --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0" -L -O --progress-bar -C - '
alias xmr='curl --socks5-hostname 127.0.0.1:9050 rate.sx/xmr'
alias wgetall='wget --user-agent="Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0" -r -np -nH --cut-dirs=1 -R index.html '
alias  ariacjxsk="aria2c -c -j 5 -x 3 -s 10 -k 5M"
alias vimfirefox='vim "/tmp/firefox$(date +%Y-%m-%d_%I-%M_%p).txt"'
#alias darknet='torsocks w3m -o auto_image=FALSE .w3m/bookmark.html'
#alias torrent="aria2c --follow-torrent=mem --seed-time=0 -j 10"

# --------------------------------------------------------------------------------------- #
# --------------------------------->     tmux     <-------------------------------------- #
# --------------------------------------------------------------------------------------- #
#alias ta="tmux a"
alias vimtmux='vim ~/.config/tmux/tmux.conf'
alias tmuxreload='tmux source-file ~/.config/tmux/tmux.conf && echo "tmux.conf is reloaded"'
alias tmsl='tmux list-sessions'
#alias tmsgo='tmux attach-session -t'
alias tmkill='tmux kill-server'

# --------------------------------------------------------------------------------------- #
# -------------------------------->     yt-dlp     <------------------------------------- #
# --------------------------------------------------------------------------------------- #
alias yl='yt-dlp -F '
alias yltor='torsocks yt-dlp -F '
alias yv='yt-dlp --config-locations $HOME/.config/yt-dlp/yv.conf --restrict-filenames '
alias yvc='yt-dlp --config-locations $HOME/.config/yt-dlp/yvc.conf '
alias yvp='yt-dlp --config-locations $HOME/.config/yt-dlp/yvp.conf '
alias yvpc='yt-dlp --config-locations $HOME/.config/yt-dlp/yvpc.conf '
alias yaria='yt-dlp --config-locations $HOME/.config/yt-dlp/yaria.conf '
alias yariac='yt-dlp --config-locations $HOME/.config/yt-dlp/yariac.conf '
alias yariap='yt-dlp --config-locations $HOME/.config/yt-dlp/yariap.conf '
alias yvtik='yt-dlp --config-locations $HOME/.config/yt-dlp/yvtik.conf '
alias yu='yt-dlp --config-locations $HOME/.config/yt-dlp/yu.conf '
alias yvtor='yt-dlp --config-locations $HOME/.config/yt-dlp/yvtor.conf '
alias ysplit='yt-dlp --config-locations $HOME/.config/yt-dlp/ysplit.conf '
alias ya='yt-dlp --config-locations $HOME/.config/yt-dlp/ya.conf '
alias yac='yt-dlp --config-locations $HOME/.config/yt-dlp/yac.conf '
alias yap='yt-dlp --config-locations $HOME/.config/yt-dlp/yap.conf '
alias yapc='yt-dlp --config-locations $HOME/.config/yt-dlp/yapc.conf '
alias ytsupport='yt-dlp --list-extractors | grep -i '
alias yt='yt-dlp --skip-download --write-thumbnail '
alias yvlimit='yt-dlp --config-locations $HOME/.config/yt-dlp/yvlimit.conf'
alias yturl='torsocks yt-dlp -g --skip-download'
alias yvfscalecodec='yt-dlp --config-locations $HOME/.config/yt-dlp/yvfscalecodec.conf'

# --------------------------------------------------------------------------------------- #
# ------------------------------->     mpv & vlc     <----------------------------------- #
# --------------------------------------------------------------------------------------- #
alias mpvtormp3='torsocks mpv --no-config --no-video --af-add="volume=2" --term-osd-bar --ytdl-format="ba*[ext=m4a]/ba*/b[ext=mp4]/b" --loop=inf --user-agent="Mozilla/5.0 (X11; Linux x86_64; rv:139.0) Gecko/20100101 Firefox/139.0" --input-conf=<(echo -e "UP add speed 0.1\nDOWN add speed -0.1")'
alias mpvmp3='mpv --no-config --no-video --af-add="volume=2" --term-osd-bar --ytdl-format="ba*[ext=m4a]/ba*/b[ext=mp4]/b" --loop=inf --user-agent="Mozilla/5.0 (X11; Linux x86_64; rv:139.0) Gecko/20100101 Firefox/139.0" --input-conf=<(echo -e "UP add speed 0.1\nDOWN add speed -0.1")'
alias vlcnv="prime-run vlc "
alias mpvnv="prime-run mpv "
alias fvlc='vlc "$(find /home/${USER}/Videos/ -type f -name "*.mp4" | fzy)" 2> /dev/null'

# --------------------------------------------------------------------------------------- #
# ------------------------------->      ffmpeg       <----------------------------------- #
# --------------------------------------------------------------------------------------- #
#alias ffmpeg='ffmpeg —hide_banner'
#alias ffplay='ffplay —hide_banner'
#alias ffprobe='ffprobe -hide_banner'
alias ffmpegcodel='ffmpeg -encoders | grep -i'
alias ffmpegprotocol='ffmpeg -protocols | grep -i'

# --------------------------------------------------------------------------------------- #
# ------------------------------>      suckless       <---------------------------------- #
# --------------------------------------------------------------------------------------- #
alias rmsuckless="doas rm *.o ; doas rm *.orig ; doas rm *.rej ; doas rm config.h ; make clean"
alias makesuckless="doas make -s -j 4 && doas make -s clean install"

# --------------------------------------------------------------------------------------- #
# ------------------------------>      python        <----------------------------------- #
# --------------------------------------------------------------------------------------- #
alias py="python3"
alias apy="source /home/${USER}/.local/share/tools/env/bin/activate"
alias ve="python3 -m venv"
alias vd="deactivate"
alias pipi="pip install"
alias pipuni="pip uninstall"
alias pipls="pip list"
alias pipshow="pip show"
alias pipout="pip list --outdated"
alias pipreq="pip freeze > requirements.txt"
alias pipfrom="pip install -r requirements.txt" # -r , --requirement
alias pipup="pip install --upgrade pip " # -U, --upgrade

# ----------------------------------------------------------------------------------------#
# --------------------------------------- ssh --------------------------------------------#
# ----------------------------------------------------------------------------------------#
alias ppicom='pkill -f picom'
alias psxhkd='pkill -f sxhkd'
alias rpi="ssh -tX pi@raspberrypi"
alias ufwl="doas ufw status numbered"
alias ufwr="doas ufw reload"
alias ufws="doas ufw status verbose"
alias nvop="nvidia-settings -q all | grep -i "
alias nvidiawatch='watch -n 1 nvidia-smi'
alias uzsh="zsh -i -c 'omz update'"

# ----------------------------------------------------------------------------------------#
# --------------------------------------- git --------------------------------------------#
# ----------------------------------------------------------------------------------------#
alias gitp="git clean -fd && git reset --hard && git pull"
alias gita="git add * && git add ."
alias gcommitfirst='git log --reverse --format="%ad" --date=iso | head -n 1'
alias gnombrecommit='git rev-list --count ' # gnombrecommit branchnume
gmailcommit() { git log --oneline --graph --decorate --author="$1"; }

# ----------------------------------------------------------------------------------------#
# ------------------------------------- gtts-cli -----------------------------------------#
# ----------------------------------------------------------------------------------------#
alias gttsFrslow="gtts-cli -l fr --slow --file"
alias gtttsFrnormal="gtts-cli -l fr --file"
alias gttsEnlow="gtts-cli -l en --slow --file"
alias gttsEnnormal="gtts-cli -l en --file"

