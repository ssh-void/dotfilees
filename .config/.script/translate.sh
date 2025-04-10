#!/usr/bin/env bash

x=$(xclip -o sel)
firefox "https://www.deepl.com/fr/translator#en/fr/$x"
