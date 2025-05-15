#!/usr/bin/env bash
set -e
doas umount /mnt/ssd && sleep 1 && doas rm -rf /mnt/ssd
