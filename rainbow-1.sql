-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 04, 2018 lúc 04:35 PM
-- Phiên bản máy phục vụ: 10.1.31-MariaDB
-- Phiên bản PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `rainbow`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddToCart` (`ctID` INT(11), `productID` INT(11), `quantity` INT(11))  BEGIN
	DECLARE idcart int(11) DEFAULT 0;
    
	SELECT ID into idcart FROM `order` WHERE sttOrder='1' AND custom_id=ctID;
    
    if idcart=0 THEN
    	INSERT INTO `order`( `createdate`, `custom_id`, `fullname`, `sttOrder`) VALUES (now(),customID,fullname,1);
    	set idCart=LAST_INSERT_ID();
    END IF;
     INSERT INTO `order_line`(`id_order`, `id_product`, `quantity`) VALUES (idCart,productID,quantity);
  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `capnhat_SoLuongSanPham` (`productID` INT(11), `quantity` INT(11))  BEGIN
    DECLARE v_inStock INT(11);
    SET SESSION TRANSACTION isolation level READ uncommitted;
        START TRANSACTION;
        SELECT inStock INTO v_inStock FROM `product` WHERE id = productID FOR UPDATE;
   
        SET v_inStock = v_inStock - quantity;
   
        UPDATE `product`
        SET inStock = v_inStock
        WHERE id = productID;
   
        COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERToder` (IN `customID` INT(11), IN `FullName` VARCHAR(200), IN `productID` INT(11), IN `quantity` INT(11))  BEGIN
	DECLARE orderID int(11);
	INSERT INTO `order`( `createdate`, `custom_id`, `fullname`, `sttOrder`) VALUES (now(),customID,fullname,1);
    
    set orderID =LAST_INSERT_ID();
    INSERT INTO `order_line`(`id_order`, `id_product`, `quantity`) VALUES (orderID,productID,quantity);
  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LoadCart` (IN `ctID` INT(11))  BEGIN
	DECLARE productID,pdquatity int(11);
     DECLARE done int DEFAULT false;
    DECLARE corderline cursor for SELECT id_product, quantity FROM order_line WHERE Id_order in (SELECT ID FROM `order` WHERE sttOrder='1' AND custom_id=ctID);
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done =true;
    
    
    OPEN corderline;
  	My_loop: LOOP
  		FETCH corderline INTO productID,pdquatity;
    	if done then LEAVE MY_loop;
  		end if;  
            SELECT p.* , pdquatity, activePrice(p.ID) 			FROM product p WHERE p.ID=productID;
   	 	end LOOP My_loop;
     
     CLOSE corderline;    
     
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_kiemtraMuaHang` ()  BEGIN
   DECLARE v_inStock INT(11);
   SELECT inStock INTO v_inStock  FROM product WHERE product.`id` = NEW.id_product;
   
   IF NEW.quantity > v_inStock THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'this err'; 
   END IF;  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_capnhatGia` (`p_productID` INT(11), `p_price` FLOAT, `p_startdate` DATE)  BEGIN
-- declare handler
    DECLARE exit handler FOR sqlexception
        BEGIN
    -- ERROR
        ROLLBACK;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR';
        END;
    -- Start transaction
        START TRANSACTION;
   -- B1 Lấy giá của sản phẩm hiện tại, isActive = 0 và gán cho nó ngày kết thúc là hiện tại đang làm
   UPDATE pricelist
   SET enddate = p_startdate, isActive = FALSE
   WHERE productID = p_productID AND isActive = TRUE;
    -- B2 Thêm vào giá mới
   INSERT INTO pricelist (productID, price, startdate, isActive) VALUES (p_productID, p_price, CURRENT_DATE(), TRUE);
   commit;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_changePrice` (IN `pdID` INT(11), IN `starD` DATETIME, IN `endD` DATETIME, IN `pr` INT(11))  begin
 

-- Start transaction
    SET session transaction isolation level read uncommitted;
start transaction;
-- Gọi them gia
   INSERT INTO pricelist(productID, price, startdate,enddate) VALUES(pdID,pr, starD, endD);
   
