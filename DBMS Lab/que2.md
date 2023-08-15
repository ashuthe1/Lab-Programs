Question 2:
<br/>
Create tables for the following schema:
SUPPLIER(sid: integer, sname: string, address: string)
PART(pid: integer, pname: string, color: string)
CATALOG(sid: integer, pid: integer, cost: real)
Mandatory Queries:
1) Add the required constraints on the created tables.
2) Populate the relations with at least 5 tuples each.
3) Select the ID and names of all the suppliers.
4) Select the most costly part available in the catalog.
5) Find the pnames of parts for which there is some supplier.

6) Find the sids of suppliers who supply a red part and a green part.
7) Delete all parts of a given ID.
Additional queries:
1) Find the sids of suppliers who supply a red part or a green part.
2) List the suppliers residing in Bangalore.
3) Find the sids of suppliers who supply red parts.
4) For every supplier that supplies a green part and a red part, print the name and price of the
most expensive part that he/she supplies.