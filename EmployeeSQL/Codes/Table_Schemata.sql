CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR,
	PRIMARY KEY (title_id)
)
SELECT * FROM titles;

CREATE TABLE departments(
	dept_no VARCHAR,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
)
SELECT * FROM departments;

CREATE TABLE total_employees(
    emp_no DEC,
	emp_title_id VARCHAR,
	birth_data DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
)
SELECT * FROM total_employees;

CREATE TABLE dept_employees(
	emp_no DEC,
	dept_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES total_employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
)
SELECT * FROM dept_employees;  

CREATE TABLE dept_managers(
    dept_no VARCHAR,
	emp_no DEC,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES total_employees(emp_no)
)
SELECT * FROM dept_managers;

CREATE TABLE salaries(
    emp_no DEC,
	salary DEC,
	FOREIGN KEY (emp_no) REFERENCES total_employees(emp_no)
)
SELECT * FROM salaries;