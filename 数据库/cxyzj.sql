/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : cxyzj

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-01-22 20:01:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章表的ID',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '文章作者的用户名',
  `title` varchar(50) DEFAULT NULL COMMENT '文章的标题',
  `create_time` bigint(20) DEFAULT NULL COMMENT '文章创建日期',
  `update_time` bigint(20) DEFAULT NULL COMMENT '最近更新时间',
  `article_sum` text COMMENT '文章简介\n',
  `type_id` bigint(20) DEFAULT NULL COMMENT '类型',
  `views` int(11) DEFAULT NULL COMMENT '浏览量',
  `comments` int(11) DEFAULT NULL COMMENT '评论数',
  `collections` int(11) DEFAULT NULL COMMENT '收藏数',
  `content_url` text COMMENT '文章url',
  `title_image_url` text COMMENT '题图url',
  `ban` tinyint(4) DEFAULT NULL COMMENT '表示文章是否该被封禁',
  PRIMARY KEY (`article_id`),
  KEY `fk_user_article_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_article_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article_collection
-- ----------------------------
DROP TABLE IF EXISTS `article_collection`;
CREATE TABLE `article_collection` (
  `article_id` bigint(20) unsigned NOT NULL COMMENT '文章id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '收藏用户的id',
  KEY `fk_collect_article1_idx` (`article_id`),
  CONSTRAINT `fk_collect_article1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article_comment
