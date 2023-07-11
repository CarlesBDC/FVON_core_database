/*
* Title: HARDWARE_ADDRESSES.sql
* Author: George Maynard
* Contact: george.maynard@noaa.gov
* Date Created: 2023-07-11 
* Purpose: This table tracks hardware addresses (MAC, IMEI, etc.) for equipment 
*   recorded in the EQUIPMENT_INVENTORY table
*/  

CREATE TABLE `HARDWARE_ADDRESSES` (
  `HARDWARE_PK` integer NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier used in this database only',
  `INVENTORY_PK` integer COMMENT 'Foreign key from EQUIPMENT_INVENTORY',
  `ADDRESS_TYPE` varchar(50) COMMENT 'Type of address (e.g., MAC, IMEI)',
  `HARDWARE_ADDRESS` varchar(100) COMMENT 'The actual address',
  
  PRIMARY KEY (`HARDWARE_PK`),
  
  CONSTRAINT fk_InventoryID
    FOREIGN KEY (`INVENTORY_PK`) 
      REFERENCES EQUIPMENT_INVENTORY(INVENTORY_PK)
) COMMENT='This table stores information about hardware addressess assigned to particular sensors or other items in the equipment inventory. They are recorded separately because they can change if equipment is refurbished by the manufacturer and some pieces of equipment may have multiple addresses.';