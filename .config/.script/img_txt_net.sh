#!/usr/bin/env bash

# flameshot gui --raw | tesseract-ocr stdin stdout | xclip -in -selection clipboard &> /dev/null 
# maim -s -c 0.2706,0.2510,0.2392,1.0 -n 2 -b 2 | tesseract-ocr stdin stdout | xsel --clipboard --input &> /dev/null 
# flameshot gui --raw | tesseract-ocr stdin stdout | xsel --clipboard --input &> /dev/null 

maim -s -c 0.2706,0.2510,0.2392,1.0 -n 2 -b 2  | tesseract-ocr stdin stdout | xclip -selection secondary &> /dev/null 

x=$(xclip -o -selection secondary) 

#BROWSER="firefox"
#BROWSER="brave-browser-stable"

$BROWSER  "https://context.reverso.net/traduction/anglais-francais/$x" 
$BROWSER  "https://context.reverso.net/traduction/anglais-francais/$x" 
$BROWSER "https://www.deepl.com/fr/translator#en/fr/$x" 