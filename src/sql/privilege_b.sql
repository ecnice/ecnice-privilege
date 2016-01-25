/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.53-community : Database - privilege_b
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`privilege_b` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `privilege_b`;

/*Table structure for table `tbl_privilege_acl` */

DROP TABLE IF EXISTS `tbl_privilege_acl`;

CREATE TABLE `tbl_privilege_acl` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `release_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '来源id',
  `release_sn` varchar(10) COLLATE utf8_bin DEFAULT 'role' COMMENT '来源标示role标示角色user 标示用户',
  `system_sn` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '系统标示',
  `module_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '模块id',
  `module_sn` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '模块标示',
  `acl_state` int(32) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识：0：删除 1：存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_privilege_acl` */

insert  into `tbl_privilege_acl`(`id`,`release_id`,`release_sn`,`system_sn`,`module_id`,`module_sn`,`acl_state`,`create_time`,`creator`,`update_time`,`updator`,`del_flag`) values ('8a81e53c524388970152438897a60000','8a81e5e551ec92f10151eca9db920011','role','privilege','1','privilege',2,'2016-01-15 12:26:11',NULL,'2016-01-15 12:26:11',NULL,1),('8a81e53c52438897015243892c9b0001','8a81e5e551ec92f10151eca9db920011','role','privilege','11','icsystem',14,'2016-01-15 12:26:49',NULL,'2016-01-15 12:26:49',NULL,1),('8a81e53c5276ef7e0152770537ce0001','1','role','privilege','8a81e53c5276ef7e015276ef7e410000','person_config',15,'2016-01-25 12:22:56',NULL,'2016-01-25 12:22:56',NULL,1),('8a81e5e551f1c98b0151f1f7475700e8','1','user','privilege','1','privilege',15,'2015-12-30 16:18:14',NULL,'2015-12-30 16:18:14',NULL,1),('8a81e5e551f1c98b0151f1f7475700e9','1','user','privilege','11','icsystem',15,'2015-12-30 16:18:14',NULL,'2015-12-30 16:18:14',NULL,1),('8a81e5e551f1c98b0151f1f7475700ea','1','user','privilege','12','module',15,'2015-12-30 16:18:14',NULL,'2015-12-30 16:18:14',NULL,1),('8a81e5e551f1c98b0151f1f7475700eb','1','user','privilege','13','user',79,'2015-12-30 16:18:14',NULL,'2015-12-30 16:18:14',NULL,1),('8a81e5e551f1c98b0151f1f7475700ec','1','user','privilege','14','dept',15,'2015-12-30 16:18:14',NULL,'2015-12-30 16:18:14',NULL,1),('8a81e5e551f1c98b0151f1f7475700ed','1','user','privilege','15','role',79,'2015-12-30 16:18:14',NULL,'2015-12-30 16:18:14',NULL,1),('8a81e5e551f1c98b0151f1f7475700ee','1','user','privilege','16','config',15,'2015-12-30 16:18:14',NULL,'2015-12-30 16:18:14',NULL,1),('8a81e5e551f1c98b0151f1f7475700ef','1','user','privilege','17','dictionary',15,'2015-12-30 16:18:14',NULL,'2015-12-30 16:18:14',NULL,1),('8a81e5e551f1c98b0151f1f7475700f0','1','user','privilege','18','loginlog',15,'2015-12-30 16:18:14',NULL,'2015-12-30 16:18:14',NULL,1),('8a81e5e551f1c98b0151f1f7475700f1','1','user','privilege','19','pval',15,'2015-12-30 16:18:14',NULL,'2015-12-30 16:18:14',NULL,1),('8a81e5e551f1c98b0151f1f7475700f2','1','user','privilege','20','company',15,'2015-12-30 16:18:14',NULL,'2015-12-30 16:18:14',NULL,1),('8a81e5e551f1c98b0151f1f752e000f4','1','user','cms','8a81e5e551f1c98b0151f1cdae130009','321',127,'2015-12-30 16:18:20',NULL,'2015-12-30 16:18:20',NULL,1),('8a81e5e551f1c98b0151f1f7e42c0189','1','role','cms','8a81e5e551f1c98b0151f1cdae130009','321',2,'2015-12-30 16:18:54',NULL,'2015-12-30 16:18:54',NULL,1),('8a81e5e551f1c98b0151f1f7e42c018a','1','role','privilege','1','privilege',15,'2015-12-30 16:18:54',NULL,'2015-12-30 16:18:54',NULL,1),('8a81e5e551f1c98b0151f1f7e42c018b','1','role','privilege','11','icsystem',15,'2015-12-30 16:18:54',NULL,'2015-12-30 16:18:54',NULL,1),('8a81e5e551f1c98b0151f1f7e42c018c','1','role','privilege','12','module',15,'2015-12-30 16:18:54',NULL,'2015-12-30 16:18:54',NULL,1),('8a81e5e551f1c98b0151f1f7e42c018d','1','role','privilege','13','user',79,'2015-12-30 16:18:54',NULL,'2015-12-30 16:18:54',NULL,1),('8a81e5e551f1c98b0151f1f7e42c018e','1','role','privilege','14','dept',15,'2015-12-30 16:18:54',NULL,'2015-12-30 16:18:54',NULL,1),('8a81e5e551f1c98b0151f1f7e42c018f','1','role','privilege','15','role',79,'2015-12-30 16:18:54',NULL,'2015-12-30 16:18:54',NULL,1),('8a81e5e551f1c98b0151f1f7e42c0190','1','role','privilege','16','config',15,'2015-12-30 16:18:54',NULL,'2015-12-30 16:18:54',NULL,1),('8a81e5e551f1c98b0151f1f7e42c0191','1','role','privilege','17','dictionary',15,'2015-12-30 16:18:54',NULL,'2015-12-30 16:18:54',NULL,1),('8a81e5e551f1c98b0151f1f7e42c0192','1','role','privilege','18','loginlog',15,'2015-12-30 16:18:54',NULL,'2015-12-30 16:18:54',NULL,1),('8a81e5e551f1c98b0151f1f7e42c0193','1','role','privilege','19','pval',15,'2015-12-30 16:18:54',NULL,'2015-12-30 16:18:54',NULL,1),('8a81e5e551f601db0151f697ece800a6','8a81e5e551f232920151f23443900001','user','privilege','1','privilege',15,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ece800a7','8a81e5e551f232920151f23443900001','user','privilege','11','icsystem',15,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ece800a8','8a81e5e551f232920151f23443900001','user','privilege','12','module',15,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ece800a9','8a81e5e551f232920151f23443900001','user','privilege','13','user',79,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ece800aa','8a81e5e551f232920151f23443900001','user','privilege','14','dept',15,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ece800ab','8a81e5e551f232920151f23443900001','user','privilege','15','role',79,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ece800ac','8a81e5e551f232920151f23443900001','user','privilege','16','config',15,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ece800ad','8a81e5e551f232920151f23443900001','user','privilege','17','dictionary',15,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ece800ae','8a81e5e551f232920151f23443900001','user','privilege','18','loginlog',15,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ece800af','8a81e5e551f232920151f23443900001','user','privilege','19','pval',15,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ecea00b0','8a81e5e551f232920151f23443900001','user','privilege','1','privilege',15,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ecea00b1','8a81e5e551f232920151f23443900001','user','privilege','11','icsystem',15,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ecea00b2','8a81e5e551f232920151f23443900001','user','privilege','12','module',15,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ecea00b3','8a81e5e551f232920151f23443900001','user','privilege','13','user',79,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ecea00b4','8a81e5e551f232920151f23443900001','user','privilege','14','dept',15,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ecea00b5','8a81e5e551f232920151f23443900001','user','privilege','15','role',79,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ecea00b6','8a81e5e551f232920151f23443900001','user','privilege','16','config',15,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ecea00b7','8a81e5e551f232920151f23443900001','user','privilege','17','dictionary',15,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ecea00b8','8a81e5e551f232920151f23443900001','user','privilege','18','loginlog',15,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f697ecea00b9','8a81e5e551f232920151f23443900001','user','privilege','19','pval',15,'2015-12-31 13:52:10',NULL,'2015-12-31 13:52:10',NULL,1),('8a81e5e551f601db0151f6a144aa00f9','8a81e5e551f232920151f23443900001','user','cms','8a81e5e551f1c98b0151f1cdae130009',NULL,122,'2015-12-31 14:02:22',NULL,'2015-12-31 14:02:22',NULL,1);

/*Table structure for table `tbl_privilege_company` */

DROP TABLE IF EXISTS `tbl_privilege_company`;

CREATE TABLE `tbl_privilege_company` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `cname` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '公司中文名称',
  `ename` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '公司英文名称',
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '公司code',
  `descr` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `del_flag` int(1) DEFAULT NULL COMMENT '1：存在  0： 删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_privilege_company` */

