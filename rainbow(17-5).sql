-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2018 at 09:05 AM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rainbow`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `form` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwords` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastmodified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `form`, `username`, `passwords`, `fullname`, `createdate`, `lastmodified`) VALUES
(1, 'admin', 'admin@admin.com', 'admin', 'Lý Hoa Nam', '2017-12-19 23:23:30', NULL),
(2, 'client', 'client@gmail.com', 'client', 'Im King', '2017-12-20 11:18:16', NULL),
(3, 'client', 'client1@gmail.com', 'client1', 'Lê Thị Thúy', '2017-03-19 00:00:00', '2018-01-09 00:00:00'),
(4, 'client', 'client2@gmail.com', 'client2', 'Nguyễn Thị Trường', '2017-08-28 00:00:00', '2018-01-13 00:00:00'),
(5, 'client', 'client3@gmail.com', 'client3', 'Nguyễn Tường', '2017-09-23 00:00:00', '2018-01-08 00:00:00'),
(6, 'client', 'client4@gmail.com', 'client4', 'Trần Hà Thiên', '2017-12-03 00:00:00', '2018-01-23 00:00:00'),
(7, 'client', 'client5@gmail.com', 'client5', 'Đào Hải', '2017-12-28 00:00:00', '2018-01-22 00:00:00'),
(8, 'client', 'client6@gmail.com', 'client6', 'Nguyễn Thị Ngọc', '2017-12-04 00:00:00', '2018-01-19 00:00:00'),
(9, 'client', 'client7@gmail.com', 'client7', 'Nguyễn Thị Trâm', '2017-08-09 00:00:00', '2018-01-12 00:00:00'),
(10, 'client', 'client8@gmail.com', 'client8', 'Nguyễn Vũ Thụy', '2017-12-01 00:00:00', '2018-01-31 00:00:00'),
(11, 'client', 'client9@gmail.com', 'client9', 'Thân Hoàng Thúy', '2017-09-09 00:00:00', '2018-01-19 00:00:00'),
(12, 'client', 'client10@gmail.com', 'client10', 'Trần Huyền My', '2017-03-12 00:00:00', '2018-01-10 00:00:00'),
(13, 'client', 'client11@gmail.com', 'client11', 'Trần Thị Vân', '2017-02-11 00:00:00', '2018-01-15 00:00:00'),
(14, 'client', 'client12@gmail.com', 'client12', 'Hà Thị Thu', '2017-05-04 00:00:00', '2018-01-05 00:00:00'),
(15, 'client', 'client13@gmail.com', 'client13', 'Nguyễn Ngọc', '2017-05-31 00:00:00', '2018-01-23 00:00:00'),
(16, 'client', 'client14@gmail.com', 'client14', 'Võ Phan Thúy', '2017-04-20 00:00:00', '2018-01-12 00:00:00'),
(17, 'client', 'client15@gmail.com', 'client15', 'Võ Thúy', '2017-05-04 00:00:00', '2018-01-01 00:00:00'),
(18, 'client', 'client16@gmail.com', 'client16', 'Đặng Thị', '2017-12-24 00:00:00', '2018-01-21 00:00:00'),
(19, 'client', 'client17@gmail.com', 'client17', 'Nguyễn Thị Ngọc', '2017-12-19 00:00:00', '2018-01-21 00:00:00'),
(20, 'client', 'client18@gmail.com', 'client18', 'Phạm Thị Hoàng', '2017-04-06 00:00:00', '2018-01-10 00:00:00'),
(21, 'client', 'client19@gmail.com', 'client19', 'Vũ Trương Ngọc', '2017-05-28 00:00:00', '2018-01-02 00:00:00'),
(22, 'client', 'client20@gmail.com', 'client20', 'Vương Thị Ngọc', '2017-10-10 00:00:00', '2018-01-09 00:00:00'),
(23, 'client', 'client21@gmail.com', 'client21', 'Bùi Thị Ngọc', '2017-07-20 00:00:00', '2018-01-25 00:00:00'),
(24, 'client', 'client22@gmail.com', 'client22', 'Nguyễn Quốc', '2017-04-24 00:00:00', '2018-01-04 00:00:00'),
(25, 'client', 'client23@gmail.com', 'client23', 'Trần Anh', '2017-06-16 00:00:00', '2018-01-22 00:00:00'),
(26, 'client', 'client24@gmail.com', 'client24', 'Lê Thị Kim', '2017-03-07 00:00:00', '2018-01-18 00:00:00'),
(27, 'client', 'client25@gmail.com', 'client25', 'Lê Thị', '2017-12-20 00:00:00', '2018-01-01 00:00:00'),
(28, 'client', 'client26@gmail.com', 'client26', 'Bùi Thị Thanh', '2017-10-07 00:00:00', '2018-01-01 00:00:00'),
(29, 'client', 'client27@gmail.com', 'client27', 'Phan Thanh', '2017-05-25 00:00:00', '2018-01-16 00:00:00'),
(30, 'client', 'client28@gmail.com', 'client28', 'Vũ Hải', '2017-01-11 00:00:00', '2018-01-23 00:00:00'),
(31, 'client', 'client29@gmail.com', 'client29', 'Trương Thị', '2017-07-01 00:00:00', '2018-01-05 00:00:00'),
(32, 'client', 'client30@gmail.com', 'client30', 'Đặng Thị Lệ', '2017-07-03 00:00:00', '2018-01-05 00:00:00'),
(33, 'client', 'client31@gmail.com', 'client31', 'Chung Phối', '2017-06-26 00:00:00', '2018-01-25 00:00:00'),
(34, 'client', 'client32@gmail.com', 'client32', 'Diệp Bảo Quỳnh', '2017-06-02 00:00:00', '2018-01-12 00:00:00'),
(35, 'client', 'client33@gmail.com', 'client33', 'Dương Lê Quỳnh', '2017-05-05 00:00:00', '2018-01-07 00:00:00'),
(36, 'client', 'client34@gmail.com', 'client34', 'Lê Minh Bảo', '2017-10-11 00:00:00', '2018-01-16 00:00:00'),
(37, 'client', 'client35@gmail.com', 'client35', 'Nguyễn Thị Minh', '2017-11-12 00:00:00', '2018-01-27 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'cây mini'),
(2, 'cây không khí'),
(3, 'cây handmade');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `phone`, `email`, `content`) VALUES
(1, 'Vũ Hải', 92312493, 'vuhai@gmail.com', 'Là người khá kỹ tính, nên những thứ tôi chọn thường yêu cầu rất cao. Nhưng may mắn thay, tôi mua cây tại đây các bạn tư vấn rất nhiệt tình và khá chi tiết. Hi vọng các bạn sẽ vẫn giữ được sự chuyên nghiệp này, tôi sẽ ủng hộ dài dài.'),
(2, 'Trương Thị', 2039428, 'truong111@gmail.com', 'Tôi yêu hoa cảnh và kinh doanh. Tôi tìm được vườn có nhiều loại cây khá độc và dễ thương. Biết là cạnh tranh nhưng các bạn rất thoải mái tư vấn về kinh doanh và chăm sóc cây. Hi vọng hợp tác dài lâu với vườn.'),
(3, 'Đặng Thị Lệ', 23425436, 'Dangthi32@gmail.com', 'Tôi là người yêu thích cây cảnh, hoa hòe, tìm hoài không biết nên mua cái gì để chưng cho phòng khách cả. Tình cờ tìm được trang web vuoncaymini.com, click vào xem thì quá ư là thích, nó vừa lạ, vừa bé, vừa xinh, không chịu nỗi.'),
(4, 'Chung Phối', 3476546, 'phoi@gmail.com', 'Tôi quyết định trang trí bàn làm việc bằng những cây xanh, mà thấy ở đâu cũng những cây lớn quá cỡ. Được người bạn giới thiệu lên vuoncaymini.com xem. Thế là bàn của tôi không những xinh mà còn sinh động nữa chứ.');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `createdate` datetime DEFAULT NULL,
  `custom_id` int(11) DEFAULT NULL,
  `fullname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sttOrder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `createdate`, `custom_id`, `fullname`, `sttOrder`) VALUES
(1, '2017-01-16 00:00:00', 33, 'cart_cus_33', NULL),
(2, '2017-09-04 00:00:00', 37, 'cart_cus_37', NULL),
(3, '2017-12-15 00:00:00', 3, 'cart_cus_3', NULL),
(4, '2017-03-04 00:00:00', 24, 'cart_cus_24', NULL),
(5, '2017-08-25 00:00:00', 11, 'cart_cus_11', NULL),
(6, '2017-03-25 00:00:00', 24, 'cart_cus_24', NULL),
(7, '2017-05-28 00:00:00', 23, 'cart_cus_23', NULL),
(8, '2017-03-02 00:00:00', 23, 'cart_cus_23', NULL),
(9, '2017-07-11 00:00:00', 4, 'cart_cus_4', NULL),
(10, '2017-03-04 00:00:00', 23, 'cart_cus_23', NULL),
(11, '2018-01-31 00:00:00', 5, 'cart_cus_5', NULL),
(12, '2017-03-03 00:00:00', 10, 'cart_cus_10', NULL),
(13, '2018-01-09 00:00:00', 21, 'cart_cus_21', NULL),
(14, '2017-07-29 00:00:00', 9, 'cart_cus_9', NULL),
(15, '2017-09-16 00:00:00', 8, 'cart_cus_8', NULL),
(16, '2017-06-24 00:00:00', 26, 'cart_cus_26', NULL),
(17, '2017-06-18 00:00:00', 32, 'cart_cus_32', NULL),
(18, '2017-06-13 00:00:00', 19, 'cart_cus_19', NULL),
(19, '2017-07-15 00:00:00', 34, 'cart_cus_34', NULL),
(20, '2017-08-22 00:00:00', 30, 'cart_cus_30', NULL),
(21, '2017-01-22 00:00:00', 16, 'cart_cus_16', NULL),
(22, '2017-05-23 00:00:00', 34, 'cart_cus_34', NULL),
(23, '2017-02-16 00:00:00', 25, 'cart_cus_25', NULL),
(24, '2017-11-11 00:00:00', 31, 'cart_cus_31', NULL),
(25, '2017-12-31 00:00:00', 22, 'cart_cus_22', NULL),
(26, '2017-01-29 00:00:00', 19, 'cart_cus_19', NULL),
(27, '2017-12-14 00:00:00', 36, 'cart_cus_36', NULL),
(28, '2017-07-09 00:00:00', 34, 'cart_cus_34', NULL),
(29, '2017-05-18 00:00:00', 25, 'cart_cus_25', NULL),
(30, '2017-08-14 00:00:00', 18, 'cart_cus_18', NULL),
(31, '2017-03-24 00:00:00', 4, 'cart_cus_4', NULL),
(32, '2017-08-29 00:00:00', 10, 'cart_cus_10', NULL),
(33, '2017-01-19 00:00:00', 19, 'cart_cus_19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_line`
--

