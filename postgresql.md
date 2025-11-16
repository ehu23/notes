# PostgreSQL Basics:

## Getting Started:

1. Have Postgres installed, i.e. brew
2. Make sure the service is started
3. Create a database with: `createdb 'DATABASE_NAME'`. Make sure you include the quotes.
4. To connect into the created database: `psql 'DATABASE_NAME'`


## SQL Commands:

1. Create a table: `CREATE TABLE table_name (column_1_name datatype, column_2_name datatype, column_3_name datatype);`
    - some datatypes: int, bool, text, date, etc
    - do not forget the semicolon!
    - capitalization syntax is a standard, but not necessary

2. Insert (create) data into tables: `INSERT INTO table_name (column_1_name, column_2_name) VALUES (value_1, value_2);`

3. Select row data values from table: `SELECT column_1_name, column_2_name FROM table_name;`
    - Select all data from table: `SELECT * FROM table_name;`

4. Alter Table (i.e. add new column): `ALTER TABLE table_name ADD column_name datatype;`

5. Update data (to existing) of a row: `UPDATE table_name SET some_column = some_value WHERE some_column = some_value;`
    - the WHERE is like a conditional
    - Can also do AND and OR: `UPDATE table_name SET some_column = some_value WHERE some_column = some_value AND some_column = some_value;`

6. Conditional Selections: `SELECT * FROM table_name WHERE column_name LIKE 'condition';`
    - Example condition: 'A%' --- anything beginning with A

7. Sort our query results: `SELECT * FROM table_name ORDER BY column_name DESC;`
    - ASC --- ascending. DESC --- descending.

8. Functions (AVG, SUM, COUNT, etc): `SELECT AVG(score) FROM table_name;`

9. Deletion: 
    - Delete a row: `DELETE FROM table_name WHERE column_name = value;`
    - Delete a table: `DROP TABLE table_name;`

## SQL Joining Table Commands:

Ex: 

`CREATE TABLE login (ID serial NOT NULL PRIMARY KEY, secret VARCHAR (100) NOT NULL, name text UNIQUE NOT NULL);`

- serial is an auto incrementing datatype, thus we do not declare any values for it when Inserting.
- NOT NULL means it must be filled in
- can declare PRIMARY KEY, which says "this is what I want you to access when I'm looking for things". They are always unique to each row. 
    - KEY: Makes us able to grab information faster from this table, like an 'index' of sorts. Creates a 'sequence' structure separately from the table each time we declare a table with a Primary Key explicitly, specifically for fast retrievals.
- VARCHAR (100) is a string of variable length up to 100 chars.
- UNIQUE prevents an identical insert of that field from inserting itself.

To Join this Table (login) with another (users) and make sure the rows match, use the ON syntax (essentially a conditional):

`SELECT * FROM users JOIN login ON users.name = login.name;`   ---> this returns the joined table since we used SELECT *


## SQL Quick Controls:

- Quit: `\q`
- List the relations/tables: `\d` 
