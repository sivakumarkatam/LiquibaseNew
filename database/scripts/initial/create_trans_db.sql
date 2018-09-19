/************************************************************************/
/**************     C R E A T E  T A B L E  S         *******************/
/************************************************************************/

--
-- Table structure for table `APG_Transaction`
--
CREATE TABLE `APG_Transaction` (
  `TransactionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `partnerKey` varchar(50) NOT NULL,
  `partnerrefno` varchar(50) DEFAULT NULL,
  `transtype` varchar(10) DEFAULT NULL,
  `paymenttype` varchar(20) DEFAULT NULL,
  `paymentsource` varchar(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `currencycode` varchar(20) DEFAULT NULL,
  `currencyexp` int(11) DEFAULT NULL,
  `shippingamount` bigint(11) DEFAULT NULL,
  `taxamount` bigint(11) DEFAULT NULL,
  `itemtotalamount` bigint(11) DEFAULT NULL,
  `totalamount` bigint(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `transactionrefid` varchar(50) DEFAULT NULL,
  `responseURL` varchar(250) DEFAULT NULL,
  `createdateutc` datetime DEFAULT NULL,
  `LastModifiedUTC` datetime DEFAULT NULL,
  `ChannelKey` varchar(50) DEFAULT NULL,
  `isepp` tinyint(1) DEFAULT NULL,
  `AgentID` varchar(250) DEFAULT NULL,
  `isValidation` tinyint(1) NOT NULL DEFAULT '0',
  `isDirectLink` tinyint(1) DEFAULT NULL,
  `isQuickPayCSC` tinyint(1) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TransactionID`),
  KEY `partnerrefno` (`partnerrefno`),
  KEY `transactionrefid` (`transactionrefid`),
  KEY `partnerkey_transref` (`partnerKey`,`transactionrefid`),
  KEY `partnerref_partnerkey` (`partnerrefno`,`partnerKey`),
  KEY `channelkey` (`ChannelKey`),
  KEY `lastModifiedUTC` (`LastModifiedUTC`),
  KEY `createdDateUTC` (`createdateutc`),
  KEY `status` (`status`),
  KEY `transType` (`transtype`)
);

--
-- Table structure for table `APG_AdditionalCharges`
--
CREATE TABLE `APG_AdditionalCharges` (
  `AdditionalChargesID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionID` bigint(20) NOT NULL,
  `ChargesKey` varchar(100) NOT NULL,
  `ChargesValue` varchar(100) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`AdditionalChargesID`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `FK_AC_TID` FOREIGN KEY (`TransactionID`) REFERENCES `APG_Transaction` (`TransactionID`)
);

--
-- Table structure for table `APG_ErrorLog`
--
CREATE TABLE `APG_ErrorLog` (
  `ErrorID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(50) NOT NULL,
  `MethodName` varchar(15) NOT NULL,
  `Message` varchar(500) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ErrorID`)
);

--
-- Table structure for table `APG_FPX_Bank_Codes`
--
CREATE TABLE `APG_FPX_Bank_Codes` (
  `APGFPXBankCodesID` int(11) NOT NULL AUTO_INCREMENT,
  `Response_Code` varchar(45) NOT NULL,
  `Response_Description` varchar(120) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`APGFPXBankCodesID`)
);

--
-- Table structure for table `APG_MBB_CASA_Bank_Codes`
--
CREATE TABLE `APG_MBB_CASA_Bank_Codes` (
  `APGMBBCASABankCodesID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Response_Code` varchar(45) NOT NULL,
  `Response_Description` varchar(45) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`APGMBBCASABankCodesID`)
);

--
-- Table structure for table `APG_PBB_Bank_Codes`
--
CREATE TABLE `APG_PBB_Bank_Codes` (
  `APGPBBBankCodesID` int(11) NOT NULL AUTO_INCREMENT,
  `Reason_Code` varchar(45) NOT NULL,
  `Reason_Description` varchar(120) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`APGPBBBankCodesID`)
);

