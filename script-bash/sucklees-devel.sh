doas xbps-install -Syu libX11-devel libXft-devel libXinerama-devel libXrandr-devel make gcc pkg-config  #  pkg-config !!
# doas xbps-remove -Rv libXft-devel libXinerama-devel libXrandr-devel make gcc # (dwm )
# nsxiv
doas xbps-install imlib2-devel # libImlib2
doas xbps-install imlib2-devel libXinerama-devel libXft-devel
doas xbps-install inotify-tools-devel
doas xbps-install libexif-devel
# doas xbps-remove -Rv libXft-devel libXinerama-devel libXrandr-devel make gcc libXinerama-devel libXft-devel inotify-tools-devel libexif-deve # (nsxiv)
