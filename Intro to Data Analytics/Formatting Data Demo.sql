/* Show the number of appointments each doctor has, per time slot.  
 * Each time slot should be it’s own column.  Use IF
 */
SELECT d.d_id 'ID', d.d_lastname 'Last Name',
	SUM(IIF(STRFTIME('%H', a_date) = '10',1,0)) AS '10 AM',
	SUM(IIF(STRFTIME('%H', a_date) = '11',1,0)) AS '11 AM',
	SUM(IIF(STRFTIME('%H', a_date) = '12',1,0)) AS '12 PM'
FROM Doctor d
JOIN Appointment a 
ON d.d_id = a.d_id
GROUP BY d.d_id, d.d_lastname;

/* Show the number of appointments each doctor has, per time slot.  
 * Each time slot should be it’s own column.  Use CASE
 */
SELECT d.d_id 'ID', d.d_lastname 'Last Name',
	SUM(CASE STRFTIME('%H', a_date) WHEN '10' THEN 1 ELSE 0 END) '10 AM',
	SUM(CASE STRFTIME('%H', a_date) WHEN '11' THEN 1 ELSE 0 END) '11 AM',
	SUM(CASE STRFTIME('%H', a_date) WHEN '12' THEN 1 ELSE 0 END) '12 PM'
FROM Doctor d
JOIN Appointment a 
ON d.d_id = a.d_id
GROUP BY d.d_id, d.d_lastname;

/* Create a new table to store the cross-tabulation data.*/
CREATE TABLE Appointments_By_Time(
'd_id' int,
'10AM' int,
'11AM' int,
'12PM' int
);

SELECT * FROM Appointments_By_Time;
/* Insert the data into the new table.*/
INSERT INTO Appointments_By_Time (d_id, '10AM', '11AM', '12PM')
SELECT d.d_id,
	SUM(CASE STRFTIME('%H', a_date) WHEN '10' THEN 1 ELSE 0 END) '10AM',
	SUM(CASE STRFTIME('%H', a_date) WHEN '11' THEN 1 ELSE 0 END) '11AM',
	SUM(CASE STRFTIME('%H', a_date) WHEN '12' THEN 1 ELSE 0 END) '12PM'
FROM Doctor d
JOIN Appointment a
ON d.d_id = a.d_id
GROUP BY d.d_id;

SELECT * FROM Appointments_By_Time;

/* Join the new “Appointments_By_Time” table to the “Doctor” table, 
 * in order to get the full doctor name for each row of summary data.
 */
SELECT d.d_firstname, d.d_lastname, a.'10AM', a.'11AM', a.'12PM'
FROM Doctor d
JOIN Appointments_By_Time a
ON d.d_id = a.d_id;
