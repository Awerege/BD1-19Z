-- TRIGGER: INSERT cost_unit ---------------------------------------
create or replace trigger cost_unit_insert_trg 
before insert on cost_unit 
for each row
begin
    IF
    :new.ID IS NULL
    THEN
    :new.ID :=seq_cost_unit.nextval;
    END IF;
end;

-- test
INSERT INTO cost_unit(unit_name)
VALUES ('CAD');

SELECT * FROM cost_unit;

DELETE FROM cost_unit WHERE id=4; 

-- TRIGGER: sprawdzanie daty posiadania udziaów w elektrowniach ------------------------------
create or replace trigger power_plant_owner_end_trg
before update on power_plant_owner
for each row
begin
  if :new.date_to < :old.date_from then
    dbms_output.put_line('Podana data jest nieprawidowa, brak zmian');
    :new.date_to := :old.date_to;
    
  end if;
end;

-- test
UPDATE power_plant_owner
SET date_to = TIMESTAMP '1997-12-15  17:04:35'
WHERE id= 1;

SELECT * FROM power_plant_owner;

-- TRIGGER - OBLICZANIE WARTOŒCI SHARE
CREATE OR REPLACE TRIGGER power_plant_owner_insert_trg 
BEFORE INSERT OR UPDATE ON power_plant_owner
FOR EACH ROW
DECLARE
owner_share DECIMAL(4,2);
suma    DECIMAL(4,2);
ppt_id  INT;
maxppo  INT;

BEGIN 

SELECT power_plant_id, 
SUM(owner_share)
INTO ppt_id, suma
FROM power_plant_owner 
WHERE power_plant_owner.power_plant_id=:new.power_plant_id
GROUP BY power_plant_id;   

IF ((suma +:new.owner_share) >100) THEN
    raise_application_error(-20001,'Suma udzialow przekracza 100.');
END IF;
END;


INSERT INTO power_plant_owner VALUES (seq_power_plant_owner.nextval, 1, 1,TIMESTAMP '1998-12-15  15:04:35' ,
CURRENT_TIMESTAMP, 40);                  

DELETE FROM power_plant_owner WHERE id>8;
Select * FROM power_plant_owner;











