/*
* Title: TOW_POINTS.sql
* Author: George Maynard
* Contact: george.maynard@noaa.gov
* Date Created: 2023-07-11
* Purpose: Stores location and timestamps of data collection
*/  

CREATE TABLE `TOW_POINTS`(
  `TOW_POINTS_PK` integer NOT NULL AUTO_INCREMENT COMMENT 'UID for this table',
  `TOW_PK` integer NOT NULL COMMENT 'Links to a record in the TOWS table',
  `TIMESTAMP` datetime NOT NULL COMMENT 'yyyy-mm-dd HH:MM:SS When the data point was collected (UTC)',
  `LATITUDE` decimal(10,5) NOT NULL COMMENT 'Latitude (decimal degrees) at which the data point was collected',
  `LONGITUDE` decimal(10,5) NOT NULL COMMENT 'Longitude (decimal degrees) at which the data point was collected',
  
  PRIMARY KEY (`TOW_POINTS_PK`),
  
  CONSTRAINT fk_towID2
    FOREIGN KEY (`TOW_PK`)
    REFERENCES TOWS(TOW_PK)
)COMMENT='This table stores point data (lat/lon/time) where environmental data were collected';
