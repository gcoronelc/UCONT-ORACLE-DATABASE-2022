-- GRUPO BY

-- Cantidad de empleados por departamento

SELECT 
    department_id,
    count(1) cant_empleados
FROM hr.employees
WHERE department_id IS NOT NULL
GROUP BY department_id;

SELECT 
    department_id,
    count(1) cant_empleados,
    sum(salary) planilla
FROM hr.employees
WHERE department_id IS NOT NULL
GROUP BY department_id;


SELECT 
    department_id,
    count(1) cant_empleados
FROM hr.employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING count(1) > 10;


