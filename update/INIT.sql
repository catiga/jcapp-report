/*系统管理*/
CREATE VIEW jeancoder_report.store_info AS SELECT * FROM jeancoder_project.store_info;
CREATE VIEW jeancoder_report.sys_project_info AS SELECT * FROM jeancoder_project.sys_project_info;
CREATE VIEW jeancoder_report.data_account_session AS SELECT * FROM jeancoder_project.data_account_session;


 

/*交易中心*/
CREATE VIEW jeancoder_report.trade_info AS SELECT * FROM jeancoder_trade.trade_info;
CREATE VIEW jeancoder_report.trade_order AS SELECT * FROM jeancoder_trade.trade_order;
CREATE VIEW jeancoder_report.trade_preferential AS SELECT * FROM jeancoder_trade.trade_preferential;
CREATE VIEW jeancoder_report.trade_pay_info AS SELECT * FROM jeancoder_trade.trade_pay_info;


/*卖品*/
CREATE VIEW jeancoder_report.order_info AS SELECT * FROM jeancoder_scm.order_info;
CREATE VIEW jeancoder_report.order_item AS SELECT * FROM jeancoder_scm.order_item;
CREATE VIEW jeancoder_report.data_goods_info AS SELECT * FROM jeancoder_scm.data_goods_info;
CREATE VIEW jeancoder_report.data_gd_merge_info AS SELECT * FROM jeancoder_scm.data_gd_merge_info;
CREATE VIEW jeancoder_report.data_goods_package AS SELECT * FROM jeancoder_scm.data_goods_package;


/*会员*/
CREATE VIEW jeancoder_report.mm_order_mc AS SELECT * FROM jeancoder_crm.mm_order_mc;
CREATE VIEW jeancoder_report.mm_order_recharge_mc AS SELECT * FROM jeancoder_crm.mm_order_recharge_mc;
CREATE VIEW jeancoder_report.mm_accounjeancoder_project_mc AS SELECT * FROM jeancoder_crm.mm_account_project_mc;
CREATE VIEW jeancoder_report.mm_account_project_mc_detail AS SELECT * FROM jeancoder_crm.mm_account_project_mc_detail;

/*票务*/
CREATE VIEW jeancoder_report.data_tc_ss_sale_order_info AS SELECT * FROM jeancoder_ticketingsys.data_tc_ss_sale_order_info;
CREATE VIEW jeancoder_report.data_tc_ss_sale_order_seat AS SELECT * FROM jeancoder_ticketingsys.data_tc_ss_sale_order_seat;
CREATE VIEW jeancoder_report.data_tc_ss_reserve_order_info AS SELECT * FROM jeancoder_ticketingsys.data_tc_ss_reserve_order_info;
CREATE VIEW jeancoder_report.data_tc_ss_reserve_order_seat AS SELECT * FROM jeancoder_ticketingsys.data_tc_ss_reserve_order_seat;

/*卡劵*/
CREATE VIEW jeancoder_report.ma_order_coupon AS SELECT * FROM jeancoder_market.ma_order_coupon;
CREATE VIEW jeancoder_report.ma_coupon_batch AS SELECT * FROM jeancoder_market.ma_coupon_batch;
CREATE VIEW jeancoder_report.ma_coupon_code AS SELECT * FROM jeancoder_market.ma_coupon_code;



 

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `report_no` (`report_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`),
  KEY `design` (`design_id`),
  KEY `kw` (`design_id`,`cond_keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/***2019-01-09 添加查询支付方式***/
CREATE VIEW jeancoder_report.sys_project_support_config AS SELECT * FROM sys_project_support_config;
 