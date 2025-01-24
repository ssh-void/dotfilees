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
setopt incappendhistory
# Correction automatique des chemins
setopt CORRECT
# Historique
setopt APPEND_HISTORY          # Ajouter à l'historique, pas écraser
setopt EXTENDED_HISTORY        # Sauvegarder l'horodatage et la durée
setopt HIST_IGNORE_DUPS        # Ne pas enregistrer les doublons
setopt HIST_VERIFY             # Vérifier avant exécution des substitutions d'historique
# Vérification de la taille du terminal
setopt CHECK_JOBS
# Extensions globales avancées
setopt EXTENDED_GLOB           # Équivalent de extglob

# Load ~/.aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  &> /dev/null 
# Load zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh &> /dev/null

umask 0027
