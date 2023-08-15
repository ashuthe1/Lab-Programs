-- Create tables
CREATE TABLE SAILOR (
    sid INTEGER PRIMARY KEY,
    sname STRING,
    rating INTEGER,
    age REAL
);

CREATE TABLE BOAT (
    bid INTEGER PRIMARY KEY,
    bname STRING,
    color STRING
);

CREATE TABLE RESERVES (
    sid INTEGER,
    bid INTEGER,
    day DATE,
    FOREIGN KEY (sid) REFERENCES SAILOR(sid),
    FOREIGN KEY (bid) REFERENCES BOAT(bid)
);

-- Populate tables
INSERT INTO SAILOR (sid, sname, rating, age) VALUES
    (101, 'John', 8, 25.5),
    (102, 'Michael', 6, 30.2),
    (103, 'Emily', 9, 22.8),
    (104, 'Daniel', 7, 28.1),
    (105, 'Sophia', 8, 24.7);

INSERT INTO BOAT (bid, bname, color) VALUES
    (101, 'Speedy', 'Blue'),
    (102, 'WaveRider', 'Red'),
    (103, 'SailAway', 'Red'),
    (104, 'SeaStar', 'Green'),
    (105, 'OceanQuest', 'White');

INSERT INTO RESERVES (sid, bid, day) VALUES
    (101, 101, '2023-08-01'),
    (102, 102, '2023-08-02'),
    (103, 103, '2023-08-03'),
    (104, 104, '2023-08-04'),
    (105, 105, '2023-08-05');

-- Mandatory Queries
-- 3) Select names and ages of all sailors. Rename sname as ‘Sailor Name’
SELECT sname AS "Sailor Name", age FROM SAILOR;

-- 4) Find all sailors with a rating above 7
SELECT * FROM SAILOR WHERE rating > 7;

-- 5) Find the sid of sailors who have reserved a red boat
SELECT DISTINCT sid FROM RESERVES
WHERE bid IN (SELECT bid FROM BOAT WHERE color = 'Red');

-- 6) Find the colors of boats reserved by ‘Shyam’
SELECT DISTINCT b.color FROM BOAT b
JOIN RESERVES r ON b.bid = r.bid
JOIN SAILOR s ON r.sid = s.sid
WHERE s.sname = 'Shyam';

-- 7) Delete all boats which have never been reserved
DELETE FROM BOAT
WHERE bid NOT IN (SELECT DISTINCT bid FROM RESERVES);

-- Additional Queries
-- 1) Find the names of sailors who have reserved boat number 103
SELECT s.sname FROM SAILOR s
JOIN RESERVES r ON s.sid = r.sid
WHERE r.bid = 103;

-- 2) Find the names of sailors who have reserved a red boat
SELECT DISTINCT s.sname FROM SAILOR s
JOIN RESERVES r ON s.sid = r.sid
JOIN BOAT b ON r.bid = b.bid
WHERE b.color = 'Red';

-- 3) Find the ages of sailors whose name begin and end with B and has at least 5 characters
SELECT age FROM SAILOR
WHERE sname LIKE 'B%B' AND LENGTH(sname) >= 5;

-- 4) Find the name and age of the oldest sailor
SELECT sname AS "Oldest Sailor Name", age AS "Oldest Sailor Age"
FROM SAILOR
WHERE age = (SELECT MAX(age) FROM SAILOR);
