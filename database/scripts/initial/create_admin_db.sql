/************************************************************************/
/**************     C R E A T E  T A B L E  S         *******************/
/************************************************************************/

--
-- Table structure for table `APG_PaymentProvider`
--
CREATE TABLE `APG_PaymentProvider` (
  `ProviderID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `ProviderType` varchar(10) NOT NULL,
  `ProviderKey` varchar(50) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `IsDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProviderID`),
  UNIQUE KEY `ProviderKey_UNIQUE` (`ProviderKey`)
);

--
-- Table structure for table `APG_Partner`
--
CREATE TABLE `APG_Partner` (
  `PartnerID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PartnerKey` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `BannerURL` varchar(150) DEFAULT NULL,
  `DomainURL` text NOT NULL,
  `TransPerCardLimit` bigint(20) NOT NULL,
  `TransPerCardValue` bigint(20) NOT NULL,
  `DisplayItemDetail` tinyint(4) NOT NULL,
  `EnableGeoIP` tinyint(4) NOT NULL,
  `EnableBlacklistIP` tinyint(4) NOT NULL,
  `AllowNoIp` tinyint(4) NOT NULL,
  `AllowChangeAmount` tinyint(4) NOT NULL,
  `AllowEmailFeature` tinyint(4) NOT NULL,
  `AllowDirectLinkFeature` tinyint(4) NOT NULL,
  `AllowEmotoLastUsedCC` tinyint(4) NOT NULL,
  `OptionalEmotoCVV` tinyint(4) NOT NULL,
  `RememberCard` tinyint(4) NOT NULL,
  `PartnerUserKeyType` smallint(6) NOT NULL,
  `PVSPassword` varchar(50) NOT NULL,
  `SupportBinList` tinyint(4) NOT NULL,
  `IsDeleted` bigint(25) NOT NULL DEFAULT '0',
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PartnerID`),
  UNIQUE KEY `PartnerKey_UNIQUE` (`PartnerKey`,`IsDeleted`)
);

--
-- Table structure for table `APGADMIN_CCExpirySchedular_Settings`
--
CREATE TABLE `APGADMIN_CCExpirySchedular_Settings` (
  `SettingId` bigint(20) NOT NULL AUTO_INCREMENT,
  `EmailTemplate` text NOT NULL,
  `SenderEmailId` varchar(255) NOT NULL,
  `EmailSubject` text NOT NULL,
  `NoOfMonthsBeforeExpiry` int(11) NOT NULL,
  `NoOfEmailsPerMonth` int(11) NOT NULL,
  `DefaultReceiverEmailId` varchar(255) NOT NULL,
  `ErrorEmailSubject` text NOT NULL,
  `ErrorEmailTemplate` text NOT NULL,
  `SuccessEmailTemplate` text NOT NULL,
  `SuccessEmailSubject` text NOT NULL,
  `ExpiryType` varchar(10) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`SettingId`)
);


--
-- Table structure for table `APGADMIN_CSCEmailTemplate_Settings`
--
CREATE TABLE `APGADMIN_CSCEmailTemplate_Settings` (
  `CSCEmailTemplateSettingsId` bigint(20) NOT NULL AUTO_INCREMENT,
  `SuccessTemplate` text NOT NULL,
  `PendingTemplate` text NOT NULL,
  `FailureTemplate` text NOT NULL,
  `SuccessSubject` text NOT NULL,
  `PendingSubject` text NOT NULL,
  `FailureSubject` text NOT NULL,
  `senderEmailId` text NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CSCEmailTemplateSettingsId`)
);

--
-- Table structure for table `APG_Channel`
--
CREATE TABLE `APG_Channel` (
  `ChannelID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ChannelKey` varchar(50) NOT NULL,
  `PartnerID` bigint(20) NOT NULL,
  `PrefixTransactionID` varchar(50) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `LastModifiedUTC` datetime DEFAULT NULL,
  `DefaultProviderKey` varchar(50) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL,
  `DefaultProviderId` bigint(20) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ChannelID`),
  UNIQUE KEY `ChannelKey` (`ChannelKey`,`PartnerID`),
  KEY `PartnerID` (`PartnerID`),
  KEY `DefaultProviderId` (`DefaultProviderId`),
  CONSTRAINT `FK_CHANNEL_PID` FOREIGN KEY (`PartnerID`) REFERENCES `APG_Partner` (`PartnerID`),
  CONSTRAINT `FK_PID_CHANNEL` FOREIGN KEY (`DefaultProviderId`) REFERENCES `APG_PaymentProvider` (`ProviderID`)
);


