-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 10.19.227.229    Database: co_workerDB
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alarm`
--

DROP TABLE IF EXISTS `alarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alarm` (
  `check_status` varchar(2) COLLATE utf8mb4_0900_as_cs DEFAULT '1',
  `user_id` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `activity` varchar(10) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT '1. chatting 2. posting comment, 3. proposal confirm or reject',
  `message` varchar(100) COLLATE utf8mb4_0900_as_cs DEFAULT NULL,
  `alarm_id` bigint NOT NULL AUTO_INCREMENT,
  `alarm_count` bigint DEFAULT '1',
  PRIMARY KEY (`alarm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarm`
--

LOCK TABLES `alarm` WRITE;
/*!40000 ALTER TABLE `alarm` DISABLE KEYS */;
INSERT INTO `alarm` VALUES ('2','1','2','{2} 님이 {1번 시작글}에 뎃글을 남기셨습니다.',69,1),('2','1','3','2 님이 1번 시작글에 지원 하셨습니다.',70,1),('2','2','3','1번 시작글 제안에 수락 되셨습니다.',71,1),('2','1','1','1번 시작글에 메시지 도착',72,1),('2','2','1','1번 시작글에 메시지 도착',73,1),('2','1','1','1번 시작글에 메시지 도착',74,1),('2','2','1','1번 시작글에 메시지 도착',75,1),('2','1','1','1번 시작글에 메시지 도착',76,1),('2','2','1','1번 시작글에 메시지 도착',77,1),('2','1','1','1번 시작글에 메시지 도착',78,1),('2','2','1','1번 시작글에 메시지 도착',79,1),('2','1','1','1번 시작글에 메시지 도착',80,1),('2','2','1','1번 시작글에 메시지 도착',81,1),('2','1','1','1번 시작글에 메시지 도착',82,1),('2','2','1','1번 시작글에 메시지 도착',83,1),('2','1','1','1번 시작글에 메시지 도착',84,1),('2','1','1','1번 시작글에 메시지 도착',85,1),('2','1','2','{1} 님이 {123123}에 뎃글을 남기셨습니다.',86,1),('2','1','2','{1} 님이 {1번 시작글}에 뎃글을 남기셨습니다.',87,1),('2','1','2','{1} 님이 {1번 시작글}에 뎃글을 남기셨습니다.',88,1),('2','1','2','{1} 님이 {1번 시작글}에 뎃글을 남기셨습니다.',89,1),('2','1','2','{1} 님이 {1번 시작글}에 뎃글을 남기셨습니다.',90,1),('2','1','2','{1} 님이 {1번 시작글}에 뎃글을 남기셨습니다.',91,1),('2','1','2','{1} 님이 {1번 시작글}에 댓글을 작성했습니다.',92,1),('2','1','2','{1} 님이 {1번 시작글}에 댓글을 작성했습니다.',93,1),('2','1','2','{1} 님이 {1번 시작글}에 댓글을 작성했습니다.',94,1),('2','1','2','{1} 님이 {1번 시작글}에 댓글을 작성했습니다.',95,1),('2','1','2','{1} 님이 {1번 시작글}에 댓글을 작성했습니다.',96,1),('2','1','2','{1} 님이 {1번 시작글}에 댓글을 작성했습니다.',97,1),('2','1','2','{1} 님이 {성수동 백엔드 스터디 구함}에 댓글을 작성했습니다.',98,1),('2','1','1','성수동 백엔드 스터디 구함에 메시지 도착',99,1),('2','1','3','admin 님이 성수동 백엔드 스터디 구함에 지원 하셨습니다.',100,1),('1','admin','3','1 님이 safs에 지원 하셨습니다.',101,1),('2','1','3','admin 님이 fsdfsdf에 지원 하셨습니다.',102,1),('2','1','2','{1} 님이 {성수동 백엔드 스터디 구함}에 댓글을 작성했습니다.',103,1),('2','1','2','{1} 님이 {성수동 백엔드 스터디 구함}에 댓글을 작성했습니다.',104,1),('1','admin','3','성수동 백엔드 스터디 구함 제안에 수락 되셨습니다.',105,1),('1','admin','3','fsdfsdf제안에 거절 되셨습니다.',106,1),('1','admin','3','2 님이 safs에 지원 하셨습니다.',107,1),('2','1','3','2 님이 chatting room activate에 지원 하셨습니다.',108,1),('2','1','3','2 님이 activate new chatting에 지원 하셨습니다.',109,1),('2','2','3','activate new chatting 제안에 수락 되셨습니다.',110,1),('2','2','3','chatting room activate제안에 거절 되셨습니다.',111,1),('2','1','1','activate new chatting에 메시지 도착',112,1),('2','2','1','activate new chatting에 메시지 도착',113,1),('2','1','1','activate new chatting에 메시지 도착',114,1),('2','2','1','activate new chatting에 메시지 도착',115,1),('1','3','2','{3} 님이 {123}에 댓글을 작성했습니다.',116,1),('1','3','2','{3} 님이 {123}에 댓글을 작성했습니다.',117,1),('2','1','2','{1} 님이 {성수동 백엔드 스터디 구함}에 댓글을 작성했습니다.',118,1),('2','1','2','{1} 님이 {성수동 백엔드 스터디 구함}에 댓글을 작성했습니다.',119,1),('2','1','2','{1} 님이 {성수동 백엔드 스터디 구함}에 댓글을 작성했습니다.',120,1),('2','1','2','{1} 님이 {성수동 백엔드 스터디 구함}에 댓글을 작성했습니다.',121,1),('2','1','2','{1} 님이 {성수동 백엔드 스터디 구함}에 댓글을 작성했습니다.',122,1),('2','1','1','제목과 글의 길이가 매우 길어지는 경우는 어떻게 표시되는지 확인을 해 보기 위함입니다.에 메시지 도착',123,1),('2','1','3','2 님이 팀페이지 공동 작성용 테스트에 지원 하셨습니다.',124,1),('2','2','3','팀페이지 공동 작성용 테스트 제안에 수락 되셨습니다.',125,1),('2','1','1','팀페이지 공동 작성용 테스트에 메시지 도착',126,1),('2','2','1','팀페이지 공동 작성용 테스트에 메시지 도착',127,1),('2','1','2','{a} 님이 {성수동 백엔드 스터디 구함}에 댓글을 작성했습니다.',128,1),('2','1','2','{a} 님이 {성수동 백엔드 스터디 구함}에 댓글을 작성했습니다.',129,1),('2','1','2','{a} 님이 {성수동 백엔드 스터디 구함}에 댓글을 작성했습니다.',130,1),('1','admin','3','a 님이 safs에 지원 하셨습니다.',131,1),('1','admin','2','{a} 님이 {safs}에 댓글을 작성했습니다.',132,1),('2','1','3','2 님이 새로운 방으로 teampage 테스트에 지원 하셨습니다.',133,1),('2','2','3','새로운 방으로 teampage 테스트 제안에 수락 되셨습니다.',134,1),('2','a','2','{a} 님이 {Webserv 팀원 구합니다}에 댓글을 작성했습니다.',135,1),('2','a','3','1 님이 Webserv 팀원 구합니다에 지원 하셨습니다.',136,1),('2','a','1','Webserv 팀원 구합니다에 메시지 도착',137,1),('1','3','3','jihwjeon 님이 11에 지원 하셨습니다.',138,1),('1','a','3','jihwjeon 님이 Webserv 팀원 구합니다에 지원 하셨습니다.',139,1),('1','a','2','{jihwjeon} 님이 {Webserv 팀원 구합니다}에 댓글을 작성했습니다.',140,1),('2','1','1','새로운 방으로 teampage 테스트에 메시지 도착',141,1),('2','2','1','새로운 방으로 teampage 테스트에 메시지 도착',142,1),('2','1','1','새로운 방으로 teampage 테스트에 메시지 도착',143,1),('2','2','1','새로운 방으로 teampage 테스트에 메시지 도착',144,1),('1','admin','1','성수동 백엔드 스터디 구함123에 메시지 도착',145,1),('1','admin','1','성수동 백엔드 스터디 구함123에 메시지 도착',146,1),('1','admin','1','성수동 백엔드 스터디 구함123에 메시지 도착',147,1),('1','admin','1','성수동 백엔드 스터디 구함123에 메시지 도착',148,1),('1','admin','1','성수동 백엔드 스터디 구함123에 메시지 도착',149,1),('2','1','1','팀페이지 공동 작성용 테스트에 메시지 도착',150,1),('2','2','1','팀페이지 공동 작성용 테스트에 메시지 도착',151,1),('2','1','1','팀페이지 공동 작성용 테스트에 메시지 도착',152,1),('2','2','1','팀페이지 공동 작성용 테스트에 메시지 도착',153,1),('2','1','1','팀페이지 공동 작성용 테스트에 메시지 도착',154,1),('2','2','1','팀페이지 공동 작성용 테스트에 메시지 도착',155,1),('2','1','1','팀페이지 공동 작성용 테스트에 메시지 도착',156,1),('2','2','1','팀페이지 공동 작성용 테스트에 메시지 도착',157,1),('2','1','1','팀페이지 공동 작성용 테스트에 메시지 도착',158,1),('2','2','1','팀페이지 공동 작성용 테스트에 메시지 도착',159,1),('2','1','2','{1} 님이 {성수동 백엔드 스터디 구함123}에 댓글을 작성했습니다.',160,1),('1','1','3','2 님이 새로운 글 작성하고 채팅 방 생성하고 지워보기 , 에 지원 하셨습니다.',161,1),('1','2','3','새로운 글 작성하고 채팅 방 생성하고 지워보기 ,  제안에 수락 되셨습니다.',162,1),('1','1','1','새로운 글 작성하고 채팅 방 생성하고 지워보기 , 에 메시지 도착',163,1),('1','2','1','새로운 글 작성하고 채팅 방 생성하고 지워보기 , 에 메시지 도착',164,1),('1','1','1','새로운 글 작성하고 채팅 방 생성하고 지워보기 , 에 메시지 도착',165,1),('1','2','1','새로운 글 작성하고 채팅 방 생성하고 지워보기 , 에 메시지 도착',166,1),('1','1','1','새로운 글 작성하고 채팅 방 생성하고 지워보기 , 에 메시지 도착',167,1),('1','2','1','새로운 글 작성하고 채팅 방 생성하고 지워보기 , 에 메시지 도착',168,1),('1','1','1','새로운 글 작성하고 채팅 방 생성하고 지워보기 , 에 메시지 도착',169,1),('1','2','1','새로운 글 작성하고 채팅 방 생성하고 지워보기 , 에 메시지 도착',170,1),('1','1','1','새로운 글 작성하고 채팅 방 생성하고 지워보기 , 에 메시지 도착',171,1),('1','2','1','새로운 글 작성하고 채팅 방 생성하고 지워보기 , 에 메시지 도착',172,1),('1','1','1','새로운 글 작성하고 채팅 방 생성하고 지워보기 , 에 메시지 도착',173,1),('1','2','1','새로운 글 작성하고 채팅 방 생성하고 지워보기 , 에 메시지 도착',174,1);
/*!40000 ALTER TABLE `alarm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_msg`
--

DROP TABLE IF EXISTS `chat_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_msg` (
  `msg_id` bigint NOT NULL AUTO_INCREMENT,
  `room_id` bigint NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_msg`
