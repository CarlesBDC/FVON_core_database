/*
* Title: TOW_SENSORS.sql
* Author: George Maynard
* Contact: george.maynard@noaa.gov
* Date Created: 2023-07-11
* Purpose: Assigns a piece of equipment to a TOW and stores upload information
*/  

CREATE TABLE `TOW_SENSORS`(
  `TOW_SENSOR_PK` integer NOT NULL AUTO_INCREMENT COMMENT 'UID for this table',
  `TOW_PK` integer NOT NULL COMMENT 'Links this table to the TOWS table',
  `INVENTORY_PK` integer NOT NULL COMMENT 'Links this table to the EQUIPMENT_INVENTORY table',
  `UPLOAD_TIME` datetime NOT NULL COMMENT 'Timestamp (UTC) for the most recent upload from this tow / sensor combination',
  `DATAFILE` varchar(255) NOT NULL COMMENT 'Name of file uploaded',
  PRIMARY KEY (`TOW_SENSOR_PK`),
  
  CONSTRAINT fkTOW_ID
    FOREIGN KEY (`TOW_PK`)
    REFERENCES TOWS(TOW_PK),
  CONSTRAINT fkEquipID
    FOREIGN KEY (`INVENTORY_PK`)
    REFERENCES EQUIPMENT_INVENTORY(INVENTORY_PK)
)COMMENT='This table describes which instruments were used on which tows';