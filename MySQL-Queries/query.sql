show databases;

create database guvi;
create database test;
show databases;
drop database test;
show databases;

-- Use specific database and start creating the tables
use guvi;

-- CREATE TABLE table_name(
--   columns datatype
-- )

CREATE TABLE Contact(
    id int,
    Name varchar(20),
    email varchar(50),
    phone varchar(12),
    description varchar(100)
);

-- Drop table table_name
drop table contact; --it deletes the table and all records as well
truncate table contact; --it deletes the all the records but table struture will remain


show tables;


Insert INTO contact(id,name,email,phone,description) values (1,'guvi','guvi@gmail.com','9999999999','hey how areyou');	

Insert INTO contact(id,name,email,phone,description) values (2,'rohan','rohan@gmail.com','8888888888','hey how areyou');

Insert INTO contact(id,name,email,phone,description) values (3,'rahul','rahul@gmail.com','777777777','hey how areyou');	

Insert INTO contact(id,name,email,phone,description) values (4,'aditya','aditya@gmail.com','6666666666','hey how areyou');	

Insert INTO contact(id,name,email,phone,description) values (5,'naz','naz@gmail.com','9874563214','hey how areyou');	

select * from contact;
select name,email from contact;

Insert INTO contact(id,name,email,phone,description) values (2,'rohan','rohan@gmail.com','8888888888','hey how areyou');

Insert INTO contact(id,name,email,phone,description) values (3,'rahul','rahul@gmail.com','777777777','hey how areyou');	

Select distinct id from contact;
select * from contact where name='naz';
select name,phone from contact where name='rohan';
select name,email,description from contact where email='guvi@gmail.com';


Insert INTO contact(id,name,email,phone,description) values (7,'sudarshan','sudarshan@gmail.com','','');

Insert INTO contact(id,name,email,phone,description) values (8,'aryan','sudarshan@gmail.com','','');	

select * from contact where phone='';
Insert INTO contact(id,name,email,phone,description) values (9,'ark','ark@gmail.com',null,null);
select * from contact; 	

truncate table contact;
select * from contact; 	

Insert INTO contact(id,name,email,phone,description) values (1,'guvi','guvi@gmail.com','9999999999','hey how areyou');	

Insert INTO contact(id,name,email,phone,description) values (2,'rohan','rohan@gmail.com','8888888888','hey how areyou');

Insert INTO contact(id,name,email,phone,description) values (3,'rahul','rahul@gmail.com','777777777','hey how areyou');	

Insert INTO contact(id,name,email,phone,description) values (4,'aditya','aditya@gmail.com','6666666666','hey how areyou');	


Update contact 
set phone='9879879879', name='ark'
where id=1;

Update contact
set name='test'
where id=3;

select * from contact;



Insert INTO contact(id,name,email,phone,description) values (6,'naz','naz1@gmail.com','9191919191','hey how areyou');


Update contact set name='nazz ark' where name='naz' and phone='9191919191';
select * from contact;

-- delete
-- Delete from table_name
-- where 

Delete from contact
where id=5;


Delete from contact
where description='hey how areyou' and name='guvi';

Delete from contact;

truncate contact


-- NOt Null

CREATE TABLE Employees(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT
);

-- inserting the data 
insert into employees (EmployeeID,FirstName,LastName,Age) values (1,'aryan','smith',30);
insert into employees (EmployeeID,FirstName,LastName,Age) values (2,'','smith',30);
select * from employees;
insert into employees values(3,'ark','pro',28);

-- Unique Constraints

CREATE TABLE Users(
    USERID INT PRIMARY Key,
    Username varchar(50) UNIQUE,
    email VARCHAR(100) UNIQUE,
    password varchar(30)
);

insert into Users values(1,'aryan','aryan@gmail.com','india');
insert into Users values(2,'aryan','aryan@gmail.com','india'); -- error

insert into Users  (UserID, Username, Email) values (2,'smith','smith@gmail.com');
insert into Users  ( UserID,Email ) values (3,'ark@gmail.com');

