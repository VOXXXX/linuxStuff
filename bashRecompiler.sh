#Jezeli podany jest argument potraktuj go jako nazwe katalogu.
#Przejdz do tego katalogu (jezeli user nie podal argumentu, nie zmieniaj katalogu).
#Jeżeli w obecnym katalogu są pliki .cpp, skompiluj je:
#g++ *.cpp -o run
#Teraz, co sekunda sprawdzaj czy w katalogu sa pliki .cpp ktore sa nowsze od run.
#Jezeli takie pliki istnieja, skompiluj jeszcze raz.

#!/bin/bash

if [ $1 ]
then
        cd $1
else
        echo "nie podano argumentu, brak zmian katalogu"
fi

if [ "$(find . -type f -name "*.cpp") ]
then
        g++ *.cpp -o run
        while [ -z "$(find . -type f -name "*.cpp" -newer "run.txt")" ]
        do
                echo "czekam"
                sleep 1
        done
        g++ *.cpp -o run
else
        echo "brak plikow"
fi
