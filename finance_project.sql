create database finance_project

Create table Departments(
Department_id int primary key,
Department_name Varchar(50)
)

insert into Departments Values
(1, 'Finance'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'HR'),
(5, 'Technical')

Create table Income_data (
Transaction_id int primary key,
date DATE,
Amount Decimal(12,2),
Department_id int,
Source Varchar(100),
foreign key(Department_id) references Departments(Department_id))

Insert into Income_data Values
(1001,'2024-01-05', 150000, 2, 'Product Sales'),
(1002,'2024-01-15', 180000, 2, 'Service revenue'),
(1003,'2024-02-10', 120000, 2, 'Product Sales'),
(1004,'2024-02-25', 130000, 3, 'Campaign Revenue'),
(1005,'2024-03-10', 100000, 2, 'Product Sales'),
(1006,'2024-03-15', 155000, 3, 'Webinar Revenue'),
(1007,'2024-04-01', 160000, 2, 'Product Sales'),
(1008,'2024-04-20', 185000, 4, 'Internal Billing'),
(1009,'2024-05-05', 190000, 1, 'Investment return'),
(1010,'2024-05-18', 180000, 1, 'Interest Income'),
(1011,'2024-06-02', 123400, 5, 'Tech Consultation'),
(1012,'2024-07-10', 190000, 2, 'Product Sales'),
(1013,'2024-07-22', 110000, 5, 'Tech Support Package'),
(1014,'2024-08-15', 170000, 3, 'Sponsorship'),
(1015,'2024-08-20', 150000, 3, 'Webinar Revenue'),
(1016,'2024-09-10', 150000, 2, 'Product Sales'),
(1017,'2024-09-30', 280000, 2, 'Internal Billing'),
(1018,'2024-10-11', 175000, 2, 'Product Sales'),
(1019,'2024-10-30', 199000, 5, 'Tech Consultation'),
(1020,'2024-11-10', 133300, 2, 'Tech Consultation')

select*from Income_data

Create table expense_data (
Expense_id int primary key,
date DATE,
Amount Decimal(12,2),
Department_id int,
Source Varchar(100),
foreign key(Department_id) references Departments(Department_id))

Insert into expense_data Values
(01,'2024-01-15', 40000, 1, 'Office Supplies'),
(02,'2024-01-25', 10000, 2, 'Commisions'),
(03,'2024-02-10', 12000, 2, 'Travel'),
(04,'2024-02-20', 160000, 1, 'Salary'),
(05,'2024-03-11', 1000, 3, 'Ad campaign'),
(06,'2024-03-18', 15000, 3, 'Events'),
(07,'2024-04-12', 16000, 4, 'Recruitment fee'),
(08,'2024-04-21', 85000, 4, 'Employee welfare'),
(09,'2024-05-27', 90000, 5, 'Software licenses'),
(10,'2024-05-19', 80000, 5, 'IT infrastructure'),
(11,'2024-06-20', 23400, 1, 'Bonuses'),
(12,'2024-07-19', 25000, 1, 'Stationary'),
(13,'2024-07-23', 46000, 2, 'Client Entertainment'),
(14,'2024-08-18', 12000, 2, 'Local Travel'),
(15,'2024-08-25', 19000, 3, 'Digital Marketing'),
(16,'2024-09-19', 22000, 3, 'Brand Promotion'),
(17,'2024-09-29', 28000, 5, 'Server Maintainance'),
(18,'2024-10-31', 18500, 5, 'Cloud Subscription'),
(19,'2024-11-5', 19900, 1, 'Audit Fees'),
(20,'2024-11-18', 13300, 4, 'HR software')

select*from expense_data




--Calculate income earned in each month in the financial year.

select Month(date) as month,
sum(amount) as total_income
from Income_data
group by MONTH(date)
order by month 

--Calculate expenses incurred in each month in the financial year.

select Month(date) as month,
sum(amount) as total_expense
from expense_data
group by MONTH(date)
order by month 

--Calculate Net Profit per month

select 
i.month,
i.total_income - Coalesce(e.total_expense,0) as net_profit
from
(select Month(date) as month,sum(amount) as total_income
from Income_data
group by MONTH(date)) i
left join
(select Month(date) as month,sum(amount) as total_expense
from expense_data
group by MONTH(date)) e
on i.month = e.month
order by i.month

-- Calculate Expenses incurred by each department

SELECT 
d.department_name,
SUM(e.amount) AS department_expense
FROM expense_data e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

-- Calculate Department-wise Cost % 

SELECT 
d.department_name,
ROUND(SUM(e.amount) * 100.0 /  (SELECT SUM(amount) FROM expense_data), 2) AS cost_percentage
FROM expense_data e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;



 



