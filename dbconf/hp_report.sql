/*
 Navicat MySQL Data Transfer

 Source Server         : 10.3.66.160
 Source Server Type    : MySQL
 Source Server Version : 50643
 Source Host           : 10.3.66.160:3306
 Source Schema         : hp_report

 Target Server Type    : MySQL
 Target Server Version : 50643
 File Encoding         : 65001

 Date: 28/04/2019 22:17:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for data_account_session
-- ----------------------------
DROP TABLE IF EXISTS `data_account_session`;
CREATE TABLE `data_account_session`  (
  `id` bigint(11) UNSIGNED NOT NULL DEFAULT 0,
  `proj_id` bigint(20) NULL DEFAULT NULL,
  `basic_id` bigint(20) NULL DEFAULT NULL,
  `a_time` datetime(0) NULL DEFAULT NULL,
  `rushed` bigint(20) NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `lograns` int(11) NOT NULL DEFAULT 0,
  `logtype` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_gd_merge_info
-- ----------------------------
DROP TABLE IF EXISTS `data_gd_merge_info`;
CREATE TABLE `data_gd_merge_info`  (
  `id` bigint(11) UNSIGNED NOT NULL DEFAULT 0,
  `pid` bigint(20) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cost_price` decimal(10, 0) NULL DEFAULT NULL,
  `rec_price` decimal(10, 0) NULL DEFAULT NULL,
  `sale_price` decimal(10, 0) NULL DEFAULT NULL,
  `a_time` datetime(0) NULL DEFAULT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `data_goods_info`;
CREATE TABLE `data_goods_info`  (
  `id` bigint(11) NOT NULL DEFAULT 0,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `goods_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_price` decimal(10, 0) NULL DEFAULT NULL,
  `goods_original_price` decimal(10, 0) NULL DEFAULT NULL,
  `cost_price` decimal(10, 0) NULL DEFAULT NULL,
  `goods_material` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `goods_picturelink` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_picturelink_big` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_state` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000',
  `goods_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `goods_picturelink_middle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `proj_id` bigint(20) NOT NULL DEFAULT 2,
  `model_id` bigint(20) NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `config` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weight` float NULL DEFAULT NULL,
  `spec_unit` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `freepost` tinyint(4) NOT NULL DEFAULT 1,
  `ftpl` bigint(20) NULL DEFAULT NULL,
  `local` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `limit_buy_num` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NULL DEFAULT 1,
  `gt` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `goods_out_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_code` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `other_id` bigint(20) NULL DEFAULT NULL,
  `a_time` datetime(0) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_tc_ss_reserve_order_info
-- ----------------------------
DROP TABLE IF EXISTS `data_tc_ss_reserve_order_info`;
CREATE TABLE `data_tc_ss_reserve_order_info`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `order_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `original_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_status` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000',
  `total_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `pay_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a_time` datetime(0) NULL DEFAULT NULL,
  `pay_time` datetime(0) NULL DEFAULT NULL,
  `check_time` datetime(0) NULL DEFAULT NULL,
  `deliver_time` datetime(0) NULL DEFAULT NULL,
  `ticket_sum` int(11) NOT NULL DEFAULT 0,
  `store_id` bigint(20) NOT NULL,
  `store_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hall_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hall_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plan_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `plan_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `plan_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `film_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0000',
  `proj_id` bigint(16) NULL DEFAULT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `o_c` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2000',
  `com_order` bigint(20) NULL DEFAULT NULL,
  `handle_fee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `acmid` bigint(20) NULL DEFAULT NULL,
  `drawback_time` datetime(0) NULL DEFAULT NULL,
  `refund_time` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tclass_id` bigint(20) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_tc_ss_reserve_order_seat
-- ----------------------------
DROP TABLE IF EXISTS `data_tc_ss_reserve_order_seat`;
CREATE TABLE `data_tc_ss_reserve_order_seat`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `order_id` bigint(20) NULL DEFAULT NULL,
  `seat_id` bigint(20) NULL DEFAULT NULL,
  `seat_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seat_gr` int(11) NULL DEFAULT NULL,
  `seat_gc` int(11) NULL DEFAULT NULL,
  `seat_sr` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seat_sc` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `went_status` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '00',
  `handle_fee` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sale_fee` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pub_fee` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_tc_ss_sale_order_info
-- ----------------------------
DROP TABLE IF EXISTS `data_tc_ss_sale_order_info`;
CREATE TABLE `data_tc_ss_sale_order_info`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `original_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_status` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000',
  `total_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `pay_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a_time` datetime(0) NULL DEFAULT NULL,
  `pay_time` datetime(0) NULL DEFAULT NULL,
  `check_time` datetime(0) NULL DEFAULT NULL,
  `deliver_time` datetime(0) NULL DEFAULT NULL,
  `ticket_sum` int(11) NOT NULL DEFAULT 0,
  `store_id` bigint(20) NOT NULL,
  `store_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hall_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hall_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plan_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `plan_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `plan_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `film_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `proj_id` bigint(16) NULL DEFAULT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `o_c` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2000',
  `com_order` bigint(20) NULL DEFAULT NULL,
  `handle_fee` decimal(10, 0) NOT NULL DEFAULT 0,
  `acmid` bigint(20) NULL DEFAULT NULL,
  `drawback_time` datetime(0) NULL DEFAULT NULL,
  `refund_time` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tclass_id` bigint(20) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_tc_ss_sale_order_seat
-- ----------------------------
DROP TABLE IF EXISTS `data_tc_ss_sale_order_seat`;
CREATE TABLE `data_tc_ss_sale_order_seat`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `order_id` bigint(20) NULL DEFAULT NULL,
  `seat_id` bigint(20) NULL DEFAULT NULL,
  `seat_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seat_gr` int(11) NULL DEFAULT NULL,
  `seat_gc` int(11) NULL DEFAULT NULL,
  `seat_sr` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seat_sc` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `went_status` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '00',
  `handle_fee` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sale_fee` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pub_fee` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ma_coupon_batch
-- ----------------------------
DROP TABLE IF EXISTS `ma_coupon_batch`;
CREATE TABLE `ma_coupon_batch`  (
  `id` bigint(11) UNSIGNED NOT NULL DEFAULT 0,
  `coupon_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a_time` datetime(0) NULL DEFAULT NULL,
  `rule` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `total` int(11) NOT NULL DEFAULT 0,
  `available` int(11) NOT NULL DEFAULT 0,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `coupon_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1000',
  `pid` bigint(20) NOT NULL,
  `validate_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000',
  `validate_period` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `is_outer` tinyint(4) NOT NULL DEFAULT 0,
  `outer_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `outer_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `outer_pc_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `outer_pc_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cb_level` int(11) NOT NULL DEFAULT 1,
  `s_id` bigint(20) NULL DEFAULT NULL,
  `use_count` int(11) NULL DEFAULT NULL,
  `use_count_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `use_con` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '10',
  `cbstatus` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '21',
  `crapp` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cbunifycode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cbunifyenable` tinyint(4) NULL DEFAULT NULL,
  `cucs` tinyint(4) NULL DEFAULT NULL,
  `cuvs` tinyint(4) NULL DEFAULT NULL,
  `version` tinyint(4) NULL DEFAULT NULL,
  `wxcard_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ma_coupon_code
-- ----------------------------
DROP TABLE IF EXISTS `ma_coupon_code`;
CREATE TABLE `ma_coupon_code`  (
  `id` bigint(11) UNSIGNED NOT NULL DEFAULT 0,
  `batch_id` bigint(20) NOT NULL,
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '00',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_project_id` bigint(20) NULL DEFAULT NULL,
  `takeby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `get_time` datetime(0) NULL DEFAULT NULL,
  `use_time` datetime(0) NULL DEFAULT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `use_admin_id` bigint(11) NULL DEFAULT 0,
  `use_admin_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `use_type` tinyint(4) NULL DEFAULT NULL,
  `a_time` datetime(0) NOT NULL,
  `validate_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `validate_period` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mm_accounhp_project_mc
-- ----------------------------
DROP TABLE IF EXISTS `mm_accounhp_project_mc`;
CREATE TABLE `mm_accounhp_project_mc`  (
  `id` bigint(11) UNSIGNED NOT NULL DEFAULT 0,
  `basic_id` bigint(20) NULL DEFAULT NULL,
  `pid` bigint(20) NULL DEFAULT NULL,
  `sid` bigint(20) NULL DEFAULT NULL,
  `mc_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mc_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mc_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mc_mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mc_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `balance` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `point` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `period` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `limit_discount_by_num` int(11) NULL DEFAULT 0,
  `min_recharge_money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a_time` datetime(0) NOT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `can_recharge` tinyint(11) NULL DEFAULT 1,
  `can_buy_with_online_pay` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `goods_discount` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mch_id` bigint(20) NULL DEFAULT NULL,
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amremark` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hardware_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive_time` datetime(0) NULL DEFAULT NULL,
  `old_id` bigint(20) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mm_account_project_mc_detail
-- ----------------------------
DROP TABLE IF EXISTS `mm_account_project_mc_detail`;
CREATE TABLE `mm_account_project_mc_detail`  (
  `id` bigint(11) UNSIGNED NOT NULL DEFAULT 0,
  `pid` bigint(20) NULL DEFAULT NULL,
  `acmid` bigint(20) NULL DEFAULT NULL,
  `order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `o_c` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a_time` datetime(0) NOT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `remarks` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `amount` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0.00',
  `num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `d_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `old_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mm_order_mc
-- ----------------------------
DROP TABLE IF EXISTS `mm_order_mc`;
CREATE TABLE `mm_order_mc`  (
  `id` bigint(11) UNSIGNED NOT NULL DEFAULT 0,
  `card_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `init_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '888888',
  `mch_id` bigint(20) NULL DEFAULT NULL,
  `acmid` bigint(20) NULL DEFAULT NULL,
  `basic_id` bigint(20) NULL DEFAULT NULL,
  `order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a_time` datetime(0) NULL DEFAULT NULL,
  `pay_time` datetime(0) NULL DEFAULT NULL,
  `take_time` datetime(0) NULL DEFAULT NULL,
  `pay_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `o_c` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `com_order` bigint(20) NULL DEFAULT NULL,
  `ops` tinyint(4) NOT NULL DEFAULT 0,
  `drawback_time` datetime(0) NULL DEFAULT NULL,
  `refund_time` datetime(0) NULL DEFAULT NULL,
  `gift_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` bigint(11) NOT NULL,
  `puid` bigint(11) NULL DEFAULT NULL,
  `puname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `s_id` bigint(20) NULL DEFAULT NULL,
  `s_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `store_id` bigint(20) NULL DEFAULT NULL,
  `store_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mc_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pre_item_id` bigint(20) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `id` bigint(11) UNSIGNED NOT NULL DEFAULT 0,
  `order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a_time` datetime(0) NULL DEFAULT NULL,
  `pay_time` datetime(0) NULL DEFAULT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `total_amount` decimal(10, 0) NULL DEFAULT NULL,
  `pay_amount` decimal(10, 0) NULL DEFAULT NULL,
  `oss` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dss` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyerid` bigint(20) NULL DEFAULT NULL,
  `buyername` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyerphone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyerprovincecode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyerprovincename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyercitycode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyercityname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyerzonecode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyerzonename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyeraddr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyerpoint` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` bigint(20) NULL DEFAULT NULL,
  `store_id` bigint(20) NULL DEFAULT NULL,
  `store_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ouid` bigint(20) NULL DEFAULT NULL,
  `ouname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store_info
-- ----------------------------
DROP TABLE IF EXISTS `store_info`;
CREATE TABLE `store_info`  (
  `id` bigint(11) UNSIGNED NOT NULL DEFAULT 0,
  `store_basic` bigint(20) NULL DEFAULT NULL,
  `store_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `store_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `store_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manager_id` bigint(20) NULL DEFAULT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `utimekey` bigint(20) NOT NULL DEFAULT 0,
  `duty_manager_id` bigint(20) NULL DEFAULT NULL,
  `proj_id` bigint(20) NULL DEFAULT NULL,
  `province_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zone_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_project_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_project_info`;
CREATE TABLE `sys_project_info`  (
  `id` bigint(11) UNSIGNED NOT NULL DEFAULT 0,
  `proj_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `proj_status` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `a_time` datetime(0) NULL DEFAULT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `config` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `proj_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `merch_id` bigint(20) NULL DEFAULT NULL,
  `custom_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `brief` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sms_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `root` tinyint(4) NOT NULL DEFAULT 0,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `proj_biz_clas` bigint(20) NULL DEFAULT NULL,
  `proj_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `indemc` tinyint(1) NOT NULL DEFAULT 0,
  `default_index` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sms_tpl` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `i_p_unique` tinyint(4) NOT NULL DEFAULT 1,
  `is_p_plat` tinyint(4) NOT NULL DEFAULT 0,
  `admin_tpl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fskin` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `depmode` tinyint(4) NOT NULL DEFAULT 0,
  `depmac` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dbpid` bigint(11) NULL DEFAULT 1,
  `rbpid` bigint(11) NULL DEFAULT 1
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_report_condition
-- ----------------------------
DROP TABLE IF EXISTS `sys_report_condition`;
CREATE TABLE `sys_report_condition`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `design_id` bigint(20) NULL DEFAULT NULL,
  `cond_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cond_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cond_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cond_expression` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cond_expression_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cond_where_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cond_view_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` tinyint(4) NULL DEFAULT NULL,
  `a_time` datetime(0) NULL DEFAULT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `design`(`design_id`) USING BTREE,
  INDEX `kw`(`design_id`, `cond_keyword`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_report_condition
-- ----------------------------
INSERT INTO `sys_report_condition` VALUES (1, 1, 'start_time', '开始时间', 'Date', '{\"orgExpression\":null,\"where\":null}', 'SQL', NULL, NULL, 0, '2019-04-27 12:41:32', '2019-04-27 12:41:32');
INSERT INTO `sys_report_condition` VALUES (2, 1, 'end_time', '结束时间', 'Date', '{\"orgExpression\":null,\"where\":null}', 'SQL', NULL, NULL, 0, '2019-04-27 12:41:32', '2019-04-27 12:41:32');
INSERT INTO `sys_report_condition` VALUES (24, 3, 'start_time', '开始时间', 'Date', '{\"orgExpression\":null,\"where\":null}', 'SQL', '', '', 0, '2019-04-28 17:50:09', '2019-04-28 17:50:09');
INSERT INTO `sys_report_condition` VALUES (25, 3, 'end_time', '结束时间', 'Date', '{\"orgExpression\":null,\"where\":null}', 'SQL', '', '', 0, '2019-04-28 17:50:09', '2019-04-28 17:50:09');
INSERT INTO `sys_report_condition` VALUES (26, 3, 'tclass_id', '票类', 'Select', '{\"orgExpression\":\"select id  , schema_name from `hp_ticketingsys`.ticket_price_schema where flag!=-1 order by id asc\",\"where\":[\"WHERE\",\" flag != -1 \"]}', 'SQL', 'id', 'schema_name', 0, '2019-04-28 17:50:09', '2019-04-28 17:50:09');

-- ----------------------------
-- Table structure for sys_report_design
-- ----------------------------
DROP TABLE IF EXISTS `sys_report_design`;
CREATE TABLE `sys_report_design`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报表编号 唯一',
  `report_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `report_desc` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `report_sql` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'sql ',
  `report_field` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '字段',
  `report_from` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `report_where` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `report_dimension` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `report_measure` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `proj_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `flag` tinyint(4) NULL DEFAULT NULL,
  `a_time` datetime(0) NULL DEFAULT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `report_no`(`report_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_report_design
-- ----------------------------
INSERT INTO `sys_report_design` VALUES (1, 'TRADE_BT_PT', '门店支付方式营收报表', NULL, 'SELECT\n	spi.proj_name AS 子项目,\n	si.store_name AS 门店,\n	DATE_FORMAT(tor.a_time  , \'%Y-%m-%d\') AS 日期,\n	CAST(\n		sum(\n			CASE\n			WHEN ti.pay_type = 001001\n			AND ouid IS NOT NULL THEN\n				tor.total_amount / 100\n			ELSE\n				0\n			END\n		) AS DECIMAL (18  , 2)\n	) AS 现金,\n	CAST(\n		sum(\n			CASE\n			WHEN ti.pay_type IN (\n				201101,\n				201102,\n				201001,\n				201002\n			)\n			AND ouid IS NOT NULL THEN\n				tor.total_amount / 100\n			ELSE\n				0\n			END\n		) AS DECIMAL (18  , 2)\n	) AS 微信支付,\n	\n	CAST(\n		sum(\n			CASE\n			WHEN ti.pay_type = 101001\n			AND ouid IS NOT NULL THEN\n				tor.total_amount / 100\n			ELSE\n				0\n			END\n		) AS DECIMAL (18  , 2)\n	) AS 会员储值,\n	CAST(\n		sum(\n			CASE\n			WHEN tp.pref_code = \'200\'\n			AND ouid IS NOT NULL THEN\n				tp.real_deduct / 100\n			ELSE\n				0\n			END\n		) AS DECIMAL (18  , 2)\n	) AS 券,\n	CAST(\n		sum(\n			CASE\n			WHEN ti.pay_type = \'90009000weixin\'\n			AND ouid IS NOT NULL THEN\n				tor.total_amount / 100\n			ELSE\n				0\n			END\n		) AS DECIMAL (18  , 2)\n	) AS 微信支付记账\nFROM\n	`hp_trade`.trade_info ti,\n	`hp_trade`.trade_order tor,\n	`hp_trade`.trade_preferential tp,\n	`hp_project`.sys_project_info spi,\n	`hp_project`.store_info si\nWHERE\n	ti.id \n\n = tp.t_id\nAND ti.id \n\n = tor.t_id\nAND spi.id \n\n = tor.pid\nAND si.id \n\n = tor.storeid\nAND tor.storeid IS NOT NULL\nAND ti.tss IN (\n	\'1000\',\n	\'1010\',\n	\'1020\',\n	\'2000\',\n	\'3000\'\n)\nAND tor.pid = \'\"${sys_kw_proj_id }\"\'\nAND tor.a_time >= \'\"${start_time}\" 00:00:00\'\nAND tor.a_time <= \'\"${end_time}\" 23:59:59\'\nGROUP BY\n	tor.storeid,\n	tor.a_time\nORDER BY\n	tor.a_time DESC\n', '[{\"key\":\"5e033d7aaa9d7ef98afa35111c357711\",\"expression\":\"spi.proj_name\",\"alias\":\"子项目\",\"view_name\":\"子项目\",\"orgViewName\":\"\"},{\"key\":\"9d9dc796378643145186b7ef88b9ed38\",\"expression\":\"si.store_name\",\"alias\":\"门店\",\"view_name\":\"门店\",\"orgViewName\":\"\"},{\"key\":\"c25a1d1631b49315c5849e7211036827\",\"expression\":\"DATE_FORMAT(tor.a_time , \'%Y-%m-%d\')\",\"alias\":\"日期\",\"view_name\":\"日期\",\"orgViewName\":\"\"},{\"key\":\"02777a84c7137f8b670b4f58bedbff50\",\"expression\":\"CAST(sum(CASE WHEN ti.pay_type = 001001 AND ouid IS NOT NULL THEN tor.total_amount / 100 ELSE 0 END) AS DECIMAL (18 , 2))\",\"alias\":\"现金\",\"view_name\":\"现金\",\"orgViewName\":\"\"},{\"key\":\"abe15c0ed496043713a4e357fc88a106\",\"expression\":\"CAST(sum(CASE WHEN ti.pay_type IN (201101 , 201102 , 201001 , 201002) AND ouid IS NOT NULL THEN tor.total_amount / 100 ELSE 0 END) AS DECIMAL (18 , 2))\",\"alias\":\"微信支付\",\"view_name\":\"微信支付\",\"orgViewName\":\"\"},{\"key\":\"e1fa331c35ffa6e7faf75d8160b11ee3\",\"expression\":\"CAST(sum(CASE WHEN ti.pay_type = 101001 AND ouid IS NOT NULL THEN tor.total_amount / 100 ELSE 0 END) AS DECIMAL (18 , 2))\",\"alias\":\"会员储值\",\"view_name\":\"会员储值\",\"orgViewName\":\"\"},{\"key\":\"5e63c9de7e1195138b41741245d3ca54\",\"expression\":\"CAST(sum(CASE WHEN tp.pref_code = \'200\' AND ouid IS NOT NULL THEN tp.real_deduct / 100 ELSE 0 END) AS DECIMAL (18 , 2))\",\"alias\":\"券\",\"view_name\":\"券\",\"orgViewName\":\"\"},{\"key\":\"e1c4cccbf1aec1d3ba3eae8085f3d776\",\"expression\":\"CAST(sum(CASE WHEN ti.pay_type = \'90009000weixin\' AND ouid IS NOT NULL THEN tor.total_amount / 100 ELSE 0 END) AS DECIMAL (18 , 2))\",\"alias\":\"微信支付记账\",\"view_name\":\"微信支付记账\",\"orgViewName\":\"\"}]', '`hp_trade`.trade_info ti , `hp_trade`.trade_order tor , `hp_trade`.trade_preferential tp , `hp_project`.sys_project_info spi , `hp_project`.store_info si', '[\"WHERE\",\" ti.id = tp.t_id \",\"AND\",\" ti.id = tor.t_id \",\"AND\",\" spi.id = tor.pid \",\"AND\",\" si.id = tor.storeid \",\"AND\",\" tor.storeid IS NOT NULL \",\"AND\",\" ti.tss IN (\'1000\' , \'1010\' , \'1020\' , \'2000\' , \'3000\') \",\"AND\",\" tor.pid = \'\"${sys_kw_proj_id }\"\' \",\"AND\",\" tor.a_time >= \'\"${start_time}\" 00:00:00\' \",\"AND\",\" tor.a_time <= \'\"${end_time}\" 23:59:59\' \"]', '[{\"key\":\"5e033d7aaa9d7ef98afa35111c357711\",\"expression\":\"spi.proj_name\",\"alias\":\"子项目\",\"view_name\":\"子项目\",\"orgViewName\":\"\"},{\"key\":\"9d9dc796378643145186b7ef88b9ed38\",\"expression\":\"si.store_name\",\"alias\":\"门店\",\"view_name\":\"门店\",\"orgViewName\":\"\"},{\"key\":\"c25a1d1631b49315c5849e7211036827\",\"expression\":\"DATE_FORMAT(tor.a_time , \'%Y-%m-%d\')\",\"alias\":\"日期\",\"view_name\":\"日期\",\"orgViewName\":\"\"}]', '[{\"key\":\"02777a84c7137f8b670b4f58bedbff50\",\"expression\":\"CAST(sum(CASE WHEN ti.pay_type = 001001 AND ouid IS NOT NULL THEN tor.total_amount / 100 ELSE 0 END) AS DECIMAL (18 , 2))\",\"alias\":\"现金\",\"view_name\":\"现金\",\"orgViewName\":\"\"},{\"key\":\"abe15c0ed496043713a4e357fc88a106\",\"expression\":\"CAST(sum(CASE WHEN ti.pay_type IN (201101 , 201102 , 201001 , 201002) AND ouid IS NOT NULL THEN tor.total_amount / 100 ELSE 0 END) AS DECIMAL (18 , 2))\",\"alias\":\"微信支付\",\"view_name\":\"微信支付\",\"orgViewName\":\"\"},{\"key\":\"e1fa331c35ffa6e7faf75d8160b11ee3\",\"expression\":\"CAST(sum(CASE WHEN ti.pay_type = 101001 AND ouid IS NOT NULL THEN tor.total_amount / 100 ELSE 0 END) AS DECIMAL (18 , 2))\",\"alias\":\"会员储值\",\"view_name\":\"会员储值\",\"orgViewName\":\"\"},{\"key\":\"5e63c9de7e1195138b41741245d3ca54\",\"expression\":\"CAST(sum(CASE WHEN tp.pref_code = \'200\' AND ouid IS NOT NULL THEN tp.real_deduct / 100 ELSE 0 END) AS DECIMAL (18 , 2))\",\"alias\":\"券\",\"view_name\":\"券\",\"orgViewName\":\"\"},{\"key\":\"e1c4cccbf1aec1d3ba3eae8085f3d776\",\"expression\":\"CAST(sum(CASE WHEN ti.pay_type = \'90009000weixin\' AND ouid IS NOT NULL THEN tor.total_amount / 100 ELSE 0 END) AS DECIMAL (18 , 2))\",\"alias\":\"微信支付记账\",\"view_name\":\"微信支付记账\",\"orgViewName\":\"\"}]', 1, 1, 0, '2019-04-27 12:41:32', '2019-04-27 12:41:32');
INSERT INTO `sys_report_design` VALUES (3, 'SALE_ORDER_BY_MM', '系统票务销售报表', NULL, 'select \no.store_name as 门店  , \no.hall_name as 影厅信息  , \no.film_name as 影片信息  , \no.plan_date as 场次日期  , \no.plan_time as 场次时间  , \no.pay_type as 支付方式,\no.a_time as 操作日期  , \ns.tclass_id,\nlog.uname as 售票员\nfrom \n`hp_ticketingsys`.data_tc_ss_sale_order_seat s left join \n`hp_ticketingsys`.data_tc_ss_sale_order_info o on s.order_id = o.id\njoin `hp_trade`.trade_order tro on s.order_id=tro.order_id\njoin `hp_trade`.trade_info tra on tro.t_id=tra.id \n\nleft join `hp_trade`.cashier_doer_log log on tra.log_id=log.id \n\n\nwhere o.order_status in (\'1000\'  , \'2000\'  , \'3000\')\nAND o.a_time >= \'\"${start_time}\" 00:00:00\'\nAND o.a_time <= \'\"${end_time}\" 23:59:59\'\nAND s.tclass_id=\"${tclass_id}\"', '[{\"key\":\"43c3213c925137346c984c52191d9d70\",\"expression\":\"o.store_name\",\"alias\":\"门店\",\"view_name\":\"门店\",\"orgViewName\":\"\"},{\"key\":\"1515c327113a8e59d81d59148e2d0e1d\",\"expression\":\"o.hall_name\",\"alias\":\"影厅信息\",\"view_name\":\"影厅信息\",\"orgViewName\":\"\"},{\"key\":\"ec96214c166d6befec994d1661a0a3a3\",\"expression\":\"o.film_name\",\"alias\":\"影片信息\",\"view_name\":\"影片信息\",\"orgViewName\":\"\"},{\"key\":\"c2f2985a9eac709dac81c0c281c6f56c\",\"expression\":\"o.plan_date\",\"alias\":\"场次日期\",\"view_name\":\"场次日期\",\"orgViewName\":\"\"},{\"key\":\"88bf35bc68c08db10f4bd7b3bb623ae4\",\"expression\":\"o.plan_time\",\"alias\":\"场次时间\",\"view_name\":\"场次时间\",\"orgViewName\":\"\"},{\"key\":\"2b8239b81f988db05ed57213b9aaeddf\",\"expression\":\"o.pay_type\",\"alias\":\"支付方式\",\"view_name\":\"支付方式\",\"orgViewName\":\"\"},{\"key\":\"373c1e34ad38ed43f80d3e2adf703c1a\",\"expression\":\"o.a_time\",\"alias\":\"操作日期\",\"view_name\":\"操作日期\",\"orgViewName\":\"\"},{\"key\":\"bccc9c3f97b4c6de15a610115282702e\",\"expression\":\"s.tclass_id\",\"alias\":null,\"view_name\":\"s.tclass_id\",\"orgViewName\":\"\"},{\"key\":\"f8bbac5b98ac8af8bc17034010c5df5b\",\"expression\":\"log.uname\",\"alias\":\"售票员\",\"view_name\":\"售票员\",\"orgViewName\":\"\"}]', '`hp_ticketingsys`.data_tc_ss_sale_order_seat s LEFT JOIN `hp_ticketingsys`.data_tc_ss_sale_order_info o ON s.order_id = o.id JOIN `hp_trade`.trade_order tro ON s.order_id = tro.order_id JOIN `hp_trade`.trade_info tra ON tro.t_id = tra.id LEFT JOIN `hp_trade`.cashier_doer_log log ON tra.log_id = log.id', '[\"WHERE\",\" o.order_status IN (\'1000\' , \'2000\' , \'3000\') \",\"AND\",\" o.a_time >= \'\"${start_time}\" 00:00:00\' \",\"AND\",\" o.a_time <= \'\"${end_time}\" 23:59:59\' \",\"AND\",\" s.tclass_id = \"${tclass_id}\" \"]', '[{\"key\":\"43c3213c925137346c984c52191d9d70\",\"expression\":\"o.store_name\",\"alias\":\"门店\",\"view_name\":\"门店\",\"orgViewName\":\"\"},{\"key\":\"1515c327113a8e59d81d59148e2d0e1d\",\"expression\":\"o.hall_name\",\"alias\":\"影厅信息\",\"view_name\":\"影厅信息\",\"orgViewName\":\"\"},{\"key\":\"ec96214c166d6befec994d1661a0a3a3\",\"expression\":\"o.film_name\",\"alias\":\"影片信息\",\"view_name\":\"影片信息\",\"orgViewName\":\"\"},{\"key\":\"c2f2985a9eac709dac81c0c281c6f56c\",\"expression\":\"o.plan_date\",\"alias\":\"场次日期\",\"view_name\":\"场次日期\",\"orgViewName\":\"\"},{\"key\":\"88bf35bc68c08db10f4bd7b3bb623ae4\",\"expression\":\"o.plan_time\",\"alias\":\"场次时间\",\"view_name\":\"场次时间\",\"orgViewName\":\"\"},{\"key\":\"2b8239b81f988db05ed57213b9aaeddf\",\"expression\":\"o.pay_type\",\"alias\":\"支付方式\",\"view_name\":\"支付方式\",\"orgViewName\":\"\"},{\"key\":\"373c1e34ad38ed43f80d3e2adf703c1a\",\"expression\":\"o.a_time\",\"alias\":\"操作日期\",\"view_name\":\"操作日期\",\"orgViewName\":\"\"},{\"key\":\"bccc9c3f97b4c6de15a610115282702e\",\"expression\":\"s.tclass_id\",\"alias\":null,\"view_name\":\"s.tclass_id\",\"orgViewName\":\"\"},{\"key\":\"f8bbac5b98ac8af8bc17034010c5df5b\",\"expression\":\"log.uname\",\"alias\":\"售票员\",\"view_name\":\"售票员\",\"orgViewName\":\"\"}]', '[]', 1, 1, 0, '2019-04-28 15:09:33', '2019-04-28 15:09:33');

-- ----------------------------
-- Table structure for trade_info
-- ----------------------------
DROP TABLE IF EXISTS `trade_info`;
CREATE TABLE `trade_info`  (
  `id` bigint(11) UNSIGNED NOT NULL DEFAULT 0,
  `pid` bigint(20) NULL DEFAULT NULL,
  `tnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tss` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `a_time` datetime(0) NULL DEFAULT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pay_time` datetime(0) NULL DEFAULT NULL,
  `pay_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `total_amount` decimal(16, 0) NULL DEFAULT NULL,
  `pay_amount` decimal(16, 0) NULL DEFAULT NULL,
  `tname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tbody` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `storeid` bigint(20) NULL DEFAULT NULL,
  `storename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyerid` bigint(20) NULL DEFAULT NULL,
  `buyerphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `buyername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trade_pay_info
-- ----------------------------
DROP TABLE IF EXISTS `trade_pay_info`;
CREATE TABLE `trade_pay_info`  (
  `id` bigint(11) UNSIGNED NOT NULL DEFAULT 0,
  `t_id` bigint(20) NULL DEFAULT NULL,
  `t_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_time` datetime(0) NULL DEFAULT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `trans_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trans_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trans_total_amount` decimal(10, 0) NULL DEFAULT NULL,
  `trans_pay_amount` decimal(10, 0) NULL DEFAULT NULL,
  `trans_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trans_get_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '10',
  `trans_cash_col` decimal(10, 0) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trade_preferential
-- ----------------------------
DROP TABLE IF EXISTS `trade_preferential`;
CREATE TABLE `trade_preferential`  (
  `id` bigint(11) UNSIGNED NOT NULL DEFAULT 0,
  `t_id` bigint(20) NULL DEFAULT NULL,
  `t_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_id` bigint(20) NULL DEFAULT NULL,
  `order_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oc` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pref_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pref_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pref_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pref_type` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '10',
  `a_time` datetime(0) NULL DEFAULT NULL,
  `c_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(4) NOT NULL DEFAULT 0,
  `max_deduct` decimal(10, 0) NULL DEFAULT NULL,
  `real_deduct` decimal(10, 0) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for data_goods_package
-- ----------------------------
DROP VIEW IF EXISTS `data_goods_package`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `data_goods_package` AS select `hp_scm`.`data_goods_package`.`id` AS `id`,`hp_scm`.`data_goods_package`.`pid` AS `pid`,`hp_scm`.`data_goods_package`.`name` AS `name`,`hp_scm`.`data_goods_package`.`info` AS `info`,`hp_scm`.`data_goods_package`.`sn` AS `sn`,`hp_scm`.`data_goods_package`.`cost_price` AS `cost_price`,`hp_scm`.`data_goods_package`.`rec_price` AS `rec_price`,`hp_scm`.`data_goods_package`.`sale_price` AS `sale_price`,`hp_scm`.`data_goods_package`.`a_time` AS `a_time`,`hp_scm`.`data_goods_package`.`c_time` AS `c_time`,`hp_scm`.`data_goods_package`.`flag` AS `flag`,`hp_scm`.`data_goods_package`.`unit` AS `unit`,`hp_scm`.`data_goods_package`.`pic_url` AS `pic_url` from `hp_scm`.`data_goods_package`;

-- ----------------------------
-- View structure for mm_account_project_mc
-- ----------------------------
DROP VIEW IF EXISTS `mm_account_project_mc`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `mm_account_project_mc` AS select `hp_crm`.`mm_account_project_mc`.`id` AS `id`,`hp_crm`.`mm_account_project_mc`.`basic_id` AS `basic_id`,`hp_crm`.`mm_account_project_mc`.`pid` AS `pid`,`hp_crm`.`mm_account_project_mc`.`sid` AS `sid`,`hp_crm`.`mm_account_project_mc`.`mc_num` AS `mc_num`,`hp_crm`.`mm_account_project_mc`.`mc_pwd` AS `mc_pwd`,`hp_crm`.`mm_account_project_mc`.`mc_name` AS `mc_name`,`hp_crm`.`mm_account_project_mc`.`mc_mobile` AS `mc_mobile`,`hp_crm`.`mm_account_project_mc`.`mc_level` AS `mc_level`,`hp_crm`.`mm_account_project_mc`.`balance` AS `balance`,`hp_crm`.`mm_account_project_mc`.`point` AS `point`,`hp_crm`.`mm_account_project_mc`.`period` AS `period`,`hp_crm`.`mm_account_project_mc`.`discount` AS `discount`,`hp_crm`.`mm_account_project_mc`.`limit_discount_by_num` AS `limit_discount_by_num`,`hp_crm`.`mm_account_project_mc`.`min_recharge_money` AS `min_recharge_money`,`hp_crm`.`mm_account_project_mc`.`a_time` AS `a_time`,`hp_crm`.`mm_account_project_mc`.`c_time` AS `c_time`,`hp_crm`.`mm_account_project_mc`.`flag` AS `flag`,`hp_crm`.`mm_account_project_mc`.`can_recharge` AS `can_recharge`,`hp_crm`.`mm_account_project_mc`.`can_buy_with_online_pay` AS `can_buy_with_online_pay`,`hp_crm`.`mm_account_project_mc`.`goods_discount` AS `goods_discount`,`hp_crm`.`mm_account_project_mc`.`mch_id` AS `mch_id`,`hp_crm`.`mm_account_project_mc`.`id_card` AS `id_card`,`hp_crm`.`mm_account_project_mc`.`amremark` AS `amremark`,`hp_crm`.`mm_account_project_mc`.`status` AS `status`,`hp_crm`.`mm_account_project_mc`.`hardware_id` AS `hardware_id`,`hp_crm`.`mm_account_project_mc`.`receive_time` AS `receive_time`,`hp_crm`.`mm_account_project_mc`.`old_id` AS `old_id` from `hp_crm`.`mm_account_project_mc`;

-- ----------------------------
-- View structure for mm_order_recharge_mc
-- ----------------------------
DROP VIEW IF EXISTS `mm_order_recharge_mc`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `mm_order_recharge_mc` AS select `hp_crm`.`mm_order_recharge_mc`.`id` AS `id`,`hp_crm`.`mm_order_recharge_mc`.`basic_id` AS `basic_id`,`hp_crm`.`mm_order_recharge_mc`.`order_no` AS `order_no`,`hp_crm`.`mm_order_recharge_mc`.`total_amount` AS `total_amount`,`hp_crm`.`mm_order_recharge_mc`.`pay_amount` AS `pay_amount`,`hp_crm`.`mm_order_recharge_mc`.`mch_id` AS `mch_id`,`hp_crm`.`mm_order_recharge_mc`.`a_time` AS `a_time`,`hp_crm`.`mm_order_recharge_mc`.`pay_time` AS `pay_time`,`hp_crm`.`mm_order_recharge_mc`.`pay_type` AS `pay_type`,`hp_crm`.`mm_order_recharge_mc`.`order_status` AS `order_status`,`hp_crm`.`mm_order_recharge_mc`.`o_c` AS `o_c`,`hp_crm`.`mm_order_recharge_mc`.`pic_url` AS `pic_url`,`hp_crm`.`mm_order_recharge_mc`.`pid` AS `pid`,`hp_crm`.`mm_order_recharge_mc`.`c_time` AS `c_time`,`hp_crm`.`mm_order_recharge_mc`.`flag` AS `flag`,`hp_crm`.`mm_order_recharge_mc`.`com_order` AS `com_order`,`hp_crm`.`mm_order_recharge_mc`.`store_id` AS `store_id`,`hp_crm`.`mm_order_recharge_mc`.`card_no` AS `card_no`,`hp_crm`.`mm_order_recharge_mc`.`taked_time` AS `taked_time`,`hp_crm`.`mm_order_recharge_mc`.`acmid` AS `acmid`,`hp_crm`.`mm_order_recharge_mc`.`ops` AS `ops`,`hp_crm`.`mm_order_recharge_mc`.`puid` AS `puid`,`hp_crm`.`mm_order_recharge_mc`.`puname` AS `puname`,`hp_crm`.`mm_order_recharge_mc`.`store_name` AS `store_name` from `hp_crm`.`mm_order_recharge_mc`;

-- ----------------------------
-- View structure for order_item
-- ----------------------------
DROP VIEW IF EXISTS `order_item`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `order_item` AS select `hp_scm`.`order_item`.`id` AS `id`,`hp_scm`.`order_item`.`order_id` AS `order_id`,`hp_scm`.`order_item`.`goods_id` AS `goods_id`,`hp_scm`.`order_item`.`goods_no` AS `goods_no`,`hp_scm`.`order_item`.`goods_name` AS `goods_name`,`hp_scm`.`order_item`.`goods_sku_id` AS `goods_sku_id`,`hp_scm`.`order_item`.`goods_sku_no` AS `goods_sku_no`,`hp_scm`.`order_item`.`goods_sku_name` AS `goods_sku_name`,`hp_scm`.`order_item`.`tycode` AS `tycode`,`hp_scm`.`order_item`.`buy_num` AS `buy_num`,`hp_scm`.`order_item`.`unit_amount` AS `unit_amount`,`hp_scm`.`order_item`.`pay_amount` AS `pay_amount`,`hp_scm`.`order_item`.`flag` AS `flag`,`hp_scm`.`order_item`.`fss` AS `fss`,`hp_scm`.`order_item`.`remark` AS `remark`,`hp_scm`.`order_item`.`pic_url` AS `pic_url` from `hp_scm`.`order_item`;

-- ----------------------------
-- View structure for trade_order
-- ----------------------------
DROP VIEW IF EXISTS `trade_order`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `trade_order` AS select `hp_trade`.`trade_order`.`id` AS `id`,`hp_trade`.`trade_order`.`t_id` AS `t_id`,`hp_trade`.`trade_order`.`order_id` AS `order_id`,`hp_trade`.`trade_order`.`order_num` AS `order_num`,`hp_trade`.`trade_order`.`order_data` AS `order_data`,`hp_trade`.`trade_order`.`oss` AS `oss`,`hp_trade`.`trade_order`.`total_amount` AS `total_amount`,`hp_trade`.`trade_order`.`pay_amount` AS `pay_amount`,`hp_trade`.`trade_order`.`tp_amount` AS `tp_amount`,`hp_trade`.`trade_order`.`pid` AS `pid`,`hp_trade`.`trade_order`.`a_time` AS `a_time`,`hp_trade`.`trade_order`.`c_time` AS `c_time`,`hp_trade`.`trade_order`.`flag` AS `flag`,`hp_trade`.`trade_order`.`oc` AS `oc`,`hp_trade`.`trade_order`.`storeid` AS `storeid`,`hp_trade`.`trade_order`.`storename` AS `storename`,`hp_trade`.`trade_order`.`buyerid` AS `buyerid`,`hp_trade`.`trade_order`.`buyerphone` AS `buyerphone`,`hp_trade`.`trade_order`.`buyername` AS `buyername`,`hp_trade`.`trade_order`.`ouid` AS `ouid`,`hp_trade`.`trade_order`.`ouname` AS `ouname` from `hp_trade`.`trade_order`;

SET FOREIGN_KEY_CHECKS = 1;
