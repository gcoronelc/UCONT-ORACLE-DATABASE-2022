
-- ROLLUP - EJEMPLO 1
-- =========================================================

-- GRUPO BY
SELECT d.nombre DEPARTOAMENTO, SUM(e.sueldo) PLANILLA 
FROM empleado E 
JOIN departamento D ON e.iddepartamento = d.iddepartamento 
GROUP BY d.nombre;

-- GROUP BY CON ROLLUP
SELECT 
	NVL(d.nombre,'TOTAL') DEPARTOAMENTO, 
	SUM(e.sueldo) PLANILLA 
FROM empleado E 
JOIN departamento D ON e.iddepartamento = d.iddepartamento 
GROUP BY ROLLUP (d.nombre);



-- ROLLUP - EJEMPLO 2
-- =========================================================

-- GRUPO BY
SELECT 
	d.nombre DEPARTAMENTO, 
	c.nombre CARGO, 
	COUNT(1) EMPLEADOS,
	SUM(e.sueldo) PLANILLA 
FROM empleado E 
JOIN departamento D ON e.iddepartamento = d.iddepartamento 
JOIN cargo C ON e.idcargo = c.idcargo
GROUP BY d.nombre,c.nombre;

-- GROUP BY CON ROLLUP
SELECT 
	NVL(d.nombre,'TOTAL') DEPARTAMENTO, 
	NVL(c.nombre,'TOTAL') CARGO, 
	COUNT(1) EMPLEADOS,
	SUM(e.sueldo) PLANILLA 
FROM empleado E 
JOIN departamento D ON e.iddepartamento = d.iddepartamento 
JOIN cargo C ON e.idcargo = c.idcargo
GROUP BY ROLLUP(d.nombre,c.nombre)
ORDER BY 1, 2;


-- CUBE

SELECT 
	NVL(d.nombre,'TOTAL') DEPARTAMENTO, 
	NVL(c.nombre,'TOTAL') CARGO, 
	COUNT(1) EMPLEADOS,
	SUM(e.sueldo) PLANILLA 
FROM empleado E 
JOIN departamento D ON e.iddepartamento = d.iddepartamento 
JOIN cargo C ON e.idcargo = c.idcargo
GROUP BY CUBE(d.nombre,c.nombre)
ORDER BY 1, 2;



-- GROUPING SETS


SELECT 
	NVL(d.nombre,'TOTAL') DEPARTAMENTO, 
	NVL(c.nombre,'TOTAL') CARGO, 
	COUNT(1) EMPLEADOS,
	SUM(e.sueldo) PLANILLA 
FROM empleado E 
JOIN departamento D ON e.iddepartamento = d.iddepartamento 
JOIN cargo C ON e.idcargo = c.idcargo
GROUP BY GROUPING SETS( (d.nombre,c.nombre),(d.nombre),() )
ORDER BY 1, 2;

select count(1) from empleado;


-- GROUPING
SELECT 
	NVL(d.nombre,'TOTAL') DEPARTAMENTO, 
	NVL(c.nombre,'TOTAL') CARGO, 
	COUNT(1) EMPLEADOS,
	SUM(e.sueldo) PLANILLA,
	GROUPING(d.nombre) AS FLG1, 
	GROUPING(c.nombre) AS FLG2
FROM empleado E 
JOIN departamento D ON e.iddepartamento = d.iddepartamento 
JOIN cargo C ON e.idcargo = c.idcargo
GROUP BY CUBE(d.nombre,c.nombre)
HAVING GROUPING(c.nombre) =1
ORDER BY 1, 2;


-- GROUPING_ID

SELECT 
	NVL(d.nombre,'TOTAL') DEPARTAMENTO, 
	NVL(c.nombre,'TOTAL') CARGO, 
	COUNT(1) EMPLEADOS,
	SUM(e.sueldo) PLANILLA,
	GROUPING(d.nombre) AS FLG1, 
	GROUPING(c.nombre) AS FLG2,
	GROUPING_ID(d.nombre,c.nombre) GROUPING_ID
FROM empleado E 
JOIN departamento D ON e.iddepartamento = d.iddepartamento 
JOIN cargo C ON e.idcargo = c.idcargo
GROUP BY CUBE(d.nombre,c.nombre)
--HAVING GROUPING_ID(d.nombre,c.nombre) IN (2,3)
ORDER BY 1, 2;

SELECT 
	NVL(d.nombre,'TOTAL') DEPARTAMENTO, 
	NVL(c.nombre,'TOTAL') CARGO, 
	COUNT(1) EMPLEADOS,
	SUM(e.sueldo) PLANILLA,
	GROUPING(d.nombre) AS FLG1, 
	GROUPING(c.nombre) AS FLG2,
	DECODE(GROUPING_ID(d.nombre,c.nombre),
		1, 'SUBTOTAL DEPARTAMENTO',
		2, 'SUBTOTAL CARGO',
		3, 'TOTAL GENERAL', '-')GROUPING_ID
FROM empleado E 
JOIN departamento D ON e.iddepartamento = d.iddepartamento 
JOIN cargo C ON e.idcargo = c.idcargo
GROUP BY CUBE(d.nombre,c.nombre)
ORDER BY 1, 2;


-- GROUP_ID


SELECT 
	NVL(d.nombre,'TOTAL') DEPARTAMENTO, 
	NVL(c.nombre,'TOTAL') CARGO, 
	COUNT(1) EMPLEADOS,
	SUM(e.sueldo) PLANILLA,
	GROUPING_ID(d.nombre,c.nombre) GROUPING_ID,
	GROUP_ID() GROUP_ID
FROM empleado E 
JOIN departamento D ON e.iddepartamento = d.iddepartamento 
JOIN cargo C ON e.idcargo = c.idcargo
GROUP BY GROUPING SETS ( d.nombre, CUBE(d.nombre,c.nombre) )
HAVING GROUP_ID() = 0
ORDER BY 1, 2;







