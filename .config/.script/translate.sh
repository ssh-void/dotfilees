#!/usr/bin/env bash

BROWSER="firefox"
#BROWSER="brave-browser-stable"

x=$(xclip -o sel)

$BROWSER "https://www.deepl.com/fr/translator#en/fr/$x"
$BROWSER "https://context.reverso.net/traduction/anglais-francais/$x" 
$BROWSER "https://context.reverso.net/traduction/anglais-francais/$x" 