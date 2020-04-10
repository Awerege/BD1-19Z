-- POWER PLANT----------------------------------------------------

-- owner -----------------------------------
CREATE TABLE owner (
    id                  INT NOT NULL,
    owner_details       VARCHAR2(255),
    PRIMARY KEY(id)
);

-- power_plant_type TABLE ------------------------------------------------------------
CREATE TABLE power_plant_type (
    type_name           CHAR(7) ,
    description         VARCHAR2(255),
    CONSTRAINT type_ppt CHECK (type_name In ('1', '2', '3', '4', '5', '6', '7', '8')),
    PRIMARY KEY (type_name)
);

-- production_unit TABLE---------------------------------------
CREATE TABLE production_unit (
    id                  INT NOT NULL ,
    unit_name           VARCHAR2(64) UNIQUE,
    PRIMARY KEY (id)
);

-- cost_type TABLE---------------------------------------
CREATE TABLE cost_type (
    id                   INT NOT NULL,
    type_name            VARCHAR2(64),
    PRIMARY KEY (id)
);

-- cost_unit TABLE---------------------------------------
CREATE TABLE cost_unit(
    id                  INT NOT NULL,
    unit_name           VARCHAR2(64),
    PRIMARY KEY (id)
);
-- power_plant TABLE --------------------------------------------
CREATE TABLE power_plant (
    id                  INT NOT NULL PRIMARY KEY,
    power_plant_code    VARCHAR2(64),
    power_plant_type_id CHAR(7) NOT NULL,
    description         VARCHAR2(64),
    location            VARCHAR2(128),
    active              CHAR(1),
    date_active_from    TIMESTAMP,
    date_active_to      TIMESTAMP,
    CONSTRAINT power_plant_power_plant_type_fk FOREIGN KEY (power_plant_type_id) REFERENCES power_plant_type(type_name),
    CONSTRAINT bool_pp  CHECK (active IN ('0', '1'))
);

-- power_plant_owner TABLE -----------------------------------------
CREATE TABLE power_plant_owner (
    id                  INT NOT NULL,
    power_plant_id      INT NOT NULL, 
    owner_id            INT NOT NULL,
    date_from           TIMESTAMP,
    date_to             TIMESTAMP,
    owner_share         DECIMAL(4,2),
    PRIMARY KEY (id),
    CONSTRAINT power_plant_owner_power_plant_fk FOREIGN KEY (power_plant_id) REFERENCES power_plant(id),
    CONSTRAINT power_plant_owner_owner_fk FOREIGN KEY (owner_id) REFERENCES owner(id),
    CONSTRAINT suma_ws CHECK (owner_share BETWEEN 0 AND 100)
);

-- daily_cost TABLE ------------------------------------------------------------
CREATE TABLE daily_cost (
    id                  INT NOT NULL,
    report_date         TIMESTAMP,
    power_plant_id      INT,
    cost_type_id        INT,
    cost_unit_id        INT,
    description         VARCHAR2(500),
    amount              DECIMAL(12,2),
    is_daily_final      CHAR(1),
    PRIMARY KEY(id),
    CONSTRAINT daily_cost_power_plant_fk FOREIGN KEY (power_plant_id) REFERENCES power_plant (id),
    CONSTRAINT daily_cost_cost_type_fk FOREIGN KEY (cost_type_id) REFERENCES cost_type(id),
    CONSTRAINT daily_cost_cost_unit_fk FOREIGN KEY (cost_unit_id) REFERENCES cost_unit(id),
    CONSTRAINT bool_dc CHECK (is_daily_final IN ('0', '1'))
);


-- daily_production TABLE ---------------------------------------
CREATE TABLE daily_production (
    id                  INT NOT NULL,
    report_date         TIMESTAMP,
    power_plant_id      INT,
    production_unit_id  INT,
    quantity            DECIMAL(12,2),
    is_daily_final      CHAR(1),
    PRIMARY KEY(id),
    CONSTRAINT daily_production_power_plant_fk FOREIGN KEY (power_plant_id) REFERENCES power_plant (id),
    CONSTRAINT daily_production_produciton_unit_fk FOREIGN KEY (production_unit_id) REFERENCES production_unit (id),
    CONSTRAINT bool_dp CHECK (is_daily_final IN ('0', '1'))
);




