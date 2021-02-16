-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 15, 2021 at 07:56 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akshayvn_dbms_mini_project`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `BabyCare`
-- (See below for the actual view)
--
CREATE TABLE `BabyCare` (
`id` int(11)
,`categoryId` int(11)
,`brandId` int(11)
,`name` varchar(50)
,`mrp` float
,`sale_rate` float
,`stock` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `Brands`
--

CREATE TABLE `Brands` (
  `id` int(11) NOT NULL,
  `brand` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Brands`
--

INSERT INTO `Brands` (`id`, `brand`) VALUES
(13, 'Aashirvaad'),
(22, 'Anjali'),
(10, 'Britania'),
(7, 'Cadbury'),
(20, 'cake mould'),
(12, 'Coke'),
(23, 'DP'),
(8, 'Everest'),
(4, 'Fruits'),
(16, 'Hawkins'),
(15, 'Himalaya'),
(2, 'ITC'),
(24, 'IVEO'),
(14, 'Jhonson'),
(26, 'loapala'),
(1, 'Nestle'),
(3, 'newb'),
(11, 'Parle'),
(17, 'prestige'),
(21, 'RITU'),
(18, 'seven seas'),
(6, 'Taj');

-- --------------------------------------------------------

--
-- Table structure for table `Cart`
--

