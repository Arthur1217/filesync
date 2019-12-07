/*
Navicat MySQL Data Transfer

Source Server         : LayerMgr_VM_3306
Source Server Version : 50728
Source Host           : 192.168.18.128:3306
Source Database       : task

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2019-12-07 19:22:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for actuator
-- ----------------------------
DROP TABLE IF EXISTS `actuator`;
CREATE TABLE `actuator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_name` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '执行器名称',
  `server_type` int(2) DEFAULT NULL COMMENT '执行器类型  1.HttpClient  2.HtmlUnit  3.selenium-无界面 4.selenium-带界面  5.Shell  6.App',
  `version` varchar(8) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '版本',
  `url` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'url',
  `option_param` varchar(500) DEFAULT NULL COMMENT '自定义参数',
  `sequence` varchar(255) DEFAULT NULL COMMENT '唯一序列号',
  `executor_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='执行器参数主表';

-- ----------------------------
-- Records of actuator
-- ----------------------------
INSERT INTO `actuator` VALUES ('40', 'execut-video', '7', '1.0', 'https://www.youtube.com/watch?v=-UTJX2HdIPE', '{\"taskId\":\"test-taskId-video-0001\",\"subTaskId\":\"test-subTaskId-video-0001\"}', '3c71118c68f741d4a348a828a7304a7a', '2019-12-05 17:51:54');

-- ----------------------------
-- Table structure for cookie
-- ----------------------------
DROP TABLE IF EXISTS `cookie`;
CREATE TABLE `cookie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '用户密码',
  `domain` varchar(500) DEFAULT NULL COMMENT '域名链接',
  `cookie` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cookie
-- ----------------------------

-- ----------------------------
-- Table structure for execut_status
-- ----------------------------
DROP TABLE IF EXISTS `execut_status`;
CREATE TABLE `execut_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence` varchar(255) DEFAULT NULL COMMENT '唯一序列号',
  `begin_time` datetime DEFAULT NULL COMMENT '执行开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '执行结束时间',
  `execut_status` varchar(100) DEFAULT NULL COMMENT '执行器状态',
  `msg` varchar(255) DEFAULT NULL COMMENT '状态说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of execut_status
-- ----------------------------
INSERT INTO `execut_status` VALUES ('34', '3c71118c68f741d4a348a828a7304a7a', '2019-12-06 18:32:32', '2019-12-06 18:34:08', '10149', '下载完成');

-- ----------------------------
-- Table structure for operation
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actuator_id` int(11) DEFAULT NULL COMMENT '执行器表id',
  `action` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '事件',
  `xpath` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `seq` varchar(8) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'xpaht序号',
  `input` varchar(255) DEFAULT NULL COMMENT '对于input事件类型，该字段提供输入值',
  `manual` int(11) DEFAULT NULL COMMENT '1.程序自动   0.人工参数',
  `wait` int(11) DEFAULT NULL COMMENT '等待此记录xpath出现才执行 1.等待   0.不等待  ',
  `timeout` int(11) DEFAULT NULL COMMENT '超时时间  秒为单位',
  `is_save` int(11) DEFAULT NULL COMMENT '是否保存',
  `save_type` varchar(30) DEFAULT NULL COMMENT '保存类型  值：html,mht',
  `result_addr` varchar(100) DEFAULT NULL COMMENT '发送至kafka地址',
  `result_topic` varchar(100) DEFAULT NULL COMMENT '发送至kafka topic名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES ('42', '40', 'download', null, '0', 'https://www.youtube.com/watch?v=E28u7uHtlTg', '0', '0', '0', '1', 'video', null, null);

-- ----------------------------
-- Table structure for user_agent
-- ----------------------------
DROP TABLE IF EXISTS `user_agent`;
CREATE TABLE `user_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_agent` varchar(255) DEFAULT NULL COMMENT 'user-agent',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_agent
-- ----------------------------
INSERT INTO `user_agent` VALUES ('1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:50.0) Gecko/20100101 Firefox/50.0');
INSERT INTO `user_agent` VALUES ('2', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/14.0.835.163');
INSERT INTO `user_agent` VALUES ('3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11');
