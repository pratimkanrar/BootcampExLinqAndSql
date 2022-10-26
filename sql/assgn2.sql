SELECT project_name FROM Project WHERE 2<=(SELECT COUNT(*) FROM Works_on WHERE Project.project_no=Works_on.project_no AND Job='Clerk');

SELECT emp_fna, emp_lna FROM Employee WHERE emp IN (SELECT emp_no FROM Works_on JOIN Project ON Works_on.project_no=Project.project_no AND Job='Manager' AND project_name='Mercury');

SELECT emp_fna, emp_lna FROM Employee WHERE emp IN (SELECT A.emp_no FROM Works_on A JOIN Works_on B ON A.emp_no!=B.emp_no AND A.enter_date=B.enter_date);

SELECT A.emp FROM Employee A JOIN Employee B ON A.emp!=B.emp AND A.dept=B.dept;

SELECT emp FROM Employee JOIN Department ON Employee.dept=Department.dept WHERE Dept='Marketing';

SELECT emp FROM Employee WHERE dept=(SELECT dept FROM Department WHERE Dept='Marketing');




INSERT INTO Employee (emp, emp_fna, emp_lna) VALUES (1111, 'Julia', 'Long');

SELECT * INTO emp_d1_d2 FROM Employee WHERE dept=d1 OR dept=d2;

UPDATE Works_on SET Job='Clerk' WHERE project_no=p1 AND Job='Manager';

UPDATE Project SET Budget=NULL;

UPDATE Project SET Budget=Budget*110/100 WHERE project_no=(SELECT project_no FROM Works_on WHERE Job='Manager' AND emp_no=10102);

UPDATE Works_on SET enter_date='12.12.1998' WHERE project_no=p1 AND emp_no IN (SELECT emp FROM Employee WHERE dept='Sales');

CREATE PROCEDURE addEmployee 
       @id INT,
       @fname VARCHAR(20),
       @lname VARCHAR(20),
       @dep VARCHAR(20)
AS 
BEGIN 
    INSERT INTO Employee (emp, emp_fna, emp_lna, dept) VALUES (@id, @fname, @lname, @dep)
END 
GO



