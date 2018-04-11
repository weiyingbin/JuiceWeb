/*
Navicat MySQL Data Transfer

Source Server         : localhost_MySQL
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : dcxy

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-05-22 15:00:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chanpin
-- ----------------------------
DROP TABLE IF EXISTS `chanpin`;
CREATE TABLE `chanpin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(500) NOT NULL,
  `state` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `photo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chanpin
-- ----------------------------
INSERT INTO `chanpin` VALUES ('1', '李子', '水果', '李子味酸，能促进胃酸和胃消化酶的分泌，并能促进胃肠蠕动，因而有改善食欲，促进消化的作用，尤其对胃酸缺乏、食后饱胀、大便秘结者有效。新鲜李肉中的丝氨酸、甘氨酸、脯氨酸、谷酰胺等氨基酸，有利尿消肿的作用，对肝硬化有辅助治疗效果。', '10', '');
INSERT INTO `chanpin` VALUES ('2', '西瓜', '水果', '西瓜堪称“盛夏之王”，清爽解渴，味道甘味多汁，是盛夏佳果，西瓜除不含脂肪和胆固醇外，含有大量葡萄糖、苹果酸、果糖、蛋白氨基酸、番茄素及丰富的维生素C等物质，是一种富有很高的营养、纯净、食用安全食品。瓤肉含糖量一般为5-12%，包括葡萄糖、果糖和蔗糖。甜度随成熟后期蔗糖的增加而增加。', '20', '');
INSERT INTO `chanpin` VALUES ('3', '桃子', '水果', '桃子素有“寿桃”和“仙桃”的美称，因其肉质鲜美，又被称为“天下第一果”。桃肉含蛋白质、脂肪、碳水化合物、粗纤维、钙、磷、铁、胡萝卜素、维生素B1、以及有机酸（主要是苹果酸和柠檬酸）、糖分（主要是葡萄糖、果糖、蔗糖、木糖）和挥发油。每100克鲜桃中所含水分占比88%，蛋白质约有0.7克，碳水化合物11克，热量只有180.0千焦。桃子适宜低血钾和缺铁性贫血患者食用。', '25', '');
INSERT INTO `chanpin` VALUES ('4', '樱桃', '水果', '用于脾胃虚弱，少食腹泻，或脾胃阴伤，口舌干燥；肝肾不足，腰膝酸软，四肢乏力，或遗精；血虚，头晕心悸，面色不华，面部雀斑等顽固性斑类可起淡化作用。', '70', '');
INSERT INTO `chanpin` VALUES ('5', '蓝莓', '水果', '蓝莓果肉细腻，风味独特，酸甜适度，又具有香爽宜人的香气。蓝莓中诸如蛋白质、维生素等的常规营养成分含量十分丰富，矿物质和微量元素含量也相当可观，因此，蓝莓被称为“水果皇后”的确是名符其实。', '50', '');

-- ----------------------------
-- Table structure for pinglun
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `neirong` varchar(255) DEFAULT NULL,
  `ptime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pinglun
-- ----------------------------
INSERT INTO `pinglun` VALUES ('1', '1', '这里的水果特别的新鲜', '2017-05-19 09:54:53');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zhangsan', '921789@qq.com', '178987654', '*A4B6157319038724E3560894F7F932C8886EBFCF');
INSERT INTO `user` VALUES ('2', 'lisi', 'lisi@qq.com', '18973678978', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257');
INSERT INTO `user` VALUES ('4', 'huluyun', '908776@qq.com', '178965467899', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257');
INSERT INTO `user` VALUES ('5', 'huluyun', '908776@qq.com', '178965467899', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257');
INSERT INTO `user` VALUES ('6', 'huluyun', '908776@qq.com', '178965467899', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257');
INSERT INTO `user` VALUES ('8', 'hulu', 'huku@qq.com', ' 17897654345', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257');
INSERT INTO `user` VALUES ('9', '胡露芸', '908776@qq.com', '178965467899', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257');
