


ALTER SESSION SET TIME_ZONE = '+1:0';
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='DD-MON-YY HH24:MI:SS';
SELECT SESSIONTIMEZONE, CURRENT_DATE FROM DUAL;
SELECT SYSDATE FROM DUAL;

-----------------------------------------------
INSERT INTO owner
VALUES (seq_owner.nextval, 'AB');
INSERT INTO owner
VALUES (seq_owner.nextval, 'CD');
INSERT INTO owner
VALUES (seq_owner.nextval, 'EF');
INSERT INTO owner
VALUES (seq_owner.nextval, 'GH');
INSERT INTO owner
VALUES (seq_owner.nextval, 'IJ');
INSERT INTO owner
VALUES (seq_owner.nextval, 'KL');
INSERT INTO owner
VALUES (seq_owner.nextval, 'MN');
INSERT INTO owner
VALUES (seq_owner.nextval, 'OP');
INSERT INTO owner
VALUES (seq_owner.nextval, 'RS');
INSERT INTO owner
VALUES (seq_owner.nextval, 'TU');
INSERT INTO owner
VALUES (seq_owner.nextval, 'WY');
INSERT INTO owner
VALUES (seq_owner.nextval, 'ZZ');

-- power_plant_type TABLE
INSERT INTO power_plant_type
VALUES ('1', 'Coal');
INSERT INTO power_plant_type
VALUES ('2', 'Lignite');
INSERT INTO power_plant_type
VALUES ('3', 'Solar');
INSERT INTO power_plant_type
VALUES ('4', 'Natural gas');
INSERT INTO power_plant_type
VALUES ('5', 'Water');
INSERT INTO power_plant_type
VALUES ('6','Nuclear');
INSERT INTO power_plant_type
VALUES ('7','Geothermal');
INSERT INTO power_plant_type
VALUES ('8','Wind');

-- production_unit TABLE
INSERT INTO production_unit
VALUES (seq_production_unit.nextval, 'MW');
INSERT INTO production_unit
VALUES (seq_production_unit.nextval, 'TWh');

-- cost_type TABLE---------------------------------------
INSERT INTO cost_type
VALUES (seq_cost_type.nextval, 'Wages');
INSERT INTO cost_type
VALUES (seq_cost_type.nextval, 'Fuel');
INSERT INTO cost_type
VALUES (seq_cost_type.nextval, 'Maintenance');
INSERT INTO cost_type
VALUES (seq_cost_type.nextval, 'Repair');
INSERT INTO cost_type
VALUES (seq_cost_type.nextval, 'Upgrade');
INSERT INTO cost_type
VALUES (seq_cost_type.nextval, 'Tax');
INSERT INTO cost_type
VALUES (seq_cost_type.nextval, 'Fees');

-- cost_unit TABLE---------------------------------------
INSERT INTO cost_unit
VALUES (seq_cost_unit.nextval, 'PLN');
INSERT INTO cost_unit
VALUES (seq_cost_unit.nextval, 'EUR');
INSERT INTO cost_unit
VALUES (seq_cost_unit.nextval, 'USD');