insert  into `tbl_privilege_company`(`id`,`cname`,`ename`,`code`,`descr`,`creator`,`create_time`,`updator`,`update_time`,`del_flag`) values ('8a81e53c50f4869d0150f4869d490002','中电港',NULL,NULL,NULL,NULL,'2015-11-11 11:11:14',NULL,'2015-11-11 11:11:14',1);

/*Table structure for table `tbl_privilege_department` */

DROP TABLE IF EXISTS `tbl_privilege_department`;

CREATE TABLE `tbl_privilege_department` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `note` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `pid` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '父id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识0表示删除1表示存在',
  `leader` int(1) DEFAULT '0' COMMENT '是否是leader1:是 0：不是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_privilege_department` */

insert  into `tbl_privilege_department`(`id`,`name`,`note`,`pid`,`create_time`,`creator`,`update_time`,`updator`,`del_flag`,`leader`) values ('1','电商平台',NULL,NULL,'2015-11-11 11:11:14',NULL,'2015-11-11 11:11:14',NULL,1,0),('8a81e5e551f232920151f23292680000','fdsaf','',NULL,'2015-12-30 17:22:59',NULL,'2015-12-30 17:22:59',NULL,1,0);

/*Table structure for table `tbl_privilege_dictionary` */

DROP TABLE IF EXISTS `tbl_privilege_dictionary`;

