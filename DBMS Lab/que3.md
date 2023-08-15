Create tables for the following schema:
<br/>
SALESMAN (Salesman_id:integer, Name:string, City:string, Commission:integer)
CUSTOMER (Customer_id:integer, Cust_Name:string, City:string)
ORDERS (Ord_No:integer, Purchase_Amt:real, Ord_Date:date, Customer_id:integer,
Salesman_id:integer)
Mandatory Queries:
1) Add the required constraints on the created tables.
2) Populate the relations with at least 5 tuples each.
3) Select the ID and names of all the customers.
4) Select the salesman with the highest commission.
5) List all the orders placed in descending order of their purchase amount.
6) Select customers who have salesmen in their cities.
7) Delete all orders placed before Jan 2018.
Additional queries:
1) Find the names of salesman who have customers.
2) Find the names of all salesmen whose commission is greater than 25%.
3) List the names of customers and the order amount placed by them.
4) Find the name and ID of all salesmen who have earned commission amount more than
10,000