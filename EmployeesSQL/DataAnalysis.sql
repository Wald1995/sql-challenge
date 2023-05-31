--1. List the employee number, last name, first name, sex, and salary of each employee.
select s.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
join salaries as s on s.emp_no = e.emp_no
order by s.emp_no;


-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
select emp_no, last_name, first_name, hire_date 
from employees 
where extract(year from hire_date) = 1986;


-- 3. List the manager of each department along with their department number, department name,
--    employee number, last name and first name
select distinct on (dept_manager.dept_no) dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager 
join departments on dept_manager.dept_no= departments.dept_no
join employees on dept_manager.emp_no = employees.emp_no
order by dept_manager.dept_no, employees.first_name DESC;


-- 4. List the department number for each employee along with that employee’s employee number,
-- 	  last name, first name, and department name.
select distinct on (e.emp_no) e.emp_no, e.last_name, e.first_name,d.dept_name
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
order by e.emp_no  DESC;


-- 5. List first name, last name, and sex of each employees whose first name is "Hercules" 
--    and last names begin with "B.
select e.first_name, e.last_name, e.sex
from employees as e
where (e.first_name = 'Hercules') and (lower(e.last_name) like 'b%')
order by e.last_name;


-- 6.List each employee in the Sales department, including their employee number, 
--   last name, and first name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
join employees as e on de.emp_no =e.emp_no
join departments as d on de.dept_no = d.dept_no
where dept_name in ('Sales');


-- 7. List each employee in the Sales and Development departments, 
--    including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
join employees as e on de.emp_no =e.emp_no
join departments as d on de.dept_no = d.dept_no
where dept_name in ('Sales','Development');


-- 8. List the frequency count of employee last names, 
select last_name,count(*) as Frequency 
from employees
group by last_name
order by Frequency desc;
