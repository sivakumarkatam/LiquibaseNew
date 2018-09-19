/************************************************************************/
/**************     C R E A T E  T A B L E  S         *******************/
/************************************************************************/

--
-- Table structure for table `APG_Payflow_Partner`
--
CREATE TABLE `APG_Payflow_Partner` (
  `partner_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `partner_key` varchar(45) NOT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `partner_config` text,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`partner_id`),
  UNIQUE KEY `partner_key_UNIQUE` (`partner_key`),
  KEY `IX_APG_Payflow_Partner_partner_key` (`partner_key`)
);


--
-- Table structure for table `APG_Users`
--
CREATE TABLE `APG_Users` (
  `user_name` varchar(100) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_name`),
  KEY `IX_APG_Users_user_name` (`user_name`)
);


--
-- Table structure for table `Email_Template`
--
CREATE TABLE `Email_Template` (
  `template_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_title` text,
  `email_template` text,
  `isInvoice` tinyint(4) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`template_id`)
);


--
-- Table structure for table `Invoice_Template`
--
CREATE TABLE `Invoice_Template` (
  `template_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoice_path` varchar(80) DEFAULT NULL,
  `invoice_template` text,
  `invoice_item_template` text,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`template_id`)
);

--
-- Table structure for table `MSC_Payment`
--
CREATE TABLE `MSC_Payment` (
  `PaymentID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PartnerID` bigint(20) DEFAULT NULL,
  `ReversalTransactionID` varchar(50) DEFAULT NULL,
  `bankClientRefID` varchar(50) DEFAULT NULL,
  `billAcctNum` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `transDate` datetime DEFAULT NULL,
  `tellerID` varchar(50) DEFAULT NULL,
  `branchID` varchar(50) DEFAULT NULL,
  `ReversalTransDate` datetime DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `wsCallStartDate` datetime DEFAULT NULL,
  `wsCallEndDate` datetime DEFAULT NULL,
  `ActivityType` varchar(10) DEFAULT NULL,
  `PaymentMethod` varchar(10) DEFAULT NULL,
  `PaymentSource` varchar(100) DEFAULT NULL,
  `CreditCardNumber` varchar(30) DEFAULT NULL,
  `CreditCardExpiryDate` varchar(15) DEFAULT NULL,
  `CreditCardType` varchar(10) DEFAULT NULL,
  `Channel` varchar(50) DEFAULT NULL,
  `partnerUserKey` varchar(50) DEFAULT NULL,
  `PaymentRefID` varchar(50) DEFAULT NULL,
  `messageId` bigint(20) DEFAULT NULL,
  `retryCount` bigint(20) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `rpnPartnerKey` varchar(50) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentID`),
  KEY `IX_MSC_Payment_bankClientRefID` (`bankClientRefID`),
  KEY `IX_MSC_Payment_PartnerID` (`PartnerID`),
  KEY `IX_MSC_Payment_lastModifiedDate` (`lastModifiedDate`),
  KEY `IX_MSC_Payment_status` (`status`)
);


--
-- Table structure for table `Payflow_AmdocsMessage`
--
CREATE TABLE `Payflow_AmdocsMessage` (
  `MessageID` bigint(20) NOT NULL,
  `ReceiveDate` datetime NOT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `EventKey` varchar(20) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `LastModifiedDate` datetime NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MessageID`),
  KEY `IX_Payflow_AmdocsMessage_TransactionID` (`TransactionID`),
  KEY `IX_Payflow_AmdocsMessage_MessageID` (`MessageID`),
  KEY `IX_Payflow_AmdocsMessage_LastModifiedDate` (`LastModifiedDate`)
);


