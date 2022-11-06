
select count(1) cursos from educa.curso;


select 
	count(1) cursos
from educa.curso c 
join educa.matricula m on c.cur_id = m.cur_id;



SELECT *
FROM TABLA1 T1
JOIN TABLA2 T2 ON CONDICION1

JOIN TABLA3 T3 ON CONDICION2

JOIN TABLA4 T4 ON CONDICION3

JOIN TABLA5 T5 ON CONDICION4

...




