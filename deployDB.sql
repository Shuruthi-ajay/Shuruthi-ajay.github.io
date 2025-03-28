-- MySQL dump 10.13  Distrib 5.7.24, for osx11.1 (x86_64)
--
-- Host: localhost    Database: chef
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Dialogues`
--

DROP TABLE IF EXISTS `Dialogues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dialogues` (
  `Dialogue_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Dialogue_Text` text NOT NULL,
  `Loyalty` text,
  `Hint` text,
  `Response` text NOT NULL,
  `IsActive_D` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Dialogue_Id`),
  UNIQUE KEY `Dialogue_Id` (`Dialogue_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dialogues`
--

LOCK TABLES `Dialogues` WRITE;
/*!40000 ALTER TABLE `Dialogues` DISABLE KEYS */;
INSERT INTO `Dialogues` VALUES (1,'Set Secure browser settings','good','Enables security features to protect against online threats.','Accept',1),(2,'Follow request from a stranger.','bad','Unknown profiles can be fake or harmful.','Reject',1),(3,'Trust Forwarded Message','bad','Forwarded messages can spread misinformation and scams.','Reject',1),(4,'Shop from a trusted Website','good','Ensures security and prevents fraudulent transactions.','Accept',1),(5,'You\'ve won 50,000. Click this link to claim it!','bad','Such messages are scams. Do not click on suspicious links.','Reject',1),(6,'Keep a Strong Password','good','A strong password reduces the risk of hacking.','Accept',1),(7,'Use the Same Password','bad','Reusing passwords across accounts is a security risk.','Reject',1),(8,'Connect to Public Wifi','bad','Public Wi-Fi can be insecure and expose data to hackers.','Reject',1),(9,'Log out of the website before shutting down a public computer','good','Prevents unauthorized access to your account.','Accept',1),(10,'Turn off Location Services','good','Helps protect privacy from tracking apps and websites.','Accept',1),(11,'Install Antivirus','good','Protects against malware, viruses, and cyber threats.','Accept',1),(12,'Follow a suspicious profile','bad','Suspicious accounts may be fake or malicious.','Reject',1),(13,'Get a backup of your important documents in an external drive','good','Keeps data safe in case of system failure.','Accept',1),(14,'Chat request from a stranger','bad','Unknown contacts may have bad intentions.','Reject',1),(15,'Video call request from a stranger','bad','Accepting video calls from unknown people can be risky.','Reject',1),(16,'Get your desired job now by clicking this link!!','bad','Job scams use fake offers to steal personal information.','Reject',1),(17,'Call from bank asking for personal details','bad','Banks never ask for personal info over calls.','Reject',1),(18,'Job from a non-genuine company','bad','Verify company legitimacy before sharing your details.','Reject',1),(19,'Update browser and system','good','Keeps software secure with latest patches and fixes.','Accept',1),(20,'Use 2-factor authentication','good','Adds an extra layer of security to your accounts.','Accept',1),(21,'Install a licensed software','good','Licensed software is safe and reduces security risks.','Accept',1),(22,'Lucky Draw!! Click this link to join!!','bad','Such offers are often scams aimed at stealing your data.','Reject',1),(23,'Loan provided online with very high interest rates','bad','Unverified lenders can be fraudulent.','Reject',1),(24,'Scan this QR to verify your account','bad','QR scams trick users into revealing personal information.','Reject',1),(25,'Share personal information in social media','bad','Oversharing can lead to identity theft.','Reject',1);
/*!40000 ALTER TABLE `Dialogues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Item` (
  `Item_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Item_Name` text NOT NULL,
  `inUse` text NOT NULL,
  `Category` text NOT NULL,
  `Cost` bigint NOT NULL,
  `IsActive_I` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Item_Id`),
  UNIQUE KEY `Item_Id` (`Item_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login`
--

DROP TABLE IF EXISTS `Login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login` (
  `Serial_No` bigint NOT NULL AUTO_INCREMENT,
  `Username` text NOT NULL,
  `Name` text NOT NULL,
  `Age` int NOT NULL,
  `Score` bigint DEFAULT '0',
  `Money` bigint DEFAULT '0',
  `IsActive_L` tinyint(1) DEFAULT '1',
  `Item_Id` json DEFAULT NULL,
  `Current_Items` json DEFAULT NULL,
  PRIMARY KEY (`Serial_No`),
  UNIQUE KEY `Username` (`Username`(100)),
  CONSTRAINT `login_chk_1` CHECK ((`Age` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login`
--

LOCK TABLES `Login` WRITE;
/*!40000 ALTER TABLE `Login` DISABLE KEYS */;
/*!40000 ALTER TABLE `Login` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-18 18:50:28
