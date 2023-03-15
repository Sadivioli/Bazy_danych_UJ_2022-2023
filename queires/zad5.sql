DROP TABLE IF EXISTS Klienci;
CREATE TABLE Klienci (
    id_klienta INT NOT NULL AUTO_INCREMENT,
    imie VARCHAR(20) NOT NULL,
    nazwisko VARCHAR(20) NOT NULL,
    telefon INT,
    adres VARCHAR(50),
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_klienta)
);

DROP TABLE IF EXISTS Zamowienia;
CREATE TABLE Zamowienia (
    id_zamowienia INT NOT NULL AUTO_INCREMENT,
    id_cart INT NOT NULL,
    id_klienta INT NOT NULL,
    data_zamowienia DATE NOT NULL,
    data_realizacji DATE,
    kwota FLOAT NOT NULL,
    PRIMARY KEY (id_zamowienia),
    FOREIGN KEY (id_klienta) REFERENCES Klienci(id_klienta)
);

DROP TABLE IF EXISTS Dostawcy;
CREATE TABLE Dostawcy (
    id_dostawcy INT NOT NULL AUTO_INCREMENT,
    firma VARCHAR(20) NOT NULL,
    adres VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_dostawcy)
);

DROP TABLE IF EXISTS Produkty;
CREATE TABLE Produkty (
    id_produktu INT NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR(20) NOT NULL,
    cena FLOAT NOT NULL,
    ilosc_na_stanie INT,
    id_dostawcy INT NOT NULL,
    PRIMARY KEY (id_produktu),
    FOREIGN KEY (id_dostawcy) REFERENCES Dostawcy(id_dostawcy)
);

DROP TABLE IF EXISTS Cart;
CREATE TABLE Cart (
    id_cart INT NOT NULL,
    id_produktu INT NOT NULL,
    ilosc INT NOT NULL,
    FOREIGN KEY (id_produktu) REFERENCES Produkty(id_produktu)
);

DROP TABLE IF EXISTS Faktury;
CREATE TABLE Faktury (
    numer INT NOT NULL,
    id_dostawcy INT NOT NULL,
    data_wystawienia DATE NOT NULL,
    data_platnosci DATE,
    kwota FLOAT NOT NULL,
    id_faktury INT NOT NULL,
    PRIMARY KEY (numer),
    FOREIGN KEY (id_dostawcy) REFERENCES Dostawcy(id_dostawcy)
);

DROP TABLE IF EXISTS Transakcje;
CREATE TABLE Transakcje (
  id_trans INT NOT NULL AUTO_INCREMENT,
  buyORsell varchar(20) NOT NULL,
  id_produktu INT NOT NULL.
  ilosc INT NOT NULL,
  id_faktury INT NOT NULL,
  jm varchar(20) NOT NULL,
  PRIMARY KEY (id_trans),
  FOREIGN KEY (id_faktury) REFERENCES Faktury(numer)
)
/*ALTER TABLE*/
ALTER TABLE Dostawcy ADD NIP INT;
ALTER TABLE Faktury ADD nrFaktury INT;

INSERT INTO Klienci (imie, nazwisko, telefon, adres, email) VALUES
  ("Gisela","Barrett","184323254","393-9825 Lectus Ave","nunc.quisque@yahoo.couk"),
  ("Galvin","Compton","170529237","Ap #232-9839 Accumsan Ave","imperdiet.ullamcorper.duis@hotmail.net"),
  ("Brent","Rush","483123739","Ap #190-1305 Nunc Ave","auctor@outlook.ca"),
  ("Jared","Williams","929191131","6757 Mollis Rd.","felis.eget@outlook.couk"),
  ("Freya","Mcleod","865298163","Ap #137-3729 Et Rd.","nullam.lobortis@protonmail.edu"),

INSERT INTO Cart (id_cart, id_produktu, ilosc) VALUES
  (1,10,5),
  (6,5,9),
  (10,24,5),
  (5,28,9),
  (6,21,4),
  (4,6,9),
  (1,16,7),
  (8,11,10),
  (1,5,3),
  (9,8,8),
  (10,15,4),
  (3,12,7),
  (9,18,5),
  (7,12,3),
  (6,4,7),
  (5,14,6),
  (4,5,9),
  (8,6,5),
  (7,25,10),
  (2,11,3);

