-- WHAT IS THE GENDER BREAKDOWN OF THE EMPLOYEES IN THE COMPANY?
SELECT GENDER,COUNT(*) GENDER_COUNT FROM HR
WHERE AGE>=18 AND TERMDATE="0000-00-00" 
GROUP BY GENDER; 

-- WHAT IS THE RACE/ETHINCITY BREAKDOWN OF EMPLOYESS IN THE COMPANY?
SELECT RACE,count(*) AS RACE_COUNT FROM HR 
WHERE AGE>=18 AND TERMDATE="0000-00-00" 
GROUP BY RACE
ORDER BY RACE_COUNT DESC;

-- What is the age distribution in the company?

SELECT MIN(AGE) AS YOUNEST,
		MAX(AGE) AS OLDEST FROM HR
        WHERE AGE>=18 AND TERMDATE="0000-00-00";

SELECT 
	CASE 
       WHEN AGE>=18 AND AGE<28 THEN '18-27'
       WHEN AGE>=28 AND AGE<38 THEN '28-37'
       WHEN AGE>=38 AND AGE<48 THEN '38-47'
       WHEN AGE>=48 AND AGE<58 THEN '48-57'
	ELSE '58+'
    END AS AGE_GROUP,
    COUNT(*) AS COUNT
    FROM HR
    WHERE AGE>=18 AND TERMDATE="0000-00-00" 
    GROUP BY AGE_GROUP;
    
    -- Distribution by age_group & age 
    
    SELECT 
	CASE 
       WHEN AGE>=18 AND AGE<28 THEN '18-27'
       WHEN AGE>=28 AND AGE<38 THEN '28-37'
       WHEN AGE>=38 AND AGE<48 THEN '38-47'
       WHEN AGE>=48 AND AGE<58 THEN '48-57'
	ELSE '58+'
    END AS AGE_GROUP,gender,
    COUNT(*) AS COUNT
    FROM HR
    WHERE AGE>=18 AND TERMDATE="0000-00-00" 
    GROUP BY AGE_GROUP,gender;
    
-- How many employees work at the headquarter vs remote location

SELECT LOCATION,COUNT(*) AS COUNT FROM HR 
 WHERE AGE>=18 AND TERMDATE="0000-00-00" 
group by location;

 
-- WHAT IS THE AVERAGE LENGTH OF EMPLOYMENT FOR THE EMPLOYEES WHO HAVE BEEN TERMINATED

SELECT round(avg(datediff(TERMDATE,HIRE_DATE)/365),2) FROM HR
where termdate<> "0000-00-00" and termdate<=curdate() and age>=18;

-- How does gender distribution vary across different departments

SELECT DEPARTMENT,GENDER,COUNT(*) COUNT FROM HR
WHERE AGE>=18 AND TERMDATE="0000-00-00" 
GROUP BY DEPARTMENT,GENDER
ORDER BY DEPARTMENT;

-- Distribution of job titles across company

select JOBTITLE,count(*) as count from HR 
WHERE AGE>=18 AND TERMDATE="0000-00-00" 
GROUP BY JOBTITLE
ORDER BY JOBTITLE DESC;

-- Distribution of employees across states

SELECT LOCATION_STATE,COUNT(*) AS COUNT FROM HR
where AGE>=18 AND TERMDATE="0000-00-00" 
group by LOCATION_STATE
ORDER BY COUNT DESC;

-- How has the companys employee count changed overtime changed based on hire and term dates 

SELECT year, hires, terminations, round((hires-terminations)/hires*100,2) as net_percent_changed from 
(SELECT YEAR(hire_date) as year,count(*) as hires,
SUM(CASE WHEN Termdate<>'0000-00-00' and termdate <= curdate() then 1 else 0 end) as terminations
from hr 
where AGE>=18 
group by year) HR_data
order by year;

-- Employee tenure distribution by department

SELECT Department,round(avg(datediff(termdate,hire_date)/365),2) as avg_tenure
from HR
where termdate <= curdate() and termdate <>'0000-00-00' and age>=18
group by department;