CREATE TABLE `order_line` (
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_line`
--

INSERT INTO `order_line` (`id_order`, `id_product`, `quantity`) VALUES
(1, 53, 26),
(2, 58, 12),
(3, 47, 22),
(3, 55, 4),
(3, 69, 26),
(8, 68, 11),
(9, 57, 11),
(9, 66, 11),
(11, 69, 25),
(12, 50, 29),
(12, 52, 8),
(16, 49, 26),
(16, 51, 11),
(17, 53, 11),
(18, 50, 16),
(19, 49, 16),
(19, 50, 13),
(22, 56, 30),
(24, 67, 22),
(26, 52, 7),
(26, 55, 15),
(28, 54, 21),
(28, 61, 25),
(29, 49, 10),
(29, 60, 13),
(30, 50, 19),
(31, 48, 1),
(31, 55, 9);

-- --------------------------------------------------------

--
-- Table structure for table `pricelist`
--

CREATE TABLE `pricelist` (
  `priceID` int(11) NOT NULL,
  `productID` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `isActve` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saleoff` int(10) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `imagiUrl` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_descripsion` text COLLATE utf8_unicode_ci,
  `inStock` int(11) DEFAULT '0',
  `isAvailable` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `saleoff`, `category`, `imagiUrl`, `short_descripsion`, `inStock`, `isAvailable`) VALUES
(47, 'Santa Claus Tứ Phương', 0, 3, 'img/mn1.jpg', NULL, 0, 1),
(48, 'Hộp Gỗ Ống Điếu', 0, 3, 'img/mn2.jpg', NULL, 0, 1),
(49, 'Bigly Móng Rồng', 0, 3, 'img/mn3.jpg', NULL, 0, 1),
(50, 'Hộp Gỗ Lá Tim', 0, 3, 'img/mn4.jpg', NULL, 0, 1),
(51, 'Merry Chrimas Sen Kim', 0, 3, 'img/mn5.jpg', NULL, 0, 1),
(52, 'Hộp Gỗ Móng Rồng', 0, 3, 'img/mn6.jpg', NULL, 0, 1),
(53, 'Gỗ Vẽ Cá Sấu', 0, 3, 'img/mn7.jpg', NULL, 0, 1),
(54, 'Snowman Sen Phật Bà', 0, 3, 'img/mn8.jpg', NULL, 0, 1),
(55, 'Giọt Nước Màu Sắc', 0, 2, 'img/kk1.jpg', NULL, 0, 1),
(56, 'Giọt Nước Đen Trắng', 0, 2, 'img/kk2.jpg', NULL, 0, 1),
(57, 'Giọt Nước Dây Treo', 0, 2, 'img/kk3.jpg', NULL, 0, 1),
(58, 'Đại Dương Đa Sắc', 0, 2, 'img/kk4.jpg', NULL, 0, 1),
(59, 'Cây Không Khí AT001', 0, 2, 'img/kk5.jpg', NULL, 0, 1),
(60, 'Cây Không Khí', 0, 2, 'img/kk6.jpg', NULL, 0, 1),
(61, 'Biển Xanh Nhiệt Đới', 0, 2, 'img/kk7..jpg', NULL, 0, 1),
(62, 'Cây Đồng Tiền', 0, 1, 'img/cmn1.jpg', NULL, 0, 1),
(63, 'Cây Mini Hồng Xinh', 0, 1, 'img/cmn2.jpg', NULL, 0, 1),
(64, 'Cây Trầ Bà Sữa', 0, 1, 'img/cmn3.jpg', NULL, 0, 1),
(65, 'Cây DGA Huyết Dụ', 0, 1, 'img/cmn4.jpg', NULL, 0, 1),
(66, 'Cây Tiểu Cảnh Để Bàn', 0, 1, 'img/cmn5.jpg', NULL, 0, 1),
(67, 'Cây Môn Xanh Nhật Bản', 0, 1, 'img/cmn6.jpg', NULL, 0, 1),
(68, 'Cây Môn Nhí Lá Tròn', 0, 1, 'img/cmn7.jpg', NULL, 0, 1),
(69, 'Cây Ngũ Gia Bì', 0, 1, 'img/cmn8.jpg', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sttorder`
--

CREATE TABLE `sttorder` (
  `sttID` int(11) NOT NULL,
  `sttName` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sttorder`
--

INSERT INTO `sttorder` (`sttID`, `sttName`) VALUES
(1, 'onCart'),
(2, 'onDraft'),
(3, 'onPrinting'),
(4, 'onShipping'),
(5, 'paid'),
(6, 'canceled');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_id` (`custom_id`),
  ADD KEY `sttOrder` (`sttOrder`);

--
-- Indexes for table `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`id_order`,`id_product`),
  ADD KEY `id_order` (`id_order`,`id_product`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_order_2` (`id_order`),
  ADD KEY `id_product_2` (`id_product`);

--
-- Indexes for table `pricelist`
--
ALTER TABLE `pricelist`
  ADD PRIMARY KEY (`priceID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `sttorder`
--
ALTER TABLE `sttorder`
  ADD PRIMARY KEY (`sttID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT for table `sttorder`
--
ALTER TABLE `sttorder`
  MODIFY `sttID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`sttOrder`) REFERENCES `sttorder` (`sttID`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`custom_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `order_line_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_line_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);

--
-- Constraints for table `pricelist`
--
ALTER TABLE `pricelist`
  ADD CONSTRAINT `pricelist_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
