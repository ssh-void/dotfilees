
HISTIGNORE="cd:&:ls:[bf]g:exit"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

GRC_ALIASES=true
[[ -s "/etc/profile.d/grc.sh" ]] && source /etc/grc.sh

echo -e -n "\x1b[\x35 q"

bind 'set completion-ignore-case on'

[ "$BASH" ] && [ -f $HOME/.config/bash/.bash_aliases ] && . $HOME/.config/bash/.bash_aliases
[ "$BASH" ] && [ -f $HOME/.config/bash/.bash_function ] && . $HOME/.config/bash/.bash_function

# enable programmable completion features (you don't need to enable)
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
bind -m vi-command 'Control-l: clear-screen' # Clear the screen in vi-command mode
bind -m vi-insert 'Control-l: clear-screen'  # Clear the screen in vi-insert mode
bind -m vi-insert "\C-l":clear-screen        # Clear the screen
bind -m vi-insert "\C-e":end-of-line         # Move the cursor to the end of the line
bind -m vi-insert "\C-a":beginning-of-line   # Move the cursor to the beginning of the line
bind -m vi-insert "\C-h":backward-kill-word  # Delete the previous word
bind -m vi-insert "\C-k":kill-line           # Delete the text to the right of the cursor
bind -m vi-insert "\C-w":backward-kill-word  # Delete the previous word
bind -m vi-insert "\C-u":unix-line-discard   # Delete the text to the left of the cursor
bind '"\e[B": history-search-forward'        # Down Arrow key
bind '"\e[A": history-search-backward'       # Up Arrow key
bind '"\e[1;5C": forward-word'               # Right Arrow key move by word
bind '"\e[1;5D": backward-word'              # Left Arrow key move by word
bind 'TAB:menu-complete'                     # cycle through all matches with 'TAB' key
bind '"\C-o": alias-expand-line'             # expand an alias
# bind -x '"\C-f":cd ~/.config' 
bind '"\C-f":"cd ~/.config"'
bind '"\C-y":"cd ~/Downloads/yt-dlp/video/"'

### SHOPT  ###
shopt -s cdspell        # autocorrects cd misspellings
shopt -s cmdhist        # save multi-line commands in history as single line
shopt -s histappend     # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize   # checks term size when bash regains control
shopt -s histreedit     # append to the history file, don't overwrite it
shopt -s histverify     # load results of history substitution into the readline editing buffer
shopt -s extglob        #  !() ..
shopt -s globskipdots   # ./ ../
shopt -s progcomp       # completion
shopt -s nocaseglob     # case insensitive,
shopt -s checkhash

umask 0027
# PS1
#export PS1="\[\e[38;5;207m\]\$(date +'%I:%M:%S') \[\e[92m\]\w\[\e[0m\] \[\e[91m\]>\[\e[0m\] "
export PS1="\[\e[38;5;118m\]\$(date +'%I:%M:%S') \[\e[38;5;212m\]\w\[\e[0m\] \[\e[91m\]>\[\e[0m\] "

if [ -n "$TMUX" ]; then
  export PS1="\[\e[92m\]\w\[\e[0m\] \[\e[91m\]>\[\e[0m\] "
else
  export PS1="\[\e[38;5;207m\]\$(date +'%I:%M:%S') \[\e[92m\]\w\[\e[0m\] \[\e[91m\]>\[\e[0m\] "
fi
