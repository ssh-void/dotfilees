#!/usr/bin/env bash

x=$(xclip -o -selection primary)
#BROWSER="firefox"
#BROWSER="brave-browser-stable"
$BROWSER "https://duckduckgo.com/?q=$x&t=newext&atb=v484-6&ia=web"
$BROWSER "https://duckduckgo.com/?q=$x&t=newext&atb=v484-6&ia=web"
$BROWSER "https://yandex.com/search?text=$x"
$BROWSER "https://www.ecosia.org/search?method=index&q=$x"
$BROWSER "https://www.bing.com/search?q=$x&lq=0&pq"
$BROWSER "https://www.qwant.com/?q=$x&t=web"
$BROWSER "https://search.inetol.net/search?q=$x"
$BROWSER "https://search.brave.com/search?q=$x&source=web"
