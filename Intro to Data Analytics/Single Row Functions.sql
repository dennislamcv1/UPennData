/*Show the full name and title of each doctor, along with their specialty*/
SELECT 
	(d_firstname || ' ' || d_lastname || ', ' || d_title) AS 'Doctor Name',
	specialty AS 'Specialty'
FROM Doctor;

/*Fix the NULL issue*/
SELECT 
	(d_firstname || ' ' || d_lastname || ', ' || IFNULL(d_title, ''))
	AS 'Doctor Name',
	specialty AS 'Specialty'
FROM Doctor;

/*Fix the hanging comma issue*/
SELECT 
	(d_firstname || ' ' || d_lastname ||
	IIF(d_title IS NULL OR d_title = '', '', (', '||d_title)))
	AS 'Doctor Name',
	specialty AS 'Specialty'
FROM Doctor;

/*Fix the case issue*/
SELECT 
	(UPPER(substr(d_firstname, 1, 1)) ||
	LOWER(substr(d_firstname,2)) ||
	' ' ||
	UPPER(substr(d_lastname, 1, 1)) ||
	LOWER(substr(d_lastname, 2)) ||
	IIF(d_title IS NULL OR d_title = '', '', (', ' || d_title)))
	AS 'Doctor Name',
	specialty AS 'Specialty'
FROM Doctor;




































/*How old is each patient*/
SELECT p_lastname 'Patient', JULIANDAY('now') - JULIANDAY(bdate) 'Days Old' FROM Patient;  

/*How do we convert this to years*/
SELECT p_lastname 'Patient', (JULIANDAY('now') - JULIANDAY(bdate))/365 Age FROM Patient;

/*How do we round down*/
SELECT p_lastname 'Patient', FLOOR((JULIANDAY('now') - JULIANDAY(bdate))/365) Age FROM Patient;

/*Which doctors have appointments on Mondays*/
SELECT d.d_lastname, a.a_date FROM Doctor d
JOIN Appointment a ON d.d_id = a.d_id 
WHERE STRFTIME('%w', a.a_date) = '1';

/*Which patients have appointments in February*/
SELECT d.d_lastname, a.a_date FROM Doctor d
JOIN Appointment a ON d.d_id = a.d_id 
WHERE STRFTIME('%m', a.a_date) = '02'; 
