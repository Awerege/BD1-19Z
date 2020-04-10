---------------------------------------------------------
SELECT * FROM owner;
SELECT * FROM power_plant_owner;
SELECT * FROM power_plant;
SELECT * FROM power_plant_type;
SELECT * FROM daily_cost;
SELECT * FROM daily_production;
SELECT * FROM production_unit;
SELECT * FROM cost_type;
SELECT * FROM cost_unit;
SELECT * FROM power_plant_juncture;
SELECT * FROM transmission_line;
SELECT * FROM transmission_local_line_unit;
SELECT * FROM substation_juncture;
SELECT * FROM transmission_substation;
SELECT * FROM daily_transmission;
SELECT * FROM transmission_substation_type;
SELECT * FROM transmission_local_production_unit;
SELECT * FROM local_grid_juncture;
SELECT * FROM local_line;
SELECT * FROM local_substation;
SELECT * FROM local_substation_type;
SELECT * FROM electricity_meter_juncture;
SELECT * FROM daily_transmission_local;
SELECT * FROM energy_consumed;
SELECT * FROM electricity_meter;
SELECT * FROM client_contract;
SELECT * FROM client;
SELECT * FROM client_type;


----------------------------------------------------------
SELECT power_plant_owner.id, power_plant_owner.power_plant_id, owner_share
FROM power_plant_owner
JOIN power_plant ON power_plant_owner.power_plant_id = power_plant.id;

----------------------------------------------------------
SELECT owner.id, power_plant_owner.power_plant_id, owner_share
FROM power_plant_owner
INNER JOIN owner ON power_plant_owner.owner_id=owner.id;
----------------------------------------------------------
SELECT DISTINCT power_plant_owner.id AS "ID", power_plant_owner.power_plant_id AS "Owner", owner_share AS "Share"
FROM power_plant_owner
INNER JOIN owner ON power_plant_owner.owner_id=owner_id
JOIN power_plant ON power_plant_owner.power_plant_id = power_plant.id;

-------------------------------------------------------------
SELECT dc.id, ct.type_name, cu.unit_name, pp.id AS IDEN
FROM (daily_cost dc 
INNER JOIN power_plant pp ON (dc.power_plant_id = pp.id)
INNER JOIN cost_type ct ON (dc.cost_type_id = ct.id)
INNER JOIN cost_unit cu ON (dc.cost_unit_id =cu.id))
ORDER BY IDEN;
---------------------------------------------------------------
SELECT Count(*) FROM transmission_substation ts
INNER JOIN transmission_substation_type tst on ts.substation_type_id=tst.id
WHERE tst.type_name='220/110'; 

---------------------------------------------------------------
SELECT tst.type_name, Count(*) FROM transmission_substation ts
INNER JOIN transmission_substation_type tst ON ts.substation_type_id=tst.id
GROUP BY tst.type_name; 

---------------------------------------------------------------
SELECT tst.type_name AS "nbr", COUNT(tst.type_name) AS "cnt"
FROM transmission_substation ts
INNER JOIN transmission_substation_type tst ON ts.substation_type_id=tst.id
GROUP BY tst.type_name
HAVING COUNT(tst.type_name) > 1
ORDER BY COUNT(tst.type_name) DESC;

----------------------------------------------------------------

--Losowanie pierwszej litery z kategorii client_type
SELECT (SUBSTR(type_name,1,1) || seq_client_type.nextval) tp  FROM   
(SELECT type_name FROM client_type  
ORDER BY dbms_random.value)  
WHERE rownum = 1;

-- Sortowanie wedug poszczególnych kategorii
WITH client_type_view AS (
SELECT 
    row_number() OVER(
        PARTITION BY client_type_id
        ORDER BY full_name DESC
    ) ID, 
    client_type_id,
    full_name
FROM 
    client
)
SELECT * FROM client_type_view;
--WHERE client_type_id = 1;


SELECT * FROM power_plant;

SELECT ROUND(dbms_random.value(1, MAX(power_plant.id))) FROM power_plant;


SELECT 
daily_cost.report_date
FROM daily_cost 
INNER JOIN 
(
    SELECT 
    MAX(report_date) max_time
    FROM daily_cost
    GROUP BY daily_cost.power_plant_id
)  t
ON daily_cost.report_date = t.max_time;

WITH cc AS (
SELECT 
    row_number() OVER(
        PARTITION BY report_date
        ORDER BY report_date DESC
    ) dd, 
    id,
    is_daily_final,
    report_date
FROM 
    daily_cost
)
SELECT * FROM cc;



    
WITH gg AS(    
SELECT 
power_plant_type_id, description, id, ROW_NUMBER()
   OVER (
   PARTITION BY power_plant_type_id ORDER BY id) AS ppt_id
   FROM power_plant
)
SELECT */*id, description,TO_CHAR(ppt_id) ||TO_CHAR(power_plant_type_id) NRP*/ FROM gg ;
   


SELECT (TO_CHAR(power_plant_type_id) ||  ROW_NUMBER()
   OVER (PARTITION BY power_plant_type_id ORDER BY id)) AS ppt_id
    FROM power_plant;  
   
SELECT ROW_NUMBER()
   OVER (PARTITION BY power_plant_type_id ORDER BY id) AS ppt_id
   FROM power_plant;   

 
SELECT power_plant_id, SUM(owner_share) SUMA, COUNT(owner_share) l_udzialow FROM power_plant_owner GROUP BY power_plant_id ORDER BY power_plant_id;   
   
SELECT sum(owner_share) FROM power_plant_owner GROUP BY power_plant_id ORDER BY power_plant_id;   

SELECT sum(owner_share) FROM power_plant_owner WHERE power_plant_id=1;   

select id from Client where id =100 order by 1;
   
   
SELECT c.type_name AS "Rodzaj",p.id AS "Numer elektrowni",d.amount AS "Wartoœæ" FROM daily_cost d
INNER JOIN cost_type c ON d.id=c.id
INNER JOIN power_plant p ON d.power_plant_id=p.id
ORDER BY d.id;   
   
SELECT  *
FROM daily_cost dc, power_plant pp
WHERE dc.id=pp.id;   
   
SELECT ct.type_name,pp.id, dc.amount 
FROM daily_cost dc
INNER JOIN cost_type ct ON dc.cost_type_id=ct.id
INNER JOIN power_plant pp ON dc.power_plant_id=pp.id
WHERE dc.power_plant_id=pp.id
ORDER BY dc.id;     
   

   
   
SELECT power_plant_id, 
SUM(owner_share)
FROM power_plant_owner 
GROUP BY power_plant_id; 
   
   
   



















