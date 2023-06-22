/*
* Title: PORTS.sql
* Author: George Maynard
* Contact: george.maynard@noaa.gov
* Date Created: 2023-06-22
* Purpose: This script creates the optional PORTS table to store metadata about
*   fishing ports. It was based on the Fishing Vessel Trip Report Ports table at
*   NOAA's Northeast Fisheries Science Center. 
*/  
CREATE TABLE `PORTS`
(
  `PORT_PK` integer NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier used in this database only',
  `FVTR_PORT` varchar(6) COMMENT 'A port code from FVTR.FVTR_PORTS to make it interoperable with other NOAA systems',
  `PORT_NAME` varchar(60) COMMENT 'Human readable name of port', 
  `STATE_POSTAL` varchar(2) COMMENT 'State or Province where port is located',
  `LATITUDE` decimal(10,5) COMMENT 'Port latitude in decimal degrees.',
  `LONGITUDE` decimal(10,5) COMMENT 'Port longitude in decimal degrees.',
  `REGION` set('Region 1','Region 2') COMMENT 'Administrative regions of the program. These should be defined by the database administrator.',

  PRIMARY KEY (`PORT_PK`)
) COMMENT='optional PORTS table to store metadata about fishing ports. It was based on the Fishing Vessel Trip Report Ports table at NOAAs Northeast Fisheries Science Center.';