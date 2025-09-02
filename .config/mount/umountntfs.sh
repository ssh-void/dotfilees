#!/usr/bin/env bash
set -e
doas umount /mnt/hdd11 && sleep 1 && doas umount /mnt/hdd22 && sleep 1 && doas rm -rf /mnt/hdd11 &&  doas rm -rf /mnt/hdd22
