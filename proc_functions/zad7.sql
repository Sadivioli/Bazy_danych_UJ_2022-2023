-- Struktura:
--     Klient (id, imie, nazwisko, telefon, adres, email)
--     Bilety (id, id_lotu, id_klasy, id_klienta, cena, data_wylotu)
--     Klasy (id, nazwa, cena)
--     Samoloty (id, nazwa, ilość_miejsc, stan, id_pilot, id_stewardesa)
--     Połączenia (id, id_samolotu, id_lotniska_start, id_lotniska_koniec, data, godzina_start, godzina_koniec)
--     Lotniska (id, nazwa, miasto)
--     Pilot (id, imie, nazwisko, data_urodzenia, data_zatrudnienia, pensja)
--     Stewardesa (id, imie, nazwisko, data_urodzenia, data_zatrudnienia, pensja)
--     Zaloga (id, id_pilot, id_stewardesa)

DROP TABLE IF EXISTS Bilety;
DROP TABLE IF EXISTS Klasy;
DROP TABLE IF EXISTS Samoloty;
DROP TABLE IF EXISTS Polaczenia;
DROP TABLE IF EXISTS Lotniska;
DROP TABLE IF EXISTS Pracownicy;
DROP TABLE IF EXISTS Klienci;
DROP TABLE IF EXISTS Pilot;
DROP TABLE IF EXISTS Stewardesa;

