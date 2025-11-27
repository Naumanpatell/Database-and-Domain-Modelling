Create Table Employees (
EmployeeID char(4) Primary Key ,
Emp_Name varchar(50) NOT null,
Department varchar(20),
Salary numeric(8,2),
HireDate date );

Insert into Employees values
('E001' ,   'Alice'   , 'HR'	,65000.00	,'2022-03-15'),
('E002' ,	'Bob'	  , 'IT'    ,92000.00	,'2021-11-20'),
('E003' ,	'Charlie' , 'HR'	,75000.00	,'2023-01-10'),
('E004' ,	'Dana'    , 'IT'	,88000.00	,'2023-05-01'),
('E005' ,	'Eve'     , Null 	,105000.00	,'2024-02-28');

Update Employees 
Set salary = salary*1.10
Where EmployeeID = 'E001';

Delete From Employees
Where EmployeeID = 'E004';


Update Employees 
Set Department = 'sales'
Where EmployeeID = 'E005';

Select * From Employees;

Select Department,
	Avg(Salary) as AvgSalary
From Employees
Group by Department
Having Count(EmployeeID) > 1
	And Avg(Salary) > 70000;

select Department, Max(Salary) as maxsalary
from employees
group by Department
having Max(Salary) < 100000;

select Emp_Name, Salary
From employees 
Where Department = 'IT'
Order by HireDate Desc;

Select Avg(salary) as avgsalary, 
Count(EmployeeID) as TotalEmployees From Employees


