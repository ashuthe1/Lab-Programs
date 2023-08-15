-- Create tables
CREATE TABLE SUPPLIER (
    sid INTEGER PRIMARY KEY,
    sname STRING,
    address STRING
);

CREATE TABLE PART (
    pid INTEGER PRIMARY KEY,
    pname STRING,
    color STRING
);

CREATE TABLE CATALOG (
    sid INTEGER,
    pid INTEGER,
    cost REAL,
    FOREIGN KEY (sid) REFERENCES SUPPLIER(sid),
    FOREIGN KEY (pid) REFERENCES PART(pid)
);

-- Populate tables
INSERT INTO SUPPLIER (sid, sname, address) VALUES
    (101, 'Supplier A', '123 Main St'),
    (102, 'Supplier B', '456 Elm St'),
    (103, 'Supplier C', '789 Oak St'),
    (104, 'Supplier D', '567 Pine St'),
    (105, 'Supplier E', '890 Maple St');

INSERT INTO PART (pid, pname, color) VALUES
    (201, 'Part X', 'Red'),
    (202, 'Part Y', 'Green'),
    (203, 'Part Z', 'Blue'),
    (204, 'Part W', 'Red'),
    (205, 'Part V', 'Green');

INSERT INTO CATALOG (sid, pid, cost) VALUES
    (101, 201, 50.0),
    (101, 202, 60.0),
    (102, 201, 55.0),
    (103, 203, 45.0),
    (104, 204, 75.0);

-- Mandatory Queries
-- 3) Select the ID and names of all the suppliers
SELECT sid, sname FROM SUPPLIER;

-- 4) Select the most costly part available in the catalog
SELECT p.pname AS "Most Costly Part", c.cost
FROM PART p
JOIN CATALOG c ON p.pid = c.pid
ORDER BY c.cost DESC
LIMIT 1;

-- 5) Find the pnames of parts for which there is some supplier
SELECT DISTINCT p.pname FROM PART p
JOIN CATALOG c ON p.pid = c.pid;

-- 6) Find the sids of suppliers who supply a red part and a green part
SELECT DISTINCT c1.sid
FROM CATALOG c1
JOIN CATALOG c2 ON c1.sid = c2.sid
JOIN PART p1 ON c1.pid = p1.pid
JOIN PART p2 ON c2.pid = p2.pid
WHERE p1.color = 'Red' AND p2.color = 'Green';

-- 7) Delete all parts of a given ID
DELETE FROM PART
WHERE pid = <part_id>; -- Replace <part_id> with the desired part ID

-- Additional Queries
-- 1) Find the sids of suppliers who supply a red part or a green part
SELECT DISTINCT c.sid
FROM CATALOG c
JOIN PART p ON c.pid = p.pid
WHERE p.color = 'Red' OR p.color = 'Green';

-- 2) List the suppliers residing in Bangalore
SELECT sid, sname
FROM SUPPLIER
WHERE address LIKE '%Bangalore%';

-- 3) Find the sids of suppliers who supply red parts
SELECT DISTINCT c.sid
FROM CATALOG c
JOIN PART p ON c.pid = p.pid
WHERE p.color = 'Red';

-- 4) For every supplier that supplies a green part and a red part, print the name and price of the most expensive part that he/she supplies.
SELECT s.sname, MAX(c.cost) AS "Most Expensive Part Price"
FROM SUPPLIER s
JOIN CATALOG c ON s.sid = c.sid
JOIN PART p ON c.pid = p.pid
WHERE p.color IN ('Red', 'Green')
GROUP BY s.sname
HAVING COUNT(DISTINCT p.color) = 2;
