/*
OPERADOR ANY

 <expr> > ANY ( <lista> )
 
 <expr> > ANY ( <subconsulta> )
 
*/

SELECT employee_id, salary 
FROM HR.employees 
WHERE salary > ANY (13000, 14000, 15000);


SELECT employee_id, salary 
FROM HR.employees 
WHERE salary > 13000 OR salary > 14000 OR salary > 15000;

SELECT e1.first_name, e1.salary 
FROM HR.employees e1 
WHERE e1.salary > ANY (SELECT distinct e2.salary 
	FROM HR.employees e2 WHERE e2.department_id = 90);

SELECT e1.first_name, e1.salary 
FROM HR.employees e1 
WHERE EXISTS (SELECT 1 FROM HR.employees e2 
				WHERE e2.department_id = 90 AND e1.salary > e2.salary );
				
/*
OPERADOR IN (OPERADOR DE PERTENENCIA)

<expr> [NOT] IN (<lista de valores>)

<expr> [NOT] IN (<subconsulta>)

*/
				
SELECT e1.first_name, e1.salary 
FROM HR.employees e1 
WHERE e1.salary >= ANY (SELECT distinct e2.salary 
	FROM HR.employees e2 WHERE e2.department_id = 90);
	
SELECT e1.first_name, e1.salary 
FROM HR.employees e1 
WHERE e1.salary IN (SELECT distinct e2.salary 
	FROM HR.employees e2 WHERE e2.department_id = 90);	



SELECT salary FROM HR.employees e2 WHERE e2.department_id = 120;


SELECT e1.first_name, e1.salary 
FROM HR.employees e1 
WHERE e1.salary > ANY (SELECT salary 
	FROM HR.employees e2 WHERE e2.department_id = 120);




