-- MySQL dump 10.13  Distrib 8.0.39-30, for Linux (x86_64)
--
-- Host: localhost    Database: sbt
-- ------------------------------------------------------
-- Server version	8.0.39-30

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
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `customer1`
--

DROP TABLE IF EXISTS `customer1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer1` (
  `c_id` int NOT NULL,
  `c_d_id` tinyint NOT NULL,
  `c_w_id` smallint NOT NULL,
  `c_first` varchar(16) DEFAULT NULL,
  `c_middle` char(2) DEFAULT NULL,
  `c_last` varchar(16) DEFAULT NULL,
  `c_street_1` varchar(20) DEFAULT NULL,
  `c_street_2` varchar(20) DEFAULT NULL,
  `c_city` varchar(20) DEFAULT NULL,
  `c_state` char(2) DEFAULT NULL,
  `c_zip` char(9) DEFAULT NULL,
  `c_phone` char(16) DEFAULT NULL,
  `c_since` datetime DEFAULT NULL,
  `c_credit` char(2) DEFAULT NULL,
  `c_credit_lim` bigint DEFAULT NULL,
  `c_discount` decimal(4,2) DEFAULT NULL,
  `c_balance` decimal(12,2) DEFAULT NULL,
  `c_ytd_payment` decimal(12,2) DEFAULT NULL,
  `c_payment_cnt` smallint DEFAULT NULL,
  `c_delivery_cnt` smallint DEFAULT NULL,
  `c_data` text,
  PRIMARY KEY (`c_w_id`,`c_d_id`,`c_id`),
  KEY `idx_customer1` (`c_w_id`,`c_d_id`,`c_last`,`c_first`),
  CONSTRAINT `fkey_customer_1_1` FOREIGN KEY (`c_w_id`, `c_d_id`) REFERENCES `district1` (`d_w_id`, `d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `district1`
--

DROP TABLE IF EXISTS `district1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district1` (
  `d_id` tinyint NOT NULL,
  `d_w_id` smallint NOT NULL,
  `d_name` varchar(10) DEFAULT NULL,
  `d_street_1` varchar(20) DEFAULT NULL,
  `d_street_2` varchar(20) DEFAULT NULL,
  `d_city` varchar(20) DEFAULT NULL,
  `d_state` char(2) DEFAULT NULL,
  `d_zip` char(9) DEFAULT NULL,
  `d_tax` decimal(4,2) DEFAULT NULL,
  `d_ytd` decimal(12,2) DEFAULT NULL,
  `d_next_o_id` int DEFAULT NULL,
  PRIMARY KEY (`d_w_id`,`d_id`),
  CONSTRAINT `fkey_district_1_1` FOREIGN KEY (`d_w_id`) REFERENCES `warehouse1` (`w_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `history1`
--

DROP TABLE IF EXISTS `history1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history1` (
  `h_c_id` int DEFAULT NULL,
  `h_c_d_id` tinyint DEFAULT NULL,
  `h_c_w_id` smallint DEFAULT NULL,
  `h_d_id` tinyint DEFAULT NULL,
  `h_w_id` smallint DEFAULT NULL,
  `h_date` datetime DEFAULT NULL,
  `h_amount` decimal(6,2) DEFAULT NULL,
  `h_data` varchar(24) DEFAULT NULL,
  KEY `fkey_history_11` (`h_c_w_id`,`h_c_d_id`,`h_c_id`),
  KEY `fkey_history_21` (`h_w_id`,`h_d_id`),
  CONSTRAINT `fkey_history_1_1` FOREIGN KEY (`h_c_w_id`, `h_c_d_id`, `h_c_id`) REFERENCES `customer1` (`c_w_id`, `c_d_id`, `c_id`),
  CONSTRAINT `fkey_history_2_1` FOREIGN KEY (`h_w_id`, `h_d_id`) REFERENCES `district1` (`d_w_id`, `d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item1`
--

DROP TABLE IF EXISTS `item1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item1` (
  `i_id` int NOT NULL,
  `i_im_id` int DEFAULT NULL,
  `i_name` varchar(24) DEFAULT NULL,
  `i_price` decimal(5,2) DEFAULT NULL,
  `i_data` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `new_orders1`
--

DROP TABLE IF EXISTS `new_orders1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_orders1` (
  `no_o_id` int NOT NULL,
  `no_d_id` tinyint NOT NULL,
  `no_w_id` smallint NOT NULL,
  PRIMARY KEY (`no_w_id`,`no_d_id`,`no_o_id`),
  CONSTRAINT `fkey_new_orders_1_1` FOREIGN KEY (`no_w_id`, `no_d_id`, `no_o_id`) REFERENCES `orders1` (`o_w_id`, `o_d_id`, `o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_line1`
--

DROP TABLE IF EXISTS `order_line1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_line1` (
  `ol_o_id` int NOT NULL,
  `ol_d_id` tinyint NOT NULL,
  `ol_w_id` smallint NOT NULL,
  `ol_number` tinyint NOT NULL,
  `ol_i_id` int DEFAULT NULL,
  `ol_supply_w_id` smallint DEFAULT NULL,
  `ol_delivery_d` datetime DEFAULT NULL,
  `ol_quantity` tinyint DEFAULT NULL,
  `ol_amount` decimal(6,2) DEFAULT NULL,
  `ol_dist_info` char(24) DEFAULT NULL,
  PRIMARY KEY (`ol_w_id`,`ol_d_id`,`ol_o_id`,`ol_number`),
  KEY `fkey_order_line_21` (`ol_supply_w_id`,`ol_i_id`),
  CONSTRAINT `fkey_order_line_1_1` FOREIGN KEY (`ol_w_id`, `ol_d_id`, `ol_o_id`) REFERENCES `orders1` (`o_w_id`, `o_d_id`, `o_id`),
  CONSTRAINT `fkey_order_line_2_1` FOREIGN KEY (`ol_supply_w_id`, `ol_i_id`) REFERENCES `stock1` (`s_w_id`, `s_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders1`
--

DROP TABLE IF EXISTS `orders1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders1` (
  `o_id` int NOT NULL,
  `o_d_id` tinyint NOT NULL,
  `o_w_id` smallint NOT NULL,
  `o_c_id` int DEFAULT NULL,
  `o_entry_d` datetime DEFAULT NULL,
  `o_carrier_id` tinyint DEFAULT NULL,
  `o_ol_cnt` tinyint DEFAULT NULL,
  `o_all_local` tinyint DEFAULT NULL,
  PRIMARY KEY (`o_w_id`,`o_d_id`,`o_id`),
  KEY `idx_orders1` (`o_w_id`,`o_d_id`,`o_c_id`,`o_id`),
  CONSTRAINT `fkey_orders_1_1` FOREIGN KEY (`o_w_id`, `o_d_id`, `o_c_id`) REFERENCES `customer1` (`c_w_id`, `c_d_id`, `c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock1`
--

DROP TABLE IF EXISTS `stock1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock1` (
  `s_i_id` int NOT NULL,
  `s_w_id` smallint NOT NULL,
  `s_quantity` smallint DEFAULT NULL,
  `s_dist_01` char(24) DEFAULT NULL,
  `s_dist_02` char(24) DEFAULT NULL,
  `s_dist_03` char(24) DEFAULT NULL,
  `s_dist_04` char(24) DEFAULT NULL,
  `s_dist_05` char(24) DEFAULT NULL,
  `s_dist_06` char(24) DEFAULT NULL,
  `s_dist_07` char(24) DEFAULT NULL,
  `s_dist_08` char(24) DEFAULT NULL,
  `s_dist_09` char(24) DEFAULT NULL,
  `s_dist_10` char(24) DEFAULT NULL,
  `s_ytd` decimal(8,0) DEFAULT NULL,
  `s_order_cnt` smallint DEFAULT NULL,
  `s_remote_cnt` smallint DEFAULT NULL,
  `s_data` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`s_w_id`,`s_i_id`),
  KEY `fkey_stock_21` (`s_i_id`),
  CONSTRAINT `fkey_stock_1_1` FOREIGN KEY (`s_w_id`) REFERENCES `warehouse1` (`w_id`),
  CONSTRAINT `fkey_stock_2_1` FOREIGN KEY (`s_i_id`) REFERENCES `item1` (`i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `warehouse1`
--

DROP TABLE IF EXISTS `warehouse1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse1` (
  `w_id` smallint NOT NULL,
  `w_name` varchar(10) DEFAULT NULL,
  `w_street_1` varchar(20) DEFAULT NULL,
  `w_street_2` varchar(20) DEFAULT NULL,
  `w_city` varchar(20) DEFAULT NULL,
  `w_state` char(2) DEFAULT NULL,
  `w_zip` char(9) DEFAULT NULL,
  `w_tax` decimal(4,2) DEFAULT NULL,
  `w_ytd` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`w_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-26 23:17:19
