-- checking unique value of primary key(employee_id)
SELECT emp_no,count(*)
FROM employee
group by emp_no
having count(*) > 1;


select * from employee;
SELECT * FROM dep_employee;
SELECT * FROM dep_manager;
select * from salary;
SELECT * FROM title;
SELECT * FROM department;

-- 1. employee details
select e.emp_no, e.last_name,e.first_name,e.sex, s.salary
from employee as e
inner join salary as s
on s.emp_no=e.emp_no;

-- 2. employee hired in 1986, also chcked for duplicates.
select first_name, last_name, hire_date
from employee
where hire_date >='1986-01-01' and hire_date<'1987-01-01';
-- group by emp_no
-- having count(*)>1;

-- 3. manager info
select dm.man_dept_no, d.dept_name, dm.man_emp_no, e.last_name,e.first_name
from dep_manager as dm
inner join employee as e
on dm.man_emp_no = e.emp_no
inner join department as d
on dm.man_dept_no = d.dept_no;

-- 4. employee department info
select de.emp_no, d.dept_name, e.last_name, e.first_name
from dep_employee as de
inner join department as d
on de.emp_dept_no = d.dept_no
inner join employee as e
on de.emp_no = e.emp_no;

--5. filter by name Hercules
select first_name, last_name, sex
from employee
where first_name ='Hercules' 
and last_name like 'B%';


-- 6. sales dept employees
select e.emp_no,e.last_name, e.first_name, d.dept_name
from dep_employee as de
inner join department as d
on de.emp_dept_no = d.dept_no
inner join employee as e
on de.emp_no = e.emp_no
where dept_name = 'Sales';

-- 7. sales and devops dpt employees
select e.emp_no,e.last_name, e.first_name, d.dept_name
from dep_employee as de
inner join department as d
on de.emp_dept_no = d.dept_no
inner join employee as e
on de.emp_no = e.emp_no
where dept_name = 'Sales' 
or dept_name='Development';

-- 8.frequency of staff name
select last_name, count(*) as frequency
from employee
group by last_name
order by frequency desc;

-- FOR BONUS QUESTION
select current_database();
select user;
SELECT *
FROM pg_settings
WHERE name = 'port';