-- Lỗi
-- Rollback commit;
do sleep(10);
ROLLBACK;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_huyDonHang` (`p_orderID` INT(11))  BEGIN
       
        DECLARE v_productID INT(11);
    DECLARE v_quantity INT(11);
    DECLARE v_stt INT(11);
    DECLARE v_count INT(11);
    DECLARE v_found bool DEFAULT FALSE;
    DECLARE my_cursor cursor FOR
                                                (SELECT _product, o.quantity FROM `order_line` o WHERE _order = p_orderID);
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_found := TRUE;
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
                ROLLBACK;
        END;
       
        DECLARE EXIT HANDLER FOR SQLWARNING
        BEGIN
        ROLLBACK;
        END;
   
    START TRANSACTION;
        SET v_count = 0;
                OPEN my_cursor;
                        my_loop: loop
                        fetch my_cursor INTO v_productID, v_quantity;
                        #kết thúc vòng lặp khi đã duyệt hết bản ghi trên cursor
                        IF v_found THEN leave my_loop;
                        END IF;
                                #Vì đã có TRIGGER test đặt hàng, 1 khi đặt hàng nghĩa là đủ số lượng!
                                CALL sp_capnhatSoLuongSanPham(v_productID, 0 - update_quantity);
                                SET v_count = v_count +1;
                        END loop my_loop;
                close my_cursor;
       
        SELECT sttID INTO v_stt
        FROM `order`
        WHERE sttName = 'canceled';
       
        UPDATE `order`
        SET sttOrder = v_stt
        WHERE id = p_orderID;
        COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lietkeSanPhamNoiBat` ()  BEGIN
-- declare handler
    DECLARE exit handler FOR sqlexception
    BEGIN
-- ERROR
    ROLLBACK;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR';
    END;
-- Start transaction
    SET SESSION TRANSACTION isolation level READ committed;
START TRANSACTION;
--  Dua code vao day cua nhung truong hop lay thong tin san pham!
   
        SELECT p.* , activePrice(p.ID) as price FROM product p JOIN (SELECT sum(quantity), id_product FROM order_line GROUP BY id_product ORDER BY sum(quantity) DESC LIMIT 8) q ON p.id=q.id_product WHERE p.isAvailable=1; 
-- Lỗi
-- Rollback
    commit;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_lietkeSanPhamTheoLoai` (IN `categoryname` VARCHAR(200), IN `dstart` INT(3), IN `size` INT(3))  BEGIN
-- declare handler
    DECLARE exit handler FOR sqlexception
    BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR';
    END;
-- Start transaction
    SET SESSION TRANSACTION isolation level READ committed;
START TRANSACTION;
--  Dua code vao day cua nhung truong hop lay thong tin san pham!
   SELECT p.*,activePrice(p.ID) as price FROM product p WHERE category=categoryname limit dstart, size;
-- Lỗi
-- Rollback
    commit;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_themFeedback` (`v_name` VARCHAR(100), `v_phone` INT(11), `v_email` VARCHAR(100), `v_content` TEXT)  BEGIN
        INSERT INTO feedback (`name`, `phone`,`email`,`content`)
    VALUES (v_name, v_phone, v_email, v_content);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_themvaoGioHang` (`p_productID` INT(11), `p_orderID` INT(11), `p_quantity` INT(11))  BEGIN
   DECLARE onSell BOOLEAN;
   DECLARE avaiQuantity INT(11);
   SELECT inStock, isAvailable INTO @avaiQuantity, @onSell
   FROM product
   WHERE id = p_productID;
   
   IF (avaiQuantity > 0 AND onSell = TRUE) THEN
   BEGIN
                INSERT INTO `order` VALUES (p_orderID, p_productID, p_quantity);
   END;
   END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_themvaoGioHangtest2` (`p_productID` INT(11), `p_orderID` INT(11), `p_quantity` INT(11))  BEGIN
   

 DECLARE onSell BOOLEAN;
   DECLARE avaiQuantity INT(11);
 DECLARE exit handler FOR sqlexception
    BEGIN
