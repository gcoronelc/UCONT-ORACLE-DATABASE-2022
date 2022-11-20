/*
Crear una tabla de nombre EMP_CONTA con la misma estructura de la tabla empleado. 

CREATE TABLE new_table 
AS 
(SELECT select_list FROM old_table WHERE search_condition);
*/

drop table recursos.emp_conta purge;

create table recursos.emp_conta 
as
(select * from recursos.empleado where 1=0);


select * from recursos.emp_conta;


/*
Inserte en la tabla EMP_CONTA los empleados de contabilidad, utilice la sentencia INSERT SELECT. Esquema: RECURSOS/HR. 

INSERT INTO new_tabla(select_list) 
SELECT select_list FROM old_table WHERE search_condition;
*/

select * from recursos.departamento;

insert into recursos.emp_conta 
select * 
from recursos.empleado
where iddepartamento=101;

select * from recursos.emp_conta;


/*
Jennifer Valdiviezo (IDEMPLEADO=E0018) ha sido trasladada al mismo departamento del empleado E0009, 
y su sueldo debe que ser el máximo permitido en su puesto de trabajo. 
Esquema: RECURSOS.
*/

select * from recursos.empleado where idempleado in ('E0018','E0009');
select * from recursos.cargo;

update recursos.empleado e
set 
	iddepartamento = (select iddepartamento from recursos.empleado where idempleado='E0009'),
	sueldo = (select sueldo_max from recursos.cargo c where c.idcargo=e.idcargo)
where idempleado='E0018';


-- ACTUALIZADO VARIAS COLUMNAS
-- En HR

CREATE TABLE resumen_dept ( 
	department_id NUMBER(4) PRIMARY KEY, 
	emps NUMBER(4), 
	planilla NUMBER(12,2) 
);

select * from resumen_dept;

INSERT INTO resumen_dept (department_id) 
SELECT department_id FROM departments; 
COMMIT;

select * from resumen_dept;

UPDATE resumen_dept 
SET (emps, planilla) = (
	SELECT COUNT(*), NVL(SUM(salary),0) 
	FROM employees 
	WHERE employees.department_id = resumen_dept.department_id); 
	
COMMIT;


UPDATE a
SET price = b_alias.unit_price
FROM a AS a_alias
LEFT JOIN b AS b_alias ON a_alias.b_fk = b_alias.id
WHERE a_alias.unit_name LIKE 'some_value' 
AND a.id = a_alias.id;
