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
  cena INT NOT NULL,
  wartosc INT NOT NULL,
  PRIMARY KEY (id_trans),
  FOREIGN KEY (id_faktury) REFERENCES Faktury(numer)
)
/*ALTER TABLE*/
ALTER TABLE Dostawcy ADD NIP INT;

INSERT INTO Klienci (imie, nazwisko, telefon, adres, email) VALUES
  ("Gisela","Barrett","184323254","393-9825 Lectus Ave","nunc.quisque@yahoo.couk"),
  ("Galvin","Compton","170529237","Ap #232-9839 Accumsan Ave","imperdiet.ullamcorper.duis@hotmail.net"),
  ("Brent","Rush","483123739","Ap #190-1305 Nunc Ave","auctor@outlook.ca"),
  ("Jared","Williams","929191131","6757 Mollis Rd.","felis.eget@outlook.couk"),
  ("Freya","Mcleod","865298163","Ap #137-3729 Et Rd.","nullam.lobortis@protonmail.edu"),
  ("Britanni","Chang","240417477","225-6837 Ullamcorper Road","faucibus.orci@aol.couk"),
  ("Destiny","Adkins","645612763","429-9520 Duis St.","dui.fusce@yahoo.couk"),
  ("Vielka","Fernandez","878154173","Ap #861-283 Posuere, St.","eu@yahoo.edu"),
  ("Ethan","Smith","979399519","551-1512 Magna St.","suscipit.nonummy@yahoo.org"),
  ("Hope","Bailey","666082518","Ap #642-9438 Nec St.","quis.tristique@outlook.com"),
  ("Lareina","Shaw","821084751","vehicula.risus@icloud.couk","486-9641 In Avenue"),
  ("Levi","Evans","575909732","et.magnis@outlook.org","P.O. Box 825, 7397 Consectetuer Ave"),
  ("Colorado","Lowery","187834053","nam.ligula@hotmail.ca","3589 Pede Av."),
  ("Chiquita","Rose","537541974","vehicula.pellentesque.tincidunt@yahoo.edu","6672 Amet Av."),
  ("Germaine","Bradford","226880845","etiam.bibendum@outlook.com","P.O. Box 760, 5394 Donec Rd."),
  ("Forrest","Aguilar","619543666","at.nisi@aol.edu","Ap #470-3106 Quis, Avenue"),
  ("Sasha","Jacobson","757682064","sit.amet@hotmail.com","Ap #569-5568 Ac, Av."),
  ("Paki","Chaney","867986618","tempor.lorem@hotmail.edu","Ap #874-4392 Dignissim. Rd."),
  ("Pearl","Golden","966630257","libero@outlook.couk","672-5240 Aliquet St."),
  ("Audra","Leon","422122400","eros@icloud.ca","4940 Varius. St."),
  ("Denise","Mejia","033915367","1063 Montes, Road","condimentum.donec@icloud.com"),
  ("Orli","Johns","523381158","382-8364 Odio. Avenue","vulputate.ullamcorper@aol.edu"),
  ("Christine","Cash","255449516","Ap #862-8852 Nulla Street","justo.faucibus@google.net"),
  ("Marah","Collins","637114647","P.O. Box 432, 8079 Amet Rd.","erat.neque.non@hotmail.edu"),
  ("Brenda","Coffey","516472630","Ap #934-3084 Velit. St.","curabitur.sed@aol.org"),
  ("Marah","Barnes","785157735","3153 Vulputate Rd.","dis.parturient.montes@google.org"),
  ("Tanisha","Livingston","837963285","Ap #619-2013 Convallis Rd.","sit@google.net"),
  ("Hollee","Delaney","636551163","P.O. Box 421, 8219 Congue St.","pellentesque@google.couk"),
  ("Martin","Forbes","189411914","P.O. Box 457, 2064 Ipsum. Rd.","placerat@hotmail.ca"),
  ("Nissim","Carpenter","650742483","351-8052 Nibh Ave","facilisi.sed@aol.com");

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

INSERT INTO Dostawcy (nazwa, adres, email) VALUES
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
  ("Teczka",11,10,5),
  ("Dziurkacze",22,33,4),
  ("Etui",21,28,5),
  ("Kalkulatory",5,57,4),
  ("Blok.",8,7,3),
  ("Blok techniczny,",19,34,2),
  ("Blok B5.",29,45,1),
  ("Notes",10,16,3),
  ("Notes A5",24,20,5),
    ("Zeszyt",13,16,1),
  ("Naklejki",1,59,2),
  ("Karteczki",23,1,5),
  ("Płótno malarskie",13,4,4),
  ("Dyplom",21,56,4),
  ("Papier ozdobny",19,14,3),
  ("Klips,",5,36,1),
  ("Spinacz",3,10,4),
    ("Zeszyt,",5,5,1),
  ("Zszywki",18,34,1),
  ("Gumki,",30,37,2),
  ("Temperówki",28,44,4),
    ("Zeszyt",16,13,4),
  ("Taśma",15,23,4),
  ("Kleje",26,41,2),
    ("Zeszyt",18,8,2);
  
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

INSERT INTO Faktury (id_dostawcy, data_wystawienia, data_platnosci, kwota) VALUES
  (5,"14.02.22","10.07.23",8724),
  (3,"23.03.22","27.05.22",13615),
  (3,"06.01.22","20.12.22",1445),
  (2,"15.02.21","10.01.23",10365),
  (5,"26.04.22","11.01.22",10542),
  (2,"13.07.22","29.07.23",1450),
  (5,"26.12.21","20.11.21",11658),
  (4,"18.11.22","12.06.23",1460),
  (3,"17.07.22","11.09.23",10309),
  (5,"16.02.23","22.03.23",4111),
  (2,"27.01.21","26.02.22",12689),
  (5,"20.09.22","08.07.22",1072),
  (3,"26.07.22","28.02.22",3364),
  (2,"27.09.21","04.09.23",8668),
  (4,"07.07.22","06.03.22",6123),
  (2,"17.03.22","26.12.22",5715),
  (4,"21.08.21","28.10.23",2273),
  (3,"26.06.22","28.03.23",1133),
  (4,"11.12.21","05.08.22",3357),
  (3,"05.01.23","06.06.22",9900),
  (2,"31.05.22","28.04.21",5885),
  (2,"06.10.22","04.01.22",6636),
  (3,"24.10.22","01.12.21",13611),
  (4,"02.02.21","03.10.21",1047),
  (3,"13.01.21","21.07.23",7488),
  (4,"04.05.23","25.05.23",4772),
  (2,"19.07.21","20.10.21",9415),
  (4,"10.01.22","30.11.21",12460),
  (4,"20.01.22","07.09.21",14833),
  (4,"04.08.22","03.01.23",6763);

SELECT * FROM Produkty WHERE Produkty.nazwa = "Zeszyt";
SELECT * FROM Faktury WHERE Faktury.kwota >= 1000;
SELECT * FROM Zamowienia ORDER BY Zamowienia.kwota DESC LIMIT 10;
SELECT * FROM Faktury INNER JOIN Dostawcy ON Faktury.id_dostawcy = Dostawcy.id_dostawcy WHERE Dostawcy.nazwa = "Abc";