CREATE TABLE `tbl_privilege_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '编码',
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `pcode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '父编码',
  `system_sn` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '系统标识',
  `sn` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '标识',
  `order_no` int(11) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_privilege_dictionary` */

insert  into `tbl_privilege_dictionary`(`id`,`code`,`name`,`pcode`,`system_sn`,`sn`,`order_no`) values (1,'control_products_set','管控品控制',NULL,'privilege',NULL,1),(5,'t_dpt_phne','电话销售部','control_products_set','privilege',NULL,1),(6,'3232','211',NULL,'cms',NULL,NULL);

/*Table structure for table `tbl_privilege_icsystem` */

DROP TABLE IF EXISTS `tbl_privilege_icsystem`;

CREATE TABLE `tbl_privilege_icsystem` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `sn` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '系统标示',
  `url` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '系统url前缀',
  `image` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '系统的图标',
  `note` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '系统备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识0：删除1：存在',
  `order_no` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn_unique_index` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_privilege_icsystem` */

insert  into `tbl_privilege_icsystem`(`id`,`name`,`sn`,`url`,`image`,`note`,`create_time`,`creator`,`update_time`,`updator`,`del_flag`,`order_no`) values ('1','权限系统','privilege','http://127.0.0.1:8080/privilege-manager',NULL,'http://10.1.100.63:8080/privilege-manager','2016-01-15 09:45:07',NULL,'2015-11-11 11:11:14',NULL,1,1),('8a81e5e551eccf870151ecde8c7d0075','cms','cms','http://127.0.0.1:8080',NULL,'','2015-12-29 16:33:06',NULL,'2015-12-29 16:33:06',NULL,1,2);

/*Table structure for table `tbl_privilege_login_log` */

DROP TABLE IF EXISTS `tbl_privilege_login_log`;

CREATE TABLE `tbl_privilege_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '访问ip',
  `operation_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人id',
  `operation_username` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人的姓名',
  `operation_person` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人姓名',
  `operation_content` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '操作内容',
  `operation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_privilege_login_log` */

insert  into `tbl_privilege_login_log`(`id`,`ip`,`operation_id`,`operation_username`,`operation_person`,`operation_content`,`operation_time`) values (81,'127.0.0.1','1','admin','管理员','登录','2015-12-29 14:34:55'),(82,'127.0.0.1','1','admin','管理员','登录','2015-12-29 14:53:24'),(83,'127.0.0.1','1','admin','管理员','登录','2015-12-29 16:16:31'),(84,'127.0.0.1','1','admin','管理员','登录','2015-12-29 16:35:29'),(85,'127.0.0.1','1','admin','管理员','登录','2015-12-29 16:39:40'),(86,'127.0.0.1','1','admin','管理员','登录','2015-12-29 16:46:06'),(87,'127.0.0.1','1','admin','管理员','登录','2015-12-29 16:47:47'),(88,'127.0.0.1','1','admin','管理员','登录','2015-12-29 16:48:44'),(89,'127.0.0.1','1','admin','管理员','登录','2015-12-29 16:49:35'),(90,'127.0.0.1','1','admin','管理员','登录','2015-12-29 16:52:42'),(91,'127.0.0.1','1','admin','管理员','登录','2015-12-29 17:03:20'),(92,'127.0.0.1','1','admin','管理员','登录','2015-12-29 17:03:31'),(93,'127.0.0.1','1','admin','管理员','登录','2015-12-29 17:04:04'),(94,'127.0.0.1','1','admin','管理员','登录','2015-12-29 17:04:45'),(95,'127.0.0.1','1','admin','管理员','登录','2015-12-29 17:05:45'),(96,'127.0.0.1','1','admin','管理员','登录','2015-12-29 17:06:18'),(97,'127.0.0.1','1','admin','管理员','登录','2015-12-29 17:21:10'),(98,'127.0.0.1','1','admin','管理员','登录','2015-12-29 17:23:31'),(99,'127.0.0.1','1','admin','管理员','登录','2015-12-29 17:29:56'),(100,'127.0.0.1','1','admin','管理员','登录','2015-12-29 17:32:01'),(101,'10.1.101.101','1','admin','管理员','登录','2015-12-30 09:22:52'),(102,'10.1.101.101','1','admin','管理员','登录','2015-12-30 09:23:48'),(103,'10.1.101.101','1','admin','管理员','登录','2015-12-30 09:24:04'),(104,'10.1.101.101','1','admin','管理员','登录','2015-12-30 09:24:08'),(105,'10.1.101.101','1','admin','管理员','登录','2015-12-30 09:26:18'),(106,'10.1.101.101','1','admin','管理员','登录','2015-12-30 09:28:00'),(107,'10.1.101.101','1','admin','管理员','登录','2015-12-30 09:32:29'),(108,'10.1.101.101','1','admin','管理员','登录','2015-12-30 10:26:32'),(109,'10.1.101.101','1','admin','管理员','登录','2015-12-30 10:26:46'),(110,'10.1.101.101','1','admin','管理员','登录','2015-12-30 10:27:17'),(111,'10.1.101.101','1','admin','管理员','登录','2015-12-30 10:29:51'),(112,'10.1.101.101','1','admin','管理员','登录','2015-12-30 10:49:23'),(113,'10.1.101.101','1','admin','管理员','登录','2015-12-30 10:49:33'),(114,'10.1.101.101','1','admin','管理员','登录','2015-12-30 10:49:39'),(115,'10.1.101.101','1','admin','管理员','登录','2015-12-30 10:50:52'),(116,'10.1.101.101','1','admin','管理员','登录','2015-12-30 10:53:05'),(117,'10.1.101.101','1','admin','管理员','登录','2015-12-30 10:55:52'),(118,'10.1.101.101','1','admin','管理员','登录','2015-12-30 10:56:38'),(119,'10.1.101.101','1','admin','管理员','登录','2015-12-30 11:04:00'),(120,'10.1.101.101','1','admin','管理员','登录','2015-12-30 11:04:35'),(121,'10.1.101.101','1','admin','管理员','登录','2015-12-30 11:24:07'),(122,'127.0.0.1','1','admin','管理员','登录','2015-12-30 13:14:53'),(123,'127.0.0.1','1','admin','管理员','登录','2015-12-30 13:19:53'),(124,'127.0.0.1','1','admin','管理员','登录','2015-12-30 13:21:49'),(125,'127.0.0.1','1','admin','管理员','登录','2015-12-30 13:22:58'),(126,'127.0.0.1','1','admin','管理员','登录','2015-12-30 13:25:36'),(127,'127.0.0.1','1','admin','管理员','登录','2015-12-30 13:26:47'),(128,'127.0.0.1','1','admin','管理员','登录','2015-12-30 13:29:27'),(129,'127.0.0.1','1','admin','管理员','登录','2015-12-30 13:30:11'),(130,'127.0.0.1','1','admin','管理员','登录','2015-12-30 13:31:02'),(131,'127.0.0.1','1','admin','管理员','登录','2015-12-30 13:31:53'),(132,'127.0.0.1','1','admin','管理员','登录','2015-12-30 13:35:48'),(133,'127.0.0.1','1','admin','管理员','登录','2015-12-30 13:38:34'),(134,'127.0.0.1','1','admin','管理员','登录','2015-12-30 13:41:17'),(135,'127.0.0.1','1','admin','管理员','登录','2015-12-30 13:47:39'),(136,'127.0.0.1','1','admin','管理员','登录','2015-12-30 14:51:32'),(137,'127.0.0.1','1','admin','管理员','登录','2015-12-30 14:51:47'),(138,'10.1.101.101','1','admin','管理员','登录','2015-12-30 14:52:12'),(139,'127.0.0.1','1','admin','管理员','登录','2015-12-30 14:52:19'),(140,'127.0.0.1','1','admin','管理员','登录','2015-12-30 14:52:35'),(141,'10.1.101.101','1','admin','管理员','登录','2015-12-30 14:54:26'),(143,'127.0.0.1','1','admin','管理员','登录','2015-12-30 15:04:56'),(145,'127.0.0.1','1','admin','管理员','登录','2015-12-30 15:25:34'),(146,'10.1.101.101','1','admin','管理员','登录','2015-12-30 16:27:31'),(147,'10.1.101.101','1','admin','管理员','登录','2015-12-30 16:27:36'),(148,'10.1.101.101','1','admin','管理员','登录','2015-12-30 16:27:43'),(149,'10.1.101.101','1','admin','管理员','登录','2015-12-30 16:28:12'),(151,'10.1.101.115','1','admin','管理员','登录','2015-12-30 16:30:23'),(152,'10.1.101.115','1','admin','管理员','登录','2015-12-30 16:31:00'),(153,'10.1.101.101','8a81e4bf51f203340151f203345d0000','wwww','团座','登录','2015-12-30 16:33:29'),(154,'10.1.101.101','8a81e4bf51f203340151f203345d0000','wwww','团座','登录','2015-12-30 17:01:55'),(155,'127.0.0.1','1','admin','管理员','登录','2015-12-30 17:09:12'),(156,'10.1.101.101','8a81e4bf51f203340151f203345d0000','wwww','团座','登录','2015-12-31 08:51:11'),(157,'127.0.0.1','1','admin','管理员','登录','2015-12-31 10:49:32'),(158,'127.0.0.1','1','admin','管理员','登录','2015-12-31 10:54:30'),(159,'127.0.0.1','1','admin','管理员','登录','2016-01-15 09:44:37'),(160,'127.0.0.1','1','admin','管理员','登录','2016-01-15 09:45:11'),(161,'127.0.0.1','1','admin','管理员','登录','2016-01-15 09:47:21'),(162,'127.0.0.1','8a81e4bf51f203340151f203345d0000','wwww','团座','登录','2016-01-15 09:47:43'),(163,'127.0.0.1','1','admin','管理员','登录','2016-01-15 09:50:09'),(164,'127.0.0.1','1','admin','管理员','登录','2016-01-15 10:15:51'),(165,'127.0.0.1','1','admin','管理员','登录','2016-01-15 10:22:46'),(166,'127.0.0.1','1','admin','管理员','登录','2016-01-15 10:35:02'),(167,'127.0.0.1','1','admin','管理员','登录','2016-01-15 10:41:10'),(168,'127.0.0.1','1','admin','管理员','登录','2016-01-15 10:47:55'),(169,'127.0.0.1','1','admin','管理员','登录','2016-01-15 11:07:45'),(170,'127.0.0.1','1','admin','管理员','登录','2016-01-15 11:16:21'),(171,'127.0.0.1','1','admin','管理员','登录','2016-01-15 11:58:51'),(172,'127.0.0.1','1','admin','管理员','登录','2016-01-15 12:20:20'),(173,'127.0.0.1','1','admin','管理员','登录','2016-01-15 12:25:40'),(174,'127.0.0.1','1','admin','管理员','登录','2016-01-21 14:32:35'),(175,'127.0.0.1','1','admin','管理员','登录','2016-01-25 11:08:58'),(176,'127.0.0.1','1','admin','管理员','登录','2016-01-25 11:12:09'),(177,'127.0.0.1','1','admin','管理员','登录','2016-01-25 11:28:33'),(178,'127.0.0.1','1','admin','管理员','登录','2016-01-25 11:35:59'),(179,'127.0.0.1','1','admin','管理员','登录','2016-01-25 11:38:49'),(180,'127.0.0.1','1','admin','管理员','登录','2016-01-25 11:39:40'),(181,'127.0.0.1','1','admin','管理员','登录','2016-01-25 11:40:29'),(182,'127.0.0.1','1','admin','管理员','登录','2016-01-25 11:41:27'),(183,'127.0.0.1','1','admin','管理员','登录','2016-01-25 11:42:27'),(184,'127.0.0.1','1','admin','管理员','登录','2016-01-25 11:43:48'),(185,'127.0.0.1','1','admin','管理员','登录','2016-01-25 11:56:57'),(186,'127.0.0.1','1','admin','管理员','登录','2016-01-25 12:23:05'),(187,'127.0.0.1','1','admin','管理员','登录','2016-01-25 14:57:15'),(188,'127.0.0.1','1','admin','管理员','登录','2016-01-25 15:03:55'),(189,'127.0.0.1','1','admin','管理员','登录','2016-01-25 15:05:20'),(190,'127.0.0.1','1','admin','管理员','登录','2016-01-25 15:07:13'),(191,'127.0.0.1','1','admin','管理员','登录','2016-01-25 15:13:51'),(192,'127.0.0.1','1','admin','管理员','登录','2016-01-25 15:18:47'),(193,'127.0.0.1','1','admin','管理员','登录','2016-01-25 15:30:26'),(194,'127.0.0.1','1','admin','管理员','登录','2016-01-25 15:31:18'),(195,'127.0.0.1','1','admin','管理员','登录','2016-01-25 15:36:37'),(196,'127.0.0.1','1','admin','管理员','登录','2016-01-25 15:39:27'),(197,'127.0.0.1','1','admin','管理员','登录','2016-01-25 15:41:02'),(198,'127.0.0.1','1','admin','管理员','登录','2016-01-25 15:42:31'),(199,'127.0.0.1','1','admin','管理员','登录','2016-01-25 15:45:05'),(200,'127.0.0.1','1','admin','管理员','登录','2016-01-25 15:47:52'),(201,'127.0.0.1','1','admin','管理员','登录','2016-01-25 15:54:09'),(202,'127.0.0.1','1','admin','管理员','登录','2016-01-25 15:55:20'),(203,'127.0.0.1','1','admin','管理员','登录','2016-01-25 15:57:12'),(204,'127.0.0.1','1','admin','管理员','登录','2016-01-25 16:01:29'),(205,'127.0.0.1','1','admin','管理员','登录','2016-01-25 16:06:33'),(206,'127.0.0.1','1','admin','管理员','登录','2016-01-25 16:08:36');

/*Table structure for table `tbl_privilege_module` */

DROP TABLE IF EXISTS `tbl_privilege_module`;

CREATE TABLE `tbl_privilege_module` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `url` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `sn` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标识',
  `state` int(10) DEFAULT NULL COMMENT '存放该模块有哪些权限值可选',
  `image` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '图片路径',
  `order_no` int(5) DEFAULT NULL COMMENT '模块的排序号',
  `pid` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '父模块id',
  `system_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '系统id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识0:删除1：存在',
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_module_sn_index` (`sn`,`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_privilege_module` */

insert  into `tbl_privilege_module`(`id`,`name`,`url`,`sn`,`state`,`image`,`order_no`,`pid`,`system_id`,`create_time`,`creator`,`update_time`,`updator`,`del_flag`) values ('1','权限管理','','privilege',15,NULL,10,'','1','2015-11-11 11:11:14',NULL,'2015-11-11 11:11:14',NULL,1),('11','系统管理','/managment/privilege/icsystem/list.do','icsystem',15,NULL,1001,'1','1','2015-12-29 09:13:27',NULL,'2015-11-11 11:11:14',NULL,1),('12','模块管理','/managment/privilege/module/list.do','module',15,NULL,1002,'1','1','2015-12-29 09:14:00',NULL,'2015-11-11 11:11:14',NULL,1),('13','用户管理','/managment/privilege/user/list.do','user',79,NULL,1003,'1','1','2015-12-29 09:14:08',NULL,'2015-11-11 11:11:14',NULL,1),('14','部门管理','/managment/privilege/dept/list.do','dept',15,NULL,1004,'1','1','2015-12-29 09:15:08',NULL,'2015-11-11 11:11:14',NULL,1),('15','角色管理','/managment/privilege/role/list.do','role',79,NULL,1005,'1','1','2015-12-29 09:15:13',NULL,'2015-11-11 11:11:14',NULL,1),('16','系统配置','/managment/system/systemConfig/list.do','config',15,NULL,1006,'1','1','2015-12-29 09:15:18',NULL,'2015-11-11 11:11:14',NULL,1),('17','数据字典','/managment/system/dictionary/list.do','dictionary',15,NULL,1007,'1','1','2015-12-29 09:15:23',NULL,'2015-11-11 11:11:14',NULL,1),('18','登录日志','/managment/system/loginLog/list.do','loginlog',15,NULL,1008,'1','1','2015-12-29 09:15:28',NULL,'2015-11-11 11:11:14',NULL,1),('19','系统权限值','/managment/privilege/pval/list.do','pval',15,NULL,1009,'1','1','2015-12-29 09:15:33',NULL,'2015-11-11 11:11:14',NULL,1),('8a81e53c5276ef7e015276ef7e410000','个性化设置','/managment/system/systemConfig/uploadImageUI.do','person_config',15,NULL,1010,'1','1','2016-01-25 11:59:31',NULL,'2016-01-25 11:59:12',NULL,1),('8a81e5e551f1c98b0151f1cdae130009','321','','321',127,NULL,NULL,'','8a81e5e551eccf870151ecde8c7d0075','2015-12-30 15:32:48',NULL,'2015-12-30 15:32:48',NULL,1);

/*Table structure for table `tbl_privilege_pvalue` */

DROP TABLE IF EXISTS `tbl_privilege_pvalue`;

CREATE TABLE `tbl_privilege_pvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` varchar(40) DEFAULT NULL COMMENT '系统id',
  `position` int(3) NOT NULL COMMENT '整型的位',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `order_no` int(11) DEFAULT NULL COMMENT '排序号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updator` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `position_only_index` (`position`),
  KEY `name_only_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_privilege_pvalue` */