CREATE TABLE `Cart` (
  `customerId` int(11) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Cart`
--

INSERT INTO `Cart` (`customerId`, `itemId`, `quantity`) VALUES
(NULL, 1, 1),
(NULL, 5, 2),
(NULL, 5, 2),
(NULL, 1, 1),
(10, 1, 1),
(10, 6, 4),
(NULL, 5, 2),
(NULL, 5, 2),
(NULL, 1, 1),
(NULL, 1, 1),
(NULL, 5, 2),
(6, 21, 2),
(6, 5, 2),
(6, 6, 4),
(6, 7, 4),
(6, 8, 2),
(6, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `id` int(11) NOT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`id`, `category`) VALUES
(4, 'Baby Care'),
(2, 'Food'),
(1, 'Utensils');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Food`
-- (See below for the actual view)
--
CREATE TABLE `Food` (
`id` int(11)
,`categoryId` int(11)
,`brandId` int(11)
,`name` varchar(50)
,`mrp` float
,`sale_rate` float
,`stock` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `Items`
--

CREATE TABLE `Items` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `brandId` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `mrp` float DEFAULT NULL,
  `sale_rate` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Items`
--

INSERT INTO `Items` (`id`, `categoryId`, `brandId`, `name`, `mrp`, `sale_rate`, `stock`) VALUES
(1, 2, 2, 'MAGGI Special Masala Noodles', 20, 15, NULL),
(5, 2, 4, 'Apples (12)', 150, 120, NULL),
(6, 2, 4, 'Bananas (12)', 60, 50, NULL),
(7, 2, 4, 'WaterMelon', 80, 65, NULL),
(8, 2, 4, 'Brinjal', 50, 40, NULL),
(9, 2, 4, 'Cucumber', 60, 60, NULL),
(10, 2, 4, 'Tomato', 35, 25, NULL),
(11, 2, 6, 'Taj Mahal Tea', 130, 125, NULL),
(12, 2, 7, 'Oreo', 30, 30, NULL),
(13, 2, 8, 'Garam masala', 44, 40, NULL),
(14, 2, 8, 'Thikalal Red Chilli powder', 200, 185, NULL),
(15, 2, 10, 'Marie Gold', 30, 25, NULL),
(16, 2, 4, 'Onions', 40, 35, NULL),
(17, 2, 11, 'Parle-G', 20, 20, NULL),
(18, 2, 7, 'DairyMilk Silk', 80, 80, NULL),
(19, 2, 12, 'coco cola', 20, 20, NULL),
(20, 2, 13, 'Atta', 60, 60, NULL),
(21, 4, 14, 'Baby Cream', 60, 60, NULL),
(22, 4, 15, 'Baby Lotion', 200, 180, NULL),
(23, 1, 16, 'stainless steel pressure cooker', 3275, 2899, NULL),
(24, 1, 17, 'aluminium lid pressure cooker', 1145, 849, NULL),
(25, 1, 18, 'ice cube tray', 226, 169, NULL),
(26, 1, 18, 'chocolate mould-bow design', 207, 199, NULL),
(27, 1, 20, 'muffin mould', 246, 199, NULL),
(28, 1, 21, 'cutlery set stainless steel', 790, 549, NULL),
(29, 1, 22, 'baby soup spoon', 205, 144, NULL),
(30, 1, 23, 'serving spoon', 149, 149, NULL),
(31, 1, 24, 'melamine nodle bowl', 164, 109, NULL),
(32, 1, 26, 'mug set', 525, 469, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `OrderDetails`
--

CREATE TABLE `OrderDetails` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `OrderDetails`
--

INSERT INTO `OrderDetails` (`id`, `orderId`, `itemId`, `quantity`) VALUES
(1, 4, 1, 6),
(2, 4, 9, 1),
(3, 6, 1, 7),
(4, 6, 6, 2),
(5, 6, 10, 1),
(6, 11, 5, 3),
(7, 11, 6, 3),
(8, 12, 5, 3),
(9, 12, 6, 3),
(10, 14, 5, 3),
(11, 14, 6, 3),
(12, 15, 1, 1),
(13, 16, 6, 1),
(14, 16, 1, 1),
(15, 16, 10, 1),
(16, 16, 5, 1),
(17, 16, 15, 1),
(18, 16, 23, 1),
(19, 17, 1, 1),
(20, 17, 13, 1),
(21, 17, 11, 1),
(22, 19, 6, 6),
(23, 19, 1, 1),
(24, 19, 7, 4),
(25, 19, 5, 1),
(26, 19, 19, 1),
(27, 19, 16, 1),
(28, 19, 9, 1),
(29, 19, 13, 1),
(30, 19, 14, 1),
(31, 19, 17, 1),
(32, 19, 28, 1),
(33, 20, 5, 1),
(34, 21, 6, 6),
(35, 21, 1, 1),
(36, 21, 7, 4),
(37, 21, 5, 1),
(38, 21, 19, 1),
(39, 21, 16, 1),
(40, 21, 9, 1),
(41, 21, 13, 1),
(42, 21, 14, 1),
(43, 21, 17, 1),
(44, 21, 28, 1),
(45, 22, 6, 4),
(46, 23, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `id` int(11) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `orderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `amount` float DEFAULT NULL,
  `status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`id`, `customerId`, `orderDate`, `amount`, `status`) VALUES
(1, 6, '2021-01-15 17:38:41', NULL, 0),
(2, 6, '2021-01-15 17:38:59', NULL, 0),
(3, 6, '2021-01-15 19:12:51', 150, 0),
(4, 6, '2021-01-15 19:14:03', 150, 0),
(5, 10, '2021-01-15 19:27:33', 130, 0),
(6, 8, '2021-01-15 20:17:39', 230, 0),
(7, 8, '2021-01-15 20:20:14', 230, 0),
(8, 8, '2021-01-15 20:20:48', 230, 0),
(9, 8, '2021-01-15 20:21:00', 230, 0),
(10, 8, '2021-01-15 20:21:34', 230, 0),
(11, 6, '2021-01-15 21:38:17', 510, 0),
(12, 6, '2021-01-15 23:18:09', 510, 0),
(13, 6, '2021-01-15 23:19:46', 510, 0),
(14, 6, '2021-01-15 23:34:51', 510, 0),
(15, 12, '2021-01-31 07:52:17', 15, 0),
(16, 8, '2021-02-13 14:04:22', 3134, 0),
(17, 8, '2021-02-13 14:37:58', 180, 0),
(18, 8, '2021-02-13 14:39:15', 180, 0),
(19, 13, '2021-02-15 18:00:57', 1604, 0),
(20, 13, '2021-02-15 18:25:26', 120, 0),
(21, 13, '2021-02-15 18:30:06', 1604, 0),
(22, 13, '2021-02-15 18:37:43', 200, 0),
(23, 13, '2021-02-15 18:56:48', 15, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `name`, `email`, `password`, `phone`, `address`) VALUES
(3, 'name', 'email', 'password', '', ''),
(4, 'a', 'as', 'asdfa', '', ''),
(6, 'Akshay V Nayak', 'vakshaynayak@gmail.co', 'pbkdf2:sha256:150000$wtQe4MQy$fe02f5b6644758085fa85b12a5ec876dd2e33d9daa44a7c72a4e4a6478702576', '', ''),
(7, 'Akshay V Nayak', 'vakshaynayak@gmail.com', 'pbkdf2:sha256:150000$QMoQl6O7$9d753d999289eecd05b6b55d48c8460811939eb910dcbb98a75c4636aadfe435', '08549071271', 'sdasdfa df sadf sa '),
(8, 'Sai Krishna', '1911saikrishna@gmail.com', 'pbkdf2:sha256:150000$Y4QEXN8F$16d1696e4d14a793344d035de8f684495e2aad9c11a142af5d4d8566d25e42ee', NULL, ''),
(9, 'Srinivas', 'sritumu@gmail.com', 'pbkdf2:sha256:150000$orX7kY7h$de449e91250e507a36c80c2abb95f61cbd193489d25a586f7df6a0cb9a9c3f53', NULL, ''),
(10, 'Arun V', 'venkateshmhanur@gmail.com', 'pbkdf2:sha256:150000$7bJ5XXpa$5a3304667e5e275fdfdd5639a8b1145c593bd7946d1ebb7c0eb30dffce231457', NULL, ''),
(11, 'Akshay Ganger', 'akshaygangernie211@gmail.com', 'pbkdf2:sha256:150000$DLN42GIC$75ff945b936def57fb560b0cbf4b46cf7cfe72135b63119777a966fa6a1bd9f5', NULL, ''),
(12, 'Akshay V Nayak', 'aksh@c', 'pbkdf2:sha256:150000$CFP6GbyZ$bb3ccb1f5fb510ebbb5b5622979e4dac6e6db397df0f27d27f4a271bf307b766', NULL, ''),
(13, 'Ranga Hodhnath', 'Rangahoddenne@gmail.com', 'pbkdf2:sha256:150000$aUoIvRIs$041ac44f11a05c2deab50ba6eb31ec6172fa1cb387ab819940e34a1adc08226b', NULL, '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Utensils`
-- (See below for the actual view)
--
CREATE TABLE `Utensils` (
`id` int(11)
,`categoryId` int(11)
,`brandId` int(11)
,`name` varchar(50)
,`mrp` float
,`sale_rate` float
,`stock` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `BabyCare`
--
DROP TABLE IF EXISTS `BabyCare`;

CREATE ALGORITHM=UNDEFINED DEFINER=`akshayvn_avnayak`@`%` SQL SECURITY DEFINER VIEW `BabyCare`  AS  select `Items`.`id` AS `id`,`Items`.`categoryId` AS `categoryId`,`Items`.`brandId` AS `brandId`,`Items`.`name` AS `name`,`Items`.`mrp` AS `mrp`,`Items`.`sale_rate` AS `sale_rate`,`Items`.`stock` AS `stock` from `Items` where (`Items`.`categoryId` = (select `Categories`.`id` from `Categories` where (`Categories`.`category` = 'Baby Care'))) ;

-- --------------------------------------------------------

--
-- Structure for view `Food`
--
DROP TABLE IF EXISTS `Food`;

CREATE ALGORITHM=UNDEFINED DEFINER=`akshayvn_avnayak`@`%` SQL SECURITY DEFINER VIEW `Food`  AS  select `Items`.`id` AS `id`,`Items`.`categoryId` AS `categoryId`,`Items`.`brandId` AS `brandId`,`Items`.`name` AS `name`,`Items`.`mrp` AS `mrp`,`Items`.`sale_rate` AS `sale_rate`,`Items`.`stock` AS `stock` from `Items` where (`Items`.`categoryId` = (select `Categories`.`id` from `Categories` where (`Categories`.`category` = 'Food'))) ;

-- --------------------------------------------------------

--
-- Structure for view `Utensils`
--
DROP TABLE IF EXISTS `Utensils`;

CREATE ALGORITHM=UNDEFINED DEFINER=`akshayvn_avnayak`@`%` SQL SECURITY DEFINER VIEW `Utensils`  AS  select `Items`.`id` AS `id`,`Items`.`categoryId` AS `categoryId`,`Items`.`brandId` AS `brandId`,`Items`.`name` AS `name`,`Items`.`mrp` AS `mrp`,`Items`.`sale_rate` AS `sale_rate`,`Items`.`stock` AS `stock` from `Items` where (`Items`.`categoryId` = (select `Categories`.`id` from `Categories` where (`Categories`.`category` = 'Utensils'))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Brands`
--
ALTER TABLE `Brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brand` (`brand`);

--
-- Indexes for table `Cart`
--
ALTER TABLE `Cart`
  ADD KEY `itemId` (`itemId`),
  ADD KEY `customerId` (`customerId`);

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category` (`category`);

--
-- Indexes for table `Items`
--
ALTER TABLE `Items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `brandId` (`brandId`);

--
-- Indexes for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderId` (`orderId`),
  ADD KEY `itemId` (`itemId`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerId` (`customerId`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Brands`
--
ALTER TABLE `Brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Items`
--
ALTER TABLE `Items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Cart`
--
ALTER TABLE `Cart`
  ADD CONSTRAINT `Cart_ibfk_1` FOREIGN KEY (`itemId`) REFERENCES `Items` (`id`),
  ADD CONSTRAINT `Cart_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `Users` (`id`);

--
-- Constraints for table `Items`
--
ALTER TABLE `Items`
  ADD CONSTRAINT `Items_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `Categories` (`id`),
  ADD CONSTRAINT `Items_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `Brands` (`id`);

--
-- Constraints for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  ADD CONSTRAINT `OrderDetails_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `Orders` (`id`),
  ADD CONSTRAINT `OrderDetails_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `Items` (`id`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `Users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
