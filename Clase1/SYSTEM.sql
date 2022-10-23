
SELECT * FROM DBA_USERS;


select * from educa.curso;


select * from recursos.empleado;


-- Operaciones con NULL

select 40+null from dual;

select 
    idempleado, 
    apellido,
    nombre,
    sueldo, 
    nvl(comision,0) comision,
    sueldo + nvl(comision,0) as sueldo_total
from recursos.empleado;

select 
    idempleado, 
    apellido,
    nombre,
    sueldo, 
    Coalesce(comision,0) comision,
    sueldo + Coalesce(comision,0) as sueldo_total
from recursos.empleado;


select Coalesce(null,45,78) from dual;

