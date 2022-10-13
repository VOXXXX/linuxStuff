#Z pliku /etc/passwd wypisac ilu uzytkownikow jest w kazdej grupie,
#posortowane po ilosci uzytkownikow, wypisywane w formacie
#GID liczba
#gdzie GID to numer grupy, a liczba to ilosc uzytkownikow ktorzy
#przynaleza do tej grupy.
#HINT: moze byc Panstwu przydatne polecenie uniq -c

awk -F ':' '{ print $4 }' /etc/passwd | sort -n | uniq -c | awk '{ print $2,$1 }' | sort -rnk2