-- POWER PLANT------------------------------------------------------------------
-- PRODUCTION AND COSTS---------------------------------------------


-- TRANSMISSION GRID------------------------------------------------


-- transmission_line_unit TABLE---------------------------------------
CREATE TABLE transmission_local_line_unit(
    id                  INT NOT NULL,
    unit_name           VARCHAR2(64),
    PRIMARY KEY(id)
);
-- transmission_line TABLE---------------------------------------
CREATE TABLE transmission_line(
   id                   INT NOT NULL,
   line_type            VARCHAR2(64),
   line_unit_id         INT,
   range_min            DECIMAL(20,2),
   RANGE_MAX            DECIMAL(20,2),
   PRIMARY KEY(id),
   CONSTRAINT transmission_line_transmission_local_line_unit_fk FOREIGN KEY (line_unit_id) REFERENCES transmission_local_line_unit(id)
);

-- transmission_local_production_unit TABLE---------------------------------------
CREATE TABLE transmission_local_production_unit(
    id                  INT NOT NULL,
    unit_name           VARCHAR2(64),
    PRIMARY KEY(id)
);

-- transmission_substation_type TABLE---------------------------------------
CREATE TABLE transmission_substation_type(
    id                  INT NOT NULL,
    type_name           VARCHAR2(32),
    is_transformation   CHAR(1),
    CONSTRAINT  bool_it CHECK (is_transformation IN ('1', '0')),
    PRIMARY KEY(id)
);
-- transmission_substation TABLE---------------------------------------
CREATE TABLE transmission_substation(
    id                  INT NOT NULL,
    substation_code     VARCHAR2(64),
    substation_type_id  INT,
    active              CHAR(1),
    date_active_from    DATE,
    date_active_to      DATE,
    PRIMARY KEY(id),
    CONSTRAINT transmission_substation_transmission_substation_type_fk FOREIGN KEY (substation_type_id) REFERENCES transmission_substation_type(id),
    CONSTRAINT bool_ts CHECK (active IN ('0', '1'))
);

-- daily_transmission TABLE---------------------------------------
CREATE TABLE daily_transmission(
    id                  INT NOT NULL,
    report_date         TIMESTAMP,
    transmission_substation_id  INT,
    production_unit_id  INT,
    quantity            DECIMAL(12,2),
    is_daily_final      CHAR(1),
    PRIMARY KEY(id),
    CONSTRAINT daily_transmission_transmission_substation_fk FOREIGN KEY (transmission_substation_id) REFERENCES transmission_substation (id),
    CONSTRAINT daily_transmission_transmission_local_production_unit_fk FOREIGN KEY (production_unit_id) REFERENCES transmission_local_production_unit(id),
    CONSTRAINT bool_dt CHECK (is_daily_final IN ('0', '1'))
);

-- power_plant_juncture TABLE---------------------------------------
CREATE TABLE power_plant_juncture(
    id                   INT NOT NULL,
    power_plant_id       INT,
    transmission_substation_id   INT,
    line_id              INT,
    juncture_details     VARCHAR2(128),
    active               CHAR(1),
    date_active_from     DATE,
    date_active_to       DATE,
    PRIMARY KEY(id),
    CONSTRAINT power_plant_juncture_power_plant_fk FOREIGN KEY (power_plant_id) REFERENCES power_plant (id),
    CONSTRAINT power_plant_juncture_transmission_substation_fk FOREIGN KEY (transmission_substation_id) REFERENCES transmission_substation (id),
    CONSTRAINT power_plant_juncture_transmission_line_fk FOREIGN KEY (line_id) REFERENCES transmission_line (id),
    CONSTRAINT bool_ppj CHECK (active IN ('0', '1'))
);


