mkdir  $HOME/programming
mkdir  $HOME/programming/pyhton && mkdir  $HOME/programming/shell
mkdir $HOME/Images/
mkdir -p $HOME/Downloads/{Qbittorrent,Firefox,Brave,yt-dlp/{audio,video}}
sudo xbps-install -S && sudo xbps-install -u xbps && sudo xbps-install -Syu
sudo chsh -s /bin/bash void
sudo chsh -s /bin/bash root
