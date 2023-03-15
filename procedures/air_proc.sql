-- Create 3 sample procedures
CREATE PROCEDURE zalogi (IN id INT, OUT ilosc_zalog INT)
       BEGIN
         SELECT MAX(id) INTO ilosc_zalog FROM Zaloga WHERE id = id;
       END