/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : hdsx

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 08/08/2023 15:31:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `collection_id` bigint NOT NULL AUTO_INCREMENT COMMENT '征收编号',
  `unit_id` bigint NOT NULL COMMENT '所属单位编号',
  `collection_date` timestamp NOT NULL COMMENT '征收日期',
  `collection_amount` decimal(10,2) NOT NULL COMMENT '征收金额',
  `collection_user` varchar(50) DEFAULT NULL COMMENT '操作人员',
  PRIMARY KEY (`collection_id`) USING BTREE,
  KEY `unit_id` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of collection
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for collection_decision
-- ----------------------------
DROP TABLE IF EXISTS `collection_decision`;
CREATE TABLE `collection_decision` (
  `decision_id` bigint NOT NULL AUTO_INCREMENT COMMENT '决定书编号',
  `unit_id` bigint NOT NULL COMMENT '单位编号',
  `decision_date` date NOT NULL COMMENT '决定日期',
  `employee_id` bigint NOT NULL COMMENT '职工编号',
  `decision_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '决定书类型',
  `decision_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '决定书描述',
  PRIMARY KEY (`decision_id`) USING BTREE,
  KEY `unit_id` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of collection_decision
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for collection_statistics
-- ----------------------------
DROP TABLE IF EXISTS `collection_statistics`;
CREATE TABLE `collection_statistics` (
  `ststistic_id` bigint NOT NULL AUTO_INCREMENT COMMENT '统计编号',
  `statistic_date` date NOT NULL COMMENT '统计日期',
  `total_collection` decimal(10,2) NOT NULL COMMENT '总征收金额',
  `total_expenditure` decimal(10,2) DEFAULT NULL COMMENT '总使用金额',
  `total_balance` decimal(10,2) DEFAULT NULL COMMENT '余额',
  PRIMARY KEY (`ststistic_id`) USING BTREE,
  KEY `unit_id` (`statistic_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of collection_statistics
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for data_backup_restore
-- ----------------------------
DROP TABLE IF EXISTS `data_backup_restore`;
CREATE TABLE `data_backup_restore` (
  `backup_id` bigint NOT NULL AUTO_INCREMENT COMMENT '备份编号',
  `backup_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备份名称',
  `backup_date` date NOT NULL COMMENT '备份日期',
  `backup_file_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备份文件路径',
  PRIMARY KEY (`backup_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of data_backup_restore
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for employee_approval
-- ----------------------------
DROP TABLE IF EXISTS `employee_approval`;
CREATE TABLE `employee_approval` (
  `approval_id` bigint NOT NULL AUTO_INCREMENT COMMENT '审核编号',
  `unit_id` bigint NOT NULL COMMENT '所属单位的编号',
  `employee_id` bigint NOT NULL COMMENT '员工编号',
  `approval_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '审核状态',
  `approval_comments` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '审核意见',
  PRIMARY KEY (`approval_id`) USING BTREE,
  KEY `unit_employee_id` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of employee_approval
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for expenditure
-- ----------------------------
DROP TABLE IF EXISTS `expenditure`;
CREATE TABLE `expenditure` (
  `expenditure_id` bigint NOT NULL AUTO_INCREMENT COMMENT '使用编号',
  `unit_id` bigint NOT NULL COMMENT '所属单位的编号',
  `expenditure_date` date NOT NULL COMMENT '使用日期',
  `expenditure_amount` decimal(10,2) NOT NULL COMMENT '使用金额',
  `expenditure_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作人员',
  PRIMARY KEY (`expenditure_id`) USING BTREE,
  KEY `unit_id` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of expenditure
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for insurance_payment
-- ----------------------------
DROP TABLE IF EXISTS `insurance_payment`;
CREATE TABLE `insurance_payment` (
  `payment_id` bigint NOT NULL AUTO_INCREMENT COMMENT '缴纳编号',
  `unit_id` bigint NOT NULL COMMENT '所属单位的编号',
  `payment_date` timestamp NOT NULL COMMENT '缴纳日期',
  `payment_amount` decimal(10,2) NOT NULL COMMENT '缴纳金额',
  `payment_method` varchar(50) DEFAULT NULL COMMENT '缴纳方式',
  `payment_status` varchar(20) DEFAULT NULL COMMENT '缴纳状态',
  PRIMARY KEY (`payment_id`) USING BTREE,
  KEY `unit_id` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of insurance_payment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for operation_log
-- ----------------------------
DROP TABLE IF EXISTS `operation_log`;
CREATE TABLE `operation_log` (
  `log_id` bigint NOT NULL COMMENT '操作记录编号',
  `user_id` bigint NOT NULL COMMENT '执行操作的用户编号',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `operation_content` varchar(200) NOT NULL COMMENT '操作内容',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of operation_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for permission_management
-- ----------------------------
DROP TABLE IF EXISTS `permission_management`;
CREATE TABLE `permission_management` (
  `permission_id` bigint NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `permission_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限名称',
  `permission_description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限描述',
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of permission_management
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for reduction_waiver
-- ----------------------------
DROP TABLE IF EXISTS `reduction_waiver`;
CREATE TABLE `reduction_waiver` (
  `reduction_waiver_id` bigint NOT NULL,
  `unit_id` bigint NOT NULL,
  `reduction_reason` varchar(200) DEFAULT NULL,
  `reduction_amount` decimal(10,2) DEFAULT NULL,
  `reduction_data` date DEFAULT NULL,
  PRIMARY KEY (`reduction_waiver_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of reduction_waiver
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for role_management
-- ----------------------------
DROP TABLE IF EXISTS `role_management`;
CREATE TABLE `role_management` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of role_management
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for unit_employee
-- ----------------------------
DROP TABLE IF EXISTS `unit_employee`;
CREATE TABLE `unit_employee` (
  `employee_id` bigint NOT NULL AUTO_INCREMENT,
  `unit_id` bigint NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `position` varchar(100) DEFAULT NULL,
  `disability_type` varchar(100) DEFAULT NULL,
  `is_approval` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`employee_id`) USING BTREE,
  KEY `unit_id` (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1688725757313945602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of unit_employee
-- ----------------------------
BEGIN;
INSERT INTO `unit_employee` (`employee_id`, `unit_id`, `employee_name`, `position`, `disability_type`, `is_approval`) VALUES (1, 1, '李开峰', '董事长', '1', 1);
COMMIT;

-- ----------------------------
-- Table structure for unit_profile
-- ----------------------------
DROP TABLE IF EXISTS `unit_profile`;
CREATE TABLE `unit_profile` (
  `unit_id` bigint NOT NULL AUTO_INCREMENT COMMENT '单位编号',
  `unit_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '单位名称',
  `unit_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '单位地址',
  `contact_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '单位联系人',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '单位联系电话',
  `type_id` bigint DEFAULT NULL COMMENT '类型编号',
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of unit_profile
-- ----------------------------
BEGIN;
INSERT INTO `unit_profile` (`unit_id`, `unit_name`, `unit_address`, `contact_person`, `contact_phone`, `type_id`) VALUES (1, '政府', '德源街道', '市长', '19999999999', 1);
COMMIT;

-- ----------------------------
-- Table structure for unit_type
-- ----------------------------
DROP TABLE IF EXISTS `unit_type`;
CREATE TABLE `unit_type` (
  `type_id` bigint NOT NULL COMMENT '类型编号',
  `type_name` varchar(50) DEFAULT NULL COMMENT '类型名称',
  `type_desc` varchar(200) DEFAULT NULL COMMENT '类型描述',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of unit_type
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user_management
-- ----------------------------
DROP TABLE IF EXISTS `user_management`;
CREATE TABLE `user_management` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码加密值',
  `permission_id` bigint NOT NULL COMMENT '权限编号',
  `role_id` bigint NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_management
-- ----------------------------
BEGIN;
INSERT INTO `user_management` (`user_id`, `username`, `password`, `permission_id`, `role_id`) VALUES (1, 'admin', '123456', 1, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
