# ************************************************************
# Sequel Pro SQL dump
# Version 4529
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 125.124.83.107 (MySQL 5.7.17)
# Database: hp_report
# Generation Time: 2019-10-28 02:30:03 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table sys_report_condition
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_report_condition`;

CREATE TABLE `sys_report_condition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `design_id` bigint(20) DEFAULT NULL,
  `cond_keyword` varchar(255) DEFAULT NULL,
  `cond_name` varchar(255) DEFAULT NULL,
  `cond_type` varchar(255) DEFAULT NULL,
  `cond_expression` text,
  `cond_expression_type` varchar(255) DEFAULT NULL,
  `cond_where_value` varchar(255) DEFAULT NULL,
  `cond_view_value` varchar(255) DEFAULT NULL,
  `flag` tinyint(4) DEFAULT NULL,
  `a_time` datetime DEFAULT NULL,
  `c_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `design` (`design_id`) USING BTREE,
  KEY `kw` (`design_id`,`cond_keyword`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=dynamic;



# Dump of table sys_report_design
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_report_design`;

CREATE TABLE `sys_report_design` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_no` varchar(255) NOT NULL COMMENT '报表编号 唯一',
  `report_name` varchar(255) DEFAULT NULL,
  `report_desc` varchar(2048) DEFAULT NULL,
  `report_sql` text COMMENT 'sql ',
  `report_field` text COMMENT '字段',
  `report_from` text,
  `report_where` text,
  `report_dimension` text,
  `report_measure` text,
  `proj_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `flag` tinyint(4) DEFAULT NULL,
  `a_time` datetime DEFAULT NULL,
  `c_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `report_no` (`report_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=dynamic;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
