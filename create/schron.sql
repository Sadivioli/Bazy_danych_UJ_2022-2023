DROP TABLE IF EXISTS Osoby_adoptujace;
CREATE TABLE Osoby_adoptujace (
    id_osoby INT NOT NULL AUTO_INCREMENT,
    imie VARCHAR(20) NOT NULL,
    nazwisko VARCHAR(20) NOT NULL,
    adres VARCHAR(50) NOT NULL,
    telefon VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_osoby)
);

DROP TABLE IF EXISTS Zwierzeta;
CREATE TABLE Zwierzeta (
    id_zwierz INT NOT NULL AUTO_INCREMENT,
    imie VARCHAR(20) NOT NULL,
    gatunek VARCHAR(20) NOT NULL,
    rasa VARCHAR(20),
    wiek INT NOT NULL,
    data_przyjęcia DATE NOT NULL,
    masc VARCHAR(20),
    plec VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_zwierz)
);

DROP TABLE IF EXISTS Pracownicy;
CREATE TABLE Pracownicy (
    id_prac INT NOT NULL AUTO_INCREMENT,
    imie VARCHAR(20) NOT NULL,
    nazwisko VARCHAR(20) NOT NULL,
    adres VARCHAR(50),
    telefon VARCHAR(20),
    stanowisko VARCHAR(20),
    pensja FLOAT,
    PRIMARY KEY (id_prac)
);

DROP TABLE IF EXISTS Adopcje;
CREATE TABLE Adopcje (
    id_adopcji INT NOT NULL AUTO_INCREMENT,
    id_osoby INT NOT NULL,
    id_zwierz INT NOT NULL,
    id_prac INT NOT NULL,
    data_adopcji DATE NOT NULL,
    uwagi VARCHAR(50),
    PRIMARY KEY (id_adopcji),
    FOREIGN KEY (id_osoby) REFERENCES Osoby_adoptujace(id_osoby),
    FOREIGN KEY (id_zwierz) REFERENCES Zwierzeta(id_zwierz),
    FOREIGN KEY (id_prac) REFERENCES Pracownicy(id_prac)
);

