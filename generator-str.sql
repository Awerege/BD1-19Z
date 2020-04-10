exec client_pop(1000);
exec daily_cost_pop(1000);
exec power_plant_owner_pop(3000);
exec power_plant_pop(1000);
-- GENERATOR for power_plant table --------------------------------------------------
create or replace procedure power_plant_pop(valnbr integer )
is
    val_nbr number := valnbr;
    decl    VARCHAR2(600);
    power_plant_code    VARCHAR2(64);
    power_plant_type_id CHAR(7);
    description         VARCHAR2(64);
    location            VARCHAR2(128);
    active              CHAR(1);
    date_active_from    TIMESTAMP;
    date_active_to      TIMESTAMP;
    maxppt              INT;
    
        
BEGIN

    SELECT MAX(power_plant_type.type_name) INTO maxppt FROM power_plant_type;
    for i in 1..val_nbr loop
        power_plant_type_id:=TRUNC(round(dbms_random.value(1,maxppt)));
        description:=dbms_random.string('U',20);
        location:=dbms_random.string('U',20);
        active:=TRUNC(round(dbms_random.value(0,1)));
        date_active_from :=TO_TIMESTAMP(sysdate - (dbms_random.value(0,i)*10)-600); /*+0.5*/
        date_active_to :=TO_TIMESTAMP(sysdate - dbms_random.value(0,i)); /*+0.1*/
        power_plant_code:=ROUND(TO_CHAR(dbms_random.value(0,100))) || power_plant_type_id ;
        
        decl:= 'insert into power_plant values (seq_power_plant.nextval,:1,:2,:3,:4,:5,:6,:7)';
        execute immediate decl using power_plant_code,power_plant_type_id, description, location, active, date_active_from, date_active_to;
    end loop;
    commit;
end;
/
-- EXEC
exec power_plant_pop(30);
-- TEST
SELECT * FROM power_plant ORDER BY ID;
-- CLEAR
DELETE FROM power_plant WHERE id >12 ;
-- GENERATOR for Client table --------------------------------------------------
create or replace procedure client_pop(valnbr integer )
is    
    val_nbr number := valnbr;
    decl        varchar2(200);
    client_type_id  INTEGER;
    client_code varchar2(300);
    full_name   varchar2(300);
    first_name  varchar2(300);
    last_name   varchar2(300);
    company_name    varchar2(300);
    address     varchar2(300);
    phone       varchar2(300);
    mobile      varchar2(300);
    email       varchar2(300);
begin
    for i in 1..val_nbr loop
        client_type_id:=dbms_random.value(1,5);
        full_name:=dbms_random.string('U',10);
        first_name:=dbms_random.string('U',10);
        last_name:=dbms_random.string('U',10);
        company_name:=dbms_random.string('U',10);
        address:=dbms_random.string('U',10);
        phone:=CONCAT('+48',TO_CHAR(dbms_random.value(100000000,999999999)));
        mobile:=TO_CHAR(dbms_random.value(100000000,999999999));
        email:=dbms_random.string('U',5) || '@' || dbms_random.string('U',5) || ( CASE round(dbms_random.value(1,4)) 
            WHEN 1 THEN '.pl' 
            WHEN 2 THEN '.com' 
            WHEN 3 THEN '.net' 
            WHEN 4 THEN '.edu' 
       END);
     
        
        
        INSERT INTO client VALUES (seq_client.nextval,dbms_random.value(1,5), (SELECT (SUBSTR(type_name,1,1) || TO_CHAR(ROUND(dbms_random.value(1,100)))) tp  FROM   
        (SELECT type_name FROM client_type  
        ORDER BY dbms_random.value)  
        WHERE rownum = 1), full_name, first_name, last_name, company_name, address, phone, mobile,email);
        
        /*decl:= 'insert into Client values (seq_client.nextval,:1,
                (SELECT (SUBSTR(type_name,1,1) || seq_client_type.nextval) tp  FROM   
                (SELECT type_name FROM client_type  
                ORDER BY dbms_random.value)  
                WHERE rownum = 1),:2,:3,:4,:5,:6,:7,:8,:9,:10)';
                execute immediate decl USING client_type_id,client_code,full_name,first_name,last_name,company_name,address,phone,mobile,email;*/
        
        /*full_name:=TO_CHAR(i);
        first_name:=TO_CHAR(i);
        last_name:=TO_CHAR(i);
        company_name:=TO_CHAR(i);
        address:=TO_CHAR(i);
        phone:=TO_CHAR(i);
        mobile:=TO_CHAR(i);
        email:=TO_CHAR(i);*/
        
      --decl:= 'insert into client values (seq_client.nextval,NULL,NULL,:1,:2,:3,:4,:5,:6,:7,:8)';
      --execute immediate decl USING dbms_random.string/*full_name*/,first_name,last_name,company_name,address,phone,mobile,email;
    end loop;
    commit;