--
-- Table structure for table `APGADMIN_Validation_Settings`
--
CREATE TABLE `APGADMIN_Validation_Settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Channel` varchar(45) NOT NULL,
  `MinAmt` int(11) NOT NULL,
  `Currency` varchar(45) NOT NULL,
  `Exp` varchar(45) NOT NULL,
  `Partner` varchar(45) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `validation_setting_channel_idx` (`Channel`),
  KEY `fk_validation_setting_partner_idx` (`Partner`),
  CONSTRAINT `fk_validation_setting_channel` FOREIGN KEY (`Channel`) REFERENCES `APG_Channel` (`ChannelKey`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_validation_setting_partner` FOREIGN KEY (`Partner`) REFERENCES `APG_Partner` (`PartnerKey`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

--
-- Table structure for table `APG_BinList`
--
CREATE TABLE `APG_BinList` (
  `BinListId` bigint(20) NOT NULL AUTO_INCREMENT,
  `BinListType` int(11) NOT NULL,
  `PartnerId` bigint(20) NOT NULL,
  `IssuingBank` varchar(150) NOT NULL,
  `CardType` varchar(10) NOT NULL,
  `CCRange` varchar(50) NOT NULL,
  `Status` int(11) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `BatchNo` varchar(100) DEFAULT NULL,
  `isDeleted` bigint(25) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`BinListId`),
  KEY `PartnerId` (`PartnerId`),
  CONSTRAINT `FK_BLPID` FOREIGN KEY (`PartnerId`) REFERENCES `APG_Partner` (`PartnerID`)
);


--
-- Table structure for table `APG_BinListTypes`
--
CREATE TABLE `APG_BinListTypes` (
  `BinListTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `BinListTypeName` varchar(256) NOT NULL,
  PRIMARY KEY (`BinListTypeId`)
);


--
-- Table structure for table `APG_BlackList_Criteria`
--
CREATE TABLE `APG_BlackList_Criteria` (
  `APG_BlackList_CriteriaID` int(11) NOT NULL AUTO_INCREMENT,
  `APG_Type_Desc` varchar(45) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`APG_BlackList_CriteriaID`)
);


--
-- Table structure for table `APG_BlacklistCards`
--
CREATE TABLE `APG_BlacklistCards` (
  `BlackListCard_Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CcInfo` varchar(20) NOT NULL,
  `BatchNo` varchar(256) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL,
  `Remarks` text,
  `CreatedDate` datetime NOT NULL,
  `isRule` tinyint(4) NOT NULL,
  `HashedCard` text NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`BlackListCard_Id`)
);


--
-- Table structure for table `APG_BlacklistPayee`
--
CREATE TABLE `APG_BlacklistPayee` (
  `APGBlacklistPayeeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ValueType` int(11) NOT NULL,
  `Value` varchar(250) NOT NULL,
  `PartnerKey` bigint(50) DEFAULT NULL,
  `LoginType` int(11) DEFAULT NULL,
  `CreatedDateUTC` bigint(20) NOT NULL,
  `LastModifiedDateUTC` bigint(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`APGBlacklistPayeeID`)
);


