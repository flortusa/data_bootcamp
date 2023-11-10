CREATE SCHEMA Ejercicio5_Joins;
USE Ejercicio5_Joins;

-- EJERCICIO 1
-- Creo la tabla Salesman
CREATE TABLE Salesman (
    Salesman_id INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    Comission DECIMAL(5, 2)
);

-- Inserto datos en la tabla Salesman
INSERT INTO Salesman (Salesman_id, Name, City, Comission)
VALUES
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5007, 'Paul Adam', 'Rome', 0.13),
    (5003, 'Lauson Hen', 'San Jose', 0.12);

-- Visualizo los datos de la tabla Salesman
SELECT * FROM Salesman;

-- Creo la tabla Customer 
CREATE TABLE Customer (
    Customer_id INT PRIMARY KEY,
    Cust_name VARCHAR(50),
    City VARCHAR(50),
    Grade INT,
    Salesman_id INT
   );

-- Inserto datos en la tabla Customer
INSERT INTO Customer (Customer_id, Cust_name, City, Grade, Salesman_id)
VALUES
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3008, 'Julian Green', 'London', 300, 5002),
    (3004, 'Fabian Johnson', 'Paris', 300, 5006),
    (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
    (3003, 'Jozy Altidor', 'Moscow', 200, 5007);

-- Visualizo los datos de la tabla Customer
SELECT * FROM Customer;

-- Encuentro vendedor y cliente que residen en la misma ciudad
SELECT s.Name AS Salesman, c.Cust_name, c.City
FROM Salesman s
JOIN Customer c ON s.City = c.City
WHERE s.Salesman_id = c.Salesman_id;

-- EJERCICIO 2
-- Creo la tabla Orders
CREATE TABLE Orders (
  Ord_no INT PRIMARY KEY,
  Purch_amt DECIMAL(10,2),
  Ord_date DATE,
  Customer_id INT,
  Salesman_id INT
);

-- Inserto datos en la tabla Orders
INSERT INTO Orders (Ord_no, Purch_amt, Ord_date, Customer_id, Salesman_id)
VALUES 
  (70001, 150.50, '2012-10-05', 3005, 5002),
  (70009, 270.65, '2012-09-10', 3001, 5005),
  (70002, 65.26, '2012-10-05', 3002, 5001),
  (70004, 110.50, '2012-08-17', 3009, 5003),
  (70007, 948.50, '2012-09-10', 3005, 5002),
  (70005, 2400.60, '2012-07-27', 3007, 5001),
  (70008, 5760.00, '2012-09-10', 3002, 5001);
  
-- Visualizo los datos de la tabla Orders
SELECT * FROM Orders;

-- Encuentro pedidos con monto entre 500 y 2000, y adjunto detalles del cliente
SELECT o.Ord_no, o.Purch_amt, c.Cust_name, c.City
FROM Orders o
JOIN Customer c ON o.Customer_id = c.Customer_id
WHERE o.Purch_amt BETWEEN 500.00 AND 2000.00;
