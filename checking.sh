#napisac sprawdzacz.sh, ktory bedzie sprawdzal czy plik podany jako argument
#istnieje, jezeli tak to ma sprawdzac czy jest plikiem, katalogiem czy czyms
#innym. Ma rowniez o tym fakcie powiadomic uzytkownika np:
#./sprawdzacz.sh jakis_plik
#to jest plik!
#./sprawdzacz.sh jakis_katalog
#to jest katalog!
#./sprawdzacz.sh cos_co_nie_istnieje
#nie ma czegos takiego :(
#./sprawdzacz.sh mail
#to nie jest ani plik ani katalog!

#!/bin/bash

if [ -f $1 ]
then
        echo "to jest plik!"
elif [ -d $1 ]
then
        echo "to jest katalog!"
elif [ -L $1 ]
then
        echo "to nie jest ani plik ani katalog!"
else
        echo "nei ma czegos takiego :("
fi
