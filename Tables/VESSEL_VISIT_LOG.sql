/*
* Title: VESSEL_VISIT_LOG.sql
* Author: George Maynard
* Contact: george.maynard@noaa.gov
* Date Created: 2023-07-11
* Purpose: This table records visits to vessels for servicing or installation of 
*   environmental monitoring systems. This version of the table does not enforce
*   standardized port reporting, so the port field is varchar. 
*/  
CREATE TABLE `VESSEL_VISIT_LOG`(
  `VISIT_PK` integer NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier used in this database only',
  `VESSEL_PK` integer NOT NULL COMMENT 'References VESSELS.VESSEL_PK and describes which vessel was visited.',
  `VISIT_DATE` datetime NOT NULL COMMENT 'The date when the vessel was visited (yyyy-mm-dd HH:MM:SS, UTC Time).',
  `CONTACT_PK` integer NOT NULL COMMENT 'Who was the senior technician on site during the visit? References CONTACTS.CONTACT_PK',
  `PORT` varchar(50) COMMENT 'Where the visit took place or leave NULL',
  `VISIT_NOTES` text COMMENT 'Any additional notes about the visit',
  
  PRIMARY KEY (`VISIT_PK`),
  
  CONSTRAINT fk_VisitVesselPK
  FOREIGN KEY (`VESSEL_PK`) 
    REFERENCES VESSELS(VESSEL_PK),
  CONSTRAINT fk_ContactPK
  FOREIGN KEY (`CONTACT_PK`)
    REFERENCES CONTACTS(CONTACT_PK)
) COMMENT='This table records visits of technicians to ports to service or install new systems.';