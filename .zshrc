# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP="XDG_CACHE_HOME/zsh"
# Enable colors and change prompt:
autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="sorin"
# Setting this variable when ZSH_THEME=random will cause zsh to load
zstyle ':omz:update' frequency 3
plugins=(git)
# Source
source $ZSH/oh-my-zsh.sh

# mode vi
bindkey -v
export KEYTIMEOUT=1

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey "^o" _expand_alias

# Configurations des touches
bindkey -M viins '^L' clear-screen      # Effacer l'écran
bindkey -M vicmd '^L' clear-screen      # Effacer l'écran en mode commande
bindkey -M viins '^E' end-of-line       # Aller à la fin de la ligne
bindkey -M viins '^A' beginning-of-line # Aller au début de la ligne
bindkey -M viins '^H' backward-kill-word # Supprimer le mot précédent
bindkey -M viins '^K' kill-line         # Supprimer jusqu'à la fin de la ligne
bindkey -M viins '^W' backward-kill-word # Supprimer le mot précédent
bindkey -M viins '^U' backward-kill-line # Supprimer jusqu'au début de la ligne

# Basic auto/tab complete:
autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# ============================
# HISTORY AND EXPANSION
# ============================

setopt histignoredups        # Don't save duplicate entries in history
setopt sharehistory          # Share history between all shell sessions
setopt incappendhistory      # Append to the history file incrementally
setopt APPEND_HISTORY        # Append to history, don't overwrite
setopt EXTENDED_HISTORY      # Save timestamps and durations in history
setopt HIST_IGNORE_DUPS      # Don't save duplicate commands in history
setopt HIST_VERIFY           # Verify history substitutions before executing
setopt HIST_IGNORE_ALL_DUPS  # Don't record duplicate entries in history

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# ============================
# COMPLETION
# ============================

setopt COMPLETE_IN_WORD      # Allow completion inside words
setopt NO_LIST_BEEP          # Disable the beep during completion
setopt NO_LIST_AMBIGUOUS     # Show the completion list immediately when ambiguous
setopt LIST_ROWS_FIRST       # Order completion by row instead of column
# setopt NO_ALWAYS_TO_END     # Don't go to end of word on completion from middle

# ============================
# JOB CONTROL
# ============================

setopt CHECK_JOBS            # Check if there are jobs running before quitting
setopt EXTENDED_GLOB         # Enable advanced global extensions (like extglob)
setopt NO_HUP                # Don't hang up when jobs are running
setopt AUTO_CONTINUE         # Automatically resume disowned jobs
setopt LONG_LIST_JOBS        # Show a longer list of jobs
setopt NO_NOTIFY             # Wait until the prompt is displayed before showing output
setopt NO_AUTO_RESUME        # Don't automatically resume jobs
setopt NO_POSIX_JOBS         # Subshells have their own job lists
setopt NO_BG_NICE            # Don't "nice" background tasks

# ============================
# PARAMETER EXPANSION
# ============================

setopt AUTO_PARAM_KEYS       # Neater prompt, deletes spaces after complete
setopt AUTO_PARAM_SLASH      # Append a `/` to directories in completion
setopt NOAUTO_REMOVE_SLASH   # Don't remove a slash if I put it there
setopt MAGIC_EQUAL_SUBST     # Allow `option=arg` to have path expansion
setopt PROMPT_SUBST          # Allow variable substitution in the prompt

# ============================
# FILE HANDLING AND GLOBBING
# ============================

setopt NULL_GLOB             # No match returns null, useful in $path
setopt EXTENDED_GLOB         # Use regex style globbing
setopt REMATCH_PCRE          # Use Perl regex matching for the =~ operator
setopt C_BASES               # Output non-base 10 values like in C

# ============================
# INTERACTIVE AND USER EXPERIENCE
# ============================

setopt LOCAL_OPTIONS         # Allow functions to have local options
setopt LOCAL_TRAPS           # Allow functions to have local traps
setopt CORRECT               # Enable command spelling correction
setopt NO_CORRECT_ALL        # Prevent asking to correct paths like `.git` at the root
setopt INTERACTIVE_COMMENTS  # Allow comments in interactive shells
setopt NO_PRINT_EXIT_VALUE   # Don't display the exit value in the prompt
setopt IGNORE_EOF            # Allow ^D to be bound, quit after 10 consecutive EOFs
setopt NOFLOW_CONTROL        # Allow binding ^S and ^Q for flow control

# ============================
# FILE HANDLING AND SYSTEM SETTINGS
# ============================

setopt CLOBBER               # Allow `>` to clobber and `>>` to append/create
setopt POSIX_BUILTINS        # Allow the use of built-in versions of commands like `command`

# ============================
# SHARED HISTORY
# ============================

setopt SHARE_HISTORY         # All shells share the same history
setopt HIST_REDUCE_BLANKS    # Remove blanks between arguments before saving
setopt HIST_IGNORE_SPACE     # Commands starting with space don't go into history
setopt HIST_NO_STORE         # Don't save certain commands (like `fc -l`) in history
setopt HIST_LEX_WORDS        # Parse history from file as if it were on the command line

# Load ~/.aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  &> /dev/null 
# Load zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh &> /dev/null
# Load zsh-history-substring-search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search &> /dev/null

umask 0027