CREATE TABLE Klienci (
    id INT NOT NULL AUTO_INCREMENT,
    imie VARCHAR(20) NOT NULL,
    nazwisko VARCHAR(20) NOT NULL,
    telefon VARCHAR(20) NOT NULL,
    adres VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Pilot (
    id INT NOT NULL AUTO_INCREMENT,
    imie VARCHAR(20) NOT NULL,
    nazwisko VARCHAR(20) NOT NULL,
    data_urodzenia DATE NOT NULL,
    data_zatrudnienia DATE NOT NULL,
    pensja FLOAT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Stewardesa (
    id INT NOT NULL AUTO_INCREMENT,
    imie VARCHAR(20) NOT NULL,
    nazwisko VARCHAR(20) NOT NULL,
    data_urodzenia DATE NOT NULL,
    data_zatrudnienia DATE NOT NULL,
    pensja FLOAT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Zaloga (
    id INT NOT NULL,
    id_pilot INT NOT NULL,
    id_stewardesa INT NOT NULL
);

CREATE TABLE Lotniska (
    id INT NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR(50) NOT NULL,
    miasto VARCHAR(20) NOT NULL,
    kraj VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Klasy (
    id INT NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR(20) NOT NULL,
    cena FLOAT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Samoloty (
    id INT NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR(20) NOT NULL,
    ilosc_miejsc INT NOT NULL,
    stan VARCHAR(20) NOT NULL,
    id_zaloga INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Polaczenia (
    id INT NOT NULL AUTO_INCREMENT,
    id_samolotu INT NOT NULL,
    id_lotniska_start INT NOT NULL,
    id_lotniska_koniec INT NOT NULL,
    godzina_start TIME NOT NULL,
    godzina_koniec TIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_samolotu) REFERENCES Samoloty(id),
    FOREIGN KEY (id_lotniska_start) REFERENCES Lotniska(id),
    FOREIGN KEY (id_lotniska_koniec) REFERENCES Lotniska(id)
);

CREATE TABLE Bilety (
    id INT NOT NULL AUTO_INCREMENT,
    id_lotu INT NOT NULL,
    id_klasy INT NOT NULL,
    id_klienta INT NOT NULL,
    data_wylotu DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_lotu) REFERENCES Polaczenia(id),
    FOREIGN KEY (id_klasy) REFERENCES Klasy(id),
    FOREIGN KEY (id_klienta) REFERENCES Klienci(id)
);

INSERT INTO Klienci (imie, nazwisko, telefon, adres, email) VALUES
    ('Laurence', 'Bleacher', '512 404 4389', '116 Ramsey Court', 'lbleacher0@miibeian.gov.cn'),
    ('Martyn', 'Daelman', '966 387 4677', '34 Cardinal Way', 'mdaelman1@xinhuanet.com'),
    ('Gerardo', 'Jinda', '329 405 5355', '61040 Schmedeman Place', 'gjinda2@google.it'),
    ('Brendon', 'Freen', '753 469 6034', '136 Clarendon Street', 'bfreen3@dropbox.com'),
    ('Evelyn', 'Whitmarsh', '292 688 7190', '6 Little Fleur Road', 'ewhitmarsh4@harvard.edu'),
    ('Gottfried', 'Beardsdale', '351 914 9672', '9005 Sloan Lane', 'gbeardsdale5@japanpost.jp'),
    ('Brannon', 'Jakubczyk', '821 898 9926', '1 Doe Crossing Court', 'bjakubczyk6@wix.com'),
    ('Dorey', 'Drage', '376 348 4277', '3546 Oxford Hill', 'ddrage7@exblog.jp'),
    ('Kirk', 'Ratie', '997 972 3267', '470 Hanover Court', 'kratie8@businesswire.com'),
    ('Barbra', 'Machan', '492 555 8630', '906 Maryland Plaza', 'bmachan9@weebly.com'),
    ('Lazaro', 'Kira', '687 790 4429', '04627 Carey Crossing', 'lkiraa@facebook.com'),
    ('Winthrop', 'Lambourne', '106 388 3974', '3 Oxford Lane', 'wlambourneb@edublogs.org'),
    ('Junina', 'Castellani', '565 186 6451', '6 Hudson Plaza', 'jcastellanic@dailymail.co.uk'),
    ('Augustine', 'Paish', '833 564 9485', '9 Hazelcrest Road', 'apaishd@google.es'),
    ('Queenie', 'Marqyes', '307 183 2730', '33060 Veith Terrace', 'qmarqyese@unesco.org'),
    ('Mabelle', 'Le Hucquet', '547 531 9897', '5190 Comanche Lane', 'mlehucquetf@psu.edu'),
    ('Godfree', 'Norcross', '429 622 6323', '977 Lindbergh Avenue', 'gnorcrossg@qq.com'),
    ('Hilary', 'Charte', '855 970 1645', '9 Oakridge Alley', 'hcharteh@yahoo.com'),
    ('Nikolaos', 'Bozier', '399 509 1538', '986 Southridge Trail', 'nbozieri@weebly.com'),
    ('Chaunce', 'Stimpson', '937 364 4251', '63 Alpine Center', 'cstimpsonj@archive.org'),
    ('Cam', 'Wilstead', '949 302 3700', '3 Springview Lane', 'cwilsteadk@sphinn.com'),
    ('Lynne', 'Gladbeck', '761 563 2843', '22615 Katie Place', 'lgladbeckl@japanpost.jp'),
    ('Leontine', 'Molfino', '322 992 5137', '53 Mccormick Avenue', 'lmolfinom@va.gov'),
    ('Tomasina', 'Lorek', '281 535 3327', '285 Golf View Avenue', 'tlorekn@bloomberg.com'),
    ('Rodrick', 'Corss', '816 316 3734', '23 4th Pass', 'rcorsso@yahoo.com'),
    ('Conny', 'Swaby', '613 955 6510', '0 Charing Cross Point', 'cswabyp@apple.com'),
    ('Klaus', 'Ingerman', '354 583 0080', '936 Ruskin Avenue', 'kingermanq@about.me'),
    ('Ian', 'Lethieulier', '755 829 9085', '97 Reinke Hill', 'ilethieulierr@reverbnation.com'),
    ('Staci', 'Crann', '110 716 8854', '2 Portage Hill', 'scranns@time.com'),
    ('Olympia', 'Caldecott', '937 474 6368', '5828 Chinook Circle', 'ocaldecottt@guardian.co.uk'),
    ('Martyn', 'Daelman', '966 387 4677', '34 Cardinal Way', 'mdaelman1@xinhuanet.com'),
    ('Gerardo', 'Jinda', '329 405 5355', '61040 Schmedeman Place', 'gjinda2@google.it'),
    ('Brendon', 'Freen', '753 469 6034', '136 Clarendon Street', 'bfreen3@dropbox.com'),
    ('Evelyn', 'Whitmarsh', '292 688 7190', '6 Little Fleur Road', 'ewhitmarsh4@harvard.edu'),
    ('Gottfried', 'Beardsdale', '351 914 9672', '9005 Sloan Lane', 'gbeardsdale5@japanpost.jp'),
    ('Brannon', 'Jakubczyk', '821 898 9926', '1 Doe Crossing Court', 'bjakubczyk6@wix.com'),
    ('Dorey', 'Drage', '376 348 4277', '3546 Oxford Hill', 'ddrage7@exblog.jp'),
    ('Kirk', 'Ratie', '997 972 3267', '470 Hanover Court', 'kratie8@businesswire.com'),
    ('Barbra', 'Machan', '492 555 8630', '906 Maryland Plaza', 'bmachan9@weebly.com'),
    ('Lazaro', 'Kira', '687 790 4429', '04627 Carey Crossing', 'lkiraa@facebook.com'),
    ('Winthrop', 'Lambourne', '106 388 3974', '3 Oxford Lane', 'wlambourneb@edublogs.org'),
    ('Junina', 'Castellani', '565 186 6451', '6 Hudson Plaza', 'jcastellanic@dailymail.co.uk'),
    ('Augustine', 'Paish', '833 564 9485', '9 Hazelcrest Road', 'apaishd@google.es'),
    ('Queenie', 'Marqyes', '307 183 2730', '33060 Veith Terrace', 'qmarqyese@unesco.org'),
    ('Mabelle', 'Le Hucquet', '547 531 9897', '5190 Comanche Lane', 'mlehucquetf@psu.edu'),
    ('Godfree', 'Norcross', '429 622 6323', '977 Lindbergh Avenue', 'gnorcrossg@qq.com'),
    ('Hilary', 'Charte', '855 970 1645', '9 Oakridge Alley', 'hcharteh@yahoo.com'),
    ('Nikolaos', 'Bozier', '399 509 1538', '986 Southridge Trail', 'nbozieri@weebly.com'),
    ('Chaunce', 'Stimpson', '937 364 4251', '63 Alpine Center', 'cstimpsonj@archive.org'),
    ('Cam', 'Wilstead', '949 302 3700', '3 Springview Lane', 'cwilsteadk@sphinn.com'),
    ('Lynne', 'Gladbeck', '761 563 2843', '22615 Katie Place', 'lgladbeckl@japanpost.jp'),
    ('Leontine', 'Molfino', '322 992 5137', '53 Mccormick Avenue', 'lmolfinom@va.gov'),
    ('Tomasina', 'Lorek', '281 535 3327', '285 Golf View Avenue', 'tlorekn@bloomberg.com'),
    ('Rodrick', 'Corss', '816 316 3734', '23 4th Pass', 'rcorsso@yahoo.com'),
    ('Conny', 'Swaby', '613 955 6510', '0 Charing Cross Point', 'cswabyp@apple.com'),
    ('Klaus', 'Ingerman', '354 583 0080', '936 Ruskin Avenue', 'kingermanq@about.me'),
    ('Ian', 'Lethieulier', '755 829 9085', '97 Reinke Hill', 'ilethieulierr@reverbnation.com'),
    ('Staci', 'Crann', '110 716 8854', '2 Portage Hill', 'scranns@time.com'),
    ('Olympia', 'Caldecott', '937 474 6368', '5828 Chinook Circle', 'ocaldecottt@guardian.co.uk');

INSERT INTO Klasy (nazwa, cena) VALUES
  ('Economy', 70),
  ('Business', 140),
  ('First', 280);

INSERT INTO Pilot (imie, nazwisko, data_urodzenia, data_zatrudnienia, pensja) VALUES
    ('Jan', 'Kowalski', '1990-01-01', '2010-01-01', 5000),
    ('Adam', 'Nowak', '1991-01-01', '2011-01-01', 6000),
    ('Piotr', 'Kowalczyk', '1992-01-01', '2012-01-01', 7000),
    ('Michał', 'Nowakowski', '1993-01-01', '2013-01-01', 8000),
    ('Krzysztof', 'Kowalewski', '1994-01-01', '2014-01-01', 9000),
    ('Tomasz', 'Nowicki', '1995-01-01', '2015-01-01', 10000),
    ('Jakub', 'Kowalik', '1996-01-01', '2016-01-01', 11000),
    ('Marek', 'Nowakowski', '1997-01-01', '2017-01-01', 12000),
    ('Paweł', 'Kowalski', '1998-01-01', '2018-01-01', 13000),
    ('Maciej', 'Nowak', '1999-01-01', '2019-01-01', 14000),
    ('Mateusz', 'Kowalczyk', '2000-01-01', '2020-01-01', 15000),
    ('Kacper', 'Nowakowski', '2001-01-01', '2021-01-01', 16000),
    ('Filip', 'Kowalewski', '2002-01-01', '2022-01-01', 17000),
    ('Dawid', 'Nowicki', '2003-01-01', '2023-01-01', 18000),
    ('Szymon', 'Kowalik', '2004-01-01', '2024-01-01', 19000);

INSERT INTO Stewardesa (imie, nazwisko, data_urodzenia, data_zatrudnienia, pensja) VALUES
    ("Cheryl","Waller","1991-08-9","2020-09-19",5729),
  ("Kristen","Mccarty","1983-05-3","2023-06-30",9170),
  ("Jena","Lowery","1985-07-11","2016-05-18",8765),
  ("Iris","Juarez","1990-11-11","2019-08-11",8703),
  ("Jenette","Conrad","1990-06-12","2021-02-25",8503),
  ("Hedda","Wolfe","1986-12-14","2020-11-5",8196),
  ("Lacota","Galloway","1993-06-3","2016-01-24",8705),
  ("Evelyn","Ramirez","1986-11-28","2023-01-2",8094),
  ("Grace","Macias","1982-03-28","2017-07-5",6025),
  ("Hadassah","Crane","1988-12-13","2019-01-15",5452),
  ("Kiara","Robbins","1994-08-16","2023-10-16",7674),
  ("Abra","Burris","1982-02-8","2020-12-21",6031),
  ("Cheryl","Lott","1992-01-15","2020-10-29",5701),
  ("Priscilla","Fernandez","1992-02-25","2021-01-24",5837),
  ("Xaviera","Cooper","1990-08-6","2020-02-8",7544),
  ("Amber","Beasley","1981-12-9","2018-06-25",9026),
  ("Wynter","Terry","1982-12-20","2021-12-18",6438),
  ("Grace","Marsh","1994-01-6","2016-01-27",7123),
  ("Ruby","Black","1985-01-5","2021-10-15",5241),
  ("Fallon","Burns","1987-02-3","2023-09-22",6018),
  ("Blossom","Reilly","1989-10-28","2018-03-2",8313),
  ("Maggy","Barron","1994-11-29","2023-04-26",8533),
  ("Lilah","Gillespie","1982-05-30","2023-08-15",8205),
  ("Lucy","Noble","1991-02-26","2019-03-11",6321),
  ("Yetta","Serrano","1987-10-14","2020-03-5",9226),
  ("Ursa","Justice","1993-12-31","2016-08-13",8159),
  ("Jessamine","Decker","1985-01-12","2018-09-3",8646),
  ("September","Whitehead","1991-03-30","2021-07-13",5669),
  ("Dai","Hanson","1993-06-30","2018-01-25",9815),
  ("Alexandra","Jensen","1991-11-20","2022-11-10",5971);

INSERT INTO Lotniska (nazwa, miasto, kraj) VALUES
    ('Warszawa Chopin', 'Warszawa', 'Polska'),
    ('Kraków Balice', 'Kraków', 'Polska'),
    ('Gdańsk Lech Wałęsa', 'Gdańsk', 'Polska'),
    ('Heathrow', 'Londyn', 'Wielka Brytania'),
    ('Charles de Gaulle', 'Paryż', 'Francja'),
    ('Frankfurt am Main', 'Frankfurt', 'Niemcy'),
    ('Amsterdam Schiphol', 'Amsterdam', 'Holandia'),
    ('Barcelona El Prat', 'Barcelona', 'Hiszpania'),
    ('Rome Fiumicino', 'Rzym', 'Włochy'),
    ('Atatürk', 'Istanbul', 'Turcja');

INSERT INTO Zaloga (id, id_pilot, id_stewardesa) VALUES
    (2,10,17),
    (8,4,26),
    (9,5,16),
    (4,13,27),
    (2,4,24),
    (4,3,2),
    (3,1,13),
    (4,5,17),
    (4,12,16),
    (3,8,24),
    (10,2,1),
    (4,6,3),
    (1,3,6),
    (9,10,6),
    (8,5,19),
    (7,11,21),
    (4,7,21),
    (8,6,16),
    (7,9,29),
    (4,2,17),
    (10,1,4),
    (9,5,18),
    (2,5,28),
    (9,14,2),
    (7,1,21),
    (8,9,23),
    (6,14,8),
    (2,9,21),
    (2,7,1),
    (2,1,10),
    (3,5,19),
    (8,7,28),
    (4,5,18),
    (6,7,27),
    (9,7,18),
    (3,8,9),
    (9,10,25),
    (7,2,14),
    (3,5,13),
    (4,2,13);


INSERT INTO Samoloty  (nazwa, ilosc_miejsc, stan, id_zaloga) VALUES
    ('Boeing 737-800', 200, 'Sprawny', 1),
    ('Air-Bus A320', 150, 'Sprawny', 2),
    ('Air-Bus A330', 290, 'Uszkodzony', 3),
    ('Air-Bus A380', 220, 'Sprawny', 4),
    ('Boeing 747-400', 110, 'Uszkodzony', 5),
    ('Boeing 314 Clipper', 100, 'Sprawny', 6),
    ('Boeing 707', 230, 'Sprawny', 7),
    ('McDonnell Douglas DC-9', 130, 'Sprawny', 8),
    ('Boeing 301', 80, 'Uszkodzony', 9),
    ('Boeing 727', 90, 'Sprawny', 10);

INSERT INTO Polaczenia (id_samolotu, id_lotniska_start, id_lotniska_koniec, godzina_start, godzina_koniec) VALUES
    (1,1,2,"10:00","12:00"),
    (2,2,3,"11:00","13:00"),
    (3,3,4,"12:00","14:00"),
    (4,4,5,"13:00","15:00"),
    (5,5,6,"14:00","16:00"),
    (6,6,7,"15:00","17:00"),
    (7,7,8,"16:00","18:00"),
    (8,8,9,"17:00","19:00"),
    (9,9,10,"18:00","20:00"),
    (10,10,1,"19:00","21:00"),
    (1,2,1,"13:00","15:00"),
    (2,3,2,"14:00","16:00"),
    (3,4,3,"15:00","17:00"),
    (4,5,4,"16:00","18:00"),
    (5,6,5,"17:00","19:00"),
    (6,7,6,"18:00","20:00"),
    (7,8,7,"19:00","21:00"),
    (8,9,8,"19:00","22:00"),
    (9,10,9,"20:00","23:00"),
    (10,1,10,"21:00","24:00");

INSERT INTO Bilety (id_lotu, id_klasy, id_klienta, data_wylotu) VALUES
  (12,3,15,"2023-01-04"),
  (9,2,17,"2022-11-23"),
  (20,2,5,"2022-05-21"),
  (4,1,28,"2023-11-06"),
  (4,2,10,"2022-10-21"),
  (19,3,3,"2023-04-29"),
  (20,1,4,"2023-03-20"),
  (17,2,18,"2023-04-04"),
  (13,2,29,"2022-04-10"),
  (16,2,8,"2023-02-28"),
  (1,2,14,"2022-04-20"),
  (6,3,13,"2022-07-06"),
  (5,2,1,"2022-03-06"),
  (6,2,19,"2022-01-18"),
  (16,2,11,"2023-01-05"),
  (11,3,30,"2023-01-15"),
  (1,2,1,"2023-01-25"),
  (13,1,2,"2023-03-21"),
  (13,3,1,"2023-04-04"),
  (1,2,25,"2023-01-05");

-- Do bazy danych z zadania 6 proszę dodać przy pomocy procedur przynajmniej 3 samoloty, 15 pasazerów, wybranych członków załogi oraz 3 loty.
DROP PROCEDURE IF EXISTS dodaj_samolot;


DELIMITER //
CREATE PROCEDURE dodaj_samolot (
  nazwa VARCHAR(20),
  ilosc_miejsc INT,
  stan VARCHAR(20),
  id_zaloga INT
)
BEGIN
  INSERT INTO samoloty (nazwa, ilosc_miejsc, stan, id_zaloga)
  VALUES (nazwa, ilosc_miejsc, stan, id_zaloga);
END //
DELIMITER ;

CALL dodaj_samolot('Airbus A320', 150, 'Sprawny', 1);
CALL dodaj_samolot('Boeing 737', 200, 'Sprawny', 2);
CALL dodaj_samolot('Bombardier CRJ700', 70, 'W remoncie', 3);
CALL dodaj_samolot('Embraer 175', 90, 'Sprawny', 4);


DROP PROCEDURE IF EXISTS dodaj_pasazera;

DELIMITER //
CREATE PROCEDURE dodaj_pasazera (
  imie VARCHAR(20),
  nazwisko VARCHAR(20),
  telefon VARCHAR(20),
  adres VARCHAR(50),
  email VARCHAR(50)
)
BEGIN
  INSERT INTO pasazerowie (imie, nazwisko, telefon, adres, email)
  VALUES (imie, nazwisko, telefon, adres, email);
END //
DELIMITER ;

CALL dodaj_pasazera('Anna', 'Nowak', "123456789", 'ul. Krakowska 1, Warszawa', 'annanowak@gmail.com');
CALL dodaj_pasazera('Jan', 'Kowalski', "987654321", 'ul. Warszawska 2, Warszawa', 'jankowalski@gmail.com');
CALL dodaj_pasazera('Piotr', 'Wiśniewski', "135792468", 'ul. Poznańska 3, Warszawa', 'piotrwisniewski@gmail.com');
CALL dodaj_pasazera('Agnieszka', 'Dąbrowska', "246813579", 'ul. Wrocławska 4, Warszawa', 'agnieszkadabrowska@gmail.com');
CALL dodaj_pasazera('Marta', 'Zielińska', "369125874", 'ul. Gdańska 5, Warszawa', 'martazielinska@gmail.com');
CALL dodaj_pasazera('Katarzyna', 'Kwiatkowska', "444444444", 'ul. Lipowa 6, Kraków', 'katarzyna.kwiatkowska@gmail.com');
CALL dodaj_pasazera('Tomasz', 'Lewandowski', "555555555", 'ul. Słoneczna 7, Gdynia', 'tomasz.lewandowski@gmail.com');
CALL dodaj_pasazera('Marcin', 'Wojciechowski', "666666666", 'ul. Polna 8, Poznań', 'marcin.wojciechowski@gmail.com');
CALL dodaj_pasazera('Joanna', 'Mazur', "777777777", 'ul. Kwiatowa 9, Warszawa', 'joanna.mazur@gmail.com');
CALL dodaj_pasazera('Paweł', 'Kozłowski', "888888888", 'ul. Lipowa 10, Kraków', 'pawel.kozlowski@gmail.com');
CALL dodaj_pasazera('Magdalena', 'Jankowska', "999999999", 'ul. Słoneczna 11, Gdynia', 'magdalena.jankowska@gmail.com');
CALL dodaj_pasazera('Piotr', 'Wiśniewski', "789456123", 'ul. Parkowa 1, 00-003 Wrocław', 'pwisniewski@example.com');
CALL dodaj_pasazera('Agnieszka', 'Dąbrowska', "456123789", 'ul. Kwiatowa 2, 00-004 Poznań', 'adabrowska@example.com');
CALL dodaj_pasazera('Marta', 'Zielińska', "321654987", 'ul. Spokojna 5, 00-005 Gdańsk', 'mzielinska@example.com');
CALL dodaj_pasazera('Katarzyna', 'Kwiatkowska', "147852306", 'ul. Lipowa 3, 00-006 Szczecin', 'kkwiatkowska@example.com');
CALL dodaj_pasazera('Tomasz', 'Lewandowski', "789456123", 'ul. Leśna 4, 00-007 Łódź', 'tlewandowski@example.com');
CALL dodaj_pasazera('Marcin', 'Wojciechowski', "987654321", 'ul. Jagodowa 5, 00-008 Zielona Góra', 'mwojciechowski@example.com');
CALL dodaj_pasazera('Joanna', 'Mazur', "654321789", 'ul. Brzozowa 6, 00-009 Katowice', 'jmazur@example.com');


DROP PROCEDURE IF EXISTS dodaj_pilota;

DELIMITER //
CREATE PROCEDURE dodaj_pilota (
  imie VARCHAR(20),
  nazwisko VARCHAR(20),
  data_urodzenia DATE,
  data_zatrudnienia DATE,
  pensja FLOAT
)
BEGIN
  INSERT INTO piloci (imie, nazwisko, data_urodzenia, data_zatrudnienia, pensja)
  VALUES (imie, nazwisko, data_urodzenia, data_zatrudnienia, pensja);
END //
DELIMITER ;

CALL dodaj_pilota('Mohammed', 'Al-Saud', '1980-01-01', '2010-01-01', 50000);
CALL dodaj_pilota('Yi', 'Lee', '1985-05-12', '2012-02-14', 55000);
CALL dodaj_pilota('Sofia', 'Ivanova', '1970-11-25', '2015-03-11', 60000);
CALL dodaj_pilota('Oluwasegun', 'Babatunde', '1990-02-14', '2017-07-31', 65000);
CALL dodaj_pilota('Alessandro', 'Ferrari', '1986-03-11', '2018-09-06', 70000);

DROP PROCEDURE IF EXISTS dodaj_lot;

DELIMITER //
CREATE PROCEDURE dodaj_lot (
  id_samolotu INT,
  id_lotniska_start INT,
  id_lotniska_koniec INT,
  godzina_start TIME,
  godzina_koniec TIME
)
BEGIN
  INSERT INTO polaczenia (id_samolotu, id_lotniska_start, id_lotniska_koniec, godzina_start, godzina_koniec)
  VALUES (id_samolotu, id_lotniska_start, id_lotniska_koniec, godzina_start, godzina_koniec);
END //

DELIMITER ;

CALL dodaj_lot(1, 1, 2, '14:00:00', '16:00:00');
CALL dodaj_lot(2, 2, 3, '17:00:00', '19:00:00');
CALL dodaj_lot(3, 3, 1, '20:00:00', '22:00:00');



-- a) przydzielającą samoloty do lotów (należy pamiętać, aby nie przydzielić samolotu do trasy dłuższej niż jego zasięg o ile baza nie przywiduje międzylądowania na trasie),

--Alter table samoloty add column zasięg INT;
ALTER TABLE samoloty ADD COLUMN zasięg INT;

UPDATE samoloty
SET zasięg = ROUND(RAND() * (7000 - 1000) + 1000)
WHERE zasięg IS NULL;

--Alter table polaczenia add column odleglosc INT;
ALTER TABLE polaczenia ADD COLUMN odleglosc INT;

UPDATE polaczenia
SET odleglosc = ROUND(RAND() * (7000 - 1000) + 1000)
WHERE odleglosc IS NULL;




-- ZADANIE 8

-- wyświetlić przy pomocy funkcji nazwiska pasażerów oraz klasę podróży (dla każdego lotu)

DROP FUNCTION IF EXISTS pasazerowie;
DROP FUNCTION IF EXISTS usunSamolotLot;

DELIMITER $$
CREATE FUNCTION pasazerowie(pasazer INT)
RETURNS VARCHAR(100)
BEGIN
  DECLARE klasa VARCHAR(50);
  DECLARE bilet_id INT;
  DECLARE klasa_id INT;
  SET bilet_id = (SELECT id FROM Bilety WHERE id_klienta = pasazer LIMIT 1);
  SET klasa_id = (SELECT id_klasy FROM Bilety WHERE id = bilet_id LIMIT 1);
  IF klasa_id = 1 THEN
    SET klasa = 'Economy';
  END IF;
  IF klasa_id = 2 THEN
    SET klasa = 'Business';
  END IF;
  IF klasa_id = 3 THEN
    SET klasa = 'First';
  END IF;
  RETURN klasa;
END$$
DELIMITER ;

SELECT pasazerowie(id) AS 'Klasa podróży', nazwisko AS 'Nazwisko pasażera' FROM Klienci;

-- usunąć jeden z samolotów oraz jeden z lotów

DELIMITER $$
CREATE FUNCTION usunSamolotLot(lot INT, samolot INT)
RETURNS INT
BEGIN
  DECLARE i INT;
  DECLARE ile_bilety INT;
  DECLARE bilet INT;
  SET i = 1;

  UPDATE Polaczenia SET id = 0 WHERE id = lot;
  UPDATE Samoloty SET id = 0 WHERE id = samolot;
  UPDATE Bilety SET id = 0 WHERE id_lotu = lot;

  SET ile_bilety = (SELECT COUNT(*) FROM Bilety);

  WHILE i <= ile_bilety DO
    SET bilet = (SELECT id FROM Bilety WHERE id_lotu = lot LIMIT 1);
    DELETE FROM Bilety WHERE id = bilet;
    DELETE FROM
    SET i = i + 1;
  END WHILE;

  DELETE FROM Bilety WHERE id_lotu = lot;
  DELETE FROM Polaczenia WHERE id = lot;
  DELETE FROM Samoloty WHERE id = samolot;

  RETURN 1;
END$$
DELIMITER ;

SELECT usunSamolotLot(1, 1);

-- ponownie wyświetlić przy pomocy funkcji nazwiska pasażerów oraz klasę podróży


SELECT pasazerowie(id) AS 'Klasa podróży', nazwisko AS 'Nazwisko pasażera' FROM Klienci;