/* View 1: Creates a view that displays first name, last name, salary, and ssn of employee*/
CREATE VIEW Employee_Info
AS SELECT * 
FROM EMPLOYEE;


/* View 2: Creates a view that displays the first name of the Manager thats salary is more than $80,000 */
CREATE VIEW Manager_Sal
AS SELECT Salary
FROM MANAGER
WHERE Salary > 80000;

/* View 3: Creates a view that displays the employees first name with the last name Johnson and Smith*/
CREATE VIEW employees
AS SELECT Fname, Lname
FROM EMPLOYEE
WHERE Lname = "Johnson" AND "Smith"; 

