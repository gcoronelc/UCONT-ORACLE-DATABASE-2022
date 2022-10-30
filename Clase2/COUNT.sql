-- FUNCIONES AGREGADAS

-- COUNT

select * from hr.employees;

-- Cantidad de filas

select count(*) from hr.employees;

select count(1) from hr.employees;

select count(100) from hr.employees;

select count('x') from hr.employees;

select count(employee_id) from hr.employees;

select count(first_name) from hr.employees;


-- Cantidad de empleados que no tienen valor nulo en el campo commission_pct

select count(commission_pct) from hr.employees;


-- Cantidad de departamentos que tienen por lo menos 1 empleado

select count(distinct department_id) from hr.employees;














