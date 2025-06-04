doas xbps-install -Syu neovim
doas mkdir /root/.config/ && doas mkdir -p /root/.config/nvim/
doas cp ~/.config/nvim/init.vimroot /root/.config/nvim/init.vim # testing
