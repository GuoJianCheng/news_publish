/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : news

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2020-12-07 16:06:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', '今日头条');
INSERT INTO `t_category` VALUES ('2', '综合资讯');
INSERT INTO `t_category` VALUES ('3', '国内新闻');
INSERT INTO `t_category` VALUES ('4', '国际新闻');

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `newsId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL,
  `contentTitle` varchar(120) DEFAULT NULL,
  `titlePicUrl` varchar(120) DEFAULT NULL,
  `content` text,
  `contentAbstract` varchar(300) DEFAULT NULL,
  `keywords` varchar(100) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `publishTime` datetime DEFAULT NULL,
  `clicks` int(11) DEFAULT NULL,
  `publishStatus` char(1) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`newsId`),
  KEY `categoryId` (`categoryId`),
  KEY `userId` (`userId`),
  CONSTRAINT `t_news_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `t_category` (`categoryId`),
  CONSTRAINT `t_news_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `t_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('1', '祖国七十大庆', '热烈庆祝祖国成立七十周年', null, '2019年5月，中共中央办公厅、国务院办公厅印发了《关于隆重庆祝中华人民共和国成立70周年广泛组织开展“我和我的祖国”群众性主题宣传教育活动的通知》，对庆祝中华人民共和国成立70周年群众性主题宣传教育活动作出安排部署。\r\n  2019年6月3日，国务院新闻办公室发布庆祝中华人民共和国成立70周年活动标识。\r\n  2019年6月17日，中宣部组织专家遴选了100首热情讴歌党、讴歌祖国、讴歌人民、讴歌英雄的优秀歌曲。并将这100首优秀歌曲汇编成册，出版《庆祝中华人民共和国成立70周年优秀歌曲100首》。\r\n  2019年8月16日9时，由中央宣传部、中央和国家机关工委、中央军委政治工作部、北京市委联合主办，人民网、新华网、央视网承办的庆祝中华人民共和国成立70周年系列论坛正式开启。\r\n  2019年8月29日，国务院新闻办举行庆祝中华人民共和国成立70周年活动有关情况发布会。中共中央、国务院、中央军委将颁发“庆祝中华人民共和国成立70周年”纪念章。庆祝中华人民共和国成立70周年大会10月1日举行，习近平将发表重要讲话。庆祝大会后，将举行盛大的阅兵式和群众游行（主词条：庆祝中华人民共和国成立70周年阅兵式）。\r\n  2019年9月7日至9月8日，在天安门地区及长安街沿线举行国庆70周年庆祝活动第一次全流程演练；9月14日至9月16日，天安门地区及长安街沿线将举行国庆70周年庆祝活动第二次全流程演练 [10]  ；9月21日至9月23日，天安门地区及长安街沿线将举行国庆70周年庆祝活动第三次全流程演练。\r\n  2019年9月17日，国家主席习近平签署主席令，根据十三届全国人大常委会第十三次会议17日下午表决通过的全国人大常委会关于授予国家勋章和国家荣誉称号的决定，授予42人国家勋章、国家荣誉称号。\r\n  2019年9月23日，“伟大历程 辉煌成就——庆祝中华人民共和国成立70周年大型成就展”开幕式在北京展览馆举行。\r\n  2019年9月23日，庆祝新中国成立七十周年活动新闻中心正式运行。\r\n  2019年9月27日，庆祝中华人民共和国成立70周年外国专家招待会在人民大会堂举行，中共中央政治局常委、国务院副总理韩正出席并致辞。\r\n  2019年9月29日，中华人民共和国国家勋章和国家荣誉称号颁授仪式将在人民大会堂隆重举行。\r\n  2019年9月30日是国家设立的烈士纪念日，当天上午，习近平等党和国家领导人将同各界代表一起，在天安门广场向人民英雄敬献花篮。\r\n  2019年10月1日，习近平总书记在庆祝中华人民共和国成立70周年大会上发表重要讲话，深情回顾人民共和国70年波澜壮阔的历史。在讲话结尾，他高呼，伟大的中华人民共和国万岁！伟大的中国共产党万岁！伟大的中国人民万岁！\r\n  党旗、国旗、军旗迎风招展。习近平驱车来到三面旗帜前停车肃立，向旗帜行注目礼。随后，习近平乘车沿着宽阔的长安街检阅部队。以“同心共筑中国梦”为主题的群众游行开始。游行分“建国创业”“改革开放”“伟大复兴”三个篇章，10万群众和70组彩车组成36个方阵和3个情境式行进。7万羽和平鸽展翅高飞，7万只气球腾空而起，伴着《歌唱祖国》的激昂旋律，庆祝大会圆满结束。同日，习近平签署通令，嘉奖参加庆祝中华人民共和国成立70周年阅兵全体人员。', '2019年10月1日是中华人民共和国成立70周年纪念日。庆祝中华人民共和国成立70周年大会于10月1日举行，习近平发表重要讲话。庆祝大会后，将举行盛大的庆祝中华人民共和国成立70周年阅兵式和群众游行。中共中央、国务院、中央军委颁发“庆祝中华人民共和国成立70周年”纪念章。', '中国 七十周年', '百度百科', '2019-12-11 14:54:46', null, '1', '1', null);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `roleId` int(11) NOT NULL,
  `roleName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '管理员');
INSERT INTO `t_role` VALUES ('2', '信息员');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `loginName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `registerTime` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `t_user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '无为', 'admin', '123456', null, null, '2', '1');
SET FOREIGN_KEY_CHECKS=1;
