-- MySQL Script generated by MySQL Workbench
-- Thu Dec 21 09:07:39 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `userid` INT NOT NULL COMMENT '账号，主键',
  `password` VARCHAR(25) NOT NULL COMMENT '密码',
  `nickname` VARCHAR(12) NULL COMMENT '昵称',
  `true_name` VARCHAR(12) NULL COMMENT '真实姓名',
  `gender` VARCHAR(2) NULL,
  `e_mail` VARCHAR(45) NOT NULL COMMENT '邮箱',
  `pa_avatar` VARCHAR(200) NOT NULL COMMENT '头像路径',
  `pa_bgd` VARCHAR(200) NOT NULL COMMENT '主页背景图片路径',
  `introduce` VARCHAR(500) NULL COMMENT '个人简介\n',
  `regis_date` TIMESTAMP NOT NULL COMMENT '注册日期',
  `jurisdiction` INT NULL,
  PRIMARY KEY (`userid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`article` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章表的ID',
  `user_id` INT NOT NULL,
  `title` VARCHAR(50) NOT NULL COMMENT '标题',
  `create_time` TIMESTAMP NOT NULL COMMENT '文章添加日期,时间会自动充填，充填的时间为最近一次更新的时间',
  `re_up_time` TIMESTAMP NOT NULL COMMENT '最近更新时间,时间会自动充填，充填的时间为最近一次更新的时间',
  `ar_introduction` TEXT(200) NOT NULL COMMENT '文章简介\n',
  `type_id` INT NOT NULL,
  `page_view` INT NULL,
  `comments` INT NULL,
  `collects` INT NULL,
  `content_url` TEXT(300) NULL,
  `title_image_url` TEXT(300) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_article_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_article_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`article_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`article_comment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `article_id` INT UNSIGNED NOT NULL,
  `from_username` VARCHAR(25) NOT NULL,
  `content` TEXT(500) NOT NULL COMMENT '500字上限的评论内容',
  `time` TIMESTAMP NOT NULL COMMENT '评论时间,时间会自动充填，充填的时间为最近一次更新的时间',
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user_article1_idx` (`article_id` ASC),
  CONSTRAINT `fk_comment_user_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `mydb`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`article_reply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`article_reply` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` INT UNSIGNED NOT NULL,
  `re_user` INT NOT NULL COMMENT '发出回复的用户的ID',
  `by_re_user` INT NOT NULL COMMENT '被回复的用户的ID\n',
  `re_time` TIMESTAMP NOT NULL COMMENT '回复时间,时间会自动充填，充填的时间为最近一次更新的时间',
  `content` TEXT(500) NOT NULL COMMENT '上限500字的回复。',
  PRIMARY KEY (`id`),
  INDEX `fk_reply_comment1_idx` (`comment_id` ASC),
  CONSTRAINT `fk_reply_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `mydb`.`article_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`attention`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`attention` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '伪主键',
  `from_userid` INT NOT NULL,
  `by_userid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_attention_user1_idx` (`from_userid` ASC),
  INDEX `fk_attention_user2_idx` (`by_userid` ASC),
  CONSTRAINT `fk_attention_user1`
    FOREIGN KEY (`from_userid`)
    REFERENCES `mydb`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_attention_user2`
    FOREIGN KEY (`by_userid`)
    REFERENCES `mydb`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`one_level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`one_level` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `seq` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`two_level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`two_level` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lv1` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `seq` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_school_listlv2_school_listlv11_idx` (`lv1` ASC),
  CONSTRAINT `fk_school_listlv2_school_listlv11`
    FOREIGN KEY (`lv1`)
    REFERENCES `mydb`.`one_level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`course_collection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`course_collection` (
  `id` INT NOT NULL,
  `lv2` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `seq` VARCHAR(45) NULL,
  `summary` VARCHAR(50) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_school_listlv3_school_listlv21_idx` (`lv2` ASC),
  CONSTRAINT `fk_school_listlv3_school_listlv21`
    FOREIGN KEY (`lv2`)
    REFERENCES `mydb`.`two_level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`course_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`course_info` (
  `article_id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `summary` VARCHAR(45) NULL,
  `seq` INT NULL,
  `author_id` INT NOT NULL,
  `source` VARCHAR(45) NULL,
  `createtime` TIMESTAMP NULL,
  `re_up_time` TIMESTAMP NULL,
  `comments` INT NULL,
  `viewnum` INT NULL,
  `content_url` TEXT(300) NULL,
  `lv3` INT NOT NULL,
  PRIMARY KEY (`article_id`),
  INDEX `fk_course_info_course_collection1_idx` (`lv3` ASC),
  INDEX `fk_course_info_user1_idx` (`author_id` ASC),
  CONSTRAINT `fk_course_info_course_collection1`
    FOREIGN KEY (`lv3`)
    REFERENCES `mydb`.`course_collection` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_info_user1`
    FOREIGN KEY (`author_id`)
    REFERENCES `mydb`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`article_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`article_type` (
  `article_id` INT UNSIGNED NOT NULL,
  `type_name` VARCHAR(50) NULL,
  PRIMARY KEY (`article_id`),
  CONSTRAINT `fk_article_type_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `mydb`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`collect`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`collect` (
  `article_id` INT UNSIGNED NOT NULL,
  `user_id` INT NULL,
  INDEX `fk_collect_article1_idx` (`article_id` ASC),
  CONSTRAINT `fk_collect_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `mydb`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`top`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`top` (
  `id` INT NOT NULL,
  `article_id` INT UNSIGNED NOT NULL,
  `top_time` TIMESTAMP NULL,
  `topcol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `article_id`),
  INDEX `fk_top_article1_idx` (`article_id` ASC),
  CONSTRAINT `fk_top_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `mydb`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`course_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`course_comment` (
  `cid` INT NOT NULL,
  `article_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `time` TIMESTAMP NULL,
  `content` TEXT(500) NULL,
  PRIMARY KEY (`cid`),
  INDEX `fk_comment_course_info1_idx` (`article_id` ASC),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_comment_course_info1`
    FOREIGN KEY (`article_id`)
    REFERENCES `mydb`.`course_info` (`article_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`course_reply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`course_reply` (
  `rid` INT NOT NULL,
  `cid` INT NOT NULL,
  `re_user` INT NULL,
  `by_re_user` INT NULL,
  `re_time` TIMESTAMP NULL,
  `content` TEXT(500) NULL,
  PRIMARY KEY (`rid`),
  INDEX `fk_course_reply_comment1_idx` (`cid` ASC),
  CONSTRAINT `fk_course_reply_comment1`
    FOREIGN KEY (`cid`)
    REFERENCES `mydb`.`course_comment` (`cid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reco_course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reco_course` (
  `article_id` INT NOT NULL,
  `exectime` TIMESTAMP NULL,
  `reco_coursecol` VARCHAR(45) NULL,
  PRIMARY KEY (`article_id`),
  CONSTRAINT `fk_reco_course_course_info1`
    FOREIGN KEY (`article_id`)
    REFERENCES `mydb`.`course_info` (`article_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`article_draft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`article_draft` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章表的ID',
  `user_id` INT NOT NULL,
  `title` VARCHAR(50) NOT NULL COMMENT '标题',
  `create_time` TIMESTAMP NOT NULL COMMENT '文章添加日期,时间会自动充填，充填的时间为最近一次更新的时间',
  `re_up_time` TIMESTAMP NOT NULL COMMENT '最近更新时间,时间会自动充填，充填的时间为最近一次更新的时间',
  `ar_introduction` TEXT(200) NOT NULL COMMENT '文章简介\n',
  `content_url` TEXT(300) NULL,
  `title_image_url` TEXT(300) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_article_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_article_user10`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`course_draft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`course_draft` (
  `article_id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `author_id` INT NOT NULL,
  `source` VARCHAR(45) NULL,
  `createtime` TIMESTAMP NULL,
  `content_url` TEXT(300) NULL,
  PRIMARY KEY (`article_id`),
  INDEX `fk_course_info_user1_idx` (`author_id` ASC),
  CONSTRAINT `fk_course_info_user10`
    FOREIGN KEY (`author_id`)
    REFERENCES `mydb`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`carousel_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`carousel_image` (
  `cas_img_id` INT NOT NULL,
  `cas_img_url` VARCHAR(200) NOT NULL,
  `cas_seq` INT NOT NULL,
  `img_title` VARCHAR(20) NOT NULL,
  `img_link` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`cas_img_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`section` (
  `section_id` INT NOT NULL,
  `sec_img_url` VARCHAR(60) NOT NULL,
  `sec_link` VARCHAR(100) NOT NULL,
  `sec_seq` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`section_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`qr_code`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`qr_code` (
  `qr_id` INT NOT NULL,
  `qr_img_url` VARCHAR(200) NULL,
  `qr_seq` INT NULL,
  `qr_title` VARCHAR(10) NULL,
  PRIMARY KEY (`qr_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
