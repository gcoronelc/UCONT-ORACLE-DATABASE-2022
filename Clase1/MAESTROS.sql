
-- Creacion del usuario

ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

CREATE USER MAESTROS IDENTIFIED BY admin;


-- Asignar recursos al usuario SISTVENTAS

GRANT CONNECT, RESOURCE TO MAESTROS;

-- Crear tabla

CREATE TABLE MAESTROS.CATEGORIA(
    IDCATEGORIA NUMBER(10,0) NOT NULL PRIMARY KEY,
    NOMBRE VARCHAR2(100) NOT NULL
);

select * from educa.matricula;