-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 101.43.231.2    Database: lfouse
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '管理员ID',
  `apwd` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','123456');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection` (
  `h_id` int DEFAULT NULL COMMENT '房源ID',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  KEY `h_id` (`h_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`h_id`) REFERENCES `h_resources` (`h_id`),
  CONSTRAINT `collection_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (6,1),(7,1),(2,1),(4,1),(33,1),(10,1),(1,1),(36,1),(32,20);
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_facilities`
--

DROP TABLE IF EXISTS `h_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `h_facilities` (
  `h_id` int DEFAULT NULL COMMENT '房源ID',
  `wifi` int DEFAULT NULL COMMENT 'WIFI',
  `TV` int DEFAULT NULL COMMENT '电视',
  `shower` int DEFAULT NULL COMMENT '淋浴',
  `airConditioner` int DEFAULT NULL COMMENT '空调',
  `washing` int DEFAULT NULL COMMENT '洗衣机',
  `refrigerator` int DEFAULT NULL COMMENT '冰箱',
  KEY `FK_h_facilities` (`h_id`),
  CONSTRAINT `FK_h_facilities` FOREIGN KEY (`h_id`) REFERENCES `h_resources` (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_facilities`
--

LOCK TABLES `h_facilities` WRITE;
/*!40000 ALTER TABLE `h_facilities` DISABLE KEYS */;
INSERT INTO `h_facilities` VALUES (5,0,1,1,0,0,1),(1,1,1,1,1,1,1),(2,0,0,0,0,0,0),(3,1,1,1,1,1,1),(4,1,1,1,1,1,1),(6,1,1,1,1,1,1),(7,1,1,1,1,1,1),(8,1,1,1,1,1,1),(9,0,0,1,1,1,1),(10,1,0,1,1,0,1),(24,0,1,1,0,1,1),(25,0,0,1,1,1,1),(26,1,0,1,1,1,1),(27,1,0,1,1,1,0),(30,1,1,1,1,1,1),(32,1,1,1,1,1,1),(33,0,0,1,1,1,1),(34,0,0,1,1,1,1),(35,1,1,0,1,0,1),(36,1,1,0,1,0,1),(40,1,1,1,1,1,1);
/*!40000 ALTER TABLE `h_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_resources`
--

DROP TABLE IF EXISTS `h_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `h_resources` (
  `h_id` int NOT NULL AUTO_INCREMENT COMMENT '房源ID\n	外键 主键表:收藏表(collection),配置表(h_facilities),租房表(lodge),照片表(photo)',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `h_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '房源名称',
  `h_location` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '房源位置',
  `h_price` float DEFAULT NULL COMMENT '房源价格',
  `h_layout` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '房源户型',
  `h_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '房源类型',
  `h_area` float DEFAULT NULL COMMENT '房源面积',
  `h_elevator` tinyint(1) DEFAULT NULL COMMENT '有无电梯,0(没有),1(有)',
  `h_toward` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '朝向',
  `h_traffic` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '交通',
  `h_status` int DEFAULT NULL COMMENT '房源状态: -1(审核不通过),0(待审核),1(待上架),2(已上架),3(已出租)',
  `h_floor` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '楼层',
  PRIMARY KEY (`h_id`),
  KEY `FK_h_resources` (`user_id`),
  CONSTRAINT `FK_h_resources` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_resources`
--

LOCK TABLES `h_resources` WRITE;
/*!40000 ALTER TABLE `h_resources` DISABLE KEYS */;
INSERT INTO `h_resources` VALUES (1,1,'白金瀚宫','上海-浦东-唐镇',105000,'6室3厅3卫','别墅',534,0,'朝南','距2号线唐镇站约800米',2,'共3层'),(2,2,'绿城玉兰花园臻园','上海-浦东-唐镇',11500,'3室2厅','商品房',90,1,'朝南','距2号线唐镇站约537米。',1,'10楼'),(3,2,'联泰滨江中心','南昌-红谷滩新区赣江新区999号',5500,NULL,'写字楼',110,1,'西北','地铁二号线，红谷中大道，公交地铁一体化',-1,'1-20楼'),(4,3,'正荣大湖之都loft公寓','南昌-莲塘-正荣大湖之都大湖公馆',1000,'1室1厅','公寓',47,1,'朝北','距离公交车站直线距离600米，小区出门即是公交站，交通便捷',2,'20楼'),(5,3,'南昌西站好一家旅游家居','南昌-南昌西站龙兴大街',200,'2室1厅','民宿',80,0,'朝南','距离南昌西站1.07公里',2,'共1层'),(6,1,'长运大厦楼上','南昌-西湖-丁公路-长运大厦',1500,'1室1厅','公寓',45,1,'朝南','步行到地铁站200米',-1,'12楼'),(7,1,'复古潮流简约风','杭州-江干区-凤起东路42号',288,'一室一厅','民宿',60,0,'朝南','离庆菱路地铁口步行约10分钟',2,'共2层'),(8,2,'伟象陌业城','南昌-南昌县-象湖滨江-伟象佰业城',1600,'3室2厅','商品房',83,1,'朝南','小区西侧旁边就是地铁4号线新洪城大市场站',1,'16楼'),(9,3,'绿地海域香廷','南昌-红谷滩-红角洲-绿地海域香廷',20000,'5室2厅3卫','别墅',220,0,'朝南','距2号线学府大道东站约1099米。',-1,'共3层'),(10,2,'力高滨江国际','南昌-西湖-朝阳新城-力高滨江国际',15000,'4室2厅','写字楼',238,1,'西北','距离4号线官洲站与丁家洲站皆为800多米交通便利！！',1,'20-36楼'),(24,1,'不点进来别后悔-地铁好房-品质装修','包头-青山-欣佳宝邸',3500,'2室2厅1卫','商品房',77,0,'南北','距离地铁1号线赛汗塔拉站200米',2,'4层'),(25,2,'东四-张自忠路-豪装三进四合院-有车库','北京-东城-石桥胡同小区',275000,'5室3厅3卫','商品房',500,0,'朝南','本房周边一公里内衣食住行无忧！',3,'1层'),(26,3,'6号线青年路朝阳大悦城东艺传媒惠通','北京-朝阳-金隅泰和园',6600,'2室1厅1卫','公寓',80,1,'朝南','房屋周边有大型的超市、商场等，可供您购物的需求,楼下是公交站',2,'7层'),(27,1,'真实！瑞辉精装修三居室随时看房','北京-朝阳-东坝公寓',7300,'3室2厅1卫','公寓',90,1,'南北','附近地铁站为东坝中街站，公交车站为单店站，交通便利',2,'9层'),(30,2,'黄浦区-新天地-老西门','上海-黄浦-大吉路24-26弄小区',1580,'2室1厅','民宿',24,0,'朝南','距离8/9/10/13号线200米',1,'6层'),(32,3,'13号线适合一个人，安安静静','包头-青山-欣佳宝邸',3000,'2室1厅','民宿',28,1,'朝南','锶淼公寓九成房源选择在地铁站或公交站附近',2,'12层'),(33,1,'意城晶华别墅','包头-昆都仑-意城晶华(别墅) ',5000,'7室2厅3卫','别墅',360,0,'南北','距离公交站900米',3,'共3层'),(34,2,'麦卡伦地-精装独栋','北京-昌平-麦卡伦地',33000,'5室3厅5卫','别墅',568.1,0,'南北','步行到公交站大约90分钟',-1,'共3层'),(35,3,'响应国家政策-新租户减','朝阳-三元桥-曙光西里甲5号',270000,'','写字楼',1400,1,'朝北','交通便利，购物方便，城市中心',2,'27层'),(36,1,'1号线莲花路-中庚环球PLAZA','上海-闵行-中庚环球创意中心',240000,'','写字楼',650,1,'朝东','8走天桥直通到地铁1号线莲花站，可开车上A4，沪闵路高架',2,'24层'),(40,2,'壹号公馆','南昌-进贤',2000,'3室1厅','商品房',100,1,'朝南','距离进贤南站2公里',1,'14楼'),(44,5,'LT_测试','江西-萍乡',800,NULL,'民宿',40,1,'朝南','测试',1,'三楼');
/*!40000 ALTER TABLE `h_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lodge`
--

DROP TABLE IF EXISTS `lodge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lodge` (
  `lodge_id` int NOT NULL AUTO_INCREMENT COMMENT '租房ID',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `h_id` int DEFAULT NULL COMMENT '房源ID',
  `lodge_limit` int DEFAULT NULL COMMENT '租房月份',
  `lodge_price` float DEFAULT NULL COMMENT '租房价格',
  `lodge_stime` datetime DEFAULT NULL COMMENT '租房开始时间',
  `lodge_etime` datetime DEFAULT NULL COMMENT '预计退房时间',
  `lodge_otime` datetime DEFAULT NULL COMMENT '实际退房时间',
  `lodge_psta` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '订单状态:已支付,分期支付中,订单结束',
  `lodge_pway` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '支付方式',
  PRIMARY KEY (`lodge_id`),
  KEY `FK_user_id` (`user_id`),
  KEY `FK_h_id` (`h_id`),
  CONSTRAINT `FK_h_id` FOREIGN KEY (`h_id`) REFERENCES `h_resources` (`h_id`),
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lodge`
--

LOCK TABLES `lodge` WRITE;
/*!40000 ALTER TABLE `lodge` DISABLE KEYS */;
INSERT INTO `lodge` VALUES (15,3,5,2,200,'2022-06-24 10:27:54','2022-08-24 10:27:54','2022-06-25 16:37:10','订单结束','全款'),(16,1,25,100,27500000,'2022-06-24 10:40:10','2030-10-24 10:40:10','2022-06-26 15:34:50','订单结束','分期'),(17,1,26,1,6600,'2022-06-24 11:11:43','2022-07-24 11:11:43','2022-06-24 11:52:06','订单结束','全款'),(19,1,24,1,3500,'2022-06-24 11:55:50','2022-07-24 11:55:50','2022-06-26 15:35:06','订单结束','分期'),(20,1,24,1,3500,'2022-06-24 11:59:48','2022-07-24 11:59:48','2022-06-26 15:35:06','订单结束','分期'),(21,1,24,1,3500,'2022-06-24 11:59:51','2022-07-24 11:59:51','2022-06-26 15:35:06','订单结束','分期'),(22,1,24,1,3500,'2022-06-24 11:59:56','2022-07-24 11:59:56','2022-06-26 15:35:06','订单结束','分期'),(24,1,2,0,11500,'2022-06-24 14:00:05','2022-07-24 14:00:05','2022-06-25 16:41:49','订单结束','分期'),(25,1,2,0,11500,'2022-06-24 14:00:13','2022-07-24 14:00:13','2022-06-25 16:41:49','订单结束','分期'),(26,1,2,2,23000,'2022-06-24 14:18:30','2022-08-24 14:18:30','2022-06-25 16:41:49','订单结束','全款'),(28,1,32,1,3000,'2022-06-24 19:03:31','2022-07-24 19:03:31','2022-06-24 21:40:49','订单结束','全款'),(29,1,6,1,1500,'2022-06-24 20:10:04','2022-07-24 20:10:04','2022-06-24 20:11:43','订单结束','全款'),(30,1,5,1,200,'2022-06-25 16:43:07','2022-07-25 16:43:07','2022-07-01 08:38:07','订单结束','全款'),(31,1,24,12,42000,'2022-06-25 16:43:23','2023-06-25 16:43:23','2022-06-26 15:35:06','订单结束','分期'),(32,1,5,1,200,'2022-06-26 15:30:47','2022-07-26 15:30:47','2022-07-01 08:38:07','订单结束','全款'),(33,1,25,1,275000,'2022-06-26 15:30:54','2022-07-26 15:30:54','2022-06-26 15:34:50','订单结束','分期'),(34,1,25,1,275000,'2022-06-26 15:34:40','2022-07-26 15:34:40','2022-06-26 15:34:50','订单结束','全款'),(35,1,24,1,3500,'2022-06-26 15:34:56','2022-07-26 15:34:56','2022-06-26 15:35:06','订单结束','分期'),(36,1,25,1,275000,'2022-06-26 15:35:17','2022-07-26 15:35:17',NULL,'分期支付中','分期'),(44,20,60,1,1,'2022-06-29 09:45:17','2022-07-29 09:45:17','2022-06-29 09:45:41','订单结束','全款'),(45,20,61,3,3,'2022-06-29 09:55:29','2022-08-29 09:55:51','2022-06-29 09:56:00','订单结束','全款'),(46,20,62,1,1,'2022-06-29 10:00:06','2022-07-29 10:00:06','2022-06-29 10:00:09','订单结束','全款'),(53,1,4,1,1000,'2022-06-30 14:56:40','2022-07-30 14:56:40','2022-07-01 08:38:04','订单结束','全款'),(54,5,33,3,15000,'2022-06-30 22:31:05','2022-08-30 22:36:00',NULL,'已支付','全款'),(55,5,32,1,3000,'2022-06-30 23:01:18','2022-07-30 23:01:18','2022-06-30 23:01:42','订单结束','全款'),(56,1,35,1,270000,'2022-07-01 08:39:33','2022-08-01 08:39:33','2022-07-01 08:44:51','订单结束','全款');
/*!40000 ALTER TABLE `lodge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo` (
  `h_id` int DEFAULT NULL COMMENT '房源ID',
  `photo_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '照片名称',
  KEY `FK_photo` (`h_id`),
  CONSTRAINT `FK_photo` FOREIGN KEY (`h_id`) REFERENCES `h_resources` (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,'别墅1.jpg'),(4,'公寓1.jpg'),(5,'民宿1.jpg'),(6,'公寓2.jpg'),(7,'民宿2.jpg'),(8,'商品房2.jpg'),(9,'别墅2.jpg'),(10,'写字楼2.jpg'),(2,'商品房1.jpg'),(3,'写字楼1.jpg'),(33,'别墅3.jpg'),(34,'别墅4.jpg'),(35,'写字楼3.jpg'),(36,'写字楼4.jpg'),(26,'公寓3.jpg'),(27,'公寓4.jpg'),(30,'民宿3.jpg'),(32,'民宿4.jpg'),(24,'商品房4.jpg'),(25,'商品房5.jpg'),(40,'商品房3.jpg'),(4,'公寓1-4.jpg'),(6,'公寓2-2.jpg'),(10,'写字楼2-4.jpg'),(36,'写字楼4-3.jpg'),(36,'写字楼4-4.jpg'),(33,'别墅3-4.jpg'),(34,'别墅4-2.jpg'),(34,'别墅4-3.jpg'),(40,'商品房3-2.jpg'),(24,'商品房4-3.jpg'),(24,'商品房4-4.jpg'),(2,'商品房1-3.jpg'),(8,'商品房2-2.jpg'),(8,'商品房2-3.jpg'),(9,'别墅2-2.jpg'),(9,'别墅2-3.jpg'),(9,'别墅2-4.jpg'),(4,'公寓1-2.jpg'),(4,'公寓1-3.jpg'),(6,'公寓2-3.jpg'),(6,'公寓2-4.jpg'),(26,'公寓3-2.jpg'),(1,'别墅1-2.jpg'),(1,'别墅1-3.jpg'),(1,'别墅1-4.jpg'),(2,'商品房1-2.jpg'),(3,'写字楼1-2.jpg'),(3,'写字楼1-3.jpg'),(3,'写字楼1-4.jpg'),(5,'民宿1-2.jpg'),(5,'民宿1-3.jpg'),(5,'民宿1-4.jpg'),(7,'民宿2-2.jpg'),(7,'民宿2-3.jpg'),(7,'民宿2-4.jpg'),(10,'写字楼2-3.jpg'),(10,'写字楼2-2.jpg'),(24,'商品房4-2.jpg'),(25,'商品房5-2.jpg'),(25,'商品房5-3.jpg'),(25,'商品房5-4.jpg'),(26,'公寓3-3.jpg'),(26,'公寓3-4.jpg'),(27,'公寓4-2.jpg'),(27,'公寓4-3.jpg'),(27,'公寓4-4.jpg'),(30,'民宿3-2.jpg'),(30,'民宿3-4.jpg'),(30,'民宿3-3.jpg'),(32,'民宿4-2.jpg'),(32,'民宿4-3.jpg'),(33,'别墅3-2.jpg'),(33,'别墅3-3.jpg'),(34,'别墅4-4.jpg'),(35,'写字楼3-2.jpg'),(35,'写字楼3-3.jpg'),(36,'写字楼4-2.jpg'),(40,'商品房3-3.jpg'),(40,'商品房3-4.jpg');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID\n	外键 主键表:房源表(h_resources),收藏表(collection),租房表(lodge)',
  `tel` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '电话',
  `uname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '用户名',
  `email` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `upwd` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '密码',
  `sex` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '男 or 女 or 其他',
  `age` int DEFAULT NULL COMMENT '年龄',
  `lodge_num` int DEFAULT NULL COMMENT '出租数量',
  `rent_num` int DEFAULT NULL COMMENT '租房数量',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'18146624272','堃芃','20201422@stu.nchu.edu.cn','123456','男',21,6,1),(2,'18146715130','Jack','3327940673@qq.com','123456','男',19,8,0),(3,'18146624367','Mike','3066557458@qq.com','123456','男',19,12,0),(4,'18146624368','abcdee','1531373946@qq.com','@1234567abc','男',101,0,0),(5,'15350098053','sinner','3066557458@qq.com','123456','男',20,0,1),(11,'15549367770','心系1234','3055690742@qq.com','Qwe123..','男',20,0,0),(12,'14345678901','12345','kp2427431300@163.com','Qwe123..','男',1,0,0),(20,'13117805802','古怪','1780182873@qq.com','LiuTong123...','女',18,0,0),(21,'18146624369','lhq','1484678743@qq.com','1234567lhq','男',20,0,0),(32,'18146624313','abcdee','3327940673@qq.com','@123456abc','男',20,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-13 12:46:12
