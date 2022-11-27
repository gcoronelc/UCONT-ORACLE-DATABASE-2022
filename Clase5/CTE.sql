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
	FROM hr.employees 
), 
CTE2 AS ( 
	SELECT department_id, department_name 
	FROM hr.departments 
) 
SELECT 
	CTE1.employee_id, CTE1.first_name, CTE2.department_name 
FROM CTE1 JOIN CTE2 
ON CTE1.department_id = CTE2.department_id;


-- EJERCICIO

WITH
CTE1 AS (
	SELECT 
		IDDEPARTAMENTO, 
		COUNT(1) EMPLEADOS,
		SUM(SUELDO) IMPORTE,
		SUM(NVL(COMISION,0)) COMISION
	FROM RECURSOS.empleado
	GROUP BY IDDEPARTAMENTO
)
SELECT 
	D.NOMBRE DEPARTAMENTO,
	CTE1.EMPLEADOS,
	CTE1.IMPORTE,
	CTE1.COMISION,
	(CTE1.IMPORTE + CTE1.COMISION) TOTAL
FROM RECURSOS.departamento D 
JOIN CTE1 ON D.IDDEPARTAMENTO = CTE1.IDDEPARTAMENTO;




