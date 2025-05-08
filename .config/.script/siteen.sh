#!/usr/bin/env bash

x=$(xclip -o -selection primary) 

#BROWSER="firefox"
#BROWSER="brave-browser-stable"

$BROWSER "https://www.merriam-webster.com/dictionary/$x"
$BROWSER "https://www.dictionary.com/browse/$x"
$BROWSER "https://www.thesaurus.com/browse/$x"
$BROWSER "https://www.oxfordlearnersdictionaries.com/definition/english/$x_1?q=$x"
$BROWSER "https://context.reverso.net/traduction/anglais-francais/$x"
$BROWSER "https://www.deepl.com/fr/translator#en/fr/$x%0A"
$BROWSER "https://translate.google.com/?hl=fr&sl=en&tl=fr&text=$x%0A&op=translate"
$BROWSER "https://www.wordreference.com/enfr/$x"
$BROWSER "https://www.wordreference.com/synonyms/$x"
$BROWSER "https://www.wordnik.com/words/$x"
$BROWSER "https://dictionary.cambridge.org/dictionary/english/$x?q=$x"
$BROWSER "https://www.online-translator.com/traduction/anglais-fran%C3%A7ais/$x"
$BROWSER "https://translate.yandex.com/?source_lang=en&target_lang=fr&text=$x"
$BROWSER "https://www.almaany.com/en/dict/ar-en/$x"
$BROWSER "https://enfr.dict.cc/?s=$x"
$BROWSER "https://www.linguee.com/english-french/search?source=auto&query=$x"
$BROWSER "https://ninjawords.com/$x"
$BROWSER "https://www.urbandictionary.com/define.php?term=$x"
$BROWSER "https://dictzone.com/english-arabic-dictionary/$x"
$BROWSER "https://laratranslate.com/traduction?source=en&target=fr&text=$x&style=Faithful"
$BROWSER "https://www.the-conjugation.com/english/verb/$x.php"
$BROWSER "https://www.quodb.com/search/$x?advance-search=false&keywords=$x"
