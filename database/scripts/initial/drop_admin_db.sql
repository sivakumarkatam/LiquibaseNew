-- Disable foreign keys
SET FOREIGN_KEY_CHECKS=0;

/************************************************************************/
/*****************     D R O P   T A B L E  S         *******************/
/************************************************************************/

DROP TABLE IF EXISTS `APGADMIN_CCExpirySchedular_Settings`;
DROP TABLE IF EXISTS `APGADMIN_CSCEmailTemplate_Settings`;
DROP TABLE IF EXISTS `APGADMIN_Validation_Settings`;
DROP TABLE IF EXISTS `APG_BinList`;
DROP TABLE IF EXISTS `APG_BinListTypes`;
DROP TABLE IF EXISTS `APG_BlackList_Criteria`;
DROP TABLE IF EXISTS `APG_BlacklistCards`;
DROP TABLE IF EXISTS `APG_BlacklistPayee`;
DROP TABLE IF EXISTS `APG_BlacklistPayeeRemarks`;
DROP TABLE IF EXISTS `APG_Channel`;
DROP TABLE IF EXISTS `APG_ChannelCurrency`;
DROP TABLE IF EXISTS `APG_ChannelProvider`;
DROP TABLE IF EXISTS `APG_ChannelProviderMetaData`;
DROP TABLE IF EXISTS `APG_ChannelProvider_Currency`;
DROP TABLE IF EXISTS `APG_Channel_TransactionType`;
DROP TABLE IF EXISTS `APG_Configuration_Service`;
DROP TABLE IF EXISTS `APG_Currency`;
DROP TABLE IF EXISTS `APG_DownTimePeriod`;
DROP TABLE IF EXISTS `APG_ErrorLog`;
DROP TABLE IF EXISTS `APG_FPX_Bank_Codes`;
DROP TABLE IF EXISTS `APG_FraudCheck`;
DROP TABLE IF EXISTS `APG_FraudCheck_Configuration`;
DROP TABLE IF EXISTS `APG_FraudCheck_Remarks`;
DROP TABLE IF EXISTS `APG_FtpDetails`;
DROP TABLE IF EXISTS `APG_General_Configuration`;
DROP TABLE IF EXISTS `APG_MBB_CASA_Bank_Codes`;
DROP TABLE IF EXISTS `APG_PBB_Bank_Codes`;
DROP TABLE IF EXISTS `APG_Partner`;
DROP TABLE IF EXISTS `APG_PartnerDirectLink`;
DROP TABLE IF EXISTS `APG_PaymentProvider`;
DROP TABLE IF EXISTS `APG_PaymentProviderDowntime`;
DROP TABLE IF EXISTS `APG_PaymentProvider_Currency`;
DROP TABLE IF EXISTS `APG_PaymentRunningNumber`;
DROP TABLE IF EXISTS `APG_Permission`;
DROP TABLE IF EXISTS `APG_Role_Permission`;
DROP TABLE IF EXISTS `APG_Roles`;
DROP TABLE IF EXISTS `APG_TransactionType`;
DROP TABLE IF EXISTS `APG_User_Role`;
DROP TABLE IF EXISTS `APG_Users`;
DROP TABLE IF EXISTS `APG_WebAdmin_Configuration`;
DROP TABLE IF EXISTS `APG_Web_Configuration`;
DROP TABLE IF EXISTS `FPX_BankList`;
DROP TABLE IF EXISTS `PVS_Function`;
DROP TABLE IF EXISTS `PVS_Group`;
DROP TABLE IF EXISTS `PVS_GroupFunction`;
DROP TABLE IF EXISTS `PVS_PartnerFunction`;
DROP TABLE IF EXISTS `PVS_PartnerGroup`;

-- Enable foreign keys
SET FOREIGN_KEY_CHECKS=1;