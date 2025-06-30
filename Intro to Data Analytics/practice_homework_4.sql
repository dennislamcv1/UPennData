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



/* TODO 2
 * Create a "customer" table in your empty database.
 * The structure should be the same as the "customer" table in the "practice_homework_mod2" database.
 * Use the CREATE TABLE statement, without filling in data yet.
 * Show your SQLite code here. Make sure to check that the new table was added to empty db.
 * How many columns does this new table have?
 */



/* TODO 3
 * Copy all of the customer records from the original "customer" table in alias "example" database into your new "customer" table.
 * Show the SQLite code you used to copy the customer records.
 * How many records were copied? 
 */
 



/* TODO 4
 * Create a "purchase" table in your new database.
 * The structure should be the same as the "purchase" table in the alias "example" database.
 * Use the CREATE TABLE statement, without filling in data yet.
 * Show your SQLite code here.
 */



/* TODO 5
 * Copy all of the purchase records from the original "purchase" table in alias "example" database into your new "purchase" table.
 * Show the SQLite code you used to copy the purchase records.
 * How many records were copied? 
 */



/* TODO 6
 * Copy the "product" and "purchase_large" tables, including all data, into your new database. 
 * Show all of your SQLite code here.
 * Hint: Use any method you like!
 * How many rows were copied into each of the tables? 
 */



/* TODO 7
 * Insert a new customer into your "customer" table. 
 * You may choose values for this new customer.
 * Show your SQLite.
 * How many rows does the customer table have?
 */



/* TODO 8
 * Insert a new purchase into your "purchase" table,
 * using the new customer information (pur_cust) from the previous question.
 * The item is a Red Sweater, purchased today (today's date) for $28.95.
 * Note, we do not know the store information.
 * Show all of your SQLite.
 * How many rows does the purchase table have? How many columns?
 */ 



/* TODO 9
 * Create a "store" table in your new database.
 * The structure should be the same as the "store" table in the alias "example" database;
 * Use the CREATE TABLE statement, you may fill in the data at the same time, or do it in two steps.
 * Show your SQLite code here.
 */



/* TODO 10
 * Insert one default store record with any name and a store id of 2.
 * Show your SQLite code. (No Quiz Question)
 */
 


/* TODO 11
 * Update the customer record for "Samantha", with the customer id of 5.  
 * Her name should be changed to "Samantha V.".
 * What is the SQLite to do this?
 * How many rows were updated? 
 */



/* TODO 12
 * Change the purchase amount to $83.39 for the purchase which took place on 2014-07-28.
 * Also, change the store id to 20.
 * Show the SQLite you used to do this.
 * How many records were updated? 
 */




/* TODO 13
 * Delete all purchases made at store number 1!
 * Show your SQLite code to delete the purchases.
 * How many purchases were deleted? 
 */



/* TODO 14
 * Delete all purchases made by your new customer.  Delete your new customer as well.
 * Show the SQLite code executed.
 * Hint: You must use a subquery in SQLite. SQLite DELETE cannot use JOIN
 * Delete the purchase first then delete the customer (2 queries due to SQLite limitations)
 * How many records were affected? 
 */



/* TODO 15
 * Add a new column to your "customer" table.
 * You should be able to store the address of the customer, up to 100 characters long, but it's default value should be NULL.
 * Show your code.
 */



/* TODO 16
 * Rename the new column to "c_address".
 * Show your code.
 */



/*Detach your database with alias example*/