--
-- Table structure for table `APG_BlacklistPayeeRemarks`
--
CREATE TABLE `APG_BlacklistPayeeRemarks` (
  `RemarkID` bigint(20) NOT NULL AUTO_INCREMENT,
  `APGBlacklistPayeeID` bigint(20) NOT NULL,
  `Remarks` text NOT NULL,
  `CreatedDateUTC` bigint(20) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`RemarkID`),
  KEY `APGBlacklistPayeeID` (`APGBlacklistPayeeID`),
  CONSTRAINT `FK_BLACKLIST_PAYEE` FOREIGN KEY (`APGBlacklistPayeeID`) REFERENCES `APG_BlacklistPayee` (`APGBlacklistPayeeID`) ON DELETE CASCADE ON UPDATE CASCADE
);


--
-- Table structure for table `APG_Currency`
--
CREATE TABLE `APG_Currency` (
  `CurrencyId` int(11) NOT NULL AUTO_INCREMENT,
  `Currency` varchar(100) NOT NULL,
  `Location` varchar(1000) NOT NULL,
  `ThreeLetterISOCode` varchar(3) NOT NULL,
  `NumericISOCode` varchar(3) NOT NULL,
  `Published` tinyint(4) NOT NULL,
  `DisplayOrder` tinyint(4) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CurrencyId`)
);

--
-- Table structure for table `APG_ChannelCurrency`
--
CREATE TABLE `APG_ChannelCurrency` (
  `ChannelCurrencyID` int(11) NOT NULL AUTO_INCREMENT,
  `CurrencyID` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `ChannelID` bigint(20) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ChannelCurrencyID`),
  KEY `FH_CUID_idx` (`CurrencyID`),
  KEY `FK_CHID_idx` (`ChannelID`),
  CONSTRAINT `FH_CUID` FOREIGN KEY (`CurrencyID`) REFERENCES `APG_Currency` (`CurrencyId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CHID` FOREIGN KEY (`ChannelID`) REFERENCES `APG_Channel` (`ChannelID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


--
-- Table structure for table `APG_ChannelProvider`
--
CREATE TABLE `APG_ChannelProvider` (
  `ChannelProviderID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ChannelID` bigint(20) NOT NULL,
  `ProviderID` bigint(20) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `CardType` varchar(50) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ChannelProviderID`),
  KEY `ChannelID` (`ChannelID`,`ProviderID`),
  KEY `ProviderID` (`ProviderID`),
  CONSTRAINT `FK_PPROV_ID` FOREIGN KEY (`ProviderID`) REFERENCES `APG_PaymentProvider` (`ProviderID`) ON DELETE CASCADE,
  CONSTRAINT `FK_CHANL_ID` FOREIGN KEY (`ChannelID`) REFERENCES `APG_Channel` (`ChannelID`) ON DELETE CASCADE
);


--
-- Table structure for table `APG_ChannelProviderMetaData`
--
CREATE TABLE `APG_ChannelProviderMetaData` (
  `ItemId` bigint(20) NOT NULL AUTO_INCREMENT,
  `ParentKey` bigint(20) NOT NULL,
  `DataKey` text NOT NULL,
  `DataValue` text NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ItemId`),
  KEY `ParentKey` (`ParentKey`),
  CONSTRAINT `APG_ChannelProviderMetaData_ibfk_1` FOREIGN KEY (`ParentKey`) 
  REFERENCES `APG_ChannelProvider` (`ChannelProviderID`)
);


--
-- Table structure for table `APG_ChannelProvider_Currency`
--
CREATE TABLE `APG_ChannelProvider_Currency` (
  `ChannelProviderCurrencyID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ChannelProviderID` bigint(20) NOT NULL,
  `CurrencyID` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `MinPerTrxValue` bigint(20) NOT NULL,
  `MaxPerTrxValue` bigint(20) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ChannelProviderCurrencyID`),
  KEY `ChannelPoviderID` (`ChannelProviderID`,`CurrencyID`),
  KEY `CurrencyID` (`CurrencyID`),
  KEY `ChannelProviderID` (`ChannelProviderID`),
  CONSTRAINT `FK_CPC_CPID` FOREIGN KEY (`ChannelProviderID`) REFERENCES `APG_ChannelProvider` (`ChannelProviderID`),
  CONSTRAINT `FK_CURRNCY_ID` FOREIGN KEY (`CurrencyID`) REFERENCES `APG_Currency` (`CurrencyId`) ON DELETE CASCADE,
  CONSTRAINT `FK_CHANNL_PROV_ID` FOREIGN KEY (`ChannelProviderID`) REFERENCES `APG_ChannelProvider` (`ChannelProviderID`) ON DELETE CASCADE
);

