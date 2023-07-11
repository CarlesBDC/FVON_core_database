/*
* Title: FUNDING.sql
* Author: George Maynard
* Contact: george.maynard@noaa.gov
* Date Created: 2023-07-11
* Purpose: Option table to track funding sources. 
*/  

CREATE TABLE `FUNDING` (
  `FUNDING_PK` integer NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier used in this database only',
  `FUNDING_AGENCY` varchar(50) NOT NULL COMMENT 'Human readable identifier of funding agency',
  `START_DATE` datetime COMMENT 'When the funding becomes available',
  `END_DATE` datetime COMMENT 'When the funding should be used by',
  `FUNDING_AMOUNT_USD` integer NOT NULL COMMENT 'How much funding was received (in local currency)',
  `PROPOSAL_LINK` varchar(255) COMMENT 'link to funding proposal if necessary',
  
  PRIMARY KEY (`FUNDING_PK`)
) COMMENT='This table stores information that will assist in tracking how the program is funded';