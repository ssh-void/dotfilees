#!/usr/bin/env bash

# flameshot gui --raw | tesseract-ocr stdin stdout | xclip -in -selection clipboard 
# maim -s | tesseract-ocr stdin stdout | xsel --clipboard --input 
# flameshot gui --raw | tesseract-ocr stdin stdout | xsel --clipboard --input 

maim -s -c 0.2706,0.2510,0.2392,1.0 -n 2 -b 2 | tesseract-ocr --oem 1 -l eng+fra+rus+ara stdin stdout | xclip -selection clipboard &> /dev/null	
x=$(xclip -o -selection clipboard) 