CREATE TABLE BusinessUsers(
    USERID INT PRIMARY Key,
    Username varchar(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password varchar(30) NOT NULL
);
insert into BusinessUsers  (UserID, Username, Email,password) values (1,'smith','smith@gmail.com','******');
insert into BusinessUsers  (UserID, Username, Email,password) values (2,'cummins','cummins@gmail.com','******');


-- Primary Keys;

Create Table Products(
    ProductID int Primary Key,
    ProductName varchar(100) NOT NULL,
    Price Decimal(10,2)
);


Insert into Products values(1,'Laptop',25999.99);
Insert into Products values(1,'Mobile',15000.99); ---error
Insert into Products values(2,'Mobile',15000.99);

--Foreign Key COnstraints

Create Table Departments(
DepartmentId Int Primary Key,
DepartmentName varchar(100) NOT NULL
);


Create Table Employees(
    EmployeeID INT Primary KEY,
    FirstName varchar(100) NOT NULL,
    LastName varchar(100) NOT NULL,
    DepartmentId INT,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId) 
);

Insert into Departments values(1,'Engineering');
Insert into Departments values(2,'HR');
Insert into Departments values(3,'Finance');
Insert into Departments values(4,'Manager');

Insert into Employees values(1,'aadithyaa','rajath',1);
Insert into Employees values(2,'amrutha','bhatta',2);
Insert into Employees values(3,'nazneen','anjum',3);
Insert into Employees values(4,'ark','pro',1);
Insert into Employees values(5,'harshith','bhaskar',4);
Insert into Employees values(6,'aryan','d',2);


Insert into Employees values(7,'test','data',5); --error becuz id 5 is not present in the table department

-- CHECK Constraints 

CREATE Table Orders(
    OrderID INT Primary KEY,
    Quantity Int,
    Price Decimal(10,2),
    CHECK (Quantity>0 AND Price>=0)
);

Insert into Orders (OrderID,Quantity,Price) values(1,5,199.99);
Insert into Orders (OrderID,Quantity,Price) values(2,0,299.99);
Insert into Orders (OrderID,Quantity,Price) values(3,10,500);
Insert into Orders (OrderID,Quantity,Price) values(4,-10,-500.55);


-- Default Contraint

Create Table Customers(
    CustomerID INT Primary Key,
    CustomerName varchar(100) NOT NULL,
    Country varchar(50) Default 'INDIA'
);

Insert into Customers(CustomerID,CustomerName) values (1,'Naz');
Insert into Customers(CustomerID,CustomerName) values (2,'Anee');
Insert into Customers(CustomerID,CustomerName,Country) values (3,'alice','INDIA');


-- Alter

Create Table Employees(
    EmployeeID int Primary key,
    FirstName varchar(10),
    LastName varchar(10)
);

-- Add a column

Alter table Employees
Add Age INT;

-- Dropping the column

Alter Table Employees
Drop column LastName;

Alter table Employees
Add LastName VARCHAR(10);


-- modifying the data type
Alter Table employees
MODIFY column Age varchar(3);


-- add the constraint
Alter Table Employees
ADD CONSTRAINT unique_full_name UNIQUE(FirstName,LastName);

-- The Employees table now has a UNIQUE constraint on the combination of FirstName and LastName

-- ADD CONSTRAINT unique_full_name -> future keep track if i want to drop
-- UNIQUE(FirstName,LastName)- combination of FirstName and LastName should not match

-- Jhon Cena 
-- Jhon guard
-- Cena Jhon
-- Jhon Cena

--dropping a constraint

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    CONSTRAINT unique_full_name UNIQUE (FirstName, LastName)
);

Alter Table employees
Drop Constraint unique_full_name;

-- Rename a column

Alter Table Employees
RENAME column FirstName to Fname; 


-- And and OR operation

-- 1-TRUE 0-False

-- -- condition1 and condition2 =
-- -- TRUE       and False = False
-- AND

-- TRUE and TRUE = TRUE
-- TRUE and FALSE = FALSE
-- FALSE and TRUE=FALSE
-- FALSE and FALSE=FALSE

