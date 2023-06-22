/*
* Title: CONTACTS.sql
* Author: George Maynard
* Contact: george.maynard@noaa.gov
* Date Created: 2023-06-22
* Purpose: This script creates the optional FVON data table "CONTACTS" which 
*   allows program managers to store contact information for program affiliates.
*/  
CREATE TABLE `CONTACTS` (
  `CONTACT_PK` integer NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier used in this database only',
  `FIRST_NAME` varchar(100) NOT NULL COMMENT 'Given name of contact',
  `LAST_NAME` varchar(100) NOT NULL COMMENT 'Surname of contact',
  `PHONE` varchar(10) COMMENT 'Phone number in format xxxxxxxxxx',
  `EMAIL` varchar(50) COMMENT 'Email address',
  `PREFERRED_CONTACT` SET('CALL_PHONE','TXT_PHONE','EMAIL','MAIL','NO CONTACT') COMMENT 'Preferred method of contact',
  `STREET_1` varchar(100) COMMENT 'Street address line 1',
  `STREET_2` varchar(100) COMMENT 'Street address line 2 (if applicable)',
  `CITY` varchar(50) COMMENT 'City of addressee',
  `STATE_POSTAL` varchar(2) COMMENT 'Two character abbreviation of state or province used by postal service',
  `ZIP` varchar(10) COMMENT 'Postal code, 5 characters for USA and 6 for Canada',
  `ROLE` set('ACTIVE_SUPPORT','ACTIVE_INDUSTRY','ACTIVE_ADMIN','INACTIVE','DATA_USER') NOT NULL COMMENT 'A way of categorizing contacts',
  
  PRIMARY KEY (`CONTACT_ID`)
  
) COMMENT='This table stores contact information for program participants and support staff';