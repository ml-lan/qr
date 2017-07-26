/*
Navicat MySQL Data Transfer

Source Server         : 139.199.113.163
Source Server Version : 50718
Source Host           : 139.199.113.163:3306
Source Database       : erweidb2

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-07-26 15:24:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `sphone` varchar(11) DEFAULT NULL,
  `spass` varchar(255) DEFAULT NULL,
  `slastlogintime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('00000000000', '000000', '2017-07-16 14:25:44');

-- ----------------------------
-- Table structure for `dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dxyname` varchar(255) DEFAULT NULL,
  `dxiname` varchar(255) DEFAULT NULL,
  `dzyname` varchar(255) DEFAULT NULL,
  `dnjname` varchar(255) DEFAULT NULL,
  `dbjname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('37', '计算机', '网络工程', '网络工程', '2014', '1402');

-- ----------------------------
-- Table structure for `erwei`
-- ----------------------------
DROP TABLE IF EXISTS `erwei`;
CREATE TABLE `erwei` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `teacherid` int(11) DEFAULT NULL,
  `ecodepass` varchar(255) DEFAULT NULL,
  `estarttime` datetime DEFAULT NULL,
  `eserverpath` varchar(255) DEFAULT NULL,
  `eerweipath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erwei
-- ----------------------------

-- ----------------------------
-- Table structure for `messagerecord`
-- ----------------------------
DROP TABLE IF EXISTS `messagerecord`;
CREATE TABLE `messagerecord` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mcontent` varchar(500) DEFAULT NULL,
  `mdate` datetime DEFAULT NULL,
  `mformid` int(11) DEFAULT NULL,
  `mtoid` int(11) DEFAULT NULL,
  `misread` int(1) DEFAULT '1' COMMENT '1表示未读\r\n2表示已读',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messagerecord
-- ----------------------------

-- ----------------------------
-- Table structure for `qdrecord`
-- ----------------------------
DROP TABLE IF EXISTS `qdrecord`;
CREATE TABLE `qdrecord` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `studentno` int(11) DEFAULT NULL,
  `qdate` datetime DEFAULT NULL,
  `qtime` time DEFAULT NULL,
  `qstarttime` time DEFAULT NULL,
  `qteachermsg` int(2) DEFAULT NULL COMMENT '如果有直九表示 缺勤',
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=557 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qdrecord
-- ----------------------------
INSERT INTO `qdrecord` VALUES ('512', '128', '2017-07-26 00:00:00', '14:47:59', '15:00:00', null);
INSERT INTO `qdrecord` VALUES ('513', '100', '2017-07-26 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('514', '119', '2017-07-26 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('515', '120', '2017-07-26 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('516', '121', '2017-07-26 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('517', '122', '2017-07-26 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('518', '123', '2017-07-26 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('519', '124', '2017-07-26 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('520', '125', '2017-07-26 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('521', '126', '2017-07-26 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('522', '127', '2017-07-26 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('523', '129', '2017-07-26 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('524', '990', '2017-07-26 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('525', '991', '2017-07-26 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('526', '992', '2017-07-26 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('527', '993', '2017-07-26 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('528', '994', '2017-07-26 00:00:00', '00:00:00', '15:00:00', '1');
INSERT INTO `qdrecord` VALUES ('529', '128', '2017-07-26 00:00:00', '14:50:58', '08:00:00', null);
INSERT INTO `qdrecord` VALUES ('530', '128', '2017-07-26 00:00:00', '15:03:42', '14:00:00', null);
INSERT INTO `qdrecord` VALUES ('531', '120', '2017-07-26 00:00:00', '15:03:43', '14:00:00', null);
INSERT INTO `qdrecord` VALUES ('532', '119', '2017-07-26 00:00:00', '15:03:57', '14:00:00', null);
INSERT INTO `qdrecord` VALUES ('533', '991', '2017-07-26 00:00:00', '15:03:58', '14:00:00', null);
INSERT INTO `qdrecord` VALUES ('534', '994', '2017-07-26 00:00:00', '15:04:09', '14:00:00', null);
INSERT INTO `qdrecord` VALUES ('535', '123', '2017-07-26 00:00:00', '15:04:12', '14:00:00', null);
INSERT INTO `qdrecord` VALUES ('536', '127', '2017-07-26 00:00:00', '15:04:22', '14:00:00', null);
INSERT INTO `qdrecord` VALUES ('537', '994', '2017-07-26 00:00:00', '15:06:54', '16:00:00', null);
INSERT INTO `qdrecord` VALUES ('538', '128', '2017-07-26 00:00:00', '15:06:55', '16:00:00', null);
INSERT INTO `qdrecord` VALUES ('539', '123', '2017-07-26 00:00:00', '15:06:55', '16:00:00', null);
INSERT INTO `qdrecord` VALUES ('540', '127', '2017-07-26 00:00:00', '15:07:05', '16:00:00', null);
INSERT INTO `qdrecord` VALUES ('541', '120', '2017-07-26 00:00:00', '15:07:06', '16:00:00', null);
INSERT INTO `qdrecord` VALUES ('542', '119', '2017-07-26 00:00:00', '15:07:08', '16:00:00', null);
INSERT INTO `qdrecord` VALUES ('543', '121', '2017-07-26 00:00:00', '15:07:09', '16:00:00', null);
INSERT INTO `qdrecord` VALUES ('544', '129', '2017-07-26 00:00:00', '15:07:39', '16:00:00', null);
INSERT INTO `qdrecord` VALUES ('545', '121', '2017-07-26 00:00:00', '13:00:00', '11:00:00', null);
INSERT INTO `qdrecord` VALUES ('546', '100', '2017-07-26 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('547', '122', '2017-07-26 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('548', '124', '2017-07-26 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('549', '125', '2017-07-26 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('550', '126', '2017-07-26 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('551', '990', '2017-07-26 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('552', '991', '2017-07-26 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('553', '992', '2017-07-26 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('554', '993', '2017-07-26 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('555', '995', '2017-07-26 00:00:00', '00:00:00', '16:00:00', '1');
INSERT INTO `qdrecord` VALUES ('556', '121', '2017-07-26 00:00:00', '15:20:02', '14:00:00', null);

-- ----------------------------
-- Table structure for `qingjiarecord`
-- ----------------------------
DROP TABLE IF EXISTS `qingjiarecord`;
CREATE TABLE `qingjiarecord` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `studentno` int(11) DEFAULT NULL,
  `qres` varchar(255) DEFAULT NULL,
  `qdate` datetime DEFAULT NULL,
  `qisread` int(1) DEFAULT '1' COMMENT '1表示未读  0表示已读',
  `qresult` int(1) DEFAULT NULL COMMENT '0 同意  1不同意',
  `teacherno` int(11) DEFAULT NULL,
  `qshiyou` int(255) DEFAULT NULL COMMENT '0事假 1 病假',
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qingjiarecord
-- ----------------------------
INSERT INTO `qingjiarecord` VALUES ('67', '128', '11', '2017-07-19 00:00:00', '1', null, '34', '1');
INSERT INTO `qingjiarecord` VALUES ('68', '120', '病了', '2017-07-19 00:00:00', '0', '0', '34', '1');

-- ----------------------------
-- Table structure for `starttime`
-- ----------------------------
DROP TABLE IF EXISTS `starttime`;
CREATE TABLE `starttime` (
  `sid` int(11) NOT NULL,
  `stime` time DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of starttime
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sno` int(11) NOT NULL AUTO_INCREMENT COMMENT 'sno表示学号',
  `sname` varchar(255) NOT NULL,
  `ssex` int(1) DEFAULT NULL,
  `sphone` varchar(11) NOT NULL,
  `spassword` varchar(255) DEFAULT NULL,
  `classno` int(11) DEFAULT NULL,
  PRIMARY KEY (`sno`,`sphone`),
  KEY `水电费` (`classno`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`classno`) REFERENCES `dictionary` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=996 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('100', 'aaa', '1', '18309299172', '18309299172', '37');
INSERT INTO `student` VALUES ('119', '王旭阳', '1', '13359249892', '123456', '37');
INSERT INTO `student` VALUES ('120', '许乐', '1', '18291955723', '1111', '37');
INSERT INTO `student` VALUES ('121', '任泽蒙', '1', '18291958713', '11111111', '37');
INSERT INTO `student` VALUES ('122', '许杰', '1', '18309294671', '1427525810', '37');
INSERT INTO `student` VALUES ('123', '许杰', '1', '18309294671', '1427525810', '37');
INSERT INTO `student` VALUES ('124', '白晓', '1', '13720748398', '123456', '37');
INSERT INTO `student` VALUES ('125', '周璐璐', '1', '18309299172', '132465798', '37');
INSERT INTO `student` VALUES ('126', '周璐璐', '1', '18309299172', '132465798', '37');
INSERT INTO `student` VALUES ('127', '林婧雯', '1', '15319737232', '123456', '37');
INSERT INTO `student` VALUES ('128', '杨洋', '1', '17674786133', '1', '37');
INSERT INTO `student` VALUES ('129', '李幸', '1', '18392005106', 'lucklios', '37');
INSERT INTO `student` VALUES ('990', 'aaa', '1', '18309299172', '18309299172', '37');
INSERT INTO `student` VALUES ('991', '闵乾祺', '1', '15667079621', '123456', '37');
INSERT INTO `student` VALUES ('992', '就是就是', '1', '12345678910', '1', '37');
INSERT INTO `student` VALUES ('993', '寇佳文', '1', '18292418948', '123456', '37');
INSERT INTO `student` VALUES ('994', '武督', '1', '18229036123', '123456', '37');
INSERT INTO `student` VALUES ('995', '魏昕', '1', '1839200523', '123', '37');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tphone` varchar(11) NOT NULL,
  `tname` varchar(255) NOT NULL,
  `tsex` int(1) NOT NULL DEFAULT '1',
  `tpassword` varchar(255) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('34', '18502999188', '雷老师', '0', '000');

-- ----------------------------
-- Table structure for `teacherclass`
-- ----------------------------
DROP TABLE IF EXISTS `teacherclass`;
CREATE TABLE `teacherclass` (
  `tcid` int(11) NOT NULL AUTO_INCREMENT,
  `teacherid` int(11) DEFAULT NULL,
  `dictionaryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`tcid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacherclass
-- ----------------------------
INSERT INTO `teacherclass` VALUES ('30', '34', '37');
