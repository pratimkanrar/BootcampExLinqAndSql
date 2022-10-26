1. CREATE TABLE Orders (
    OrderId INTEGER NOT NULL,
    customerId CHAR(5) NOT NULL,
    Orderdate DATETIME NULL,
    Shippeddate DATETIME NULL,
    Freightmoney INTEGER NULL,
    Shipname VARCHAR(40) NULL,
    Shipaddres VARCHAR(60) NULL,
    Quantity INTEGER NULL
    
    
);

CREATE TABLE Customers (
 Customerid CHAR(5) not NULL,
CompanyName VARCHAR(40) not NULL,
contactName CHAR(30) NULL,
Address VARCHAR(60) NULL,
City CHAR(15) NULL,
Phone CHAR(24) NULL,
Fax CHAR(24) NULL
)

2. ALTER TABLE Orders
ADD shipregion INTEGER NULL;

3. ALTER TABLE Orders ALTER COLUMN shipregion VARCHAR(8);

4. ALTER TABLE Orders 
DROP COLUMN shipregion;

5. INSERT INTO Orders
VALUES  (10, 'ord01', getdate(), getdate(), 100.0, 'Windstar', 'Ocean' ,1);

6. ALTER TABLE Orders ADD DEFAULT getdate() FOR Orderdate;

7. sp_rename 'Customers.City', 'Town', 'COLUMN';

8. CREATE TABLE  Department(
    Dept VARCHAR(2) NOT NULL,
	Dept2 VARCHAR(4) NOT NULL,
    location VARCHAR(10) NOT NULL
    
    
);

INSERT INTO 
	Department 
VALUES
	('d1','Rese','Dallas'),
	('d2','Acco','Seattle'),
	('d3', 'Mar','Dallas');

CREATE TABLE  Employee(
    emp INTEGER NOT NULL,
	emp_fname VARCHAR(20) NOT NULL,
    emp_lna VARCHAR(20) NOT NULL,
	dept VARCHAR(2) NOT NULL
    
    
);

INSERT INTO Employee
VALUES
	('25348','Matthew','Smith','d3'),
	('18316','John','Barrimore','d2'),
	('29346','James','James','d2');


CREATE TABLE  Project(
    project_no VARCHAR(2) NOT NULL,
	project_name VARCHAR(20) NOT NULL,
    Budget INTEGER NOT NULL
    
    
);

INSERT INTO 
	Project 
VALUES
	('p1','Apollo','120000'),
	('p2','Gemini','95000'),
	('p3', 'Mercury','185600');



CREATE TABLE   Works_on(
    emp_no INTEGER NOT NULL,
	project_no VARCHAR(2) NOT NULL,
    Job VARCHAR(20) NOT NULL,
	enter_date date NOT NULL
    
    
);

INSERT INTO Works_on
VALUES
	('10102','p1','Analyst','1997/10/1'),
	('10102','p3','manager','1999/1/1'),
	('25348','p2','Clerk','1998/2/15'),
	('18316','p2','NULL','1998/6/1'),
	('29346','p2','NULL','1997/12/15'),
	('2581','p3','Analyst','1998/2/15'),
	('9031','p1','Manager','198/4/15'),
	('28559','p1','NULL','198/8/1'),
	('28559','p2','Clerk','1992/2/1'),
	('9031','p3','Clerk','1997/11/15'),
	('29346','p1','Clerk','1998/1/4');

9. SELECT * FROM Works_on;

10. SELECT emp_no FROM works_on  WHERE Job='Clerk';

11. SELECT emp_no FROM Works_on WHERE project_no='p2' AND emp_no < 10000;

12. SELECT emp_no FROM Works_on WHERE year( enter_date) != 1998;

13. SELECT emp_no FROM Works_on WHERE (Job='Manager' or Job = 'Analyst') and project_no='p1';

14. SELECT enter_date FROM Works_on WHERE project_no='p2' and Job is NULL;

15. SELECT emp,emp_lna FROM Employee WHERE emp_fname LIKE '%tt%';

16. SELECT * FROM Employee WHERE emp_lna LIKE '_o%es' or emp_lna LIKE '_a%es';

17. SELECT Employee.emp
FROM Department
INNER JOIN Employee ON Department.Dept = Employee.dept 
WHERE Department.location ='Dallas';

18. SELECT Employee.emp_fname ,Employee.emp_lna
FROM Works_on
INNER JOIN Employee ON Works_on.emp_no = Employee.emp
WHERE Works_on.enter_date = '1998-1-4'; 

19. SELECT Dept FROM Department 
GROUP BY location;

20. SELECT Max(emp) FROM Employee;

21. SELECT Job  FROM  Works_on GROUP BY Job 
HAVING Count(Job)> 2;

22. SELECT Employee.emp
FROM Works_on
INNER JOIN Employee ON Works_on.emp_no = Employee.emp
WHERE  Works_on.job='Clerk' OR Employee.dept='d3';