--
-- Table structure for table `APG_PaymentInfo_CTB`
--
CREATE TABLE `APG_PaymentInfo_CTB` (
  `PaymentInfoCTBID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentID` bigint(20) NOT NULL,
  `CitibankRefID` varchar(20) DEFAULT NULL,
  `CCName` varchar(100) NOT NULL,
  `CCDataKey` varchar(45) DEFAULT NULL,
  `CCDisplay` varchar(45) NOT NULL,
  `expirymonth` varchar(45) NOT NULL,
  `expiryyear` varchar(45) NOT NULL,
  `submitinfo` varchar(500) DEFAULT NULL,
  `ccType` varchar(45) NOT NULL,
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentInfoCTBID`),
  KEY `paymentId` (`PaymentID`)
);

--
-- Table structure for table `APG_PaymentInfo_FPX`
--
CREATE TABLE `APG_PaymentInfo_FPX` (
  `PaymentInfoFPXID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentID` bigint(20) NOT NULL,
  `FPXRefID` varchar(20) DEFAULT NULL,
  `SubmitInfo` varchar(250) DEFAULT NULL,
  `CCType` varchar(10) DEFAULT NULL,
  `BuyerBankID` varchar(25) DEFAULT NULL,
  `BuyerBankName` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentInfoFPXID`),
  KEY `paymentID` (`PaymentID`)
);

--
-- Table structure for table `APG_PaymentInfo_PBB`
--
CREATE TABLE `APG_PaymentInfo_PBB` (
  `PaymentInfoPBBID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentID` bigint(20) NOT NULL,
  `PBBRefID` varchar(20) DEFAULT NULL,
  `CCName` varchar(100) NOT NULL,
  `CCDataKey` varchar(45) DEFAULT NULL,
  `CCDisplay` varchar(45) NOT NULL,
  `expirymonth` varchar(10) NOT NULL,
  `expiryyear` varchar(10) NOT NULL,
  `submitinfo` varchar(45) DEFAULT NULL,
  `ccType` varchar(45) NOT NULL,
  `createdDate` timestamp NULL DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentInfoPBBID`),
  KEY `PaymentID` (`PaymentID`)
);

--
-- Table structure for table `APG_Recurring`
--
CREATE TABLE `APG_Recurring` (
  `RecurringID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CyclePeriod` varchar(10) NOT NULL,
  `CycleDuration` int(11) NOT NULL,
  `NextChargeDateUTC` datetime NOT NULL,
  `InitialAmount` bigint(20) NOT NULL,
  `ChargeAmount` bigint(20) NOT NULL,
  `CurrencyCode` varchar(20) NOT NULL,
  `CurrencyExp` smallint(6) NOT NULL,
  `NotificationURL` varchar(350) NOT NULL,
  `TransactionID` bigint(20) NOT NULL,
  `CCDataKey` varchar(20) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `LastRecurringDateUTC` datetime NOT NULL,
  `CreatedDateUTC` datetime DEFAULT CURRENT_TIMESTAMP,
  `InQueue` int(11) NOT NULL,
  `RetryCount` int(11) DEFAULT '0',
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`RecurringID`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `FK_RECURRING_TID` FOREIGN KEY (`TransactionID`) REFERENCES `APG_Transaction` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE
);


--
-- Table structure for table `APG_ReversalQueue`
--
CREATE TABLE `APG_ReversalQueue` (
  `QueueId` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentRefId` varchar(50) NOT NULL,
  `Status` int(11) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `LastModifiedUTC` datetime DEFAULT NULL,
  `errorCode` varchar(45) DEFAULT NULL,
  `errorDescription` varchar(120) DEFAULT NULL,
  `ReversedAmount` varchar(45) DEFAULT NULL,
  `PaymentID` bigint(20) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`QueueId`)
);

