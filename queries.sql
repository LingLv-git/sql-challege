
-- 1.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
 from employees e
 left join salaries s on s.emp_no = e.emp_no;

-- 2.
select first_name, last_name, hire_date 
 from employees
 where EXTRACT(YEAR FROM hire_date) = 1986;

-- 3.
select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
 from departments d
 left join dept_manager mgr on d.dept_no = mgr.dept_no
 left join  employees e on mgr.emp_no = e.emp_no;

-- 4.
select e.emp_no, e.last_name, e.first_name, d.dept_name
 from departments d
 join dept_emp emp on d.dept_no = emp.dept_no
 join employees e on emp.emp_no = e.emp_no;
 
-- 5.
select first_name, last_name, sex from employees
where first_name = 'Hercules' and last_name like 'B.%';

-- 6.
select e.emp_no, e.last_name, e.first_name, d.dept_name
 from departments d
 join dept_emp emp on d.dept_no = emp.dept_no
 join employees e on emp.emp_no = e.emp_no
 where d.dept_name = 'Sales';
 
-- 7.
select e.emp_no, e.last_name, e.first_name, d.dept_name
 from departments d
 join dept_emp emp on d.dept_no = emp.dept_no
 join employees e on emp.emp_no = e.emp_no
 where d.dept_name in ('Sales', 'Development');
 
 -- 8.
select * from (select last_name, count(last_name) "count" from employees group by last_name) a
order by count desc;

