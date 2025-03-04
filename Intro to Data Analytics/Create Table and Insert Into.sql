/*First we will create a table called Doctor in our Demo .db*/
CREATE TABLE Doctor(
	d_id int DEFAULT '0',
	d_firstname varchar DEFAULT NULL,
	d_lastname varchar DEFAULT NULL,
	d_title varchar(10) DEFAULT NULL,
	specialty varchar(50) DEFAULT NULL
);

/*Let's also create a table for Patient*/
CREATE TABLE Patient(
	p_id int DEFAULT '0',
	p_firstname varchar(75) DEFAULT NULL,
	p_lastname varchar(75) DEFAULT NULL,
	bdate varchar(20) DEFAULT NULL
);

/*We will connect to our example .db file*/
ATTACH DATABASE 'C:\Users\Michael\Desktop\Module2\Module2_Part1.db' AS example;

/*Next we can copy over the doctor records from our example .db to our demo .db*/
INSERT INTO Doctor(d_id, d_firstname, d_lastname, d_title, specialty)
SELECT d_id, d_firstname, d_lastname, d_title, specialty FROM example.Doctor;

/*View the Doctor Table*/
SELECT * FROM Doctor;

/*We can also copy all patient records from example.Patient*/
INSERT INTO Patient(p_id, p_firstname, p_lastname, bdate)
SELECT p_id, p_firstname, p_lastname, bdate FROM example.Patient;

/*View the Patient Table*/
SELECT * FROM Patient;

/*We can create and fill the table with data from our example .db in one querry*/
CREATE TABLE Appointment AS SELECT * FROM example.Appointment;

/*View the Appointment Table*/
SELECT * FROM Appointment;


/*Using your name, insert a new doctor record into your Doctor table*/
INSERT INTO Doctor (d_id, d_firstname, d_lastname,d_title, specialty)
VALUES(9,'Brandon', 'Krakowsky', 'MD', 'Dermatology');

/*Schedule 2 appointments for the new doctor on 02/16/2026 at 10AM and 11AM*/
INSERT INTO Appointment (a_id, a_date, d_id)
VALUES (10, '2016-02-16 10:00:00', 9), (11, '2016-02-16 11:00:00', 9);

/*Add a new patient "Elliot Graham". Note: No birthdate known*/
INSERT INTO Patient(p_id, p_firstname, p_lastname)
VALUES(12, 'Elliot', 'Graham');

/*Show the tables*/

SELECT * FROM Doctor;
SELECT * FROM Appointment;
SELECT * FROM Patient;

/*Create a new Office table in your database*/
CREATE TABLE Office (
	o_id int,
	o_address varchar(200),
	o_opendate date
);

SELECT * FROM Office;

/*Insert one default office location*/
INSERT INTO Office 
Values(1, 'Philadelphia, PA', '1994-04-11');

/*Finally we have to detach our database*/
DETACH DATABASE example;















