--
-- Table structure for table `APG_TransactionDiscountInfo`
--
CREATE TABLE `APG_TransactionDiscountInfo` (
  `DiscountInfoID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionID` bigint(20) NOT NULL,
  `BankName` text NOT NULL,
  `ccType` text NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`DiscountInfoID`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `FK_Transaction_TID` FOREIGN KEY (`TransactionID`) REFERENCES `APG_Transaction` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table `APG_TransactionExtraData`
--
CREATE TABLE `APG_TransactionExtraData` (
  `ExtraDataID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ParentKey` bigint(20) NOT NULL,
  `DataKey` varchar(50) NOT NULL,
  `DataValue` varchar(2000) NOT NULL,
  PRIMARY KEY (`ExtraDataID`),
  KEY `ParentKey` (`ParentKey`),
  KEY `DataKey` (`DataKey`)
);

--
-- Table structure for table `APG_TransactionItem`
--
CREATE TABLE `APG_TransactionItem` (
  `TransactionItemID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionID` bigint(20) DEFAULT NULL,
  `PartnerItemRef` varchar(50) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` smallint(6) DEFAULT NULL,
  `UnitPrice` bigint(20) DEFAULT NULL,
  `SortOrder` int(11) DEFAULT NULL,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TransactionItemID`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `FK_TI_TID` FOREIGN KEY (`TransactionID`) REFERENCES `APG_Transaction` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table `APG_TransactionLog`
--
CREATE TABLE `APG_TransactionLog` (
  `TransactionLogID` bigint(20) NOT NULL DEFAULT '0',
  `TransactionId` bigint(20) DEFAULT NULL,
  `LogDateUTC` datetime DEFAULT NULL,
  `LogTitle` varchar(50) DEFAULT NULL,
  `LogData` varchar(1000) DEFAULT NULL,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TransactionLogID`),
  KEY `TransactionId` (`TransactionId`),
  CONSTRAINT `APG_TransactionLog_ibfk_1` FOREIGN KEY (`TransactionId`) REFERENCES `APG_Transaction` (`TransactionID`)
);

--
-- Table structure for table `APG_TransactionMetaData`
--
CREATE TABLE `APG_TransactionMetaData` (
  `ItemID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ParentKey` varchar(50) NOT NULL,
  `DataKey` varchar(50) NOT NULL,
  `DataValue` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ItemID`),
  KEY `parentkey` (`ParentKey`),
  KEY `dataKey` (`DataKey`),
  KEY `dataValue` (`DataValue`(255))
);

--
-- Table structure for table `APG_TransactionPayment`
--
CREATE TABLE `APG_TransactionPayment` (
  `PaymentID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionID` bigint(20) NOT NULL,
  `PaymentRefID` varchar(20) NOT NULL,
  `PaymentType` varchar(20) NOT NULL,
  `PaymentProviderKey` varchar(20) NOT NULL,
  `Amount` text NOT NULL,
  `Status` int(11) NOT NULL,
  `errorcode` text,
  `errordesc` text,
  `createddateutc` datetime NOT NULL,
  `LastModifiedUTC` datetime DEFAULT NULL,
  `RetryCount` int(11) NOT NULL,
  `TransType` varchar(10) NOT NULL,
  `BankApprovalCode` varchar(100) DEFAULT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `CCValidation` tinyint(4) NOT NULL,
  `CardReplacement` tinyint(4) NOT NULL,
  `MID` varchar(100) NOT NULL,
  `Bank` varchar(100) NOT NULL,
  `FavCardDataKey` varchar(20) DEFAULT NULL,
  `ipAddress` text,
  `userAgent` text,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentID`),
  UNIQUE KEY `PaymentRefID_UNIQUE` (`PaymentRefID`),
  KEY `TransactionID` (`TransactionID`),
  KEY `PaymentRefID` (`PaymentRefID`),
  KEY `createdDateUTC` (`createddateutc`),
  KEY `paymentProvider` (`PaymentProviderKey`),
  KEY `paymentType` (`PaymentType`),
  KEY `lastmodifiedutc` (`LastModifiedUTC`),
  CONSTRAINT `FK_TID` FOREIGN KEY (`TransactionID`) REFERENCES `APG_Transaction` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table `APG_TransactionPaymentRefund`
--
CREATE TABLE `APG_TransactionPaymentRefund` (
  `APGTransactionPaymentRefundID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentID` bigint(20) NOT NULL,
  `ErrorCode` varchar(100) DEFAULT NULL,
  `ErrorDescription` text,
  `CreatedDateUTC` datetime NOT NULL,
  `Status` int(11) NOT NULL,
  `RefundedAmount` varchar(25) NOT NULL,
  `RefundedDateUTC` datetime DEFAULT NULL,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`APGTransactionPaymentRefundID`),
  KEY `PaymentID` (`PaymentID`),
  CONSTRAINT `FK_TPRID_PID` FOREIGN KEY (`PaymentID`) REFERENCES `APG_TransactionPayment` (`PaymentID`) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table `APG_TransactionPaymentReverse`
--
CREATE TABLE `APG_TransactionPaymentReverse` (
  `APGTransactionPaymentReverseID` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentID` bigint(20) NOT NULL,
  `ErrorCode` varchar(45) DEFAULT NULL,
  `ErrorDescription` varchar(45) DEFAULT NULL,
  `APG_TransactionPaymentReversecol` varchar(45) DEFAULT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `Status` int(11) NOT NULL,
  `ReversedAmount` bigint(20) NOT NULL,
  `ReversedDateUTC` datetime DEFAULT NULL,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`APGTransactionPaymentReverseID`),
  KEY `FK_TPREV_ID_idx` (`PaymentID`),
  CONSTRAINT `FK_TPREV_ID` FOREIGN KEY (`PaymentID`) REFERENCES `APG_TransactionPayment` (`PaymentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


--
-- Table structure for table `APG_TransactionUser`
--
CREATE TABLE `APG_TransactionUser` (
  `TransactionUserID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionID` bigint(20) NOT NULL,
  `PartnerUserKey` varchar(50) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `LoginSessionID` varchar(256) DEFAULT NULL,
  `LoginUserID` varchar(256) DEFAULT NULL,
  `LoginType` int(11) DEFAULT NULL,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TransactionUserID`),
  KEY `TransactionID` (`TransactionID`),
  KEY `PartnerUserKey` (`PartnerUserKey`),
  CONSTRAINT `FK_TU_TID` FOREIGN KEY (`TransactionID`) REFERENCES `APG_Transaction` (`TransactionID`) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table `APG_Transaction_EPPInfo`
--
CREATE TABLE `APG_Transaction_EPPInfo` (
  `EppInfoID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionID` bigint(20) NOT NULL,
  `PlanCode` varchar(50) NOT NULL,
  `MonthTerms` int(11) NOT NULL,
  `ChannelProviderId` bigint(20) NOT NULL,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`EppInfoID`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `FK_EPP_TID` FOREIGN KEY (`TransactionID`) REFERENCES `APG_Transaction` (`TransactionID`)
);

/**********************************************************************
Check for this table usage -- this looks like a replica of AdminDB.APG_User_Role
***********************************************************************/
-- --
-- -- Table structure for table `APG_User_Role`
-- --
-- CREATE TABLE `APG_User_Role` (
--   `id` bigint(20) NOT NULL AUTO_INCREMENT,
--   `user_id` varchar(50) NOT NULL,
--   `role_id` bigint(20) NOT NULL,
--   `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
--   `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
--   PRIMARY KEY (`id`),
--   KEY `FK_ROLE_idx` (`role_id`),
--   KEY `FK_USER_idx` (`user_id`),
--   CONSTRAINT `FK_ROLE` FOREIGN KEY (`role_id`) REFERENCES `APG_Roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
--   CONSTRAINT `FK_USER` FOREIGN KEY (`user_id`) REFERENCES `APG_Users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
-- );


--
-- Table structure for table `APG_paymentInfo_MBB`
--
CREATE TABLE `APG_paymentInfo_MBB` (
  `PaymentInfoMBBID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentID` bigint(20) NOT NULL,
  `MBBRefID` varchar(20) DEFAULT NULL,
  `CCName` varchar(100) DEFAULT NULL,
  `CCDataKey` varchar(20) DEFAULT NULL,
  `CCDisplay` varchar(20) DEFAULT NULL,
  `ExpiryMonth` varchar(10) DEFAULT NULL,
  `ExpiryYear` varchar(10) DEFAULT NULL,
  `SubmitInfo` varchar(255) DEFAULT NULL,
  `CCType` varchar(50) NOT NULL,
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentInfoMBBID`),
  KEY `PaymentID` (`PaymentID`),
  CONSTRAINT `FK_PIMBB_PID` FOREIGN KEY (`PaymentID`) REFERENCES `APG_TransactionPayment` (`PaymentID`) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table `Ewallet_Transaction`
--
CREATE TABLE `Ewallet_Transaction` (
  `walletsrno` int(11) NOT NULL AUTO_INCREMENT,
  `transactionrefid` varchar(50) DEFAULT NULL,
  `createdat` mediumtext,
  `expiredat` mediumtext,
  `walletrefid` varchar(50) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `portaluserId` varchar(50) DEFAULT NULL,
  `emailcounter` int(11) DEFAULT NULL,
  `errordesc` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`walletsrno`)
);

--
-- Table structure for table `FPX_BankList`
--
CREATE TABLE `FPX_BankList` (
  `FpxBankID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FpxBankCode` varchar(20) NOT NULL,
  `FpxBankName` text NOT NULL,
  `FpxBankDisplayName` text NOT NULL,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`FpxBankID`)
);

--
-- Table structure for table `FavCard_PendingEditCCToken`
--
CREATE TABLE `FavCard_PendingEditCCToken` (
  `TokenId` varchar(50) NOT NULL,
  `TransactionId` bigint(20) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `PartnerUserKey` varchar(50) DEFAULT NULL,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TokenId`)
);