-- ERROR
    ROLLBACK;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR';
    END;
-- Start transaction
    SET SESSION TRANSACTION isolation level SERIALIZABLE;
	START TRANSACTION;
  
   SELECT inStock, isAvailable INTO avaiQuantity, onSell
   FROM product
   WHERE product.`id` = p_productID;
   
   IF (avaiQuantity > 0 AND onSell = TRUE) THEN
   BEGIN
                INSERT INTO order_line VALUES (p_orderID, p_productID, p_quantity);
   END;
   END IF;
   do sleep(10);
   SELECT * FROM order_line o WHERE o.id_order = p_orderID;
   commit; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_thongkeDoanhThu` (IN `startdate` DATE, IN `enddate` DATE, OUT `totalAmounts` DOUBLE)  BEGIN
                -- declare handler
                DECLARE exit handler FOR sqlexception
                BEGIN
                -- ERROR
                ROLLBACK;
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR';
                END;
                -- Start transaction
SET SESSION TRANSACTION isolation level repeatable READ;
                START TRANSACTION;      

SELECT o.id, a.fullname, sumOrderLine(o.id)
                FROM account a, `order` o
                WHERE o.custom_id=a.id AND o.`createdate` >= @startdate  AND o.`createdate`<= @enddate AND o.`sttOrder`=4;
                commit;  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_thongkeDonHang` (`startdate` DATETIME, `enddate` DATETIME, `categoryPD` INT(11))  begin
SELECT  ol.quantity * activePrice(ol.id_product)as total, o.id, o.createdate FROM order_line ol JOIN( SELECT o.id, o.createdate FROM `order` o WHERE o.sttOrder=5 AND o.createdate BETWEEN startdate AND enddate) o ON ol.id_order=o.id WHERE ol.id_product IN
    (SELECT id from product WHERE category=categoryPD);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_thongkeSanPhamDaBan` ()  BEGIN
        SELECT  DISTINCT *
    FROM `product`
    WHERE id IN (SELECT id_product FROM `order_line`);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_thongkeSanPhamTonKho` ()  BEGIN
        SELECT DISTINCT *
    FROM `product`
    WHERE inStock > 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_xacnhanDonHang` (`v_orderID` INT(11))  BEGIN
        DECLARE v_found bool DEFAULT FALSE;
        DECLARE v_productID INT(11);
    DECLARE v_quantity INT(11);
    DECLARE my_cursor cursor FOR
                                                (SELECT _product, o.quantity FROM `order_line` o WHERE _order = v_orderID);
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_found := TRUE;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
                ROLLBACK;
        END;
 
        DECLARE EXIT HANDLER FOR SQLWARNING
        BEGIN
        ROLLBACK;
        END;
    SET SESSION TRANSACTION isolation level READ uncommitted;
        START TRANSACTION;
    OPEN my_cursor;
                my_loop: loop
                        fetch my_cursor INTO v_productID, v_quantity;
                        #kết thúc vòng lặp khi đã duyệt hết bản ghi trên cursor
                        IF v_found THEN leave my_loop;
                        END IF;
                        #Vì đã có TRIGGER test đặt hàng, 1 khi đặt hàng nghĩa là đủ số lượng!
                        UPDATE `product`
                        SET inStock = inStock - v_quantity
                        WHERE id = v_productID;
                END loop my_loop;
        close my_cursor;
 
    COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_xoaGioHang` (`p_orderID` INT(11))  BEGIN
   	DELETE FROM `order_line` WHERE `order_line`.`id_order` = p_orderID;
    DELETE FROM `order` WHERE `order`.`id` = p_orderID; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test_lostupdate_trans1` ()  BEGIN
 
    DECLARE v_inStock INT(11);
        SET SESSION TRANSACTION isolation level READ committed;
        START TRANSACTION;
    SELECT inStock INTO v_inStock
    FROM `product`
    WHERE id= 47;
   
    SELECT sleep(12);
    SET v_inStock = v_inStock - 2;
   
        UPDATE `product`
        SET inStock = v_inStock
        WHERE id = 47;
    COMMIT;
   
    SELECT inStock
    FROM `product`
    WHERE id = 47;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test_lostupdate_trans2` ()  BEGIN
    DECLARE v_inStock INT(11);
    SET SESSION TRANSACTION isolation level READ committed;
        START TRANSACTION;
    SELECT inStock INTO v_inStock
    FROM `product`
    WHERE id=47;
   
    SELECT sleep(3);
    SET v_inStock = v_inStock - 3;
 
   
        UPDATE `product`
        SET inStock = v_inStock
        WHERE id = 47;
   
    COMMIT;
   
        SELECT inStock
    FROM `product`
    WHERE id = 47;
