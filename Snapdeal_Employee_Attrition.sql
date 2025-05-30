use Snapdeal_Employee_Attrition_Analysis;
select * from Snapdeal_Employee_Attrition_Analysis;

# 1. Count Total Employees
select count(employee_id) as "Total"
from Snapdeal_Employee_Attrition_Analysis;

# 2. List All Employees with Salary Greater Than 1 Lakh

select *
from Snapdeal_Employee_Attrition_Analysis
where salary > 100000;
select count(*)
from Snapdeal_Employee_Attrition_Analysis
where salary > 100000;

# 3. Find Employees in 'Sales' or 'IT' Department with Age < 35

select *
from Snapdeal_Employee_Attrition_Analysis
where Department in ('Sales', 'IT') and Age < 35;

# 4. Calculate Average Salary by Department
select department, avg(salary)
from Snapdeal_Employee_Attrition_Analysis
group by department;

# 5. Departments with Average Bonus > 10,000
select department, avg(Bonus) as "Average_Bonus"
from Snapdeal_Employee_Attrition_Analysis
group by department
having "Average_Bonus" >10000;

select * from Snapdeal_Employee_Attrition_Analysis;

# 6. Top 5 Highest Paid Employees 
select employee_id, department, job_role, salary
from Snapdeal_Employee_Attrition_Analysis
order by salary desc
limit 5;

# 7.Employees with >10 Years Experience & Low Work-Life Balance
select employee_id, Years_of_Experience, Work_Life_Balance
from Snapdeal_Employee_Attrition_Analysis
where Years_of_Experience >10 and Work_Life_Balance ="Poor";

# 8. Gender-wise Attrition Count
select gender, count(Attrition)
from Snapdeal_Employee_Attrition_Analysis
where Attrition = "Yes"
group by gender;

# 9. Employees Not Promoted in Last 10 Years

select employee_id, Years_Since_Last_Promotion
from Snapdeal_Employee_Attrition_Analysis
where Years_Since_Last_Promotion > 10;

# 10.Employees with More Overtime 40 but Lower Bonus of 5000
select employee_id, Overtime_Hours, Bonus
from Snapdeal_Employee_Attrition_Analysis
where Overtime_Hours > 40 and Bonus <=5000;

# 11. Highest Performer in Each Department

select department, max(Performance_Rating) as "Highest_Performer"
from Snapdeal_Employee_Attrition_Analysis
group by department;

# 12. Count of Employees by Education Level and Job Role

select Job_Role, Education_Level, count(Job_Role) as "COunt_Job_Role", count(Education_Level) as "count_Education Level"
from Snapdeal_Employee_Attrition_Analysis
group by Job_Role, Education_Level;

# 13. Find the top 3 departments with the highest average salary among those where the average salary is greater than ₹100,000.
# Show department name and average salary.

select Department, avg(salary) "average_salary"
from Snapdeal_Employee_Attrition_Analysis
group by department
having "average_salary" > 10000
order by "average_salary" desc
limit 3;

# 14. List the top 5 job roles with more than 5 employees having a performance rating of 4. 
# Show job role and average bonus, ordered by bonus descending.

select Job_Role, avg(Bonus) "avg_bonus"
from Snapdeal_Employee_Attrition_Analysis
where Performance_Rating = 4
group by Job_Role
order by "avg_bonus" desc
limit 5;

# 15. Categorize employees into Salary Bands: 'Low' if salary < 50,000 'Medium' if salary between 50,000 and 1,00,000 'High' if salary > 1,00,000
select *,
case 
  when salary between 50000 and 100000 then 'Medium'
  when salary > 100000 then 'High'
  else 'Low'
end as 'Salary_Bands'
from Snapdeal_Employee_Attrition_Analysis;

# 16. find employees with above-average salary and count as well.

select *
from Snapdeal_Employee_Attrition_Analysis
where salary > (select avg(salary) from Snapdeal_Employee_Attrition_Analysis);

select count(*)
from Snapdeal_Employee_Attrition_Analysis
where salary > (select avg(salary) from Snapdeal_Employee_Attrition_Analysis);

# 17. Use a CTE to find the top 5 employees with the highest total compensation (Salary + Bonus).

with my_cte as (select employee_id, department, Job_Role, salary, bonus, (Salary + Bonus) as 'total_compensation'
                  from Snapdeal_Employee_Attrition_Analysis)
  
select * 
from my_cte
order by 'total_compensation' desc
limit 5;

# 18. Show the first bonus amount received in each department.
select bonus,
FIRST_VALUE(bonus) OVER(partition by department order by bonus) AS "FIRST_VALUE"
from Snapdeal_Employee_Attrition_Analysis;

# 19. Show next employee's salary within the same department.
select salary,
lead (salary) over (order by salary) AS 'next_employee'
from Snapdeal_Employee_Attrition_Analysis;

# 20. Show previous employee’s performance rating by job role.
select Performance_Rating,
lag (Performance_Rating) over (order by Performance_Rating) AS 'next_employee'
from Snapdeal_Employee_Attrition_Analysis;

# 21.Assign a unique row number to employees in each department by salary (highest first).
select *,
row_number() over (order by salary desc) as 'row_number'
from Snapdeal_Employee_Attrition_Analysis;

select * from training_history;

# 22 Find all training records, including those where the employee is missing in the main data (hypothetical if any mismatch occurs).
SELECT *
FROM training_history
LEFT JOIN Snapdeal_Employee_Attrition_Analysis
ON training_history.Employee_ID = Snapdeal_Employee_Attrition_Analysis.Employee_ID;

# 23. Get distinct employee_id (as learning opportunities list).

select Employee_ID
from Snapdeal_Employee_Attrition_Analysis
union 
select Employee_ID
from training_history;

# 24. List all employees and all training records, even if there's no match.
SELECT *
FROM training_history
LEFT JOIN Snapdeal_Employee_Attrition_Analysis
ON training_history.Employee_ID = Snapdeal_Employee_Attrition_Analysis.Employee_ID
union
SELECT *
FROM training_history
right JOIN Snapdeal_Employee_Attrition_Analysis
ON training_history.Employee_ID = Snapdeal_Employee_Attrition_Analysis.Employee_ID;

# 25.Find employees who received training in 2023 but have a low performance rating (<=2).
select *
from Snapdeal_Employee_Attrition_Analysis
where Performance_Rating <=2 and Employee_ID in (select Employee_ID
                                                  from training_history 
                                                  where Training_Year = 2023); 


# 26. List employees who completed any training, along with their training name and department.
SELECT *
FROM training_history
inner JOIN Snapdeal_Employee_Attrition_Analysis
ON training_history.Employee_ID = Snapdeal_Employee_Attrition_Analysis.Employee_ID;


select	count(*)
from Snapdeal_Employee_Attrition_Analysis
where Years_of_Experience>30;






select * from Snapdeal_Employee_Attrition_Analysis;