--

LOCK TABLES `chat_msg` WRITE;
/*!40000 ALTER TABLE `chat_msg` DISABLE KEYS */;
INSERT INTO `chat_msg` VALUES (254,56,'1','123123','2024-03-18 03:56:16'),(255,56,'2','123123','2024-03-18 03:56:29'),(256,72,'1','두번 저장이 발생할까요 ?','2024-03-19 03:54:04'),(257,73,'2','123','2024-03-19 05:31:57'),(258,74,'a','안녕','2024-03-20 08:25:51'),(259,75,'1','asdfafsd','2024-03-20 10:02:24'),(260,75,'1','waefwaef','2024-03-20 10:02:25'),(266,73,'1','gyjgyj','2024-03-21 15:21:07'),(267,73,'1','gyjgyj','2024-03-21 15:21:09'),(268,73,'1','gyjgyj','2024-03-21 15:21:12'),(269,73,'1','gyjgyj','2024-03-21 15:21:14'),(270,73,'1','dddddddddddddddd','2024-03-21 15:21:24');
/*!40000 ALTER TABLE `chat_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_room`
--

DROP TABLE IF EXISTS `chat_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_room` (
  `room_id` bigint NOT NULL AUTO_INCREMENT,
  `room_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(50) NOT NULL COMMENT 'room master',
  `proposal_id` bigint DEFAULT NULL COMMENT 'room_id',
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_room`
--

LOCK TABLES `chat_room` WRITE;
/*!40000 ALTER TABLE `chat_room` DISABLE KEYS */;
INSERT INTO `chat_room` VALUES (1,'chatting room activate','2024-03-18 01:54:10','1',NULL),(2,'activate new chatting','2024-03-18 01:55:53','1',NULL),(3,'webserver ','2024-03-18 04:31:33','3',NULL),(4,'123','2024-03-18 04:31:58','3',NULL),(5,'pagination test1','2024-03-18 04:33:37','3',NULL),(6,'pagination test2','2024-03-18 04:33:55','3',NULL),(7,'pagination t4','2024-03-18 04:34:07','3',NULL),(8,'pagination test5','2024-03-18 04:34:21','3',NULL),(9,'pagination test6','2024-03-18 04:34:36','3',NULL),(10,'pagination test7','2024-03-18 04:34:47','3',NULL),(11,'10','2024-03-18 04:35:23','3',NULL),(12,'11','2024-03-18 04:35:42','3',NULL),(13,'12','2024-03-18 04:35:50','3',NULL),(14,'13','2024-03-18 04:35:57','3',NULL),(15,'14','2024-03-18 04:36:03','3',NULL),(16,'15','2024-03-18 04:36:09','3',NULL),(17,'last','2024-03-18 04:36:32','3',NULL),(18,'제목과 글의 길이가 매우 길어지는 경우는 어떻게 표시되는지 확인을 해 보기 위함입니다.','2024-03-18 12:07:37','1',NULL),(19,'팀페이지 공동 작성용 테스트','2024-03-19 05:30:54','1',NULL),(20,'Webserv 팀원 구합니다','2024-03-19 08:46:17','a',NULL),(21,'새로운 방으로 teampage 테스트','2024-03-20 04:11:11','1',NULL),(22,'fsdafsdfdddddddddddddddd','2024-03-21 14:52:45','1',NULL);
/*!40000 ALTER TABLE `chat_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `user_id` varchar(50) NOT NULL,
  `proposal_id` bigint NOT NULL,
  `content` varchar(1000) NOT NULL,
  `comment_id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES ('3',58,'123',38),('3',58,'123123',39),('1',50,'1',43),('a',50,'안녕하세요 백엔드는 역시 장고!',45),('a',50,'안녕하세요 백엔드는 역시 장고!',46),('a',50,'안녕하세요 백엔드는 역시 장고!',47),('a',51,'안녕하세요\r\n',48),('a',74,'팀원 구해요',49),('jihwjeon',74,'웹서브 잘 해보겠습니다 받아주십쇼',50),('1',50,'...',51);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL COMMENT 'applier',
  `proposal_id` bigint NOT NULL COMMENT 'apply what post',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (44,'admin',51),(46,'admin',50),(47,'1',53),(48,'1',55),(49,'1',56),(50,'2',56),(51,'3',57),(52,'3',58),(53,'3',59),(54,'3',60),(55,'3',61),(56,'3',62),(57,'3',63),(58,'3',64),(59,'3',65),(60,'3',66),(61,'3',67),(62,'3',68),(63,'3',69),(64,'3',70),(65,'3',71),(66,'1',72),(67,'1',73),(68,'2',73),(69,'a',74),(70,'1',75),(71,'2',75),(72,'1',76),(73,'1',54),(74,'1',78),(75,'2',78);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `user_id` varchar(100) NOT NULL,
  `proposal_id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` varchar(4000) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `axis_x` double DEFAULT '0',
  `axis_y` double DEFAULT '0',
  `apply_limit` int unsigned NOT NULL DEFAULT '0',
  `apply_count` int unsigned DEFAULT '0',
  `apply_accept_count` int unsigned DEFAULT '0',
  `chatroom_status` varchar(2) NOT NULL DEFAULT '0' COMMENT '0false 1true',
  `teampage_status` varchar(2) NOT NULL DEFAULT '0' COMMENT '0 = false 1= true \n0 = dont have a teampage,\n1 = you have a team page',
  PRIMARY KEY (`proposal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES ('1',50,'성수동 백엔드 스터디 구함123','백엔드 스터디원 구해요 수정 테스트','',0,0,3,1,1,'0','1'),('admin',51,'safs','sdfasdf','서울특별시 성동구 아차산로 91',37.545292338119694,127.054478788007,2,3,0,'0','0'),('1',52,'fsdfsdf','sdfsdfsdfsdfsd','',0,0,1,1,0,'0','0'),('1',54,'채팅방 생성 기능','채팅방 생성기능 테스트 ','',0,0,3,0,0,'1','0'),('1',55,'chatting room activate','activate chatting room','서울특별시 성동구 아차산로 103',37.54504664286469,127.05581386913299,2,1,0,'1','0'),('1',56,'activate new chatting','chatting room test','',0,0,2,1,1,'1','0'),('3',58,'123','123','서울특별시 성동구 아차산로 33',37.54724742489092,127.04846344316492,12,0,0,'1','0'),('3',59,'pagination test1','1','서울특별시 성동구 아차산로 18',37.54724155467899,127.04738727881,1,0,0,'1','0'),('3',60,'pagination test2','pagination test2','서울특별시 성동구 아차산로7길 29',37.54790309354644,127.05520945089332,3,0,0,'1','0'),('3',61,'pagination t4','pagination test4','서울특별시 성동구 성수이로 113',37.545071245293606,127.05712198998998,1,0,0,'1','0'),('3',62,'pagination test5','5','서울특별시 성동구 왕십리로 50',37.541868950334795,127.04494430340071,5,0,0,'1','0'),('3',63,'pagination test6','6','서울특별시 성동구 연무장5가길 25',37.54355107861529,127.05561360073898,2,0,0,'1','0'),('3',64,'pagination test7','7','서울특별시 성동구 왕십리로 지하 77',37.543645796605,127.04474621635802,7,0,0,'1','0'),('3',65,'10','10','서울특별시 은평구 서오릉로 156',37.612177492708476,126.91609640610294,12,0,0,'1','0'),('3',66,'11','11','서울특별시 강남구 개포로 416',37.48828601689079,127.06485241913198,11,1,0,'1','0'),('3',67,'12','12','서울특별시 성동구 아차산로7길 16',37.5465788071377,127.054819204026,12,0,0,'1','0'),('3',68,'13','13','서울특별시 성동구 아차산로 103',37.54504664286469,127.05581386913299,13,0,0,'1','0'),('3',69,'14','14','서울특별시 성동구 성수일로10길 32',37.54623345650721,127.05343840626901,14,0,0,'1','0'),('3',70,'15','15','서울특별시 성동구 아차산로 33',37.54724742489092,127.04846344316492,15,0,0,'1','0'),('3',71,'last','12','서울특별시 성동구 아차산로 91',37.545292338119694,127.054478788007,12,0,0,'1','0'),('1',72,'제목과 글의 길이가 매우 길어지는 경우는 어떻게 표시되는지 확인을 해 보기 위함입니다.','내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 내용 ','서울특별시 성동구 아차산로 18',37.54724155467899,127.04738727881,3,0,0,'1','0'),('1',73,'팀페이지 공동 작성용 테스트','팀페이지 공동 작성 페이지','',0,0,3,1,1,'1','0'),('a',74,'Webserv 팀원 구합니다','Webserv 팀원 구합니다\r\nWebserv 팀원 구합니다\r\nWebserv 팀원 구합니다\r\nWebserv 팀원 구합니다\r\nWebserv 팀원 구합니다\r\nWebserv 팀원 구합니다\r\n','',0,0,1,2,0,'1','0'),('1',75,'새로운 방으로 teampage 테스트','123123','서울특별시 성동구 아차산로7길 29',37.54790309354644,127.05520945089332,12,1,1,'1','0'),('1',76,'fsdafsdfdddddddddddddddd','dffffffffffffffffff','',0,0,3,0,0,'1','0'),('1',77,'채팅방 생성여부 테스트용 ','채팅방생성 여부 테스트용 에딧 테스트, ','',0,0,2,0,0,'0','0'),('1',78,'새로운 글 작성하고 채팅 방 생성하고 지워보기 , ','123123','',0,0,112,1,1,'0','0');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_post`
--

DROP TABLE IF EXISTS `team_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_post` (
  `teampost_id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contents` varchar(10000) DEFAULT NULL,
  `proposal_id` bigint NOT NULL,
  PRIMARY KEY (`teampost_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_post`
--

LOCK TABLES `team_post` WRITE;
/*!40000 ALTER TABLE `team_post` DISABLE KEYS */;
INSERT INTO `team_post` VALUES (86,'첫번째 테스트 제목 편집중','내용을 변환합니다 저장이 잘 될까요 ??',75),(87,'두번째 저장중,, ','내용 편집',75),(88,'제목을 지정해 주세요2222222222','2222222222222222222222222222',75),(89,'제목을 지정해 주세요','44',75),(90,'기본페이지','# 웹사이트 제목\n\n## 소개\n\n안녕하세요! 여기는 나의 웹사이트입니다.\n\n이 웹사이트에서는 다양한 프로젝트와 취미에 대해 이야기하고자 합니다.\n\n### 내 프로젝트\n\n- **프로젝트 1**: 프로젝트에 대한 간략한 설명\n- **프로젝트 2**: 또 다른 프로젝트에 대한 간략한 설명\n\n### 취미\n\n저는 여러 가지 취미를 가지고 있습니다:\n\n1. 취미 1에 대한 설명\n2. 취미 2에 대한 설명\n\n## 연락하기\n\n질문이나 더 알고 싶은 내용이 있다면 [이메일 주소](mailto:your.email@example.com)로 연락주세요.\n\n---\n\n© 2024 웹사이트 제작자. 모든 권리 보유.\n',74),(91,'제목을 지정해 주세요','',74),(92,'제목을 지정해 주세요','',74),(93,'22','22',75),(97,'3','3',75),(98,'제목을 지정해 주세요','',75),(99,'새로운 제목 셋팅','잘 변화 되고 내용도 저장이 도리까요 ?',75),(100,'','',75),(101,'제목 크기와  관계 없이 동작이 수행 되어야 하ㅓㅂ니다.','제목의 크기에 따라 box가 변하는것을 막아야 합니다.\nhangule hal su ga uip da',75),(105,'기본페이지','# 웹사이트 제목\n\n## 소개\n\n안녕하세요! 여기는 나의 웹사이트입니다.\n\n이 웹사이트에서는 다양한 프로젝트와 취미에 대해 이야기하고자 합니다.\n\n### 내 프로젝트\n\n- **프로젝트 1**: 프로젝트에 대한 간략한 설명\n- **프로젝트 2**: 또 다른 프로젝트에 대한 간략한 설명\n\n### 취미\n\n저는 여러 가지 취미를 가지고 있습니다:\n\n1. 취미 1에 대한 설명\n2. 취미 2에 대한 설명 \n\n## 연락하기\n\n질문이나 더 알고 싶은 내용이 있다면 [이메일 주소](mailto:your.email@example.com)로 연락주세요.\n\n---\n\n© 2024 웹사이트 제작자. 모든 권리 보유.\n',73),(106,'제목을 지정해 주세요fsdffds','fgsdfsd',73),(107,'제목을 지정해 주세요','',73),(108,'fdsfsd','sdfsdfsdfs',73),(109,'제목을 지정해 주세요','',73),(111,'기본페이지','# 웹사이트 제목\n\n## 소개\n\n안녕하세요! 여기는 나의 웹사이트입니다.\n\n이 웹사이트에서는 다양한 프로젝트와 취미에 대해 이야기하고자 합니다.\n\n### 내 프로젝트\n\n- **프로젝트 1**: 프로젝트에 대한 간략한 설명\n- **프로젝트 2**: 또 다른 프로젝트에 대한 간략한 설명\n\n### 취미\n\n저는 여러 가지 취미를 가지고 있습니다:\n\n1. 취미 1에 대한 설명\n2. 취미 2에 대한 설명\n\n## 연락하기\n\n질문이나 더 알고 싶은 내용이 있다면 [이메일 주소](mailto:your.email@example.com)로 연락주세요.\n\n---\n\n© 2024 웹사이트 제작자. 모든 권리 보유.\n',78),(115,'기본페이지','# 웹사이트 제목\n\n## 소개\n\n안녕하세요! 여기는 나의 웹사이트입니다.\n\n이 웹사이트에서는 다양한 프로젝트와 취미에 대해 이야기하고자 합니다.\n\n### 내 프로젝트\n\n- **프로젝트 1**: 프로젝트에 대한 간략한 설명\n- **프로젝트 2**: 또 다른 프로젝트에 대한 간략한 설명\n\n### 취미\n\n저는 여러 가지 취미를 가지고 있습니다:\n\n1. 취미 1에 대한 설명\n2. 취미 2에 대한 설명\n\n## 연락하기\n\n질문이나 더 알고 싶은 내용이 있다면 [이메일 주소](mailto:your.email@example.com)로 연락주세요.\n\n---\n\n© 2024 웹사이트 제작자. 모든 권리 보유.\n',50);
/*!40000 ALTER TABLE `team_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(11) NOT NULL,
  `reg_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role_id` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','1','1','1','1@1','1','2024-03-14 11:15:44','0'),('2','2','2','2','2@2','2','2024-03-14 11:16:50','0'),('3','3','3','3','3@3','3','2024-03-18 04:28:18','0'),('a','a','a','a','a@a.com','a','2024-03-19 08:18:42','0'),('admin','최희원','admin@123','admin','cgd03188@gmail.com','01033339999','2024-03-17 07:20:00','0'),('jihwjeon','jihwjeon','1234','jihwjeon','jihwjeon@student.42seoul.kr','','2024-03-20 08:26:53','0');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_applicants`
--

DROP TABLE IF EXISTS `user_applicants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_applicants` (
  `userApplicants_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `proposal_id` bigint NOT NULL,
  `status` varchar(3) DEFAULT '0' COMMENT '0: hold,  1 : accpet,  2:reject',
  PRIMARY KEY (`userApplicants_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_applicants`
--

LOCK TABLES `user_applicants` WRITE;
/*!40000 ALTER TABLE `user_applicants` DISABLE KEYS */;
INSERT INTO `user_applicants` VALUES (20,'admin',50,'1'),(22,'admin',52,'2'),(23,'2',51,'0'),(24,'2',55,'2'),(25,'2',56,'1'),(26,'2',73,'1'),(28,'2',75,'1'),(29,'1',74,'0'),(30,'jihwjeon',66,'0'),(31,'jihwjeon',74,'0'),(32,'2',78,'1');
/*!40000 ALTER TABLE `user_applicants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'co_workerDB'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-22  0:56:05

ALTER TABLE Test.alarm ADD reg_time DATETIME NULL;
ALTER TABLE Test.post ADD reg_time DATETIME NULL;
ALTER TABLE Test.comment ADD reg_time DATETIME NULL;
