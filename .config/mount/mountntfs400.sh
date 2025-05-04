#!/usr/bin/env bash
set -e
doas mkdir -p /mnt/hdd500
doas mount -t ntfs -o defaults,uid=1000,gid=1000,umask=022 UUID=12D92708350DB72F /mnt/hdd500
