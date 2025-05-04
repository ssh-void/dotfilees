#!/usr/bin/env bash
set -e
doas mkdir -p /mnt/ssd
sleep 1
doas mount -t exfat -o defaults,uid=1000,gid=1000,umask=022 UUID=052D-4755 /mnt/ssd