--
-- Table structure for table `Payflow_AmdocsRetryQueue`
--
CREATE TABLE `Payflow_AmdocsRetryQueue` (
  `ErrorID` int(11) NOT NULL AUTO_INCREMENT,
  `MessageID` bigint(20) DEFAULT NULL,
  `CreateDate` datetime NOT NULL,
  `RetryDate` datetime DEFAULT NULL,
  `RetryCount` int(11) NOT NULL,
  `RequestBody` text NOT NULL,
  `Host` varchar(225) DEFAULT NULL,
  `Path` varchar(45) NOT NULL,
  `Method` varchar(45) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ErrorID`),
  KEY `IX_Payflow_AmdocsRetryQueue_MessageID` (`MessageID`)
);


--
-- Table structure for table `Payflow_BillingCycle`
--
CREATE TABLE `Payflow_BillingCycle` (
  `RecurringID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MessageID` bigint(20) DEFAULT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `StartDate` varchar(50) NOT NULL,
  `EndDate` varchar(50) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `IsGracePeriod` tinyint(4) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`RecurringID`),
  KEY `IX_Payflow_BillingCycle_TransactionID` (`TransactionID`),
  KEY `IX_Payflow_BillingCycle_MessageID` (`MessageID`)
);


--
-- Table structure for table `Payflow_DESLog`
--
CREATE TABLE `Payflow_DESLog` (
  `DesId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Created` datetime NOT NULL,
  `TransactionID` varchar(45) NOT NULL,
  `MessageID` bigint(20) DEFAULT NULL,
  `StartDate` varchar(25) DEFAULT NULL,
  `EndDate` varchar(25) DEFAULT NULL,
  `Status` varchar(10) NOT NULL,
  `RequestBody` text NOT NULL,
  `ResponseBody` text NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`DesId`),
  KEY `IX_Payflow_DESLog_TransactionID` (`TransactionID`),
  KEY `IX_Payflow_DESLog_StartDate` (`StartDate`),
  KEY `IX_Payflow_DESLog_EndDate` (`EndDate`),
  KEY `IX_Payflow_DESLog_MessageID` (`MessageID`)
);


--
-- Table structure for table `Payflow_DESMessage`
--
CREATE TABLE `Payflow_DESMessage` (
  `MessageID` bigint(20) NOT NULL,
  `ReceiveDate` datetime NOT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `EventKey` varchar(20) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MessageID`),
  KEY `IX_Payflow_DESMessage_TransactionID` (`TransactionID`),
  KEY `IX_Payflow_DESMessage_ReceiveDate` (`ReceiveDate`),
  KEY `IX_Payflow_DESMessage_EventKey` (`EventKey`)
);

--
-- Table structure for table `Payflow_DESRetryQueue`
--
CREATE TABLE `Payflow_DESRetryQueue` (
  `ErrorID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MessageID` bigint(20) DEFAULT NULL,
  `RetryDate` datetime NOT NULL,
  `RetryCount` int(11) NOT NULL,
  `Host` varchar(225) DEFAULT NULL,
  `Path` varchar(45) DEFAULT NULL,
  `ErrorHours` int(11) DEFAULT NULL,
  `PartnerID` bigint(20) DEFAULT NULL,
  `TransactionRefId` varchar(45) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ErrorID`),
  KEY `IX_Payflow_DESRetryQueue_MessageID` (`MessageID`),
  KEY `IX_Payflow_DESRetryQueue_TransactionRefId` (`TransactionRefId`),
  KEY `IX_Payflow_DESRetryQueue_RetryDate` (`RetryDate`)
);


--
-- Table structure for table `Payflow_DashboardMessage`
--
CREATE TABLE `Payflow_DashboardMessage` (
  `MessageID` bigint(20) NOT NULL,
  `ReceiveDate` datetime NOT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `EventKey` varchar(20) NOT NULL,
  `MessageBody` text NOT NULL,
  `Status` varchar(10) NOT NULL,
  `LastModifiedDate` datetime NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MessageID`),
  KEY `IX_Payflow_DashboardMessage_Status` (`Status`),
  KEY `IX_Payflow_DashboardMessage_MessageID` (`MessageID`),
  KEY `IX_Payflow_DashboardMessage_LastModifiedDate` (`LastModifiedDate`)
);


--
-- Table structure for table `Payflow_DashboardMessageQueue`
--
CREATE TABLE `Payflow_DashboardMessageQueue` (
  `MessageID` bigint(20) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `RetryDate` datetime NOT NULL,
  `RetryCount` int(11) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MessageID`)
);


--
-- Table structure for table `Payflow_DashboardRetryQueue`
--
CREATE TABLE `Payflow_DashboardRetryQueue` (
  `ErrorID` int(11) NOT NULL AUTO_INCREMENT,
  `MessageID` bigint(20) DEFAULT NULL,
  `CreateDate` datetime NOT NULL,
  `RetryDate` datetime DEFAULT NULL,
  `RetryCount` int(11) NOT NULL,
  `RequestBody` text NOT NULL,
  `Host` varchar(225) DEFAULT NULL,
  `Path` varchar(45) NOT NULL,
  `Method` varchar(45) NOT NULL,
  `Reason` text,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ErrorID`),
  KEY `IX_Payflow_DashboardRetryQueue_MessageID` (`MessageID`)
);


--
-- Table structure for table `Payflow_EwalletMessage`
--
CREATE TABLE `Payflow_EwalletMessage` (
  `MessageID` bigint(20) DEFAULT NULL,
  `ReceiveDate` datetime DEFAULT NULL,
  `TransactionID` varchar(50) DEFAULT NULL,
  `EventKey` varchar(20) DEFAULT NULL,
  `MessageBody` text,
  `Status` varchar(10) DEFAULT NULL,
  `LastModifiedDate` datetime DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);


