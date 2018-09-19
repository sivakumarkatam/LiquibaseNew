-- Disable foreign keys
-- SET FOREIGN_KEY_CHECKS=0;

/************************************************************************/
/*****************     D R O P   T A B L E  S         *******************/
/************************************************************************/
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `APG_Payflow_Partner`;
DROP TABLE IF EXISTS `Email_Template`;
DROP TABLE IF EXISTS `Invoice_Template`;
DROP TABLE IF EXISTS `MSC_Payment`;
DROP TABLE IF EXISTS `Payflow_AmdocsMessage`;
DROP TABLE IF EXISTS `Payflow_AmdocsRetryQueue`;
DROP TABLE IF EXISTS `Payflow_BillingCycle`;
DROP TABLE IF EXISTS `Payflow_DESLog`;
DROP TABLE IF EXISTS `Payflow_DESMessage`;
DROP TABLE IF EXISTS `Payflow_DESRetryQueue`;
DROP TABLE IF EXISTS `Payflow_DashboardMessage`;
DROP TABLE IF EXISTS `Payflow_DashboardMessageQueue`;
DROP TABLE IF EXISTS `Payflow_DashboardRetryQueue`;
DROP TABLE IF EXISTS `Payflow_EwalletMessage`;
DROP TABLE IF EXISTS `Payflow_EwalletRetryQueue`;
DROP TABLE IF EXISTS `Payflow_Features`;
DROP TABLE IF EXISTS `Payflow_Invoice`;
DROP TABLE IF EXISTS `Payflow_InvoiceMessage`;
DROP TABLE IF EXISTS `Payflow_Message`;
DROP TABLE IF EXISTS `Payflow_MessageQueue`;
DROP TABLE IF EXISTS `Payflow_RPNProxy`;
DROP TABLE IF EXISTS `Payflow_RPNProxyMessage`;
DROP TABLE IF EXISTS `Payflow_SMSMessage`;
DROP TABLE IF EXISTS `Payflow_SMSMessageQueue`;
DROP TABLE IF EXISTS `RPN_Partner`;
DROP TABLE IF EXISTS `payflow_interaction_config`;

-- Enable foreign keys
SET FOREIGN_KEY_CHECKS=1;