/*************************************************************************************/
/******** C R E A T E  P A R T N E R  M I G R A T I O N  T A B L E S  ****************/
/*************************************************************************************/
--
-- Table structure for table `APG_PaymentInfo_CTBBkup`
--
CREATE TABLE `APG_PaymentInfo_CTBBkup` (
  `PaymentInfoCTBID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentID` varchar(200) NOT NULL,
  `CitibankRefID` varchar(20) DEFAULT NULL,
  `CCName` varchar(100) NOT NULL,
  `CCDataKey` varchar(45) DEFAULT NULL,
  `CCDisplay` varchar(45) NOT NULL,
  `expirymonth` varchar(45) NOT NULL,
  `expiryyear` varchar(45) NOT NULL,
  `submitinfo` varchar(500) DEFAULT NULL,
  `ccType` varchar(45) NOT NULL,
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentInfoCTBID`),
  KEY `FK_PICTB_PID_idx` (`PaymentID`)
);

--
-- Table structure for table `APG_PaymentInfo_FPXBkup`
--
CREATE TABLE `APG_PaymentInfo_FPXBkup` (
  `PaymentInfoFPXID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentID` varchar(200) NOT NULL,
  `FPXRefID` varchar(20) DEFAULT NULL,
  `SubmitInfo` varchar(500) DEFAULT NULL,
  `CCType` varchar(10) DEFAULT NULL,
  `BuyerBankID` varchar(25) DEFAULT NULL,
  `BuyerBankName` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentInfoFPXID`)
);

