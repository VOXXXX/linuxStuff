#Prosze napisac prosty skrypt ktory tworzylby wpis, ktory mozna by
#dodac do /etc/passwd, w sensie:
#username:x:UID:GID:komentarz:katalog_domowy:/bin/bash
#gdzie komentarz to zwykle imie i nazwisko, a katalog domowy jest
#postaci: /home/students/username
#Skrypt ten ma przyjmowac od trzech do czterech argumentow. Pierwszy
#argument to nazwa uzytkownika, drugi to UID, trzeci to komentarz (na
#xorze jest to imie i nazwisko, chodzi tu o 5 pole w pliku
#/etc/passwd). Czwarty, opcjonalny to numer grupy. Skrypt ten ma
#dzialac w ten sposob:
#./skrypt.sh anobel 999 "Alfred Nobel"
#anobel:x:999:113:Alfred Nobel:/home/students/anobel:/bin/bash
#./skrypt.sh anobel 999 "Alfred Nobel" 100
#anobel:x:999:100:Alfred Nobel:/home/students/anobel:/bin/bash
#Dodatkowo, sprawdzic czy taki uid i username nie jest juz zajety.


#!/bin/bash



if [ $(awk -F ':' '{ print $1 }' nowyplik | grep "$1") ]
then
        echo "Sprawdzam"
        sleep 2
        echo "Username istnieje"
        exit
else
        echo "Username jest wolny"
fi

if [ $(awk -F ':' '{ print $3 }' nowyplik | grep "$2") ]
then
        echo "Sprawdzam"
        sleep 2
        echo "UID istnieje"
        exit
else
        echo "UID jest wolny"
fi

if [ $4 ]
then
        echo "$1:x:$2:$4:$3:/home/students/$1:/bin/bash" >> nowyplik
else
        echo "$1:x:$2:113:$3:/home/students/$1:/bin/bash" >> nowyplik
fi

