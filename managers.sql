/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.25 : Database - managers
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`managers` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `managers`;

/*Table structure for table `attends` */

DROP TABLE IF EXISTS `attends`;

CREATE TABLE `attends` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `eid` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `startd` date DEFAULT NULL,
  `endd` date DEFAULT NULL,
  `staut` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `eid` (`eid`),
  KEY `pid` (`pid`),
  CONSTRAINT `attends_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `euser` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attends_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `positions` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `attends` */

insert  into `attends`(`aid`,`eid`,`pid`,`startd`,`endd`,`staut`) values 
(3,20,1,'2022-11-10','2022-11-19','已经结束'),
(4,20,4,'2022-11-24','2022-11-26','还没开始'),
(5,20,1,'2022-11-22','2022-11-24','正在进行中'),
(7,20,8,'2022-11-24','2022-11-29','还没开始'),
(8,20,1,'2022-11-02','2022-11-11','已经结束'),
(19,23,4,'2022-11-26','2022-11-27','还没开始'),
(21,1,3,'2022-11-28','2022-12-11','正在进行中'),
(22,23,1,'2022-12-10','2022-12-11','还没开始'),
(23,23,1,'2022-11-18','2022-11-27','已经结束'),
(24,23,1,'2022-11-18','2022-12-11','正在进行中'),
(25,23,1,'2022-11-01','2022-11-04','已经结束'),
(27,28,1,'2022-12-07','2022-12-21','还没开始');

/*Table structure for table `check1` */

DROP TABLE IF EXISTS `check1`;

CREATE TABLE `check1` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `eid` int DEFAULT NULL,
  `checkstaut` varchar(20) DEFAULT NULL,
  `chdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `eid` (`eid`),
  CONSTRAINT `check1_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `euser` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `check1` */

insert  into `check1`(`cid`,`eid`,`checkstaut`,`chdate`) values 
(1,20,'早退','2022-11-23 11:11:13'),
(2,20,'早退','2022-11-23 11:24:37'),
(3,20,'早退','2022-11-23 11:26:21'),
(4,20,'迟到','2022-11-23 11:30:07'),
(5,20,'正常','2022-11-23 11:36:44'),
(6,20,'正常','2022-11-23 11:38:06'),
(7,20,'正常','2022-11-23 11:45:03'),
(8,20,'正常','2022-11-23 11:45:52'),
(9,20,'正常','2022-11-23 11:46:27'),
(10,21,'迟到','2022-11-23 11:46:27'),
(11,23,'正常','2022-11-24 14:08:21'),
(12,1,'正常','2022-11-25 10:35:54'),
(13,23,'正常','2022-11-25 12:09:56'),
(14,23,'正常','2022-11-28 16:46:31'),
(15,23,'正常','2022-11-28 16:47:02'),
(16,23,'正常','2022-11-28 16:58:55'),
(17,23,'正常','2022-11-28 17:04:49'),
(18,23,'正常','2022-11-28 17:08:58'),
(19,1,'正常','2022-11-28 17:50:59'),
(20,1,'正常','2022-11-29 16:55:53'),
(21,28,'正常','2022-11-29 19:04:39'),
(22,1,'正常','2022-11-29 19:26:01'),
(23,1,'正常','2022-11-30 13:17:04');

/*Table structure for table `depts` */

DROP TABLE IF EXISTS `depts`;

CREATE TABLE `depts` (
  `did` int NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `duty_man` varchar(20) DEFAULT NULL,
  `cdate` date DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `depts` */

insert  into `depts`(`did`,`dname`,`duty_man`,`cdate`) values 
(1,'实施部','麦克','2022-11-03'),
(2,'运营部','露西','2022-11-14'),
(3,'市场部','杰克','2022-11-14'),
(4,'开发部','汤姆','2022-11-14'),
(5,'管理部','admin','2022-11-14'),
(6,'财务部','朱韵','2022-11-19'),
(7,'人力资源部','张浩好','2022-11-19');

/*Table structure for table `euser` */

DROP TABLE IF EXISTS `euser`;

CREATE TABLE `euser` (
  `eid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `did` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `indate` date DEFAULT NULL,
  `type` int DEFAULT '2',
  PRIMARY KEY (`eid`),
  KEY `euser_ibfk_1` (`did`),
  KEY `euser_ibfk_2` (`pid`),
  CONSTRAINT `euser_ibfk_1` FOREIGN KEY (`did`) REFERENCES `depts` (`did`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `euser_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `positions` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `euser` */

insert  into `euser`(`eid`,`username`,`sex`,`tel`,`did`,`pid`,`uname`,`password`,`email`,`indate`,`type`) values 
(1,'admin','female','150849227',4,7,'陈佳若','1234','2770011009@qq.com','2022-11-22',1),
(20,'277','male','15084922756',1,1,'陈佳若','admin','2770049975@qq.com','2022-11-15',2),
(21,'277','female','0731-1111232',3,3,'陈佳若','2222222','2770049975@qq.com','2022-11-11',2),
(23,'Q1234','male','15084922756',1,1,'陈佳若','1111','123@qq.com','2022-11-21',2),
(24,'user1','female','0731-1111232',4,4,'徐瑶','1111','277@qq.com','2022-11-21',2),
(27,'小若子','male','0731-1111232',1,1,'陈佳若','1111','2770049975@qq.com','2022-11-22',2),
(28,'Q1234','female','15084922756',4,8,'陈佳若','1234','2770049975@qq.com','2022-11-16',2);

/*Table structure for table `income` */

DROP TABLE IF EXISTS `income`;

CREATE TABLE `income` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eid` int DEFAULT NULL,
  `itype` varchar(20) DEFAULT NULL,
  `ireason` varchar(100) DEFAULT NULL,
  `idate` date DEFAULT NULL,
  `did` int DEFAULT NULL,
  `staut` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `did` (`did`),
  CONSTRAINT `income_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `euser` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `income_ibfk_3` FOREIGN KEY (`did`) REFERENCES `depts` (`did`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `income` */

insert  into `income`(`id`,`eid`,`itype`,`ireason`,`idate`,`did`,`staut`) values 
(10,20,'罚款','迟到','2022-11-09',1,-100),
(11,21,'罚款','早退','2022-11-29',1,-100),
(16,24,'奖励','正常','2022-11-29',1,100),
(17,27,NULL,NULL,NULL,1,0);

/*Table structure for table `positions` */

DROP TABLE IF EXISTS `positions`;

CREATE TABLE `positions` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cdate` datetime DEFAULT NULL,
  `tips` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pid`,`pname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `positions` */

insert  into `positions`(`pid`,`pname`,`cdate`,`tips`) values 
(1,'Java程序员','2022-11-14 00:00:00','Java程序员'),
(2,'PHP程序员','2022-11-14 00:00:00','PHP程序员'),
(3,'前端开发','2022-11-14 00:00:00','前端开发'),
(4,'实施工程师','2022-11-14 00:00:00','实施工程师'),
(5,'市场推销员','2022-11-14 00:00:00','市场推销员'),
(6,'市场经理','2022-11-14 00:00:00','市场经理'),
(7,'管理员','2022-11-14 00:00:00','管理员'),
(8,'运营职员','2022-11-14 00:00:00','运营职员'),
(9,'hhh','2022-12-11 00:00:00',NULL),
(10,'qq','2022-11-21 00:00:00',NULL);

/*Table structure for table `ship` */

DROP TABLE IF EXISTS `ship`;

CREATE TABLE `ship` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `eid` int DEFAULT NULL,
  `bship` float DEFAULT NULL,
  `aship` float DEFAULT '100',
  `gship` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `sdate` date DEFAULT NULL,
  `id` int DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `eid` (`eid`),
  KEY `id` (`id`),
  CONSTRAINT `ship_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `euser` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ship_ibfk_2` FOREIGN KEY (`id`) REFERENCES `income` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ship` */

insert  into `ship`(`sid`,`eid`,`bship`,`aship`,`gship`,`total`,`sdate`,`id`) values 
(1,20,4000,100,90,4090,'2020-01-01',10),
(2,21,3500,100,100,3600,'2020-01-01',11),
(4,24,6000,100,20,6120,'2022-12-29',16),
(7,23,7000,100,0,7100,'2022-11-29',17),
(8,28,1500,100,100,1700,'2022-11-29',17);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
