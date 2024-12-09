#!/bin/bash
#flameshot gui --raw | tesseract-ocr stdin stdout | xclip -in -selection clipboard 
#maim -s | tesseract-ocr stdin stdout | xsel --clipboard --input 
#flameshot gui --raw | tesseract-ocr stdin stdout | xsel --clipboard --input 
maim -s -c 1,0,0,1 | tesseract-ocr stdin stdout | xclip -selection clipboard &> /dev/null	
#wait
x=$(xclip -o -selection clipboard) 
#brave-browser-stable "https://context.reverso.net/traduction/anglais-francais/$x" 
#firefox "https://context.reverso.net/traduction/anglais-francais/$x" 
#brave-browser-stable "https://www.deepl.com/fr/translator#en/fr/$x" 
#firefox "https://www.deepl.com/fr/translator#en/fr/$x" 
