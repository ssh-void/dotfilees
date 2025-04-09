# Load ~/.aliases
[[ -f ~/.aliases ]] && source ~/.aliases
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="sorin"
# Setting this variable when ZSH_THEME=random will cause zsh to load
zstyle ':omz:update' frequency 7
plugins=(git)
# Source
source $ZSH/oh-my-zsh.sh
# Load Binkey

# Activer le mode vi pour les touches
bindkey -v
# Configurations des touches
bindkey -M viins '^L' clear-screen      # Effacer l'écran
bindkey -M vicmd '^L' clear-screen      # Effacer l'écran en mode commande
bindkey -M viins '^E' end-of-line       # Aller à la fin de la ligne
bindkey -M viins '^A' beginning-of-line # Aller au début de la ligne
bindkey -M viins '^H' backward-kill-word # Supprimer le mot précédent
bindkey -M viins '^K' kill-line         # Supprimer jusqu'à la fin de la ligne
bindkey -M viins '^W' backward-kill-word # Supprimer le mot précédent
bindkey -M viins '^U' backward-kill-line # Supprimer jusqu'au début de la ligne

# Autoload
autoload -Uz compinit
compinit
# Setopt 
setopt histignoredups
setopt sharehistory
setopt incappendhistory # Correction automatique des chemins

setopt CHECK_JOBS
# Extensions globales avancées
setopt EXTENDED_GLOB           # Équivalent de extglob
setopt COMPLETE_IN_WORD        # Permet la complétion au milieu d'un mot  

# Historique
setopt APPEND_HISTORY          # Ajouter à l'historique, pas écraser
setopt EXTENDED_HISTORY        # Sauvegarder l'horodatage et la durée
setopt HIST_IGNORE_DUPS        # Ne pas enregistrer les doublons
setopt HIST_VERIFY             # Vérifier avant exécution des substitutions d'historique
setopt HIST_VERIFY          # Verity a history command before executing (sanity)
setopt HIST_IGNORE_ALL_DUPS # Don't record dupes in history
# Vérification de la taille du terminal
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
REPORTTIME=60               # print elapsed time when more than 60 seconds

setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS        # allow functions to have local options
setopt LOCAL_TRAPS          # allow functions to have local traps
setopt CORRECT
setopt NO_CORRECT_ALL       # Prevents asking 'correct git to .git' when at root
setopt COMPLETE_IN_WORD
# setopt NO_ALWAYS_TO_END     # Don't got to end of word on completion from middle
setopt NO_LIST_AMBIGUOUS    # Show completion list immediately when ambiguous
# setopt NO_REC_EXACT         # Always ask if multiple matches exist with word

# setopt AUTO_MENU
setopt LIST_ROWS_FIRST      # Order completion by row instead of column
setopt RC_EXPAND_PARAM      # Use arrays in in params to get multiple versions
setopt CLOBBER              # allow > to clobber and >> to append/create
setopt POSIX_BUILTINS       # allow `command` to use the builtin versions

setopt INTERACTIVE_COMMENTS # Allow comments when in an interactive shell
setopt NO_PRINT_EXIT_VALUE  # My zsh prompt tells me what the exit value was

setopt SHARE_HISTORY        # All my shells are like one hive mind, cool
setopt HIST_REDUCE_BLANKS   # Remove blanks between arguments before saving
setopt HIST_IGNORE_SPACE    # Insert a space at start to prevent history of cmd
setopt HIST_NO_STORE        # Don't save the history command (fc -l) in history
setopt HIST_LEX_WORDS       # Parse history from file like it was on commandline

setopt CHECK_JOBS           # A little nag that jobs exist before quiting
setopt NO_HUP               # Used in combination with CHECK_JOBS
setopt AUTO_CONTINUE        # Disowned jobs begin to run again
setopt LONG_LIST_JOBS       # Obvious, longer list of jobs
setopt NO_NOTIFY            # For an easier to read terminal, wait till prompt
setopt NO_AUTO_RESUME       # Bad inference, I don't mean to resume jobs
setopt NO_POSIX_JOBS        # Sub shells have their own job lists
setopt NO_BG_NICE           # don't nice background tasks

setopt AUTO_CD              # Don't require using cd to cd
setopt AUTO_PUSHD           # every cd pushs onto the stack
setopt PUSHD_SILENT         # Silent cds since we pushd
setopt PUSHD_IGNORE_DUPS    # Ignore duplicate pushs
setopt PUSHD_TO_HOME        # Empty pushd is like cd

setopt NULL_GLOB            # No match return nil, used in $path
setopt EXTENDED_GLOB        # use regex style globing
setopt REMATCH_PCRE         # use perl regex matching for the =~ operator

setopt C_BASES              # Output non base 10 like C

setopt AUTO_PARAM_KEYS      # Neater prompt, deletes spaces after complete
setopt AUTO_PARAM_SLASH     # Params that are directories get a /
setopt NOAUTO_REMOVE_SLASH  # Keep a slash if I put it there

setopt MAGIC_EQUAL_SUBST    # option=arg can have arg path expanded
setopt PROMPT_SUBST         # Allow variable substitution in the prompt

setopt IGNORE_EOF           # Allow ^D to be bound, 10 consecuritve EOF will quit
setopt NOFLOW_CONTROL       # Allow biding of ^S/^Q

# Load ~/.aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  &> /dev/null 
# Load zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh &> /dev/null
# Load zsh-autosuggestionss
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search &> /dev/null

umask 0027
