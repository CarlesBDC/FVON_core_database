/*
* Title: VESSEL_VISIT_LOG_fk_ports.sql
* Author: George Maynard
* Contact: george.maynard@noaa.gov
* Date Created: 2023-07-11
* Purpose: This table records visits to vessels for servicing or installation of 
*   environmental monitoring systems. It relies on a foreign key from the PORTS
*   table to track where the visit took place. 
*/  
CREATE TABLE `VESSEL_VISIT_LOG`(
  `VISIT_PK` integer NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier used in this database only',
  `VESSEL_PK` integer NOT NULL COMMENT 'References VESSELS.VESSEL_PK and describes which vessel was visited.',
  `VISIT_DATE` datetime NOT NULL COMMENT 'The date when the vessel was visited (yyyy-mm-dd HH:MM:SS, UTC Time).',
  `CONTACT_PK` integer NOT NULL COMMENT 'Who was the senior technician on site during the visit? References CONTACTS.CONTACT_PK',
  `PORT_PK` integer NOT NULL COMMENT 'Where the visit took place. References PORTS.PORT_PK',
  `VISIT_NOTES` text COMMENT 'Any additional notes about the visit',
  
  PRIMARY KEY (`VISIT_PK`),
  
  CONSTRAINT fk_VisitVesselPK
  FOREIGN KEY (`VESSEL_PK`) 
    REFERENCES VESSELS(VESSEL_PK),
  CONSTRAINT fk_VisitPort
  FOREIGN KEY (`PORT_PK`) 
    REFERENCES PORTS(PORT_PK),
  CONSTRAINT fk_LeadTech
  FOREIGN KEY (`LEAD_TECH`)
    REFERENCES CONTACTS(CONTACT_ID)  
) COMMENT='This table records visits of technicians to ports to service or install new systems.';