-- power_plant TABLE---------------------------------------
INSERT INTO power_plant
VALUES (seq_power_plant.nextval, '12', '2', 'Be³chatów', 'Rogowiec
ul. Energetyczna 797-406 Be³chatów 5', '1', TO_DATE( '17 01 1945', 'DD MM YYYY' ), CURRENT_TIMESTAMP);
INSERT INTO power_plant
VALUES (seq_power_plant.nextval, '11', '1', 'Kozienice','Œwier¿e Górne
26-900 Kozienice', '1', TO_DATE( '01 04 1968', 'DD MM YYYY' ), CURRENT_TIMESTAMP);
INSERT INTO power_plant
VALUES (seq_power_plant.nextval, '21', '1','Opole', 'Brzezie, 46-021 Opole', '1', TO_DATE( '01 01 1993', 'DD MM YYYY' ), CURRENT_TIMESTAMP);
INSERT INTO power_plant
VALUES (seq_power_plant.nextval, '22', '2', 'Turów', 'ul. M³odych Energetyków 12
59-916 Bogatynia', '1', TO_DATE( '01 01 1962', 'DD MM YYYY' ), CURRENT_TIMESTAMP);
INSERT INTO power_plant
VALUES (seq_power_plant.nextval, '31', '1', 'Po³aniec','28-230 Po³aniec 
Zawada 26', '1', TO_DATE( '01 01 1979', 'DD MM YYYY' ), CURRENT_TIMESTAMP);
INSERT INTO power_plant
VALUES (seq_power_plant.nextval, '41', '1','Rybnik', 'ul. Podmiejska
44-207 Rybnik', '1', TO_DATE( '01 01 1972', 'DD MM YYYY' ), CURRENT_TIMESTAMP);
INSERT INTO power_plant
VALUES (seq_power_plant.nextval, '51', '1','Dolna Odra', '74-105 Nowe Czarnowo
ul. Nowe Czarnowo 76', '1', TO_DATE( '01 01 1974', 'DD MM YYYY' ), CURRENT_TIMESTAMP);
INSERT INTO power_plant
VALUES (seq_power_plant.nextval, '32', '2','P¹tnów', 'ul. Kazimierska 45
62-510 Konin', '1', TO_DATE( '01 01 1967', 'DD MM YYYY' ), CURRENT_TIMESTAMP);
INSERT INTO power_plant
VALUES (seq_power_plant.nextval, '61', '1','Jaworzno','ul. Promienna 51
43-603 Jaworzno', '1', TO_DATE( '01 01 1953', 'DD MM YYYY' ), CURRENT_TIMESTAMP);
INSERT INTO power_plant
VALUES (seq_power_plant.nextval, '71', '1', '£aziska',' Wyzwolenia 30, 43-170 £aziska Górne', '1', TO_DATE( '01 01 1963', 'DD MM YYYY' ), CURRENT_TIMESTAMP);
INSERT INTO power_plant
VALUES (seq_power_plant.nextval, '81', '1', '£agisza',   '42-504 Bêdzin
ul. Pokoju 14', '1', TO_DATE( '01 01 1970', 'DD MM YYYY' ), CURRENT_TIMESTAMP);
INSERT INTO power_plant
VALUES (seq_power_plant.nextval, '91', '1','Ostro³êka', '07-401 Ostro³êka
ul. Elektryczna 5', '1', TO_DATE( '01 01 1972', 'DD MM YYYY' ), CURRENT_TIMESTAMP);

-- power_plant_owner TABLE
INSERT INTO power_plant_owner VALUES (seq_power_plant_owner.nextval,1,2,  TIMESTAMP '1998-12-15  15:04:35' , CURRENT_TIMESTAMP ,  15.24);
INSERT INTO power_plant_owner VALUES (seq_power_plant_owner.nextval,3,4,  TIMESTAMP '1981-08-11  15:04:35' , CURRENT_TIMESTAMP ,  10.11);
INSERT INTO power_plant_owner VALUES (seq_power_plant_owner.nextval,5,6,  TIMESTAMP '2015-06-10  15:04:35' , CURRENT_TIMESTAMP ,  9.56);
INSERT INTO power_plant_owner VALUES (seq_power_plant_owner.nextval,7,8,  TIMESTAMP '2014-05-09  15:04:35' , CURRENT_TIMESTAMP ,  4.76);
INSERT INTO power_plant_owner VALUES (seq_power_plant_owner.nextval,9,10, TIMESTAMP '2000-03-04  15:04:35' , CURRENT_TIMESTAMP ,  21.37);
INSERT INTO power_plant_owner VALUES (seq_power_plant_owner.nextval,11,12,TIMESTAMP '2004-03-08  15:04:35' , CURRENT_TIMESTAMP ,  1.11);
INSERT INTO power_plant_owner VALUES (seq_power_plant_owner.nextval,1,3,  TIMESTAMP '1985-01-04  15:04:35' , CURRENT_TIMESTAMP ,  19.95);
INSERT INTO power_plant_owner VALUES (seq_power_plant_owner.nextval,2,4,  TIMESTAMP '2001-02-03  15:04:35' , CURRENT_TIMESTAMP ,  12.78);


-- daily_cost----------------------------------
INSERT INTO daily_cost
VALUES (seq_daily_cost.nextval, TIMESTAMP  '2020-03-11  15:04:35',1,2,3,'Koszt wêgla',55.78, '1');

INSERT INTO daily_cost
VALUES (seq_daily_cost.nextval, TIMESTAMP  '2020-03-05  17:03:15',2,3,2,'Utrzymanie czystoœci',1250.38, '1');

INSERT INTO daily_cost
VALUES (seq_daily_cost.nextval, TIMESTAMP  '2020-03-04  14:03:15',3,4,1,'Naprawa kot³a',738.57, '0');

INSERT INTO daily_cost
VALUES (seq_daily_cost.nextval, TIMESTAMP  '2020-03-03  21:03:15',5,6,2,'Podatek od nieruchomoœci',46789.81, '1');

INSERT INTO daily_cost
VALUES (seq_daily_cost.nextval, TIMESTAMP  '2020-03-02  9:03:15',7,1,3,'Wynagrodzenia dziau HR',1357.90, '0');

INSERT INTO daily_cost
VALUES (seq_daily_cost.nextval, TIMESTAMP  '2020-03-01  5:03:15',2,3,1,'Utrzymanie zieleni na terenie obiektu',234.54, '0');

INSERT INTO daily_cost
VALUES (seq_daily_cost.nextval, TIMESTAMP  '2020-02-29  23:03:15',4,5,2,'Modernizacja instalacji ch³odniczej',2735.64, '1');

INSERT INTO daily_cost
VALUES (seq_daily_cost.nextval, TIMESTAMP  '2020-02-29  22:03:15',4,4,2,'Naprawa popêkanych rur',1456.23, '1');

INSERT INTO daily_cost
VALUES (seq_daily_cost.nextval, TIMESTAMP  '2020-02-29  23:30:15',4,7,2,'Op³ata za ochronê',1234.56, '1');

-- daily_production TABLE ------------------------------------------------------------
INSERT INTO daily_production
VALUES (seq_daily_production.nextval, TIMESTAMP  '2020-03-11  23:03:15',1,1,120.64, '1');
INSERT INTO daily_production
VALUES (seq_daily_production.nextval, TIMESTAMP  '2020-03-10  22:03:15',2,1,220.64, '1');
INSERT INTO daily_production
VALUES (seq_daily_production.nextval, TIMESTAMP  '2020-03-09  21:03:15',3,1,320.64, '1');
INSERT INTO daily_production
VALUES (seq_daily_production.nextval, TIMESTAMP  '2020-03-08  20:03:15',4,1,420.64, '1');
INSERT INTO daily_production
VALUES (seq_daily_production.nextval, TIMESTAMP  '2020-03-07  19:03:15',5,1,520.64, '0');
INSERT INTO daily_production
VALUES (seq_daily_production.nextval, TIMESTAMP  '2020-03-06  18:03:15',6,1,620.64, '0');
INSERT INTO daily_production
VALUES (seq_daily_production.nextval, TIMESTAMP  '2020-03-05  17:03:15',7,1,720.64, '0');


-- TRANSMISSION GRID----



-- transmission_local_line_unit TABLE ---------------------------------------
INSERT INTO transmission_local_line_unit
VALUES (seq_transmission_local_line_unit.nextval, 'V');
INSERT INTO transmission_local_line_unit
VALUES (seq_transmission_local_line_unit.nextval, 'kV');

-- transmission_line TABLE ---------------------------------------
INSERT INTO transmission_line
VALUES (seq_transmission_line.nextval, 'Transmission 110kV',2, 105,121);
INSERT INTO transmission_line
VALUES (seq_transmission_line.nextval, 'Transmission 220kV',2, 210,245);
INSERT INTO transmission_line
VALUES (seq_transmission_line.nextval, 'Transmission 400kV',2, 380,420);
INSERT INTO transmission_line
VALUES (seq_transmission_line.nextval, 'Transmission 450kV',2, 427,473);
INSERT INTO transmission_line
VALUES (seq_transmission_line.nextval, 'Transmission 750kV',2, 710,787);

-- transmission_local__production_unit TABLE---------------------------------------
INSERT INTO transmission_local_production_unit
VALUES (seq_transmission_local_production_unit.nextval, 'MWh');
        
-- transmission_substation_type TABLE---------------------------------------
INSERT INTO transmission_substation_type
VALUES (seq_transmission_substation_type.nextval, '400/220/110','1');
INSERT INTO transmission_substation_type
VALUES (seq_transmission_substation_type.nextval, '400/110','1');
INSERT INTO transmission_substation_type
VALUES (seq_transmission_substation_type.nextval, '220/110','1');
INSERT INTO transmission_substation_type
VALUES (seq_transmission_substation_type.nextval, '220/SN','1');
INSERT INTO transmission_substation_type
VALUES (seq_transmission_substation_type.nextval, '110','0');
INSERT INTO transmission_substation_type
VALUES (seq_transmission_substation_type.nextval, '220','0');
INSERT INTO transmission_substation_type
VALUES (seq_transmission_substation_type.nextval, '400','0');
INSERT INTO transmission_substation_type
VALUES (seq_transmission_substation_type.nextval, '450','0');
INSERT INTO transmission_substation_type
VALUES (seq_transmission_substation_type.nextval, '750','0');
INSERT INTO transmission_substation_type
VALUES (seq_transmission_substation_type.nextval, '750','1');
INSERT INTO transmission_substation_type
VALUES (seq_transmission_substation_type.nextval, '400/220','1');
INSERT INTO transmission_substation_type
VALUES (seq_transmission_substation_type.nextval, '400/220','0');
INSERT INTO transmission_substation_type
VALUES (seq_transmission_substation_type.nextval, '400/220/110','0');



-- transmission_substation TABLE---------------------------------------
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'SDU',2,'1',TIMESTAMP  '2000-03-04  00:05:35',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'NAR',2,'1',TIMESTAMP  '1990-05-25  13:32:54',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'ELK',3,'1',TIMESTAMP  '1980-11-16  12:14:17',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'EKB',2,'1',TIMESTAMP  '1984-12-27  16:17:26',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'LMS',7,'1',TIMESTAMP  '1988-03-07  20:21:41',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'OST',1,'1',TIMESTAMP  '1992-07-08  01:02:45',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'STN',7,'1',TIMESTAMP  '1996-08-12  05:06:49',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'MIL',1,'1',TIMESTAMP  '2000-12-16  09:10:53',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'PIA',3,'1',TIMESTAMP  '2004-04-20  13:08:57',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'WTO',3,'1',TIMESTAMP  '2003-03-11  15:24:25',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'MOR',3,'1',TIMESTAMP  '2002-02-15  13:45:45',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'MSK',2,'1',TIMESTAMP  '1993-01-02  01:02:03',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'OLT',1,'1',TIMESTAMP  '1995-03-04  03:04:05',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'SOC',3,'1',TIMESTAMP  '1997-05-06  05:06:07',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'PDE',3,'1',TIMESTAMP  '1999-07-08  07:08:09',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'PLO',2,'1',TIMESTAMP  '2001-09-10  09:10:11',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'JAN',3,'1',TIMESTAMP  '2003-11-12  11:12:13',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'PIO',3,'1',TIMESTAMP  '2005-02-14  13:14:15',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'ZGI',3,'1',TIMESTAMP  '2007-04-16  15:16:17',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'PAB',3,'1',TIMESTAMP  '2009-06-18  17:18:19',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'ROG',11,'1',TIMESTAMP '1992-02-04  19:20:21',CURRENT_TIMESTAMP);
INSERT INTO transmission_substation
VALUES (seq_transmission_substation.nextval, 'TRE',2,'1',TIMESTAMP  '1994-04-06  21:22:24',CURRENT_TIMESTAMP);

-- daily_transmission TABLE---------------------------------------

INSERT INTO daily_transmission
VALUES (seq_daily_transmission.nextval, TIMESTAMP  '2020-03-11  01:00:00',1,1,226.99, '1');
INSERT INTO daily_transmission
VALUES (seq_daily_transmission.nextval, TIMESTAMP  '2020-03-11  02:00:00',2,1,264.51, '1');
INSERT INTO daily_transmission
VALUES (seq_daily_transmission.nextval, TIMESTAMP  '2020-03-11  03:00:00',3,1,221.47, '1');
INSERT INTO daily_transmission
VALUES (seq_daily_transmission.nextval, TIMESTAMP  '2020-03-11  04:00:00',4,1,292.40, '1');
INSERT INTO daily_transmission
VALUES (seq_daily_transmission.nextval, TIMESTAMP  '2020-03-11  05:00:00',5,1,204.32, '1');
INSERT INTO daily_transmission
VALUES (seq_daily_transmission.nextval, TIMESTAMP  '2020-03-11  06:00:00',6,1,209.24, '1');
INSERT INTO daily_transmission
VALUES (seq_daily_transmission.nextval, TIMESTAMP  '2020-03-11  07:00:00',7,1,288.60, '1');
INSERT INTO daily_transmission
VALUES (seq_daily_transmission.nextval, TIMESTAMP  '2020-03-11  08:00:00',8,1,241.03, '1');
INSERT INTO daily_transmission
VALUES (seq_daily_transmission.nextval, TIMESTAMP  '2020-03-11  09:00:00',9,1,210.18, '1');
INSERT INTO daily_transmission
VALUES (seq_daily_transmission.nextval, TIMESTAMP  '2020-03-11  10:00:00',10,1,278.93, '1');

-- power_plant_juncture TABLE---------------------------------------

INSERT INTO power_plant_juncture
VALUES (seq_power_plant_juncture.nextval,1,3,2, 'BE£','1',TIMESTAMP  '1995-01-04  01:05:15',CURRENT_TIMESTAMP);
INSERT INTO power_plant_juncture
VALUES (seq_power_plant_juncture.nextval,2,1,3, 'KOZ','1',TIMESTAMP  '1996-02-04  03:06:25',CURRENT_TIMESTAMP);
INSERT INTO power_plant_juncture
VALUES (seq_power_plant_juncture.nextval,3,2,2, 'OPO','1',TIMESTAMP  '1997-03-04  05:07:35',CURRENT_TIMESTAMP);
INSERT INTO power_plant_juncture
VALUES (seq_power_plant_juncture.nextval,4,5,3, 'TUR','1',TIMESTAMP  '1998-04-04  07:08:45',CURRENT_TIMESTAMP);
INSERT INTO power_plant_juncture
VALUES (seq_power_plant_juncture.nextval,5,9,2, 'PO£','1',TIMESTAMP  '1999-05-04  09:09:55',CURRENT_TIMESTAMP);
INSERT INTO power_plant_juncture
VALUES (seq_power_plant_juncture.nextval,6,13,3, 'RYB','1',TIMESTAMP  '2000-06-04  11:10:15',CURRENT_TIMESTAMP);
INSERT INTO power_plant_juncture
VALUES (seq_power_plant_juncture.nextval,7,11,2, 'DOL','1',TIMESTAMP  '2001-07-04  13:11:25',CURRENT_TIMESTAMP);
INSERT INTO power_plant_juncture
VALUES (seq_power_plant_juncture.nextval,8,21,3, 'P¥T','1',TIMESTAMP  '2002-08-04  15:12:35',CURRENT_TIMESTAMP);
INSERT INTO power_plant_juncture
VALUES (seq_power_plant_juncture.nextval,9,10,2, 'JAW','1',TIMESTAMP  '2003-09-04  17:13:45',CURRENT_TIMESTAMP);
INSERT INTO power_plant_juncture
VALUES (seq_power_plant_juncture.nextval,10,12,3, '£AZ','1',TIMESTAMP  '2004-10-04  19:14:55',CURRENT_TIMESTAMP);
INSERT INTO power_plant_juncture
VALUES (seq_power_plant_juncture.nextval,11,3,2, '£AG','1',TIMESTAMP  '2005-11-04  21:15:15',CURRENT_TIMESTAMP);
INSERT INTO power_plant_juncture
VALUES (seq_power_plant_juncture.nextval,12,1,3, 'OST','1',TIMESTAMP  '2006-12-04  23:16:25',CURRENT_TIMESTAMP);

-- substation_juncture TABLE---------------------------------------

INSERT INTO substation_juncture
VALUES (seq_substation_juncture.nextval,1,2,3, 'SDU-NAR','1',TIMESTAMP  '1995-01-01  01:55:15',CURRENT_TIMESTAMP);
INSERT INTO substation_juncture
VALUES (seq_substation_juncture.nextval,2,4,3, 'ELK-EKB','1',TIMESTAMP  '1994-02-02  02:45:25',CURRENT_TIMESTAMP);
INSERT INTO substation_juncture
VALUES (seq_substation_juncture.nextval,5,6,2, 'LMS-OST','1',TIMESTAMP  '1993-03-03  03:35:35',CURRENT_TIMESTAMP);
INSERT INTO substation_juncture
VALUES (seq_substation_juncture.nextval,7,8,3, 'STN-MIL','1',TIMESTAMP  '1992-04-04  04:25:45',CURRENT_TIMESTAMP);
INSERT INTO substation_juncture
VALUES (seq_substation_juncture.nextval,9,10,3, 'PIA-WTO','1',TIMESTAMP  '1991-05-05  05:15:55',CURRENT_TIMESTAMP);
INSERT INTO substation_juncture
VALUES (seq_substation_juncture.nextval,11,12,3, 'MOR-MSK','1',TIMESTAMP  '1990-06-06  06:05:15',CURRENT_TIMESTAMP);
INSERT INTO substation_juncture
VALUES (seq_substation_juncture.nextval,13,14,3, 'OLT-SOC','1',TIMESTAMP  '1996-07-07  07:55:25',CURRENT_TIMESTAMP);
INSERT INTO substation_juncture
VALUES (seq_substation_juncture.nextval,15,16,2, 'PDE-PLO','1',TIMESTAMP  '1997-08-08  08:45:35',CURRENT_TIMESTAMP);
INSERT INTO substation_juncture
VALUES (seq_substation_juncture.nextval,17,18,2, 'JAN-PIO','1',TIMESTAMP  '1998-09-09  09:35:45',CURRENT_TIMESTAMP);
INSERT INTO substation_juncture
VALUES (seq_substation_juncture.nextval,19,20,2, 'ZGI-PAB','1',TIMESTAMP  '1999-10-10  11:25:55',CURRENT_TIMESTAMP);
INSERT INTO substation_juncture
VALUES (seq_substation_juncture.nextval,21,22,3, 'ROG-TRE','1',TIMESTAMP  '2000-11-11  01:15:15',CURRENT_TIMESTAMP);


-- TRANSMISSION GRID-----------------------

-- LOCAL GRID-------------------------------


-- local_line TABLE------

INSERT INTO local_line
VALUES (seq_local_line.nextval, 'Distribution 3kV', 2,1,3);
INSERT INTO local_line
VALUES (seq_local_line.nextval, 'Distribution 5kV', 2,1,5);
INSERT INTO local_line
VALUES (seq_local_line.nextval, 'Distribution 6kV', 2,1,6);
INSERT INTO local_line
VALUES (seq_local_line.nextval, 'Distribution 10kV', 2,1,10);
INSERT INTO local_line
VALUES (seq_local_line.nextval, 'Distribution 15kV', 2,1,15);
INSERT INTO local_line
VALUES (seq_local_line.nextval, 'Distribution 20kV', 2,1,20);
INSERT INTO local_line
VALUES (seq_local_line.nextval, 'Distribution 30kV', 2,1,30);
INSERT INTO local_line
VALUES (seq_local_line.nextval, 'Distribution 40kV', 2,1,40);
INSERT INTO local_line
VALUES (seq_local_line.nextval, 'Distribution 60kV', 2,1,60);
INSERT INTO local_line
VALUES (seq_local_line.nextval, 'Distribution 110kV', 2,1,110);

-- local_substation_type TABLE---------------------------------------
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/3','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/5','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/6','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/10','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/15','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/20','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/30','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/40','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/60','1');
--------------------------------------------------------
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/3','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/5','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/6','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/10','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/15','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/20','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/30','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/40','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/60','1');
--------------------------------------------------------
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/3','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/5','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/6','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/10','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/15','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/20','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/30','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/40','1');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/60','1');
--------------------------------------------------------
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/3','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/5','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/6','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/10','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/15','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/20','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/30','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/40','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '110/60','0');
--------------------------------------------------------
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/3','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/5','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/6','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/10','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/15','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/20','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/30','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/40','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '220/60','0');
--------------------------------------------------------
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/3','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/5','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/6','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/10','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/15','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/20','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/30','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/40','0');
INSERT INTO local_substation_type
VALUES (seq_local_substation_type.nextval, '400/60','0');


-- local_substation TABLE---------------------------
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'ABC',1,'1',TIMESTAMP  '2000-03-04  00:05:35',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'DEF',2,'1',TIMESTAMP  '1990-05-25  13:32:54',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'GHI',3,'1',TIMESTAMP  '1980-11-16  12:14:17',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'JKL',4,'1',TIMESTAMP  '1984-12-27  16:17:26',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'MNO',5,'1',TIMESTAMP  '1988-03-07  20:21:41',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'PRS',6,'1',TIMESTAMP  '1992-07-08  01:02:45',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'TUW',7,'1',TIMESTAMP  '1996-08-12  05:06:49',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'XYZ',8,'1',TIMESTAMP  '2000-12-16  09:10:53',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'CBA',9,'1',TIMESTAMP  '2004-04-20  13:08:57',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'PIS',10,'1',TIMESTAMP  '2003-03-11  15:24:25',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'PSL',11,'1',TIMESTAMP  '2002-02-15  13:45:45',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'SLD',12,'1',TIMESTAMP  '1993-01-02  01:02:03',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'ABW',13,'1',TIMESTAMP  '1995-03-04  03:04:05',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'PSE',14,'1',TIMESTAMP  '1997-05-06  05:06:07',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'PGE',15,'1',TIMESTAMP  '1999-07-08  07:08:09',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'WOT',16,'1',TIMESTAMP  '2001-09-10  09:10:11',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'GER',17,'1',TIMESTAMP  '2003-11-12  11:12:13',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'POL',18,'1',TIMESTAMP  '2005-02-14  13:14:15',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'FRA',19,'1',TIMESTAMP  '2007-04-16  15:16:17',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'ENG',20,'1',TIMESTAMP  '2009-06-18  17:18:19',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'USA',21,'1',TIMESTAMP '1992-02-04  19:20:21',CURRENT_TIMESTAMP);
INSERT INTO local_substation
VALUES (seq_local_substation.nextval, 'ITA',22,'1',TIMESTAMP  '1994-04-06  21:22:24',CURRENT_TIMESTAMP);

-- local_grid_juncture TABLE---------------------------------------

INSERT INTO local_grid_juncture
VALUES (seq_local_grid_juncture.nextval,1,1,10, 'SDU-ABC','1',TIMESTAMP  '1990-01-01  01:55:15',CURRENT_TIMESTAMP);
INSERT INTO local_grid_juncture
VALUES (seq_local_grid_juncture.nextval,2,2,10, 'NAR-DEF','1',TIMESTAMP  '1991-02-02  02:55:15',CURRENT_TIMESTAMP);
INSERT INTO local_grid_juncture
VALUES (seq_local_grid_juncture.nextval,3,3,10, 'ELK-GHI','1',TIMESTAMP  '1992-03-03  03:55:15',CURRENT_TIMESTAMP);
INSERT INTO local_grid_juncture
VALUES (seq_local_grid_juncture.nextval,4,4,10, 'EKB-JKL','1',TIMESTAMP  '1993-04-04  04:55:15',CURRENT_TIMESTAMP);
INSERT INTO local_grid_juncture
VALUES (seq_local_grid_juncture.nextval,5,6,10, 'LMS-PRS','1',TIMESTAMP  '1994-05-05  05:55:15',CURRENT_TIMESTAMP);
INSERT INTO local_grid_juncture
VALUES (seq_local_grid_juncture.nextval,6,8,10, 'OST-XYZ','1',TIMESTAMP  '1995-06-06  06:55:15',CURRENT_TIMESTAMP);
INSERT INTO local_grid_juncture
VALUES (seq_local_grid_juncture.nextval,7,9,10, 'STN-CBA','1',TIMESTAMP  '1996-07-07  07:55:15',CURRENT_TIMESTAMP);
INSERT INTO local_grid_juncture
VALUES (seq_local_grid_juncture.nextval,8,10,10, 'MIL-PIS','1',TIMESTAMP  '1997-08-08  08:55:15',CURRENT_TIMESTAMP);
INSERT INTO local_grid_juncture
VALUES (seq_local_grid_juncture.nextval,9,11,10, 'PIA-PSL','1',TIMESTAMP  '1998-09-09  09:55:15',CURRENT_TIMESTAMP);
INSERT INTO local_grid_juncture
VALUES (seq_local_grid_juncture.nextval,10,6,10, 'WTO-PRS','1',TIMESTAMP  '1999-08-11  11:55:15',CURRENT_TIMESTAMP);
INSERT INTO local_grid_juncture
VALUES (seq_local_grid_juncture.nextval,11,8,10, 'MOR-XYZ','1',TIMESTAMP  '1998-07-12  12:55:15',CURRENT_TIMESTAMP);
INSERT INTO local_grid_juncture
VALUES (seq_local_grid_juncture.nextval,12,13,10, 'MSK-ABW','1',TIMESTAMP  '1997-06-13  13:55:15',CURRENT_TIMESTAMP);
INSERT INTO local_grid_juncture
VALUES (seq_local_grid_juncture.nextval,13,21,10, 'OLT-USA','1',TIMESTAMP  '1996-05-14  14:55:15',CURRENT_TIMESTAMP);
INSERT INTO local_grid_juncture
VALUES (seq_local_grid_juncture.nextval,14,6,10, 'SOC-PRS','1',TIMESTAMP  '1995-04-15  15:55:15',CURRENT_TIMESTAMP);
INSERT INTO local_grid_juncture
VALUES (seq_local_grid_juncture.nextval,15,8,10, 'PDE-XYZ','1',TIMESTAMP  '1994-03-16  16:55:15',CURRENT_TIMESTAMP);


-- daily_transmission_local TABLE----
INSERT INTO daily_transmission_local
VALUES (seq_daily_transmission_local.nextval, TIMESTAMP  '2020-03-11  01:00:00',1,1,126.99, '1');
INSERT INTO daily_transmission_local
VALUES (seq_daily_transmission_local.nextval, TIMESTAMP  '2020-03-11  02:00:00',2,1,164.51, '1');
INSERT INTO daily_transmission_local
VALUES (seq_daily_transmission_local.nextval, TIMESTAMP  '2020-03-11  03:00:00',3,1,121.47, '1');
INSERT INTO daily_transmission_local
VALUES (seq_daily_transmission_local.nextval, TIMESTAMP  '2020-03-11  04:00:00',4,1,192.40, '1');
INSERT INTO daily_transmission_local
VALUES (seq_daily_transmission_local.nextval, TIMESTAMP  '2020-03-11  05:00:00',5,1,104.32, '1');
INSERT INTO daily_transmission_local
VALUES (seq_daily_transmission_local.nextval, TIMESTAMP  '2020-03-11  06:00:00',6,1,109.24, '1');
INSERT INTO daily_transmission_local
VALUES (seq_daily_transmission_local.nextval, TIMESTAMP  '2020-03-11  07:00:00',7,1,188.60, '1');
INSERT INTO daily_transmission_local
VALUES (seq_daily_transmission_local.nextval, TIMESTAMP  '2020-03-11  08:00:00',8,1,141.03, '1');
INSERT INTO daily_transmission_local
VALUES (seq_daily_transmission_local.nextval, TIMESTAMP  '2020-03-11  09:00:00',9,1,110.18, '1');
INSERT INTO daily_transmission_local
VALUES (seq_daily_transmission_local.nextval, TIMESTAMP  '2020-03-11  10:00:00',10,1,178.93, '1');

-- electricity_meter TABLE---------------------------------------------------

INSERT INTO electricity_meter
VALUES (seq_electricity_meter.nextval,'AA','1', TIMESTAMP  '1990-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter
VALUES (seq_electricity_meter.nextval,'BB','1', TIMESTAMP  '1991-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter
VALUES (seq_electricity_meter.nextval,'CC','1', TIMESTAMP  '1992-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter
VALUES (seq_electricity_meter.nextval,'DD','1', TIMESTAMP  '1993-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter
VALUES (seq_electricity_meter.nextval,'EE','1', TIMESTAMP  '1994-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter
VALUES (seq_electricity_meter.nextval,'FF','1', TIMESTAMP  '1995-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter
VALUES (seq_electricity_meter.nextval,'GG','1', TIMESTAMP  '1996-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter
VALUES (seq_electricity_meter.nextval,'HH','1', TIMESTAMP  '1997-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter
VALUES (seq_electricity_meter.nextval,'II','1', TIMESTAMP  '1998-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter
VALUES (seq_electricity_meter.nextval,'JJ','1', TIMESTAMP  '1999-03-11  01:00:00',CURRENT_TIMESTAMP);

-- energy_consumed TABLE---------------------------------------------------------

INSERT INTO energy_consumed
VALUES (seq_energy_consumed.nextval, TIMESTAMP  '2020-03-11  01:00:00',1,1,126.99, '1');
INSERT INTO energy_consumed
VALUES (seq_energy_consumed.nextval, TIMESTAMP  '2020-03-11  02:00:00',2,1,164.51, '1');
INSERT INTO energy_consumed
VALUES (seq_energy_consumed.nextval, TIMESTAMP  '2020-03-11  03:00:00',3,1,121.47, '1');
INSERT INTO energy_consumed
VALUES (seq_energy_consumed.nextval, TIMESTAMP  '2020-03-11  04:00:00',4,1,192.40, '1');
INSERT INTO energy_consumed
VALUES (seq_energy_consumed.nextval, TIMESTAMP  '2020-03-11  05:00:00',5,1,104.32, '1');
INSERT INTO energy_consumed
VALUES (seq_energy_consumed.nextval, TIMESTAMP  '2020-03-11  06:00:00',6,1,109.24, '1');
INSERT INTO energy_consumed
VALUES (seq_energy_consumed.nextval, TIMESTAMP  '2020-03-11  07:00:00',7,1,188.60, '1');
INSERT INTO energy_consumed
VALUES (seq_energy_consumed.nextval, TIMESTAMP  '2020-03-11  08:00:00',8,1,141.03, '1');
INSERT INTO energy_consumed
VALUES (seq_energy_consumed.nextval, TIMESTAMP  '2020-03-11  09:00:00',9,1,110.18, '1');
INSERT INTO energy_consumed
VALUES (seq_energy_consumed.nextval, TIMESTAMP  '2020-03-11  10:00:00',10,1,178.93, '1');

-- electricity_meter_juncture TABLE-----

INSERT INTO electricity_meter_juncture
VALUES (seq_electricity_meter_juncture.nextval,1,1,1, TIMESTAMP  '2020-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter_juncture
VALUES (seq_electricity_meter_juncture.nextval,2,2,2, TIMESTAMP  '2020-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter_juncture
VALUES (seq_electricity_meter_juncture.nextval,3,3,3, TIMESTAMP  '2020-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter_juncture
VALUES (seq_electricity_meter_juncture.nextval,4,4,4, TIMESTAMP  '2020-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter_juncture
VALUES (seq_electricity_meter_juncture.nextval,5,5,5, TIMESTAMP  '2020-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter_juncture
VALUES (seq_electricity_meter_juncture.nextval,6,6,6, TIMESTAMP  '2020-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter_juncture
VALUES (seq_electricity_meter_juncture.nextval,7,7,7, TIMESTAMP  '2020-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter_juncture
VALUES (seq_electricity_meter_juncture.nextval,8,8,8, TIMESTAMP  '2020-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter_juncture
VALUES (seq_electricity_meter_juncture.nextval,9,9,9, TIMESTAMP  '2020-03-11  01:00:00',CURRENT_TIMESTAMP);
INSERT INTO electricity_meter_juncture
VALUES (seq_electricity_meter_juncture.nextval,10,10,10, TIMESTAMP  '2020-03-11  01:00:00',CURRENT_TIMESTAMP);

-- client_type TABLE--------------------------------

INSERT INTO client_type
VALUES (seq_client_type.nextval,'Business');
INSERT INTO client_type
VALUES (seq_client_type.nextval,'Corporate');
INSERT INTO client_type
VALUES (seq_client_type.nextval,'Individual');
INSERT INTO client_type
VALUES (seq_client_type.nextval,'Government');
INSERT INTO client_type
VALUES (seq_client_type.nextval,'Military');

-- client TABLE--------------------------------------

INSERT INTO client 
VALUES (seq_client.nextval,1,'B1','ABCD','ABCD','ABCD','ABCD','Warszawa Matejki 5',' +48 123456789','234567891', 'ABCD@ABCD.pl' );
INSERT INTO client
VALUES (seq_client.nextval,2,'C1','EFGH','EFGH','EFGH','EFGH','Poznañ Wyzwolenia 10',' +48 345678912','4567891231', 'EFGH@EFGH.pl');
INSERT INTO client
VALUES (seq_client.nextval,3,'I1','IJKL','IJKL','IJKL','IJKL','Kraków Artystów 15',' +48 567891234','678912345', 'IJKL@IJKL.pl');
INSERT INTO client
VALUES (seq_client.nextval,4,'G1','MNOP','MNOP','MNOP','MNOP','Wroc³aw Wosjka Polskiego 20',' +48 789123456','891234567', 'MNOP@MNOP.pl');
INSERT INTO client
VALUES (seq_client.nextval,5,'M1','RSTU','RSTU','RSTU','RSTU','Gdañsk Marynarzy 25',' +48 912345678','012345678', 'RSTU@RSTU.pl');

-- client_contract TABLE------------------------------

INSERT INTO client_contract 
VALUES (seq_client_contract.nextval,1,1,'Rozliczenie nr 1',TIMESTAMP  '2020-02-11  01:00:00',TIMESTAMP  '2020-03-11  01:00:00');
INSERT INTO client_contract 
VALUES (seq_client_contract.nextval,2,2, 'Rozliczenie nr 2',TIMESTAMP  '2020-02-11  01:00:00',TIMESTAMP  '2020-03-11  01:00:00');
INSERT INTO client_contract 
VALUES (seq_client_contract.nextval,3,3, 'Rozliczenie nr 3',TIMESTAMP  '2020-02-11  01:00:00',TIMESTAMP  '2020-03-11  01:00:00');
INSERT INTO client_contract 
VALUES (seq_client_contract.nextval,4,4,'Rozliczenie nr 4',TIMESTAMP  '2020-02-11  01:00:00',TIMESTAMP  '2020-03-11  01:00:00');
INSERT INTO client_contract 
VALUES (seq_client_contract.nextval,5,5,'Rozliczenie nr 5',TIMESTAMP  '2020-02-11  01:00:00',TIMESTAMP  '2020-03-11  01:00:00' );


























-- COMMIT --------------------------------------------------
commit;
