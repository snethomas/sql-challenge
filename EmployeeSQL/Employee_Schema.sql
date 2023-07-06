-- DROP TABLE Departments;
CREATE TABLE Departments (
    dept_no VARCHAR(10) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- DROP TABLE Salaries;
CREATE TABLE Salaries (
    emp_no INT NOT NULL PRIMARY KEY,
    salary INT NOT NULL
);

-- DROP TABLE Titles;
CREATE TABLE Titles (
    title_id VARCHAR(10) NOT NULL PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

-- DROP TABLE Employees;
CREATE TABLE Employees (
    emp_no INT  NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(10)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(50)   NOT NULL,
    last_name VARCHAR(50)   NOT NULL,
    sex VARCHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES Salaries(emp_no),
    FOREIGN KEY(emp_title_id) REFERENCES Titles(title_id)
);

-- DROP TABLE Dept_Emp;
CREATE TABLE Dept_Emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(10)   NOT NULL,
    PRIMARY KEY(emp_no,dept_no),
    FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY(dept_no) REFERENCES Departments(dept_no)
);

-- DROP TABLE Department_Manager;
CREATE TABLE Department_Manager (
    dept_no VARCHAR(10)  NOT NULL,
    emp_no INT   NOT NULL,
    PRIMARY KEY(dept_no,emp_no),
    FOREIGN KEY("dept_no") REFERENCES Departments(dept_no)
);

--Quality Check imports:

SELECT COUNT(*) FROM Departments;
SELECT COUNT(*) FROM Salaries;
SELECT COUNT(*) FROM Titles;
SELECT COUNT(*) FROM Employees;
SELECT COUNT(*) FROM Dept_Emp;
SELECT COUNT(*) FROM Department_Manager;