DROP SCHEMA IF EXISTS `Eshop_application` ;
CREATE SCHEMA IF NOT EXISTS `Eshop_application` ;
USE `Eshop_application`;

CREATE TABLE IF NOT EXISTS `User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `fullname` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `email` VARCHAR(128) NOT NULL,
  `address` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL,
  `phoneNumber` VARCHAR(10) NULL,
  `avatar` VARCHAR(128) NULL,
  `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` BIT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UQ_User_Email` (`email` ASC) VISIBLE,
  UNIQUE INDEX `UQ_User_Username` (`username` ASC) VISIBLE);

INSERT INTO `User`
    (`id`, `username`, `password`, `fullname`, `email`, `avatar`)
VALUES (1, 'TeoNV', '$2a$12$VgqV6LRUPZSeai4LCxa/6uiyJs/1P4y8z2h6Y/e5wFjiTS2c14aTi', 'Nguyễn Văn Tèo',
        'teonv@gmail.com', 'TeoNV.jpeg'),
       (2, 'VietTN', '$2a$12$VgqV6LRUPZSeai4LCxa/6uiyJs/1P4y8z2h6Y/e5wFjiTS2c14aTi', 'Trần Nhật Việt',
        'vietnt@gmail.com', 'VietTN.jpg'),
       (3, 'MaiNT', '$2a$12$VgqV6LRUPZSeai4LCxa/6uiyJs/1P4y8z2h6Y/e5wFjiTS2c14aTi', 'Nguyễn Thị Mai',
        'maint@gmail.com', 'MaiNT.jpg'),
       (4, 'HaiPV', '$2a$12$VgqV6LRUPZSeai4LCxa/6uiyJs/1P4y8z2h6Y/e5wFjiTS2c14aTi', 'Phạm Văn Hải',
        'haipham2001vn@gmail.com', 'haipv.jpg');
     
CREATE TABLE IF NOT EXISTS `Role`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`Id`)
);

INSERT INTO `Role` (`name`) VALUES ('ROLE_ADMIN'), ('ROLE_CUSTOMER');
CREATE TABLE IF NOT EXISTS `Authority`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `userId` INT NOT NULL,
    `roleId` INT NOT NULL,
    PRIMARY KEY(`id`),
	CONSTRAINT `FK_Authority_User`
    FOREIGN KEY (`userId`)
    REFERENCES `User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
	CONSTRAINT `FK_Authority_Role`
    FOREIGN KEY (`roleId`)
    REFERENCES `Role` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO `Authority` (`userId`,`roleId`) VALUES (1,1),(2,1),(3,2),(4,2);
-- ----------------------------------------------------------------------------
-- Table ASM_Java6.User
-- ----------------------------------------------------------------------------

	
-- ----------------------------------------------------------------------------
-- Table ASM_Java6.Category
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET 'utf8mb4' NOT NULL,
  `slug` VARCHAR(50)	 NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `UQ_Category_Slug` (`slug` ASC) VISIBLE);

INSERT INTO `Category`
    (`Id`, `Name`, `Slug`)
VALUES (1, 'Điện thoại', 'phone'),
       (2, 'Máy tính bảng', 'tablet'),
       (3, 'Máy tính xách tay', 'laptop'),
       (4, 'Đồng hồ thông minh', 'smartwatch');
       
-- ----------------------------------------------------------------------------
-- Table ASM_Java6.Discount
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Discount` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET 'utf8mb4' NOT NULL,
  `saleOff` INT NOT NULL,
  `startDate` DATETIME(6) NOT NULL,
  `endDate` DATETIME(6) NOT NULL,
  `active` BIT NOT NULL DEFAULT 0,
  `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`));

INSERT INTO `Discount`
    (`id`, `name`, `saleOff`, `startDate`, `endDate`)
VALUES (1, 'FLASH SALE', 10, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 2 MONTH)),
       (2, 'Khuyến mãi đặc biệt', 20, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 MONTH));

CREATE TABLE IF NOT EXISTS  `ProductStatus`(
	 `id` INT NOT NULL AUTO_INCREMENT,
     `statusName` VARCHAR(50) NOT NULL,
     PRIMARY KEY (`Id`)
);

INSERT INTO `ProductStatus`
    (`id`, `statusName`)
VALUES (1,'Còn Hàng'),
       (2, 'Hết Hàng'),
       (3, 'Ngừng Kinh Doanh');
       
