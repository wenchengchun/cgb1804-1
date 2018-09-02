/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.5.22 : Database - wldb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wldb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wldb`;

/*Table structure for table `access_log` */

DROP TABLE IF EXISTS `access_log`;

CREATE TABLE `access_log` (
  `ACCESS_LOG_ID` varchar(40) NOT NULL,
  `DEPT_NAME` varchar(100) DEFAULT NULL,
  `USER_NAME` varchar(40) DEFAULT NULL,
  `MODULE_NAME` varchar(200) DEFAULT NULL,
  `CURL` varchar(400) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ACCESS_LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `access_log` */

/*Table structure for table `contract` */

DROP TABLE IF EXISTS `contract`;

CREATE TABLE `contract` (
  `CONTRACT_ID` varchar(40) NOT NULL,
  `OFFEROR` varchar(200) DEFAULT NULL,
  `CONTRACT_NO` varchar(50) DEFAULT NULL,
  `SIGNING_DATE` datetime DEFAULT NULL,
  `INPUT_BY` varchar(30) DEFAULT NULL,
  `CHECK_BY` varchar(30) DEFAULT NULL,
  `INSPECTOR` varchar(30) DEFAULT NULL,
  `TOTAL_AMOUNT` decimal(10,2) DEFAULT NULL,
  `CREQUEST` varchar(2000) DEFAULT NULL,
  `CUSTOM_NAME` varchar(200) DEFAULT NULL,
  `SHIP_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IMPORT_NUM` int(11) DEFAULT NULL,
  `DELIVERY_PERIOD` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `OLD_STATE` int(11) DEFAULT NULL,
  `OUT_STATE` int(11) DEFAULT NULL,
  `TRADE_TERMS` varchar(30) DEFAULT NULL,
  `PRINT_STYLE` char(1) DEFAULT NULL,
  `REMARK` varchar(600) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DEPT` varchar(40) DEFAULT NULL,
  `CREATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `contract` */

/*Table structure for table `contract_product` */

DROP TABLE IF EXISTS `contract_product`;

CREATE TABLE `contract_product` (
  `CONTRACT_PRODUCT_ID` varchar(40) NOT NULL,
  `CONTRACT_ID` varchar(40) DEFAULT NULL,
  `FACTORY_ID` varchar(40) DEFAULT NULL,
  `FACTORY_NAME` varchar(200) DEFAULT NULL,
  `PRODUCT_NO` varchar(50) DEFAULT NULL,
  `PRODUCT_IMAGE` varchar(200) DEFAULT NULL,
  `PRODUCT_DESC` varchar(600) DEFAULT NULL,
  `LOADING_RATE` varchar(30) DEFAULT NULL,
  `BOX_NUM` int(11) DEFAULT NULL,
  `PACKING_UNIT` varchar(10) DEFAULT NULL,
  `CNUMBER` int(11) DEFAULT NULL,
  `OUT_NUMBER` int(11) DEFAULT NULL,
  `FINISHED` int(11) DEFAULT NULL,
  `PRODUCT_REQUEST` varchar(2000) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `AMOUNT` decimal(10,2) DEFAULT NULL,
  `ORDER_NO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `contract_product` */

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `DEPT_ID` varchar(40) NOT NULL,
  `DEPT_NAME` varchar(50) DEFAULT NULL,
  `PARENT_ID` varchar(40) DEFAULT NULL,
  `STATE` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`DEPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dept` */

/*Table structure for table `export` */

DROP TABLE IF EXISTS `export`;

