/*
	CTE == Divide y venceras
*/

WITH 
CTE AS ( 
	SELECT employee_id, first_name FROM HR.employees WHERE department_id = 60 
) 
select * from CTE;



WITH 
CTE1 AS ( 
	SELECT employee_id, first_name, department_id 
	FROM employees 
), 
CTE2 AS ( 
	SELECT department_id, department_name 
	FROM departments 
) 
SELECT 
	CTE1.employee_id, CTE1.first_name, CTE2.department_name 
FROM CTE1 JOIN CTE2 
ON CTE1.department_id = CTE2.department_id;

