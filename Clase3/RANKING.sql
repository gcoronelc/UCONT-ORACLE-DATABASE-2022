-- ROW_NUMBER()
-- Enumera el resultado
-- =====================================

-- Ejemplo simple

SELECT 
	idempleado, apellido, nombre
FROM empleado;

SELECT 
	ROW_NUMBER() OVER(ORDER BY APELLIDO ASC) AS ROWNRO,
	idempleado, apellido, nombre
FROM empleado;


-- Con particionamiento

SELECT 
	ROW_NUMBER() OVER(PARTITION BY iddepartamento ORDER BY apellido ASC) AS ROWNRO,
	iddepartamento, idempleado, apellido, nombre 
FROM empleado
ORDER BY 2, 4;


-- Como subconsulta

SELECT * 
FROM (
	SELECT 
		ROW_NUMBER() OVER(PARTITION BY iddepartamento ORDER BY apellido ASC) AS ROWNRO,
		iddepartamento, idempleado, apellido, nombre 
	FROM empleado
	ORDER BY 2, 4
) T
WHERE T.ROWNRO=1;


-- Ranking

SELECT 
	e.idempleado, e.nombre, e.apellido, e.sueldo,
	RANK() OVER(ORDER BY e.sueldo DESC) AS RANK,
	DENSE_RANK() OVER(ORDER BY e.sueldo DESC) AS DENSE_RANK
FROM RECURSOS.empleado e;


-- Ranking con partittion

SELECT 
	e.idempleado, e.nombre, e.apellido, e.iddepartamento, e.sueldo,
	RANK() OVER(PARTITION BY e.iddepartamento ORDER BY e.sueldo DESC) AS RANK,
	DENSE_RANK() OVER(PARTITION BY e.iddepartamento ORDER BY e.sueldo DESC) AS DENSE_RANK
FROM RECURSOS.empleado e;



-- Con subconsultas

select * 
from (
	SELECT 
		e.idempleado, e.nombre, e.apellido, e.iddepartamento, e.sueldo,
		RANK() OVER(PARTITION BY e.iddepartamento ORDER BY e.sueldo DESC) AS RANK,
		DENSE_RANK() OVER(PARTITION BY e.iddepartamento ORDER BY e.sueldo DESC) AS DENSE_RANK
	FROM RECURSOS.empleado e
	) t
where t.rank=1;












