/*
* Title: VESSELS_fk_ports.sql
* Author: George Maynard
* Contact: george.maynard@noaa.gov
* Date Created: 2023-06-22
* Purpose: This script creates a vessels table for the FVON core database that 
*   relies on foreign keys from a PORTS table. The contact fields are deployed 
*   as varchars, so no external contacts table is necessary. 
*/  
CREATE TABLE `VESSELS` (
  `VESSEL_PK` integer NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier used in this database only',
  `VESSEL_NAME` varchar(50) NOT NULL COMMENT 'This field is not unique and should not be used exclusively to identify vessels',
  `PORT_PK` integer NOT NULL COMMENT 'This field references PORTS.PORT_PK',
  `OWNER` varchar(50) COMMENT 'This field identifies the owner of a vessel',
  `OPERATOR` varchar(50) COMMENT 'This field identifies the operator of a vessel',
  `PRIMARY_CONTACT` varchar(50) COMMENT 'This field identifies the best contact person for a vessel which could be the owner, the operator, or a fleet manager, Study Fleet tech, etc.',
  `TECHNICAL_CONTACT` varchar(50) COMMENT 'This field identifies the best tech support person for a vessel which could be the owner, the operator, or a fleet manager, Study Fleet tech, etc.',
  `GEAR_TYPES` set('FIXED','MOBILE','DRIFTING') NOT NULL COMMENT 'This field describes the types of gear fished on board the vessel and supports the selection of multiple gear types. FIXED gear is defined as any gear that is deployed from the vessel and anchored in place (e.g., pots, fixed gillnets, fixed longlines, purse seines). MOBILE gear is defined as any gear that is deployed from the vessel and towed along with the vessel (e.g., dredges, trawls). DRIFTING gear is defined as gear that is deployed from the vessel and left to drift autonomously (e.g. drifting longlines or drifting gillnets).'
  `PRIMARY_FISHERY` varchar(50) COMMENT 'The primary fishery prosecuted by the vessel',
  `HULL_NUMBER` varchar(30) COMMENT 'The vessel number issued by the federal or state government',
  
  PRIMARY KEY (`VESSEL_PK`),
  
  CONSTRAINT fk_Port
  FOREIGN KEY (`PORT`) 
    REFERENCES PORTS(PORTS_PK)
) COMMENT='This table stores information about vessels involved in the program, who owns and operates them, where they are based, and what fisheries they participate in.';