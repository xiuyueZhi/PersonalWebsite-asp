/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : message

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-06-10 17:36:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `noteId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `notetime` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `root` int(11) DEFAULT NULL,
  PRIMARY KEY (`noteId`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('107', 'admin', '2017-06-09 21:08:59', '::1', '远在远方的', '远在远方的风比远方更远', '0');
INSERT INTO `note` VALUES ('108', 'admin', '2017-06-09 21:09:17', '::1', '风后面是风', '风后面是风', '107');
INSERT INTO `note` VALUES ('109', 'admin', '2017-06-09 21:09:32', '::1', '天空上面是天空', '天空上面是天空', '107');
INSERT INTO `note` VALUES ('110', 'admin', '2017-06-09 21:13:13', '::1', '张嘉佳说：', '张嘉佳说：沙城就是一个人的记忆。', '0');
INSERT INTO `note` VALUES ('111', 'user1', '2017-06-09 21:29:11', '::1', '道路前面还是道路', '道路前面还是道路', '107');
INSERT INTO `note` VALUES ('112', 'user1', '2017-06-09 21:30:16', '::1', '如果你不往前走，就会被沙子掩埋。', '如果你不往前走，就会被沙子掩埋。', '110');
INSERT INTO `note` VALUES ('113', 'user1', '2017-06-09 21:32:31', '::1', '最好的时光', '最好的时光就是现在~', '0');
INSERT INTO `note` VALUES ('114', 'user1', '2017-06-09 21:42:35', '::1', 'Have a nice day!', 'Have a nice day!', '113');
INSERT INTO `note` VALUES ('115', 'user2', '2017-06-09 21:45:52', '::1', '海子  哈哈', '海子  哈哈', '107');
INSERT INTO `note` VALUES ('116', 'user2', '2017-06-09 21:46:44', '::1', '阳光下的星星', '阳光下的星星', '110');
INSERT INTO `note` VALUES ('117', 'user2', '2017-06-09 21:47:36', '::1', '有时我们失控。', '有时我们失控。', '113');
INSERT INTO `note` VALUES ('118', 'user2', '2017-06-09 21:49:37', '::1', '我希望有个', '我希望有个如你一般的人\r\n如山间清爽的风 如古城温暖的光', '0');
INSERT INTO `note` VALUES ('119', 'user2', '2017-06-09 21:53:14', '::1', '老太太拄着', '老太太拄着拐杖，站在酒吧里，痛骂年轻人一顿，抖出张发黄的字条说：“这是老头写给我的，读给你们听。哎呦呆逼，拿错了，这是电费催缴单。”', '0');
INSERT INTO `note` VALUES ('120', 'user2', '2017-06-09 21:54:10', '::1', '这是哪一篇呢？~', '这是哪一篇呢？~', '119');
INSERT INTO `note` VALUES ('165', 'user2', '2017-06-10 16:53:19', '::1', '笑着逃亡', '笑着逃亡', '118');
INSERT INTO `note` VALUES ('166', 'user2', '2017-06-10 16:55:00', '::1', '  亲爱的刘雪同志', '  亲爱的刘雪同志', '119');
INSERT INTO `note` VALUES ('167', 'user2', '2017-06-10 16:58:55', '::1', '兔子说：我', '兔子说：我们点个啥披萨来着？\r\n大熊说：老样子。', '0');
INSERT INTO `note` VALUES ('168', 'user2', '2017-06-10 16:59:57', '::1', '兔子：披萨店吗？请来个大份半胡萝卜 半三文鱼 加软糖的披萨。', '兔子：披萨店吗？请来个大份半胡萝卜 半三文鱼 加软糖的披萨。', '167');
INSERT INTO `note` VALUES ('169', 'user3', '2017-06-10 17:05:21', '::1', '沙城就是一个人的记忆', '沙城就是一个人的记忆', '110');
INSERT INTO `note` VALUES ('170', 'user3', '2017-06-10 17:05:48', '::1', '。。。。。', '。。。。。', '113');
INSERT INTO `note` VALUES ('171', 'user3', '2017-06-10 17:06:21', '::1', '来说说最近', '来说说最近热映的电影吧~', '0');
INSERT INTO `note` VALUES ('172', 'user3', '2017-06-10 17:07:13', '::1', '加勒比海盗', '加勒比海盗', '171');
INSERT INTO `note` VALUES ('173', 'user3', '2017-06-10 17:07:29', '::1', '神奇女侠', '神奇女侠', '171');
INSERT INTO `note` VALUES ('185', 'user3', '2017-06-10 17:29:04', '::1', '道路前面还是道路', '道路前面还是道路', '107');
INSERT INTO `note` VALUES ('186', 'user3', '2017-06-10 17:29:53', '::1', '从你的全世界路过', '从你的全世界路过', '110');
INSERT INTO `note` VALUES ('187', 'user3', '2017-06-10 17:30:13', '::1', '从你的全世界路过', '从你的全世界路过', '118');
INSERT INTO `note` VALUES ('188', 'user3', '2017-06-10 17:30:54', '::1', '（==）', '（==）', '119');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('19', 'admin', '17826856352@163.com', 'admin1234');
INSERT INTO `user` VALUES ('20', 'user1', '17826856352@163.com', 'user123');
INSERT INTO `user` VALUES ('21', 'user2', '17826856352@163.com', 'user234');
INSERT INTO `user` VALUES ('22', 'user3', '674323831@qq.com', 'user345');

-- ----------------------------
-- Table structure for votecontent
-- ----------------------------
DROP TABLE IF EXISTS `votecontent`;
CREATE TABLE `votecontent` (
  `optionId` int(11) NOT NULL AUTO_INCREMENT,
  `option` varchar(255) DEFAULT NULL,
  `infoId` int(11) DEFAULT NULL,
  `num` int(255) DEFAULT NULL,
  PRIMARY KEY (`optionId`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of votecontent
-- ----------------------------
INSERT INTO `votecontent` VALUES ('97', '牧羊少年的奇幻之旅', '25', '0');
INSERT INTO `votecontent` VALUES ('98', '达芬奇密码', '25', '2');
INSERT INTO `votecontent` VALUES ('99', '向着光亮那方', '25', '0');
INSERT INTO `votecontent` VALUES ('100', '麦田里的守望者', '25', '1');
INSERT INTO `votecontent` VALUES ('101', '布朗尼', '26', '1');
INSERT INTO `votecontent` VALUES ('102', '黑巧克力慕斯', '26', '1');
INSERT INTO `votecontent` VALUES ('103', '松仁蛋奶', '26', '0');
INSERT INTO `votecontent` VALUES ('104', '芒果慕斯', '26', '1');
INSERT INTO `votecontent` VALUES ('105', '云南', '27', '1');
INSERT INTO `votecontent` VALUES ('106', '三亚', '27', '0');
INSERT INTO `votecontent` VALUES ('107', '北京', '27', '2');
INSERT INTO `votecontent` VALUES ('108', '桂林', '27', '0');
INSERT INTO `votecontent` VALUES ('109', '重金属', '28', '0');
INSERT INTO `votecontent` VALUES ('110', '民谣', '28', '0');
INSERT INTO `votecontent` VALUES ('111', '轻音乐', '28', '0');
INSERT INTO `votecontent` VALUES ('112', '摇滚', '28', '1');

-- ----------------------------
-- Table structure for voteinfo
-- ----------------------------
DROP TABLE IF EXISTS `voteinfo`;
CREATE TABLE `voteinfo` (
  `infoId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `total` int(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`infoId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of voteinfo
-- ----------------------------
INSERT INTO `voteinfo` VALUES ('25', '你更喜欢读哪一本书呢？', '3', '1');
INSERT INTO `voteinfo` VALUES ('26', '哪款蛋糕是你的最爱？', '3', '0');
INSERT INTO `voteinfo` VALUES ('27', '最佳的毕业旅行之地是？', '3', '1');
INSERT INTO `voteinfo` VALUES ('28', '你更愿意听哪种类型的音乐？', '1', '0');