-- -- condition1 and condition2 and condtion3 and condition4 = TRUE if all conditions are TRue

-- OR 

-- TRUE OR TRUE = TRUE
-- TRUE OR FALSE = TRUE
-- FALSE OR TRUE=TRUE
-- FALSE OR FALSE = FALSE

-- -- condition1 and condition2 and condtion3 and condition4 = TRUE if anyone condition is true

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Salary) VALUES
(1, 'John', 'Doe', 30, 'HR', 50000.00),
(2, 'Jane', 'Smith', 40, 'Engineering', 60000.00),
(3, 'Alice', 'Johnson', 25, 'HR', 45000.00),
(4, 'Bob', 'Brown', 50, 'Engineering', 70000.00),
(5, 'Charlie', 'Davis', 35, 'Marketing', 55000.00),
(6, 'Emily', 'White', 28, 'Engineering', 48000.00);


-- Scenario: Select employees who are either in the HR department and under 35 years old or in the Engineering department with a salary above 50,000.

Select * from Employees
where (Department='HR' and Age<35)
or (Department='Engineering' and salary>50000);


-- Scenario: Select all employees and order the results by department in ascending order and by salary in descending order within each department.


Select * from employees
order by Department ASC , Salary DESC;

--Select employees who are either under 30 years old or in the Marketing department, 
--and order the results by age in ascending order and by last name in ascending order within each age.

Select * from Employees
Where age<=30
or department='Marketing'
ORDER BY Age ASC ,LastName asc;


Select * from Employees
Where age<=30
or department='Marketing'
ORDER BY LastName asc;


-- MIN 
Select MIN(Age) AS yougestAge
From Employees;

Select MIN(Salary) AS minSal
From Employees;

Select MAX(Age) AS highAge
From Employees;

Select MAX(Salary) AS maxSal
From Employees;


Select MIN(salary) as MinSal , MAX(Salary) as maxSal
from employees
where department='Engineering';

Select MAX(salary) - MIN(Salary) as salDIfference
from employees;

-- count

Select COUNT(*) AS totalemployess
from employees;

Select Department, COUNT(*) as NumberofEmployees
from employees
GROUP BY Department;


-- AVG
Select AVG(Salary) as Avgsalary
from employees;

Select AVG(age) as Avgage
from employees;

Select Department, AVG(Salary) AS AverageSalary
from employees
GROUP BY Department;

-- SUM
Select SUM(Salary) as TotalEmployeesSalary
from employees;

Select Department, SUM(Salary) AS TotalEmployeesSalary
from employees
GROUP BY department;



-- For each department, find the number of employees, the average age, and the total salary. 
Select Department, COUNT(*) As NumberOfEmployees, AVG(age) as AverageAge , SUM(Salary) as TotalEmployeesSalary
from employees
GROUP BY Department;

-- GROUP BY : used to arrange identical data into groups

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Salary, HireDate) VALUES
(1, 'John', 'Doe', 30, 'HR', 50000.00, '2018-01-15'),
(2, 'Jane', 'Smith', 40, 'Engineering', 60000.00, '2017-04-23'),
(3, 'Alice', 'Johnson', 25, 'HR', 45000.00, '2019-03-11'),
(4, 'Bob', 'Brown', 50, 'Engineering', 70000.00, '2016-11-30'),
(5, 'Charlie', 'Davis', 35, 'Marketing', 55000.00, '2018-07-19'),
(6, 'Emily', 'White', 28, 'Engineering', 48000.00, '2020-08-05');


--  Find the number of employees in each department.

Select Department, Count(*) as noofemployees
from employees
group by department;

-- Find departments with more than 1 employee.

SELECT Department, Count(*) as noofemployees
FROM employees
GROUP BY department
HAVING count(*)>1;

-- : Find the number of employees in each department by age.
SELECT Department,Age, Count(*) as noofemployees
FROM employees
GROUP BY department,Age;

-- Find the number of employees hired each year.
Select YEAR(HireDate) as HiredYear , Count(*) as numberofemployees
from employees
group by YEAR(HireDate);