CREATE TABLE `export` (
  `EXPORT_ID` varchar(40) NOT NULL,
  `INPUT_DATE` datetime DEFAULT NULL,
  `CONTRACT_IDS` varchar(200) DEFAULT NULL,
  `CUSTOMER_CONTRACT` varchar(200) DEFAULT NULL,
  `LCNO` varchar(10) DEFAULT NULL,
  `CONSIGNEE` varchar(100) DEFAULT NULL,
  `MARKS` varchar(1000) DEFAULT NULL,
  `SHIPMENT_PORT` varchar(100) DEFAULT NULL,
  `DESTINATION_PORT` varchar(100) DEFAULT NULL,
  `TRANSPORT_MODE` varchar(10) DEFAULT NULL,
  `PRICE_CONDITION` varchar(10) DEFAULT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  `BOX_NUMS` int(11) DEFAULT NULL,
  `GROSS_WEIGHTS` decimal(10,2) DEFAULT NULL,
  `MEASUREMENTS` decimal(10,2) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DEPT` varchar(40) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `export` */

/*Table structure for table `export_product` */

DROP TABLE IF EXISTS `export_product`;

CREATE TABLE `export_product` (
  `EXPORT_PRODUCT_ID` varchar(40) NOT NULL,
  `EXPORT_ID` varchar(40) DEFAULT NULL,
  `FACTORY_ID` varchar(40) DEFAULT NULL,
  `PRODUCT_NO` varchar(50) DEFAULT NULL,
  `PACKING_UNIT` varchar(10) DEFAULT NULL,
  `Cnumeric` int(11) DEFAULT NULL,
  `BOX_NUM` int(11) DEFAULT NULL,
  `GROSS_WEIGHT` decimal(10,2) DEFAULT NULL,
  `NET_WEIGHT` decimal(10,2) DEFAULT NULL,
  `SIZE_LENGTH` decimal(10,2) DEFAULT NULL,
  `SIZE_WIDTH` decimal(10,2) DEFAULT NULL,
  `SIZE_HEIGHT` decimal(10,2) DEFAULT NULL,
  `EX_PRICE` decimal(10,2) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `TAX` decimal(10,2) DEFAULT NULL,
  `ORDER_NO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `export_product` */

/*Table structure for table `ext_cproduct` */

DROP TABLE IF EXISTS `ext_cproduct`;

CREATE TABLE `ext_cproduct` (
  `EXT_CPRODUCT_ID` varchar(40) NOT NULL,
  `CONTRACT_PRODUCT_ID` varchar(40) DEFAULT NULL,
  `FACTORY_ID` varchar(40) DEFAULT NULL,
  `FACTORY_NAME` varchar(200) DEFAULT NULL,
  `PRODUCT_NO` varchar(50) DEFAULT NULL,
  `PRODUCT_IMAGE` varchar(200) DEFAULT NULL,
  `PRODUCT_DESC` varchar(600) DEFAULT NULL,
  `PACKING_UNIT` varchar(10) DEFAULT NULL,
  `CNUMBER` int(11) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `AMOUNT` decimal(10,2) DEFAULT NULL,
  `PRODUCT_REQUEST` varchar(2000) DEFAULT NULL,
  `ORDER_NO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ext_cproduct` */

/*Table structure for table `ext_eproduct` */

DROP TABLE IF EXISTS `ext_eproduct`;

CREATE TABLE `ext_eproduct` (
  `EXT_EPRODUCT_ID` varchar(40) NOT NULL,
  `FACTORY_ID` varchar(40) DEFAULT NULL,
  `EXPORT_PRODUCT_ID` varchar(40) DEFAULT NULL,
  `PRODUCT_NO` varchar(50) DEFAULT NULL,
  `PRODUCT_IMAGE` varchar(200) DEFAULT NULL,
  `PRODUCT_DESC` varchar(600) DEFAULT NULL,
  `Cnumeric` int(11) DEFAULT NULL,
  `PACKING_UNIT` varchar(10) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `AMOUNT` decimal(10,2) DEFAULT NULL,
  `PRODUCT_REQUEST` varchar(2000) DEFAULT NULL,
  `ORDER_NO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ext_eproduct` */

/*Table structure for table `factory` */

DROP TABLE IF EXISTS `factory`;

CREATE TABLE `factory` (
  `FACTORY_ID` varchar(40) NOT NULL,
  `CTYPE` varchar(10) DEFAULT NULL,
  `FULL_NAME` varchar(200) DEFAULT NULL,
  `FACTORY_NAME` varchar(50) DEFAULT NULL,
  `CONTACTS` varchar(30) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `MOBILE` varchar(20) DEFAULT NULL,
  `FAX` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `INSPECTOR` varchar(30) DEFAULT NULL,
  `REMARK` varchar(2000) DEFAULT NULL,
  `ORDER_NO` int(11) DEFAULT NULL,
  `STATE` char(1) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DEPT` varchar(40) DEFAULT NULL,
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `factory` */

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `FEEDBACK_ID` varchar(40) NOT NULL,
  `INPUT_BY` varchar(20) DEFAULT NULL,
  `INPUT_TIME` datetime DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `CONTENT` text,
  `CLASS_TYPE` char(1) DEFAULT NULL,
  `TEL` varchar(20) DEFAULT NULL,
  `ANSWER_BY` varchar(20) DEFAULT NULL,
  `ANSWER_TIME` datetime DEFAULT NULL,
  `SOLVE_METHOD` text,
  `RESOLUTION` char(1) DEFAULT NULL,
  `DIFFICULTY` char(1) DEFAULT NULL,
  `IS_SHARE` char(1) DEFAULT NULL,
  `STATE` char(1) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DEPT` varchar(40) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`FEEDBACK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `feedback` */

/*Table structure for table `finance` */

DROP TABLE IF EXISTS `finance`;

CREATE TABLE `finance` (
  `FINANCE_ID` varchar(40) NOT NULL,
  `INPUT_DATE` datetime DEFAULT NULL,
  `INPUT_BY` varchar(30) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DEPT` varchar(40) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `finance` */

/*Table structure for table `home_packing_list` */

DROP TABLE IF EXISTS `home_packing_list`;

CREATE TABLE `home_packing_list` (
  `HOME_PACKING_LIST_ID` varchar(40) NOT NULL,
  `EXPORT_ID` varchar(40) DEFAULT NULL,
  `SELLER` varchar(200) DEFAULT NULL,
  `BUYER` varchar(200) DEFAULT NULL,
  `MARKS` varchar(200) DEFAULT NULL,
  `DESCRIPTIONS` varchar(200) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DEPT` varchar(40) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `home_packing_list` */

/*Table structure for table `invoice` */

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `INVOICE_ID` varchar(40) NOT NULL,
  `SC_NO` varchar(100) DEFAULT NULL,
  `BL_NO` varchar(100) DEFAULT NULL,
  `TRADE_TERMS` varchar(100) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DEPT` varchar(40) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `invoice` */

/*Table structure for table `module` */

DROP TABLE IF EXISTS `module`;

CREATE TABLE `module` (
  `MODULE_ID` varchar(40) NOT NULL,
  `PARENT_ID` varchar(40) DEFAULT NULL,
  `PARENT_NAME` varchar(100) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `LAYER_NUM` int(11) DEFAULT NULL,
  `IS_LEAF` int(11) DEFAULT NULL,
  `ICO` varchar(20) DEFAULT NULL,
  `CPERMISSION` varchar(20) DEFAULT NULL,
  `CURL` varchar(200) DEFAULT NULL,
  `CTYPE` int(11) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `BELONG` varchar(100) DEFAULT NULL,
  `CWHICH` varchar(20) DEFAULT NULL,
  `QUOTE_NUM` int(11) DEFAULT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  `ORDER_NO` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DEPT` varchar(40) DEFAULT NULL,
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `module` */

/*Table structure for table `online_info_t` */

DROP TABLE IF EXISTS `online_info_t`;

CREATE TABLE `online_info_t` (
  `A1` varchar(10) NOT NULL,
  `A2` int(11) DEFAULT NULL,
  PRIMARY KEY (`A1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `online_info_t` */

/*Table structure for table `packing_list` */

DROP TABLE IF EXISTS `packing_list`;

CREATE TABLE `packing_list` (
  `PACKING_LIST_ID` varchar(40) NOT NULL,
  `SELLER` varchar(200) DEFAULT NULL,
  `BUYER` varchar(200) DEFAULT NULL,
  `INVOICE_NO` varchar(30) DEFAULT NULL,
  `INVOICE_DATE` datetime DEFAULT NULL,
  `MARKS` varchar(200) DEFAULT NULL,
  `DESCRIPTIONS` varchar(200) DEFAULT NULL,
  `EXPORT_IDS` varchar(200) DEFAULT NULL,
  `EXPORT_NOS` varchar(200) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DEPT` varchar(40) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `packing_list` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `PRODUCT_ID` varchar(40) NOT NULL,
  `PRODUCT_NO` varchar(40) DEFAULT NULL,
  `PRODUCT_IMAGE` varchar(200) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `FACTORY_ID` varchar(40) DEFAULT NULL,
  `FACTORY_NAME` varchar(250) DEFAULT NULL,
  `PRICE` decimal(10,3) DEFAULT NULL,
  `SIZE_LENGHT` decimal(10,3) DEFAULT NULL,
  `SIZE_WIDTH` decimal(10,3) DEFAULT NULL,
  `SIZE_HEIGHT` decimal(10,3) DEFAULT NULL,
  `COLOR` varchar(200) DEFAULT NULL,
  `PACKING` varchar(20) DEFAULT NULL,
  `PACKING_UNIT` varchar(10) DEFAULT NULL,
  `TYPE20` decimal(10,3) DEFAULT NULL,
  `TYPE40` decimal(10,3) DEFAULT NULL,
  `TYPE40HC` decimal(10,3) DEFAULT NULL,
  `QTY` int(11) DEFAULT NULL,
  `CBM` decimal(10,3) DEFAULT NULL,
  `MPSIZE_LENGHT` decimal(10,3) DEFAULT NULL,
  `MPSIZE_WIDTH` decimal(10,3) DEFAULT NULL,
  `MPSIZE_HEIGHT` decimal(10,3) DEFAULT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  `INPUT_TIME` datetime DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DEPT` varchar(40) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `ROLE_ID` varchar(40) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `REMARK` varchar(200) DEFAULT NULL,
  `ORDER_NO` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DEPT` varchar(40) DEFAULT NULL,
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

/*Table structure for table `shipping_order` */

DROP TABLE IF EXISTS `shipping_order`;

CREATE TABLE `shipping_order` (
  `SHIPPING_ORDER_ID` varchar(40) NOT NULL,
  `ORDER_TYPE` varchar(10) DEFAULT NULL,
  `SHIPPER` varchar(200) DEFAULT NULL,
  `CONSIGNEE` varchar(200) DEFAULT NULL,
  `NOTIFY_PARTY` varchar(200) DEFAULT NULL,
  `LC_NO` varchar(30) DEFAULT NULL,
  `PORT_OF_LOADING` varchar(30) DEFAULT NULL,
  `PORT_OF_TRANS` varchar(30) DEFAULT NULL,
  `PORT_OF_DISCHARGE` varchar(30) DEFAULT NULL,
  `LOADING_DATE` datetime DEFAULT NULL,
  `LIMIT_DATE` datetime DEFAULT NULL,
  `IS_BATCH` char(1) DEFAULT NULL,
  `IS_TRANS` char(1) DEFAULT NULL,
  `COPY_NUM` varchar(20) DEFAULT NULL,
  `REMARK` varchar(200) DEFAULT NULL,
  `SPECIAL_CONDITION` varchar(200) DEFAULT NULL,
  `FREIGHT` varchar(200) DEFAULT NULL,
  `CHECK_BY` varchar(30) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DEPT` varchar(40) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shipping_order` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `USER_ID` varchar(40) NOT NULL,
  `DEPT_ID` varchar(40) DEFAULT NULL,
  `USER_NAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(64) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DEPT` varchar(40) DEFAULT NULL,
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*Table structure for table `user_info_p` */

DROP TABLE IF EXISTS `user_info_p`;

CREATE TABLE `user_info_p` (
  `USER_INFO_ID` varchar(40) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `MANAGER_ID` varchar(40) DEFAULT NULL,
  `JOIN_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SALARY` decimal(8,2) DEFAULT NULL,
  `BIRTHDAY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `GENDER` char(1) DEFAULT NULL,
  `STATION` varchar(20) DEFAULT NULL,
  `TELEPHONE` varchar(100) DEFAULT NULL,
  `DEGREE` int(11) DEFAULT NULL,
  `REMARK` varchar(600) DEFAULT NULL,
  `ORDER_NO` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DEPT` varchar(40) DEFAULT NULL,
  `CREATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`USER_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_info_p` */

/*Table structure for table `user_temp` */

DROP TABLE IF EXISTS `user_temp`;

CREATE TABLE `user_temp` (
  `USER_TEMP_ID` varchar(40) NOT NULL,
  `KEY_CLASS` varchar(30) DEFAULT NULL,
  `KEY_NAME` varchar(30) DEFAULT NULL,
  `KEY_CONTENT` varchar(3000) DEFAULT NULL,
  `STATE` int(11) DEFAULT '1',
  `ORDER_NO` int(11) DEFAULT NULL,
  `CNOTE` varchar(50) DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_TEMP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_temp` */

/*Table structure for table `vote_record` */

DROP TABLE IF EXISTS `vote_record`;

CREATE TABLE `vote_record` (
  `VOTE_RECORD_ID` varchar(40) NOT NULL,
  `CTYPE` varchar(40) DEFAULT NULL,
  `DEPT_NAME` varchar(100) DEFAULT NULL,
  `VOTER` varchar(30) DEFAULT NULL,
  `VOTE_VALUE` int(11) DEFAULT NULL,
  `IP` varchar(400) DEFAULT NULL,
  `ADVISE` varchar(4000) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`VOTE_RECORD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vote_record` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
