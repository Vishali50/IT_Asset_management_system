-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 14, 2023 at 01:19 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `it_asset_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
CREATE TABLE IF NOT EXISTS `assets` (
  `assetID` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `category` varchar(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `department` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `acquiredDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`assetID`),
  UNIQUE KEY `assetID_UNIQUE` (`assetID`),
  KEY `brandID_idx` (`brand`),
  KEY `categoryID_idx` (`category`),
  KEY `departmentID_idx` (`department`),
  KEY `statusID_idx` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`assetID`, `brand`, `category`, `department`, `status`, `acquiredDate`) VALUES
(2, '1', '1', '1', '1', '2023-10-02 11:54:05'),
(12, '1', '1', '1', '1', '2023-10-04 19:08:37'),
(14, '2', '1', '1', '1', '2023-10-04 19:15:22'),
(15, '1', '1', '1', '1', '2023-10-10 14:12:11');

-- --------------------------------------------------------

--
-- Stand-in structure for view `assets_combined`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `assets_combined`;
CREATE TABLE IF NOT EXISTS `assets_combined` (
`assetID` int
,`brandName` varchar(45)
,`categoryName` varchar(45)
,`departmentName` varchar(45)
,`statusName` varchar(45)
,`acquiredDate` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `brandID` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `brandName` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`brandID`),
  UNIQUE KEY `brandID_UNIQUE` (`brandID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brandID`, `brandName`) VALUES
('1', 'lenovo'),
('2', 'Asus'),
('3', 'Dell');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `categoryID` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `categoryName` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE KEY `categoryID_UNIQUE` (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryID`, `categoryName`) VALUES
('1', 'Monitor'),
('2', 'Desktop'),
('3', 'Laptop');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `departmentID` varchar(3) COLLATE utf8mb4_general_ci NOT NULL,
  `departmentName` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE KEY `departmentID_UNIQUE` (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`departmentID`, `departmentName`) VALUES
('1', 'IT'),
('2', 'Sales'),
('3', 'Marketing'),
('4', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
CREATE TABLE IF NOT EXISTS `statuses` (
  `statusID` varchar(3) COLLATE utf8mb4_general_ci NOT NULL,
  `statusName` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`statusID`),
  UNIQUE KEY `statusID_UNIQUE` (`statusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`statusID`, `statusName`) VALUES
('1', 'Unassigned'),
('2', 'Assigned'),
('3', 'Unaccounted For');

-- --------------------------------------------------------

--
-- Structure for view `assets_combined`
--
DROP TABLE IF EXISTS `assets_combined`;

DROP VIEW IF EXISTS `assets_combined`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `assets_combined`  AS SELECT `assets`.`assetID` AS `assetID`, `brands`.`brandName` AS `brandName`, `categories`.`categoryName` AS `categoryName`, `departments`.`departmentName` AS `departmentName`, `statuses`.`statusName` AS `statusName`, `assets`.`acquiredDate` AS `acquiredDate` FROM ((((`assets` join `brands` on((`assets`.`brand` = `brands`.`brandID`))) join `categories` on((`assets`.`category` = `categories`.`categoryID`))) join `departments` on((`assets`.`department` = `departments`.`departmentID`))) join `statuses` on((`assets`.`status` = `statuses`.`statusID`)))  ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `brandID` FOREIGN KEY (`brand`) REFERENCES `brands` (`brandID`),
  ADD CONSTRAINT `categoryID` FOREIGN KEY (`category`) REFERENCES `categories` (`categoryID`),
  ADD CONSTRAINT `departmentID` FOREIGN KEY (`department`) REFERENCES `departments` (`departmentID`),
  ADD CONSTRAINT `statusID` FOREIGN KEY (`status`) REFERENCES `statuses` (`statusID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
