#Polecenie df wypisuje urzadzenia i ilosc wolnego miejsca na
#nich. W pierwszej kolumnie maja Panstwo wypisane urzadzenie, w drugiej
#maja panstwo rozmiar urzadzenia, w trzeciej zajete miejsce, w czwartej
#miejsce wolne, w piatej zajetosc w procentach a w szostej miejsce w
#ktorym dane uzadzenie jest zamontowane.
#Prosze napisac skrypt, ktory bedzie pobieral informacje z df i zwracal
#sume ilosci dostepnego miejsca na wszystkich urzadzeniach
#zaczynajacych sie na /dev/.

#!/bin/bash

df | grep "^/dev" | awk '{ SUMA=SUMA+$4 }END{ print SUMA }'
