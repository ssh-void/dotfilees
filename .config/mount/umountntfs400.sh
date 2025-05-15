#!/usr/bin/env bash
set -e
doas umount /mnt/hdd500 && sleep 1 && doas rm -rf /mnt/hdd500
