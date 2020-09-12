
-- -----------------------------
-- Table structure for `blog_admin`
-- -----------------------------
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


-- -----------------------------
-- Table structure for `blog_admin_login_record`
-- -----------------------------
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


-- -----------------------------
-- Table structure for `blog_article`
-- -----------------------------
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='网站文章表';


-- -----------------------------
-- Table structure for `blog_category`
-- -----------------------------
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='网站栏目表';


-- -----------------------------
-- Table structure for `blog_comment`
-- -----------------------------
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


-- -----------------------------
-- Table structure for `blog_dictionary`
-- -----------------------------
DROP TABLE IF EXISTS `blog_dictionary`;
CREATE TABLE `blog_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(30) NOT NULL COMMENT '词语',
  `explanation` varchar(255) DEFAULT NULL COMMENT '名词解释',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(0：正常，1：禁用)',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='词典';

-- -----------------------------
-- Records of `blog_dictionary`
-- -----------------------------
INSERT INTO `blog_dictionary` VALUES ('1', 'dictionary', 'n. 字典；词典', '0', '1550384771', '1550384771');
INSERT INTO `blog_dictionary` VALUES ('2', '考试', 'examinationexamexamine', '0', '1550384771', '1550384771');
INSERT INTO `blog_dictionary` VALUES ('3', '测验', '1.用仪器或其他办法检验。2.考查学习成绩等：算术～。时事～。', '0', '1550384771', '1550384771');

-- -----------------------------
-- Table structure for `blog_login_record`
-- -----------------------------
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


-- -----------------------------
-- Table structure for `blog_notice`
-- -----------------------------
DROP TABLE IF EXISTS `blog_notice`;
CREATE TABLE `blog_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` mediumtext COMMENT '内容',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_notice_title` (`title`) USING BTREE,
  KEY `index_notice_sort` (`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='网站公告表';


-- -----------------------------
-- Table structure for `blog_slider`
-- -----------------------------
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


-- -----------------------------
-- Table structure for `blog_user`
-- -----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(20) DEFAULT NULL COMMENT '用户名',
  `phone` varchar(15) DEFAULT NULL COMMENT '手机号',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `heading` varchar(60) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户表';

-- -----------------------------
-- Records of `blog_user`
-- -----------------------------
INSERT INTO `blog_user` VALUES ('1', 'test', '123456', '测试', '15976012214', '2868813344444@qq.com', '', '', '0', '1550384771', '1550384771');
INSERT INTO `blog_user` VALUES ('2', 'zhangsan', '123456', '张三', '15976032214', '2822268812@qq.com', '', '', '0', '1550384771', '1550384771');
INSERT INTO `blog_user` VALUES ('3', 'lisi', '12345', 'lisi', '1352838848', '34@qq.com', '', '', '0', '0', '');
INSERT INTO `blog_user` VALUES ('4', '2222', '888888', '', '15976021214', '286863096@qq.com', '', '', '0', '1568550720', '1568550720');

-- -----------------------------
-- Table structure for `blog_website_link`
-- -----------------------------
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

