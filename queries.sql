----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- trigger
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER negitive_id
BEFORE INSERT 
ON employee FOR EACH ROW
BEGIN
DECLARE error_message varchar(255);
SET error_message = ("employee id cannot be negative");
IF new.Employee_ID <= 0 
THEN
SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = error_message;
    END IF;
END $$
DELIMITER ;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- procedure
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE procedure maha_emp ()
BEGIN
SELECT city, Number_of_Employees FROM work_location WHERE state = "Maharashtra";
END;
call maha_emp()

CREATE procedure loc_emp ()
BEGIN
SELECT city, state, Number_of_Employees FROM work_location WHERE location_id = 77;
END;
call loc_emp()

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- cursor
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE backup (id int NOT NULL, FIRST_name varchar(20) NOT NULL, PRIMARY KEY (id))
CREATE procedure backup_procedure ()
BEGIN
DECLARE done INTEGER
DEFAULT 0;
DECLARE id INTEGER;
DECLARE First_name varchar(20);
DECLARE curr cursor FOR SELECT * FROM test;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
LOOP FETCH cur INTO idm FIRST_name;
INSERT INTO backup VALUES(id, name);
IF done = 1 THEN LEAVE label;
END IF;
END LOOP;
close curr;
END;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE FUNCTION total_salary(net_salary INTEGER, S_Tax INTEGER, U_Tax INTEGER)
RETURNS INTEGER
DETERMINISTIC
BEGIN
DECLARE net INTEGER;
SET net = (net_salary - (S_Tax + U_Tax));
RETURN net;
END;
$$
DELIMITER ;

SELECT Salary_ID, total_salary(Gross_Salary, State_Tax, Union_Tax) FROM salary;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- aggregate function
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM employee WHERE employee.State = "Maharashtra";
SELECT * FROM employee WHERE employee.City = "Bangalore";
SELECT * FROM emplolyee_attendence WHERE employee_attendence.attendence_ID >= 95;
SELECT * FROM accountdetails WHERE accountdetails.Bank_Name = "ICICI";

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- set operations
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT education.Employee_ID FROM education WHERE education.degree = "B-Tech" UNION FROM accountdetails WHERE 
accountdetails.Bank_Name = "SBI";
SELECT education.Employee_ID FROM education WHERE education.degree = "B-Tech" intersect; SELECT accountdetails.Employee_ID 
WHERE accountdetails.Bank_Name = "SBI";
SELECT education.Employee_ID FROM emplopyee UNION all select test.Emp_ID FROM test;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- join operations
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM project as p JOIN department_project as d on p.Employee_ID = d.Employee_ID;
SELECT * FROM employee_leave as el INNER JOIN employee_attendence as ea on el.Employee_ID = ea.Employee_ID;
SELECT * FROM accountdetails as ad LEFT OUTER JOIN  salary as s on ad.account_ID = s.account_ID;
SELECT * FROM emplopyee as e RIGHT OUTER JOIN education as ed on e.Employee_ID = ed.Employee_ID;