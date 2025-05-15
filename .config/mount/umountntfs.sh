#!/usr/bin/env bash
set -e
doas umount /mnt/hdd1 && doas umount /mnt/hdd2 && doas rm -rf /mnt/hdd1 &&  doas rm -rf /mnt/hdd2