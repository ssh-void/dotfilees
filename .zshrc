# Load ~/.aliases
[[ -f ~/.aliases ]] && source ~/.aliases
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# Setting this variable when ZSH_THEME=random will cause zsh to load
zstyle ':omz:update' frequency 7
plugins=(git)
# Source
source $ZSH/oh-my-zsh.sh
# Load Binkey
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "^R" history-incremental-pattern-search-backward
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
# Autoload 
autoload -U +X compinit && compinit
# Setopt 
setopt histignoredups
setopt sharehistory
setopt incappendhistory

# Load ~/.aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  &> /dev/null 
# Load zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh &> /dev/null