--
-- Table structure for table `APG_PaymentInfo_PBBBkup`
--
CREATE TABLE `APG_PaymentInfo_PBBBkup` (
  `PaymentInfoPBBID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentID` varchar(200) NOT NULL,
  `PBBRefID` varchar(20) DEFAULT NULL,
  `CCName` varchar(100) NOT NULL,
  `CCDataKey` varchar(45) DEFAULT NULL,
  `CCDisplay` varchar(45) NOT NULL,
  `expirymonth` varchar(10) NOT NULL,
  `expiryyear` varchar(10) NOT NULL,
  `submitinfo` varchar(500) DEFAULT NULL,
  `ccType` varchar(45) NOT NULL,
  `createdDate` timestamp NULL DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentInfoPBBID`)
);

--
-- Table structure for table `APG_ReversalQueueBkup`
--
CREATE TABLE `APG_ReversalQueueBkup` (
  `QueueId` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentRefId` varchar(50) NOT NULL,
  `Status` int(11) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `LastModifiedUTC` datetime DEFAULT NULL,
  `errorCode` varchar(45) DEFAULT NULL,
  `errorDescription` varchar(120) DEFAULT NULL,
  `ReversedAmount` varchar(45) DEFAULT NULL,
  `PaymentID` bigint(20) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`QueueId`)
);


