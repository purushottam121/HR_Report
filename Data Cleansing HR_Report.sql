SELECT * FROM new_project.hr;

SET SQL_SAFE_UPDATES = 0;

UPDATE HR
SET BIRTHDATE = CASE 
WHEN BIRTHDATE like '%/%' THEN  date_format(str_to_date(BIRTHDATE,'%m/%d/%Y'),'%Y-%m-%d')
WHEN BIRTHDATE like '%-%' THEN  date_format(str_to_date(BIRTHDATE,'%m-%d-%Y'),'%Y-%m-%d')
else null
end;

DESC HR; 

ALTER table HR
MODIFY COLUMN BIRTHDATE DATE;

UPDATE HR
SET HIRE_DATE = CASE 
WHEN HIRE_DATE like '%/%' THEN  date_format(str_to_date(HIRE_DATE,'%m/%d/%Y'),'%Y-%m-%d')
WHEN HIRE_DATE like '%-%' THEN  date_format(str_to_date(HIRE_DATE,'%m-%d-%Y'),'%Y-%m-%d')
else null
end;

SELECT termdate from hr;

ALTER TABLE HR
MODIFY COLUMN HIRE_DATE date;

UPDATE HR
SET TERMDATE = DATE(str_to_date(TERMDATE,'%Y-%m-%d %H:%i:%s UTC'));

ALTER TABLE HR 
modify COLUMN TERMDATE date;

DESC HR;

ALTER TABLE HR 
ADD COLUMN AGE INT;

UPDATE HR
SET AGE=timestampdiff(YEAR,BIRTHDATE,CURDATE());

SELECT AGE FROM HR;

SELECT count(AGE) FROM HR WHERE AGE <18;
-- As there are twenty two thousand records in the dataset,
-- so we can ignore this thousand values as they are not useful to us and these are incorrect values. 













