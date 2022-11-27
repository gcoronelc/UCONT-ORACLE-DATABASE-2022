/*

OPERADOR ALL

 <expr> > ALL ( <lista> )
 
 <expr> > ALL ( <subconsulta> )

*/

select * 
from empleado 
where sueldo > ALL (8000,3000,6000);

select * 
from recursos.empleado 
where sueldo != ALL (15000,7000,75000,25000);

select * 
from recursos.empleado 
where sueldo = ALL (15000,7000,75000,25000);

SELECT employee_id, salary 
FROM hr.employees 
WHERE salary > ALL (9500, 10500, 11500)
order by 2;

SELECT employee_id, salary 
FROM hr.employees 
WHERE salary>9500 AND salary>10500 AND salary>11500
order by 2;

SELECT e1.first_name, e1.salary 
FROM hr.employees e1 
WHERE e1.salary > ALL (SELECT distinct e2.salary 
							FROM hr.employees e2 
							WHERE e2.department_id = 20)
ORDER BY 2;


SELECT e1.first_name, e1.salary 
FROM hr.employees e1 
WHERE NOT EXISTS (SELECT 1 FROM hr.employees e2 
					WHERE e2.department_id = 20 AND e1.salary <= e2.salary )
ORDER BY 2;



SELECT salary FROM HR.employees e2 WHERE e2.department_id = 120;

SELECT MAX(salary) FROM HR.employees e2 WHERE e2.department_id = 120;


SELECT e1.first_name, e1.salary 
FROM HR.employees e1 
WHERE e1.salary > ALL (SELECT salary 
	FROM HR.employees e2 WHERE e2.department_id = 120);

SELECT 100>NULL FROM DUAL;

SELECT e1.first_name, e1.salary 
FROM HR.employees e1 
WHERE e1.salary > ALL (SELECT MAX(salary) 
	FROM HR.employees e2 WHERE e2.department_id = 120);




