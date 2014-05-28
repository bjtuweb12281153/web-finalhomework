/*
SQLyog Ultimate v8.8 
MySQL - 5.5.28 : Database - weibo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`weibo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `weibo`;

/*Table structure for table `linkman` */

DROP TABLE IF EXISTS `linkman`;

CREATE TABLE `linkman` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) DEFAULT NULL,
  `friendid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `linkman` */

insert  into `linkman`(`id`,`userid`,`friendid`) values (1,1,2),(3,1,4),(4,1,5),(5,1,3);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) DEFAULT NULL,
  `thetime` datetime DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`id`,`userid`,`thetime`,`content`) values (1,2,'2014-05-20 08:23:34','今天真的是很让人激动的一天呀！！！'),(2,3,'2014-05-20 09:23:34','世界杯快来了，小伙伴们都准备好了么？'),(3,4,'2014-05-19 08:23:34','To be a better man，加油！'),(4,5,'2014-05-21 08:23:34','祝小胖生日快乐，永远漂亮。'),(5,3,'2014-05-18 08:23:34','一切尽在无言中..........'),(7,1,'2014-05-18 08:23:34','我来到微博世界了，大家多多关照！！>_<'),(12,1,'2014-05-23 12:53:07','新的一年，我希望自己收获更多的幸福和快乐。');

/*Table structure for table `theuser` */

DROP TABLE IF EXISTS `theuser`;

CREATE TABLE `theuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tele` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `theuser` */

insert  into `theuser`(`id`,`username`,`password`,`name`,`sex`,`email`,`tele`) values (1,'test','123456','特思特','男','xxxxx@qq.com','15726664788'),(2,'okman','123456','张三','女','222@qq.com','15726664788'),(3,'waitor1','123456','张天','男','222@qq.com','13212354278'),(4,'woxiamenlian','123456','夏河','男','lixu_11@163.com','13111111111'),(5,'admin1','123456','admin1','男','lixu_11@163.com','13111111111'),(6,'admin2','123456','李波','男','lixu_11@163.com','15726664788');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
