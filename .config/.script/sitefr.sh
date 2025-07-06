#!/usr/bin/env bash

x=$(xclip -o -selection primary)

$BROWSER "https://www.dictionnaire-academie.fr/article/A9P3914"
$BROWSER "https://ar.forvo.com/search/$x/fr/"
$BROWSER "https://context.reverso.net/traduction/francais-arabe/$x"
$BROWSER "https://www.deepl.com/fr/translator#fr/ar/$x"
$BROWSER "https://www.almaany.com/ar/dict/ar-fr/$x"
$BROWSER "https://usito.usherbrooke.ca/d%C3%A9finitions/$x"
$BROWSER "https://www.le-dictionnaire.com/definition/$x"
$BROWSER "https://langue-francaise.tv5monde.com/decouvrir/dictionnaire/m/$x"
$BROWSER "https://www.larousse.fr/dictionnaires/francais/$x"
$BROWSER "https://www.synonymes.com/synonyme.php?mot=$x"
$BROWSER "https://dictionnaire.lerobert.com/definition/$x"
$BROWSER "https://www.synonymo.fr/syno/$x"
$BROWSER "https://dictionnaire.lerobert.com/synonymes/$x"
$BROWSER "https://fr.wiktionary.org/wiki/$x"
$BROWSER "https://www.frenchconjugation.com/$x.html"
$BROWSER "https://www.verbix.com/webverbix/go.php?T1=$x&D1=3&H1=103"
