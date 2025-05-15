#!/usr/bin/env bash
set -e
doas mkdir -p /mnt/hdd1 && doas mkdir -p /mnt/hdd2 && doas mount -t ntfs -o defaults,uid=1000,gid=1000,umask=022 UUID=7862B45062B4153A /mnt/hdd1 && doas mount -t ntfs -o defaults,uid=1000,gid=1000,umask=022 UUID=98DC2FDADC2FB184 /mnt/hdd2
