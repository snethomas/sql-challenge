-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT Employees.emp_no, last_name, first_name,  sex, salary
FROM Employees
LEFT JOIN Salaries ON Employees.emp_no = Salaries.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM Employees
WHERE EXTRACT('Year' FROM hire_date) = 1986;

-- 3. List the manager of each department along with their 
-- department number, department name, employee number, last name, and first name.

SELECT 
Department_Manager.dept_no,
Departments.dept_name,
Department_Manager.emp_no, 
Employees.last_name,
Employees.first_name
FROM Department_Manager
LEFT JOIN Departments ON 
Department_Manager.dept_no = Departments.dept_no
LEFT JOIN Employees ON
Department_Manager.emp_no = Employees.emp_no;

-- 4. List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name.

SELECT 
Employees.emp_no, 
Employees.last_name,
Employees.first_name,
Dept_Emp.dept_no,
Departments.dept_name
FROM Employees
LEFT JOIN Dept_Emp ON 
Employees.emp_no = Dept_Emp.emp_no
LEFT JOIN Departments ON 
Dept_Emp.dept_no = Departments.dept_no;
				
-- 5. List first name, last name, and sex of each employee 
-- whose first name is Hercules and whose last name begins with the letter B.

SELECT 
first_name,
last_name,
sex
FROM Employees 
WHERE 
LOWER(TRIM(first_name))='hercules' AND
LOWER(TRIM(last_name)) LIKE 'b%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
 
SELECT 
Employees.emp_no, 
Employees.last_name,
Employees.first_name
FROM Employees
WHERE Employees.emp_no IN
		(
		SELECT Dept_Emp.emp_no FROM 
		Dept_Emp 
		WHERE Dept_Emp.dept_no IN
			(
			SELECT Departments.dept_no FROM 
			Departments 
			WHERE LOWER(TRIM(Departments.dept_name))='sales'
			)
		);
 
-- 7. List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT 
Employees.emp_no, 
Employees.last_name,
Employees.first_name,
Departments.dept_name
FROM Employees
LEFT JOIN Dept_Emp ON 
Dept_Emp.emp_no = Employees.emp_no
LEFT JOIN Departments ON 
Dept_Emp.dept_no = Departments.dept_no
WHERE 
LOWER(TRIM(Departments.dept_name)) IN ('sales','development');

-- 8. List the frequency counts, in descending order, 
-- of all the employee last names (that is, how many employees share each last name).

SELECT 
last_name,
count(distinct(emp_no)) as last_name_Frequency
FROM Employees
GROUP BY last_name
ORDER BY last_name_Frequency DESC;

