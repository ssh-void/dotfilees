#!/usr/bin/env bash

#BROWSER="firefox"
#BROWSER="brave-browser-stable"

x=$(xclip -o sel)

$BROWSER "https://translate.google.com/?sl=auto&tl=fr&text=$x&op=translate/$x"
$BROWSER "https://www.deepl.com/fr/translator#en/fr/$x"
#$BROWSER "https://context.reverso.net/traduction/anglais-francais/$x"
$BROWSER "https://www.reverso.net/traduction-texte#sl=eng&tl=fra&text=$x"
$BROWSER "https://translate.yandex.com/?source_lang=en&target_lang=fr&text=$x"
$BROWSER "https://laratranslate.com/traduction?source=en&target=fr&text=$x"
