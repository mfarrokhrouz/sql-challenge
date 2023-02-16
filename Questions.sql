-- Check Data of All Tables
select * from employees
select * from salaries
select * from titles
select * from departments
select * from dept_manager
select * from dept_emp
--Part 1. List the employee number, last name, first name, sex, and salary of each employee. 
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
inner join salaries on
employees.emp_no = salaries.emp_no;

--Part 2. List the first name, last name, and hire date for the employees who were hired in 1986 
select * from employees 
where
	employees.hire_date between '1986/01/01' and '1986/12/31';


-- Part 3. List department manager, department number, department name, employee number, last name, and first name.
select employees.emp_no, employees.last_name, employees.first_name, employees.title_id, departments.dept_name, dept_emp.dept_no 
from employees
inner join dept_emp on
dept_emp.emp_no = employees.emp_no
inner join departments on
departments.dept_no =dept_emp.dept_no
where title_id= 'm0001';

-- Part 4. List department number for each employee along with employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name, dept_emp.dept_no
from employees
inner join dept_emp on
dept_emp.emp_no = employees.emp_no
inner join departments on
departments.dept_no =dept_emp.dept_no; 


--Part 5 . First name, last name, and sex of each employee, first name = 'Hercules', last name begins with B
select employees.last_name, employees.first_name, employees.sex
from employees
where 
employees.first_name = 'Hercules'
and employees.last_name like 'B%';

--Part 6. List each employee in the Sales department, including their employee number, last name, and first name
select employees.emp_no, employees.last_name, employees.first_name
from employees
inner join dept_emp on
dept_emp.emp_no = employees.emp_no
and
dept_emp.dept_no = 'd007';

--Part 7. List employee in the Sales and Development dept., with employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name
from employees
inner join dept_emp on
dept_emp.emp_no = employees.emp_no
where dept_emp.dept_no = 'd005' or dept_emp.dept_no ='d007';

--Part 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, 
count(emp_no) 
from employees
group by last_name
order by count(emp_no) desc;
