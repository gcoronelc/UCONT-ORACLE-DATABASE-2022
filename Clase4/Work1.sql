/*
Desarrolle una consulta para averiguar quiénes son los empleados que tienen el menor sueldo. 
Esquema: RECURSOS/RH
*/

select min(salary) from employees;

select e.*,
	(select min(salary) from employees) salary_min
from employees e
where e.salary = (select min(salary) from employees);

select * from employees
where salary=2100;


/*
Desarrolle una consulta que muestre las siguientes columnas:
▪ Código del empleado
▪ Nombre del empleado
▪ Sueldo del empleado
▪ Sueldo promedio en la empresa
▪ Diferencia del sueldo del empleado y el sueldo promedio
Esquema: RECURSOS/HR
*/

select
	e.employee_id codigo,
	e.first_name || ', ' || e.last_name nombre,
	e.salary sueldo,
	to_char((select avg(salary) from employees),'99,990.00') sueldo_promedio,
	to_char(e.salary - (select avg(salary) from employees),'99,990.00') diferencia
from employees e;

select
	e.employee_id codigo,
	e.first_name || ', ' || e.last_name nombre,
	e.salary sueldo,
	round((select avg(salary) from employees),2) sueldo_promedio,
	round(e.salary - (select avg(salary) from employees),2) diferencia
from employees e;


select
	e.employee_id codigo,
	e.first_name || ', ' || e.last_name nombre,
	e.salary sueldo,
	t.sueldo_promedio,
	e.salary - t.sueldo_promedio diferencia
from employees e
cross join (select round(avg(salary),2) sueldo_promedio from employees) t;



/*
Desarrolle una consulta que muestre la cantidad de empleados y el importe de la planilla por departamento. 
Esquema: RECURSOS/HR
*/

SELECT SUM(SALARY) FROM EMPLOYEES;

SELECT * FROM employees WHERE employees.department_id IS NULL;

select 
	d.department_id,
	d.department_name,
	(select count(1) from employees e where e.department_id = d.department_id) empleados,
	(select sum(e.salary) from employees e where e.department_id = d.department_id) planilla
from departments d;


/*
Desarrollar una consulta que muestre los empleados que su sueldo sea el menor según el cargo que ocupa. 
Esquema: RECURSOS/HR
*/

SELECT E.*
FROM RECURSOS.EMPLEADO E
WHERE E.SUELDO = (SELECT MIN(E1.SUELDO) FROM RECURSOS.EMPLEADO E1 WHERE E1.IDCARGO = E.IDCARGO)
order by idcargo;


select * from recursos.cargo;



/*
Desarrolle una consulta que muestre los alumnos matriculados en el curso SQL Server Implementación. 
Esquema: EDUCA.
*/

select * from educa.curso where cur_nombre like 'SQL Server%';

select a.*
from educa.matricula m
JOIN educa.alumno a on m.alu_id = a.alu_id
where m.cur_id in (select cur_id from educa.curso where cur_nombre like 'SQL Server%')
order by 1;

select a.*
from educa.matricula m
JOIN educa.alumno a on m.alu_id = a.alu_id
join (select cur_id from educa.curso where cur_nombre like 'SQL Server%') t on m.cur_id = t.cur_id
order by 1;


/*
Desarrolle una consulta que permita obtener los empleados que tengan alguna gerencia.
Esquema: RECURSOS/HR
*/

select * from recursos.cargo where nombre like 'Gerente%';

select * from recursos.empleado 
where idcargo in (select idcargo from recursos.cargo where nombre like '%Gerente%');


select * 
from recursos.empleado e 
join recursos.cargo c on e.idcargo = c.idcargo
where c.nombre like '%Gerente%';


/*
Desarrolle una consulta que muestre las personas que tienen el menor sueldo por departamento. 
Esquema: RECURSOS/HR
*/


select e.department_id, min(salary) menor_sueldo
from employees e
where e.department_id is not null
group by e.department_id;


select * 
from employees e
where (department_id,salary) in (
	select e.department_id, min(salary) menor_sueldo
	from employees e
	where e.department_id is not null
	group by e.department_id)
order by department_id;


select e.* 
from employees e
join (
	select e.department_id, min(salary) menor_sueldo
	from employees e
	where e.department_id is not null
	group by e.department_id ) t
on e.department_id = t.department_id and e.salary=t.menor_sueldo
order by e.department_id;


/*
Desarrolle una consulta que muestre los alumnos que tienen la mayor nota por curso. 
Esquema: EDUCA
*/


select cur_id, max(mat_nota) nota_mayor
from educa.matricula
where mat_nota is not null
group by cur_id;


select a.alu_id, a.alu_nombre, m.cur_id, m.mat_nota 
from educa.matricula m 
join educa.alumno a on m.alu_id=a.alu_id
where (m.cur_id,m.mat_nota) in (
	select cur_id, max(mat_nota) nota_mayor
	from educa.matricula
	where mat_nota is not null
	group by cur_id
);


select a.alu_id, a.alu_nombre, m.cur_id, m.mat_nota 
from educa.matricula m 
join educa.alumno a on m.alu_id=a.alu_id
join (
	select cur_id, max(mat_nota) nota_mayor
	from educa.matricula
	where mat_nota is not null
	group by cur_id ) t
on m.cur_id=t.cur_id and m.mat_nota=t.nota_mayor;


/*
Desarrolle una consulta que muestre los empleados que laboran en Trujillo. 
Esquema: RECURSOS/HR
*/

select * from recursos.ubicacion where ciudad='Trujillo';

select e.* 
from recursos.empleado e 
join recursos.departamento d on e.iddepartamento=d.iddepartamento
join recursos.ubicacion u on d.idubicacion=u.idubicacion
where ciudad='Arequipa';
	
	
select e.* 
from recursos.empleado e 
join recursos.departamento d on e.iddepartamento=d.iddepartamento
where exists (
	select 1 from recursos.ubicacion u
	where u.idubicacion=d.idubicacion and u.ciudad='Arequipa');