--  Find the total salary paid in each department and order the results by total salary in descending order.

Select Department, SUM(Salary) as totalSalary
from Employees
group by department
ORDER BY totalSalary DESC;

-- Find the average salary of employees older than 30, grouped by department.

Select Department , AVG(Salary) as Avgsalary
from Employees
where age>30
group by department;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Country VARCHAR(50)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Country) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'INDIA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'Canada'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.net', 'UK'),
(4, 'Bob', 'Brown', 'bob.brown@example.org', 'INDIA'),
(5, 'Charlie', 'Davis', 'charlie.davis@example.com', 'Australia'),
(6, 'Emily', 'White', 'emily.white@example.com', 'INDIA');


-- Find all customers whose first name starts with 'J'.

Select * from customers
where FirstName LIKE 'J%';

Select * from customers
where FirstName LIKE 'J%' or LastName LIKE 'J%';

-- wildcard -> %, _ 
--  Find all customers whose first name is exactly four characters long and starts with 'J'

Select * from customers
where FirstName LIKE 'J___';

-- Find all customers whose email address contains 'example' and ends with '.com'.

Select * from customers
where Email LIKE '%example%.com';


Find all customers whose email contains 'example_' (underscore as a literal character).

-- Select * from customers
-- Where email LIKE '%example\_%' ESCAPE '\';

-- LIKE '%example\_%' matches any value that contains 'example_' where _ is treated as a literal character. The ESCAPE '\' clause specifies that the backslash \ is the escape character.

--  Find all customers whose last name does not start with 'D'.
Select * from customers
where LastName NOT LIKE 'D%';


Select * from customers
where LastName NOT LIKE 'd%';


Select * from customers
where Country  LIKE 'I%' COLLATE utf8mb4_general_ci;

ALTER TABLE Customers CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;


-- Find all customers whose email domain is 'example.com'.

select * from customers
where email LIKE '%example.com';


select * from customers
where FirstName LIKE '%i%';

-- IN operators
-- The SQL IN operator is used to filter the result set based on a list of specified values. It is a shorthand for multiple OR conditions. Let's explore the IN operator in depth with various examples and scenarios.

-- CREATE TABLE Orders (
--     OrderID INT PRIMARY KEY,
--     CustomerID INT,
--     OrderDate DATE,
--     Status VARCHAR(20),
--     TotalAmount DECIMAL(10, 2)
-- );

-- INSERT INTO Orders (OrderID, CustomerID, OrderDate, Status, TotalAmount) VALUES
-- (1, 101, '2023-01-15', 'Shipped', 150.00),
-- (2, 102, '2023-02-20', 'Pending', 200.00),
-- (3, 101, '2023-03-11', 'Cancelled', 50.00),
-- (4, 103, '2023-04-10', 'Shipped', 300.00),
-- (5, 104, '2023-05-05', 'Pending', 100.00),
-- (6, 105, '2023-06-25', 'Shipped', 250.00);




-- Select * from Orders
-- where Status ='Pending' or Status='Shipped';

Select * from Orders
where Status IN ('Shipped','Pending');


--  Find all orders placed by customers with CustomerID 101, 103, or 105.

Select * From Orders
Where CustomerID IN (101,102,105);

Select * From Orders
Where Status NOT IN ('Cancelled');

Select * From Orders
Where Status  IN ('Cancelled');

IN- Subquieries
--  Find all orders where the customer has another order with 'Cancelled' status.
Select * from orders
where CustomerID IN (Select CustomerID from orders where status='Cancelled');


-- Find all orders placed in January or February 2023.
Select * from orders
where OrderDate IN ('2023-01-15','2023-02-20');

-- : Find orders with specific combinations of CustomerID and Status.

Select * from Orders
Where (CustomerID,Status) IN ((101,'Shipped'),(103,'Shipped'),(104,'Pending'));



Select * from orders 
where OrderDate BETWEEN '2023-01-01' AND '2023-05-01';

Select * from orders 
where OrderDate NOT BETWEEN '2023-01-01' AND '2023-03-01';


