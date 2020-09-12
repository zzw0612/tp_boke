/*
Navicat MySQL Data Transfer

Source Server         : tp5
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : tp51

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2020-09-12 17:38:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_admin
-- ----------------------------
DROP TABLE IF EXISTS `blog_admin`;
CREATE TABLE `blog_admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户头像',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `qq` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系QQ',
  `mail` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系手机号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注说明',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态(1:禁用,0:启用,)',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_admin_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='网站管理员表';

-- ----------------------------
-- Records of blog_admin
-- ----------------------------

-- ----------------------------
-- Table structure for blog_admin_login_record
-- ----------------------------
DROP TABLE IF EXISTS `blog_admin_login_record`;
CREATE TABLE `blog_admin_login_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '1' COMMENT '登录类型（0：退出，1：登录）',
  `user_id` int(11) DEFAULT NULL COMMENT '系统用户ID（0：账户不存在）',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录IP地址',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0：成功，1：失败）',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='网站管理员登录记录';

-- ----------------------------
-- Records of blog_admin_login_record
-- ----------------------------

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '文章类型',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '网站编辑id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `cover_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章封面',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章描述',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章内容',
  `recommend` int(10) DEFAULT '0' COMMENT '推荐级别',
  `praise` int(11) DEFAULT '0' COMMENT '点赞量',
  `clicks` int(10) DEFAULT '0' COMMENT '点击量',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_article_title` (`title`) USING BTREE,
  KEY `index_article_sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='网站文章表';

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES ('1', '24', '1', '学习python课程第二十七天', 'articleuploads/20200812/610e5c8eaa51a0da63471ee2245122e4.jpg', '摘要：一. TCP协议的三次握手和四次挥手: 首先传输层的由来: 网络层的ip帮我们区分子网,以太网层的mac帮我们找到主机,然后大家使用的都是应用 程序. 你的电脑上可能同时开启QQ、暴风影音等多个应用程序,那么我们通过ip和mac找到了一台特定的主机,如 何表示这台主机上的应用程序,答案就是端口,', '<p style=\"font-size: 13px; margin: 10px auto; color: rgb(75, 75, 75); font-family: verdana, Arial, helvetica, sans-seriff; white-space: normal;\">TCP协议:</p><p style=\"font-size: 13px; margin: 10px auto; color: rgb(75, 75, 75); font-family: verdana, Arial, helvetica, sans-seriff; white-space: normal;\">　　也成为可靠传输/好人协议/流式协议,TCP数据报没有长度限制,理论上可以无限长,但是为了保证网络的效率,</p><p style=\"font-size: 13px; margin: 10px auto; color: rgb(75, 75, 75); font-family: verdana, Arial, helvetica, sans-seriff; white-space: normal;\">　　通常TCP数据报的长度不会超过IP数据报的长度,以确保单个TCP数据包不必再分割</p><p style=\"font-size: 13px; margin: 10px auto; color: rgb(75, 75, 75); font-family: verdana, Arial, helvetica, sans-seriff; white-space: normal;\">　　了解:之所以称TCP协议为可靠协议或者好人协议,是因为无论是谁发过来的连接请求,它都会进行相应并与</p><p style=\"font-size: 13px; margin: 10px auto; color: rgb(75, 75, 75); font-family: verdana, Arial, helvetica, sans-seriff; white-space: normal;\">　　其连接</p><p><br/></p>', '0', '0', '0', '0', null, '0', '1597235524', '1597235524');
INSERT INTO `blog_article` VALUES ('2', '25', '1', '海贼王王路飞', 'articleuploads/20200812/36cd3ec3a5178c490f3e68b75232ab42.jpg', 'ONE PIECE”在故事中为“一个大秘宝”之意。故事描述男主角‘草帽’蒙其·D·路飞为了当上“海贼王”而踏上“伟大航道”及与其伙伴的经历。传说中‘海贼王’哥尔·D·罗杰在死前说出他留下了具有财富、名声、力量世界第一的宝藏“ONE PIECE”，许多人为了争夺“ONE PIECE”争相出海，许多海贼开始树立霸权，而形成“大海贼时代”。十年后，路飞为了要实现梦想和因救他而断臂的四皇‘红发’香克斯的约定而出海，在遥远的路途上找寻着志同道合的伙伴，一起去“伟大航道”，目标当上“海贼王”。', '<p><span style=\"color: rgb(50, 62, 50); font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(217, 229, 190);\">ONE PIECE”在故事中为“一个大秘宝”之意。故事描述男主角‘草帽’</span><span style=\"color:#000000;line-height: 21px; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(217, 229, 190);\">蒙其·D·路飞</span><span style=\"color: rgb(50, 62, 50); font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(217, 229, 190);\">为了当上“海贼王”而踏上“</span><span style=\"color:#000000;line-height: 21px; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(217, 229, 190);\">伟大航道</span><span style=\"color: rgb(50, 62, 50); font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(217, 229, 190);\">”及与其伙伴的经历。传说中‘海贼王’</span><span style=\"color:#000000;line-height: 21px; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(217, 229, 190);\">哥尔·D·罗杰</span><span style=\"color: rgb(50, 62, 50); font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(217, 229, 190);\">在死前说出他留下了具有财富、名声、力量世界第一的宝藏“ONE PIECE”，许多人为了争夺“ONE PIECE”争相出海，许多海贼开始树立霸权，而形成“</span><span style=\"color:#000000;line-height: 21px; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(217, 229, 190);\">大海贼时代</span><span style=\"color: rgb(50, 62, 50); font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(217, 229, 190);\">”。十年后，路飞为了要实现梦想和因救他而断臂的</span><span style=\"color:#000000;line-height: 21px; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(217, 229, 190);\">四皇</span><span style=\"color: rgb(50, 62, 50); font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(217, 229, 190);\">‘红发’</span><span style=\"color:#000000;line-height: 21px; font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(217, 229, 190);\">香克斯</span><span style=\"color: rgb(50, 62, 50); font-family: 宋体; font-size: 14px; white-space: normal; background-color: rgb(217, 229, 190);\">的约定而出海，在遥远的路途上找寻着志同道合的伙伴，一起去“伟大航道”，目标当上“海贼王”。</span></p>', '0', '0', '2', '0', null, '0', '1597235581', '1597235581');

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目标题',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(0：正常，1：禁用)',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_nav_title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='网站栏目表';

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES ('24', '最新文章', null, '0', '0', '1597235118', '1597235118');
INSERT INTO `blog_category` VALUES ('25', '热点文章', null, '0', '0', '1597235186', '1597235186');

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(10) NOT NULL COMMENT '文章编号',
  `user_id` int(11) NOT NULL COMMENT '会员标号',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_comment_article_id` (`article_id`) USING BTREE,
  KEY `index_comment_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='文章评论表';

-- ----------------------------
-- Records of blog_comment
-- ----------------------------

-- ----------------------------
-- Table structure for blog_login_record
-- ----------------------------
DROP TABLE IF EXISTS `blog_login_record`;
CREATE TABLE `blog_login_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '1' COMMENT '登录类型（0：退出，1：登录）',
  `user_id` int(11) DEFAULT NULL COMMENT '网站编辑ID',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录IP地址',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='网站编辑登录记录';

-- ----------------------------
-- Records of blog_login_record
-- ----------------------------

-- ----------------------------
-- Table structure for blog_notice
-- ----------------------------
DROP TABLE IF EXISTS `blog_notice`;
CREATE TABLE `blog_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_notice_title` (`title`) USING BTREE,
  KEY `index_notice_sort` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='网站公告表';

-- ----------------------------
-- Records of blog_notice
-- ----------------------------
INSERT INTO `blog_notice` VALUES ('1', '学习python课程第二十七天', '<p><a class=\"postTitle2 vertical-middle\" href=\"http://undefined\" style=\"color: rgb(0, 0, 0); font-family: verdana, Arial, helvetica, sans-seriff; font-size: 14.7px; font-weight: 700; white-space: normal;\"><span style=\"vertical-align: middle;\">学习python课程第二十七天</span></a></p>', '0', null, '0', '1597235471', '1597235471');
INSERT INTO `blog_notice` VALUES ('2', '海贼王路飞 ', '<p>这是初始的文本</p>', '0', null, '0', '1597235662', '1597235662');

-- ----------------------------
-- Table structure for blog_slider
-- ----------------------------
DROP TABLE IF EXISTS `blog_slider`;
CREATE TABLE `blog_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `image` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图片',
  `href` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '轮播图片链接',
  `target` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '_blank' COMMENT '弹出方式',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_slider_title` (`title`) USING BTREE,
  KEY `index_slider_sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='网站轮播图';

-- ----------------------------
-- Records of blog_slider
-- ----------------------------

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `sex` tinyint(1) DEFAULT '0' COMMENT '性别（0：男，1：女）',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_user_username` (`username`) USING BTREE,
  KEY `index_user_phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='网站编辑表';

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES ('1', 'zzw', 'zzw', null, '0', '0', null, null);
INSERT INTO `blog_user` VALUES ('2', 'admin', 'admin', null, '0', '0', '1599900155', '1599900155');
INSERT INTO `blog_user` VALUES ('3', 'test', 'asd', null, '0', '0', '1599901311', '1599901311');

-- ----------------------------
-- Table structure for blog_website_link
-- ----------------------------
DROP TABLE IF EXISTS `blog_website_link`;
CREATE TABLE `blog_website_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '站点名称',
  `website_logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '网站LOGO',
  `href` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '#' COMMENT '链接地址',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `sort` int(255) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='站点友链';

-- ----------------------------
-- Records of blog_website_link
-- ----------------------------
