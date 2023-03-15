DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS transactions;

CREATE TABLE customers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  account INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  balance DECIMAL(10,2) NOT NULL CHECK (balance >= 0)
);

CREATE TABLE transactions (
  id INT PRIMARY KEY AUTO_INCREMENT,
  account_send INT NOT NULL,
  account_recive INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL CHECK (amount >= 0),
  date_time DATETIME NOT NULL,
  FOREIGN KEY (account_send) REFERENCES customers(id),
  FOREIGN KEY (account_recive) REFERENCES customers(id)
);

-- Insert
INSERT INTO customers (account, name, balance)
VALUES
  ( 1001, 'Alice', 1000),
  ( 1002, 'Bob', 2000),
  ( 1003, 'Charlie', 1500),
  ( 1004, 'Dave', 1000),
  ( 1005, 'Eve', 2500),
  ( 1006, 'Frank', 2000),
  ( 1007, 'Gary', 1500),
  ( 1008, 'Hannah', 1000),
  ( 1009, 'Igor', 2500),
  ( 1010, 'Jill', 2000),
  ( 1011, 'Katie', 1500),
  ( 1012, 'Liam', 1000),
  ( 1013, 'Mia', 2500),
  ( 1014, 'Nick', 2000),
  ( 1015, 'Olivia', 1500),
  ( 1016, 'Peter', 1000),
  ( 1017, 'Quinn', 2500),
  ( 1018, 'Rachel', 2000),
  ( 1019, 'Samantha', 1500),
  ( 1020, 'Trevor', 1000);


-- Transaction

SET autocommit = 1;
START TRANSACTION; 
UPDATE customers
SET balance = balance - 100
WHERE id = 1;
UPDATE customers
SET balance = balance + 100
WHERE id = 2;

INSERT INTO transactions (account_send, account_recive, amount, date_time)
VALUES (1, 2, 100, NOW());
COMMIT;

SELECT * FROM transactions;
SELECT * FROM customers;