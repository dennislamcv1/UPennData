/*SELECT*/
SELECT d_firstname, d_lastname FROM Doctor;

SELECT p_id, p_lastname, p_firstname, bdate FROM Patient;

/*Using Column Aliases*/
SELECT d_firstname AS 'First Name', d_lastname AS 'Last Name' FROM Doctor; 

SELECT p_firstname FirstName, p_lastname LastName FROM Patient;

/*Using Table Aliases*/
SELECT p.p_lastname LastName, p.bdate AS 'Date of Birth' FROM Patient AS p;

SELECT d.d_firstname AS 'First Name', d.d_lastname AS 'Last Name' FROM Doctor d;

/*Eliminating Duplication in Output*/
SELECT specialty FROM Doctor;

SELECT DISTINCT specialty FROM Doctor;

SELECT DISTINCT p_lastname FROM Patient;




/*Using WHERE Clause*/
SELECT d_firstname, d_lastname FROM Doctor WHERE d_id < 3;

SELECT * FROM Patient WHERE p_lastname = 'Jones';

SELECT * FROM Doctor WHERE d_title != 'MD';

/*Using AND Operator With Multiple Conditions*/
SELECT * FROM Patient WHERE p_firstname = 'Becky' AND p_lastname = 'Jones';


/*Using OR Operator With Multiple Conditions*/
SELECT * FROM Patient WHERE p_lastname = 'Jones' OR p_lastname = 'Roberts';



/*Using LIKE Operator*/
SELECT * FROM Patient WHERE p_firstname LIKE 'J%';

SELECT * FROM Doctor WHERE d_lastname LIKE 'Sa_an';

/*Using IS NULL Operator*/
SELECT * FROM Doctor WHERE d_title IS NULL;

SELECT * FROM Doctor WHERE d_title IS NULL OR d_title = '';

/*Using ORDER BY Clause*/
SELECT p_firstname, p_lastname FROM Patient ORDER BY p_lastname;

SELECT p_firstname, p_lastname FROM Patient ORDER BY p_lastname ASC, p_firstname ASC;