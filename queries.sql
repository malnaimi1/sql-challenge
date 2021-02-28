-- Select the employee number, last name, first name, sex, and salary of all employees, ordered by employee number

SELECT 
employees.employees_num,
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
Join salaries on 
employees.employees_num = salaries.employee_number
Order by employees_num


-- Select the first name, last name, and hiring date for all employees hired in 1986 
SELECT 
employees.employees_num,
employees.last_name,
employees.first_name, 
-- employees.hire_date
to_date(hire_date,'MM/DD/YYYY') as hire_date 
FROM employees
WHERE 
to_date(hire_date,'MM/DD/YYYY') between '1986-01-01'::DATE and '1986-12-31'::DATE


-- Select the department number, department name, employee number, last name, and first name of all managers of each department
SELECT 
dept_manager.dept_no , 
departments.departments_name, 
dept_manager.emp_no,
employees.last_name,
employees.first_name
FROM dept_manager
join employees on 
dept_manager.emp_no = employees.employees_num
join departments on 
dept_manager.dept_no = departments.departments_number

-- Select the employee number, last name, first name, and department of each employee, ordered by employee number

SELECT 
employees.employees_num,
employees.Last_name,
employees.first_name,
dept_emp.dept_no,
departments.departments_name
FROM employees
join dept_emp on 
 employees.employees_num = dept_emp.emp_no
join departments on 
dept_emp.dept_no = departments.departments_number
Order by employees.employees_num


-- Select first name, last name, birth date, and sex of all employees whose first name is "Hercules" and last name begins with a "B"
SELECT 
employees.first_name,
employees.employees_num,
employees.Last_name,
employees.birth_date,
employees.sex
FROM employees
where employees.first_name = 'Hercules' and employees.last_name like  'B%'

-- Select employee number, last name, first name, and department name of all employees in the Sales department, ordered by employee number

SELECT 
employees.employees_num,
employees.Last_name,
employees.first_name,
departments.departments_name,
FROM employees
join dept_emp on 
 employees.employees_num = dept_emp.emp_no
join departments on 
dept_emp.dept_no = departments.departments_number
where departments.departments_name like '%Sales%'
Order by employees.employees_num

-- Select employee number, last name, first name, and department name of all employees in the 'Sales' OR the 'Development' department, ordered by employee number
SELECT 
employees.employees_num,
employees.Last_name,
employees.first_name,
departments.departments_name,
dept_emp.dept_no
FROM employees
join dept_emp on 
 employees.employees_num = dept_emp.emp_no
join departments on 
dept_emp.dept_no = departments.departments_number
where departments.departments_name like '%Sales%' or departments.departments_name like '%Development'
Order by employees.employees_num

-- Count the number of employees, grouped by last name
Select 
count(*) AS employees_num
from employees
group by last_name