-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2018 at 03:54 PM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rainbowgarden`
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
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `createdate` datetime DEFAULT NULL,
  `custom_id` int(11) DEFAULT NULL,
  `fullname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `createdate`, `custom_id`, `fullname`) VALUES
(1, '2017-07-04 00:00:00', 32, 'cart_cus_32'),
(2, '2017-11-08 00:00:00', 23, 'cart_cus_23'),
(3, '2017-05-27 00:00:00', 33, 'cart_cus_33'),
(4, '2018-01-30 00:00:00', 33, 'cart_cus_33'),
(5, '2017-01-05 00:00:00', 28, 'cart_cus_28'),
(6, '2017-05-05 00:00:00', 22, 'cart_cus_22'),
(7, '2017-05-27 00:00:00', 14, 'cart_cus_14'),
(8, '2017-06-11 00:00:00', 16, 'cart_cus_16'),
(9, '2017-05-05 00:00:00', 29, 'cart_cus_29'),
(10, '2017-11-10 00:00:00', 26, 'cart_cus_26'),
(11, '2017-09-30 00:00:00', 19, 'cart_cus_19'),
(12, '2017-09-15 00:00:00', 30, 'cart_cus_30'),
(13, '2017-03-06 00:00:00', 37, 'cart_cus_37'),
(14, '2017-11-22 00:00:00', 31, 'cart_cus_31'),
(15, '2017-03-20 00:00:00', 24, 'cart_cus_24'),
(16, '2017-05-17 00:00:00', 12, 'cart_cus_12'),
(17, '2017-09-05 00:00:00', 29, 'cart_cus_29'),
(18, '2017-12-10 00:00:00', 33, 'cart_cus_33'),
(19, '2018-01-27 00:00:00', 11, 'cart_cus_11'),
(20, '2017-08-27 00:00:00', 34, 'cart_cus_34'),
(21, '2017-01-22 00:00:00', 16, 'cart_cus_16'),
(22, '2017-09-28 00:00:00', 20, 'cart_cus_20'),
(23, '2017-04-22 00:00:00', 37, 'cart_cus_37'),
(24, '2017-01-25 00:00:00', 22, 'cart_cus_22'),
(25, '2017-03-31 00:00:00', 17, 'cart_cus_17'),
(26, '2017-09-23 00:00:00', 12, 'cart_cus_12'),
(27, '2018-01-10 00:00:00', 5, 'cart_cus_5'),
(28, '2017-07-07 00:00:00', 7, 'cart_cus_7'),
(29, '2017-10-12 00:00:00', 17, 'cart_cus_17'),
(30, '2017-06-18 00:00:00', 4, 'cart_cus_4'),
(31, '2017-09-23 00:00:00', 18, 'cart_cus_18'),
(32, '2017-04-13 00:00:00', 15, 'cart_cus_15'),
(33, '2017-01-03 00:00:00', 30, 'cart_cus_30'),
(34, '2017-09-30 00:00:00', 11, 'cart_cus_11'),
(35, '2017-07-11 00:00:00', 29, 'cart_cus_29'),
(36, '2017-03-17 00:00:00', 30, 'cart_cus_30'),
(37, '2017-10-13 00:00:00', 6, 'cart_cus_6'),
(38, '2017-09-29 00:00:00', 5, 'cart_cus_5'),
(39, '2017-02-05 00:00:00', 18, 'cart_cus_18'),
(40, '2017-07-05 00:00:00', 29, 'cart_cus_29'),
(41, '2018-01-25 00:00:00', 29, 'cart_cus_29'),
(42, '2017-05-07 00:00:00', 18, 'cart_cus_18'),
(43, '2017-03-21 00:00:00', 25, 'cart_cus_25'),
(44, '2017-01-04 00:00:00', 17, 'cart_cus_17'),
(45, '2017-02-16 00:00:00', 35, 'cart_cus_35'),
(46, '2017-06-06 00:00:00', 18, 'cart_cus_18'),
(47, '2017-03-07 00:00:00', 14, 'cart_cus_14'),
(48, '2017-06-19 00:00:00', 33, 'cart_cus_33'),
(49, '2017-09-06 00:00:00', 31, 'cart_cus_31'),
(50, '2017-02-15 00:00:00', 21, 'cart_cus_21'),
(51, '2017-11-10 00:00:00', 11, 'cart_cus_11'),
(52, '2017-03-19 00:00:00', 10, 'cart_cus_10'),
(53, '2017-02-13 00:00:00', 16, 'cart_cus_16'),
(54, '2017-05-17 00:00:00', 10, 'cart_cus_10'),
(55, '2017-07-28 00:00:00', 37, 'cart_cus_37'),
(56, '2017-05-14 00:00:00', 6, 'cart_cus_6'),
(57, '2017-11-03 00:00:00', 10, 'cart_cus_10'),
(58, '2017-10-22 00:00:00', 32, 'cart_cus_32'),
(59, '2017-08-11 00:00:00', 23, 'cart_cus_23'),
(60, '2017-01-07 00:00:00', 13, 'cart_cus_13'),
(61, '2017-11-11 00:00:00', 8, 'cart_cus_8'),
(62, '2017-05-04 00:00:00', 16, 'cart_cus_16'),
(63, '2017-10-29 00:00:00', 24, 'cart_cus_24'),
(64, '2017-05-12 00:00:00', 6, 'cart_cus_6'),
(65, '2017-09-15 00:00:00', 4, 'cart_cus_4'),
(66, '2017-04-07 00:00:00', 13, 'cart_cus_13'),
(67, '2017-09-13 00:00:00', 3, 'cart_cus_3'),
(68, '2017-12-10 00:00:00', 10, 'cart_cus_10'),
(69, '2017-03-31 00:00:00', 14, 'cart_cus_14'),
(70, '2017-07-03 00:00:00', 35, 'cart_cus_35'),
(71, '2017-12-06 00:00:00', 9, 'cart_cus_9'),
(72, '2017-07-23 00:00:00', 37, 'cart_cus_37'),
(73, '2017-06-14 00:00:00', 29, 'cart_cus_29'),
(74, '2017-03-23 00:00:00', 35, 'cart_cus_35'),
(75, '2017-04-25 00:00:00', 29, 'cart_cus_29'),
(76, '2017-11-09 00:00:00', 13, 'cart_cus_13'),
(77, '2017-06-16 00:00:00', 33, 'cart_cus_33'),
(78, '2017-01-18 00:00:00', 9, 'cart_cus_9'),
(79, '2017-01-11 00:00:00', 25, 'cart_cus_25'),
(80, '2017-10-29 00:00:00', 5, 'cart_cus_5'),
(81, '2017-11-08 00:00:00', 23, 'cart_cus_23'),
(82, '2017-01-16 00:00:00', 5, 'cart_cus_5'),
(83, '2017-04-18 00:00:00', 25, 'cart_cus_25'),
(84, '2017-11-03 00:00:00', 30, 'cart_cus_30'),
(85, '2017-08-26 00:00:00', 18, 'cart_cus_18'),
(86, '2017-04-26 00:00:00', 24, 'cart_cus_24'),
(87, '2017-06-11 00:00:00', 10, 'cart_cus_10'),
(88, '2017-02-24 00:00:00', 6, 'cart_cus_6'),
(89, '2017-08-08 00:00:00', 7, 'cart_cus_7'),
(90, '2017-10-14 00:00:00', 36, 'cart_cus_36'),
(91, '2017-03-02 00:00:00', 9, 'cart_cus_9'),
(92, '2017-01-21 00:00:00', 7, 'cart_cus_7'),
(93, '2017-06-06 00:00:00', 21, 'cart_cus_21'),
(94, '2017-03-27 00:00:00', 16, 'cart_cus_16'),
(95, '2017-05-07 00:00:00', 29, 'cart_cus_29'),
(96, '2018-01-10 00:00:00', 18, 'cart_cus_18'),
(97, '2017-09-29 00:00:00', 36, 'cart_cus_36'),
(98, '2017-05-19 00:00:00', 11, 'cart_cus_11'),
(99, '2017-11-23 00:00:00', 30, 'cart_cus_30'),
(100, '2017-01-16 00:00:00', 14, 'cart_cus_14'),
(101, '2017-07-04 00:00:00', 24, 'cart_cus_24'),
(102, '2018-01-12 00:00:00', 29, 'cart_cus_29'),
(103, '2017-01-13 00:00:00', 33, 'cart_cus_33'),
(104, '2017-04-20 00:00:00', 13, 'cart_cus_13'),
(105, '2017-01-11 00:00:00', 21, 'cart_cus_21'),
(106, '2017-05-18 00:00:00', 6, 'cart_cus_6'),
(107, '2017-10-20 00:00:00', 27, 'cart_cus_27'),
(108, '2017-04-29 00:00:00', 21, 'cart_cus_21'),
(109, '2017-11-24 00:00:00', 7, 'cart_cus_7'),
(110, '2017-07-17 00:00:00', 36, 'cart_cus_36'),
(111, '2017-10-06 00:00:00', 23, 'cart_cus_23'),
(112, '2017-01-30 00:00:00', 33, 'cart_cus_33'),
(113, '2017-10-01 00:00:00', 22, 'cart_cus_22'),
(114, '2017-10-25 00:00:00', 11, 'cart_cus_11'),
(115, '2017-05-21 00:00:00', 31, 'cart_cus_31'),
(116, '2017-07-07 00:00:00', 6, 'cart_cus_6'),
(117, '2017-02-20 00:00:00', 30, 'cart_cus_30'),
(118, '2017-07-20 00:00:00', 18, 'cart_cus_18'),
(119, '2017-08-06 00:00:00', 37, 'cart_cus_37'),
(120, '2018-01-05 00:00:00', 32, 'cart_cus_32'),
(121, '2017-01-01 00:00:00', 3, 'cart_cus_3'),
(122, '2017-09-27 00:00:00', 13, 'cart_cus_13'),
(123, '2017-11-19 00:00:00', 5, 'cart_cus_5'),
(124, '2017-09-25 00:00:00', 23, 'cart_cus_23'),
(125, '2018-01-18 00:00:00', 36, 'cart_cus_36'),
(126, '2017-04-05 00:00:00', 6, 'cart_cus_6'),
(127, '2017-11-07 00:00:00', 10, 'cart_cus_10'),
(128, '2017-01-04 00:00:00', 35, 'cart_cus_35'),
(129, '2017-04-04 00:00:00', 4, 'cart_cus_4'),
(130, '2017-06-13 00:00:00', 30, 'cart_cus_30'),
(131, '2017-09-06 00:00:00', 16, 'cart_cus_16'),
(132, '2017-05-17 00:00:00', 14, 'cart_cus_14'),
(133, '2017-10-26 00:00:00', 10, 'cart_cus_10'),
(134, '2018-01-06 00:00:00', 20, 'cart_cus_20'),
(135, '2017-04-16 00:00:00', 5, 'cart_cus_5'),
(136, '2017-10-14 00:00:00', 22, 'cart_cus_22'),
(137, '2017-01-18 00:00:00', 17, 'cart_cus_17'),
(138, '2017-05-24 00:00:00', 22, 'cart_cus_22'),
(139, '2018-01-15 00:00:00', 8, 'cart_cus_8'),
(140, '2017-07-23 00:00:00', 9, 'cart_cus_9'),
(141, '2017-03-29 00:00:00', 25, 'cart_cus_25'),
(142, '2017-11-07 00:00:00', 24, 'cart_cus_24'),
(143, '2017-08-15 00:00:00', 27, 'cart_cus_27'),
(144, '2017-08-11 00:00:00', 22, 'cart_cus_22'),
(145, '2017-11-16 00:00:00', 22, 'cart_cus_22'),
(146, '2017-06-30 00:00:00', 5, 'cart_cus_5'),
(147, '2017-01-04 00:00:00', 18, 'cart_cus_18'),
(148, '2017-07-01 00:00:00', 11, 'cart_cus_11'),
(149, '2017-10-26 00:00:00', 23, 'cart_cus_23'),
(150, '2017-12-03 00:00:00', 15, 'cart_cus_15'),
(151, '2017-02-07 00:00:00', 30, 'cart_cus_30'),
(152, '2017-08-24 00:00:00', 13, 'cart_cus_13'),
(153, '2017-04-11 00:00:00', 13, 'cart_cus_13'),
(154, '2017-11-05 00:00:00', 28, 'cart_cus_28'),
(155, '2017-08-19 00:00:00', 27, 'cart_cus_27'),
(156, '2017-09-14 00:00:00', 30, 'cart_cus_30'),
(157, '2018-01-12 20:46:38', 32, 'Cart_32'),
(158, '2018-01-12 20:50:33', 1, 'as_1'),
(159, '2018-01-12 20:52:38', 1, 'Cart_1'),
(160, '2018-01-12 20:53:12', 1, 'Cart_1'),
(161, '2018-01-12 20:54:55', 1, 'Cart_1'),
(162, '2018-01-12 21:01:09', 1, 'Cart_1'),
(163, '2018-01-12 21:02:37', 1, 'Cart_1');

