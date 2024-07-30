USE employees;
SELECT E.emp_no, E.first_name, E.last_name, T.title
FROM employees E 
INNER JOIN titles T
ON E.emp_no = T.emp_no
ORDER BY E.emp_no;

USE employees;
select  E.*, T.title, S.salary
from employees E
inner join titles T
on E.emp_no = T.emp_no
inner join salaries S
on T.emp_no = S.emp_no
ORDER BY E.emp_no;