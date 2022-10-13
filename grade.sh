#Maja Panstwo plik ze struktura:
#imie nazwisko ocena
#gdzie imie nazwisko to imie i nazwisko pewnych osob, a ocena to
#ocena jaka dostali z pewnego egzaminu. Ocena moze byc jedna z 3, 3.5,
#4, 4.5, 5.
#Zadaniem Panstwa jest napisanie skryptu (albo dwoch), ktory generowac
#bedzie z tego pliku dwie listy. Pierwsza w formacie:
#ocena imie nazwisko
#posortowane po ocenie.
#Druga lista ma byc w formacie:
#nazwisko, imie ocena
#posortowane po nazwisku.
#Dla obu list, prosze dodatkowo o zamiane 3.5 na 3+ i 4.5 na 4+.


#!/bin/bash

awk '{ print $3,$1,$2 }' lista.txt | sort -n | sed 's/\.5/+/g' > lista_ocena.txt
awk '{ print $2,$1,$3 }' lista.txt | sort -k1 | sed 's/\.5/+/g' > lista_nazwisko.txt

