#!/usr/bin/env bash
set -e
doas mkdir -p /mnt/hdd11 && doas mkdir -p /mnt/hdd22 && sleep 1 && doas mount -t ntfs-3g -o defaults,uid=1000,gid=1000,umask=022 UUID=7862B45062B4153A /mnt/hdd11 && sleep 1 && doas mount -t ntfs-3g -o defaults,uid=1000,gid=1000,umask=022 UUID=98DC2FDADC2FB184 /mnt/hdd22
