/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50538
 Source Host           : localhost
 Source Database       : yue

 Target Server Type    : MySQL
 Target Server Version : 50538
 File Encoding         : utf-8

 Date: 11/01/2014 20:11:56 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `activities_info`
-- ----------------------------
DROP TABLE IF EXISTS `activities_info`;
CREATE TABLE `activities_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `org` varchar(255) NOT NULL,
  `userList` varchar(255) NOT NULL,
  `Count` int(10) unsigned NOT NULL,
  `isAnon` tinyint(1) NOT NULL,
  `expireTime` date NOT NULL,
  `photo` varchar(255) NOT NULL,
  `isFinished` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `activities_info`
-- ----------------------------
BEGIN;
INSERT INTO `activities_info` VALUES ('1', '139', 'yue', '139', '[\"139\",\"188\",\"152\"]', '3', '0', '2014-11-03', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `activities_status`
-- ----------------------------
DROP TABLE IF EXISTS `activities_status`;
CREATE TABLE `activities_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `actID` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `actID` (`actID`),
  CONSTRAINT `foreign_id` FOREIGN KEY (`actID`) REFERENCES `activities_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `activities_status`
-- ----------------------------
BEGIN;
INSERT INTO `activities_status` VALUES ('1', '139', '1', '0'), ('2', '188', '1', '0'), ('3', '152', '1', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
