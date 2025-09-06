-- Created table sales
create table sales
				(Sale_ID int primary key auto_increment,
                 Employee_ID int,
                 foreign key(Employee_ID) references employees(Employee_ID),
                 Sale_Date date,
                 Sale_Amount decimal(15, 2),
                 No_of_Sales int);

-- Imported csv file with sales data
load data infile 'D:\employee_sales.csv'
into table sales
fields terminated by ','
lines terminated by '\n'
ignore 1 rows
(Employee_ID,Sale_Date,Sale_Amount,No_of_Sales);

-- Full Table
select * from sales;

-- Table showing the total sales and number of sales made by each employee
select employees.Employee_ID, employees.First_Name, employees.Last_Name, 
	   sum(Sale_Amount) as Total_Sales, sum(No_of_Sales)
from employees
join sales on employees.Employee_ID = sales.Employee_ID
group by employees.Employee_ID;