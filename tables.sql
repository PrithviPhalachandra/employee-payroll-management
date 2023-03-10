--CREATE TABLESs

--Employee
CREATE TABLE Employee(Employee_ID INT(6), First_Name VARCHAR(25), Last_Name VARCHAR(25), Hire_Date VARCHAR(20), City VARCHAR(25),
State VARCHAR(25), CONSTRAINT EMPLOYEE_PK PRIMARY KEY (Employee_ID));

-- Department
CREATE TABLE Department(Department_ID INT, Department_Name VARCHAR(30), CONSTRAINT DEPARTMENT_PK PRIMARY KEY (Department_ID));

--Salary
CREATE TABLE Salary(Salary_ID INT, Gross_Salary INT, Hourly_Pay INT, State_Tax INT, Union_Tax INT,
Account_ID INT, CONSTRAINT SALARY_PK PRIMARY KEY (Salary_ID));

--Department Project
CREATE TABLE Department_Project(Department_ID INT, Project_ID INT, CONSTRAINT DEPTPROJECT_PK PRIMARY KEY (Department_ID,Project_ID),
FOREIGN KEY (Department_ID));

--Project
CREATE TABLE Project(Project_ID INT, Project_Name VARCHAR(50), Project_Description VARCHAR(50), CONSTRAINT Project_PK 
PRIMARY KEY (Project_ID));

--Account Details
CREATE TABLE AccountDetails(Account_ID INT, Bank_Name VARCHAR(50), Account_Number VARCHAR(50), Employee_ID INT,
CONSTRAINT Account_PK PRIMARY KEY (Account_ID));

--Education
CREATE TABLE Education(Education_ID INT, Employee_ID INT, Degree VARCHAR(30), Graduation_Year INT(4),
CONSTRAINT Location_PK PRIMARY KEY (Education_ID));

--Leave
CREATE TABLE employee_leave(Leave_ID INT, Employee_ID INT, Leave_date DATE, CONSTRAINT Leave_PK PRIMARY KEY (Leave_ID));

--Employee Attendance
CREATE TABLE Employee_Attendance(Employee_ID INT, Attendance_ID INT, CONSTRAINT Department_Project_PK PRIMARY KEY 
(Employee_ID,Attendance_ID));

--Attendance
CREATE TABLE Attendance(Attendance_ID INT, Hours_Worked INT, CONSTRAINT Attendance_PK PRIMARY KEY (Attendance_ID));

--Work Location
CREATE TABLE Work_Location(Location_ID INT, Location VARCHAR(25), Number_Of_Employees INT, City VARCHAR(25), State VARCHAR(25),
CONSTRAINT Loc_PK PRIMARY KEY (Location_ID));