insert  into `tbl_privilege_pvalue`(`id`,`system_id`,`position`,`name`,`order_no`,`remark`,`create_time`,`creator`,`update_time`,`updator`) values (1,'1',0,'添加',2,'','2015-11-11 11:11:14',NULL,'0000-00-00 00:00:00',NULL),(2,'1',1,'查询',1,NULL,'2015-11-11 11:11:14',NULL,'0000-00-00 00:00:00',NULL),(3,'1',2,'修改',3,NULL,'2015-11-11 11:11:14',NULL,'0000-00-00 00:00:00',NULL),(4,'1',3,'删除',4,NULL,'2015-11-11 11:11:14',NULL,'0000-00-00 00:00:00',NULL),(5,'1',4,'打印',5,NULL,'2015-11-11 11:11:14',NULL,'0000-00-00 00:00:00',NULL),(6,'1',5,'导出',6,NULL,'2015-11-11 11:11:14',NULL,'0000-00-00 00:00:00',NULL),(7,'1',6,'授权',7,NULL,'2015-11-11 11:11:14',NULL,'0000-00-00 00:00:00',NULL),(29,'8a81e5e551eccf870151ecde8c7d0075',0,'添加',2,NULL,'2015-12-29 16:33:06',NULL,'0000-00-00 00:00:00',NULL),(30,'8a81e5e551eccf870151ecde8c7d0075',1,'查询',1,'','2015-12-29 16:33:06',NULL,'0000-00-00 00:00:00',NULL),(31,'8a81e5e551eccf870151ecde8c7d0075',2,'修改',3,NULL,'2015-12-29 16:33:06',NULL,'0000-00-00 00:00:00',NULL),(32,'8a81e5e551eccf870151ecde8c7d0075',3,'删除',4,NULL,'2015-12-29 16:33:06',NULL,'0000-00-00 00:00:00',NULL),(33,'8a81e5e551eccf870151ecde8c7d0075',4,'打印',5,NULL,'2015-12-29 16:33:06',NULL,'0000-00-00 00:00:00',NULL),(34,'8a81e5e551eccf870151ecde8c7d0075',5,'导出',6,NULL,'2015-12-29 16:33:06',NULL,'0000-00-00 00:00:00',NULL),(35,'8a81e5e551eccf870151ecde8c7d0075',6,'授权',7,NULL,'2015-12-29 16:33:06',NULL,'0000-00-00 00:00:00',NULL),(36,'8a81e5e551ecf28c0151ecf28ce90000',0,'添加',2,NULL,'2015-12-29 16:54:57',NULL,'0000-00-00 00:00:00',NULL),(37,'8a81e5e551ecf28c0151ecf28ce90000',1,'查询',1,NULL,'2015-12-29 16:54:57',NULL,'0000-00-00 00:00:00',NULL),(38,'8a81e5e551ecf28c0151ecf28ce90000',2,'修改',3,NULL,'2015-12-29 16:54:57',NULL,'0000-00-00 00:00:00',NULL),(39,'8a81e5e551ecf28c0151ecf28ce90000',3,'删除',4,NULL,'2015-12-29 16:54:57',NULL,'0000-00-00 00:00:00',NULL),(40,'8a81e5e551ecf28c0151ecf28ce90000',4,'打印',5,NULL,'2015-12-29 16:54:57',NULL,'0000-00-00 00:00:00',NULL),(41,'8a81e5e551ecf28c0151ecf28ce90000',5,'导出',6,NULL,'2015-12-29 16:54:57',NULL,'0000-00-00 00:00:00',NULL),(42,'8a81e5e551ecf28c0151ecf28ce90000',6,'授权',7,NULL,'2015-12-29 16:54:57',NULL,'0000-00-00 00:00:00',NULL),(43,'8a81e5e551ecf28c0151ecf327f30001',0,'添加',2,NULL,'2015-12-29 16:55:37',NULL,'0000-00-00 00:00:00',NULL),(44,'8a81e5e551ecf28c0151ecf327f30001',1,'查询',1,NULL,'2015-12-29 16:55:37',NULL,'0000-00-00 00:00:00',NULL),(45,'8a81e5e551ecf28c0151ecf327f30001',2,'修改',3,NULL,'2015-12-29 16:55:37',NULL,'0000-00-00 00:00:00',NULL),(46,'8a81e5e551ecf28c0151ecf327f30001',3,'删除',4,NULL,'2015-12-29 16:55:37',NULL,'0000-00-00 00:00:00',NULL),(47,'8a81e5e551ecf28c0151ecf327f30001',4,'打印',5,NULL,'2015-12-29 16:55:37',NULL,'0000-00-00 00:00:00',NULL),(48,'8a81e5e551ecf28c0151ecf327f30001',5,'导出',6,NULL,'2015-12-29 16:55:37',NULL,'0000-00-00 00:00:00',NULL),(49,'8a81e5e551ecf28c0151ecf327f30001',6,'授权',7,NULL,'2015-12-29 16:55:37',NULL,'0000-00-00 00:00:00',NULL),(50,'8a81e4bf51f0d1140151f0d1144d0000',0,'添加',2,NULL,'2015-12-30 10:56:52',NULL,'0000-00-00 00:00:00',NULL),(51,'8a81e4bf51f0d1140151f0d1144d0000',1,'查询',1,NULL,'2015-12-30 10:56:52',NULL,'0000-00-00 00:00:00',NULL),(52,'8a81e4bf51f0d1140151f0d1144d0000',2,'修改',3,NULL,'2015-12-30 10:56:52',NULL,'0000-00-00 00:00:00',NULL),(53,'8a81e4bf51f0d1140151f0d1144d0000',3,'删除',4,NULL,'2015-12-30 10:56:52',NULL,'0000-00-00 00:00:00',NULL),(54,'8a81e4bf51f0d1140151f0d1144d0000',4,'打印',5,NULL,'2015-12-30 10:56:52',NULL,'0000-00-00 00:00:00',NULL),(55,'8a81e4bf51f0d1140151f0d1144d0000',5,'导出',6,NULL,'2015-12-30 10:56:52',NULL,'0000-00-00 00:00:00',NULL),(56,'8a81e4bf51f0d1140151f0d1144d0000',6,'授权',7,NULL,'2015-12-30 10:56:52',NULL,'0000-00-00 00:00:00',NULL),(58,'8a81e5e551f1bbf40151f1bbf4460000',0,'添加',2,NULL,'2015-12-30 15:13:26',NULL,'0000-00-00 00:00:00',NULL),(59,'8a81e5e551f1bbf40151f1bbf4460000',1,'查询',1,NULL,'2015-12-30 15:13:26',NULL,'0000-00-00 00:00:00',NULL),(60,'8a81e5e551f1bbf40151f1bbf4460000',2,'修改',3,NULL,'2015-12-30 15:13:26',NULL,'0000-00-00 00:00:00',NULL),(61,'8a81e5e551f1bbf40151f1bbf4460000',3,'删除',4,NULL,'2015-12-30 15:13:26',NULL,'0000-00-00 00:00:00',NULL),(62,'8a81e5e551f1bbf40151f1bbf4460000',4,'打印',5,NULL,'2015-12-30 15:13:26',NULL,'0000-00-00 00:00:00',NULL),(63,'8a81e5e551f1bbf40151f1bbf4460000',5,'导出',6,NULL,'2015-12-30 15:13:26',NULL,'0000-00-00 00:00:00',NULL),(64,'8a81e5e551f1bbf40151f1bbf4460000',6,'授权',7,NULL,'2015-12-30 15:13:26',NULL,'0000-00-00 00:00:00',NULL),(65,'8a81e5e551f1bbf40151f1c2930d0004',0,'添加',2,NULL,'2015-12-30 15:20:40',NULL,'0000-00-00 00:00:00',NULL),(66,'8a81e5e551f1bbf40151f1c2930d0004',1,'查询',1,NULL,'2015-12-30 15:20:40',NULL,'0000-00-00 00:00:00',NULL),(67,'8a81e5e551f1bbf40151f1c2930d0004',2,'修改',3,NULL,'2015-12-30 15:20:40',NULL,'0000-00-00 00:00:00',NULL),(68,'8a81e5e551f1bbf40151f1c2930d0004',3,'删除',4,NULL,'2015-12-30 15:20:40',NULL,'0000-00-00 00:00:00',NULL),(69,'8a81e5e551f1bbf40151f1c2930d0004',4,'打印',5,NULL,'2015-12-30 15:20:40',NULL,'0000-00-00 00:00:00',NULL),(70,'8a81e5e551f1bbf40151f1c2930d0004',5,'导出',6,NULL,'2015-12-30 15:20:40',NULL,'0000-00-00 00:00:00',NULL),(71,'8a81e5e551f1bbf40151f1c2930d0004',6,'授权',7,NULL,'2015-12-30 15:20:40',NULL,'0000-00-00 00:00:00',NULL),(73,'8a81e5e551f1c98b0151f1cb2c210008',0,'添加',2,NULL,'2015-12-30 15:30:03',NULL,'0000-00-00 00:00:00',NULL),(74,'8a81e5e551f1c98b0151f1cb2c210008',1,'查询',1,NULL,'2015-12-30 15:30:03',NULL,'0000-00-00 00:00:00',NULL),(75,'8a81e5e551f1c98b0151f1cb2c210008',2,'修改',3,NULL,'2015-12-30 15:30:03',NULL,'0000-00-00 00:00:00',NULL),(76,'8a81e5e551f1c98b0151f1cb2c210008',3,'删除',4,NULL,'2015-12-30 15:30:03',NULL,'0000-00-00 00:00:00',NULL),(77,'8a81e5e551f1c98b0151f1cb2c210008',4,'打印',5,NULL,'2015-12-30 15:30:03',NULL,'0000-00-00 00:00:00',NULL),(78,'8a81e5e551f1c98b0151f1cb2c210008',5,'导出',6,NULL,'2015-12-30 15:30:03',NULL,'0000-00-00 00:00:00',NULL),(79,'8a81e5e551f1c98b0151f1cb2c210008',6,'授权',7,NULL,'2015-12-30 15:30:03',NULL,'0000-00-00 00:00:00',NULL);

