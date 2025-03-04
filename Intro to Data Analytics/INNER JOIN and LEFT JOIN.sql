/*List each doctor with an appointment, along with the appointment data & time*/
SELECT d.d_lastname, a.a_date
FROM Doctor d
JOIN Appointment a ON d.d_id = a.d_id;

/*Add in the patient name to query*/
SELECT d.d_lastname, a.a_date, p.p_lastname
FROM Doctor d
INNER JOIN Appointment a ON d.d_id = a.d_id 
INNER JOIN Patient p ON a.p_id = p.p_id;

/*Show the date & time and patient name for all appointments scheduled with Dr. Hopkins*/
SELECT a.a_date, p.p_lastname FROM Doctor d
INNER JOIN Appointment a ON d.d_id = a.d_id 
INNER JOIN Patient p ON a.p_id = p.p_id 
WHERE d.d_lastname = 'Hopkins';

/*Now show all information for appointments at 12pm for patients with last name starting with S*/
SELECT * FROM Doctor d
INNER JOIN Appointment a ON d.d_id = a.d_id 
INNER JOIN Patient p ON a.p_id = p.p_id 
WHERE a.a_date = '2016-02-15 12:00:00'
AND p.p_lastname LIKE 'S%';



/*List all doctors, along with any appointments*/
SELECT d.d_lastname, a.a_date FROM Doctor d
LEFT JOIN Appointment a 
ON d.d_id = a.d_id 
ORDER BY d.d_lastname;

/*List all patients, along with any appointments*/
SELECT p.p_lastname, a.a_date FROM Patient p
LEFT JOIN Appointment a ON p.p_id = a.p_id 
ORDER BY p.p_lastname;

/*List the doctors who do not have any appointments*/
SELECT d.*, a.a_id FROM Doctor d
LEFT JOIN Appointment a ON d.d_id = a.d_id 
WHERE a.a_id IS NULL; 

/*Use the NOT IN operator*/
SELECT d.* FROM Doctor d
WHERE d.d_id NOT IN (SELECT a.d_id FROM Appointment a);

/*Using a LEFT JOIN list only the patients who have appointments scheduled*/
SELECT p.*, a.a_id FROM Patient p
LEFT JOIN Appointment a ON p.p_id = a.p_id 
WHERE a.a_id IS NOT NULL;

/*Do this with a subquery*/
SELECT p.* FROM Patient p
WHERE p.p_id IN (SELECT a.p_id FROM Appointment a);