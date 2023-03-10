import mysql.connector
mydb = mysql.connector.connect(host="localhost", user="root", password="", database="employee_payroll_management")
c = mydb.cursor()


#def create_table():
#   c.execute('CREATE TABLE IF NOT EXISTS employee("Employee_ID NUM, First_Name VARCHAR(50), Last_Name VARCHAR(50), Hire_Date VARCHAR(50), City VARCHAR(20), State VARCHAR(20)" ')


def add_data(Employee_ID, First_Name, Last_Name, Hire_Date, City, State):
    c.execute('INSERT INTO employee(Employee_ID, First_Name, Last_Name, Hire_Date, City, State)' 'VALUES (%s,%s,%s,%s,%s,%s)',
    (Employee_ID, First_Name, Last_Name, Hire_Date, City, State))
    mydb.commit()


def view_all_data():
    c.execute('SELECT * FROM employee')
    data = c.fetchall()
    mydb.commit()
    return data

def view_only_employee_names():
    c.execute('SELECT First_Name, Last_Name FROM employee')
    data = c.fetchall()
    mydb.commit()
    return data

def get_employee(First_Name):
    c.execute('SELECT * FROM  employee WHERE First_Name="{}"'.format(First_Name))
    data = c.fetchall()
    mydb.commit()
    return data

def edit_employee_data(new_employee_ID, new_employee_first_name, new_employee_last_name, new_employee_hire_date, new_employee_city, 
                        new_employee_state):
    c.execute("UPDATE employee SET Employee_ID = %s, First_Name = %s, Last_Name = %s, Hire_Date = %s, City = %s, State = %s where employee.Employee_ID = %s",
               (new_employee_ID, new_employee_first_name, new_employee_last_name, new_employee_hire_date, new_employee_city, 
               new_employee_state, new_employee_ID))
    mydb.commit()
    data = c.fetchall()
    return data

def delete_data(employee_ID):
    c.execute('DELETE FROM employee WHERE Employee_ID = "{}"'.format(employee_ID))
    mydb.commit()