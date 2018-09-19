-- Disable foreign keys
SET FOREIGN_KEY_CHECKS=0;

/************************************************************************/
/*****************     D R O P   T A B L E  S         *******************/
/************************************************************************/
DROP TABLE IF EXISTS `APG_AdditionalCharges`;
DROP TABLE IF EXISTS `APG_ErrorLog`;
DROP TABLE IF EXISTS `APG_FPX_Bank_Codes`;
DROP TABLE IF EXISTS `APG_MBB_CASA_Bank_Codes`;
DROP TABLE IF EXISTS `APG_PBB_Bank_Codes`;
DROP TABLE IF EXISTS `APG_PaymentInfo_CTB`;
DROP TABLE IF EXISTS `APG_PaymentInfo_FPX`;
DROP TABLE IF EXISTS `APG_PaymentInfo_PBB`;
DROP TABLE IF EXISTS `APG_Recurring`;
DROP TABLE IF EXISTS `APG_ReversalQueue`;
DROP TABLE IF EXISTS `APG_Transaction`;
DROP TABLE IF EXISTS `APG_TransactionDiscountInfo`;
DROP TABLE IF EXISTS `APG_TransactionExtraData`;
DROP TABLE IF EXISTS `APG_TransactionItem`;
DROP TABLE IF EXISTS `APG_TransactionLog`;
DROP TABLE IF EXISTS `APG_TransactionMetaData`;
DROP TABLE IF EXISTS `APG_TransactionPayment`;
DROP TABLE IF EXISTS `APG_TransactionPaymentRefund`;
DROP TABLE IF EXISTS `APG_TransactionPaymentReverse`;
DROP TABLE IF EXISTS `APG_TransactionUser`;
DROP TABLE IF EXISTS `APG_Transaction_EPPInfo`;
-- DROP TABLE IF EXISTS `APG_User_Role`;
DROP TABLE IF EXISTS `APG_paymentInfo_MBB`;
DROP TABLE IF EXISTS `Ewallet_Transaction`;
DROP TABLE IF EXISTS `FPX_BankList`;
DROP TABLE IF EXISTS `FavCard_PendingEditCCToken`;

/************************************************************************/
/********     D R O P   M I G R A T I O N  T A B L E  S         *********/
/************************************************************************/
DROP TABLE IF EXISTS `APG_PaymentInfo_CTBBkup`;
DROP TABLE IF EXISTS `APG_PaymentInfo_FPXBkup`;
DROP TABLE IF EXISTS `APG_PaymentInfo_PBBBkup`;
DROP TABLE IF EXISTS `APG_ReversalQueueBkup`;
DROP TABLE IF EXISTS `APG_Transaction_EPPInfoBkup`;
DROP TABLE IF EXISTS `APG_TransactionBkup`;
DROP TABLE IF EXISTS `APG_TransactionItemBkup`;
DROP TABLE IF EXISTS `APG_TransactionPaymentBkup`;
DROP TABLE IF EXISTS `APG_TransactionPaymentRefundBkup`;
DROP TABLE IF EXISTS `APG_TransactionUserBkup`;
DROP TABLE IF EXISTS `APG_paymentInfo_MBBBkup`;

-- Restore foreign key checks
SET FOREIGN_KEY_CHECKS=1;