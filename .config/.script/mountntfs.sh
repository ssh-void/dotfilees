doas mkdir -p /mnt/xxxxx && doas mkdir -p /mnt/xxxxxx
doas mount -t ntfs -o defaults,uid=1000,gid=1000,umask=022 UUID=7862B45062B4153A /mnt/xxxx
doas mount -t ntfs -o defaults,uid=1000,gid=1000,umask=022 UUID=98DC2FDADC2FB184 /mnt/xxxxx
