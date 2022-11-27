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


/*
THONNY CRISTOFER FERNANDEZ CASA9:15
yo utilice para hacer un datamart de fechas, de manera dinamica

with rws as (  
  select date'2021-01-01' + level - 1 as dt  
  from   dual  
  connect by level <= (  
    date'2022-01-01' - date'2021-01-01'  
  )    
)  
select * from rws;

*/

-- Ejercicio 2
/*

CIUDAD     EMPLEADOS      PORCENTAJE
----------------------------------------------
LIMA           50            22.72
TRUJILLO       40            18.18
AREQUIPA       70
HUANCAYO       60
----------------------------------------------
              220           100.00
*/

/*
THONNY CRISTOFER FERNANDEZ CASA9:46

with emp_ciu as (
select      ubc.idubicacion,
            ubc.ciudad,
            sum(1) as cantidad
from        recursos.empleado emp
            inner join recursos.departamento dpt on emp.iddepartamento = dpt.iddepartamento
            inner join recursos.ubicacion ubc on dpt.idubicacion = ubc.idubicacion 
group by    ubc.idubicacion, ubc.ciudad
)
select  ec.ciudad, 
        ec.cantidad, 
        round(ec.cantidad / sum(cantidad) over (partition by 1) * 100, 2) as porcentaje
from    emp_ciu;
*/

WITH 
CTE1 AS (
	SELECT U.ciudad, COUNT(1) EMPLEADOS
	FROM RECURSOS.empleado E
	JOIN RECURSOS.departamento D ON E.iddepartamento = d.iddepartamento
	JOIN RECURSOS.ubicacion U ON D.idubicacion = U.idubicacion
	GROUP BY U.ciudad
),
CTE2 AS (
	SELECT SUM(EMPLEADOS) TOTAL FROM CTE1
)
SELECT 
	CTE1.CIUDAD, CTE1.EMPLEADOS, CTE2.TOTAL,
	ROUND(CTE1.EMPLEADOS * 100.0 / CTE2.TOTAL,2)  PORCENTAJE	
FROM CTE1 CROSS JOIN CTE2;


/*
THONNY CRISTOFER FERNANDEZ CASA9:59
with emp_ciu as (
select      distinct ubc.ciudad,
            sum(1) over (partition by ubc.ciudad)  as cantidad,
            sum(1) over (partition by 1) as total
from        recursos.empleado emp
            inner join recursos.departamento dpt on emp.iddepartamento = dpt.iddepartamento
            inner join recursos.ubicacion ubc on dpt.idubicacion = ubc.idubicacion 
)
select  ciudad,
        cantidad,
        round(cantidad/total*100,2) as porcentaje
from    emp_ciu ec;
*/


/*
Ejercicio 4

-----------------------------------------------------------
NOMBRE                         IMPORTE       IMPORTE
CURSO         MATRICULADOS     PROYECTADO    RECAUDADO
-----------------------------------------------------------
ORACLE SQL       20            20,000.00     15,000.00
APRENDE ALGO      0            0.00          0.00
-----------------------------------------------------------
*/


WITH 
CTE1 AS (
	SELECT CUR_ID, SUM(MAT_PRECIO) PROYECTADO
	FROM EDUCA.matricula M
	GROUP BY CUR_ID
),
CTE2 AS (
	SELECT CUR_ID, SUM(PAG_IMPORTE) RECAUDADO
	FROM EDUCA.PAGO P
	GROUP BY CUR_ID
)
SELECT 
	C.CUR_ID, C.CUR_NOMBRE, C.CUR_MATRICULADOS,
	NVL(CTE1.PROYECTADO,0) PROYECTADO,
	NVL(CTE2.RECAUDADO,0) RECAUDADO
FROM EDUCA.CURSO C 
LEFT JOIN CTE1 ON C.CUR_ID = CTE1.CUR_ID
LEFT JOIN CTE2 ON C.CUR_ID = CTE2.CUR_ID;

