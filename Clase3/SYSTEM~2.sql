

SELECT * FROM EDUCA.alumno;

SELECT * FROM RECURSOS.empleado;

SELECT SUBSTR('1234',1,1) FROM DUAL;

SELECT * 
FROM EDUCA.alumno A 
JOIN RECURSOS.empleado E ON SUBSTR(ALU_TELEFONO,1,1) = SUBSTR(TELEFONO,1,1)