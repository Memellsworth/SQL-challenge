
--1.list the emoployee number,last name, first name, sex and salary of each employee
select employees.emp_no,
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
from employees
left join salaries
on employees.emp_no = salaries.emp_no
ORDER BY emp_no

-- 2.list the first name , last name and hire date for employees who were hired in 1986
select first_name,last_name,hire_date from employees 
where date_part('year',hire_date)=1986
ORDER BY emp_no

--3.list the manager for each department number for each employee along with that employee's employee number , last name, first name and department name 
select dept_manager.dept_no,
departments.dept_name,
dept_manager.emp_no,
employees.last_name,
employees.first_name
from dept_manager
LEFT JOIN departments 
on departments.dept_no = dept_manager.dept_no
left join employees
on dept_manager.emp_no = employees.emp_no
order by emp_no 

--4.list the department number for each employee along with that employee's employee number, last name, first name and department name
select employees.emp_no,
employees.last_name,
employees.first_name,
dept_emp.dept_no,
departments.dept_name
from employees 
inner join dept_emp 
on employees.emp_no = dept_emp.emp_no
inner join departments 
on departments.dept_no = dept_emp.dept_no
order by emp_no

--5 list first name, last name and sex of each employee whose first name is hercules and whose last name beginds with the letter b
select first_name, last_name, sex from employees 
where first_name = 'Hercules' AND last_name like 'B%'

--6 list each employee in the Sales department, including their employee number,last name and first name 
select employees.emp_no, employees.last_name, employees.first_name,dept_emp.dept_no, departments.dept_name
from employees 
left join dept_emp
on employees.emp_no = dept_emp.emp_no 
inner join departments 
on departments.dept_no = dept_emp.dept_no 
where departments.dept_name = 'Sales'
order by emp_no

--7 list  each employee in the Sales and Development departments, including their employee number,last name, first name and department name
select employees.emp_no,employees.last_name, employees.first_name, departments.dept_name
from employees
left join dept_emp
on employees.emp_no = dept_emp.emp_no 
inner join departments 
on dept_emp.dept_no = departments.dept_no
where departments.dept_name in ('Sales','Development')
order by emp_no

-- 8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name )
select last_name, count (*) as name_count
from employees
group by last_name
order by name_count desc