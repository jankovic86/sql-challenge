-- Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
RIGHT JOIN salaries s ON
e.emp_no=s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- I have added the title as well to confirm that they were managers.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, t.title
FROM departments d
JOIN dept_managers m ON
d.dept_no=m.dept_no
JOIN employees e ON
m.emp_no=e.emp_no
JOIN titles t ON
e.emp_title_id=t.title_id;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments d
JOIN dept_empl de ON
d.dept_no=de.dept_no
JOIN employees e ON
de.emp_no=e.emp_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments d
JOIN dept_empl de ON
d.dept_no=de.dept_no
JOIN employees e ON
de.emp_no=e.emp_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments d
JOIN dept_empl de ON
d.dept_no=de.dept_no
JOIN employees e ON
de.emp_no=e.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Shared Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Shared Last Name" DESC;