#Inserts into the table EMPLOYEE.
INSERT INTO employee 
VALUES (9996969690, '60000', 'Nabinta', 'Niraula');

#Updates information in the table EMPLOYEE about the employee whose SSN is 9996969690. 
UPDATE employee
SET lname = 'Nabinta'
WHERE SSN = 9996969690;

#Deletes from the table EMPLOYEE whose SSN is 9996969690.
DELETE FROM employee
WHERE SSN = 9996969690;


