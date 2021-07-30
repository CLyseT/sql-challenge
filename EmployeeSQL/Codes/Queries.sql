-- List the following details of each employee: employee number, last name, first name, sex, and salary
SELECT total_employees.emp_no, total_employees.last_name, total_employees.first_name, total_employees.sex, salaries.salary
FROM salaries
INNER JOIN total_employees ON
total_employees.emp_no=salaries.emp_no

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM total_employees 
WHERE (hire_date BETWEEN '1986-01-01' AND '1986-12-31');

-- List the manager of each department with the following information: department number, department name, the manager's employee number
-- , last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_managers.emp_no, total_employees.last_name, total_employees.first_name
FROM (dept_managers INNER JOIN departments ON departments.dept_no = dept_managers.dept_no)
INNER JOIN total_employees ON total_employees.emp_no = dept_managers.emp_no

-- List the department of each employee with the following information: employee number, last name, first name, 
-- and department name.
SELECT total_employees.emp_no, total_employees.last_name, total_employees.first_name, departments.dept_name
FROM (total_employees INNER JOIN dept_employees ON total_employees.emp_no = dept_employees.emp_no)
INNER JOIN departments ON departments.dept_no = dept_employees.dept_no

-- List first name, last name, and sex for employees whose first name is "Hercules" 
-- and last names begin with "B."
SELECT total_employees.first_name, total_employees.last_name, total_employees.sex
FROM total_employees 
WHERE first_name = 'Hercules' AND LEFT(last_name,1) = 'B'

-- List all employees in the Sales department, including their employee number, last name, 
-- first name, and department name.
SELECT departments.dept_name, total_employees.emp_no, total_employees.last_name, total_employees.first_name 
FROM (total_employees INNER JOIN dept_employees ON total_employees.emp_no = dept_employees.emp_no)
INNER JOIN departments ON departments.dept_no = dept_employees.dept_no
WHERE dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
SELECT departments.dept_name, total_employees.emp_no, total_employees.last_name, total_employees.first_name 
FROM (total_employees INNER JOIN dept_employees ON total_employees.emp_no = dept_employees.emp_no)
INNER JOIN departments ON departments.dept_no = dept_employees.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "name count"
FROM total_employees
GROUP BY last_name
ORDER BY "name count" DESC;

-- OR 
-- created the next query to check if output from the last query is correct, received the same data output 
SELECT total_employees.last_name, COUNT (total_employees.last_name) AS "Name Count"
FROM total_employees
JOIN salaries ON salaries.emp_no = total_employees.emp_no
GROUP BY last_name
ORDER BY "Name Count" DESC;
