#!/bin/bash

SEND_TO=$(dmenu -i -l 8 < .tlg_users)
scrot -q 100 -o "/tmp/scrot_tmp.png" && telegram-cli -W --exec "send_photo $SEND_TO /tmp/scrot_tmp.png"