--
-- Table structure for table `APG_TransactionType`
--
CREATE TABLE `APG_TransactionType` (
  `TransactionTypeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionType` varchar(10) NOT NULL,
  `TransactionTypeShortName` varchar(1) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`TransactionTypeID`)
);


--
-- Table structure for table `APG_Channel_TransactionType`
--
CREATE TABLE `APG_Channel_TransactionType` (
  `ChannelTransactionTypeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TransactionTypeID` bigint(20) NOT NULL,
  `ChannelID` bigint(20) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ChannelTransactionTypeID`),
  KEY `TransactionTypeID` (`TransactionTypeID`,`ChannelID`),
  KEY `ChannelID` (`ChannelID`),
  CONSTRAINT `FK_TT_TXNID` FOREIGN KEY (`TransactionTypeID`) REFERENCES `APG_TransactionType` (`TransactionTypeID`) ON DELETE CASCADE,
  CONSTRAINT `FK_CH_CHNLID` FOREIGN KEY (`ChannelID`) REFERENCES `APG_Channel` (`ChannelID`) ON DELETE CASCADE
);


--
-- Table structure for table `APG_Configuration_Service`
--
CREATE TABLE `APG_Configuration_Service` (
  `APG_Configuration_ServiceID` int(11) NOT NULL AUTO_INCREMENT,
  `Service` varchar(100) DEFAULT NULL,
  `Group_Key` varchar(1000) DEFAULT NULL,
  `Group_Key_Add` varchar(1000) DEFAULT NULL,
  `Group_Title` varchar(120) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`APG_Configuration_ServiceID`)
);

--
-- Table structure for table `APG_DownTimePeriod`
--
CREATE TABLE `APG_DownTimePeriod` (
  `PeriodID` bigint(11) NOT NULL AUTO_INCREMENT,
  `FromTimeUTC` varchar(50) NOT NULL,
  `ToTimeUTC` varchar(50) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PeriodID`)
);


--
-- TODO: UNUSED TABLE -- CAN BE REMOVED
-- Table structure for table `APG_ErrorLog`
--
-- CREATE TABLE `APG_ErrorLog` (
--   `ErrorID` int(11) NOT NULL AUTO_INCREMENT,
--   `ClassName` varchar(50) NOT NULL,
--   `MethodName` varchar(15) NOT NULL,
--   `Message` varchar(500) NOT NULL,
--   `CreatedDate` datetime NOT NULL,
--   `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
--   `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
--   PRIMARY KEY (`ErrorID`)
-- );
-- 

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
-- Table structure for table `APG_FraudCheck_Configuration`
--
CREATE TABLE `APG_FraudCheck_Configuration` (
  `APG_FraudCheck_ConfigurationID` int(11) NOT NULL AUTO_INCREMENT,
  `Service` varchar(100) NOT NULL,
  `GroupKey` varchar(60) NOT NULL,
  `ConfigKey` varchar(45) DEFAULT NULL,
  `ConfigValue` text,
  `Status` tinyint(4) NOT NULL,
  `lastExecuted` timestamp NULL DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`APG_FraudCheck_ConfigurationID`),
  UNIQUE KEY `ConfigKey_UNIQUE` (`ConfigKey`)
);


