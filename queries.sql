
-- List the following details of each employee: employee number, last name, first name, gender, and salary.

select e.emp_no, e.first_name, e.last_name, e.gender, s.salary
from employees as e
join salaries as s
on e.emp_no = s.emp_no;

-- List employees who were hired in 1986.

    --First unnecessary attempt
select e.first_name, e.last_name, d.from_date
from employees as e
join dept_emp as d
on e.emp_no =  d.emp_no
where from_date between '1986-01-01' and '1986-12-31';

     --Second attempt
select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

Select d.dept_no, d.dept_name, m.emp_no, e.last_name as "Manager Last Name", e.first_name as "Manager First Name",de.from_date, de.to_date
from departments as d
join dept_manager as m
on d.dept_no = m.dept_no
join employees as e
on m.emp_no = e.emp_no
join dept_emp as de
on m.emp_no = de.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de
on e.emp_no = de.emp_no
join departments as d 
on de.dept_no = d.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
select * 
from employees
where first_name = 'Hercules' and last_name like'B%';

--list all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees as e
join dept_emp as de
on e.emp_no = de.emp_no
join departments as d
on de.dept_no = d.dept_no
where d.dept_name= 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees as e
join dept_emp as de
on e.emp_no = de.emp_no
join departments as d
on de.dept_no = d.dept_no
where d.dept_name= 'Sales' or d.dept_name= 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*) 
from employees
group by last_name
order by count desc;