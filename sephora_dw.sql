-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 11, 2025 at 06:55 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sephora_dw`
--

-- --------------------------------------------------------

--
-- Table structure for table `dim_brand`
--

CREATE TABLE `dim_brand` (
  `brand_id` int NOT NULL,
  `brand_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dim_brand`
--

INSERT INTO `dim_brand` (`brand_id`, `brand_name`) VALUES
(1, 'Acqua Di Parma'),
(2, 'Dior'),
(3, 'Fenty Beauty');

-- --------------------------------------------------------

--
-- Table structure for table `dim_category`
--

CREATE TABLE `dim_category` (
  `category_id` int NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dim_category`
--

INSERT INTO `dim_category` (`category_id`, `category_name`) VALUES
(1, 'Perfume'),
(2, 'Makeup'),
(3, 'Skincare');

-- --------------------------------------------------------

--
-- Table structure for table `dim_marketing`
--

CREATE TABLE `dim_marketing` (
  `marketing_id` int NOT NULL,
  `online_only` tinyint(1) DEFAULT NULL,
  `exclusive` tinyint(1) DEFAULT NULL,
  `limited_edition` tinyint(1) DEFAULT NULL,
  `limited_time_offer` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dim_marketing`
--

INSERT INTO `dim_marketing` (`marketing_id`, `online_only`, `exclusive`, `limited_edition`, `limited_time_offer`) VALUES
(1, 1, 0, 0, 0),
(2, 0, 1, 0, 0),
(3, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dim_product`
--

CREATE TABLE `dim_product` (
  `product_id` int NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `ingredients` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dim_time`
--

CREATE TABLE `dim_time` (
  `time_id` int NOT NULL,
  `date_value` date DEFAULT NULL,
  `month` int DEFAULT NULL,
  `year` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fact_product_performance`
--

CREATE TABLE `fact_product_performance` (
  `fact_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `marketing_id` int DEFAULT NULL,
  `time_id` int DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `number_of_reviews` int DEFAULT NULL,
  `love` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `sale_price` float DEFAULT NULL,
  `value_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dim_brand`
--
ALTER TABLE `dim_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `dim_category`
--
ALTER TABLE `dim_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `dim_marketing`
--
ALTER TABLE `dim_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Indexes for table `dim_product`
--
ALTER TABLE `dim_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `dim_time`
--
ALTER TABLE `dim_time`
  ADD PRIMARY KEY (`time_id`);

--
-- Indexes for table `fact_product_performance`
--
ALTER TABLE `fact_product_performance`
  ADD PRIMARY KEY (`fact_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `marketing_id` (`marketing_id`),
  ADD KEY `time_id` (`time_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dim_brand`
--
ALTER TABLE `dim_brand`
  MODIFY `brand_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dim_category`
--
ALTER TABLE `dim_category`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dim_marketing`
--
ALTER TABLE `dim_marketing`
  MODIFY `marketing_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dim_time`
--
ALTER TABLE `dim_time`
  MODIFY `time_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fact_product_performance`
--
ALTER TABLE `fact_product_performance`
  MODIFY `fact_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fact_product_performance`
--
ALTER TABLE `fact_product_performance`
  ADD CONSTRAINT `fact_product_performance_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `dim_product` (`product_id`),
  ADD CONSTRAINT `fact_product_performance_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `dim_brand` (`brand_id`),
  ADD CONSTRAINT `fact_product_performance_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `dim_category` (`category_id`),
  ADD CONSTRAINT `fact_product_performance_ibfk_4` FOREIGN KEY (`marketing_id`) REFERENCES `dim_marketing` (`marketing_id`),
  ADD CONSTRAINT `fact_product_performance_ibfk_5` FOREIGN KEY (`time_id`) REFERENCES `dim_time` (`time_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
