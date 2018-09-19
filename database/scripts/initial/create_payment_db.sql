/************************************************************************/
/**************     C R E A T E  T A B L E  S         *******************/
/************************************************************************/

--
-- Table structure for table `APG_FailedSubmitTransaction`
--
CREATE TABLE `APG_FailedSubmitTransaction` (
  `FailedID` int(11) NOT NULL,
  `transactionrefid` varchar(45) NOT NULL,
  PRIMARY KEY (`FailedID`)
);

--
-- Table structure for table `CC_ExpiryDate`
--
CREATE TABLE `CC_ExpiryDate` (
  `UniqueId` varchar(50) NOT NULL,
  `CCDataKey` varchar(50) NOT NULL,
  `ExpiryMonth` varchar(50) DEFAULT NULL,
  `ExpiryYear` varchar(50) DEFAULT NULL,
  `LastModifiedDateUTC` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`CCDataKey`),
  UNIQUE KEY `UniqueId` (`UniqueId`)
);


--
-- Table structure for table `CC_ExpirySchedular`
--
CREATE TABLE `CC_ExpirySchedular` (
  `CCExpirySchedularId` bigint(20) NOT NULL AUTO_INCREMENT,
  `EmailLink` text NOT NULL,
  `CCDataKey` varchar(20) NOT NULL,
  `ExpiryTimestamp` bigint(20) NOT NULL,
  `CreatedTimestamp` bigint(20) NOT NULL,
  `ExpiryType` varchar(10) NOT NULL,
  `recipient` varchar(45) DEFAULT NULL,
  `Status` varchar(20) NOT NULL DEFAULT 'pending',
  `Remarks` text,
  PRIMARY KEY (`CCExpirySchedularId`)
);

--
-- Table structure for table `CC_FavCards_Temp`
--
CREATE TABLE `CC_FavCards_Temp` (
  `CCDataKey` varchar(50) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ExpiryMonth` varchar(50) DEFAULT NULL,
  `ExpiryYear` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

--
-- Table structure for table `CC_Name`
--
CREATE TABLE `CC_Name` (
  `UniqueId` varchar(50) DEFAULT NULL,
  `CCDataKey` varchar(50) NOT NULL,
  `CCName` varchar(250) DEFAULT NULL,
  `LastUsedOn` varchar(50) DEFAULT NULL,
  `LoginUserId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CCDataKey`),
  UNIQUE KEY `UniqueId` (`UniqueId`),
  KEY `idx_CC_Name_LoginUserId` (`LoginUserId`)
);


--
-- Table structure for table `CC_PANNumber`
--
CREATE TABLE `CC_PANNumber` (
  `UniqueId` varchar(50) NOT NULL,
  `CCDatakey` varchar(50) NOT NULL,
  `CCNo` varchar(250) DEFAULT NULL,
  `CreatedDateUTC` datetime(3) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  PRIMARY KEY (`CCDatakey`),
  UNIQUE KEY `UniqueId` (`UniqueId`),
  KEY `idx_CC_PANNumber_Status` (`Status`)
);


--
-- Table structure for table `CC_Payment`
--
CREATE TABLE `CC_Payment` (
  `PaymentID` bigint(20) NOT NULL,
  `PartnerKey` varchar(50) NOT NULL,
  `PAN` varchar(250) NOT NULL,
  `CurrencyCode` varchar(20) NOT NULL,
  `CurrencyExp` int(11) NOT NULL,
  `Amount` bigint(20) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `PaymentRefId` varchar(20) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `PAN` (`PAN`),
  KEY `PaymentRefId` (`PaymentRefId`)
);


--
-- Table structure for table `CC_SubscriptionExpiryDate`
--
CREATE TABLE `CC_SubscriptionExpiryDate` (
  `CCDataKey` varchar(50) NOT NULL,
  `ExpiryMonth` varchar(10) NOT NULL,
  `ExpiryYear` varchar(10) NOT NULL,
  `LastModifiedDateUTC` datetime NOT NULL,
  PRIMARY KEY (`CCDataKey`)
);


--
-- Table structure for table `CC_SubscriptionName`
--
CREATE TABLE `CC_SubscriptionName` (
  `CCDataKey` varchar(50) CHARACTER SET latin1 NOT NULL,
  `CCName` varchar(250) CHARACTER SET latin1 NOT NULL,
  `LoginUserId` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `UniqueId` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `LastModifiedDateUTC` datetime NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  PRIMARY KEY (`CCDataKey`)
);


--
-- Table structure for table `CC_SubscriptionPANNumber`
--
CREATE TABLE `CC_SubscriptionPANNumber` (
  `CCDataKey` varchar(50) NOT NULL,
  `CCPANNO` varchar(250) NOT NULL,
  `LastModifiedDateUTC` datetime NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  PRIMARY KEY (`CCDataKey`)
);


--
-- Table structure for table `Dynamic_Pay_Request`
--
CREATE TABLE `Dynamic_Pay_Request` (
  `Dynamic_Pay_Request_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `directKey` varchar(45) NOT NULL,
  `partnerPassword` varchar(45) NOT NULL,
  `astroAccNo` varchar(45) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `expiryDate` varchar(45) DEFAULT NULL,
  `customerName` varchar(45) DEFAULT NULL,
  `dueDate` varchar(45) DEFAULT NULL,
  `isValid` tinyint(4) NOT NULL,
  `Timestamp` bigint(20) NOT NULL,
  `encryptedString` varchar(256) NOT NULL,
  PRIMARY KEY (`Dynamic_Pay_Request_ID`),
  KEY `encryptedString` (`encryptedString`)
);


