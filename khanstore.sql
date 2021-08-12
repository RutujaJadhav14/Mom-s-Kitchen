-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2021 at 05:25 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `khanstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(3, 'Rizwan', 'rizwan@gmail.com', '$2y$10$Z1DnKbJRDFUTHMI7y1vSqeU3.Y9cgDyC4AeWx4.ucH34z/mkzL2E.', '0'),
(4, 'ajay', 'ajay@gmail.com', '$2y$10$UGzx/ODNB4ZSFruRF8BN2eC/NNE.6MBhfTTYKtUo.k4ZVHZFD85DO', '0'),
(5, 'Rizwan', 'rizwankhan@gmail.com', '$2y$10$qZ0OoyX8bhAVxDFM/fx8leZSZwlyq15c1C/KTnaqDLSx6eCDJ0VpC', '0'),
(6, 'Faizan', 'faizan@gmail.com', '$2y$10$Ll2.sETLuB8sdhh1LRK4e.cQqn4CtTEudFg.exhf76D6rGzSOwWNm', '0'),
(7, 'Ajay Kumar', 'ajaykumar@gmail.com', '$2y$10$8GlkawEDsNrOQr8Vgv0GceD/MhVpHAXM4xqtMo0.SUaHFXe03MRdi', '0');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(2, 'Veg Food'),
(3, 'Non-veg Food');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(2, 1, '::1', 3, 1),
(4, 3, '::1', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(12, '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 1, 1, 1, '9L434522M7706801A', 'Completed'),
(2, 1, 2, 1, '9L434522M7706801A', 'Completed'),
(3, 1, 3, 1, '9L434522M7706801A', 'Completed'),
(4, 1, 1, 1, '8AT7125245323433N', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 12, 2, 'Aloo Paratha', 50, 50, 'Yummy', 'aloo.jpg', 'Aloo ,Paratha'),
(2, 12, 3, 'Surmai Fish', 100, 5000, 'Yummy', 'surmai.jpg', 'Surmai,Fish'),
(3, 12, 2, 'Dal Bhat', 50, 200, 'Yummy', 'dal.jpg', 'dal, bhat,veg'),
(4, 12, 2, 'Appe', 50, 100, 'Yummy', 'appe.jpg', 'Appe ,veg'),
(5, 12, 2, 'Chapati', 50, 5000, 'Yummy', 'chap.jpg', 'chapati , veg'),
(6, 12, 2, 'Chinese', 50, 200, 'Yummy', 'chinese.jpg', 'chinese, veg'),
(7, 12, 2, 'Chole Bhature', 100, 200, 'yummy', 'chol.jpg', 'Chole, Bhature'),
(8, 12, 3, 'Curry Fish', 200, 200, 'yummy', 'curry.jpg', 'curry'),
(9, 12, 2, 'Dal Wada', 50, 200, 'yummy', 'dalwada.jpg', 'dalwada'),
(10, 12, 2, 'Dosa', 100, 200, 'yummy', 'dosa.jpg', 'dosa'),
(11, 12, 3, 'Egg Curry', 200, 200, 'yummy', 'egg.jpg', 'egg ,curry'),
(12, 12, 2, 'Frankee', 100, 200, 'yummy', 'frankee.jpg', 'frankee'),
(13, 12, 3, 'Fry Fish', 50, 200, 'yummy', 'fryfish.jpg', 'fryfish'),
(14, 12, 3, 'Half Fry', 100, 200, 'yummy', 'halffry.jpg', 'half, fry'),
(15, 12, 2, 'Idly', 50, 200, 'yummy', 'idlle.jpg', 'idly'),
(16, 12, 2, 'Kachori', 100, 200, 'yummy', 'kachori.jpg', 'kachori'),
(17, 12, 2, 'Khichdi', 50, 200, 'yummy', 'khichdi.jpg', 'khichdi'),
(18, 12, 3, 'Loolipop', 100, 200, 'yummy', 'lollipop.jpg', 'lollipop'),
(19, 12, 2, 'Misal', 200, 200, 'yummy', 'misal.jpg', 'misal'),
(20, 12, 2, 'Modak', 100, 200, 'yummy', 'modak.jpg', 'modak'),
(21, 12, 2, 'Momo', 200, 200, 'yummy', 'momo.jpg', 'momo'),
(22, 12, 2, 'Moong Dal', 300, 200, 'yummy', 'moong.jpg', 'moong'),
(23, 12, 2, 'Omlet', 50, 200, 'yummy', 'omlet.jpg', 'omlet'),
(24, 12, 2, 'Panner Kulcha', 300, 200, 'yummy', 'pan.jpg', 'paneer'),
(25, 12, 3, 'Paplet', 100, 200, 'yummy', 'paplet.jpg', 'paplet'),
(26, 12, 2, 'Pasta', 300, 200, 'yummy', 'pasta.jpg', 'pasta'),
(27, 12, 2, 'Pohe', 200, 200, 'yummy', 'pohe.jpg', 'pohe'),
(28, 12, 2, 'Puri Bhaji', 100, 200, 'yummy', 'puri.jpg', 'puri'),
(29, 12, 2, 'Pulav', 200, 200, 'yummy', 'pulav.jpg', 'pulav'),
(30, 12, 2, 'Purn Poli', 300, 200, 'yummy', 'purn.jpg', 'purn poli'),
(31, 12, 2, 'Rava Shira', 50, 200, 'yummy', 'rava.jpg', 'Rava'),
(32, 12, 2, 'Sabu Dana', 100, 200, 'yummy', 'sabudana.jpg', 'sabudana'),
(33, 12, 2, 'Upma', 50, 200, 'yummy', 'upma.jpg', 'upma'),
(34, 12, 2, 'Vada Pav', 50, 200, 'yummy', 'vada.jpg', 'Vada '),
(35, 12, 2, 'Wheat Shira', 50, 200, 'yummy', 'wheat.jpg', 'Wheat, Shira'),
(36, 12, 3, 'Zinga', 300, 200, 'yummy', 'zinga.webp', 'Zinga');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'Rizwan', 'Khan', 'rizwankhan.august16@gmail.com', '25f9e794323b453885f5181f1b624d0b', '8389080183', 'Rahmat Nagar Burnpur Asansol', 'Asansol'),
(2, 'Rizwan', 'Khan', 'rizwankhan.august16@yahoo.com', '25f9e794323b453885f5181f1b624d0b', '8389080183', 'Rahmat Nagar Burnpur Asansol', 'Asa'),
(3, 'Rutuja', 'jadhav', 'rutuja@gmail.com', 'a25154369ab5a9d26c66c80d4eda3ad9', '9664870262', 'F-301 ,cbi yashoda sadan no.9 ,sarswati nagar,navghar road ,bhayander east', 'bhayndar');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
