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

select extract(month from sysdate) from dual;

SELECT 
    department_id,
    sum(case when extract(month from hire_date)=1 then 1 else 0 end) Enero,
    sum(case when extract(month from hire_date)=2 then 1 else 0 end) Febrero,
    sum(case when extract(month from hire_date)=3 then 1 else 0 end) Marzo,
    sum(case when extract(month from hire_date)=4 then 1 else 0 end) Abril,
    sum(case when extract(month from hire_date)=5 then 1 else 0 end) Mayo,
    sum(case when extract(month from hire_date)=6 then 1 else 0 end) Junio,
    sum(case when extract(month from hire_date)=7 then 1 else 0 end) Julio,
    sum(case when extract(month from hire_date)=8 then 1 else 0 end) Agosto,
    sum(case when extract(month from hire_date)=9 then 1 else 0 end) Setiembre,
    sum(case when extract(month from hire_date)=10 then 1 else 0 end) Octubre,
    sum(case when extract(month from hire_date)=11 then 1 else 0 end) Noviembre,
    sum(case when extract(month from hire_date)=12 then 1 else 0 end) diciembre,
    count(1) total
FROM hr.employees
WHERE department_id IS NOT NULL
GROUP BY department_id;

select * 
from hr.employees;


-- Empleado que tiene el menor salario, mostrar los empates.

select department_id, min(salary) salario_minimo
from hr.employees
where department_id is not null
group by department_id;


select e.*
from hr.employees e 
join ( select department_id, min(salary) salario_minimo
        from hr.employees
        where department_id is not null
        group by department_id ) t
on e.department_id = t.department_id and e.salary = t.salario_minimo
order by e.department_id;


select e.*
from hr.employees e 
where (e.department_id, e.salary) in ( select department_id, min(salary) salario_minimo
        from hr.employees
        where department_id is not null
        group by department_id )
order by e.department_id;


-- Recaudado por curso

select count( distinct cur_id) cursos_con_alumnos 
from educa.matricula;

select p.cur_id, sum(p.pag_importe) recaudado
from educa.pago p
group by p.cur_id;

select * from educa.matricula;
select * from educa.pago;

/*
Se necesita saber cuántos empleados han ingreso por año en cada departamento. 
Esquemas: RECURSOS

Solución:
1.- Grupo: Año
2.- Subgrupo: Departamento
*/

select * from hr.employees;

select 
    extract(year from e.hire_date) anio,
    e.department_id,
    count(1) cant_empleados
from hr.employees e
group by extract(year from e.hire_date), e.department_id
order by 1, 2;


declare
  dato number;
begin
  dato := nvl(20,30);
  dbms_output.put_line('dato: ' || to_char(dato));
end;
/


declare
  dato number;
begin
  dato := case when 1=1 then 100 else 200 end;
  dbms_output.put_line('dato: ' || to_char(dato));
end;
/

-- Tiene un error.
-- Si lo encuentras te ganas un 20
declare
  dato number;
begin
  dato := MAX(100);
  dbms_output.put_line('dato: ' || to_char(dato));
end;
/


/*
Desarrolle una sentencia SELECT para encontrar los departamentos que tienen a lo más de 3 trabajadores.
Esquema: RECURSOS.
*/


-- Paso 1: Contar empleados por departamento

select 
    e.iddepartamento,
    count(1) cant_empleados
from recursos.empleado e
group by e.iddepartamento;


-- Paso 2: Aplicar filtro de grupo

select 
    e.iddepartamento,
    count(1) cant_empleados
from recursos.empleado e
group by e.iddepartamento
having count(1) <= 3;


select * from (
    select distinct
        dpt.iddepartamento,
        dpt.nombre,
        count(emp.idempleado) over (partition by dpt.iddepartamento) as total
    from
        recursos.departamento dpt
        inner join recursos.empleado emp on dpt.iddepartamento = emp.iddepartamento
) t1
where total <= 3;







