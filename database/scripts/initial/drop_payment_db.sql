-- Disable foreign keys
SET FOREIGN_KEY_CHECKS=0;

/************************************************************************/
/*****************     D R O P   T A B L E  S         *******************/
/************************************************************************/
DROP TABLE IF EXISTS `APG_FailedSubmitTransaction`;
DROP TABLE IF EXISTS `CC_ExpiryDate`;
DROP TABLE IF EXISTS `CC_ExpirySchedular`;
DROP TABLE IF EXISTS `CC_FavCards_Temp`; 
DROP TABLE IF EXISTS `CC_Name`;
DROP TABLE IF EXISTS `CC_PANNumber`;
DROP TABLE IF EXISTS `CC_Payment`;
DROP TABLE IF EXISTS `CC_SubscriptionExpiryDate`;
DROP TABLE IF EXISTS `CC_SubscriptionName`;
DROP TABLE IF EXISTS `CC_SubscriptionPANNumber`;
DROP TABLE IF EXISTS `Dynamic_Pay_Request`;
DROP TABLE IF EXISTS `TransactionTimer`;
DROP TABLE IF EXISTS `USER_TOKEN_MAPPING`;


/******************************************/
/************ DROP VIEWS ******************/
/******************************************/
DROP VIEW IF EXISTS `CC_FavCards`;
DROP VIEW IF EXISTS `CC_Details`;

-- Enable foreign keys
SET FOREIGN_KEY_CHECKS=1;