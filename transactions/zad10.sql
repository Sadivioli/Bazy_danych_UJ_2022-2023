DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
   EmployeeID INTEGER PRIMARY KEY auto_increment,
   FirstName TEXT NOT NULL,
   LastName TEXT NOT NULL,
   DateOfBirth DATE NOT NULL,
   Position TEXT NOT NULL,
   HireDate DATE NOT NULL,
   Salary INTEGER NOT NULL
);

INSERT INTO Employee (FirstName, LastName, DateOfBirth, Position, HireDate, Salary)
VALUES
('John', 'Smith', '1980-01-01', 'Manager', '2000-01-01', 8000),
('Jane', 'Doe', '1985-05-05', 'Developer', '2005-05-01', 7500),
('Bob', 'Johnson', '1990-10-10', 'Designer', '2010-01-01', 7000),
('Alice', 'Williams', '1985-06-06', 'Developer', '2005-01-01', 7500),
('James', 'Brown', '1980-02-02', 'Manager', '2000-01-01', 8000),
('Emily', 'Davis', '1990-07-07', 'Designer', '2010-01-01', 7000),
('William', 'Garcia', '1985-03-03', 'Developer', '2005-01-01', 7500),
('David', 'Miller', '1980-08-08', 'Manager', '2000-01-01', 8000),
('Richard', 'Moore', '1990-04-04', 'Designer', '2010-01-01', 7000),
('Charles', 'Taylor', '1985-09-09', 'Developer', '2005-01-01', 7500),
('Christopher', 'Anderson', '1980-05-05', 'Manager', '2000-01-01', 8000),
('Daniel', 'Thomas', '1990-06-06', 'Designer', '2010-01-01', 7000),
('Matthew', 'Jackson', '1985-07-07', 'Developer', '2005-01-01', 7500),
('Anthony', 'White', '1980-08-08', 'Manager', '2000-01-01', 8000),
('Donald', 'Harris', '1990-09-09', 'Designer', '2010-01-01', 7000);



SET autocommit = 1;
START TRANSACTION; 
UPDATE Employee
SET Salary = Salary*1.1;

SELECT * FROM Employee;

SET autocommit = 1;
START TRANSACTION; 
UPDATE Employee
SET Salary = Salary*1.2
WHERE (CURRENT_DATE - HireDate) / 365 > 20;

SELECT * FROM Employee;
