
-- NVL(Expr1,Expr2)
-- Permite obtener un valor concreto en vez de NULL como resultado.

SELECT 
    idempleado, apellido, nombre, 
    sueldo, nvl(comision,0), 
    sueldo + nvl(comision,0) total 
FROM recursos.empleado;


-- NVL2(Expr1,Expr2,Expr3)
-- Si el resultado de Expr1 NO es NULL, devuelve Expr2.
-- Si el resultado de Expr1 SI es NULL, devuelve Expr3.

SELECT 
    idempleado, apellido, nombre, 
    sueldo, nvl2(comision,comision,0), 
    nvl2(comision,sueldo+comision,sueldo) total 
FROM recursos.empleado;


-- COALESCE(Expr1,Expr2,Expr3,...)
-- Retorna el primer valor no nulo

SELECT 
    idempleado, apellido, nombre, 
    sueldo, coalesce(comision,0), 
    sueldo + coalesce(comision,0) total 
FROM recursos.empleado;


-- DECODE
-- https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions040.htm
/*
    DECODE(expresión,
        Valor1, resultado_si_igual_valor1,
        Valor2, resultado_si_igual_valor2,
        Valor3, resultado_si_igual_valor3,
        resultado_por_defecto);
*/

SELECT 
    idempleado, apellido, nombre, 
    sueldo, decode(comision,null,0,comision), 
    sueldo + decode(comision,null,0,comision) total 
FROM recursos.empleado;


SELECT 
    cur_id, alu_id, mat_fecha, mat_nota
    ,decode(mat_nota,null,'Sin nota',mat_nota) NOTA 
FROM educa.matricula;


-- CASE

SELECT 
    idempleado, apellido, nombre, 
    sueldo, CASE WHEN comision is NULL THEN 0 ELSE comision END as comision,  
    sueldo + CASE WHEN comision is NULL THEN 0 ELSE comision END total 
FROM recursos.empleado;