-- substation_juncture TABLE---------------------------------------
CREATE TABLE substation_juncture(
    id                  INT NOT NULL,
    previous_transmission_substation_id     INT,
    next_transmission_substation_id         INT,
    line_id             INT,
    juncture_details    VARCHAR2(255),
    active              CHAR(1),
    date_active_from    DATE,
    date_active_to      DATE,
    PRIMARY KEY(id),
    CONSTRAINT substation_juncture_transmission_substation_fk_prev FOREIGN KEY (previous_transmission_substation_id) REFERENCES  transmission_substation(id),
    CONSTRAINT substation_juncture_transmission_substation_fk_next FOREIGN KEY (next_transmission_substation_id) REFERENCES  transmission_substation(id),
    CONSTRAINT substation_juncture_transmission_line_fk FOREIGN KEY (line_id) REFERENCES transmission_line(id),
    CONSTRAINT bool_s CHECK (active IN ('0', '1'))
);

-- TRANSMISSION GRID--------------------------------------------------------




-- LOCAL GRID---------------------------------------------------------------


--  local_line:Local grid TABLE---------------------------------------
CREATE TABLE local_line(
    id                  INT NOT NULL,
    line_type           VARCHAR2(64),
    line_unit_id        INT,
    range_min           DECIMAL(20,2),
    range_max           DECIMAL(20,2),
    PRIMARY KEY(id),
    CONSTRAINT local_line_transmission_local_line_unit_fk FOREIGN KEY (line_unit_id) REFERENCES transmission_local_line_unit(id)
);

-- local_substation_type TABLE---------------------------------------
CREATE TABLE local_substation_type(
    id                  INT NOT NULL,
    type_name           VARCHAR2(32),
    is_transformation   CHAR(1),
    CONSTRAINT  bool_lst CHECK (is_transformation IN ('1', '0')),
    PRIMARY KEY(id)
);

-- local_substation TABLE---------------------------------------
CREATE TABLE local_substation(
    id                  INT NOT NULL,
    substation_code     VARCHAR2(64),
    substation_type_id  INT,
    active              CHAR(1),
    date_active_from    DATE,
    date_active_to      DATE,
    PRIMARY KEY(id),
    CONSTRAINT local_substation_local_substation_type_fk FOREIGN KEY (substation_type_id) REFERENCES local_substation_type(id),
    CONSTRAINT bool_lj CHECK (active IN ('0', '1'))
);


-- local_grid_juncture TABLE---------------------------------------
CREATE TABLE local_grid_juncture(
    id                  INT   NOT NULL,
    transmission_substation_id  INT NOT NULL,
    local_substation_id INT NOT NULL,
    line_id             INT NOT NULL,
    description         VARCHAR2(64),
    active              CHAR(1),
    date_active_from    DATE,
    date_active_to      DATE,
    PRIMARY KEY(id),
    CONSTRAINT local_grid_juncture_transmission_substation_fk FOREIGN KEY (transmission_substation_id) REFERENCES transmission_substation(id),
    CONSTRAINT local_grid_juncture_local_substation_fk FOREIGN KEY (local_substation_id) REFERENCES local_substation(id),
    CONSTRAINT local_grid_juncture_local_line_fk FOREIGN KEY(line_id) REFERENCES local_line(id),
    CONSTRAINT bool_lgj CHECK (active IN ('0', '1'))
);




-- daily_transmission_local TABLE---------------------------------------
CREATE TABLE daily_transmission_local(
    id                  INT NOT NULL,
    report_date         TIMESTAMP,
    local_substation_id INT,
    production_unit_id  INT,
    quantity            DECIMAL(12,2),
    is_daily_final      CHAR(1),
    PRIMARY KEY(id),
    CONSTRAINT daily_transmission_local_local_substation_fk FOREIGN KEY(local_substation_id) REFERENCES local_substation(id),
    CONSTRAINT daily_transmission_local_transmission_local_production_unit_fk FOREIGN KEY (production_unit_id) REFERENCES transmission_local_production_unit(id),
    CONSTRAINT bool_dtl CHECK (is_daily_final IN ('0', '1'))
);


