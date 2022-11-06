/*
Desarrolle una sentencia SELECT para obtener un listado que incluya el 
nombre del curso con sus respectivos nombres de alumnos. 
Esquema: EDUCA.
*/

select c.cur_nombre curso, a.alu_nombre alumno
from educa.matricula m 
join educa.curso c on m.cur_id = c.cur_id
join educa.alumno a on m.alu_id = a.alu_id
order by 1;

/*
Desarrolle una sentencia SELECT que muestre el nombre del alumno 
y la suma de todos sus pagos. 
Esquema: EDUCA.
*/


select a.alu_nombre, sum(p.pag_importe) importe
from educa.pago p
join educa.alumno a on p.alu_id = a.alu_id
group by a.alu_nombre
order by 1;


/*
Desarrolle una sentencia SELECT para obtener un listado de todos los 
departamentos y la cantidad de trabajadores en cada uno de ellos. 
Debe incluir a todos los departamentos incluso aquellos que no tienen empleados. 
Esquema: RECURSOS y/o HR.
*/

select e.idempleado, d.iddepartamento
from recursos.empleado e
right join recursos.departamento d on e.iddepartamento = d.iddepartamento;


select d.nombre departamento, count(e.idempleado) trabajadores
from recursos.empleado e
right join recursos.departamento d on e.iddepartamento = d.iddepartamento
group by d.nombre;


-- FULL OUTER JOIN

-- JOIN
SELECT e.employee_id, d.department_id 
FROM HR.employees e
JOIN HR.departments d ON e.department_id = d.department_id;

-- Filas = 106


-- LEFT JOIN
SELECT e.employee_id, d.department_id 
FROM HR.employees e
LEFT JOIN HR.departments d ON e.department_id = d.department_id;

-- Filas = 107


-- RIGHT JOIN
SELECT e.employee_id, d.department_id 
FROM HR.employees e
RIGHT JOIN HR.departments d ON e.department_id = d.department_id;

-- Filas = 122


SELECT e.employee_id, d.department_id 
FROM HR.employees e
JOIN HR.departments d ON e.department_id = d.department_id
UNION 
SELECT e.employee_id, d.department_id 
FROM HR.employees e
LEFT JOIN HR.departments d ON e.department_id = d.department_id
UNION 
SELECT e.employee_id, d.department_id 
FROM HR.employees e
RIGHT JOIN HR.departments d ON e.department_id = d.department_id;


SELECT e.employee_id, d.department_id 
FROM HR.employees e
FULL JOIN HR.departments d ON e.department_id = d.department_id;


-- CROSS JOIN

/*
Desarrolle una sentencia SELECT para obtener todas las posibles combinaciones entre 
las tablas departamento y cargo. 
Esquema: RECURSOS y/o RH.
*/

SELECT * 
FROM recursos.departamento CROSS JOIN recursos.cargo;



-- SELFT JOIN
/*
Desarrolle una sentencia SELECT para obtener un listado de los empleados con el 
respectivo nombre de su superior inmediato. 
Esquema: RECURSOS y/o HR.
*/


SELECT e.idempleado, e.nombre EMPLEADO, j.nombre JEFE
FROM RECURSOS.empleado e 
JOIN RECURSOS.empleado j on e.jefe = j.idempleado;