-- --------------------------------------------------------

--
-- Table structure for table `cart_detail`
--

CREATE TABLE `cart_detail` (
  `id_cart` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart_detail`
--

INSERT INTO `cart_detail` (`id_cart`, `id_product`, `quantity`) VALUES
(1, 13, 26),
(1, 17, 28),
(1, 21, 4),
(1, 42, 15),
(2, 9, 22),
(2, 12, 21),
(4, 17, 18),
(4, 23, 3),
(5, 4, 22),
(5, 9, 11),
(5, 20, 13),
(7, 6, 3),
(7, 17, 23),
(7, 23, 5),
(7, 38, 5),
(8, 5, 7),
(8, 17, 30),
(8, 22, 18),
(8, 40, 28),
(9, 4, 30),
(9, 9, 5),
(9, 10, 21),
(9, 17, 14),
(9, 40, 13),
(10, 21, 6),
(11, 6, 11),
(11, 15, 13),
(13, 2, 8),
(13, 3, 10),
(13, 9, 21),
(13, 42, 1),
(14, 12, 9),
(14, 21, 18),
(15, 4, 14),
(15, 10, 30),
(16, 6, 19),
(18, 42, 19),
(19, 6, 30),
(19, 11, 15),
(19, 38, 4),
(20, 13, 21),
(22, 11, 17),
(22, 19, 15),
(22, 20, 23),
(22, 39, 18),
(23, 38, 18),
(23, 40, 27),
(24, 3, 26),
(24, 5, 20),
(25, 6, 7),
(25, 22, 24),
(25, 39, 21),
(25, 42, 14),
(27, 4, 1),
(27, 43, 23),
(28, 8, 22),
(29, 3, 29),
(29, 20, 24),
(29, 42, 2),
(29, 44, 1),
(30, 44, 4),
(31, 21, 16),
(32, 4, 29),
(32, 9, 9),
(32, 14, 20),
(33, 8, 18),
(33, 37, 21),
(33, 43, 18),
(34, 19, 25),
(35, 4, 12),
(36, 42, 6),
(38, 17, 17),
(39, 4, 17),
(40, 2, 28),
(40, 14, 21),
(40, 41, 3),
(41, 18, 12),
(41, 37, 13),
(42, 2, 3),
(42, 3, 26),
(42, 23, 28),
(42, 41, 21),
(42, 44, 4),
(43, 12, 17),
(44, 9, 26),
(44, 20, 25),
(44, 21, 2),
(44, 37, 9),
(45, 23, 24),
(45, 41, 29),
(47, 2, 27),
(47, 19, 2),
(47, 44, 3),
(48, 18, 17),
(49, 4, 29),
(50, 3, 11),
(50, 5, 9),
(50, 8, 15),
(50, 44, 1),
(51, 44, 4),
(52, 40, 11),
(53, 44, 9),
(54, 1, 18),
(54, 12, 27),
(55, 38, 29),
(55, 39, 1),
(56, 6, 4),
(57, 5, 27),
(58, 8, 23),
(58, 23, 9),
(59, 17, 30),
(59, 22, 26),
(60, 3, 23),
(60, 41, 17),
(61, 21, 26),
(62, 11, 24),
(63, 12, 11),
(63, 15, 25),
(64, 3, 24),
(64, 8, 5),
(64, 13, 8),
(65, 14, 18),
(65, 23, 11),
(65, 41, 16),
(66, 1, 27),
(66, 5, 23),
(66, 38, 18),
(67, 44, 30),
(68, 12, 22),
(68, 13, 18),
(68, 18, 6),
(69, 9, 6),
(69, 38, 21),
(71, 18, 5),
(72, 44, 10),
(73, 15, 29),
(74, 15, 19),
(74, 17, 2),
(74, 38, 15),
(75, 3, 14),
(75, 41, 8),
(76, 13, 19),
(76, 15, 28),
(76, 21, 30),
(77, 2, 6),
(77, 38, 18),
(77, 42, 16),
(78, 39, 24),
(79, 9, 21),
(79, 37, 25),
(80, 4, 22),
(81, 1, 5),
(81, 3, 18),
(82, 1, 5),
(82, 9, 11),
(82, 19, 25),
(83, 10, 7),
(84, 11, 28),
(84, 13, 11),
(85, 13, 28),
(85, 41, 5),
(86, 2, 27),
(86, 6, 21),
(86, 11, 28),
(86, 19, 3),
(87, 1, 29),
(87, 14, 21),
(87, 21, 16),
(87, 44, 4),
(90, 17, 22),
(91, 1, 7),
(91, 4, 8),
(91, 39, 23),
(92, 10, 27),
(92, 13, 1),
(92, 22, 1),
(93, 41, 15),
(94, 14, 15),
(96, 38, 25),
(97, 10, 26),
(97, 15, 18),
(98, 5, 12),
(98, 38, 28),
(99, 4, 16),
(100, 6, 9),
(101, 42, 19),
(102, 23, 23),
(102, 43, 13),
(103, 8, 17),
(104, 6, 21),
(104, 14, 9),
(104, 21, 21),
(105, 22, 2),
(106, 9, 30),
(106, 44, 3),
(107, 7, 18),
(107, 10, 22),
(107, 12, 25),
(107, 37, 19),
(107, 40, 27),
(108, 5, 3),
(108, 9, 17),
(108, 39, 13),
(109, 2, 20),
(109, 18, 17),
(109, 22, 26),
(110, 1, 6),
(110, 17, 30),
(110, 19, 26),
(111, 18, 10),
(111, 21, 1),
(111, 37, 15),
(112, 4, 21),
(112, 17, 8),
(113, 43, 22),
(114, 17, 25),
(115, 14, 30),
(115, 19, 30),
(115, 20, 22),
(117, 7, 20),
(117, 10, 25),
(117, 15, 12),
(117, 22, 2),
(118, 11, 30),
(118, 18, 29),
(119, 1, 22),
(119, 21, 13),
(119, 23, 16),
(119, 44, 1),
(120, 18, 2),
(120, 21, 18),
(121, 22, 28),
(121, 38, 10),
(121, 42, 29),
(122, 8, 28),
(122, 41, 18),
(123, 44, 5),
(124, 4, 10),
(124, 8, 16),
(124, 38, 16),
(125, 23, 20),
(126, 17, 10),
(127, 2, 13),
(127, 7, 10),
(127, 43, 13),
(129, 5, 26),
(130, 8, 18),
(130, 42, 19),
(131, 5, 28),
(131, 14, 22),
(132, 40, 12),
(133, 37, 19),
(133, 38, 12),
(134, 23, 6),
(135, 11, 3),
(135, 12, 1),
(137, 1, 7),
(137, 22, 8),
(138, 5, 28),
(138, 21, 20),
(140, 1, 28),
(141, 3, 26),
(141, 11, 30),
(141, 19, 8),
(142, 5, 2),
(142, 39, 6),
(144, 6, 27),
(144, 9, 17),
(146, 6, 3),
(146, 7, 29),
(146, 23, 26),
(146, 43, 14),
(148, 3, 6),
(148, 5, 16),
(148, 10, 14),
(148, 12, 7),
(148, 21, 10),
(149, 2, 18),
(149, 5, 17),
(149, 18, 23),
(151, 10, 30),
(151, 42, 2),
(152, 15, 17),
(152, 37, 8),
(153, 13, 6),
(155, 20, 26),
(155, 37, 20),
(156, 4, 25),
(156, 13, 25),
(156, 19, 28),
(162, 19, 1),
(163, 17, 1),
(163, 18, 1),
(163, 21, 1),
(163, 22, 1);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saleoff` int(10) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `imagiUrl` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_descripsion` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `saleoff`, `category`, `price`, `imagiUrl`, `short_descripsion`) VALUES
(1, 'Santa Claus Tứ Phương', 0, 3, 100, 'img/mn1.jpg', NULL),
(2, 'Hộp Gỗ Ống Điếu', 0, 3, 120, 'img/mn2.jpg', NULL),
(3, 'Bigly Móng Rồng', 0, 3, 32, 'img/mn3.jpg', NULL),
(4, 'Hộp Gỗ Lá Tim', 0, 3, 45, 'img/mn4.jpg', NULL),
(5, 'Merry Chrimas Sen Kim', 0, 3, 56, 'img/mn5.jpg', NULL),
(6, 'Hộp Gỗ Móng Rồng', 0, 3, 90, 'img/mn6.jpg', NULL),
(7, 'Gỗ Vẽ Cá Sấu', 0, 3, 89, 'img/mn7.jpg', NULL),
(8, 'Snowman Sen Phật Bà', 0, 3, 110, 'img/mn8.jpg', NULL),
(9, 'Santa Claus Tứ Phương', 0, 3, 100, 'img/mn1.jpg', NULL),
(10, 'Hộp Gỗ Ống Điếu', 0, 3, 120, 'img/mn2.jpg', NULL),
(11, 'Bigly Móng Rồng', 0, 3, 32, 'img/mn3.jpg', NULL),
(12, 'Hộp Gỗ Lá Tim', 0, 3, 45, 'img/mn4.jpg', NULL),
(13, 'Merry Chrimas Sen Kim', 0, 3, 56, 'img/mn5.jpg', NULL),
(14, 'Hộp Gỗ Móng Rồng', 0, 3, 90, 'img/mn6.jpg', NULL),
(15, 'Gỗ Vẽ Cá Sấu', 0, 3, 89, 'img/mn7.jpg', NULL),
(17, 'Giọt Nước Màu Sắc', 0, 2, 100, 'img/kk1.jpg', NULL),
(18, 'Giọt Nước Đen Trắng', 0, 2, 300, 'img/kk2.jpg', NULL),
(19, 'Giọt Nước Dây Treo', 0, 2, 420, 'img/kk3.jpg', NULL),
(20, 'Đại Dương Đa Sắc', 0, 2, 120, 'img/kk4.jpg', NULL),
(21, 'Cây Không Khí AT001', 0, 2, 43, 'img/kk5.jpg', NULL),
(22, 'Cây Không Khí', 0, 2, 59, 'img/kk6.jpg', NULL),
(23, 'Biển Xanh Nhiệt Đới', 0, 2, 40, 'img/kk7.jpg', NULL),
(37, 'Cây Đồng Tiền', 0, 1, 390, 'img/cmn1.jpg', NULL),
(38, 'Cây Mini Hồng Xinh', 0, 1, 167, 'img/cmn2.jpg', NULL),
(39, 'Cây Trầ Bà Sữa', 0, 1, 123, 'img/cmn3.jpg', NULL),
(40, 'Cây DGA Huyết Dụ', 0, 1, 367, 'img/cmn4.jpg', NULL),
(41, 'Cây Tiểu Cảnh Để Bàn', 0, 1, 189, 'img/cmn5.jpg', NULL),
(42, 'Cây Môn Xanh Nhật Bản', 0, 1, 456, 'img/cmn6.jpg', NULL),
(43, 'Cây Môn Nhí Lá Tròn', 0, 1, 284, 'img/cmn7.jpg', NULL),
(44, 'Cây Ngũ Gia Bì', 0, 1, 70, 'img/cmn8.jpg', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_id` (`custom_id`);

--
-- Indexes for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`id_cart`,`id_product`),
  ADD KEY `id_cart` (`id_cart`,`id_product`),
  ADD KEY `id_product` (`id_product`);

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
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;
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
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`custom_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD CONSTRAINT `cart_detail_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `cart_detail_ibfk_2` FOREIGN KEY (`id_cart`) REFERENCES `cart` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