/*Table structure for table `tbl_privilege_role` */

DROP TABLE IF EXISTS `tbl_privilege_role`;

CREATE TABLE `tbl_privilege_role` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `sn` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '标识',
  `note` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识0：删除 1：存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_privilege_role` */

insert  into `tbl_privilege_role`(`id`,`name`,`sn`,`note`,`create_time`,`creator`,`update_time`,`updator`,`del_flag`) values ('1','超级管理员','admin','','2015-12-30 10:59:35',NULL,'2015-11-11 11:11:14',NULL,1),('8a81e5e551ec92f10151eca9db920011','普通管理员','adminsub','','2015-12-29 15:35:33',NULL,'2015-12-29 15:35:33',NULL,1);

/*Table structure for table `tbl_privilege_session_data` */

DROP TABLE IF EXISTS `tbl_privilege_session_data`;

CREATE TABLE `tbl_privilege_session_data` (
  `session_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'sessionId',
  `user_info` text COLLATE utf8_bin COMMENT '用户信息',
  `acls_info` text COLLATE utf8_bin COMMENT '权限列表',
  `other_info` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '其他的信息',
  `creation_time` bigint(20) DEFAULT NULL COMMENT 'session时间戳',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_privilege_session_data` */

/*Table structure for table `tbl_privilege_shortcut_menu` */

DROP TABLE IF EXISTS `tbl_privilege_shortcut_menu`;

CREATE TABLE `tbl_privilege_shortcut_menu` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `icon` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'url',
  `ic_system_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '系统id',
  `module_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '模块id',
  `order_no` int(11) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_privilege_shortcut_menu` */

