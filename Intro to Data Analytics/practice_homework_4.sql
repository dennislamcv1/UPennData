/* Getting started:
 * Open the 'practice_homework_mod2.db' file in SQLite.
 * Open the 'practice_homework_empty.db' file in SQLite. 
 * This SQLite script should be under the new empty database. 
 * You will be working on creating new tables in the empty database we have provided
 * A few things should be common practice, checking the contents after you create, and then fill a table with SELECT * FROM table
 * As well as making sure not to run commands twice and possibly fill up your table with duplicates.
 * Please complete each of the TODO sections below. */

/* TODO 1
 * For all future steps you must first ATTACH the old database "practice_homework_mod2"
 * Hint: Use the ATTACH DATABASE statement with the location in your local directory files, and give it an alias of example*/

ATTACH DATABASE './practice_homework_mod2.db' AS practice_homework_mod2;

An example of how to do this is below based on where you put your .db file.

ATTACH DATABASE 'C:\Users\Michael\Desktop\Module2\practice_homework_mod2.db' AS example;


/* TODO 2
 * Create a "customer" table in your empty database.
 * The structure should be the same as the "customer" table in the "practice_homework_mod2" database.
 * Use the CREATE TABLE statement, without filling in data yet.
 * Show your SQLite code here. Make sure to check that the new table was added to empty db.
 * How many columns does this new table have?
 */

CREATE TABLE practice_homework_empty.customer AS
SELECT cust_id, cust_name 
FROM practice_homework_mod2.customer
WHERE 0;

CREATE TABLE customer (
cust_id int NOT NULL,
cust_name varchar(127)
);

Then to check what you just created
SELECT * FROM customer;


/* TODO 3
 * Copy all of the customer records from the original "customer" table in alias "example" database into your new "customer" table.
 * Show the SQLite code you used to copy the customer records.
 * How many records were copied? 
 */
 
INSERT INTO practice_homework_empty.customer (cust_id, cust_name)
SELECT cust_id, cust_name
FROM practice_homework_mod2.customer;

INSERT INTO customer
SELECT * FROM example.customer;

Then to check the table write:

SELECT * FROM customer;


/* TODO 4
 * Create a "purchase" table in your new database.
 * The structure should be the same as the "purchase" table in the alias "example" database.
 * Use the CREATE TABLE statement, without filling in data yet.
 * Show your SQLite code here.
 */

CREATE TABLE practice_homework_empty.purchase AS
SELECT pur_cust, pur_prod, pur_date, pur_amount, pur_store_id 
FROM practice_homework_mod2.purchase
WHERE 0;

CREATE TABLE purchase (
pur_cust int,
pur_prod int,
pur_date date,
pur_amount decimal(5, 2),
pur_store_id int
);

SELECT * FROM purchase;


/* TODO 5
 * Copy all of the purchase records from the original "purchase" table in alias "example" database into your new "purchase" table.
 * Show the SQLite code you used to copy the purchase records.
 * How many records were copied? 
 */

INSERT INTO practice_homework_empty.purchase (pur_cust, pur_prod, pur_date, pur_amount, pur_store_id)
SELECT pur_cust, pur_prod, pur_date, pur_amount, pur_store_id
FROM practice_homework_mod2.purchase;

INSERT INTO purchase
SELECT * FROM example.purchase;

SELECT * FROM purchase;



/* TODO 6
 * Copy the "product" and "purchase_large" tables, including all data, into your new database. 
 * Show all of your SQLite code here.
 * Hint: Use any method you like!
 * How many rows were copied into each of the tables? 
 */

-- Step 1: Attach the original database as 'source'
ATTACH DATABASE 'practice_homework_mod2.db' AS source;

-- Step 2: Create a copy of the 'product' table in the new (current) database
CREATE TABLE product AS
SELECT * FROM source.product;

-- Step 3: Create a copy of the 'purchase_large' table in the new (current) database
CREATE TABLE purchase_large AS
SELECT * FROM source.purchase_large;

-- Step 4: Detach the source database to keep things clean
DETACH DATABASE source;