INSERT INTO Zamowienia (id_cart, id_klienta, data_zamowienia, data_realizacji, kwota) VALUES
  (8,8,"25.11.20","13.12.21",971),
  (4,16,"15.03.22","08.01.22",275),
  (6,9,"11.08.22","02.03.22",1068),
  (1,18,"28.12.20","26.01.22",1229),
  (2,25,"13.01.21","07.04.22",1422),
  (4,3,"20.09.20","24.01.22",330),
  (8,7,"28.07.23","01.12.21",1193),
  (9,19,"22.04.21","18.01.22",1410),
  (9,13,"19.02.23","23.02.22",562),
  (6,30,"09.08.22","28.11.21",1200),
  (9,27,"18.08.23","06.02.22",60),
  (1,15,"13.08.23","21.12.21",1481),
  (8,20,"04.03.23","07.02.22",435),
  (9,8,"16.10.22","16.02.22",522),
  (1,25,"06.11.20","10.04.22",1172),
  (8,1,"08.05.23","07.12.21",1211),
  (5,1,"22.06.23","06.12.21",562),
  (2,19,"01.01.22","03.04.22",635),
  (6,26,"26.03.23","31.03.22",1184),
  (6,25,"15.03.21","26.11.21",450),
  (1,8,"05.07.23","06.12.21",779),
  (1,27,"24.09.21","29.04.22",268),
  (4,6,"04.07.23","14.01.22",523),
  (6,12,"11.10.23","22.01.22",662),
  (8,27,"18.09.22","25.01.22",1183),
  (7,12,"29.06.23","18.12.21",614),
  (7,26,"20.12.20","04.05.22",89),
  (1,21,"08.10.23","04.01.22",120),
  (3,18,"29.11.22","08.04.22",1307),
  (8,7,"06.07.23","03.05.22",1447),
  (8,20,"17.08.23","05.05.22",83),
  (1,3,"20.06.21","06.03.22",852),
  (1,17,"26.07.22","22.11.21",1098),
  (7,12,"21.11.22","16.12.21",490),
  (6,25,"03.09.22","27.02.22",1032),
  (8,17,"22.09.21","15.01.22",777),
  (5,26,"24.09.20","13.02.22",525),
  (5,19,"29.10.23","29.05.22",1389),
  (1,7,"20.10.20","18.12.21",778),
  (5,21,"10.03.23","03.04.22",1471),
  (1,3,"08.07.20","01.01.22",863),
  (1,4,"04.05.21","31.12.21",105),
  (3,8,"15.09.21","10.05.22",1263),
  (7,12,"20.03.21","12.12.21",1153),
  (6,29,"05.02.22","04.12.21",1195),
  (1,15,"16.07.21","12.11.21",894),
  (3,24,"24.01.22","27.01.22",148),
  (7,26,"05.06.22","28.02.22",1212),
  (8,21,"01.08.21","23.03.22",1000),
  (10,12,"02.07.21","03.03.22",1413);


INSERT INTO Dostawcy (firma, adres, email) VALUES
  ("Montes","860-7841 Lorem Avenue","gravida.mauris@outlook.ca", 345),
  ("Enim","4700 Dictum St.","lacinia.orci.consectetuer@outlook.ca", 456),
  ("Lorem","Ap #583-4118 Et St.","donec@google.net", 546),
  ("Mauris","476-7119 Pede Av.","augue.id.ante@outlook.couk", 981),
  ("'Abc' Jan Kowalski","Grudziadz ul. Jakas 23", NULL , 123),
  ("'Alfabet' Piotr Nowak","Kraków ul. Inna 37 ", NULL , 987);

INSERT INTO Produkty (nazwa, cena, ilosc_na_stanie, id_dostawcy) VALUES
    ("pioro wieczne 'pisz'", 100, 60, 6)
    ("zeszyt 60 kartek", 200, 20, 6)
    ("olowek cmp 23", 10, 60, 5)
    ("dlugopis wl 67", 20, 55, 5)
  ("Segregator",4,3,1),
  ("Teczka",19,8,1),
  ("Koszulki",28,44,2),
  ("Przekładki",1,3,1),
    ("Zeszyt",13,15,4),
    ("Zeszyt",13,16,1),
    ("Zeszyt,",5,5,1),
  ("Zszywki",18,34,1),
  ("Gumki,",30,37,2),
  ("Temperówki",28,44,4),
    ("Zeszyt",16,13,4),
  ("Taśma",15,23,4),
  ("Kleje",26,41,2),
    ("Zeszyt",18,8,2);
  


INSERT INTO Faktury (id_dostawcy, data_wystawienia, data_platnosci, kwota, nrFaktury) VALUES
  (5,"14.02.22","10.07.23",8724,20),
  (3,"23.03.22","27.05.22",13615,40),
  (3,"06.01.22","20.12.22",1445, 0),
  (5,"20.01.22","07.09.21",5000,3),
  (6,"04.08.22","03.01.23",500, 23434);

INSERT INTO Transakcje (buyORsell, id_produktu, ilosc, id_faktury, jm) VALUES
  ("buy", 1, 30, 4, "szt."),
  ("buy", 2, 10, 4, "szt."),
  ("buy", 3, 40, 5, "szt."),
  ("buy", 4, 5, 5, "szt.");

SELECT * FROM Produkty WHERE Produkty.nazwa = "Zeszyt";

SELECT * FROM Faktury WHERE Faktury.kwota >= 1000;
SELECT * FROM Zamowienia ORDER BY Zamowienia.kwota DESC LIMIT 10;
SELECT * FROM Faktury INNER JOIN Dostawcy ON Faktury.id_dostawcy = Dostawcy.id_dostawcy WHERE Dostawcy.nazwa = "Abc";


-- Zad 5

-- Wszystkie dane ze wszystkich tabel
SELECT * FROM Transakcje;
SELECT * FROM Faktury;
SELECT * FROM Cart;
SELECT * FROM Produkty;
SELECT * FROM Dostawcy;
SELECT * FROM Zamowienia;
SELECT * FROM Klienci;

-- Wszystkie firmy, których nazwa to: 'Abc'
SELECT * FROM Dostawcy WHERE firma = 'Abc'
-- Nazwy wszystkich firm w kolejności alfabetycznej
SELECT * FROM Dostawcy ORDER BY firma DESC;
--Trzy produkty, których liczba w magazynie przekracza 30
SELECT * FROM Produkty WHERE ilosc_na_stanie < 31;
-- Fakturę zakupu na najwyższą kwotę
SELECT * FROM Faktury ORDER BY kwota DESC LIMIT 1;
-- Nazwę produktu, liczbę sztuk, cenę oraz numer faktury, na której się znajduje
SELECT Produkty.nazwa, Produkty.ilosc_na_stanie, Produkty.cena, Faktury.nrFaktury FROM Produkty INNER JOIN Transakcje ON Produkty.id_produktu = Transakcje.id_produktu INNER JOIN Transakcje.id_faktury = Faktury.id_faktury;
