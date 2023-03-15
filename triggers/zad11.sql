DROP TABLE IF EXISTS galaxies;
DROP TABLE IF EXISTS stars;
DROP TABLE IF EXISTS planets;

CREATE TABLE galaxies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    type VARCHAR(255),
    distance FLOAT,
    insert_date DATETIME,
    modification_date DATETIME
);

CREATE TABLE stars (
    id INT PRIMARY KEY AUTO_INCREMENT,
    galaxy_id INT,
    name VARCHAR(255),
    type VARCHAR(255),
    age_e9 INT,
    mass FLOAT,
    insert_date DATETIME,
    modification_date DATETIME
);

CREATE TABLE planets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    star_id INT,
    name VARCHAR(255),
    type VARCHAR(255),
    mass FLOAT,
    insert_date DATETIME,
    modification_date DATETIME
);


INSERT INTO galaxies (name, type, distance, insert_date, modification_date)
VALUES
    ("Milky Way", "Spiral", 25000, NULL, NULL),
    ("Andromeda", "Spiral", 2.5e6, NULL, NULL),
    ("Triangulum", "Spiral", 3e6, NULL, NULL),
    ("Sombrero", "Lenticular", 28e6, NULL, NULL),
    ("Whirlpool", "Spiral", 31e6, NULL, NULL),
    ("Pinwheel", "Spiral", 21e6, NULL, NULL),
    ("Tadpole", "Spiral", 420e6, NULL, NULL),
    ("Virgo", "Elliptical", 1500e6, NULL, NULL),
    ("Cigar", "Elliptical", 2900e6, NULL, NULL),
    ("Cartwheel", "Spiral", 500e6, NULL, NULL);

INSERT INTO stars (galaxy_id, name, type, age_e9, mass, insert_date, modification_date)
VALUES
    (1, "Sol", "G-type", 45, 2e30, NULL, NULL),
    (1, "Alpha Centauri A & B", "G-type", 6, 2e30, NULL, NULL),
    (1, "Proxima Centauri", "M-type", 5, 2e29, NULL, NULL),
    (2, "HD 219134", "F-type", 7, 1.4e30, NULL, NULL),
    (2, "51 Pegasi", "G-type", 7, 1.2e30, NULL, NULL),
    (3, "BD+33 2642", "A-type", 7, 3e29, NULL, NULL),
    (3, "VV Cephei A", "M-type", 8, 2e29, NULL, NULL),
    (4, "M84 X-1", "B-type", 3, 3e29, NULL, NULL),
    (4, "M84 X-2", "O-type", 2, 3e29, NULL, NULL),
    (5, "NGC 5195 X-1", "A-type", 4, 2e29, NULL, NULL);

INSERT INTO planets (star_id, name, type, mass, insert_date, modification_date)
VALUES
    (1, "Mercury", "Terrestrial", 3.3e23, NULL, NULL),
    (1, "Venus", "Terrestrial", 4.9e24, NULL, NULL),
    (1, "Earth", "Terrestrial", 6e24, NULL, NULL),
    (1, "Mars", "Terrestrial", 6.4e23, NULL, NULL),
    (2, "Alpha Centauri B b", "Super-Earth", 2e25, NULL, NULL),
    (3, "Proxima Centauri b", "Earth-like", 3e24, NULL, NULL),
    (4, "HD 219134 b","Jupiter-like", 2.5e27, NULL, NULL),
    (5, "51 Pegasi b", "Hot Jupiter", 1.2e27, NULL, NULL),
    (6, "BD+33 2642 b", "Gas Giant", 6e26, NULL, NULL),
    (7, "VV Cephei A b", "Brown Dwarf", 1e28, NULL, NULL),
    (8, "M84 X-1 b", "Ice Giant", 2e26, NULL, NULL),
    (9, "M84 X-2 b", "Gas Giant", 5e26, NULL, NULL),
    (10, "NGC 5195 X-1 b", "Hot Neptune", 8e25, NULL, NULL);

-- triggery zad 1
select * from galaxies;

DELIMITER $$
CREATE TRIGGER galaxies_insert_date
BEFORE INSERT ON galaxies
FOR EACH ROW
BEGIN
    SET NEW.insert_date = NOW();
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER stars_insert_date
BEFORE INSERT ON stars
FOR EACH ROW
BEGIN
    SET NEW.insert_date = NOW();
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER planets_insert_date
BEFORE INSERT ON planets
FOR EACH ROW
BEGIN
    SET NEW.insert_date = NOW();
END $$
DELIMITER ;

INSERT INTO galaxies (name, type, distance)
VALUES
    ("Pinwheel", "Spiral", 21e6),
    ("Tadpole", "Spiral", 420e6),
    ("Virgo", "Elliptical", 1500e6);
    
select * from galaxies;

-- trigger zad2
    DELIMITER $$
    CREATE TRIGGER galaxies_mod_date
    BEFORE UPDATE ON galaxies
    FOR EACH ROW
    BEGIN
        SET NEW.modification_date = NOW();
    END $$
    DELIMITER ;

    DELIMITER $$
    CREATE TRIGGER stars_mod_date
    BEFORE UPDATE ON stars
    FOR EACH ROW
    BEGIN
        SET NEW.modification_date = NOW();
    END $$
    DELIMITER ;

    DELIMITER $$
    CREATE TRIGGER planets_mod_date
    BEFORE UPDATE ON planets
    FOR EACH ROW
    BEGIN
        SET NEW.modification_date = NOW();
    END $$
    DELIMITER ;

INSERT INTO galaxies (name, type, distance)
VALUES
    ("Pinwheel", "Spiral", 21e6),
    ("Tadpole", "Spiral", 420e6),
    ("Virgo", "Elliptical", 1500e6);

UPDATE planets
SET type = 'Terrestrial',
    modification_date = NOW()
WHERE type = 'Terrestrial' OR type = 'Gas Giant' OR type = 'Ice Giant';

DELIMITER $$
CREATE TRIGGER stars_planets_update
AFTER INSERT ON stars
FOR EACH ROW
BEGIN
    INSERT INTO planets (star_id, name, type, mass)
    VALUES (NEW.id, NULL, NULL, NULL);
END $$
DELIMITER ;


INSERT INTO stars (galaxy_id, name, type, age_e9, mass)
VALUES
    (1, "Pollux", "K-type", 3, 1.5e29),
    (1, "Regulus", "B-type", 4, 2.5e29),
    (2, "VX Sagittarii", "F-type", 5, 3e29);

select * from galaxies;
select * from stars;
select * from planets;
