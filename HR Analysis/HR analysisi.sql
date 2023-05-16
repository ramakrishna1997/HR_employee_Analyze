CREATE DATABASE Hr;
USE Hr;
SELECT * FROM employee;
-- Write an SQL query to solve the given problem statement.
-- Find the average age of employees in each department and gender group. ( Round average  age up to two decimal places if needed)

SELECT round(avg(AGE),2),Department,gender FROM employee
GROUP BY Department,gender;

-- Write an SQL query to solve the given problem statement.
-- List the top 3 departments with the highest average training scores. ( Round average scores up to two decimal places if needed)

SELECT Department,round(AVG(avg_training_score),2) as  average_training_score FROM employee
GROUP BY Department
ORDER BY  average_training_score DESC
LIMIT 3;

-- Write an SQL query to solve the given problem statement.
-- Find the percentage of employees who have won awards in each region. (Round percentages up to two decimal places if needed)
    
SELECT region, ROUND((COUNT(*) / (SELECT COUNT(*) FROM employee WHERE awards_won > 0)) * 100, 2) as percentage
FROM employee
WHERE awards_won > 0
GROUP BY region
ORDER BY percentage DESC;

-- Write an SQL query to solve the given problem statement.
-- Show the number of employees who have met more than 80% of KPIs for each recruitment channel and education level.
SELECT * FROM employee;
SELECT education,recruitment_channel,count(*) as no_of_employess from employee
WHERE (KPIs_met_more_than_80)/100 
GROUP BY education,recruitment_channel;

-- Write an SQL query to solve the given problem statement.
-- Find the average length of service for employees in each department, considering only employees with previous year ratings greater than or equal to 4. ( Round average length up to two decimal places if needed)

SELECT *  FROM employee;

SELECT department,ROUND(AVG(length_of_service),2) AS avg_service_length FROM employee
WHERE previous_year_rating>=4
GROUP BY department
ORDER BY avg_service_length DESC;

-- Write an SQL query to solve the given problem statement.
-- List the top 5 regions with the highest average previous year ratings. ( Round average ratings up to two decimal places if needed)

SELECT region,ROUND(AVG(previous_year_rating),2) AS highest_average FROM employee
GROUP BY region
ORDER BY highest_average DESC
LIMIT 5;
-- Write an SQL query to solve the given problem statement.
-- List the departments with more than 100 employees having a length of service greater than 5 years.

SELECT * FROM employee;
SELECT department,count(*) as count_emp FROM employee
WHERE length_of_service>5
GROUP BY department
HAVING count(*) >100
ORDER BY count_emp desc;

-- Write an SQL query to solve the given problem statement.
-- Show the average length of service for employees who have attended more than 3 trainings, grouped by department and gender. ( Round average length up to two decimal places if needed)

SELECT * FROM employee;
SELECT gender,round(AVG(length_of_service),2) as average_length_of_service FROM employee
WHERE no_of_trainings>=3
GROUP BY department,gender
ORDER BY department ASC,gender ASC,average_length_of_service DESC;

-- Find the percentage of female employees who have won awards, per department. Also show the number of female employees who won awards and total female employees. ( Round percentage up to two decimal places if needed)

SELECT
  department,
  COUNT(CASE WHEN gender = 'f' AND awards_won > 0 THEN 1 END) AS female_employees_with_awards,
  COUNT(CASE WHEN gender = 'f' THEN 1 END) AS total_female_employees,
  ROUND((COUNT(CASE WHEN gender = 'f' AND awards_won > 0 THEN 1 END) / COUNT(CASE WHEN gender = 'f' THEN 1 END)) * 100, 2) AS percentage_of_female_employees_with_awards
FROM employee
GROUP BY department;

-- Write an SQL query to solve the given problem statement.
-- Calculate the percentage of employees per department who have a length of service between 5 and 10 years. ( Round percentage up to two decimal places if needed)
SELECT * FROM employee;

-- Calculate the percentage of employees per department who have a length of service between 5 and 10 years. ( Round percentage up to two decimal places if needed)

select department,
round(sum(case when length_of_service between 5 and 10 then 1 else 0 end)/count(*)*100,2) as per_emp from employee
group by department;

-- Write an SQL query to solve the given problem statement.
-- Find the top 3 regions with the highest number of employees who have met more than 80% of their KPIs and received at least one award, grouped by department and region.

SELECT department,region,count(*) AS emp_count FROM employee
WHERE KPIs_met_more_than_80>=0.8 and awards_won>=1
GROUP BY department,region
ORDER BY emp_count DESC
LIMIT 3;

-- Write an SQL query to solve the given problem statement.
-- Calculate the average length of service for employees per education level and 
-- gender, considering only those employees who have completed more than 2 trainings and 
-- have an average training score greater than 75 ( Round average length up to two decimal places if needed)
SELECT * FROM employee;

SELECT education,gender,round(avg(length_of_service),2) as avg_length FROM employee
WHERE avg_training_score>75 and no_of_trainings>2
GROUP BY education,gender
ORDER BY education DESC;

-- Write an SQL query to solve the given problem statement.
-- For each department and recruitment channel, find the total number of employees who have met more than 80% of their KPIs, have a previous_year_rating of 5, and 
-- have a length of service greater than 10 years.

SELECT department,recruitment_channel,count(*) as total_employee 
FROM employee
WHERE KPIs_met_more_than_80>0.8 and previous_year_rating=5 and length_of_service>10
GROUP BY department,recruitment_channel;

-- Write an SQL query to solve the given problem statement.
-- Calculate the percentage of employees in each department who have received awards, have a previous_year_rating of 4 or 5, and 
-- an average training score above 70, grouped by department and gender ( Round percentage up to two decimal places if needed).



select department,gender,round(count(case when awards_won>0 and 
previous_year_rating in (4,5) and avg_training_score>70 then 1 end)/
count(*) *100,2)  as pre 
from employee
group by department,gender;

-- Write an SQL query to solve the given problem statement.
-- List the top 5 recruitment channels with the highest average length of service for employees who have met more than 80% of their KPIs, 
-- have a previous_year_rating of 5, and an age between 25 and 45 years, g
-- rouped by department and recruitment channel. ( Round average length up to two decimal places if needed).

select department,recruitment_channel,round(avg(length_of_service),2) as avg_emp
from employee
where KPIs_met_more_than_80>0.8 and previous_year_rating=5 and
age between 25 and 45 
group by department,recruitment_channel
order by avg_emp desc
limit 5;