-- electricity_meter TABLE---------------------------------------
CREATE TABLE electricity_meter(
    id                  INT NOT NULL,
    em_code             VARCHAR2(64),
    active              CHAR(1),
    date_active_from    DATE,
    date_active_to      DATE,
    PRIMARY KEY(id),
    CONSTRAINT bool_em CHECK (active IN ('0', '1'))
);



-- energy_consumed TABLE---------------------------------------
CREATE TABLE energy_consumed(
    id                  INT NOT NULL,
    report_date         TIMESTAMP,
    electricity_meter_id INT,
    production_unit_id  INT,
    quantity            DECIMAL(12,2),
    is_daily_final      CHAR(1),
    PRIMARY KEY(id),
    CONSTRAINT energy_consumed_electricity_meter_fk FOREIGN KEY (electricity_meter_id) REFERENCES electricity_meter(id),
    CONSTRAINT energy_consumed_transmission_local_production_unit_fk FOREIGN KEY (production_unit_id) REFERENCES transmission_local_production_unit(id),
    CONSTRAINT bool_ec CHECK (is_daily_final IN ('0', '1'))
);

-- electricity_meter_juncture TABLE---------------------------------------
CREATE TABLE electricity_meter_juncture(
    id                  INT NOT NULL,
    local_substation_id INT,
    electricity_meter_id INT,
    line_id             INT,
    date_active_from    DATE,
    date_active_to      DATE,
    PRIMARY KEY(id),
    CONSTRAINT electricity_meter_juncture_local_substation_fk FOREIGN KEY (local_substation_id) REFERENCES local_substation(id),
    CONSTRAINT electricity_meter_juncture_electricity_meter_fk FOREIGN KEY (electricity_meter_id) REFERENCES electricity_meter(id),
    CONSTRAINT electricity_meter_juncture_local_line_fk FOREIGN KEY (line_id) REFERENCES local_line(id)
);

-- client_type TABLE---------------------------------------
CREATE TABLE client_type(
    id                  INT NOT NULL,
    type_name           VARCHAR2(64),
    PRIMARY KEY(id)
);

-- client TABLE---------------------------------------
CREATE TABLE client(
    id                  INT NOT NULL,
    client_type_id      INT,
    client_code         VARCHAR2(64),
    full_name           VARCHAR2(255),
    first_name          VARCHAR2(128),
    last_name           VARCHAR2(128),
    company_name        VARCHAR2(255),
    address             VARCHAR2(255),
    phone               VARCHAR2(64),
    mobile              VARCHAR2(64),
    email               VARCHAR2(64),
    PRIMARY KEY(id),
    CONSTRAINT client_client_type_fk FOREIGN KEY(client_type_id) REFERENCES client_type(id)
);


-- client_contract TABLE---------------------------------------
CREATE TABLE client_contract(
    id                  INT NOT NULL,
    client_id           INT,
    electricity_meter_id    INT,
    contract_details    VARCHAR2(255),
    date_valid_from     TIMESTAMP,
    date_valid_to       TIMESTAMP,
    PRIMARY KEY(id),
    CONSTRAINT client_contract_electricity_meter_fk FOREIGN KEY (electricity_meter_id) REFERENCES electricity_meter(id),
    CONSTRAINT client_contract_client_fk FOREIGN KEY (client_id) REFERENCES client(id)
);



-- CREATING SEQUENCES--

CREATE SEQUENCE seq_owner  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_power_plant_owner  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_power_plant  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_power_plant_type  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_daily_cost  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_daily_production  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_production_unit  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_cost_type  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_cost_unit  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_power_plant_juncture  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_transmission_line  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_transmission_local_line_unit  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_substation_juncture  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_transmission_substation  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_daily_transmission  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_transmission_substation_type  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_transmission_local_production_unit  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_local_grid_juncture  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_local_line  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_local_line_unit  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_local_substation  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_local_substation_type  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_electricity_meter_juncture  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_daily_transmission_local  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_energy_consumed  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_electricity_meter  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_client_contract  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_client  MINVALUE 1 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_client_type  MINVALUE 1 START WITH 1 INCREMENT BY 1;




































































