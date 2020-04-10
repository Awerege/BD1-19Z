


-- KASOWANIE TABEL
DROP TABLE owner CASCADE CONSTRAINTS;
DROP TABLE power_plant_owner CASCADE CONSTRAINTS;
DROP TABLE power_plant CASCADE CONSTRAINTS;
DROP TABLE power_plant_type CASCADE CONSTRAINTS;
DROP TABLE daily_cost CASCADE CONSTRAINTS;
DROP TABLE daily_production CASCADE CONSTRAINTS;
DROP TABLE production_unit CASCADE CONSTRAINTS;
DROP TABLE cost_type CASCADE CONSTRAINTS;
DROP TABLE cost_unit CASCADE CONSTRAINTS;
DROP TABLE power_plant_juncture CASCADE CONSTRAINTS;
DROP TABLE transmission_line CASCADE CONSTRAINTS;
DROP TABLE transmission_local_line_unit CASCADE CONSTRAINTS;
DROP TABLE substation_juncture CASCADE CONSTRAINTS;
DROP TABLE transmission_substation CASCADE CONSTRAINTS;
DROP TABLE daily_transmission CASCADE CONSTRAINTS;
DROP TABLE transmission_substation_type CASCADE CONSTRAINTS;
DROP TABLE transmission_local_production_unit CASCADE CONSTRAINTS;
DROP TABLE local_grid_juncture CASCADE CONSTRAINTS;
DROP TABLE local_line CASCADE CONSTRAINTS;
DROP TABLE local_substation CASCADE CONSTRAINTS;
DROP TABLE local_substation_type CASCADE CONSTRAINTS;
DROP TABLE electricity_meter_juncture CASCADE CONSTRAINTS;
DROP TABLE daily_transmission_local CASCADE CONSTRAINTS;
DROP TABLE energy_consumed CASCADE CONSTRAINTS;
DROP TABLE electricity_meter CASCADE CONSTRAINTS;
DROP TABLE client_contract CASCADE CONSTRAINTS;
DROP TABLE client CASCADE CONSTRAINTS;
DROP TABLE client_type CASCADE CONSTRAINTS;









-- KASOWANIE SEKWENCJI
DROP SEQUENCE seq_owner ;
DROP SEQUENCE seq_power_plant_owner ;
DROP SEQUENCE seq_power_plant ;
DROP SEQUENCE seq_power_plant_type ;
DROP SEQUENCE seq_daily_cost ;
DROP SEQUENCE seq_daily_production ;
DROP SEQUENCE seq_production_unit ;
DROP SEQUENCE seq_cost_type ;
DROP SEQUENCE seq_cost_unit ;
DROP SEQUENCE seq_power_plant_juncture ;
DROP SEQUENCE seq_transmission_line ;
DROP SEQUENCE seq_transmission_local_line_unit ;
DROP SEQUENCE seq_substation_juncture ;
DROP SEQUENCE seq_transmission_substation ;
DROP SEQUENCE seq_daily_transmission ;
DROP SEQUENCE seq_transmission_substation_type ;
DROP SEQUENCE seq_transmission_local_production_unit ;
DROP SEQUENCE seq_local_grid_juncture ;
DROP SEQUENCE seq_local_line ;
DROP SEQUENCE seq_local_line_unit ;
DROP SEQUENCE seq_local_substation ;
DROP SEQUENCE seq_local_substation_type ;
DROP SEQUENCE seq_electricity_meter_juncture ;
DROP SEQUENCE seq_daily_transmission_local ;
DROP SEQUENCE seq_energy_consumed ;
DROP SEQUENCE seq_electricity_meter ;
DROP SEQUENCE seq_client_contract ;
DROP SEQUENCE seq_client ;
DROP SEQUENCE seq_client_type ;


--KASOWANIE TRIGGERÓW/PROCEDUR
DROP PROCEDURE CLIENT_POP;
DROP PROCEDURE DAILY_COST_POP;
DROP PROCEDURE POWER_PLANT_OWNER_POP;
DROP PROCEDURE POWER_PLANT_POP;
commit;