-- ----------------------------
DROP TABLE IF EXISTS `article_comment`;
CREATE TABLE `article_comment` (
  `article_comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `article_id` bigint(20) unsigned DEFAULT NULL COMMENT '文章的ID',
  `discusser` bigint(20) NOT NULL COMMENT '发出评论的用户ID',
  `text` text NOT NULL COMMENT '评论正文500字',
  `create_time` bigint(20) NOT NULL COMMENT '评论的创建时间',
  PRIMARY KEY (`article_comment_id`),
  KEY `fk_comment_user_article1_idx` (`article_id`),
  CONSTRAINT `fk_comment_user_article1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article_draft
-- ----------------------------
DROP TABLE IF EXISTS `article_draft`;
CREATE TABLE `article_draft` (
  `article_draft_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章表的ID',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '	文章作者的用户ID',
  `title` varchar(50) DEFAULT NULL COMMENT '文章的标题\n',
  `create_time` bigint(20) DEFAULT NULL COMMENT '文章创建日期',
  `update_time` bigint(20) DEFAULT NULL COMMENT '最近更新时间',
  `content_url` text COMMENT '文章内容url',
  `title_image_url` text COMMENT '题图url',
  PRIMARY KEY (`article_draft_id`),
  KEY `fk_user_article_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_article_user10` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article_reply
-- ----------------------------
DROP TABLE IF EXISTS `article_reply`;
CREATE TABLE `article_reply` (
  `article_reply_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '	回复的编号',
  `article_comment_id` bigint(20) unsigned NOT NULL COMMENT '	评论的编号',
  `replier` bigint(20) NOT NULL COMMENT '发出回复的用户ID',
  `user_id` bigint(20) NOT NULL COMMENT '被回复的用户ID',
  `re_time` bigint(20) NOT NULL COMMENT '回复时间',
  `text` text NOT NULL COMMENT '回复内容500字',
  PRIMARY KEY (`article_reply_id`),
  KEY `fk_reply_comment1_idx` (`article_comment_id`),
  CONSTRAINT `fk_reply_comment1` FOREIGN KEY (`article_comment_id`) REFERENCES `article_comment` (`article_comment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article_top
-- ----------------------------
DROP TABLE IF EXISTS `article_top`;
CREATE TABLE `article_top` (
  `article_top_id` bigint(20) NOT NULL COMMENT '置顶表主键',
  `article_id` bigint(20) unsigned NOT NULL COMMENT '文章表主键',
  `top_time` bigint(20) DEFAULT NULL COMMENT '置顶时间',
  PRIMARY KEY (`article_top_id`,`article_id`),
  KEY `fk_top_article1_idx` (`article_id`),
  CONSTRAINT `fk_top_article1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for article_type
-- ----------------------------
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `article_id` bigint(20) unsigned NOT NULL COMMENT '文章的主键',
  `type_name` varchar(50) DEFAULT NULL COMMENT '类别名',
  PRIMARY KEY (`article_id`),
  CONSTRAINT `fk_article_type_article1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for attention
-- ----------------------------
DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention` (
  `attention_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '关注表的编号',
  `follower` bigint(20) unsigned NOT NULL COMMENT '发出关注的用户名（id）',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '被关注的用户名（id）',
  PRIMARY KEY (`attention_id`),
  KEY `fk_attention_user1_idx` (`follower`),
  KEY `fk_attention_user2_idx` (`user_id`),
  CONSTRAINT `fk_attention_user1` FOREIGN KEY (`follower`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_attention_user2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for board
-- ----------------------------
DROP TABLE IF EXISTS `board`;
CREATE TABLE `board` (
  `board_id` bigint(20) NOT NULL COMMENT '版块表主键',
  `img_url` varchar(60) NOT NULL COMMENT '版块图片路径',
  `board_url` varchar(100) NOT NULL COMMENT '版块链接',
  `seq` int(11) NOT NULL COMMENT '板块次序',
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course_category
-- ----------------------------
DROP TABLE IF EXISTS `course_category`;
CREATE TABLE `course_category` (
  `course_category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '一级列表ID(主键)',
  `title` varchar(45) DEFAULT NULL COMMENT '标题',
  `seq` int(11) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`course_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course_collection
-- ----------------------------
DROP TABLE IF EXISTS `course_collection`;
CREATE TABLE `course_collection` (
  `course_collection_id` bigint(20) NOT NULL COMMENT '教程集合ID(主键)',
  `course_detail_category_id` bigint(20) NOT NULL COMMENT '对应二级列表ID',
  `title` varchar(45) DEFAULT NULL COMMENT '标题',
  `seq` int(11) DEFAULT NULL COMMENT '序号',
  `summary` varchar(50) DEFAULT NULL COMMENT '摘要',
  PRIMARY KEY (`course_collection_id`),
  KEY `fk_school_listlv3_school_listlv21_idx` (`course_detail_category_id`),
  CONSTRAINT `fk_school_listlv3_school_listlv21` FOREIGN KEY (`course_detail_category_id`) REFERENCES `course_detail_category` (`course_detail_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course_comment
-- ----------------------------
DROP TABLE IF EXISTS `course_comment`;
CREATE TABLE `course_comment` (
  `course_comment_id` bigint(20) NOT NULL COMMENT '评论ID(主键)',
  `course_id` bigint(20) unsigned NOT NULL COMMENT '教程ID',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `comment_time` bigint(20) DEFAULT NULL COMMENT '评论日期',
  `content` text COMMENT '内容',
  PRIMARY KEY (`course_comment_id`),
  KEY `fk_comment_user1_idx` (`user_id`),
  KEY `fk_comment_course_info1_idx` (`course_id`),
  CONSTRAINT `fk_comment_course_info1` FOREIGN KEY (`course_id`) REFERENCES `course_info` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course_detail_category
-- ----------------------------
DROP TABLE IF EXISTS `course_detail_category`;
CREATE TABLE `course_detail_category` (
  `course_detail_category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '二级列表ID(主键)',
  `course_category_id` bigint(20) NOT NULL COMMENT '对应一级列表ID',
  `title` varchar(45) DEFAULT NULL COMMENT '标题',
  `seq` int(11) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`course_detail_category_id`),
  KEY `fk_school_listlv2_school_listlv11_idx` (`course_category_id`),
  CONSTRAINT `fk_school_listlv2_school_listlv11` FOREIGN KEY (`course_category_id`) REFERENCES `course_category` (`course_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course_draft
-- ----------------------------
DROP TABLE IF EXISTS `course_draft`;
CREATE TABLE `course_draft` (
  `course_draft_id` bigint(20) NOT NULL COMMENT '教程ID(主键)',
  `title` varchar(45) DEFAULT NULL COMMENT '标题',
  `author_id` bigint(20) unsigned NOT NULL COMMENT '作者ID',
  `createtime` bigint(20) DEFAULT NULL COMMENT '创建日期',
  `content_url` text COMMENT '内容的url',
  PRIMARY KEY (`course_draft_id`),
  KEY `fk_course_info_user1_idx` (`author_id`),
  CONSTRAINT `fk_course_info_user10` FOREIGN KEY (`author_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course_info
-- ----------------------------
DROP TABLE IF EXISTS `course_info`;
CREATE TABLE `course_info` (
  `course_id` bigint(20) unsigned NOT NULL COMMENT '教程ID(主键)',
  `title` varchar(45) DEFAULT NULL COMMENT '标题',
  `seq` int(11) DEFAULT NULL COMMENT '序号',
  `author_id` bigint(20) unsigned NOT NULL COMMENT '作者',
  `source` varchar(45) DEFAULT NULL COMMENT '来源',
  `createdate` bigint(20) DEFAULT NULL COMMENT '创建日期',
  `update_time` bigint(20) DEFAULT NULL COMMENT '最后更新日期',
  `comments` int(11) DEFAULT NULL COMMENT '评论数',
  `views` int(11) DEFAULT NULL COMMENT '浏览量',
  `summary` varchar(50) DEFAULT NULL COMMENT '摘要',
  `content_url` text COMMENT '内容的url',
  `course_collection_id` bigint(20) NOT NULL COMMENT '对应三级列表ID',
  PRIMARY KEY (`course_id`),
  KEY `fk_course_info_user1_idx` (`author_id`),
  KEY `fk_course_info_course_collection1_idx` (`course_collection_id`),
  CONSTRAINT `fk_course_info_course_collection1` FOREIGN KEY (`course_collection_id`) REFERENCES `course_collection` (`course_collection_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_info_user1` FOREIGN KEY (`author_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course_reply
-- ----------------------------
DROP TABLE IF EXISTS `course_reply`;
CREATE TABLE `course_reply` (
  `course_reply_id` bigint(20) NOT NULL COMMENT '回复ID(主键)',
  `comment_id` bigint(20) NOT NULL COMMENT '评论ID',
  `reply_user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `reply_time` bigint(20) DEFAULT NULL COMMENT '回复日期',
  `content` text COMMENT '回复内容',
  PRIMARY KEY (`course_reply_id`),
  KEY `fk_course_reply_comment1_idx` (`comment_id`),
  CONSTRAINT `fk_course_reply_comment1` FOREIGN KEY (`comment_id`) REFERENCES `course_comment` (`course_comment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qr_code
-- ----------------------------
DROP TABLE IF EXISTS `qr_code`;
CREATE TABLE `qr_code` (
  `qr_id` bigint(20) NOT NULL COMMENT '二维码表主键',
  `qr_code_url` varchar(200) DEFAULT NULL COMMENT '二维码路径',
  `seq` int(11) DEFAULT NULL COMMENT '二维码次序',
  `qr_title` varchar(10) DEFAULT NULL COMMENT '二维码标题',
  PRIMARY KEY (`qr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for recommend_course
-- ----------------------------
DROP TABLE IF EXISTS `recommend_course`;
CREATE TABLE `recommend_course` (
  `course_id` bigint(20) unsigned NOT NULL COMMENT '文章ID(主键)，外键当主键',
  `exectime` bigint(20) DEFAULT NULL COMMENT '操作日期(排序依据)',
  PRIMARY KEY (`course_id`),
  CONSTRAINT `fk_reco_course_course_info1` FOREIGN KEY (`course_id`) REFERENCES `course_info` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for slideshow
-- ----------------------------
DROP TABLE IF EXISTS `slideshow`;
CREATE TABLE `slideshow` (
  `slideshow_id` bigint(20) NOT NULL COMMENT '轮播图表主键',
  `img_url` varchar(200) NOT NULL COMMENT '图片路径',
  `seq` int(11) NOT NULL COMMENT '轮播图次序',
  `img_title` varchar(20) NOT NULL COMMENT '图片标题',
  `target_url` varchar(100) NOT NULL COMMENT '目的链接',
  PRIMARY KEY (`slideshow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `password` varchar(25) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(12) DEFAULT NULL COMMENT '昵称',
  `true_name` varchar(12) DEFAULT NULL COMMENT '真实姓名',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别',
  `email` varchar(45) DEFAULT NULL COMMENT '邮箱',
  `head_url` varchar(200) DEFAULT NULL COMMENT '头像路径',
  `bg_url` varchar(200) DEFAULT NULL COMMENT '主页背景图片路径',
  `introduce` varchar(500) DEFAULT NULL COMMENT '个人简介\n',
  `register_date` bigint(20) DEFAULT NULL COMMENT '注册日期',
  `is_admin` int(11) DEFAULT NULL COMMENT '是否为admin',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75556366701297665 DEFAULT CHARSET=utf8;