CREATE TABLE IF NOT EXISTS `Product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
  `slug` VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
  `thumbnail` LONGTEXT NOT NULL,
  `description` TEXT CHARACTER SET 'utf8mb4' NOT NULL,
  `quantity` INT NOT NULL,
  `unitPrice` DOUBLE NOT NULL,
  `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `available` INT NOT NULL DEFAULT 0,
  `categoryId` INT NOT NULL,
  `discountId` INT NULL,
  `productStatusId` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UQ_Product_Slug` (`slug` ASC) VISIBLE,
  CONSTRAINT `FK_Product_Category`
    FOREIGN KEY (`categoryId`)
    REFERENCES `Category` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Product_Discount`
    FOREIGN KEY (`discountId`)
    REFERENCES `Discount` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
     CONSTRAINT `FK_Product_ProductStatus`
    FOREIGN KEY (`productStatusId`)
    REFERENCES `ProductStatus` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );

INSERT INTO `Product`
(`id`, `name`, `slug`, `thumbnail`, `description`,
 `quantity`, `unitPrice`, `categoryId`, `discountId`,`productStatusId`)
VALUES 
	-- điện thoại
		(1, 'iPhone 13 Pro Max 512GB', 'iphone-13-pro-max-512gb','https://image.cellphones.com.vn/358x/media/catalog/product/i/p/iphone_13-_pro-5_7.jpg',
        'Mỗi lần ra mắt phiên bản mới là mỗi lần iPhone chiếm sóng trên khắp các mặt trận và lần này cái tên khiến vô số người "sục sôi" là iPhone 13 Pro, chiếc điện thoại thông minh vẫn giữ nguyên thiết kế cao cấp, cụm 3 camera được nâng cấp, cấu hình mạnh mẽ cùng thời lượng pin lớn ấn tượng.',
        1000, 38000000, 1, 1,1),
      (2, 'iPhone 12 Pro Max 512GB', 'iphone-12-pro-max-512gb','https://image.cellphones.com.vn/358x/media/catalog/product/i/p/iphone_12_pro_max_blue.png',
        'Mỗi lần ra mắt phiên bản mới là mỗi lần iPhone chiếm sóng trên khắp các mặt trận và lần này cái tên khiến vô số người "sục sôi" là iPhone 12 Pro, chiếc điện thoại thông minh vẫn giữ nguyên thiết kế cao cấp, cụm 3 camera được nâng cấp, cấu hình mạnh mẽ cùng thời lượng pin lớn ấn tượng.',
        1000, 33000000, 1, 2,1),
		 (3, 'iPhone 11 Pro 512GB', 'iphone-11-pro-512gb','https://image.cellphones.com.vn/358x/media/catalog/product/i/p/iphone-11-pro-gold-select-2019_5.png',
        'Mỗi lần ra mắt phiên bản mới là mỗi lần iPhone chiếm sóng trên khắp các mặt trận và lần này cái tên khiến vô số người "sục sôi" là iPhone 11 Pro, chiếc điện thoại thông minh vẫn giữ nguyên thiết kế cao cấp, cụm 3 camera được nâng cấp, cấu hình mạnh mẽ cùng thời lượng pin lớn ấn tượng.',
        1000, 27000000, 1, 1,1),
		-- ipad
		 (4, 'iPad Pro 12.9 2021 M1 5G 512GB', 'ipad-pro-12-9-2021-5g-512gb','https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-pro-12-9-2021-2_4.jpg',
        'iPad Pro M1 12.9 inch WiFi Cellular 512GB (2021), một chiếc máy tính bảng cao cấp sở hữu loạt công nghệ đột phá như màn hình mini-LED, mạng 5G, vi xử lý Apple M1 cho hiệu năng xử lý vượt trội vượt khỏi giới hạn.',
        1000, 39000000, 2, 2,1),
		(5, 'iPad Air 10.9 2020 4G 256GB', 'ipad-air-4-4g-256gb','https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-air-2020-silver_5.jpg',
        'iPad Air 4 2020 được trang bị công nghệ màn hình Liquid Retina độ phân giải 1640 x 2360 Pixels và có tần số quét đến 60 Hz mang đến chất lượng hiển thị mượt mà, các chuyển động hình ảnh trơn tru hơn, gần như loại bỏ hoàn toàn tình trạng giật lag. Nếu ít sử dụng 4G, bạn có thể tham khảo thêm iPad Air 4 wifi 256Gb để tiết kiệm chi phí.',
        1000, 22000000, 2, null,1),
		(6, 'iPad mini 6 4G 256GB', 'ipad-mini-6-4g-256gb','https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-mini-6-5_3.jpg',
        'Apple iPad mini 6 4G 256GB là sản phẩm iPad mini 2021 Apple giới thiệu đến toàn thể công chúng. Phiên bản này cung cấp hình thức kết nối Wifi và cả 4G, rất thuận tiện sử dụng ở bất kỳ nơi đâu. Máy có dung lượng lớn thích hợp lưu trữ nhiều dữ liệu',
        1000, 22800000, 2, null,1),
		-- laptop
		(7, 'MacBook Air M1 16GB 512GB 2020', 'macbook-air-2020-m1-16gb-512gb','https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-mini-6-5_3.jpg',
        'Macbook Air M1 2020 bản RAM 16GB và bộ nhớ 512GB được trang bị màn hình 13.3 inch với độ phân giải 2560 x 1600 pixels. Máy được cung cấp sức mạnh bởi con chip M1 mới nhất của Apple với 8 nhân, bao gồm 4 nhân hiệu suất cao và 4 nhân hiệu suất thấp. Theo công bố của Apple, vi xử lý này mạnh hơn đến 98% so với những chiếc laptop Windows và hiệu năng vượt trội hơn so với những chiếc Macbook Air chạy chip Intel.',
        1000, 37000000, 3, null,1),
		(8, 'Macbook Pro M1 Pro 16 10 CPU - 16 GPU 16GB 1TB 2021', 'macbook-pro-16-inch-2021-1tb','https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-mini-6-5_3.jpg',
        'Macbook Pro 16 inch 2021 được trang bị chip Apple M1 Pro với 10CPU, 16GPU kết hợp dung lượng RAM 16GB và bộ nhớ SSD 1TB mang lại sức mạnh vượt trội. Đây là sản phẩm chính hãng Apple Việt Nam được bảo hành 12 tháng',
        1000, 70990000, 3, null,1),
		-- đồng hồ
		(9, 'Apple Watch Series 7 45mm (4G) Viền thép dây thép', 'apple-watch-series-7-45mm-4g-vien-thep-day-thep','https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-mini-6-5_3.jpg',
        'Apple Watch Series 7 45mm (4G). Phiên bản này không chỉ được nâng cấp tiện ích mà còn sang trọng hơn với viền và dây làm từ thép. Thông tin bí ẩn mới nhất của Apple Watch được bật mí dưới đây!',
        1000, 21500000, 4, null,1),
		(10, 'Apple Watch Series 6 44mm (4G) Viền Thép Dây Thép', 'apple-watch-series-6-44mm-4g-vien-thep-day-thep','https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-mini-6-5_3.jpg',
        'Hỗ trợ tính năng đo nhịp tim và nhiều chế độ sức khỏe khác nhau, Apple Watch S6 44mm 4G viền thép dây thép là chiếc đồng hồ thông minh sang trọng phù hợp cho các iFan lẫn vận động viên thể thao. Sự bổ sung dây đeo bằng thép càng làm tăng thêm vẻ sang trọng cho chiếc smartwatch này.',
        1000, 16590000, 4, null,1),
		(11, 'Apple Watch SE 44mm (4G) Viền Nhôm - Dây Vải', 'apple-watch-se-44mm-4g','https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-mini-6-5_3.jpg',
        'Đầu tiên khi nhắc đến chiếc đồng hồ Apple Watch SE 44mm mọi người sẽ vô cùng thích thú với chất liệu mà nhà sản xuất đưa vào cho nó. Với viền nhôm và dây cao su cực kỳ chất lượng, giúp chiếc đồng hồ trở nên sang trọng và vô cùng bền bỉ, sử dụng bền lâu.',
        1000, 8400000, 4, null,1);

