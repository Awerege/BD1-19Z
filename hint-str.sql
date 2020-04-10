EXECUTE DBMS_STATS.GATHER_TABLE_STATS ('STR','daily_cost');
EXECUTE DBMS_STATS.GATHER_TABLE_STATS ('STR','power_plant');
EXECUTE DBMS_STATS.GATHER_TABLE_STATS ('STR','cost_type');

drop index daily_cost_idx1;
create index daily_cost_idx1 on daily_cost(power_plant_id);
drop index daily_cost_idx2;
create index daily_cost_idx2 on daily_cost(cost_type_id);
drop index daily_cost_idx3;
create index daily_cost_idx3 on daily_cost(power_plant_id,cost_type_id);
drop index daily_cost_idx4;
create index daily_cost_idx4 on daily_cost(description);
drop index daily_cost_idx5;
create index daily_cost_idx5 on daily_cost(description,power_plant_id,cost_type_id);

alter index daily_cost_idx1 visible;
alter index daily_cost_idx2 visible;
alter index daily_cost_idx3 visible;
alter index daily_cost_idx4 visible;
alter index daily_cost_idx5 visible;

explain plan for
SELECT c.type_name AS "Rodzaj",p.id AS "Numer elektrowni",d.amount AS "Wartoœæ" FROM daily_cost d
INNER JOIN cost_type c ON d.id=c.id
INNER JOIN power_plant p ON d.power_plant_id=p.id
ORDER BY d.id;   

SELECT *
from table (dbms_xplan.display);

alter index daily_cost_idx1 invisible;
alter index daily_cost_idx2 invisible;
alter index daily_cost_idx3 invisible;
alter index daily_cost_idx4 invisible;
alter index daily_cost_idx5 invisible;

explain plan for
SELECT c.type_name AS "Rodzaj",p.id AS "Numer elektrowni",d.amount AS "Wartoœæ" FROM daily_cost d
INNER JOIN cost_type c ON d.id=c.id
INNER JOIN power_plant p ON d.power_plant_id=p.id
ORDER BY d.id;   

SELECT *
from table (dbms_xplan.display);

alter index daily_cost_idx1 visible;
alter index daily_cost_idx2 visible;
alter index daily_cost_idx3 visible;
alter index daily_cost_idx4 visible;
alter index daily_cost_idx5 visible;

explain plan for
SELECT  /*+ USE_MERGE(daily_cost,power_plant)*/ct.type_name,pp.id, dc.amount, cu.unit_name
FROM daily_cost dc
INNER JOIN cost_type ct ON dc.cost_type_id=ct.id
INNER JOIN power_plant pp ON dc.power_plant_id=pp.id
INNER JOIN cost_unit cu ON dc.cost_unit_id=cu.id
WHERE dc.is_daily_final = '0' 
AND cu.unit_name ='USD' 
AND dc.amount BETWEEN -30000 
AND 30000 
--AND ct.type_name IN ('Fuel', 'Maintenance', 'Repair') 
--AND pp.date_active_from > TIMESTAMP '1998-12-15  15:04:35'
--GROUP BY ct.type_name
--HAVING dc.amount >5000
ORDER BY pp.id;  

SELECT *
FROM table (dbms_xplan.display);

---------------------------------------------------------------------
alter index daily_cost_idx1 visible;
alter index daily_cost_idx2 visible;
alter index daily_cost_idx3 visible;
alter index daily_cost_idx4 visible;
alter index daily_cost_idx5 visible;

explain plan for
SELECT  /*+ ordered*/ct.type_name,pp.id, dc.amount, cu.unit_name
FROM daily_cost dc
INNER JOIN cost_type ct ON dc.cost_type_id=ct.id
INNER JOIN power_plant pp ON dc.power_plant_id=pp.id
INNER JOIN cost_unit cu ON dc.cost_unit_id=cu.id
WHERE dc.is_daily_final = '0' 
AND cu.unit_name ='USD' 
AND dc.amount BETWEEN -30000 
AND 30000 
--AND ct.type_name IN ('Fuel', 'Maintenance', 'Repair') 
--AND pp.date_active_from > TIMESTAMP '1998-12-15  15:04:35'
--GROUP BY ct.type_name
--HAVING dc.amount >5000
ORDER BY pp.id;   
/
SELECT *
from table (dbms_xplan.display);