-- Step 5: Verify your tables
SELECT * FROM product LIMIT 10;
SELECT * FROM purchase_large LIMIT 10;

CREATE TABLE product AS SELECT * FROM example.product;
SELECT * FROM product;

CREATE TABLE purchase_large AS SELECT * FROM example.purchase_large;
SELECT * FROM purchase_large;



/* TODO 7
 * Insert a new customer into your "customer" table. 
 * You may choose values for this new customer.
 * Show your SQLite.
 * How many rows does the customer table have?
 */

INSERT INTO customer (cust_id, cust_name)
VALUES (16, 'Brandon Krakowsky');

SELECT * FROM customer;


/* TODO 8
 * Insert a new purchase into your "purchase" table,
 * using the new customer information (pur_cust) from the previous question.
 * The item is a Red Sweater, purchased today (today's date) for $28.95.
 * Note, we do not know the store information.
 * Show all of your SQLite.
 * How many rows does the purchase table have? How many columns?
 */ 

INSERT INTO purchase
VALUES (16,(SELECT p.prod_id FROM product p WHERE p.prod_name = 'Red Sweater'), DATE('now'), 28.95, NULL);

SELECT * FROM purchase;


/* TODO 9
 * Create a "store" table in your new database.
 * The structure should be the same as the "store" table in the alias "example" database;
 * Use the CREATE TABLE statement, you may fill in the data at the same time, or do it in two steps.
 * Show your SQLite code here.
 */

CREATE TABLE store (
store_id int NOT NULL,
store_name varchar(20)
);

SELECT * FROM store;


/* TODO 10
 * Insert one default store record with any name and a store id of 2.
 * Show your SQLite code. (No Quiz Question)
 */
 
INSERT INTO store (store_id, store_name)
VALUES (2, 'Downtown Central');


/* TODO 11
 * Update the customer record for "Samantha", with the customer id of 5.  
 * Her name should be changed to "Samantha V.".
 * What is the SQLite to do this?
 * How many rows were updated? 
 */

UPDATE customer
SET cust_name = 'Samantha V.'
WHERE cust_id = 5;

SELECT * FROM customer;



/* TODO 12
 * Change the purchase amount to $83.39 for the purchase which took place on 2014-07-28.
 * Also, change the store id to 20.
 * Show the SQLite you used to do this.
 * How many records were updated? 
 */

UPDATE purchase
SET pur_amount = 83.39, pur_store_id = 20
WHERE pur_date = '2014-07-28';

SELECT * FROM purchase;



/* TODO 13
 * Delete all purchases made at store number 1!
 * Show your SQLite code to delete the purchases.
 * How many purchases were deleted? 
 */

DELETE FROM purchase
WHERE pur_store_id = 1;


/* TODO 14
 * Delete all purchases made by your new customer.  Delete your new customer as well.
 * Show the SQLite code executed.
 * Hint: You must use a subquery in SQLite. SQLite DELETE cannot use JOIN
 * Delete the purchase first then delete the customer (2 queries due to SQLite limitations)
 * How many records were affected? 
 */

DELETE FROM purchase
WHERE pur_cust IN (
  SELECT cust_id FROM customer WHERE cust_name = 'Brandon Krakowsky'
);


DELETE FROM purchase
WHERE pur_cust IN (
    SELECT cust_id
    FROM customer
    WHERE cust_name = 'Brandon Krakowsky'
);


DELETE FROM customer
WHERE cust_name = 'Brandon Krakowsky';

SELECT * FROM customer;

SELECT * FROM purchase;


/* TODO 15
 * Add a new column to your "customer" table.
 * You should be able to store the address of the customer, up to 100 characters long, but it's default value should be NULL.
 * Show your code.
 */

ALTER TABLE customer
ADD COLUMN address varchar(100) DEFAULT NULL;

SELECT * FROM customer;


/* TODO 16
 * Rename the new column to "c_address".
 * Show your code.
 */

ALTER TABLE customer
RENAME COLUMN address TO c_address;

SELECT * FROM customer;


/*Detach your database with alias example*/
