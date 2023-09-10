#SQL DML commands: At least five (5) examples of retrieval queries

#Find all employees whose last name is 'Smith'.
SELECT * 
FROM EMPLOYEE 
WHERE lname = 'Smith';

#Find the names of all the managers.
SELECT e.fname, e.lname
FROM MANAGER m, EMPLOYEE e
WHERE m.mgr_ssn=e.ssn; 

#Retrieve all employees whose salary is greater than $79000.
SELECT *
FROM EMPLOYEE
WHERE Salary > 79000;

#At least two (2) must be complex (nested, aggregate, group by, having, etc.) 

/*  For each department retrieve dno and retrieve dname and the number of employee
 who work for that department */
SELECT D.Dno, D.D_name, COUNT(*)
FROM DEPARTMENT D, WORKS_FOR W
WHERE D.Dno = W.D_Num
GROUP BY D.Dno, D.D_name;

SELECT * FROM department;


/* Make a list of all the employee fname managed by the manager whose salary is
 greater than 70000 , either works for "Loans" or "marketing"*/ 
# Selects the first name of employees managed by the manager whose salaries are over 70,000, either works for "Loans" and "Marketing"
SELECT e.Fname
FROM EMPLOYEE e
WHERE e.Ssn IN (
    SELECT w.Ssn
    FROM works_for w
    INNER JOIN department d ON w.D_num = d.Dno
    INNER JOIN employee m ON w.Ssn = m.Ssn
    WHERE m.Salary > 70000
    AND d.D_Name IN ('LOAN', 'MARKETING')
);










