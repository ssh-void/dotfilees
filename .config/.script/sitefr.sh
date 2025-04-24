#!/usr/bin/env bash

x=$(xclip -o -selection primary) 
#BROWSER="firefox"
BROWSER="brave-browser-stable"
$BROWSER "https://ar.forvo.com/search/$x"
$BROWSER "https://www.larousse.fr/dictionnaires/francais/$x"
$BROWSER "https://usito.usherbrooke.ca/d%C3%A9finitions/$x"
$BROWSER "https://www.le-dictionnaire.com/definition/$x"
$BROWSER "https://dictionnaire.lerobert.com/definition/$x"
$BROWSER "https://www.deepl.com/fr/translator#fr/ar/$x"
$BROWSER "https://www.almaany.com/ar/dict/ar-fr/$x"
$BROWSER "https://context.reverso.net/traduction/francais-arabe/$x"
$BROWSER "https://www.dictionnaire-academie.fr/article/A9P3914"
$BROWSER "https://www.almaany.com/ar/dict/ar-fr/$x"
$BROWSER "https://leconjugueur.lefigaro.fr/php5/index.php?verbe=$x"
$BROWSER "https://conjugator.reverso.net/conjugation-french-verb-$x.html"