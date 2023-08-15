-- Create tables
CREATE TABLE SALESMAN (
    Salesman_id INTEGER PRIMARY KEY,
    Name STRING,
    City STRING,
    Commission INTEGER
);

CREATE TABLE CUSTOMER (
    Customer_id INTEGER PRIMARY KEY,
    Cust_Name STRING,
    City STRING
);

CREATE TABLE ORDERS (
    Ord_No INTEGER PRIMARY KEY,
    Purchase_Amt REAL,
    Ord_Date DATE,
    Customer_id INTEGER,
    Salesman_id INTEGER,
    FOREIGN KEY (Customer_id) REFERENCES CUSTOMER(Customer_id),
    FOREIGN KEY (Salesman_id) REFERENCES SALESMAN(Salesman_id)
);

-- Populate tables
INSERT INTO SALESMAN (Salesman_id, Name, City, Commission) VALUES
    (101, 'John', 'New York', 10),
    (102, 'Michael', 'Los Angeles', 15),
    (103, 'Emily', 'Chicago', 20),
    (104, 'Daniel', 'Houston', 12),
    (105, 'Sophia', 'Miami', 18);

INSERT INTO CUSTOMER (Customer_id, Cust_Name, City) VALUES
    (201, 'Customer X', 'New York'),
    (202, 'Customer Y', 'Los Angeles'),
    (203, 'Customer Z', 'Chicago'),
    (204, 'Customer W', 'Houston'),
    (205, 'Customer V', 'Miami');

INSERT INTO ORDERS (Ord_No, Purchase_Amt, Ord_Date, Customer_id, Salesman_id) VALUES
    (301, 100.0, '2023-08-01', 201, 101),
    (302, 150.0, '2023-08-02', 202, 102),
    (303, 200.0, '2023-08-03', 203, 103),
    (304, 120.0, '2023-08-04', 204, 104),
    (305, 180.0, '2023-08-05', 205, 105);

-- Mandatory Queries
-- 3) Select the ID and names of all the customers
SELECT Customer_id, Cust_Name FROM CUSTOMER;

-- 4) Select the salesman with the highest commission
SELECT * FROM SALESMAN
WHERE Commission = (SELECT MAX(Commission) FROM SALESMAN);

-- 5) List all the orders placed in descending order of their purchase amount
SELECT * FROM ORDERS
ORDER BY Purchase_Amt DESC;

-- 6) Select customers who have salesmen in their cities
SELECT DISTINCT c.Customer_id, c.Cust_Name
FROM CUSTOMER c
JOIN SALESMAN s ON c.City = s.City;

-- 7) Delete all orders placed before Jan 2018
DELETE FROM ORDERS
WHERE Ord_Date < '2018-01-01';

-- Additional Queries
-- 1) Find the names of salesman who have customers
SELECT DISTINCT s.Name
FROM SALESMAN s
JOIN ORDERS o ON s.Salesman_id = o.Salesman_id;

-- 2) Find the names of all salesmen whose commission is greater than 25%
SELECT Name
FROM SALESMAN
WHERE Commission > 25;

-- 3) List the names of customers and the order amount placed by them
SELECT c.Cust_Name, o.Purchase_Amt
FROM CUSTOMER c
JOIN ORDERS o ON c.Customer_id = o.Customer_id;

-- 4) Find the name and ID of all salesmen who have earned commission amount more than 10,000
SELECT Name, Salesman_id
FROM SALESMAN
WHERE Commission > 10000;
