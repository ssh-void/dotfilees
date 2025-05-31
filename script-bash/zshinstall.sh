#sudo xbps-install -Syu zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Installing zsh
sudo xbps-install -Syu zsh zsh-completions
mkdir ~/.oh-my-zsh &> /dev/null
mkdir -p "${XDG_STATE_HOME:-$HOME/.local/state}/zsh" &> /dev/null
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh &> /dev/null

# Cloning some awesome plugins
cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions.git &> /dev/null
cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git &> /dev/null
cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-history-substring-search.git 2>/dev/null