--
-- Table structure for table `APG_TransactionBkup`
--
CREATE TABLE `APG_TransactionBkup` (
  `TransactionIDNew` bigint(20) NOT NULL AUTO_INCREMENT,
  `partnerKey` varchar(50) NOT NULL,
  `partnerrefno` varchar(50) DEFAULT NULL,
  `transtype` varchar(10) DEFAULT NULL,
  `paymenttype` varchar(20) DEFAULT NULL,
  `paymentsource` varchar(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `currencycode` varchar(20) DEFAULT NULL,
  `currencyexp` int(11) DEFAULT NULL,
  `shippingamount` bigint(11) DEFAULT NULL,
  `taxamount` bigint(11) DEFAULT NULL,
  `itemtotalamount` bigint(11) DEFAULT NULL,
  `totalamount` bigint(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `transactionrefid` varchar(50) DEFAULT NULL,
  `responseURL` varchar(250) DEFAULT NULL,
  `createdateutc` datetime DEFAULT NULL,
  `LastModifiedUTC` datetime DEFAULT NULL,
  `ChannelKey` varchar(50) DEFAULT NULL,
  `isepp` tinyint(1) DEFAULT NULL,
  `AgentID` varchar(250) DEFAULT NULL,
  `isValidation` tinyint(1) NOT NULL DEFAULT '0',
  `isDirectLink` tinyint(1) DEFAULT NULL,
  `isQuickPayCSC` tinyint(1) DEFAULT NULL,
  `TransactionID` varchar(200) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TransactionIDNew`),
  KEY `status` (`status`),
  KEY `lastModifiedUTC` (`LastModifiedUTC`),
  KEY `TransactionId` (`TransactionID`)
); 


--
-- Table structure for table `APG_TransactionItemBkup`
--
CREATE TABLE `APG_TransactionItemBkup` (
  `TransactionItemID` varchar(200) NOT NULL,
  `TransactionID` varchar(200) DEFAULT NULL,
  `PartnerItemRef` varchar(50) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` smallint(6) DEFAULT NULL,
  `UnitPrice` bigint(20) DEFAULT NULL,
  `SortOrder` int(11) DEFAULT NULL,
  `TransactionItemIDNew` bigint(20) NOT NULL AUTO_INCREMENT,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TransactionItemIDNew`),
  KEY `TransactionID` (`TransactionID`)
);


--
-- Table structure for table `APG_TransactionPaymentBkup`
--
CREATE TABLE `APG_TransactionPaymentBkup` (
  `PaymentIDNew` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionID` varchar(200) NOT NULL,
  `PaymentRefID` varchar(20) NOT NULL,
  `PaymentType` varchar(20) NOT NULL,
  `PaymentProviderKey` varchar(20) NOT NULL,
  `Amount` text NOT NULL,
  `Status` int(11) NOT NULL,
  `errorcode` varchar(100) DEFAULT NULL,
  `errordesc` text,
  `createdateutc` datetime NOT NULL,
  `LastModifiedUTC` datetime DEFAULT NULL,
  `RetryCount` int(11) NOT NULL,
  `TransType` varchar(10) NOT NULL,
  `BankApprovalCode` varchar(100) DEFAULT NULL,
  `ApprovalDate` datetime DEFAULT NULL,
  `CCValidation` tinyint(4) NOT NULL,
  `CardReplacement` tinyint(4) NOT NULL,
  `MID` varchar(100) NOT NULL,
  `Bank` varchar(100) NOT NULL,
  `FavCardDataKey` varchar(20) DEFAULT NULL,
  `ipAddress` text,
  `userAgent` text,
  `PaymentID` varchar(200) DEFAULT NULL,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentIDNew`),
  KEY `TransactionID` (`TransactionID`),
  KEY `PaymentID` (`PaymentID`)
);

--
-- Table structure for table `APG_TransactionPaymentRefundBkup`
--
CREATE TABLE `APG_TransactionPaymentRefundBkup` (
  `APGTransactionPaymentRefundIDNew` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentID` varchar(200) NOT NULL,
  `ErrorCode` varchar(100) DEFAULT NULL,
  `ErrorDescription` text,
  `CreatedDateUTC` datetime NOT NULL,
  `Status` int(11) NOT NULL,
  `RefundedAmount` varchar(25) NOT NULL,
  `RefundedDateUTC` datetime DEFAULT NULL,
  `APGTransactionPaymentRefundID` varchar(200) DEFAULT NULL,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`APGTransactionPaymentRefundIDNew`),
  KEY `PaymentID` (`PaymentID`)
);

--
-- Table structure for table `APG_TransactionUserBkup`
--
CREATE TABLE `APG_TransactionUserBkup` (
  `TransactionUserID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionID` varchar(200) NOT NULL,
  `PartnerUserKey` varchar(50) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `LoginSessionID` varchar(256) DEFAULT NULL,
  `LoginUserID` varchar(256) DEFAULT NULL,
  `LoginType` int(11) DEFAULT NULL,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TransactionUserID`),
  KEY `TransactionID` (`TransactionID`)
);

--
-- Table structure for table `APG_Transaction_EPPInfoBkup`
--
CREATE TABLE `APG_Transaction_EPPInfoBkup` (
  `TransactionID` varchar(200) NOT NULL,
  `PlanCode` varchar(50) NOT NULL,
  `MonthTerms` int(11) NOT NULL,
  `ChannelProviderId` bigint(20) NOT NULL,
  `EppInfoIDNew` bigint(20) NOT NULL AUTO_INCREMENT,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`EppInfoIDNew`),
  KEY `TransactionID` (`TransactionID`)
);

--
-- Table structure for table `APG_paymentInfo_MBBBkup`
--
CREATE TABLE `APG_paymentInfo_MBBBkup` (
  `PaymentInfoMBBID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PaymentID` varchar(200) NOT NULL,
  `MBBRefID` varchar(20) DEFAULT NULL,
  `CCName` varchar(100) DEFAULT NULL,
  `CCDataKey` varchar(20) DEFAULT NULL,
  `CCDisplay` varchar(20) DEFAULT NULL,
  `ExpiryMonth` varchar(10) DEFAULT NULL,
  `ExpiryYear` varchar(10) DEFAULT NULL,
  `SubmitInfo` varchar(500) DEFAULT NULL,
  `CCType` varchar(50) NOT NULL,
  `createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `insertionTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentInfoMBBID`),
  KEY `PaymentID` (`PaymentID`)
);