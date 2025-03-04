/*How many doctors are there*/
SELECT COUNT(*) FROM Doctor;

/*How many doctor titles are there*/
SELECT COUNT(d_title) FROM Doctor;

/*How many different doctor specialties are there*/
SELECT COUNT(DISTINCT specialty) FROM Doctor;

/*How many appointments are in general internal medicine*/
SELECT COUNT(*) FROM Appointment a 
JOIN Doctor d 
ON a.d_id = d.d_id 
WHERE d.specialty = 'General Internal';

/*How many patients do not have an appointment scheduled*/
SELECT COUNT(p.p_id) FROM Patient p 
LEFT JOIN Appointment a 
ON p.p_id = a.p_id 
WHERE a.p_id IS NULL;





































/*Calculate the total number of appointments per doctor*/
SELECT d.d_id, COUNT(*) AS 'Num of Appts' FROM Doctor d
JOIN Appointment a ON d.d_id = a.d_id 
GROUP BY d.d_id;

/*What time is each doctor's last appointment*/
SELECT d.d_id, MAX(TIME(a.a_date)) AS 'Last Appt.' FROM Doctor d
JOIN Appointment a ON d.d_id = a.d_id 
GROUP BY d.d_id;

/*How many doctors are there per specialty*/
SELECT d.specialty, COUNT(*) FROM Doctor d
GROUP BY d.specialty;

/*Can you find the first and last appointment time per specialty*/
SELECT d.specialty,
	MIN(TIME(a.a_date)) 'First Appt',
	MAX(TIME(a.a_date)) 'Last Appt'
FROM Appointment a 
JOIN Doctor d ON a.d_id = d.d_id 
GROUP BY d.specialty;

/*How many total appointments are taking place per time slot*/
SELECT TIME(a.a_date), COUNT(*) FROM Appointment a 
GROUP BY TIME(a.a_date);

/*How many total appointments are taking place per specialty*/
SELECT d.specialty, COUNT(*) FROM Appointment a 
JOIN Doctor d 
ON a.d_id = d.d_id 
GROUP BY d.specialty;

/*How many total appointments are taking place per specialty AND time slot*/
SELECT d.specialty, TIME(a.a_date), COUNT(*) FROM Appointment a 
JOIN Doctor d 
ON a.d_id = d.d_id 
GROUP BY d.specialty, TIME(a.a_date);