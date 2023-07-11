/*
* Title: EQUIPMENT_INVENTORY.sql
* Author: George Maynard
* Contact: george.maynard@noaa.gov
* Date Created: 2023-07-11
* Purpose: This script creates the equipment inventory to store information 
*   about deckboxes, sensors, and any other equipment to be tracked. This is the
*   most basic and flexible version of the table that doesn't require any 
*   optional supporting tables. 
*/  
CREATE TABLE `EQUIPMENT_INVENTORY` (
  `INVENTORY_PK` integer NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier used in this database only',
  `SERIAL_NUMBER` varchar(50) NOT NULL COMMENT 'The serial number of the hardware',
  `EQUIPMENT_TYPE` set('LOGGER','DECK_BOX') NOT NULL COMMENT 'The broad category of equipment this item falls into. The core database should have at least "LOGGER" and "DECK_BOX" but can be customized to add other categories.',
  `MAKE` varchar(50) NOT NULL COMMENT 'Equipment manufacturer',
  `MODEL` varchar(50) NOT NULL COMMENT 'Model number or other identifier from manufacturer',
  `SOFTWARE_VERSION` varchar(50) COMMENT 'Software version if applicable, else NULL',
  `FIRMWARE_VERSION` varchar(50) COMMENT 'Firmware version if applicable, else NULL',
  `CURRENT_LOCATION` set('LAB','VESSEL','MANUFACTURER','LOST','DECOMMISSIONED') NOT NULL COMMENT 'Where the equipment is currently located',
  `CONTACT_PK` integer COMMENT 'CONTACT_PK of person who has possession of the equipment',
  `FUNDING_SOURCE` integer COMMENT 'How the initial purchase of the equipment was funded. This can be left NULL.',
  `PURCHASE_DATE` datetime COMMENT 'When the equipment was purchased. This can be left NULL.',
  `PURCHASE_PRICE_USD` integer COMMENT 'The initial cost of the device in local currency. This can be left NULL.',
  
  PRIMARY KEY (`INVENTORY_PK`),

  CONSTRAINT fk_Custodian 
    FOREIGN KEY (`CONTACT_PK`)
      REFERENCES CONTACTS(CONTACT_PK)
) COMMENT='This table stores information regarding the current disposition of equipment managed by the program';