Select 
  OrderID as OID,
  CustomerID as CID,
  OrderDate as Date,
  Status As OrderStatus,
  TotalAmount as Amount 
From Orders;

-- Find all orders placed between January 1, 2023, and April 30, 2023, with status 'Shipped' or 'Pending', and use aliases to rename columns.

Select 
  OrderID as OID,
  CustomerID as CID,
  OrderDate as Date,
  Status As OrderStatus,
  TotalAmount as Amount 
From Orders
Where OrderDate BETWEEN '2023-01-01' AND '2023-04-30'
And Status IN ('Shipped','Pending');


-- Performance Considerations
-- BETWEEN: Efficient for range queries, especially on indexed columns.
-- IN: Efficient for checking against a small set of values; for large sets, consider using a join with a subquery or a table.
-- ALIAS: Does not affect performance but improves readability and maintainability.

-- Joins
-- Inner Join

Create Table Department(
    deptId int not null Auto_Increment,
    deptName varchar(40) Not Null,
    Primary key (deptId)
);



Create Table Employee(
    empID int NOt null Auto_Increment,
    employeeName varchar(30) Not null,
    employeeSalary BigINT,
    employeePhoneNumber BigINT Not Null,
    deptId int,
    Primary Key (empID),
    FOREIGN Key (deptId) REFERENCES Department(deptId)
);

Insert Into Department Values(1,'Frontend Developer'),
(2,'Backend Developer'),(3,'Full Stack Developer'),(4,'HR');

Insert into Department (deptName) Values ('Digital Marketing');
Insert into Department (deptName) Values ('Manager');
Insert into Department (deptName) Values ('Financial');


Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('Anees',25000,9874589654,3);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('Amrutha',55000,9874544654,4);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('Aadithyaa',35000,8884589654,1);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('Meghana',65000,9995559654,2);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('Akhil',25000,9874589994,1);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('Vinod',45000,9872589654,3);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber) Values ('Aneeka',85000,9800089654);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('Priyanka',75000,7774589654,3);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('Naz',175000,9974589654,6);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('rajath',275000,9999589654,6);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber) Values ('rahul',5000,99995812354);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber) Values ('rani',75000,9999584554);


-- 
-- Inner Join Syntax

-- Select table1.column_name, table2.column_name
-- from table1
-- Inner join table2
-- on tabl1.columnname=table2.column_name

Select Employee.EmpID,Employee.employeeName, Employee.employeeSalary, Department.deptName
from Employee
INNER JOIN Department
ON Employee.deptId=Department.deptId;

Select Employee.EmpID,Employee.employeeName, Employee.employeeSalary, Department.deptName
from Employee
INNER JOIN Department
Where Employee.deptId=Department.deptId;

-- Left Join
-- Select columns
-- from table1
-- Left join table2
-- on tabl1.columnname=table2.column_name


Select emp.EmpID,emp.employeeName, emp.employeeSalary, dpt.deptName
from Employee as emp
LEFT JOIN Department as dpt
ON emp.deptId=dpt.deptId;

-- Right Join

-- Select columns
-- from table1
-- Right join table2
-- on tabl1.columnname=table2.column_name

Select emp.EmpID,emp.employeeName, emp.employeeSalary, dpt.deptName
from Employee as emp
RIGHT JOIN Department as dpt
ON emp.deptId=dpt.deptId;

-- full join

-- Select emp.empID, emp.employeeName, dept.deptName
-- from employee emp
-- FULL JOIN Department dept
-- ON emp.deptId=dept.deptId;

-- UNION | LEFT | RIGHT


Select emp.empID, emp.employeeName, dept.deptName
from employee emp
LEFT JOIN Department dept
on emp.deptId=dept.deptId
UNION
Select emp.empID, emp.employeeName, dept.deptName
from employee emp
RIGHT JOIN Department dept
on emp.deptId=dept.deptId;


-- cross join

select * from employee
cross join department;


-- Triggers


Create table Employee(
    empid int not null,
    empName varchar(20) not null,
    joiningDate date,
    workingHours int
);

