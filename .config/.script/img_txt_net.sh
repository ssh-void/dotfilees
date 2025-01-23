#!/bin/bash
#flameshot gui --raw | tesseract-ocr stdin stdout | xclip -in -selection clipboard 
#maim -s | tesseract-ocr stdin stdout | xsel --clipboard --input 
#flameshot gui --raw | tesseract-ocr stdin stdout | xsel --clipboard --input 
maim -s -c 0.2706,0.2510,0.2392,1.0 -n 2 -b 2  | tesseract-ocr --oem 1 -l eng+fra+ara+rus stdin stdout | xclip -selection primary &> /dev/null 
#wait
x=$(xclip -o -selection primary) 
#brave-browser-stable "https://context.reverso.net/traduction/anglais-francais/$x" 
#firefox "https://context.reverso.net/traduction/anglais-francais/$x" 
#brave-browser-stable "https://www.deepl.com/fr/translator#en/fr/$x" 
firefox "https://www.deepl.com/fr/translator#en/fr/$x" 
