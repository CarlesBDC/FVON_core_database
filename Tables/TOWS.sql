/*
* Title: TOWS.sql
* Author: George Maynard
* Contact: george.maynard@noaa.gov
* Date Created: 2023-07-11
* Purpose: Assigns each TOW to a VESSEL
*/  
CREATE TABLE `TOWS`(
  `TOW_ID` integer NOT NULL AUTO_INCREMENT COMMENT 'UID for this table',
  `VESSEL_PK` integer NOT NULL COMMENT 'Ties tow or haul data to vessel table',
  
  PRIMARY KEY (`TOW_PK`),
  
  CONSTRAINT fk_vesID
    FOREIGN KEY (`VESSEL_PK`)
      REFERENCES VESSELS(VESSEL_PK)
)COMMENT='This table stores vessel assignments for individual tows or hauls of fishing gear. Tow and haul are used to mean the same thing, although in common parlance, "tows" are taken with mobile gear and "hauls" are made with fixed gear.';