insert into Employee Values(1,'Anees','2021-09-23',9);
insert into Employee Values(2,'Naz','2024-05-21',8);
insert into Employee Values(3,'Khushi','2023-09-03',10);
insert into Employee Values(4,'Aadithyaa','2021-07-21',9);
insert into Employee Values(5,'AMrutha','2022-09-23',9);

Delimiter //
Create Trigger empolyeeAction
BEFORE INSERT on employee
FOR EACH ROW
BEGIN
IF new.workingHours>10 or new.workingHours<0
THEN SET new.workingHours=6;
END IF;
END//

Insert into Employee VALUES(6,'vinod','2023-05-20',15);
Insert into Employee VALUES(7,'prashant','2023-05-20',-5);


CREATE TABLE Labour(  
    name varchar(45) NOT NULL,    
    occupation varchar(35) NOT NULL,    
    working_date date,  
    working_hours int
);  

Delimiter $$
Create Trigger LabourAction
BEFORE INSERT On Labour
for each ROW
BEGIN
If new.occupation='construction' Then set new.occupation='Civil';
END IF;
END

Insert into Labour Values ('ark','construction','2023-12-12',7);
Insert into Labour Values ('pro','construction','2023-12-12',8);


Create Table Student_info(
  stud_id int NOT NULL,  
  stud_code varchar(15) DEFAULT NULL,  
  stud_name varchar(35) DEFAULT NULL,  
  subject varchar(25) DEFAULT NULL,  
  marks int DEFAULT NULL,  
  phone varchar(15) DEFAULT NULL,  
  PRIMARY KEY (stud_id)  
);

Create Table Student_detail(
  stud_id int NOT NULL,  
  stud_code varchar(15) DEFAULT NULL,  
  stud_name varchar(35) DEFAULT NULL,  
  subject varchar(25) DEFAULT NULL,  
  marks int DEFAULT NULL,  
  phone varchar(15) DEFAULT NULL,  
  Lastinserted Time,  
  PRIMARY KEY (stud_id)  
);


Delimiter //
Create Trigger StudentInsertion
AFTER INSERT ON Student_info 
FOR EACH ROW
BEGIN
Insert Into Student_detail Values (new.stud_id,new.stud_code,new.stud_name,new.subject,new.marks,new.phone,CURTIME());
END
//


INSERT INTO student_info VALUES   
(1, 110, 'Anees', 'Science', 67, '9874587496');  
INSERT INTO student_info VALUES   
(2, 110, 'rahul', 'Physics', 87, '874858748');  
INSERT INTO student_info VALUES   
(3, 110, 'rohan', 'Maths', 97, '7896547852'); 
INSERT INTO student_info VALUES   
(4, 110, 'deekshith', 'Social', 57, '8998988989');  


-- Update

CREATE TABLE sales_info (  
    id INT AUTO_INCREMENT,  
    product VARCHAR(100) NOT NULL,  
    quantity INT NOT NULL DEFAULT 0,  
    fiscalYear SMALLINT NOT NULL,  
    CHECK(fiscalYear BETWEEN 2000 and 2050),  
    CHECK (quantity >=0),  
    UNIQUE(product, fiscalYear),  
    PRIMARY KEY(id)  
);  
INSERT INTO sales_info(product, quantity, fiscalYear)  
VALUES  
    ('2003 Maruti Suzuki',110, 2024),  
    ('2015 Avenger', 120,2024),  
    ('2018 Honda Shine', 150,2024),  
    ('2014 Apache', 150,2024);  


Delimiter //

CREATE Trigger before_update_salesInfo
BEFORE UPDATE 
ON sales_info 
FOR EACH ROW
BEGIN
    DECLARE error_message VARCHAR(200);
    SET error_message=('The new quantity cannot be greater than 2 times the current');
    IF new.quantity>old.quantity*2 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT=error_message;
    END IF;
END
//

UPDATE sales_info set quantity=125 where id=2;
UPDATE sales_info set quantity=625 where id=2;



