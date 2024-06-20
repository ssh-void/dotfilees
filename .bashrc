# PS1='[\u@\h \W]\$ '
# get current branch in git repo
# get current branch in git repo
# Exports:
export TERMINAL='sakura'
export TERM="xterm-256color"   # getting proper colors
export HISTCONTROL=ignoredups:erasedups   # no duplicate entries
export BROWSER='firefox'
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim +Man!"
export PATH="$HOME/.local/bin:$PATH" ### PATH
export PAGER=most
export GOPATH="$HOME/.local/go"
export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;v:imgview;u:imgur'
export NNN_FIFO='/tmp/nnn.fifo'
export IMGVIEWER='feh'
export MAKEFLAGS="-j4"

GRC_ALIASES=true
[[ -s "/etc/profile.d/grc.sh" ]] && source /etc/grc.sh

bind 'set completion-ignore-case on'
GRC_ALIASES=true

### SET VI MODE ###
# Comment this line out to enable default emacs-like bindings
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}
# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}
PS1="[\[\e[36m\]\w\[\e[m\]\[\e[35m\]\`parse_git_branch\`\[\e[m\]]$ " # officelle
#PS1='\[\e[32m\][\[\e[m\]\[\e[32m\]\d\[\e[m\] \[\e[32m\]\A\[\e[m\]\[\e[32m\]]\[\e[m\] \u@\h \w\\$ '
#PS1="\[\e[1;30m\]\W \[\e[32m\]> "
#PS1='\[\e[1;30m\]\W \[\e[0m\] '

#======================== fon =========================#
ex()
{
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"   ;;
            *.tar.gz)    tar xzf "$1"   ;;
            *.bz2)       bunzip2 "$1"   ;;
       #    *.rar)       unrar x "$1"   ;;
            *.gz)        gunzip "$1"    ;;
            *.tar)       tar xf "$1"    ;;
            *.tbz2)      tar xjf "$1"   ;;
            *.tgz)       tar xzf "$1"   ;;
            *.zip)       unzip "$1"     ;;
            *.Z)         uncompress "$1";;
            *.7z)        7za e x "$1"   ;;
            *.deb)       ar x "$1"      ;;
            *.tar.xz)    tar xf "$1"    ;;
            *.tar.zst)   unzstd "$1"    ;;
            *.img.xz)    unxz k "$1"     ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    elif [ -f "$1" ] && [[ "$1" == *.rar ]]; then
        unrar x "$1"
    else
        echo "'$1' is not a valid file"
    fi
}
#====================== alias ====================#
# XBPS:
alias q='xbps-query -Rs'
alias u='doas xbps-install -S && doas xbps-install -u xbps && doas xbps-install -Su'
alias i='doas xbps-install -S'
alias c='doas xbps-remove -RoO && doas vkpurge rm all'
alias d='doas xbps-remove'

# runit
alias start='cd /var/service/ ; doas sv start '
alias stop='doas sv stop'
alias restart='cd /var/service/ ; doas sv restart'

# Other:
alias vsxh="vim .config/sxhkd/sxhkdrc"
alias xp='xclip -selection clipboard'
alias ram="ps -ely | tr -s ' ' |cut -d ' ' -f8,13 | grep"
alias s='source ~/.bashrc'
alias rm='rm -r'
alias T='du -sh'
alias copy="rsync -P"
alias rg="ranger"
alias pp="doas poweroff"
alias rr="doas reboot"
alias ls='ls --color=auto'
alias l='ls -lh --color=auto'
alias ll='ls -dlh .* --color=auto'
alias v='nvim'
alias vi='nvim'
alias ipq="ip -f inet address | grep inet  | grep -v 'lo$' | cut -d ' ' -f 6,13 && curl ifconfig.me && echo ' external ip'"
#git
alias gs='git status'
alias gp='git push origin'
alias gpull="git pull origin"
alias gcm="git commit -m"
alias ga="git add . && git add *"
alias gitname="git config --global user.name 'hassan'"
alias gitmail="git config --global user.email 'drakvoidlinux@gmail.com'"
alias gi="git init"
alias graph='git log --oneline --graph --decorate --all'
alias gcl='git clone --depth=1'
alias grt="git reset --hard HEAD"
#yt
#Download:
alias yl='yt-dlp -F' # affichez le tableaux
alias y='yt-dlp -o "%(title)s.%(ext)s" ' # par défaux la qalité maxi
alias ya='yt-dlp -o "%(title)s.%(ext)s" -f 140' # pour mpa 
alias yb='yt-dlp -o "%(title)s.%(ext)s" -f "bv[ext=mp4]+ba[ext=m4a]/best[ext=mp4]/best" --merge-output-format mp4' # la mileur vidio 
alias yt='yt-dlp --skip-download --write-thumbnail'
alias yp='yt-dlp -i -o "%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s" --format "bv[ext=mp4]+ba[ext=m4a]/best[ext=mp4]/best" --merge-output-format mp4'
# For recording.
alias ff="ffmpeg -framerate 16 -f x11grab -s 1920x1080 -i :0.0+0,0 Output.mkv"
alias rec="ffmpeg -framerate 24 -f x11grab -video_size 1920x1080 -i :0.0+1366,0 -preset ultrafast -crf 8 ~/Recordings/Output.mkv"
alias f="ffmpeg -framerate 24 -f x11grab -video_size 1366x768 -i :0.0+0,0 -preset ultrafast -crf 8 ~/Recordings/Output.mkv"
alias cam="ffplay -f v4l2 -framerate 29 -video_size 1280x720 /dev/video0"
#
