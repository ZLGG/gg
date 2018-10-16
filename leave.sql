/*
Navicat MySQL Data Transfer

Source Server         : 888
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : leave

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-10-16 17:46:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `operation_id` int(32) NOT NULL AUTO_INCREMENT,
  `operation_user` varchar(16) DEFAULT NULL,
  `operation_time` timestamp NULL DEFAULT NULL,
  `operation_result` varchar(255) DEFAULT NULL,
  `operation_reason` varchar(255) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`operation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('48', '请假人', '2018-10-16 16:32:14', '申请请假', '无', '31');
INSERT INTO `history` VALUES ('49', '请假人', '2018-10-16 16:32:30', '申请请假', '无', '32');
INSERT INTO `history` VALUES ('50', '请假人', '2018-10-16 16:32:42', '申请请假', '无', '33');
INSERT INTO `history` VALUES ('51', '请假人', '2018-10-16 16:32:58', '申请请假', '无', '34');
INSERT INTO `history` VALUES ('52', '请假人', '2018-10-16 16:33:27', '申请请假', '无', '35');
INSERT INTO `history` VALUES ('53', '请假人', '2018-10-16 16:33:59', '申请请假', '无', '36');
INSERT INTO `history` VALUES ('54', 'user0', '2018-10-16 16:46:45', '同意申请', '无', '31');
INSERT INTO `history` VALUES ('55', 'user0', '2018-10-16 16:46:48', '同意申请', '无', '32');
INSERT INTO `history` VALUES ('56', 'user1', '2018-10-16 16:47:01', '一级审批通过', '无', '32');
INSERT INTO `history` VALUES ('57', 'user2', '2018-10-16 16:47:36', '未通过二级审批,请重新申请', '我是user2 我要拒绝你了', '32');
INSERT INTO `history` VALUES ('58', 'user0', '2018-10-16 16:47:52', '同意申请', '无', '34');
INSERT INTO `history` VALUES ('59', 'user1', '2018-10-16 16:48:07', '一级审批通过', '无', '34');
INSERT INTO `history` VALUES ('60', 'user2', '2018-10-16 16:48:17', '二级审批通过', '无', '34');
INSERT INTO `history` VALUES ('61', 'user3', '2018-10-16 16:48:26', '三级审批通过', '无', '34');
INSERT INTO `history` VALUES ('62', '请假人', '2018-10-16 16:54:46', '重新申请', '无', '32');
INSERT INTO `history` VALUES ('63', 'user0', '2018-10-16 17:43:31', '不同意申请,请重新申请', '', '33');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请单id',
  `record_proposer` varchar(255) DEFAULT NULL COMMENT '申请人',
  `record_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '请假开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '请假结束时间',
  `record_reason` varchar(255) DEFAULT NULL COMMENT '请假原因',
  `type_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT '0',
  `editable` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('31', '请假人', '2018-10-16 16:32:14', '2018-10-06 00:00:00', '2018-10-20 00:00:00', '我请的是事假', '2', '1', '1');
INSERT INTO `record` VALUES ('32', '请假人', '2018-10-16 16:32:30', '2018-10-06 00:00:00', '2018-10-13 00:00:00', '我请的是年假 这是我第二次申请了', '1', '0', '1');
INSERT INTO `record` VALUES ('33', '请假人', '2018-10-16 16:32:42', '2018-10-06 00:00:00', '2018-10-20 00:00:00', '呵呵', '1', '5', '1');
INSERT INTO `record` VALUES ('34', '请假人', '2018-10-16 16:32:58', '2018-10-05 00:00:00', '2018-10-27 00:00:00', '哈哈 我生病啦', '3', '4', '1');
INSERT INTO `record` VALUES ('35', '请假人', '2018-10-16 16:33:27', '2018-10-06 00:00:00', '2018-10-13 00:00:00', '这个要全部通过', '1', '0', '1');
INSERT INTO `record` VALUES ('36', '请假人', '2018-10-16 16:33:59', '2018-10-06 00:00:00', '2018-10-27 00:00:00', '这个要被拒绝 然后可编辑', '2', '0', '1');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL COMMENT '状态id',
  `status_name` varchar(255) DEFAULT NULL COMMENT '状态名字',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('0', '申请中');
INSERT INTO `status` VALUES ('1', '一级批准中');
INSERT INTO `status` VALUES ('2', '二级批准中');
INSERT INTO `status` VALUES ('3', '三级审批中');
INSERT INTO `status` VALUES ('4', '全部通过');
INSERT INTO `status` VALUES ('5', '被拒绝,等待重新申请');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `type_id` int(11) NOT NULL COMMENT '类型id',
  `type_name` varchar(16) DEFAULT NULL COMMENT '类型名字',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '年假');
INSERT INTO `type` VALUES ('2', '事假');
INSERT INTO `type` VALUES ('3', '病假');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `authority` tinyint(4) DEFAULT NULL COMMENT '0:批准申请 1: 批准一级 2:批准二级 3:批准三级 -1:没有权限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('user0', '1', '0');
INSERT INTO `user` VALUES ('请假人', '1', '-1');
INSERT INTO `user` VALUES ('user1', '1', '1');
INSERT INTO `user` VALUES ('user2', '1', '2');
INSERT INTO `user` VALUES ('user3', '1', '3');
INSERT INTO `user` VALUES ('user22', '1', '2');
