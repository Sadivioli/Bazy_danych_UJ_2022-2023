
# Baza danych linii lotniczej

## Struktura:
- Klient (id, imie, nazwisko, telefon, adres, email)
- Bilety (id, id_lotu, id_klasy, id_klienta, cena, data_wylotu)
- Klasy (id, nazwa, cena)
- Samoloty (id, nazwa, ilość_miejsc, stan, id_zaloga)
- Połączenia (id, id_samolotu, id_lotniska_start, id_lotniska_koniec, data, godzina_start, godzina_koniec)
- Lotniska (id, nazwa, miasto)
- Pilot (id, imie, nazwisko, data_urodzenia, data_zatrudnienia, pensja)
- Stewardesa (id, imie, nazwisko, data_urodzenia, data_zatrudnienia, pensja)
- Zaloga (id, id_pilot, id_stewardesa)