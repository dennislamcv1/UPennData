/*Load the offices.txt file into the Offices table*/

LOAD DATA LOCAL INFILE 'C:\Users\Michael\Documents\_training\bootcamp\offices.txt'
INTO TABLE Office
FIELDS TERMINATED BY '\t'
OPTIONALLY ENCLOSED BY '\"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;