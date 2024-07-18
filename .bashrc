# PS1='[\u@\h \W]\$ '									
# get current branch in git repo
# get current branch in git repo
# Exports:
export TERMINAL="st"
export READER="zathura"
export VIDEO="mpv"
export TERM="xterm-256color"   # getting proper colors
export HISTCONTROL=ignoredups:erasedups   # no duplicate entries
export FILE="ranger"
export BROWSER="firefox"
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim +Man!" # manpages
export LANG=en_US.UTF-8
export SUDO_EDITOR="nvim"
#export PATH=$HOME/.scripts:$PATH
export PATH="$HOME/.local/bin:$PATH" ### PATH
export PAGER="most" # export PAGER="less"
export IMGVIEWER="sxiv"
export IMAGE="sxiv"
export WM_NAME="LG3D" # contourner certains bogues matlab

HISTIGNORE="cd:&:ls:[bf]g:exit"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[ -f ~/.xprofile ] && source ~/.xprofile

GRC_ALIASES=true
[[ -s "/etc/profile.d/grc.sh" ]] && source /etc/grc.sh

bind 'set completion-ignore-case on'

# Source the aliases file
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### SET VI MODE ###
# Comment this line out to enable default emacs-like bindings
bind -m vi-command 'Control-l: clear-screen' # sup by def in zsh	
bind -m vi-insert 'Control-l: clear-screen'

#PS1="\w > "
PS1="\[\e[92m\]\w\[\e[0m\] \[\e[91m\]>\[\e[0m\] "
#export PS1="\[\e[91m\]\[\e[92m\][\W]\$\[\e[0m\] "
#export PS1="\[\e[91m\]\[\e[91m\][\W]\$\[\e[0m\] "
#export PS1="\[\e[91m\]:\[\e[92m\][\W]\$\[\e[0m\] "
#PS1="\[\e[32m\][\[\e[m\]\[\e[32m\]\d\[\e[m\] \[\e[32m\]\A\[\e[m\]\[\e[32m\]]\[\e[m\] \u@\h \w\\$ "
#export PS1='\[\e[91m\]\[\e[92m\][\W]\$\[\e[0m\] '
#PS1="\[\e[1;30m\]\W \[\e[0m\] "
#export PS1="\[\e[1;33m\][\[\e[m\]\[\e[1;33m\]\u\[\e[m\]\[\e[1;33m\]]\[\e[m\]\[\e[1;34m\][\[\e[m\]\[\e[1;34m\]\w\[\e[m\]\[\e[1;34m\]]\[\e[m\]\[\e[1;31m\]-\[\e[m\]\[\e[1;31m\]>\[\e[m\] "
#======================== fon =========================#
ex()
{
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"   ;;
            *.tar.gz)    tar xzf "$1"   ;;
            *.bz2)       bunzip2 "$1"   ;;
            *.rar)       unrar x "$1"   ;;
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
            *.xz)        unxz -k "$1"    ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    elif [ -f "$1" ] && [[ "$1" == *.rar ]]; then
        unrar x "$1"
    else
        echo "'$1' is not a valid file"
    fi
}
