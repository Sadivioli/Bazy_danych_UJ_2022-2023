
SELECT * FROM Produkty WHERE Produkty.nazwa = "Zeszyt";
SELECT * FROM Faktury WHERE Faktury.kwota >= 1000;
SELECT * FROM Zamowienia ORDER BY Zamowienia.kwota DESC LIMIT 10;
SELECT * FROM Faktury INNER JOIN Dostawcy ON Faktury.id_dostawcy = Dostawcy.id_dostawcy WHERE Dostawcy.nazwa = "Abc";