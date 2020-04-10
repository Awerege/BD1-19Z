EXECUTE DBMS_STATS.GATHER_TABLE_STATS ('STR','daily_cost');

drop index daily_cost_idx1;
create index daily_cost_idx1 on daily_cost(cost_type_id);
drop index daily_cost_idx2;
create index daily_cost_idx2 on daily_cost(cost_type_id,id );


--1 
--dwa indeksy
alter index daily_cost_idx1 visible;
alter index daily_cost_idx2 visible;

explain plan for
select cost_type_id from daily_cost where id =100 order by 1;
select *
from table (dbms_xplan.display);
select count(*)/1001 from daily_cost where id =100 order by 1;

explain plan for
select id from daily_cost where cost_type_id between 1 and 4 order by 1;
select *
from table (dbms_xplan.display);
select count(*)/1001 from daily_cost where id between 1 and 399 order by 1;

--2 
--przyk�ad z jednym indeksem wy��czonym, 
--wtedy podw�jny przejmuje rol� pierwszego wy��czonego

alter index daily_cost_idx1 invisible;
alter index daily_cost_idx2 visible;

--index dla jednego wiersza na wyj�ciu
explain plan for
select cost_type_id from daily_cost where id =100 order by 1;
select *
from table (dbms_xplan.display);
select count(*)/1001 from daily_cost where id =100 order by 1;
select count(*) from daily_cost;

--index dla nie wi�cej ni� 40% wierszy na wyj�ciu
explain plan for
select id from daily_cost where cost_type_id between 1 and 4 order by 1;
select *
from table (dbms_xplan.display);
select count(*)/1001 from daily_cost where id between 1 and 399 order by 1;

--bez indeksu po hincie full scan
explain plan for
select /*+ full(daily_cost)*/ id from daily_cost where cost_type_id between 1 and 4 order by 1;
select *
from table (dbms_xplan.display);
select count(*)/1001 from daily_cost where id between 1 and 399 order by 1;

--bez indeksu przy wypisaniu ca�ej tabeli
explain plan for
select id from daily_cost order by 1;
select *
from table (dbms_xplan.display);
select count(*)/1001 from daily_cost order by 1;
select count(*) from daily_cost;

--z indeksem przy wypisaniu ca�ej tabeli, ale dla planu optymalizatora first_rows
explain plan for
select /*+ first_rows */ id from daily_cost order by 1;
select *
from table (dbms_xplan.display);
select count(*)/1001 from daily_cost order by 1;



