create database hr_analytics;
use hr_analytics;
show tables;
describe table `wa_fn-usec_-hr-employee-attrition`;
DESCRIBE table `wn_fn-usec_-hr-employee-attrition`;
alter table `wa_fn-usec_-hr-employee-attrition` rename to hr_employee_attrition;
describe table hr_employee_attrition;

select * from hr_employee_attrition limit 3;

-- Total Employees-- 
select count(*) as total_employees from hr_employee_attrition;


-- Calculate Attrition Rate--  
SELECT 
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS attrition_rate
FROM hr_employee_attrition;


-- Department wise Attrition-- 
SELECT 
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM hr_employee_attrition
GROUP BY Department
ORDER BY attrition_count DESC;

-- Gender wise Attrition-- 
select 
	Gender,
    COUNT(*) as total_employess,
    sum(case when Attrition = 'Yes' then 1 else 0 end) as attrition_count
from hr_employee_attrition
group by Gender
order by attrition_count desc;

-- Overtime wise Attrition--  
select 
	Overtime,
    count(*) as total_employees,
    sum(case when Attrition = 'Yes' then 1 else 0 end) as attrition_count
from hr_employee_attrition
group by Overtime;    

-- Job Role Analysis --
select
	JobRole,
    count(*) as total_employees,
    sum(case when Attrition = 'Yes' then 1 else 0 end) as attrition_count
from hr_employee_attrition
group by JobRole
order by attrition_count desc;

