
create global temporary table test ( 
	id number primary key,
	dato varchar2(30)
) on commit delete rows;



insert into test values(1,'Gustavo');
insert into test values(2,'Coronel');

select * from test;

commit;


select * from test;