CREATE TABLE IF NOT EXISTS  `ProductImage`(
	 `id` INT NOT NULL AUTO_INCREMENT,
     `productId` INT NOT NULL,
     `image` LONGTEXT NOT NULL,
	CONSTRAINT `FK_ProductImage_Product`
    FOREIGN KEY (`productId`)
    REFERENCES `Product` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
     PRIMARY KEY (`Id`)
);

INSERT INTO `ProductImage`
(`productId`,`image`)
VALUES(1,'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/iphone_13-_pro-5_7.jpg'),
		(1,'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/iphone_13-_pro-5_4_1_1.jpg'),
        (1,'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/iphone_13-_pro-3_5.jpg'),
        (1,'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/iphone_13-_pro-2_1_4.jpg');
        
--                 'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/iphone_12_pro_max_blue.png',
-- 		'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/iphone-12-pro-max_3__6.jpg',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2020-10-13_22-12-43.jpg_1_7_2.png',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/p/h/photo_2020-10-13_22-12-33.jpg_1_8.png',
--         
--                'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/iphone-11-pro-gold-select-2019_5.png',
-- 		'https://image.cellphones.com.vn/358x/media/catalog/product/l/a/layer_22_2.jpg',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/l/a/layer_25_2.jpg',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/l/a/layer_23_2.jpg',
--         
--               'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-pro-12-9-2021-2_4.jpg',
-- 		'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-pro-12-9-2021-2_2_1_1_1_1_1_1.jpg',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-pro-12-9-2021-1_2_1_1_1_1_1_1_1.jpg',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-pro-12-9-2021-2_4.jpg',
--         
--                 'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-air-2020-silver_5.jpg',
-- 		'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-air-2020-green_5.jpg',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-air-2020-blue_4.jpg',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-air-2020-pink_4.jpg',
--         
--               'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-mini-6-5_3.jpg',
-- 		'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-mini-6-1_3.jpg',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-mini-6-01_3.jpg',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/i/p/ipad-mini-6-04_3.jpg',
--         
--                 'https://image.cellphones.com.vn/358x/media/catalog/product/m/a/macbook-air-silver-select-201810_2_1.jpg',
-- 		'https://image.cellphones.com.vn/358x/media/catalog/product/_/0/_0003_macbook-air-gallery4-20201110_1_1.jpg',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/_/0/_0001_macbook-air-gallery2-20201110_1_1.jpg',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/_/0/_0003_dsc03720_4.jpg',
--         
--                 'https://image.cellphones.com.vn/358x/media/catalog/product/m/a/macbook-pro-2021-05_4_1.jpg',
-- 		'https://image.cellphones.com.vn/358x/media/catalog/product/m/a/macbook-pro-2021-004_2.jpg',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/m/a/macbook-pro-2021-003_2.jpg',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/m/a/macbook-pro-2021-001_2.jpg',
--         
--          'https://image.cellphones.com.vn/358x/media/catalog/product/a/p/apple_watch_series_7_cellular_41mm_silver_stainless_steel_silver_milanese_loop_34fr_screen__usen_copy_1.jpg',
-- 		'https://image.cellphones.com.vn/358x/media/catalog/product/s/e/series_7_45mm.jpg',
-- 		'https://image.cellphones.com.vn/358x/media/catalog/product/a/p/apple_watch_series_7_cellular_41mm_graphite_stainless_steel_graphite_milanese_loop_34fr_screen__usen_copy_1_1.jpg',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/a/p/apple_watch_series_7_cellular_41mm_gold_stainless_steel_gold_milanese_loop_34fr_screen__usen_copy_1.jpg',
--         
--                 'https://image.cellphones.com.vn/358x/media/catalog/product/a/p/apple-watch-series-6-44mm-4g-vien-thep-day-thep-1_1_1_3.jpg',
-- 		'https://image.cellphones.com.vn/358x/media/catalog/product/a/p/apple-watch-series-6-44mm-4g-vien-thep-day-thep-3_1.jpg',
-- 		'https://image.cellphones.com.vn/358x/media/catalog/product/a/p/apple-watch-series-6-44mm-4g-vien-thep-day-thep-2_1.jpg',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/a/p/apple-watch-series-6-44mm-4g-vien-thep-bac-day-thep_2__2_1.jpg',
--         
--                 'https://image.cellphones.com.vn/358x/media/catalog/product/d/o/download_2__1_20.png',
-- 		'https://image.cellphones.com.vn/358x/media/catalog/product/a/p/apple-watch-se-44mm-4g-1_1_2.jpg',
-- 		'https://image.cellphones.com.vn/358x/media/catalog/product/d/o/download_1__2_19.png',
--         'https://image.cellphones.com.vn/358x/media/catalog/product/d/o/download_2_27.png',
CREATE TABLE IF NOT EXISTS `Cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `productId` INT NOT NULL,
  `quantity` INT NULL DEFAULT 1,
  `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_Cart_User`
    FOREIGN KEY (`userId`)
    REFERENCES `User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Cart_Product`
    FOREIGN KEY (`productId`)
    REFERENCES `Product` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table ASM_Java6.Order
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `orderCode` VARCHAR(11) NOT NULL,
  `userId` INT NOT NULL,
  `createDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` INT NOT NULL DEFAULT 0,
  `fullname` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `address` VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
  `email` VARCHAR(128) NOT NULL,
  `phoneNumber` VARCHAR(10) NOT NULL,
  `totalUnitPrice` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UQ_Order_OrderCode` (`orderCode` ASC) VISIBLE,
  CONSTRAINT `FK_Order_User`
    FOREIGN KEY (`userId`)
    REFERENCES `User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table ASM_Java6.OrderDetails
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `orderDetails` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `orderId` INT NOT NULL,
  `productId` INT NOT NULL,
  `quantity` INT NOT NULL,
  `TotalUnitPrice` DOUBLE NOT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK__OrderDetails__Order`
    FOREIGN KEY (`OrderId`)
    REFERENCES `Order` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_OrderDetails_Product`
    FOREIGN KEY (`productId`)
    REFERENCES `Product` (`Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
SET FOREIGN_KEY_CHECKS = 1;


