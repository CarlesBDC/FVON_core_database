/*
* Title:EQUIPMENT_CHANGE.sql
* Author: George Maynard
* Contact: george.maynard@noaa.gov
* Date Created: 2023-07-11
* Purpose: This table tracks equipment installations and removals from vessels.
*/  

CREATE TABLE `EQUIPMENT_CHANGE`(
  `EQUIPMENT_CHANGE_PK` integer NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier used in this database only',
  `INVENTORY_PK_REMOVED` integer COMMENT 'The piece of equipment initially on the vessel. NULL if new install.',
  `INVENTORY_PK_INSTALLED` integer COMMENT 'The piece of equipment newly installed on the vessel. NULL if equipment removed without a replacement installation.',
  `VISIT_PK` integer COMMENT 'Visit PK number for when the install / removal / swap occurred',
  
  PRIMARY KEY (`EQUIPMENT_CHANGE_PK`),
  
  CONSTRAINT fk_invStart
  FOREIGN KEY (`INVENTORY_PK_REMOVED`) 
    REFERENCES EQUIPMENT_INVENTORY(INVENTORY_PK),
  CONSTRAINT fk_invEnd
  FOREIGN KEY (`INVENTORY_PK_INSTALLED`)
    REFERENCES EQUIPMENT_INVENTORY(INVENTORY_PK),
  CONSTRAINT fk_changeVisit
  FOREIGN KEY (`VISIT_PK`)
    REFERENCES VESSEL_VISIT_LOG(VISIT_PK)
) COMMENT='This table tracks equipment installations, change outs, and removals from vessels.'