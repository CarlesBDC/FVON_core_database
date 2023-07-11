/*
* Title: TOW_ENV.sql
* Author: George Maynard
* Contact: george.maynard@noaa.gov
* Date Created: 2023-07-11
* Purpose: Stores environmental variables measured at a point using an instrument
*/  

CREATE TABLE `TOW_ENV`(
  `TOW_ENV_PK` integer NOT NULL AUTO_INCREMENT COMMENT 'UID for this table',
  `TOW_SENSOR_PK` integer NOT NULL COMMENT 'Links to a record in the TOW_SENSORS table to assign an observation to an instrument',
  `TOW_POINTS_PK` integer NOT NULL COMMENT 'Links to a record in the TOW_POINTS table to assign an observation to a point in space and time',
  `TR_VALUE` decimal(10,5) NOT NULL COMMENT 'Observed value of a parameter at a given time and location',
  `TR_PARAMETER` set('TEMP','DEPTH','DO','PH','SPEED','DIR','N_VELO','E_VELO','YAW','PITCH','ROLL','HEADING','TILT_FROM_VERT','TURBIDITY','CONDUCTIVITY') NOT NULL COMMENT "Parameters that can be measured",
  `TR_UOM` set('degree_C','m','%','mg L-1','pH','m s-1','degrees','FTU','S m-1') NOT NULL COMMENT "CF_standards compliant units of measure parameter values are recorded in",
  
  PRIMARY KEY (`TOW_ENV_PK`),
  
  CONSTRAINT fk_towPOINTS
    FOREIGN KEY (`TOW_POINTS_PK`)
    REFERENCES TOW_POINTS(TOW_POINTS_PK),
  CONSTRAINT fk_towSENSORS
    FOREIGN KEY (`TOW_SENSOR_PK`)
    REFERENCES TOW_SENSORS(TOW_SENSOR_PK)
)COMMENT='This table stores raw data collected from loggers';