--
-- Table structure for table `TransactionTimer`
--
CREATE TABLE `TransactionTimer` (
  `TransactionTimerId` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionRefId` varchar(256) NOT NULL,
  `CurrentTs` bigint(20) NOT NULL,
  `Status` int(11) DEFAULT '0',
  PRIMARY KEY (`TransactionTimerId`),
  UNIQUE KEY `TransactionRefId` (`TransactionRefId`),
  KEY `TransactionRefId_2` (`TransactionRefId`)
);


--
-- Table structure for table `USER_TOKEN_MAPPING`
--
CREATE TABLE `USER_TOKEN_MAPPING` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) DEFAULT NULL,
  `token` varchar(45) NOT NULL,
  `partnerkey` varchar(45) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `backurl` text,
  `createdateutc` datetime DEFAULT NULL,
  `lastmodifieddate` datetime DEFAULT NULL,
  `expirydate` datetime DEFAULT NULL,
  `transactionid` varchar(45) DEFAULT NULL,
  `recurringtype` varchar(10) DEFAULT NULL,
  `tokenType` varchar(25) DEFAULT NULL,
  `ccdatakey` varchar(50) DEFAULT NULL,
  `PaymentID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

/************************************************************************/
/*****************     C R E A T E  V I E W S         *******************/
/************************************************************************/
CREATE VIEW `CC_FavCards`  AS  
  SELECT `CC_PANNumber`.`CCNo` AS `CCNo`,
    `CC_PANNumber`.`CreatedDateUTC` AS `CreatedDateUTC`,
    `CC_Name`.`CCName` AS `CCName`,`CC_Name`.
    `LoginUserId` AS `LoginUserId`,`CC_PANNumber`.
    `UniqueId` AS `UniqueId`,`CC_ExpiryDate`.
    `ExpiryMonth` AS `ExpiryMonth`,
    `CC_ExpiryDate`.`ExpiryYear` AS `ExpiryYear`,
    `CC_PANNumber`.`CCDatakey` AS `CCDataKey`,
    `CC_PANNumber`.`Status` AS `Status`,
    `CC_Name`.`LastUsedOn` AS `LastUsedOn` 
      FROM ((`CC_PANNumber` JOIN `CC_Name`) JOIN `CC_ExpiryDate`) 
      WHERE ((convert(`CC_PANNumber`.`CCDatakey` using utf8) = convert(`CC_ExpiryDate`.`CCDataKey` using utf8)) 
      AND (convert(`CC_Name`.`CCDataKey` using utf8)  = convert(`CC_ExpiryDate`.`CCDataKey` using utf8))) 
      ORDER BY `CC_PANNumber`.`CCDatakey` ;


CREATE VIEW `CC_Details`  AS  
  SELECT `CC_SubscriptionPANNumber`.`CCPANNO` AS `CCNo`,
    `CC_SubscriptionPANNumber`.`CreatedDateUTC` AS 
    `CreatedDateUTC`,`CC_SubscriptionName`.`CCName` AS `CCName`,
    `CC_SubscriptionName`.`LoginUserId` AS `LoginUserId`,
    `CC_SubscriptionName`.`UniqueId` AS `UniqueId`,
    `CC_SubscriptionExpiryDate`.`ExpiryMonth` AS `ExpiryMonth`,
    `CC_SubscriptionExpiryDate`.`ExpiryYear` AS `ExpiryYear`,
    `CC_SubscriptionPANNumber`.`CCDataKey` AS `CCDataKey` 
      FROM ((`CC_SubscriptionPANNumber` JOIN `CC_SubscriptionName`) JOIN `CC_SubscriptionExpiryDate`) 
      WHERE ((`CC_SubscriptionPANNumber`.`CCDataKey` = `CC_SubscriptionExpiryDate`.`CCDataKey`) 
        AND (convert(`CC_SubscriptionName`.`CCDataKey` using utf8) = `CC_SubscriptionExpiryDate`.`CCDataKey`)) 
      ORDER BY `CC_SubscriptionPANNumber`.`CCDataKey` ;