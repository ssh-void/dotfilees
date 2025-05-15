#!/usr/bin/env bash
set -e
doas mkdir -p /mnt/ssd/ && doas mount -t ext4 -o defaults UUID=622427a0-7005-4a2d-bbbf-e9264438ac62 /mnt/ssd/ && doas chown $USER:$USER /mnt/ssd/
