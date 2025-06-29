# Finance_data-sql
SQL Financial Analysis Project

This project analyzes the income and expenses using SQL to generate business insights.

Project structure

Income_data.csv (department wise income data)
expenses_data.csv (department wise expense data)
Departments.csv
Finance_project.sql (Analysis_queries.sql)
project overview and presentation
Tools used
SQL server for data storage and queries
Excel for csv files
Powerpoint for visual presentation

Data import

in a real world scenario data would be imported from csv files into database. For this project, data can be either:
Imported using BULK INSERT (SQL Server), or
Manually inserted using INSERT INTO queries (for simplicity)

SQL
Example: Bulk Insert (commented)
BULK INSERT income_data
FROM 'C:\path\to\income_data.csv'
WITH (
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
FIRSTROW = 2
);