--
-- Table structure for table `APG_FraudCheck`
--
CREATE TABLE `APG_FraudCheck` (
  `transactionID` varchar(45) DEFAULT NULL,
  `partnerRefno` varchar(45) DEFAULT NULL,
  `totalAmount` double DEFAULT NULL,
  `status` int(20) DEFAULT NULL,
  `lastModifiedUTC` timestamp NULL DEFAULT NULL,
  `currencyCode` varchar(45) DEFAULT NULL,
  `paymentId` varchar(45) DEFAULT NULL,
  `transactionPaymentlastModifiedUTC` timestamp NULL DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `ipAddress` varchar(45) DEFAULT NULL,
  `remark` text,
  `createModifiedUTC` timestamp NULL DEFAULT NULL,
  `channelKey` varchar(45) DEFAULT NULL,
  `paymentProvider` varchar(45) DEFAULT NULL,
  `paymentStatus` varchar(45) DEFAULT NULL,
  `APG_FraudCheck_Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `APG_FraudCheck_ConfigurationID` int(11) DEFAULT NULL,
  `partnerKey` varchar(45) DEFAULT NULL,
  `configKey` varchar(45) DEFAULT NULL,
  `currencyExp` int(11) DEFAULT NULL,
  `MID` varchar(45) DEFAULT NULL,
  `specificType` varchar(45) DEFAULT NULL,
  `specificTypeValue` varchar(45) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`APG_FraudCheck_Id`),
  UNIQUE KEY `fraudCheckUnique` (`transactionID`,`APG_FraudCheck_ConfigurationID`),
  KEY `FK_APG_FraudCheck_Configration` (`APG_FraudCheck_ConfigurationID`),
  KEY `index_insertionTimestamp` (`insertionTimestamp`),
  KEY `index_updationTimestamp` (`updationTimestamp`),
  CONSTRAINT `FK_APG_FraudCheck_Configration` FOREIGN KEY (`APG_FraudCheck_ConfigurationID`) REFERENCES `APG_FraudCheck_Configuration` (`APG_FraudCheck_ConfigurationID`)
);

--
-- Table structure for table `APG_FraudCheck_Remarks`
--
CREATE TABLE `APG_FraudCheck_Remarks` (
  `APG_FraudCheck_Remarks_Id` bigint(11) NOT NULL AUTO_INCREMENT,
  `APG_FraudCheck_Id` bigint(20) NOT NULL,
  `Remarks` text,
  `CreatedDateUTC` timestamp NULL DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`APG_FraudCheck_Remarks_Id`),
  KEY `APG_FraudCheck_Id_idx` (`APG_FraudCheck_Id`),
  CONSTRAINT `APG_FraudCheck_Id` FOREIGN KEY (`APG_FraudCheck_Id`) REFERENCES `APG_FraudCheck` (`APG_FraudCheck_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


--
-- Table structure for table `APG_FtpDetails`
--
CREATE TABLE `APG_FtpDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `remote_folder_path` varchar(1000) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);


--
-- Table structure for table `APG_General_Configuration`
--
CREATE TABLE `APG_General_Configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Service` varchar(100) NOT NULL,
  `GroupKey` varchar(60) NOT NULL,
  `ConfigKey` varchar(45) DEFAULT NULL,
  `ConfigValue` text,
  `Status` tinyint(4) NOT NULL,
  `lastExecuted` timestamp NULL DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ConfigKey_UNIQUE` (`ConfigKey`)
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
-- Table structure for table `APG_PartnerDirectLink`
--
CREATE TABLE `APG_PartnerDirectLink` (
  `DirectID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PartnerId` bigint(20) NOT NULL,
  `DirectKey` varchar(50) NOT NULL,
  `DirectDesc` varchar(1111) CHARACTER SET utf8 NOT NULL,
  `DefaultValue` varchar(1111) CHARACTER SET utf8 NOT NULL,
  `Type` varchar(10) NOT NULL,
  `IsDefaultQuickPay` tinyint(4) NOT NULL DEFAULT '0',
  `Status` tinyint(4) NOT NULL DEFAULT '1',
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`DirectID`),
  KEY `FK_PARTNER_idx` (`PartnerId`),
  CONSTRAINT `FK_PARTNERID` FOREIGN KEY (`PartnerId`) REFERENCES `APG_Partner` (`PartnerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

--
-- Table structure for table `APG_PaymentProviderDowntime`
--
CREATE TABLE `APG_PaymentProviderDowntime` (
  `PaymentProviderDowntimeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProviderID` bigint(20) NOT NULL,
  `StartDownTimeUTC` datetime NOT NULL,
  `EndDownTimeUTC` datetime NOT NULL,
  `PlanType` int(11) NOT NULL,
  `Remarks` varchar(500) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `LastModifiedUTC` datetime NOT NULL,
  `PaymentProviderKey` varchar(45) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentProviderDowntimeID`),
  KEY `ProviderID` (`ProviderID`),
  CONSTRAINT `FK_PPDT_PID` FOREIGN KEY (`ProviderID`) REFERENCES `APG_PaymentProvider` (`ProviderID`) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table `APG_PaymentProvider_Currency`
--
CREATE TABLE `APG_PaymentProvider_Currency` (
  `ProviderID` bigint(20) NOT NULL,
  `CurrencyID` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  KEY `ProviderID` (`ProviderID`,`CurrencyID`),
  KEY `CurrencyID` (`CurrencyID`),
  CONSTRAINT `FK_PPC_CURID` FOREIGN KEY (`CurrencyID`) REFERENCES `APG_Currency` (`CurrencyId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PPC_PID` FOREIGN KEY (`ProviderID`) REFERENCES `APG_PaymentProvider` (`ProviderID`) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table `APG_PaymentRunningNumber`
--
CREATE TABLE `APG_PaymentRunningNumber` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PartnerID` bigint(20) NOT NULL,
  `PaymentPrefix` char(3) NOT NULL,
  `ResetNumber` int(2) NOT NULL,
  `RunningNumber` bigint(20) NOT NULL,
  `LastResetDateUTC` datetime NOT NULL,
  `CreatedDateUTC` datetime NOT NULL,
  `LastModifiedUTC` datetime NOT NULL,
  `IsDeleted` bigint(25) NOT NULL DEFAULT '0',
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PartnerID_UNIQUE` (`PartnerID`,`IsDeleted`),
  UNIQUE KEY `PaymentPrefix_UNIQUE` (`PaymentPrefix`,`IsDeleted`),
  KEY `FK_partner_idx` (`PartnerID`),
  CONSTRAINT `FK_partner` FOREIGN KEY (`PartnerID`) REFERENCES `APG_Partner` (`PartnerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


--
-- Table structure for table `APG_Permission`
--
CREATE TABLE `APG_Permission` (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(45) NOT NULL,
  `operation` varchar(20) NOT NULL,
  `permission_key` varchar(60) NOT NULL,
  `partner_permission` tinyint(4) NOT NULL,
  `ui_display` tinyint(4) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`permission_id`)
);

--
-- Table structure for table `APG_Roles`
--
CREATE TABLE `APG_Roles` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  `role_key` varchar(45) NOT NULL,
  `partner_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`),
  KEY `FK_PARTNER_idx` (`partner_id`),
  CONSTRAINT `FK_ROLE_PARTNER` FOREIGN KEY (`partner_id`) REFERENCES `APG_Partner` (`PartnerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

--
-- Table structure for table `APG_Role_Permission`
--
CREATE TABLE `APG_Role_Permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_ROLES_idx` (`role_id`),
  KEY `FK_PERMISSION_idx` (`permission_id`),
  CONSTRAINT `FK_PERMISSION` FOREIGN KEY (`permission_id`) REFERENCES `APG_Permission` (`permission_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ROLES` FOREIGN KEY (`role_id`) REFERENCES `APG_Roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

--
-- Table structure for table `APG_Users`
--
CREATE TABLE `APG_Users` (
  `user_id` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`)
);


--
-- Table structure for table `APG_User_Role`
--
CREATE TABLE `APG_User_Role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_ROLE_idx` (`role_id`),
  KEY `FK_USER_idx` (`user_id`),
  CONSTRAINT `FK_ROLE` FOREIGN KEY (`role_id`) REFERENCES `APG_Roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_USER` FOREIGN KEY (`user_id`) REFERENCES `APG_Users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


--
-- Table structure for table `APG_WebAdmin_Configuration`
--
CREATE TABLE `APG_WebAdmin_Configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(100) DEFAULT NULL,
  `groupKey` varchar(60) DEFAULT NULL,
  `configKey` varchar(45) DEFAULT NULL,
  `configValue` text,
  `status` tinyint(4) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);


--
-- Table structure for table `APG_Web_Configuration`
--
CREATE TABLE `APG_Web_Configuration` (
  `APG_Web_ConfigurationID` int(11) NOT NULL AUTO_INCREMENT,
  `Service` varchar(100) NOT NULL,
  `GroupKey` varchar(60) NOT NULL,
  `ConfigKey` varchar(45) DEFAULT NULL,
  `ConfigValue` text,
  `Status` tinyint(4) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`APG_Web_ConfigurationID`),
  UNIQUE KEY `GroupKey` (`GroupKey`,`ConfigKey`)
);

--
-- Table structure for table `FPX_BankList`
--
CREATE TABLE `FPX_BankList` (
  `FpxBankID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FpxBankCode` varchar(20) NOT NULL,
  `FpxBankName` text NOT NULL,
  `FpxBankDisplayName` text NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`FpxBankID`)
);