--
-- Table structure for table `Payflow_EwalletRetryQueue`
--
CREATE TABLE `Payflow_EwalletRetryQueue` (
  `ErrorID` int(11) NOT NULL DEFAULT '0',
  `MessageID` bigint(20) DEFAULT NULL,
  `CreateDate` datetime NOT NULL,
  `RetryDate` datetime DEFAULT NULL,
  `RetryCount` int(11) NOT NULL,
  `RequestBody` text NOT NULL,
  `Host` varchar(45) NOT NULL,
  `Path` varchar(45) NOT NULL,
  `Method` varchar(45) NOT NULL,
  `Reason` text,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);


--
-- Table structure for table `Payflow_Features`
--
CREATE TABLE `Payflow_Features` (
  `feature_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `partner_id` bigint(20) NOT NULL,
  `interaction_pending` tinyint(4) NOT NULL,
  `interaction_fail` tinyint(4) NOT NULL,
  `transaction_rpnproxy` tinyint(4) NOT NULL,
  `eodfile_ftp` tinyint(4) NOT NULL,
  `eod_Failure` tinyint(4) NOT NULL,
  `transaction_des` tinyint(4) NOT NULL,
  `sms_pending` tinyint(4) NOT NULL,
  `sms_failed` tinyint(4) NOT NULL,
  `invoice_success` tinyint(4) NOT NULL,
  `expiry_card` tinyint(4) NOT NULL,
  `astro_ewallet` tinyint(4) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`feature_id`),
  KEY `partner_id_idx` (`partner_id`),
  CONSTRAINT `partner_id` FOREIGN KEY (`partner_id`) 
  REFERENCES `APG_Payflow_Partner` (`partner_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


--
-- Table structure for table `Payflow_Invoice`
--
CREATE TABLE `Payflow_Invoice` (
  `invoice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `partner_id` bigint(20) NOT NULL,
  `account_type` int(11) NOT NULL,
  `company_name` text NOT NULL,
  `company_address` text NOT NULL,
  `gst_id` varchar(45) NOT NULL,
  `email_content` bigint(20) DEFAULT NULL,
  `email_resend` bigint(20) DEFAULT NULL,
  `invoice_content` bigint(20) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`invoice_id`),
  KEY `partner_id_idx` (`partner_id`),
  KEY `FK_email_content_idx` (`email_content`),
  KEY `FK_email_resend_idx` (`email_resend`),
  KEY `FK_invoice_content_idx` (`invoice_content`),
  CONSTRAINT `FK_email_content` FOREIGN KEY (`email_content`) REFERENCES `Email_Template` (`template_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_email_resend` FOREIGN KEY (`email_resend`) REFERENCES `Email_Template` (`template_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_invoice_content` FOREIGN KEY (`invoice_content`) REFERENCES `Invoice_Template` (`template_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `APG_Payflow_Partner` (`partner_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


--
-- Table structure for table `Payflow_InvoiceMessage`
--
CREATE TABLE `Payflow_InvoiceMessage` (
  `MessageID` bigint(20) NOT NULL,
  `ReceiveDate` datetime NOT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `EventKey` varchar(20) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MessageID`)
);


--
-- Table structure for table `Payflow_Message`
--
CREATE TABLE `Payflow_Message` (
  `MessageID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ReceiveDate` datetime NOT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `EventKey` varchar(20) NOT NULL,
  `MessageBody` text NOT NULL,
  `Status` varchar(10) NOT NULL,
  `LastModifiedDate` datetime NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MessageID`),
  KEY `IX_Payflow_Message_TransactionID` (`TransactionID`),
  KEY `IX_Payflow_Message_ReceiveDate` (`ReceiveDate`),
  KEY `IX_Payflow_Message_LastModifiedDate` (`LastModifiedDate`)
);


--
-- Table structure for table `Payflow_MessageQueue`
--
CREATE TABLE `Payflow_MessageQueue` (
  `MessageID` bigint(20) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MessageID`),
  KEY `IX_Payflow_MessageQueue_MessageID` (`MessageID`)
);


