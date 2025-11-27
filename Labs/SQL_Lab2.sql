CREATE DATABASE nmp21;
use nmp21;

CREATE TABLE Students (
name varchar(20), 
gender char(1), 
birth Date
);

Insert into Students values 
('Nauman' , 'm', '2006-04-05'),
('Panth' , 'm', '2006-01-20'),
('Niral' , 'f', '2006-09-28');


CREATE TABLE Jobs (
job_id Char(5),
job_title varchar(20),
minsalary numeric(6,0),
maxsalary numeric(6,0)
);

ALTER TABLE Jobs
MODIFY COLUMN minsalary numeric(6,0),
MODIFY COLUMN maxsalary numeric(6,0)
;

Insert into Jobs Values
('job45', 'Software Developer' ,50000,500000),
('job46', 'Software Developer' ,50000,500000),
('job47', 'Software Developer' ,50000,500000);

ALTER TABLE Jobs
ADD PRIMARY KEY (job_id);

UPDATE Jobs
SET
	minsalary = 40000,
    maxsalary = 400000 
WHERE job_id = 'job45';

UPDATE Jobs
SET
	minsalary = 60000,
    maxsalary = 600000 
WHERE job_id = 'job47';

UPDATE Jobs
SET
	minsalary = 55000,
    maxsalary = 550000
WHERE 
	job_id = 'job45'
    AND minsalary < 45000;
		
	