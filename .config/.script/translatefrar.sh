#!/usr/bin/env bash

#BROWSER="firefox"
#BROWSER="brave-browser-stable"

x=$(xclip -o sel)

$BROWSER "https://laratranslate.com/traduction?source=fr&target=ar&text=$x"
$BROWSER "https://translate.google.com/?sl=auto&tl=ar&text=$x&op=translate"
$BROWSER "https://www.deepl.com/fr/translator#fr/ar/$x"
#$BROWSER "https://context.reverso.net/traduction/anglais-francais/$x"
$BROWSER "https://www.reverso.net/traduction-texte#sl=fra&tl=ara&text=$x"
$BROWSER "https://translate.yandex.com/?source_lang=fr&target_lang=ar&text=$x"
