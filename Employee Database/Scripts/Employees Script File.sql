-- Created table employees
create table employees (Employee_ID int primary key auto_increment, 
						First_Name varchar(50),
						Last_Name varchar(50),
						Department varchar(50), 
						Hire_Date date, 
						Salary int(10),
						Hourly_Pay decimal(4, 2));

-- Imported csv file with employee data
load data infile 'D:\employees.csv'
into table employees 
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(First_Name, Last_Name, Department, Hire_Date, Salary, Hourly_Pay);

-- Full Table
select * from employees;

-- Average salary of employees grouped by ID, Name and Department
select Employee_ID, concat(First_Name," " ,Last_Name) as "Full_Name",
	   Department, avg(Salary) as Avg_Salary
from employees
group by Employee_ID,Department, Full_Name;

-- Headcount of employees in each Department
select Department, count(*) as Headcount
from employees
group by Department;