end;
/

-- EXEC
exec client_pop(2000);
-- TEST
SELECT * FROM Client ORDER BY ID;
-- CLEAR
DELETE FROM Client;

-- GENERATOR for daily_cost table --------------------------------------------------
create or replace procedure daily_cost_pop(valnbr integer )
is
    val_nbr number := valnbr;
    decl    VARCHAR2(200);
    report_date TIMESTAMP;
    power_plant_id  INT;
    cost_type_id    INT;
    cost_unit_id    INT;
    description     VARCHAR2(500);
    amount          DECIMAL(12,2);
    maxpp           INT;
    maxct           INT;
    maxcu           INT;
    is_daily_final  CHAR(1);
begin

    SELECT MAX(power_plant.id) INTO maxpp FROM power_plant;
    SELECT MAX(cost_type.id) INTO maxct FROM cost_type;
    SELECT MAX(cost_unit.id) INTO maxcu FROM cost_unit;
    for i in 1..val_nbr loop
        report_date :=TO_TIMESTAMP(sysdate - DBMS_RANDOM.value(i,i+0.5)); /*+0.5*/
        power_plant_id:=ROUND(dbms_random.value(1, maxpp));
        cost_type_id:= round(dbms_random.value(1,maxct));
        cost_unit_id:= round(dbms_random.value(1,maxcu));
        description:=dbms_random.string('U',dbms_random.value(10,20));
        amount:=dbms_random.value(-1000000,1000000);
        is_daily_final:=TO_CHAR(round(dbms_random.value(0,1)));
        decl:= 'insert into daily_cost values (seq_daily_cost.nextval,:1,:2,:3,:4,:5,:6,:7)';
        execute immediate decl USING report_date,power_plant_id,cost_type_id,cost_unit_id,description,amount,is_daily_final;
        
       /* IF  report_date IN 
        TO_TIMESTAMP(CASE WHEN daily_cost.report_date IN (SELECT 
        daily_cost.report_date
        FROM daily_cost 
        INNER JOIN 
        (
        SELECT 
            MAX(report_date) max_time
            FROM daily_cost
            GROUP BY daily_cost.power_plant_id
        )  t
        ON daily_cost.report_date = t.max_time) THEN daily_cost.is_daily_final='1' ELSE daily_cost.is_daily_final='0');*/
    end loop;
    commit;
end;
/
-- EXEC
exec daily_cost_pop(1000);
-- TEST
SELECT * FROM daily_cost;
-- CLEAR
DELETE FROM daily_cost WHERE id >10;

-- GENERATOR for power_plant_owner table --------------------------------------------------
create or replace procedure power_plant_owner_pop(valnbr integer )
is
    val_nbr number := valnbr;
    decl    VARCHAR2(200);
    power_plant_id      INT;
    owner_id            INT;
    date_from           TIMESTAMP;
    date_to             TIMESTAMP;
    owner_share         DECIMAL(4,2);
    maxpp               INT;
    maxo                INT;
begin

    SELECT MAX(power_plant.id) INTO maxpp FROM power_plant;
    SELECT MAX(owner.id) INTO maxo FROM owner;
    for i in 1..val_nbr loop
        power_plant_id:=ROUND(dbms_random.value(1, maxpp));  
        owner_id:= round(dbms_random.value(1,maxo));
        date_from :=TO_TIMESTAMP(sysdate - (DBMS_RANDOM.value(0,i)*10)-600); /*+0.5*/
        date_to :=TO_TIMESTAMP(sysdate - DBMS_RANDOM.value(0,i)); /*+0.1*/
        owner_share:=dbms_random.value(0,100);
        decl:= 'insert into power_plant_owner values (seq_power_plant_owner.nextval,:1,:2,:3,:4,:5)';
        execute immediate decl USING power_plant_id,owner_id,date_from,date_to,owner_share;
    end loop;
    commit;
end;
/
-- EXEC
exec power_plant_owner_pop(1000);
-- TEST
SELECT * FROM power_plant_owner;
-- CLEAR
DELETE FROM power_plant_owner;



