/*Table structure for table `tbl_privilege_system_config` */

DROP TABLE IF EXISTS `tbl_privilege_system_config`;

CREATE TABLE `tbl_privilege_system_config` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `config_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '配置名称',
  `config_sn` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '配置标示',
  `config_key` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '配置key',
  `config_value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '配置key的value值',
  `remark` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识0：删除1：存在',
  `config_order` int(2) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `config_key_unique` (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_privilege_system_config` */

insert  into `tbl_privilege_system_config`(`id`,`config_name`,`config_sn`,`config_key`,`config_value`,`remark`,`create_time`,`creator`,`update_time`,`updator`,`del_flag`,`config_order`) values ('8a81e53c50f4869d0150f4869d5d000f','是否是开发环境','10.1.100.95','is_prod','false','','2016-01-16 12:52:23',NULL,'2015-11-11 11:11:14',NULL,1,100),('8a8a944d5243bf3f015248c6b7620015','公司名称','company_name','company_name','ecnice','','2016-01-25 11:38:41',NULL,'2016-01-16 12:52:13',NULL,1,1),('8a8a944d5243bf3f015248c7d8a00016','平台名称','plain_name','plain_name','运营管理平台','','2016-01-16 14:50:04',NULL,'2016-01-16 12:53:27',NULL,1,2);

/*Table structure for table `tbl_privilege_user` */

DROP TABLE IF EXISTS `tbl_privilege_user`;

CREATE TABLE `tbl_privilege_user` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `real_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '真实姓名',
  `username` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `tel` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `phone` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '座机',
  `mobile` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `email` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `image` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `department_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '部门id',
  `it_user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'it用户id',
  `it_user_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'it用户姓名',
  `is_leader` int(1) DEFAULT '0' COMMENT '是否是领导1:是  0:否',
  `sex` int(1) DEFAULT '0' COMMENT '性别 0标示男 1标示女  2',
  `address` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `fax` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '传真',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识  0标识已删除   1标识未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_privilege_user` */

insert  into `tbl_privilege_user`(`id`,`real_name`,`username`,`password`,`tel`,`phone`,`mobile`,`email`,`image`,`department_id`,`it_user_id`,`it_user_name`,`is_leader`,`sex`,`address`,`fax`,`create_time`,`creator`,`update_time`,`updator`,`del_flag`) values ('1','管理员','admin','19daa85f9bb6baa15d9c86af16926ea4','','','','admin@qq.com',NULL,'1',NULL,NULL,0,0,'','','2016-01-25 11:08:01',NULL,'2015-11-11 11:11:14',NULL,1),('8a81e4bf51f203340151f203345d0000','团座','wwww','19daa85f9bb6baa15d9c86af16926ea4','','','','tuanzuo@tuanzuo.com',NULL,'1',NULL,NULL,0,0,'','','2016-01-25 11:08:02',NULL,'2015-12-30 16:31:15',NULL,1),('8a81e53c50f95e9a0150f961aa7b0001','test','test','19daa85f9bb6baa15d9c86af16926ea4','','','18689203258','test@123.com',NULL,'1',NULL,NULL,0,0,'','','2016-01-25 11:08:03',NULL,'2015-11-12 09:48:58',NULL,0),('8a81e5e551f1bbf40151f1c3849c0005','1','1','19daa85f9bb6baa15d9c86af16926ea4','','1','','32@qqcin.ccc',NULL,'1',NULL,NULL,0,0,'','1','2016-01-25 11:08:04',NULL,'2015-12-30 15:21:42',NULL,0),('8a81e5e551f1c98b0151f1ca0a870002','321','321','19daa85f9bb6baa15d9c86af16926ea4','','','','132@fdsf.c',NULL,'1',NULL,NULL,0,0,'','','2016-01-25 11:08:05',NULL,'2015-12-30 15:28:49',NULL,0),('8a81e5e551f232920151f23443900001','1','fdsf11','19daa85f9bb6baa15d9c86af16926ea4','','','','11@fda.com',NULL,'8a81e5e551f232920151f23292680000',NULL,NULL,0,0,'','','2016-01-25 11:08:08',NULL,'2015-12-30 17:24:50',NULL,1);

/*Table structure for table `tbl_privilege_user_company` */

DROP TABLE IF EXISTS `tbl_privilege_user_company`;

CREATE TABLE `tbl_privilege_user_company` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `user_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `company_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '公司id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `del_flag` int(1) DEFAULT '1' COMMENT '1:存在  0：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_privilege_user_company` */

insert  into `tbl_privilege_user_company`(`id`,`user_id`,`company_id`,`create_time`,`creator`,`update_time`,`updator`,`del_flag`) values ('8a81e53c50f4869d0150f4869d4a0003','1','8a81e53c50f4869d0150f4869d490002','2015-11-11 11:11:14',NULL,'2015-11-11 11:11:14',NULL,1),('8a81e53c50f95e9a0150f961aa820003','8a81e53c50f95e9a0150f961aa7b0001','8a81e53c50f4869d0150f4869d490002','2015-11-12 09:48:58',NULL,'2015-11-12 09:48:58',NULL,1);

/*Table structure for table `tbl_privilege_user_role` */

DROP TABLE IF EXISTS `tbl_privilege_user_role`;

CREATE TABLE `tbl_privilege_user_role` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `user_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '角色id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识0：删除1：存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_privilege_user_role` */

insert  into `tbl_privilege_user_role`(`id`,`user_id`,`role_id`,`create_time`,`creator`,`update_time`,`updator`,`del_flag`) values ('8a81e53c5242f58b015242f772e00001','8a81e4bf51f203340151f203345d0000','8a81e5e551ec92f10151eca9db920011','2016-01-15 09:47:39',NULL,'2016-01-15 09:47:39',NULL,1),('8a81e5e551f601db0151f6a0c56200f5','1','1','2015-12-31 14:01:50',NULL,'2015-12-31 14:01:50',NULL,1),('8a81e5e551f601db0151f6a9c3670101','8a81e5e551f232920151f23443900001','8a81e5e551ec92f10151eca9db920011','2015-12-31 14:11:39',NULL,'2015-12-31 14:11:39',NULL,1),('8a81e5e551f601db0151f6a9c36a0102','8a81e5e551f232920151f23443900001','1','2015-12-31 14:11:39',NULL,'2015-12-31 14:11:39',NULL,1);

/*Table structure for table `tbl_privilege_user_system` */

DROP TABLE IF EXISTS `tbl_privilege_user_system`;

CREATE TABLE `tbl_privilege_user_system` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `user_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `system_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '系统id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识0:删除1：存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `tbl_privilege_user_system` */

insert  into `tbl_privilege_user_system`(`id`,`user_id`,`system_id`,`create_time`,`creator`,`update_time`,`updator`,`del_flag`) values ('8a81e4bf51f203340151f20334630001','8a81e4bf51f203340151f203345d0000','1','2015-12-30 16:31:15',NULL,'2015-12-30 16:31:15',NULL,1),('8a81e4bf51f203340151f20334660002','8a81e4bf51f203340151f203345d0000','8a81e5e551eccf870151ecde8c7d0075','2015-12-30 16:31:15',NULL,'2015-12-30 16:31:15',NULL,1),('8a81e5e551f1c98b0151f1ca3faa0005','1','1','2015-12-30 15:29:03',NULL,'2015-12-30 15:29:03',NULL,1),('8a81e5e551f232920151f23443940002','8a81e5e551f232920151f23443900001','8a81e5e551eccf870151ecde8c7d0075','2015-12-30 17:24:50',NULL,'2015-12-30 17:24:50',NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