CREATE TABLE students(    
    id int NOT NULL AUTO_INCREMENT,    
    name varchar(45) NOT NULL,    
    class int NOT NULL,    
    email_id varchar(65) NOT NULL,    
    PRIMARY KEY (id)    
);  

INSERT INTO students (name, class, email_id)     
VALUES ('Stephen', 6, 'stephen@javatpoint.com'),   
('Bob', 7, 'bob@javatpoint.com'),   
('Steven', 8, 'steven@javatpoint.com'),   
('Alexandar', 7, 'alexandar@javatpoint.com');  


Create Table student_log(
    user varchar(45) Not NULL,
    description varchar(65) NOt null
);

Delimiter //
CREATE Trigger after_update_studentsINFO
AFTER UPDATE
ON students 
FOR EACH ROW
BEGIN
   Insert into student_log values (user(),CONCAT('UPDATE Student record : ',OLD.name,' Previous Class : ',OLD.class,'PRESENT CLASS : ',NEW.class));
End 
//

UPDATE students set class =class+1


CREATE TABLE salaries (  
    emp_num INT PRIMARY KEY,  
    valid_from DATE NOT NULL,  
    amount DEC(8 , 2 ) NOT NULL DEFAULT 0  
);  

INSERT INTO salaries (emp_num, valid_from, amount)  
VALUES ( 101,'2024-02-10',45000),
( 102,'2024-02-10',45000),
( 103,'2024-02-10',55000),
( 104,'2024-02-10',65000),
( 105,'2024-02-10',75000);
     


CREATE TABLE salary_archives (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    emp_num INT,  
    valid_from DATE NOT NULL,  
    amount DEC(18 , 2 ) NOT NULL DEFAULT 0,  
    deleted_time TIMESTAMP DEFAULT NOW()  
); 

Delimiter //
CREATE Trigger before_delete_salary
BEFORE Delete
ON salaries for each ROW
BEGIN
 Insert into salary_archives(emp_num,valid_from,amount) values (old.emp_num,old.valid_from,old.amount);
END
//

Delete from salaries where emp_num=102;
Delete from salaries where emp_num=104;

truncate table salaries;

INSERT INTO salaries (emp_num, valid_from, amount)  
VALUES  
    (102, '2020-01-10', 45000),  
    (103, '2020-01-10', 65000),  
    (105, '2020-01-10', 55000),  
    (107, '2020-01-10', 70000),  
    (109, '2020-01-10', 40000);  


CREATE TABLE total_salary_budget(  
    total_budget DECIMAL(10,2) NOT NULL  
);  

INSERT INTO total_salary_budget (total_budget)  
SELECT SUM(amount) FROM salaries;  


Delimiter //
Create Trigger after_delete_salaries
AFTER Delete
on salaries for each ROW
BEGIN
Update total_salary_budget Set total_budget =total_budget-old.amount;
END
//

Delete from salaries where emp_num=107;


-- Stored Procedures
Delimiter &&
Create Procedure get_merit_students()
BEGIN
    Select * from student_info where marks>60;
    Select count(stud_code) As total_students from student_info;
END &&
Delimiter ;

call get_merit_students();


-- IN 

Delimiter &&
Create Procedure get_student(IN var1 INT)
BEGIN
 Select * from student_info LIMIT var1;
 Select Count(stud_code) as total_students from student_info;
END &&
Delimiter ;

call get_student(4);

-- OUT

Delimiter &&
Create Procedure display_max_mark(OUT highmarks INT)
BEGIN
  Select Max(marks) into highmarks from student_info;
End &&
Delimiter;


call display_max_mark(@M)
select @m;


DELIMITER &&  
CREATE PROCEDURE display_marks (INOUT var1 INT)  
BEGIN  
    SELECT marks INTO var1 FROM student_info WHERE stud_id = var1;   
END &&  
DELIMITER ; 


SET @M = '2';  
CALL display_marks(@M);  
SELECT @M;  

SHOW PROCEDURE STATUS WHERE db = 'mystudentdb';  



SELECT COUNT(stud_code), stud_name
FROM student_info
GROUP BY stud_name
HAVING COUNT(stud_code) > 100; 