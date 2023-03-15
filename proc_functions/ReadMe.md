
# Baza danych linii lotniczej

## Struktura:
- Klient (id, imie, nazwisko, telefon, adres, email)
- Bilety (id, id_lotu, id_klasy, id_klienta, cena, data_wylotu)
- Klasy (id, nazwa, cena)
- Samoloty (id, nazwa, ilość_miejsc, stan, id_pilot, id_stewardesa)
- Połączenia (id, id_samolotu, id_lotniska_start, id_lotniska_koniec, data, godzina_start, godzina_koniec)
- Lotniska (id, nazwa, miasto)
- Pilot (id, imie, nazwisko, data_urodzenia, data_zatrudnienia, pensja)
- Stewardesa (id, imie, nazwisko, data_urodzenia, data_zatrudnienia, pensja)
- Zaloga (id, id_pilot, id_stewardesa)

> Do bazy danych z zadania 6 proszę dodać przy pomocy procedur przynajmniej 3 samoloty, 15 pasazerów, wybranych członków załogi oraz 3 loty.
> Napisać procedurę przydzielającą samoloty do lotów,
> Wyświetlić przy pomocy funkcji nazwiska pasażerów oraz klasę podróży (dla każdego lotu)
> Za pomocą funkcji usunąć jeden z samolotów oraz jeden z lotów
> Ponownie wyświetlić przy pomocy funkcji nazwiska pasażerów oraz klasę podróży