--
-- Table structure for table `Payflow_RPNProxy`
--
CREATE TABLE `Payflow_RPNProxy` (
  `proxyId` bigint(20) NOT NULL AUTO_INCREMENT,
  `partnerId` bigint(20) NOT NULL,
  `ReceiveDate` datetime NOT NULL,
  `transactionId` varchar(45) NOT NULL,
  `status` varchar(10) NOT NULL,
  `lastModifiedDate` datetime NOT NULL,
  `amount` bigint(10) NOT NULL,
  `accountNo` bigint(20) NOT NULL,
  `messageId` bigint(20) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`proxyId`),
  KEY `partnerId_idx` (`partnerId`),
  KEY `IX_Payflow_RPNProxy_transactionId` (`transactionId`),
  KEY `IX_Payflow_RPNProxy_ReceiveDate` (`ReceiveDate`),
  KEY `IX_Payflow_RPNProxy_messageId` (`messageId`),
  KEY `IX_Payflow_RPNProxy_lastModifiedDate` (`lastModifiedDate`),
  CONSTRAINT `partnerId` FOREIGN KEY (`partnerId`) REFERENCES `APG_Payflow_Partner` (`partner_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


--
-- Table structure for table `Payflow_RPNProxyMessage`
--
CREATE TABLE `Payflow_RPNProxyMessage` (
  `MessageID` bigint(20) NOT NULL,
  `ReceiveDate` datetime NOT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `EventKey` varchar(20) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MessageID`),
  KEY `IX_Payflow_RPNProxyMessage_ReceiveDate` (`ReceiveDate`),
  KEY `IX_Payflow_RPNProxyMessage_TransactionID` (`TransactionID`)
);


--
-- Table structure for table `Payflow_SMSMessage`
--
CREATE TABLE `Payflow_SMSMessage` (
  `MessageID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ReceiveDate` datetime NOT NULL,
  `TransactionID` varchar(50) NOT NULL,
  `EventKey` varchar(20) NOT NULL,
  `MessageBody` text NOT NULL,
  `Status` varchar(10) NOT NULL,
  `LastModifiedDate` datetime NOT NULL,
  `SMSBody` text NOT NULL,
  `retryCount` int(11) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MessageID`),
  KEY `IX_Payflow_SMSMessage_TransactionID` (`TransactionID`),
  KEY `IX_Payflow_SMSMessage_ReceiveDate` (`ReceiveDate`),
  KEY `IX_Payflow_SMSMessage_LastModifiedDate` (`LastModifiedDate`),
  KEY `IX_Payflow_SMSMessage_EventKey` (`EventKey`)
);


--
-- Table structure for table `Payflow_SMSMessageQueue`
--
CREATE TABLE `Payflow_SMSMessageQueue` (
  `MessageID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CreateDate` datetime DEFAULT NULL,
  `SQSData` text,
  `PostingTime` datetime DEFAULT NULL,
  `postingTimeUTC` bigint(20) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`MessageID`),
  KEY `IX_Payflow_SMSMessageQueue_MessageID` (`MessageID`),
  KEY `IX_Payflow_SMSMessageQueue_postingTimeUTC` (`postingTimeUTC`)
);


--
-- Table structure for table `RPN_Partner`
--
CREATE TABLE `RPN_Partner` (
  `rpn_partner_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `partner_id` bigint(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `partner_key` varchar(45) NOT NULL,
  `source_id` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `provider_type` varchar(256) DEFAULT NULL,
  `eod_ftp_path` varchar(45) DEFAULT NULL,
  `eod_file_name` varchar(45) DEFAULT NULL,
  `rpn_type` varchar(45) DEFAULT NULL,
  `partner_password` varchar(45) NOT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rpn_partner_id`),
  KEY `FK_PARTNERID_idx` (`partner_id`),
  KEY `IX_RPN_Partner_partner_key` (`partner_key`),
  CONSTRAINT `FK_PARTNER` FOREIGN KEY (`partner_id`) REFERENCES `APG_Payflow_Partner` (`partner_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


--
-- Table structure for table `payflow_interaction_config`
--
CREATE TABLE `payflow_interaction_config` (
  `interaction_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `PartnerID` bigint(20) NOT NULL,
  `apgchannel` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `direction` varchar(45) DEFAULT NULL,
  `medium` varchar(45) DEFAULT NULL,
  `channel` varchar(45) DEFAULT NULL,
  `reason1` varchar(45) DEFAULT NULL,
  `reason2` varchar(45) DEFAULT NULL,
  `notes` text,
  `smsbody` text,
  `interaction_status` int(3) NOT NULL,
  `result` varchar(150) DEFAULT NULL,
  `insertionTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationTimestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`interaction_id`),
  UNIQUE KEY `UQ_Interaction` (`PartnerID`,`apgchannel`,`interaction_status`),
  KEY `FK_PartnerId` (`PartnerID`),
  KEY `IX_payflow_interaction_config_apgchannel` (`apgchannel`),
  CONSTRAINT `FK_PartnerId` FOREIGN KEY (`PartnerID`) 
  REFERENCES `APG_Payflow_Partner` (`partner_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