--
-- Table structure for table `PVS_Function`
--
CREATE TABLE `PVS_Function` (
  `FunctionID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FunctionKey` varchar(50) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`FunctionID`)
);


--
-- Table structure for table `PVS_Group`
--
CREATE TABLE `PVS_Group` (
  `GroupID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`GroupID`)
);


--
-- Table structure for table `PVS_GroupFunction`
--
CREATE TABLE `PVS_GroupFunction` (
  `GroupID` bigint(20) NOT NULL,
  `FunctionID` bigint(20) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  KEY `GroupID` (`GroupID`,`FunctionID`),
  KEY `FunctionID` (`FunctionID`),
  CONSTRAINT `FK_GF_FID` FOREIGN KEY (`FunctionID`) REFERENCES `PVS_Function` (`FunctionID`),
  CONSTRAINT `FK_GF_GID` FOREIGN KEY (`GroupID`) REFERENCES `PVS_Group` (`GroupID`)
);


--
-- Table structure for table `PVS_PartnerFunction`
--
CREATE TABLE `PVS_PartnerFunction` (
  `FunctionID` bigint(20) NOT NULL,
  `PartnerID` bigint(20) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  KEY `FunctionID` (`FunctionID`,`PartnerID`),
  KEY `PartnerID` (`PartnerID`),
  CONSTRAINT `FK_PF_FID` FOREIGN KEY (`FunctionID`) REFERENCES `PVS_Function` (`FunctionID`),
  CONSTRAINT `FK_PF_PID` FOREIGN KEY (`PartnerID`) REFERENCES `APG_Partner` (`PartnerID`)
);


--
-- Table structure for table `PVS_PartnerGroup`
--
CREATE TABLE `PVS_PartnerGroup` (
  `GroupID` bigint(20) NOT NULL,
  `PartnerID` bigint(20) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  KEY `GroupID` (`GroupID`,`PartnerID`),
  KEY `PartnerID` (`PartnerID`),
  CONSTRAINT `FK_PG_GID` FOREIGN KEY (`GroupID`) REFERENCES `PVS_Group` (`GroupID`),
  CONSTRAINT `FK_PG_PID` FOREIGN KEY (`PartnerID`) REFERENCES `APG_Partner` (`PartnerID`)
);