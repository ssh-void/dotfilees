#!/usr/bin/env bash

PROCESS="${@}"

if [[ -z ${PROCESS} ]]
then
      echo "Vous devez donner le nom d'un ou plusieurs process"
else
      for EXPRESSION in $(echo ${PROCESS}) 
      do
              RAMUSAGE=$(ps -elf |awk -v process=${EXPRESSION} '$13 ==  process' |awk '{SUM += $8/1024} END {print SUM}' |cut -d '.' -f1) 
	      if [[ -z ${RAMUSAGE} ]]
	      then 
		     echo "le processus ${EXPRESSION} n'existe pas"
	      else
	             echo "RAM consommée pour ${EXPRESSION} :  ${RAMUSAGE} MB"
	      fi
       done
fi