END$$

--
-- Các hàm
--
CREATE DEFINER=`root`@`localhost` FUNCTION `activePrice` (`pdID` INT(11)) RETURNS FLOAT BEGIN
   	
    DECLARE dstartdate, denddate datetime;
    DECLARE dprice float;
    DECLARE done int DEFAULT false;
    DECLARE dnowdate datetime DEFAULT CURRENT_DATE;
     DECLARE cPrilist CURSOR for SELECT  startdate, enddate, price from pricelist WHERE productID = pdID
    order BY priceID DESC;
    
     DECLARE CONTINUE HANDLER FOR NOT FOUND SET done =true;
 
	OPEN cPrilist;
  	My_loop: LOOP
  		FETCH cPrilist INTO dstartdate,denddate, dprice;
    	if done then LEAVE MY_loop;
  		end if;  
            if(dstartdate <=dnowdate AND
                dnowdate <=denddate) THEN
                RETURN dprice;
                LEAVE MY_loop;
              END if;
   	 end LOOP My_loop;
     
     CLOSE cPrilist;    

  RETURN 0;
     
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `priceOfProduct` (`pdID` INT(11), `orderDate` DATETIME) RETURNS FLOAT BEGIN
   	
    DECLARE dstartdate, denddate datetime;
    DECLARE dprice float;
    DECLARE done int DEFAULT false;
    
     DECLARE cPrilist CURSOR for SELECT  startdate, enddate, price from pricelist WHERE productID = pdID
    order BY priceID DESC;
    
     DECLARE CONTINUE HANDLER FOR NOT FOUND SET done =true;
 
	OPEN cPrilist;
  	My_loop: LOOP
  		FETCH cPrilist INTO dstartdate,denddate, dprice;
    	if done then LEAVE MY_loop;
  		end if;  
            if(dstartdate <=@orderDate AND
                @orderDate <=denddate) THEN
                RETURN dprice;
                LEAVE MY_loop;
              END if;
   	 end LOOP My_loop;
     
     CLOSE cPrilist;    

  RETURN 0; 
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `totalAmounts` (`beginDate` DATETIME, `endDate` DATETIME, `categoryPD` INT) RETURNS INT(11) BEGIN  
DECLARE sumOder int DEFAULT 0;
    SELECT sum( ol.quantity * activePrice(ol.id_product)) into sumOder FROM order_line ol WHERE id_order IN( SELECT o.id FROM `order` o WHERE o.sttOrder=5 AND o.createdate BETWEEN beginDate AND endDate) AND ol.id_product IN
    (SELECT id from product WHERE category=categoryPD);
   return sumOder;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
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
-- Đang đổ dữ liệu cho bảng `account`
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
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'cây mini'),
(2, 'cây không khí'),
(3, 'cây handmade');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `phone`, `email`, `content`) VALUES
(1, 'Vũ Hải', 92312493, 'vuhai@gmail.com', 'Là người khá kỹ tính, nên những thứ tôi chọn thường yêu cầu rất cao. Nhưng may mắn thay, tôi mua cây tại đây các bạn tư vấn rất nhiệt tình và khá chi tiết. Hi vọng các bạn sẽ vẫn giữ được sự chuyên nghiệp này, tôi sẽ ủng hộ dài dài.'),
(2, 'Trương Thị', 2039428, 'truong111@gmail.com', 'Tôi yêu hoa cảnh và kinh doanh. Tôi tìm được vườn có nhiều loại cây khá độc và dễ thương. Biết là cạnh tranh nhưng các bạn rất thoải mái tư vấn về kinh doanh và chăm sóc cây. Hi vọng hợp tác dài lâu với vườn.'),
(3, 'Đặng Thị Lệ', 23425436, 'Dangthi32@gmail.com', 'Tôi là người yêu thích cây cảnh, hoa hòe, tìm hoài không biết nên mua cái gì để chưng cho phòng khách cả. Tình cờ tìm được trang web vuoncaymini.com, click vào xem thì quá ư là thích, nó vừa lạ, vừa bé, vừa xinh, không chịu nỗi.'),
(4, 'Chung Phối', 3476546, 'phoi@gmail.com', 'Tôi quyết định trang trí bàn làm việc bằng những cây xanh, mà thấy ở đâu cũng những cây lớn quá cỡ. Được người bạn giới thiệu lên vuoncaymini.com xem. Thế là bàn của tôi không những xinh mà còn sinh động nữa chứ.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `createdate` datetime DEFAULT NULL,
  `custom_id` int(11) DEFAULT NULL,
  `fullname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sttOrder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
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
(30, '2017-08-14 00:00:00', 18, 'cart_cus_18', NULL),
(31, '2017-03-24 00:00:00', 4, 'cart_cus_4', NULL),
(32, '2017-08-29 00:00:00', 10, 'cart_cus_10', NULL),
(33, '2017-01-19 00:00:00', 19, 'cart_cus_19', NULL),
(35, '2018-05-26 17:05:04', 1, NULL, 1),
(36, '2018-06-02 22:51:20', 1, 'a', 5);

--
-- Bẫy `order`
--
DELIMITER $$
CREATE TRIGGER `tg_xacnhanDonHang` AFTER UPDATE ON `order` FOR EACH ROW BEGIN
        DECLARE v_oldSttName VARCHAR(10);
    DECLARE v_newSttName VARCHAR(10);
    DECLARE v_orderID INT(11);
    DECLARE v_productID INT(11);
    DECLARE v_quantity INT(11);
    DECLARE v_count INTEGER;
    DECLARE v_found BOOLEAN;
        #Trường hợp xác nhận từ Cart ---> Draft
        IF (OLD.sttOrder <> NEW.sttOrder) THEN
                BEGIN
                                IF (OLD.sttOrder = 1 AND NEW.sttOrder = 2) THEN
                                BEGIN
                                        DECLARE my_cursor cursor FOR
                                                (SELECT _product, o.quantity FROM `order_line` o WHERE id_order = NEW.ID );
                                        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_found := TRUE;
                                        SET v_count = 0;
                                        OPEN my_cursor;
                                                my_loop: loop
                                                        fetch my_cursor INTO v_productID, v_quantity;
                                                        #kết thúc vòng lặp khi đã duyệt hết bản ghi trên cursor
                                                        IF v_found THEN leave my_loop;
                                                        END IF;
                            #Vì đã có TRIGGER test đặt hàng, 1 khi đặt hàng nghĩa là đủ số lượng!
                                                        CALL capnhat_SoLuongSanPham(v_productID, v_quantity);
                                                        SET v_count = v_count +1;
                                                END loop my_loop;
                                        close my_cursor;
                                END;
                        END IF;
                END;
        END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_line`
--

CREATE TABLE `order_line` (
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_line`
--

INSERT INTO `order_line` (`id_order`, `id_product`, `quantity`) VALUES
(1, 53, 26),
(1, 60, 3),
(2, 58, 12),
(3, 47, 22),
(3, 53, 0),
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
(30, 50, 19),
(31, 48, 1),
(31, 55, 9),
(35, 50, 1),
(36, 50, 3),
(36, 51, 3),
(36, 52, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pricelist`
--

CREATE TABLE `pricelist` (
  `priceID` int(11) NOT NULL,
  `productID` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pricelist`
--

INSERT INTO `pricelist` (`priceID`, `productID`, `price`, `startdate`, `enddate`) VALUES
(1, 66, 109, '2019-04-11', '2019-02-12'),
(2, 66, 109, '2019-04-11', '2019-02-12'),
(3, 60, 159, '2018-04-29', '2019-07-28'),
(4, 60, 364, '2018-08-17', '2019-11-14'),
(5, 56, 316, '2019-01-04', '2018-10-06'),
(6, 57, 162, '2019-07-25', '2019-07-30'),
(7, 52, 410, '2019-08-09', '2019-02-27'),
(8, 48, 315, '2019-05-28', '2018-08-17'),
(9, 65, 321, '2018-11-16', '2019-08-23'),
(10, 64, 399, '2019-02-08', '2018-12-22'),
(11, 48, 58, '2018-12-25', '2018-12-13'),
(12, 67, 282, '2018-07-16', '2019-11-06'),
(13, 56, 325, '2019-01-14', '2018-09-11'),
(14, 58, 60, '2019-08-26', '2018-08-26'),
(15, 61, 166, '2018-06-16', '2019-05-08'),
(16, 62, 239, '2018-05-19', '2019-11-25'),
(17, 52, 276, '2018-10-02', '2019-05-19'),
(18, 51, 298, '2019-06-22', '2019-09-12'),
(19, 69, 396, '2019-01-17', '2018-08-22'),
(20, 48, 157, '2018-05-07', '2019-01-07'),
(21, 56, 208, '2019-09-30', '2019-03-12'),
(22, 66, 491, '2019-05-08', '2019-06-01'),
(23, 59, 490, '2019-05-08', '2019-03-11'),
(24, 64, 467, '2018-06-06', '2018-12-28'),
(25, 59, 400, '2018-05-14', '2019-10-18'),
(26, 63, 121, '2019-01-28', '2018-12-30'),
(27, 51, 381, '2019-05-09', '2019-04-16'),
(28, 69, 389, '2019-09-22', '2019-05-15'),
(29, 59, 53, '2018-05-07', '2018-09-07'),
(30, 50, 50, '2018-06-01', '2018-06-23'),
(31, 69, 100, '2016-05-01', '2018-08-08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
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
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `saleoff`, `category`, `imagiUrl`, `short_descripsion`, `inStock`, `isAvailable`) VALUES
(47, 'Santa Claus Tứ Phương', 0, 3, 'img/mn1.jpg', NULL, 20, 1),
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
(68, 'Cây Môn Nhí Lá Tròn', 10, 1, 'img/cmn7.jpg', NULL, 0, 1),
(69, 'Cây Ngũ Gia Bì', 10, 1, 'img/cmn8.jpg', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sttorder`
--

CREATE TABLE `sttorder` (
  `sttID` int(11) NOT NULL,
  `sttName` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sttorder`
--

INSERT INTO `sttorder` (`sttID`, `sttName`) VALUES
(1, 'onCart'),
(2, 'onDraft'),
(3, 'onPrinting'),
(4, 'onShipping'),
(5, 'paid'),
(6, 'canceled');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_id` (`custom_id`),
  ADD KEY `sttOrder` (`sttOrder`);

--
-- Chỉ mục cho bảng `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`id_order`,`id_product`),
  ADD KEY `id_order` (`id_order`,`id_product`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_order_2` (`id_order`),
  ADD KEY `id_product_2` (`id_product`);

--
-- Chỉ mục cho bảng `pricelist`
--
ALTER TABLE `pricelist`
  ADD PRIMARY KEY (`priceID`),
  ADD KEY `productID` (`productID`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- Chỉ mục cho bảng `sttorder`
--
ALTER TABLE `sttorder`
  ADD PRIMARY KEY (`sttID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `pricelist`
--
ALTER TABLE `pricelist`
  MODIFY `priceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT cho bảng `sttorder`
--
ALTER TABLE `sttorder`
  MODIFY `sttID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`sttOrder`) REFERENCES `sttorder` (`sttID`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`custom_id`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `order_line_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_line_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `pricelist`
--
ALTER TABLE `pricelist`
  ADD CONSTRAINT `pricelist_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
