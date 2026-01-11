/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : book_store

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 11/01/2026 14:21:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cart_user`(`userId` ASC) USING BTREE,
  CONSTRAINT `fk_cart_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 4, '2021-12-30 15:39:19', NULL);
INSERT INTO `cart` VALUES (2, 5, '2021-12-18 20:35:59', NULL);

-- ----------------------------
-- Table structure for cart_item
-- ----------------------------
DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE `cart_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cartId` bigint NOT NULL,
  `productId` bigint NOT NULL,
  `quantity` smallint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_cartId_productId`(`cartId` ASC, `productId` ASC) USING BTREE,
  INDEX `idx_cart_item_cart`(`cartId` ASC) USING BTREE,
  INDEX `idx_cart_item_product`(`productId` ASC) USING BTREE,
  CONSTRAINT `fk_cart_item_cart` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_item_product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart_item
-- ----------------------------
INSERT INTO `cart_item` VALUES (1, 2, 55, 3, '2021-07-13 10:21:51', NULL);
INSERT INTO `cart_item` VALUES (2, 2, 36, 2, '2021-07-05 07:21:45', NULL);
INSERT INTO `cart_item` VALUES (3, 1, 7, 3, '2021-04-14 19:36:26', NULL);
INSERT INTO `cart_item` VALUES (4, 1, 70, 2, '2021-02-20 18:51:20', NULL);
INSERT INTO `cart_item` VALUES (5, 1, 27, 4, '2021-11-24 00:05:40', NULL);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Lịch sử , truyền thống', 'history-tradition');
INSERT INTO `categories` VALUES (2, 'Văn học Việt Nam', 'vietnamese-literature');
INSERT INTO `categories` VALUES (3, 'Văn học nước ngoài', 'foreign-literature');
INSERT INTO `categories` VALUES (4, 'Kiến thức - khoa học', 'knowledge - science');
INSERT INTO `categories` VALUES (5, 'Tâm lý học', 'psychology');
INSERT INTO `categories` VALUES (6, 'Kinh tế', 'economics');
INSERT INTO `categories` VALUES (7, 'Sách giáo khoa, tham khảo', 'textbook');
INSERT INTO `categories` VALUES (8, 'Truyện tranh', 'comic');
INSERT INTO `categories` VALUES (9, 'Manga', 'manga');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `imageName` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Sách giáo khoa', 'Cillum nulla non Lorem ut irure fugiat veniam deserunt do.', 'sach-giao-khoa.jpg');
INSERT INTO `category` VALUES (2, 'Sách khoa học', 'Aliqua exercitation ea sint do.', 'sach-khoa-hoc.png');
INSERT INTO `category` VALUES (3, 'Truyện tranh', 'Cillum laboris et nulla nostrud duis consectetur labore cupidatat minim proident.', 'truyen-tranh.png');
INSERT INTO `category` VALUES (4, 'Tiểu thuyết', 'Enim dolore cupidatat tempor sunt amet veniam aute officia est officia.', 'tieu-thuyet.png');
INSERT INTO `category` VALUES (5, 'Truyện ngắn', 'Dolor in pariatur aliqua dolore ea cillum ut consectetur tempor do eu incididunt est.', 'truyen-ngan.png');
INSERT INTO `category` VALUES (6, 'Truyện dài', 'Eiusmod adipisicing consectetur occaecat culpa in ullamco labore velit magna.', 'truyen-dai.png');
INSERT INTO `category` VALUES (7, 'Sách giáo trình', 'In officia ex magna commodo ullamco in magna incididunt esse mollit enim consectetur laboris.', 'sach-giao-trinh.png');
INSERT INTO `category` VALUES (8, 'Báo in', 'Laborum in elit ullamco pariatur laborum magna veniam nostrud eu anim irure deserunt ad sunt.', 'bao-in.png');
INSERT INTO `category` VALUES (9, 'Tạp chí', 'Excepteur qui commodo sint sint irure sunt sunt in nostrud.', 'tap-chi.png');
INSERT INTO `category` VALUES (10, 'Tập san', 'Elit amet proident et cupidatat in eu quis velit tempor sunt labore aute et.', 'tap-san.png');
INSERT INTO `category` VALUES (11, 'Sách nấu ăn', 'Consequat anim officia aute eiusmod dolor.', 'nau-an.png');
INSERT INTO `category` VALUES (12, 'Sách kỹ thuật', 'Veniam pariatur deserunt ea non voluptate sunt do culpa elit esse.', 'sach-ky-thuat.png');
INSERT INTO `category` VALUES (13, 'Sách nông nghiệp', 'Minim deserunt aute ipsum duis ea eiusmod aute sint sint ut.', 'sach-nong-nghiep.png');
INSERT INTO `category` VALUES (14, 'Sách thiếu nhi', 'Ex eu ad adipisicing magna tempor occaecat id cupidatat dolor dolor aliquip dolore.', 'sach-thieu-nhi.png');
INSERT INTO `category` VALUES (15, 'Sách kỹ năng sống', 'Ad exercitation anim in magna qui ipsum ipsum proident magna.', 'sach-ky-nang-song.png');

-- ----------------------------
-- Table structure for forget_password_tokens
-- ----------------------------
DROP TABLE IF EXISTS `forget_password_tokens`;
CREATE TABLE `forget_password_tokens`  (
  `token_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `expiry_time` datetime NULL DEFAULT NULL,
  `is_used` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`token_id`) USING BTREE,
  UNIQUE INDEX `token`(`token` ASC) USING BTREE,
  INDEX `idx_user_fpt`(`user_id` ASC, `expiry_time` ASC) USING BTREE,
  CONSTRAINT `fk_user_fpt` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of forget_password_tokens
-- ----------------------------
INSERT INTO `forget_password_tokens` VALUES (1, 3, '0ec24568-0f87-46b4-b88a-0e2219d0f1c6', '2026-01-10 00:04:31', 0);
INSERT INTO `forget_password_tokens` VALUES (2, 3, 'c05dc848-5af1-43ba-8950-e42d9f8149f3', '2026-01-10 00:04:44', 0);
INSERT INTO `forget_password_tokens` VALUES (3, 3, '5bb6669b-8e5e-4224-a000-cff8685239d3', '2026-01-10 00:12:39', 0);
INSERT INTO `forget_password_tokens` VALUES (4, 3, 'ed3e1ef2-8017-45f4-9ddf-d13f01e893b4', '2026-01-10 00:32:38', 0);
INSERT INTO `forget_password_tokens` VALUES (5, 3, '11fbd22a-12ce-42fe-9b95-800ca0552b71', '2026-01-10 00:40:15', 0);
INSERT INTO `forget_password_tokens` VALUES (6, 3, '00d460d0-cd89-4dce-866e-fbc8f31faec6', '2026-01-10 00:42:30', 0);
INSERT INTO `forget_password_tokens` VALUES (7, 3, 'ec834269-93da-4c0c-9e30-bb69a13caf6b', '2026-01-10 00:42:43', 0);
INSERT INTO `forget_password_tokens` VALUES (8, 3, 'e9ae3941-b167-450f-9049-784061e3d713', '2026-01-10 13:44:56', 0);
INSERT INTO `forget_password_tokens` VALUES (9, 3, 'f2a16577-0a33-4d80-a4ed-32ee9af5a31c', '2026-01-10 16:42:51', 0);
INSERT INTO `forget_password_tokens` VALUES (10, 3, '99870fd3-1c87-49d7-9aaa-7b2d357abe72', '2026-01-10 16:48:35', 0);
INSERT INTO `forget_password_tokens` VALUES (11, 3, 'd1a0b9bf-2bf5-4d71-ad34-5f802dff68d5', '2026-01-10 16:49:23', 0);
INSERT INTO `forget_password_tokens` VALUES (12, 3, 'fdf44c34-ced8-4c9e-8582-ac7de43d40a3', '2026-01-10 16:54:07', 0);
INSERT INTO `forget_password_tokens` VALUES (13, 3, 'f062e7c4-53f4-4783-abee-18e14c047671', '2026-01-10 16:54:22', 0);
INSERT INTO `forget_password_tokens` VALUES (14, 3, '8a26cbe4-ae38-4547-8e9e-c4f414a4ce61', '2026-01-10 16:59:33', 0);
INSERT INTO `forget_password_tokens` VALUES (15, 3, 'f852c2f2-42d0-4dce-9f02-d63b67d89a3c', '2026-01-10 16:59:36', 0);
INSERT INTO `forget_password_tokens` VALUES (16, 3, 'f39ad80d-0f39-4c2c-ae15-c3e829155466', '2026-01-10 17:02:50', 0);
INSERT INTO `forget_password_tokens` VALUES (17, 3, '89a2732b-af66-4f41-9978-11d40df1326d', '2026-01-10 17:02:53', 0);
INSERT INTO `forget_password_tokens` VALUES (18, 3, 'bb239666-521c-49b3-8c14-9077a655e1d4', '2026-01-10 17:05:51', 0);
INSERT INTO `forget_password_tokens` VALUES (19, 3, '7808eb07-55fb-43bc-a530-7abc504ec2ca', '2026-01-10 17:05:57', 0);
INSERT INTO `forget_password_tokens` VALUES (20, 3, 'de88b35f-cdfe-4fa4-81df-30f34c9eb121', '2026-01-10 17:06:02', 0);
INSERT INTO `forget_password_tokens` VALUES (21, 3, '2063a343-b425-4a8a-a7a6-fa47f59a92c9', '2026-01-10 17:08:31', 0);
INSERT INTO `forget_password_tokens` VALUES (22, 3, '79d5979b-0909-4c42-b169-460258d04ef6', '2026-01-10 17:13:03', 0);
INSERT INTO `forget_password_tokens` VALUES (23, 3, 'd57c6195-af29-4975-927d-dddbb084504a', '2026-01-10 17:17:18', 0);
INSERT INTO `forget_password_tokens` VALUES (24, 3, 'a58e70a1-cedc-4de8-adc5-24c0362e8d84', '2026-01-10 17:17:50', 0);
INSERT INTO `forget_password_tokens` VALUES (25, 3, '9ed48ac8-978d-498e-a7cc-dc26c75b88e2', '2026-01-10 17:18:03', 0);
INSERT INTO `forget_password_tokens` VALUES (26, 3, 'bd7ae2e6-e68c-42f6-b269-099a6f278adb', '2026-01-10 17:18:18', 0);
INSERT INTO `forget_password_tokens` VALUES (27, 3, 'de2218ed-a7cb-45d5-b7cc-aaf6d7f70cb0', '2026-01-10 17:18:21', 0);
INSERT INTO `forget_password_tokens` VALUES (28, 3, 'ba601145-021b-4104-b2ec-a56d6b4a9538', '2026-01-10 17:19:54', 0);
INSERT INTO `forget_password_tokens` VALUES (29, 3, 'cbf57285-27c2-4842-b03c-1dbc409be695', '2026-01-10 17:20:00', 0);
INSERT INTO `forget_password_tokens` VALUES (30, 3, '21cf21bd-82ec-434a-894c-043d1490c3e2', '2026-01-10 17:20:08', 0);

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderId` bigint NOT NULL,
  `productId` bigint NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL,
  `quantity` smallint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_item_orders`(`orderId` ASC) USING BTREE,
  INDEX `idx_order_item_product`(`productId` ASC) USING BTREE,
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES (1, 1, 78, 286587, 0, 4, '2021-06-27 03:11:05', NULL);
INSERT INTO `order_item` VALUES (2, 2, 21, 29619, 0, 2, '2021-03-26 10:39:47', NULL);
INSERT INTO `order_item` VALUES (3, 3, 69, 299814, 0, 4, '2021-07-31 12:54:03', NULL);
INSERT INTO `order_item` VALUES (4, 4, 2, 181582, 0, 5, '2021-07-15 11:58:11', NULL);
INSERT INTO `order_item` VALUES (5, 5, 79, 355067, 20, 1, '2021-08-28 20:28:16', NULL);
INSERT INTO `order_item` VALUES (6, 6, 41, 116744, 0, 1, '2021-04-09 09:53:33', NULL);
INSERT INTO `order_item` VALUES (7, 7, 3, 276065, 20, 5, '2021-08-16 21:48:06', NULL);
INSERT INTO `order_item` VALUES (8, 8, 87, 421713, 20, 5, '2021-05-15 09:36:10', NULL);
INSERT INTO `order_item` VALUES (9, 9, 90, 480454, 20, 3, '2021-09-18 01:58:18', NULL);
INSERT INTO `order_item` VALUES (10, 10, 82, 280519, 0, 4, '2022-01-08 19:44:56', NULL);
INSERT INTO `order_item` VALUES (11, 11, 22, 422703, 20, 1, '2021-12-01 00:24:12', NULL);
INSERT INTO `order_item` VALUES (12, 12, 99, 89288, 0, 4, '2021-11-14 20:04:04', NULL);
INSERT INTO `order_item` VALUES (13, 13, 52, 192906, 0, 1, '2021-04-08 04:50:44', NULL);
INSERT INTO `order_item` VALUES (14, 14, 84, 380080, 0, 2, '2021-03-02 10:40:10', NULL);
INSERT INTO `order_item` VALUES (15, 15, 5, 274595, 20, 2, '2021-10-24 21:14:35', NULL);
INSERT INTO `order_item` VALUES (16, 16, 14, 51752, 0, 2, '2021-04-03 00:40:34', NULL);
INSERT INTO `order_item` VALUES (17, 17, 20, 61648, 20, 4, '2021-04-23 14:29:56', NULL);
INSERT INTO `order_item` VALUES (18, 18, 42, 252357, 20, 3, '2021-07-12 06:02:37', NULL);
INSERT INTO `order_item` VALUES (19, 19, 3, 230576, 0, 2, '2021-08-15 14:07:26', NULL);
INSERT INTO `order_item` VALUES (20, 20, 12, 186136, 0, 5, '2021-03-10 07:43:13', NULL);
INSERT INTO `order_item` VALUES (21, 21, 88, 237111, 0, 1, '2021-02-28 12:28:58', NULL);
INSERT INTO `order_item` VALUES (22, 22, 17, 418046, 20, 2, '2021-09-24 05:09:52', NULL);
INSERT INTO `order_item` VALUES (23, 23, 59, 104758, 20, 2, '2021-10-25 00:07:51', NULL);
INSERT INTO `order_item` VALUES (24, 24, 79, 392777, 20, 4, '2021-04-01 10:27:29', NULL);
INSERT INTO `order_item` VALUES (25, 25, 38, 51737, 20, 2, '2021-07-30 23:59:07', NULL);
INSERT INTO `order_item` VALUES (26, 1, 17, 403668, 20, 2, '2022-01-28 21:29:04', NULL);
INSERT INTO `order_item` VALUES (27, 2, 38, 273634, 0, 2, '2021-11-30 09:11:39', NULL);
INSERT INTO `order_item` VALUES (28, 3, 64, 317689, 0, 3, '2021-10-27 02:40:41', NULL);
INSERT INTO `order_item` VALUES (29, 4, 23, 462258, 0, 3, '2021-10-04 19:29:23', NULL);
INSERT INTO `order_item` VALUES (30, 5, 11, 213435, 0, 5, '2021-09-01 11:27:24', NULL);
INSERT INTO `order_item` VALUES (31, 6, 74, 392247, 0, 1, '2021-07-09 01:32:06', NULL);
INSERT INTO `order_item` VALUES (32, 7, 53, 295299, 0, 5, '2021-06-08 11:39:39', NULL);
INSERT INTO `order_item` VALUES (33, 8, 8, 20188, 0, 3, '2021-10-26 01:08:36', NULL);
INSERT INTO `order_item` VALUES (34, 9, 100, 328695, 20, 1, '2021-05-14 14:49:13', NULL);
INSERT INTO `order_item` VALUES (35, 10, 42, 404011, 0, 5, '2021-05-08 19:44:21', NULL);
INSERT INTO `order_item` VALUES (36, 11, 91, 452099, 0, 3, '2021-02-14 19:16:30', NULL);
INSERT INTO `order_item` VALUES (37, 12, 31, 80569, 0, 2, '2021-05-05 11:50:48', NULL);
INSERT INTO `order_item` VALUES (38, 13, 66, 124475, 20, 3, '2021-10-02 20:23:16', NULL);
INSERT INTO `order_item` VALUES (39, 14, 65, 27199, 0, 3, '2021-03-29 10:56:01', NULL);
INSERT INTO `order_item` VALUES (40, 15, 64, 126431, 20, 5, '2021-08-12 23:40:45', NULL);
INSERT INTO `order_item` VALUES (41, 16, 59, 214278, 0, 2, '2021-12-30 18:44:16', NULL);
INSERT INTO `order_item` VALUES (42, 17, 86, 263745, 20, 1, '2021-12-16 11:12:31', NULL);
INSERT INTO `order_item` VALUES (43, 18, 93, 56211, 20, 5, '2021-02-24 23:23:00', NULL);
INSERT INTO `order_item` VALUES (44, 19, 79, 205863, 20, 3, '2021-04-21 02:42:36', NULL);
INSERT INTO `order_item` VALUES (45, 20, 33, 31030, 0, 5, '2021-12-19 15:20:50', NULL);
INSERT INTO `order_item` VALUES (46, 21, 59, 169677, 20, 2, '2021-09-11 11:09:16', NULL);
INSERT INTO `order_item` VALUES (47, 22, 6, 244525, 0, 1, '2021-08-23 10:28:37', NULL);
INSERT INTO `order_item` VALUES (48, 23, 73, 116237, 20, 4, '2021-12-14 14:20:58', NULL);
INSERT INTO `order_item` VALUES (49, 24, 22, 258094, 0, 4, '2021-07-08 08:20:25', NULL);
INSERT INTO `order_item` VALUES (50, 25, 82, 489571, 0, 1, '2021-06-20 09:29:40', NULL);
INSERT INTO `order_item` VALUES (51, 1, 60, 327711, 20, 4, '2021-09-25 05:43:46', NULL);
INSERT INTO `order_item` VALUES (52, 2, 8, 400758, 0, 5, '2021-02-20 15:50:49', NULL);
INSERT INTO `order_item` VALUES (53, 3, 78, 216374, 20, 4, '2022-01-12 07:10:44', NULL);
INSERT INTO `order_item` VALUES (54, 4, 46, 380038, 0, 2, '2021-04-28 19:42:30', NULL);
INSERT INTO `order_item` VALUES (55, 5, 4, 268748, 20, 2, '2021-10-02 12:30:30', NULL);
INSERT INTO `order_item` VALUES (56, 6, 64, 408961, 0, 1, '2021-11-21 10:28:47', NULL);
INSERT INTO `order_item` VALUES (57, 7, 36, 465049, 0, 4, '2021-09-20 11:29:11', NULL);
INSERT INTO `order_item` VALUES (58, 8, 96, 342387, 0, 1, '2021-08-19 10:15:44', NULL);
INSERT INTO `order_item` VALUES (59, 9, 52, 38093, 0, 1, '2021-03-07 08:17:41', NULL);
INSERT INTO `order_item` VALUES (60, 10, 8, 230558, 0, 3, '2021-04-26 06:53:11', NULL);
INSERT INTO `order_item` VALUES (61, 26, 78, 104405, 0, 3, '2025-12-23 14:59:12', NULL);
INSERT INTO `order_item` VALUES (62, 27, 2, 26228, 0, 1, '2025-12-25 21:27:58', NULL);
INSERT INTO `order_item` VALUES (63, 28, 52, 349335, 20, 1, '2025-12-25 21:53:28', NULL);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint NOT NULL,
  `status` tinyint NOT NULL,
  `deliveryMethod` tinyint NOT NULL,
  `deliveryPrice` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_orders_user`(`userId` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 4, 3, 1, 10000, '2021-12-01 08:34:38', NULL);
INSERT INTO `orders` VALUES (2, 5, 2, 2, 50000, '2021-07-05 10:52:51', NULL);
INSERT INTO `orders` VALUES (3, 4, 1, 1, 10000, '2021-10-11 09:15:13', NULL);
INSERT INTO `orders` VALUES (4, 5, 3, 2, 50000, '2022-01-06 15:05:11', NULL);
INSERT INTO `orders` VALUES (5, 4, 2, 1, 10000, '2021-09-25 14:06:36', NULL);
INSERT INTO `orders` VALUES (6, 4, 3, 2, 50000, '2021-09-18 02:22:12', NULL);
INSERT INTO `orders` VALUES (7, 5, 1, 1, 10000, '2021-04-08 15:13:25', NULL);
INSERT INTO `orders` VALUES (8, 4, 3, 2, 50000, '2021-04-06 22:47:57', NULL);
INSERT INTO `orders` VALUES (9, 5, 3, 1, 10000, '2021-04-03 11:40:27', NULL);
INSERT INTO `orders` VALUES (10, 4, 2, 2, 50000, '2021-10-22 15:49:15', NULL);
INSERT INTO `orders` VALUES (11, 5, 2, 1, 10000, '2021-03-29 01:04:10', NULL);
INSERT INTO `orders` VALUES (12, 4, 2, 2, 50000, '2021-06-11 15:01:12', NULL);
INSERT INTO `orders` VALUES (13, 4, 3, 1, 10000, '2021-03-10 04:45:49', NULL);
INSERT INTO `orders` VALUES (14, 5, 1, 2, 50000, '2021-12-06 11:32:16', NULL);
INSERT INTO `orders` VALUES (15, 4, 3, 1, 10000, '2021-07-01 07:11:33', NULL);
INSERT INTO `orders` VALUES (16, 5, 3, 2, 50000, '2021-10-24 17:39:58', NULL);
INSERT INTO `orders` VALUES (17, 4, 1, 1, 10000, '2021-02-17 19:18:55', NULL);
INSERT INTO `orders` VALUES (18, 4, 3, 2, 50000, '2021-09-12 00:13:50', NULL);
INSERT INTO `orders` VALUES (19, 4, 2, 1, 10000, '2021-02-18 11:26:18', NULL);
INSERT INTO `orders` VALUES (20, 5, 1, 2, 50000, '2021-04-12 02:25:34', NULL);
INSERT INTO `orders` VALUES (21, 4, 1, 1, 10000, '2021-12-17 08:21:32', NULL);
INSERT INTO `orders` VALUES (22, 5, 1, 2, 50000, '2022-01-28 16:19:00', NULL);
INSERT INTO `orders` VALUES (23, 4, 1, 1, 10000, '2021-04-14 09:36:21', NULL);
INSERT INTO `orders` VALUES (24, 5, 1, 2, 50000, '2021-04-05 19:56:13', NULL);
INSERT INTO `orders` VALUES (25, 4, 2, 1, 10000, '2021-12-08 17:07:23', NULL);
INSERT INTO `orders` VALUES (26, 6, 1, 1, 15000, '2025-12-23 14:59:12', '2025-12-25 21:51:15');
INSERT INTO `orders` VALUES (27, 6, 1, 2, 50000, '2025-12-25 21:27:58', '2025-12-30 12:00:56');
INSERT INTO `orders` VALUES (28, 1, 1, 1, 15000, '2025-12-25 21:53:28', '2026-01-02 14:25:23');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL,
  `quantity` smallint NOT NULL,
  `totalBuy` smallint NOT NULL,
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages` smallint NOT NULL,
  `publisher` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `yearPublishing` year NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `imageName` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shop` bit(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NULL DEFAULT NULL,
  `startsAt` datetime NULL DEFAULT NULL,
  `endsAt` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Sách Toyletry', 466183, 0, 86, 86, 'Stafford Hayden', 250, 'NXB Giáo dục', 2013, 'Consequat cupidatat magna nostrud ullamco non commodo esse. Veniam anim ipsum duis cillum cillum exercitation deserunt irure sint eiusmod. Duis consectetur adipisicing aliquip magna eiusmod ullamco ut ad ipsum nostrud dolore id. Ex ullamco nulla Lorem consequat sunt exercitation cillum adipisicing.\r\nProident labore ut qui esse cupidatat deserunt occaecat dolor in. Ad nulla reprehenderit pariatur esse enim ullamco do incididunt anim do excepteur est dolore excepteur. Laboris voluptate cupidatat anim dolore eiusmod in id fugiat est cupidatat pariatur mollit. Mollit irure proident enim consequat irure ipsum proident amet aliqua. Irure ad dolore laboris elit reprehenderit officia ex.\r\n', 'temp-10075522682831764585.jpg', b'0', '2021-03-23 08:22:50', NULL, NULL, NULL);
INSERT INTO `product` VALUES (2, 'Sách Sultrax', 26228, 0, 23, 60, 'Diane Nguyen', 305, 'NXB Đại học Sư phạm TP.HCM', 2011, 'Ipsum consequat reprehenderit amet ullamco dolore consectetur non eiusmod dolor irure sit. Lorem nulla officia dolore officia laboris. Excepteur anim consectetur reprehenderit duis duis ea nostrud. Reprehenderit consequat cupidatat enim ea eiusmod nisi. Mollit veniam quis est ex elit proident tempor pariatur sit aute. Eu Lorem irure sunt sit aute nostrud culpa. Voluptate enim sit dolor laborum est nulla eiusmod eu laborum Lorem laborum.\r\nPariatur id proident laborum consectetur pariatur deserunt quis tempor excepteur non tempor. Sit tempor irure id fugiat occaecat. Ex ut veniam nostrud sunt dolore. Veniam cillum incididunt enim tempor ut amet do est pariatur aliqua labore.\r\n', 'temp-17624438115898823949.jpg', b'1', '2021-12-19 15:03:05', NULL, NULL, NULL);
INSERT INTO `product` VALUES (3, 'Sách Medcom', 294114, 20, 68, 116, 'Byrd Collier', 457, 'NXB Đại học Sư phạm TP.HCM', 2003, 'Cupidatat ipsum ea laborum nisi veniam nulla dolor labore excepteur ad eu. Commodo Lorem esse veniam sunt in. Voluptate amet commodo est commodo ipsum excepteur aliqua voluptate amet. Sunt elit ut esse proident irure tempor velit quis eu cupidatat pariatur duis ea.\r\nEnim magna esse dolor amet ex nostrud quis consectetur velit. Sunt minim consectetur anim veniam elit proident exercitation sunt commodo veniam magna ad. Sint eu mollit veniam cupidatat occaecat fugiat reprehenderit nisi fugiat cillum. Amet exercitation aute qui eu ullamco non do officia non amet commodo. Minim excepteur nisi mollit reprehenderit ad. Sit consectetur sit sit laboris ipsum dolore ut sit ex aliquip cillum. Aliquip ut ea adipisicing ullamco Lorem nostrud magna qui amet cillum.\r\n', 'temp-6352099207348952932.jpg', b'1', '2021-07-31 10:44:48', NULL, NULL, NULL);
INSERT INTO `product` VALUES (4, 'Sách Radiantix', 61888, 20, 46, 195, 'Dodson Wilkinson', 426, 'NXB Đại học Sư phạm TP.HCM', 2019, 'Qui magna ex aute deserunt aliquip mollit labore ad. Ipsum pariatur nostrud magna pariatur labore duis ad consequat magna. Ad cillum dolore exercitation proident elit. Cillum occaecat proident officia sit cillum magna ullamco id occaecat non irure mollit minim.\r\nDeserunt elit velit nostrud id aliqua. Velit pariatur in sint ut irure non laborum eiusmod labore fugiat aliquip eu irure. Deserunt velit qui in elit ipsum Lorem aute tempor ullamco minim fugiat deserunt ut. Commodo proident aliqua nostrud dolor do consequat aliquip dolor officia laboris.\r\n', 'temp-13862094760385571107.jpg', b'0', '2021-07-26 17:44:04', NULL, NULL, NULL);
INSERT INTO `product` VALUES (5, 'Sách Prosely', 195442, 0, 52, 178, 'Horne Oneill', 270, 'NXB Giáo dục', 2000, 'Sit cillum ipsum cillum commodo dolor ipsum aliquip id exercitation non proident qui. Veniam tempor labore id exercitation nisi veniam et in non anim ad laborum nostrud fugiat. In ullamco excepteur nostrud esse id nisi eiusmod sint elit aute elit. Amet consectetur commodo amet occaecat. Nostrud labore ad cillum mollit ad fugiat amet.\r\nQui commodo officia ea adipisicing laborum tempor aliqua mollit aliqua. Est sunt amet cupidatat esse id officia qui fugiat eu et et. Cillum tempor esse enim culpa culpa cupidatat labore exercitation aute do voluptate consequat esse.\r\n', 'temp-17624438115898823949.jpg', b'0', '2021-03-04 01:10:28', NULL, NULL, NULL);
INSERT INTO `product` VALUES (6, 'Sách Xth', 462713, 0, 13, 212, 'Karin Jackson', 186, 'NXB Đại học Sư phạm TP.HCM', 2008, 'Ut pariatur culpa sint aliqua culpa ullamco laboris duis dolore mollit dolor cillum. Veniam sit consectetur irure anim do. Labore dolore nisi in aliquip ipsum sit eu excepteur sit magna officia consectetur amet.\r\nCulpa consequat magna consequat aliquip sint amet nulla culpa ea mollit pariatur quis deserunt esse. Non sint id non aliqua ipsum id laboris. Magna ullamco est ullamco et nisi ullamco adipisicing. Nisi irure cillum nostrud laborum aute ea incididunt cillum. Qui quis nostrud adipisicing fugiat et incididunt irure Lorem in. Ipsum nulla ea ullamco irure ea dolore et nostrud.\r\n', 'temp-16741118072528735594.jpg', b'1', '2021-06-18 05:55:06', NULL, NULL, NULL);
INSERT INTO `product` VALUES (7, 'Sách Liquicom', 488021, 0, 65, 95, 'Johnson Wilkins', 260, 'NXB Đại học Huế', 2003, 'Nostrud minim nostrud duis nostrud cupidatat reprehenderit nostrud dolor amet esse. Anim eiusmod ea ea deserunt. Elit pariatur voluptate esse occaecat sint. Enim reprehenderit ad culpa ad dolor duis elit minim cupidatat Lorem est. Enim exercitation cillum nulla consequat ut et sunt esse cupidatat velit esse enim. Excepteur officia eu voluptate fugiat ad esse irure anim irure eiusmod cupidatat consequat eiusmod occaecat. Tempor voluptate incididunt veniam dolore nisi voluptate adipisicing mollit dolore consequat non nostrud est.\r\nDo irure ut occaecat adipisicing sint Lorem fugiat. Quis et aliqua ipsum in esse sit. Sint laborum eiusmod duis magna. Veniam consectetur nulla deserunt Lorem excepteur. Cillum nisi minim incididunt adipisicing anim eu ipsum reprehenderit non irure ea officia nulla. Ad culpa aliqua sit adipisicing.\r\n', 'temp-6243426685116508297.jpg', b'1', '2021-11-01 20:47:34', NULL, NULL, NULL);
INSERT INTO `product` VALUES (8, 'Sách Supremia', 478294, 0, 60, 316, 'Ayala Rich', 359, 'NXB Đại học Sư phạm Hà Nội', 2006, 'Reprehenderit quis exercitation reprehenderit velit et magna. Velit ex cupidatat est mollit eiusmod in mollit aliqua velit laborum adipisicing eiusmod ex. Duis Lorem dolore labore veniam.\r\nSunt esse consectetur culpa nostrud ad id tempor voluptate elit cupidatat. Dolor proident ipsum cillum anim mollit incididunt nisi labore voluptate est sunt magna non. Sit magna eiusmod officia nostrud aliqua exercitation. Aliquip labore cillum commodo labore do ullamco ea tempor ullamco exercitation nostrud officia.\r\n', 'temp-10075522682831764585.jpg', b'0', '2021-08-27 02:56:32', NULL, NULL, NULL);
INSERT INTO `product` VALUES (9, 'Sách Cyclonica', 96299, 20, 45, 14, 'Flynn Sanford', 420, 'NXB Đại học Sư phạm Hà Nội', 2013, 'Laborum elit laborum do esse ut id sunt voluptate ut minim sint mollit irure. Amet veniam cupidatat anim minim tempor ipsum dolore tempor aliquip voluptate mollit id velit eu. Proident culpa aliquip ut aliquip tempor commodo occaecat Lorem. Pariatur consequat id eu irure ex culpa elit aliqua in ea sunt id eiusmod non. Non laboris officia pariatur enim sint officia. Ipsum aliquip commodo in dolore. Ullamco consectetur proident dolor nostrud eu cupidatat aliqua dolor sint.\r\nEst pariatur fugiat amet sint ut tempor ut labore ipsum veniam deserunt non occaecat irure. Labore nostrud amet in voluptate. Qui ullamco officia ullamco ipsum cillum. Amet Lorem aliqua dolore sit.\r\n', 'temp-16741118072528735594.jpg', b'1', '2021-08-07 21:11:03', NULL, NULL, NULL);
INSERT INTO `product` VALUES (10, 'Sách Envire', 397768, 20, 65, 347, 'Gilda Harris', 321, 'NXB Đại học Sư phạm TP.HCM', 2020, 'Non veniam dolore esse aute officia in nostrud id sint ipsum incididunt qui incididunt. Commodo irure esse sunt ex eu minim sit culpa in mollit. Incididunt id irure ullamco ea. Adipisicing enim sit nisi dolore velit dolore eu deserunt pariatur deserunt eu exercitation ipsum nostrud. Commodo veniam elit duis mollit ut mollit enim. Aliquip labore non ea id cillum qui laboris occaecat quis adipisicing. Elit nulla ut laborum officia occaecat dolore aute commodo voluptate qui incididunt deserunt consectetur.\r\nEiusmod duis nulla occaecat deserunt ut sint consectetur. Nostrud eu velit nulla amet qui consequat labore. Consectetur proident cupidatat occaecat ex dolor dolor sint eiusmod mollit sint.\r\n', 'temp-13862094760385571107.jpg', b'1', '2021-06-07 23:23:46', NULL, NULL, NULL);
INSERT INTO `product` VALUES (11, 'Sách Insuresys', 366716, 0, 50, 305, 'Lolita Cochran', 89, 'NXB Đại học Quốc gia Hà Nội', 2007, 'Magna enim veniam consequat minim. Incididunt ea ex minim officia magna culpa. Duis proident voluptate nostrud consectetur dolor adipisicing magna in. Lorem pariatur aliqua incididunt ut aliquip commodo ipsum est dolore exercitation. Pariatur non ad ipsum ut reprehenderit sit nostrud proident et consectetur. Eu amet aute dolor consequat consectetur incididunt fugiat duis ipsum et magna nisi incididunt nulla. Non mollit qui nostrud nostrud pariatur non.\r\nAdipisicing aliquip non commodo sit labore sint voluptate cupidatat anim amet. Non reprehenderit tempor mollit duis in reprehenderit. Est laborum aute eu dolor reprehenderit ut culpa ullamco Lorem qui laborum elit. Esse pariatur eu ex magna excepteur incididunt irure aute nulla eu. Occaecat irure cupidatat et quis consequat eiusmod ad reprehenderit veniam elit nostrud voluptate. Et reprehenderit mollit ullamco laborum tempor elit. Nisi eiusmod ipsum dolore culpa reprehenderit ad quis consequat aliqua anim aute.\r\n', 'temp-10075522682831764585.jpg', b'1', '2021-12-10 13:59:07', NULL, NULL, NULL);
INSERT INTO `product` VALUES (12, 'Sách Exostream', 51700, 0, 85, 62, 'Christian Alvarado', 435, 'NXB Đại học Sư phạm Hà Nội', 2018, 'In laborum tempor cupidatat aliqua in pariatur tempor voluptate velit deserunt. Irure proident labore nostrud occaecat aliqua excepteur eiusmod exercitation eiusmod eiusmod. Ex anim do id tempor aute proident proident in irure. Tempor duis esse laboris do. Duis amet qui nisi velit mollit ad. Proident aute ea ullamco qui irure proident.\r\nDolor enim Lorem ea excepteur aliqua. Aute sint aliqua elit pariatur. Ullamco ut occaecat voluptate ut irure qui tempor tempor qui consequat fugiat.\r\n', 'temp-17624438115898823949.jpg', b'0', '2021-12-14 19:28:20', NULL, NULL, NULL);
INSERT INTO `product` VALUES (13, 'Sách Fuelton', 122139, 0, 88, 461, 'Gentry Chapman', 18, 'NXB Đại học Quốc gia Hà Nội', 2005, 'Officia anim mollit culpa ea Lorem dolore commodo incididunt eu pariatur occaecat. Ullamco amet est do commodo deserunt magna sint mollit esse. Aliqua ipsum proident anim laboris enim sint ex occaecat labore minim sunt. Ipsum nulla velit in esse eu commodo do Lorem velit laboris duis. Id amet aliquip Lorem ea ullamco ex laborum minim mollit ullamco mollit. Lorem nostrud veniam nulla quis duis occaecat ullamco magna nostrud Lorem deserunt sunt pariatur. Magna aute ad reprehenderit eu amet ullamco irure cillum.\r\nSit anim consequat mollit sint velit ad ea. Ipsum ex veniam officia ea minim labore. Eiusmod pariatur ut velit sit officia cupidatat consectetur. Dolore esse exercitation do sunt veniam amet nisi consequat quis nulla.\r\n', 'temp-16741118072528735594.jpg', b'0', '2021-06-16 08:20:52', NULL, NULL, NULL);
INSERT INTO `product` VALUES (14, 'Sách Xinware', 247115, 20, 80, 373, 'Sheree Lawson', 124, 'NXB Đại học Sư phạm TP.HCM', 2007, 'Deserunt labore fugiat velit proident proident ex irure incididunt sint anim consequat ipsum dolore dolore. Exercitation proident nulla adipisicing incididunt officia ut labore consequat. Voluptate ex occaecat commodo duis reprehenderit aliqua qui cillum sunt sint esse velit irure. Do Lorem magna tempor adipisicing dolor reprehenderit do in commodo ad anim consectetur.\r\nOccaecat consectetur elit consequat reprehenderit cillum cupidatat duis eiusmod. Commodo esse occaecat aute qui labore exercitation sint. Aliquip Lorem veniam tempor elit esse aliqua commodo. Nulla do fugiat exercitation dolore tempor exercitation irure pariatur Lorem cupidatat labore. Pariatur aliquip veniam Lorem sint. Aliqua nisi laborum ullamco cupidatat anim occaecat fugiat in sint Lorem ex cupidatat. Eu qui fugiat ut ipsum.\r\n', 'temp-16741118072528735594.jpg', b'1', '2021-07-31 15:57:52', NULL, NULL, NULL);
INSERT INTO `product` VALUES (15, 'Sách Atomica', 205300, 20, 16, 388, 'Shirley Sawyer', 414, 'NXB Đại học Quốc gia Hà Nội', 2006, 'Eu id sint sunt eiusmod ad magna dolore sint. Ea laboris fugiat eiusmod enim sint do irure ipsum tempor quis aliqua laboris fugiat cillum. Ipsum sint anim et irure labore nulla. Enim culpa officia eiusmod proident mollit aliqua deserunt. Adipisicing voluptate veniam commodo deserunt adipisicing tempor nulla voluptate. Esse fugiat amet enim pariatur eu ad magna labore magna.\r\nSunt et amet nisi dolor nostrud qui commodo culpa. Sunt nisi enim in in quis consequat sunt ullamco pariatur Lorem eu minim. Enim ea dolor elit ut adipisicing incididunt eiusmod. Laboris do minim dolore ut enim voluptate ea ea consequat anim incididunt adipisicing id commodo. Non mollit nisi enim et laboris voluptate. Incididunt ex elit reprehenderit veniam consectetur sunt id pariatur. Elit sunt consequat excepteur est aute amet enim culpa ipsum dolor.\r\n', 'temp-12235989262213754276.jpg', b'0', '2021-04-19 14:39:51', NULL, NULL, NULL);
INSERT INTO `product` VALUES (16, 'Sách Quadeebo', 280225, 0, 27, 16, 'Marcia Horne', 486, 'NXB Đại học Sư phạm Hà Nội', 2006, 'Ut exercitation ipsum amet commodo labore duis est excepteur nostrud velit et ex magna. Amet ut proident eu dolor incididunt commodo deserunt duis ea. Proident quis enim proident adipisicing ex dolore consectetur incididunt sit.\r\nUt Lorem excepteur labore ea qui ullamco aliquip in sint pariatur. Esse aliqua aliquip deserunt veniam pariatur commodo Lorem id tempor nostrud elit anim. Consectetur voluptate mollit nostrud ut nisi commodo quis ullamco proident laborum esse consequat. Ipsum esse sint laboris do ad in dolore enim laborum id est id veniam.\r\n', 'temp-10075522682831764585.jpg', b'1', '2021-12-17 09:38:24', NULL, NULL, NULL);
INSERT INTO `product` VALUES (17, 'Sách Nexgene', 90044, 20, 96, 165, 'Dixie Middleton', 43, 'NXB Đại học Sư phạm TP.HCM', 2009, 'Veniam qui id occaecat exercitation aliquip occaecat incididunt quis. Anim magna culpa nisi aute aliqua veniam Lorem est elit laborum aliquip. Non aute consequat fugiat minim est sint officia duis proident proident ipsum nulla et. Labore aliquip officia pariatur ut aliqua laboris quis eu fugiat. Occaecat sint dolore ex est laboris. Enim non aute est pariatur eiusmod.\r\nReprehenderit cillum cillum voluptate veniam in. Nostrud ea laborum Lorem duis mollit anim id cillum nisi commodo commodo non est excepteur. Id labore sunt ipsum dolor Lorem laboris deserunt ullamco ullamco nostrud proident aliquip commodo. Nisi incididunt dolore officia eu id ut laborum fugiat sit enim nostrud eiusmod.\r\n', 'temp-10075522682831764585.jpg', b'1', '2022-01-02 23:13:27', NULL, NULL, NULL);
INSERT INTO `product` VALUES (18, 'Sách Gaptec', 281613, 0, 93, 279, 'Dorothea Gonzales', 409, 'NXB Đại học Huế', 2020, 'Ea deserunt esse officia consequat ex nisi laborum laborum. Ad ex laboris culpa ullamco cupidatat fugiat enim sunt occaecat elit enim duis. Irure excepteur sunt excepteur sit. Labore minim pariatur elit fugiat commodo eu cupidatat anim non excepteur irure. Esse amet elit velit et deserunt. Laborum qui nulla est duis aute voluptate ea ipsum mollit tempor anim est esse. Dolore cillum occaecat amet enim tempor mollit.\r\nUllamco minim aliquip pariatur dolor culpa ea ad eiusmod. Officia nulla sint cillum consectetur do voluptate occaecat. Aute et irure voluptate exercitation.\r\n', 'temp-13862094760385571107.jpg', b'0', '2021-07-04 12:11:08', NULL, NULL, NULL);
INSERT INTO `product` VALUES (19, 'Sách Dadabase', 450859, 20, 90, 474, 'Moore Kim', 113, 'NXB Đại học Sư phạm TP.HCM', 2003, 'Amet laborum do consequat officia cupidatat in nulla occaecat ut aute magna aute eu exercitation. Amet aute aliqua minim dolore cillum sunt non eu nulla anim aute veniam. In occaecat deserunt consequat excepteur. Aliqua et magna duis deserunt duis excepteur ipsum in non do magna quis. Amet pariatur et incididunt in. Qui dolor et occaecat excepteur quis laborum. Ut sint sint officia elit nostrud dolor quis laborum ea.\r\nIncididunt occaecat deserunt consequat in ut aliqua velit ipsum nisi labore ex. Cillum amet consequat fugiat et. Elit cupidatat officia magna aliqua velit laboris ea. Nostrud voluptate in esse minim excepteur pariatur eiusmod voluptate.\r\n', 'temp-7329036107498680084.jpg', b'0', '2021-10-25 09:48:48', NULL, NULL, NULL);
INSERT INTO `product` VALUES (20, 'Sách Digial', 187331, 20, 75, 339, 'Laverne Obrien', 194, 'NXB Đại học Huế', 2011, 'Ipsum est amet eiusmod nostrud laborum deserunt consequat qui. Labore aliqua fugiat nulla exercitation amet quis. Laborum consequat in non mollit. Reprehenderit dolor est commodo et fugiat. Nulla aute tempor pariatur cillum Lorem ad consequat magna esse incididunt nulla. Ad officia non excepteur occaecat cillum cillum sunt in.\r\nCupidatat sunt dolor incididunt sint et nisi eu consectetur culpa esse. Pariatur ad veniam cillum sit culpa anim magna ex laboris magna ea tempor. Voluptate in voluptate incididunt labore eiusmod ut magna sunt qui labore sit esse veniam. Anim qui elit duis mollit culpa ullamco do in et. Laboris eiusmod id commodo et et aliqua qui esse ad anim nulla. Qui occaecat consequat in sunt est enim id qui ex reprehenderit.\r\n', 'temp-3015888053636485125.jpg', b'1', '2021-11-12 00:28:22', NULL, NULL, NULL);
INSERT INTO `product` VALUES (21, 'Sách Endicil', 396673, 20, 85, 263, 'Hughes Hutchinson', 62, 'NXB Đại học Sư phạm Hà Nội', 2013, 'Cillum non quis sit deserunt dolore laboris enim laboris fugiat reprehenderit id aliqua. Elit ut consequat occaecat aliqua nulla non laboris mollit pariatur nisi sit. Irure cupidatat anim dolor incididunt elit duis labore Lorem in velit fugiat.\r\nEsse aute dolore ullamco sit commodo do qui laboris. Cillum nostrud eu aute nostrud sit anim labore officia quis aliqua veniam consectetur. Proident excepteur aliqua aliqua culpa. Reprehenderit fugiat occaecat irure cupidatat magna consequat.\r\n', 'temp-12235989262213754276.jpg', b'0', '2021-03-26 22:11:02', NULL, NULL, NULL);
INSERT INTO `product` VALUES (22, 'Sách Inquala', 116529, 0, 11, 367, 'Hilda Crane', 238, 'NXB Đại học Quốc gia Hà Nội', 1998, 'Esse ipsum minim voluptate consectetur exercitation dolor. Ex ut anim ad elit non consequat cupidatat anim minim est elit in deserunt Lorem. Est duis minim consectetur sunt duis non.\r\nLorem labore proident laborum consequat officia commodo reprehenderit ad Lorem minim incididunt aute in esse. Ex eiusmod ut eiusmod mollit consectetur qui enim sit labore Lorem reprehenderit enim consectetur. Nisi anim veniam sint tempor fugiat pariatur in est sint excepteur.\r\n', 'temp-12235989262213754276.jpg', b'1', '2022-01-24 08:00:39', NULL, NULL, NULL);
INSERT INTO `product` VALUES (23, 'Sách Tubalum', 372359, 0, 71, 129, 'Erma Shannon', 15, 'NXB Đại học Sư phạm TP.HCM', 2016, 'Veniam cillum do laboris ipsum incididunt consequat non. Veniam nulla velit elit duis proident nulla. Commodo amet nostrud sit proident amet cillum qui anim.\r\nId enim reprehenderit laboris nulla Lorem. Est amet do labore in fugiat do. Qui consequat dolor consectetur cupidatat magna. Dolore cupidatat ut proident deserunt irure fugiat et exercitation minim quis enim aliqua. Adipisicing proident elit irure pariatur irure magna. Aliqua non velit do veniam ipsum laboris ex ipsum.\r\n', 'temp-6243426685116508297.jpg', b'0', '2021-07-15 20:01:58', NULL, NULL, NULL);
INSERT INTO `product` VALUES (24, 'Sách Songlines', 293705, 20, 83, 267, 'Paula Duncan', 284, 'NXB Đại học Huế', 2017, 'Nisi consequat do adipisicing nostrud elit aliqua nostrud sunt laborum reprehenderit culpa labore in ea. Ut nulla voluptate aliqua exercitation consequat mollit anim est ullamco. Nostrud excepteur reprehenderit est amet dolore. Velit dolor eu consectetur excepteur. Cupidatat sit officia anim ex.\r\nSit enim ea proident tempor dolore cupidatat ad labore sint tempor proident aliquip. Enim enim nostrud aliqua ut voluptate elit sunt nulla. Culpa deserunt enim elit consectetur ea pariatur magna in nisi. Aliqua aliqua quis sit ullamco non ex amet reprehenderit cupidatat ad id sint nulla culpa. Irure labore minim adipisicing dolor reprehenderit amet. Nisi esse exercitation commodo cillum eu Lorem.\r\n', 'temp-13862094760385571107.jpg', b'0', '2021-09-09 05:29:49', NULL, NULL, NULL);
INSERT INTO `product` VALUES (25, 'Sách Evidends', 122006, 0, 62, 309, 'Briggs Burke', 134, 'NXB Đại học Sư phạm TP.HCM', 2011, 'Tempor laborum duis aute enim eiusmod ipsum et labore sunt qui labore. Fugiat in sit exercitation eu culpa nisi laboris. Ullamco occaecat labore excepteur cupidatat velit tempor occaecat. Eiusmod culpa quis exercitation ut exercitation aliquip enim veniam aute sunt. Duis id aute culpa adipisicing laborum in aliqua cillum deserunt elit cupidatat aute.\r\nSunt incididunt ex ut excepteur id. Ea excepteur irure consectetur aute ea quis sunt dolor. In incididunt id officia nostrud anim sit. Cillum consectetur amet ipsum labore duis ipsum nostrud voluptate sit ut est qui Lorem. Nisi anim ex reprehenderit magna id officia ea culpa. Laborum do quis tempor ea cillum consectetur velit id voluptate dolore anim culpa. Anim ullamco deserunt irure magna Lorem non qui deserunt occaecat.\r\n', 'temp-13064240004351430671.jpg', b'1', '2021-12-11 02:13:04', NULL, NULL, NULL);
INSERT INTO `product` VALUES (26, 'Sách Buzzworks', 131272, 20, 47, 418, 'Wood Franks', 147, 'NXB Đại học Sư phạm Hà Nội', 1996, 'Consequat culpa ad excepteur in ut officia do. Ad nisi mollit ut aliqua aliquip velit incididunt. Ipsum do nisi culpa id nulla sint quis laborum voluptate et aliqua irure ea. Proident officia dolore ex enim culpa. Eiusmod dolor sunt amet in excepteur id.\r\nOfficia reprehenderit eiusmod tempor anim laboris reprehenderit et dolor commodo irure. Excepteur magna ad id in dolore non nostrud ad veniam reprehenderit amet nulla. Aliquip ipsum proident non sit officia adipisicing dolor proident consectetur. Est aute et laborum mollit consectetur sunt voluptate voluptate laborum. Ipsum veniam ipsum anim nostrud eu id amet do eiusmod do tempor amet excepteur. Nostrud magna tempor in proident non magna sit enim minim elit cupidatat.\r\n', 'temp-16741118072528735594.jpg', b'0', '2021-02-02 00:42:02', NULL, NULL, NULL);
INSERT INTO `product` VALUES (27, 'Sách Zilla', 45254, 0, 40, 41, 'Imogene Horton', 67, 'NXB Đại học Huế', 2008, 'Voluptate est reprehenderit nostrud deserunt qui ullamco tempor quis officia pariatur ipsum. Veniam exercitation fugiat velit commodo. Adipisicing ad officia eu pariatur amet nulla amet eiusmod commodo irure enim ut eiusmod. Eiusmod officia Lorem ex commodo magna eu dolor aliquip esse officia esse culpa. Ad excepteur ipsum occaecat proident consectetur incididunt officia adipisicing laboris cupidatat cillum qui laboris mollit. Elit excepteur cupidatat dolor eu aliquip veniam occaecat ipsum sint adipisicing sint excepteur occaecat sit.\r\nLaboris culpa minim adipisicing pariatur anim nostrud voluptate ut ea id cillum aute. Non cillum dolor nulla ea laboris dolor duis fugiat id proident aute anim qui. Adipisicing qui occaecat tempor do deserunt fugiat. Ipsum aliquip sunt ullamco non do officia mollit nisi sit aliquip enim eiusmod. Commodo exercitation minim nisi esse occaecat ad aliqua veniam sit excepteur. Magna amet nisi proident velit Lorem aliqua enim eu id amet aliqua nostrud sit enim.\r\n', 'temp-8262627340495498759.jpg', b'0', '2021-04-26 11:20:50', NULL, NULL, NULL);
INSERT INTO `product` VALUES (28, 'Sách Fangold', 36717, 20, 19, 407, 'Frankie Mccarthy', 85, 'NXB Giáo dục', 2015, 'Incididunt elit consectetur magna nisi. Occaecat sint ullamco anim ex nulla ea Lorem duis ea. Commodo Lorem ut tempor sunt enim aliquip sint reprehenderit ut tempor ullamco nisi elit. Proident ipsum ea ad exercitation esse enim deserunt veniam aliquip.\r\nDuis non minim ut aliquip veniam deserunt minim ullamco adipisicing proident nostrud consectetur dolore irure. Dolor nisi deserunt velit nostrud incididunt excepteur elit reprehenderit est. Laborum commodo veniam sint commodo. Velit commodo exercitation in nostrud cillum pariatur ea. Incididunt consectetur aute voluptate anim ea in enim. Culpa exercitation id excepteur Lorem consectetur pariatur pariatur veniam ipsum aliquip amet. Cupidatat cupidatat ullamco occaecat est sunt exercitation tempor amet esse.\r\n', 'temp-18128511448457962576.jpg', b'0', '2021-03-08 07:28:18', NULL, NULL, NULL);
INSERT INTO `product` VALUES (29, 'Sách Immunics', 260516, 0, 87, 176, 'Wheeler Carpenter', 49, 'NXB Đại học Sư phạm TP.HCM', 2012, 'Deserunt excepteur fugiat nisi adipisicing amet esse duis pariatur dolor deserunt dolor mollit. Ut anim minim dolore veniam duis tempor tempor commodo aliquip nulla incididunt. Reprehenderit sint sunt eiusmod non labore. Magna anim mollit dolor consequat. Sit velit laborum Lorem eiusmod nisi minim ex non dolor labore id. Enim ad laborum ad ex quis adipisicing ex excepteur esse id est et proident voluptate. Excepteur enim et irure reprehenderit eu ad velit anim minim aute.\r\nOfficia pariatur aliqua esse est ad ad dolore dolor adipisicing commodo. Tempor dolor incididunt excepteur eu eiusmod in cupidatat adipisicing duis mollit. Id pariatur nulla quis officia commodo consequat in qui. Eu laborum consequat pariatur incididunt aliquip.\r\n', 'temp-14438611480196141526.jpg', b'0', '2021-10-14 22:48:40', NULL, NULL, NULL);
INSERT INTO `product` VALUES (30, 'Sách Zillacom', 318403, 0, 12, 71, 'Natalia Wilder', 271, 'NXB Đại học Sư phạm TP.HCM', 2007, 'Id sunt incididunt eiusmod dolore pariatur. Non in cillum sunt sint. Id est nisi amet dolore. Sit mollit esse quis enim.\r\nIncididunt deserunt exercitation qui dolor incididunt proident deserunt dolor proident amet duis. Minim mollit ipsum ea non eiusmod aute non ullamco. Excepteur elit et Lorem Lorem ea cillum. Lorem magna est excepteur culpa laborum laboris velit amet et excepteur enim quis proident. Adipisicing eiusmod officia aliqua nisi quis elit labore commodo occaecat voluptate. Eiusmod esse culpa sint sit occaecat do magna elit ad eu laborum et.\r\n', 'temp-12235989262213754276.jpg', b'0', '2021-12-19 02:05:00', NULL, NULL, NULL);
INSERT INTO `product` VALUES (31, 'Sách Katakana', 231331, 20, 71, 336, 'Linda Stevens', 285, 'NXB Đại học Sư phạm TP.HCM', 2001, 'Elit ad nulla officia fugiat nisi et ex nostrud elit ut. Mollit ut officia ea esse aute in occaecat est exercitation magna duis. Sit consectetur ad in eiusmod. Velit nisi dolore pariatur commodo eiusmod minim ullamco anim reprehenderit velit commodo qui.\r\nDo ex amet minim anim consequat anim ullamco veniam consequat. Eiusmod ea cillum ad ut anim qui sint officia mollit proident qui. Lorem velit minim veniam nisi aute dolor nulla laboris commodo dolor laboris qui. Laboris cillum non culpa anim ea quis. Commodo adipisicing est quis do cupidatat ullamco incididunt pariatur anim cillum elit magna laboris dolor. Elit pariatur dolor velit do exercitation consequat eu eu sunt.\r\n', 'temp-13862094760385571107.jpg', b'1', '2022-01-01 23:10:09', NULL, NULL, NULL);
INSERT INTO `product` VALUES (32, 'Sách Artiq', 313493, 0, 49, 48, 'Tucker Sargent', 341, 'NXB Đại học Sư phạm TP.HCM', 1997, 'Sit sint sit adipisicing aliqua fugiat eiusmod amet sunt cupidatat laboris cillum. Anim consequat laborum et cupidatat occaecat laborum aute dolor ipsum. Velit ex pariatur cillum non et quis minim excepteur irure id officia irure consectetur tempor. Sunt reprehenderit exercitation adipisicing laborum anim non pariatur.\r\nReprehenderit commodo nisi magna officia proident cillum do laboris laboris officia ullamco mollit duis nostrud. Labore ad proident fugiat nisi nisi deserunt voluptate aliquip dolore officia. Non reprehenderit commodo dolore do occaecat nostrud nostrud officia esse do officia reprehenderit qui. Ullamco nostrud do consequat magna incididunt. Eu velit occaecat amet ut magna ad ea voluptate est consectetur adipisicing tempor mollit.\r\n', 'temp-6352099207348952932.jpg', b'0', '2021-12-08 02:56:41', NULL, NULL, NULL);
INSERT INTO `product` VALUES (33, 'Sách Omnigog', 155599, 20, 19, 316, 'Mullins Thomas', 255, 'NXB Đại học Huế', 2009, 'Cillum amet culpa Lorem elit. Aliquip labore mollit est minim elit. Ex dolor eiusmod non exercitation enim aute excepteur. Voluptate occaecat dolore duis elit eu cillum non labore qui.\r\nMinim eu magna nostrud sunt laborum nulla in mollit duis dolore. Incididunt reprehenderit pariatur ut ea. Qui voluptate ad ea aliqua. Mollit aute sint culpa elit dolor adipisicing culpa sint irure aliqua. Do fugiat deserunt reprehenderit fugiat.\r\n', 'temp-8262627340495498759.jpg', b'1', '2021-11-06 02:48:40', NULL, NULL, NULL);
INSERT INTO `product` VALUES (34, 'Sách Elita', 298548, 0, 65, 439, 'Amber Spence', 262, 'NXB Đại học Huế', 1998, 'Quis fugiat aliqua sit laborum proident ea. Ullamco velit est eiusmod pariatur incididunt. Est Lorem velit nostrud ipsum nostrud. Non in nostrud aliquip velit excepteur nisi non ipsum id sit ea ut. Officia do in Lorem enim occaecat et occaecat ex exercitation aliquip deserunt.\r\nEst ex in qui qui deserunt anim irure consequat ut cillum irure et incididunt esse. Cillum ipsum tempor qui eu do eiusmod ea consectetur dolor. Reprehenderit do Lorem laboris culpa eiusmod irure ullamco ex nisi esse minim.\r\n', 'temp-18128511448457962576.jpg', b'1', '2021-03-24 23:12:25', NULL, NULL, NULL);
INSERT INTO `product` VALUES (35, 'Sách Hopeli', 461236, 20, 51, 350, 'Wooten Johnston', 355, 'NXB Đại học Huế', 2018, 'Cupidatat fugiat do minim qui dolor deserunt anim. Sit elit sit ex velit nisi laborum. Anim officia nisi ipsum irure velit labore eu commodo in sit aute excepteur sit mollit.\r\nMagna tempor est enim consectetur eu nulla fugiat sit tempor mollit exercitation eu. Exercitation ea voluptate laborum incididunt occaecat id in. Lorem dolor irure aute amet cillum. Pariatur ex ullamco quis quis.\r\n', 'temp-12235989262213754276.jpg', b'1', '2021-10-05 08:08:19', NULL, NULL, NULL);
INSERT INTO `product` VALUES (36, 'Sách Vendblend', 495547, 20, 48, 22, 'Mayra Moon', 364, 'NXB Đại học Sư phạm Hà Nội', 1995, 'Aute eiusmod deserunt ipsum eu. Pariatur nisi labore aliquip velit esse sint veniam quis. Sunt anim in ad labore non irure consequat deserunt adipisicing consequat irure pariatur. Id do ad qui et anim in irure est anim ut enim.\r\nAnim adipisicing ea irure elit ut eiusmod adipisicing enim velit aliqua veniam commodo. In minim deserunt tempor eu voluptate sint reprehenderit fugiat excepteur. Adipisicing sint consequat deserunt occaecat adipisicing occaecat consequat.\r\n', 'temp-6352099207348952932.jpg', b'1', '2022-01-08 02:42:25', NULL, NULL, NULL);
INSERT INTO `product` VALUES (37, 'Sách Zensure', 288319, 20, 16, 440, 'Hickman Moses', 62, 'NXB Đại học Sư phạm TP.HCM', 2007, 'Minim cillum pariatur ea voluptate laborum dolore duis. Lorem mollit eu ad tempor irure sint ex nulla reprehenderit exercitation. Cupidatat sit excepteur et duis cillum deserunt duis nostrud dolore labore.\r\nEa ad nisi amet et nulla anim et laborum sit eiusmod laborum ullamco. Velit dolore laborum eu consequat cupidatat elit reprehenderit. Duis in amet adipisicing incididunt sit veniam sunt labore incididunt consequat do ad.\r\n', 'temp-8476700387786158058.jpg', b'0', '2021-05-11 01:50:10', NULL, NULL, NULL);
INSERT INTO `product` VALUES (38, 'Sách Quilk', 183383, 20, 81, 14, 'Elnora Pearson', 326, 'NXB Đại học Huế', 2013, 'Laborum sunt laborum reprehenderit cupidatat esse. Ex ex ullamco elit commodo ipsum anim est nostrud ut exercitation. Exercitation non ex ipsum nisi deserunt occaecat fugiat in. Ipsum sunt culpa laborum proident adipisicing magna sit mollit velit tempor. Consequat esse duis esse amet consequat ad amet duis in. Tempor consectetur consequat eu sunt irure Lorem adipisicing anim ea enim Lorem minim commodo.\r\nLorem consequat laboris aliqua enim pariatur amet fugiat et incididunt. Ut anim esse ut amet voluptate in excepteur non est labore cupidatat incididunt nisi consequat. Adipisicing ipsum eu in ex.\r\n', 'temp-10075522682831764585.jpg', b'1', '2021-11-05 20:54:31', NULL, NULL, NULL);
INSERT INTO `product` VALUES (39, 'Sách Schoolio', 176598, 0, 48, 208, 'Isabella Mcbride', 401, 'NXB Đại học Huế', 2013, 'Consequat amet deserunt qui adipisicing amet id laboris magna reprehenderit ea nisi amet magna. Culpa ut duis culpa nostrud ea. Mollit ex esse in nostrud magna fugiat cillum qui cupidatat eiusmod laboris elit ullamco nisi. Eiusmod cupidatat esse amet proident quis officia eiusmod ut reprehenderit id magna. Deserunt veniam sit eiusmod sit cillum in aliquip nostrud. Sint ea dolor anim magna proident aliqua cillum magna eiusmod laboris. Nulla sit adipisicing do sunt ut reprehenderit adipisicing irure.\r\nSint magna proident ea culpa commodo do nulla tempor magna mollit. Cillum Lorem exercitation occaecat minim amet. Tempor exercitation sunt in laborum deserunt velit eiusmod dolor sunt aliquip aliqua.\r\n', 'temp-10075522682831764585.jpg', b'1', '2021-12-27 15:36:00', NULL, NULL, NULL);
INSERT INTO `product` VALUES (40, 'Sách Neocent', 228132, 0, 91, 66, 'Tanya Shaw', 57, 'NXB Đại học Quốc gia Hà Nội', 2000, 'Ea adipisicing ullamco cupidatat do elit nulla officia. Adipisicing quis reprehenderit mollit labore aliquip. Non sunt nisi anim ut occaecat consectetur cillum cillum do aute sit reprehenderit Lorem. Mollit proident enim aute pariatur velit dolor ex.\r\nAd sint adipisicing do officia excepteur dolor deserunt aliquip non aliquip labore. Enim labore nulla eiusmod est labore proident esse aliquip cillum excepteur occaecat et aliquip eiusmod. Dolore elit ullamco id ea enim culpa proident nostrud enim esse exercitation. Fugiat velit ea tempor exercitation. Voluptate laboris anim est nulla voluptate qui qui labore in dolore et velit quis. Fugiat elit sint magna laborum ad officia irure. Laboris non eu dolore pariatur.\r\n', 'temp-7329036107498680084.jpg', b'1', '2021-06-13 14:22:51', NULL, NULL, NULL);
INSERT INTO `product` VALUES (41, 'Sách Isotrack', 387298, 20, 78, 202, 'Noemi Norris', 179, 'NXB Đại học Quốc gia Hà Nội', 2013, 'Eiusmod in dolor excepteur culpa ipsum eu sint culpa exercitation est qui. Commodo proident deserunt in velit proident voluptate dolore sit minim velit do dolor eiusmod nulla. Labore consectetur aliqua adipisicing labore exercitation adipisicing.\r\nDolor voluptate in ea qui irure qui. Anim voluptate duis cillum eiusmod ipsum non. Lorem incididunt ut ipsum cillum culpa consectetur officia. Eiusmod et laborum officia sint eiusmod non exercitation. Irure ipsum cupidatat id culpa magna in fugiat nostrud. Dolor ad quis duis in excepteur anim consectetur.\r\n', 'temp-7329036107498680084.jpg', b'0', '2022-01-03 15:33:27', NULL, NULL, NULL);
INSERT INTO `product` VALUES (42, 'Sách Bedlam', 274131, 20, 28, 391, 'Josefa Allison', 31, 'NXB Đại học Huế', 2000, 'Culpa velit pariatur proident exercitation commodo labore exercitation anim dolore qui fugiat. Ipsum adipisicing consequat sunt elit cupidatat laborum laboris. Laborum consectetur aliquip eiusmod dolore anim fugiat commodo id ex irure occaecat excepteur consectetur. Irure do laboris mollit aute ex reprehenderit in eu eu veniam irure laborum cupidatat duis.\r\nIn commodo enim voluptate ex aute consequat aute labore pariatur magna do. Cillum cillum aliquip fugiat elit qui veniam aute minim occaecat sint ad. Nisi consectetur voluptate id eu tempor ea eu ad culpa aliquip elit ex.\r\n', 'temp-14438611480196141526.jpg', b'1', '2021-07-21 01:40:24', NULL, NULL, NULL);
INSERT INTO `product` VALUES (43, 'Sách Eternis', 68882, 20, 45, 380, 'Betty Marsh', 63, 'NXB Đại học Sư phạm TP.HCM', 2020, 'Non sint laboris anim elit ipsum. Ut aute tempor nisi cillum esse. Lorem aliqua ut commodo cupidatat eu ullamco sint eiusmod do voluptate mollit adipisicing. Sint ea occaecat minim eu aliquip. Dolor enim adipisicing est labore anim laborum veniam. Duis consectetur dolor ad est nisi mollit occaecat exercitation eiusmod ad cillum fugiat elit. Mollit consequat nisi veniam eiusmod excepteur dolor enim incididunt minim deserunt minim excepteur.\r\nProident aute sint tempor et do occaecat eu nisi mollit ullamco excepteur sunt reprehenderit. Duis aliquip id magna anim do. Dolore irure minim consequat sint esse sint sint consectetur. Amet esse ullamco fugiat do officia tempor. Consectetur occaecat ipsum pariatur sint mollit nisi adipisicing Lorem tempor voluptate duis sunt eu. Excepteur culpa velit dolore cillum quis reprehenderit ad.\r\n', 'temp-16741118072528735594.jpg', b'0', '2021-06-09 21:58:26', NULL, NULL, NULL);
INSERT INTO `product` VALUES (44, 'Sách Manufact', 71997, 20, 36, 343, 'Whitney Underwood', 293, 'NXB Đại học Sư phạm Hà Nội', 2013, 'Excepteur nisi minim in eu ad enim duis cillum sit tempor qui irure aliqua. Dolore laboris non id nisi ea aliqua id est incididunt excepteur est fugiat eiusmod. Nostrud eiusmod qui consectetur Lorem est officia tempor consectetur consequat enim ex aliqua ea culpa. Voluptate magna enim excepteur commodo excepteur incididunt labore. Commodo commodo sint eiusmod incididunt. Ullamco laboris ullamco nostrud amet dolore ipsum in aliquip enim fugiat.\r\nVeniam ipsum voluptate consequat magna magna sint. Nisi do Lorem irure est id labore anim eiusmod. Do est est nisi aliqua nisi duis. Laboris quis amet esse nulla cupidatat sit. Exercitation occaecat est commodo ad irure Lorem aute non exercitation veniam anim. Ex consequat non et culpa anim ipsum eiusmod.\r\n', 'temp-3015888053636485125.jpg', b'1', '2021-03-30 01:29:57', NULL, NULL, NULL);
INSERT INTO `product` VALUES (45, 'Sách Golistic', 252810, 0, 99, 358, 'Valencia Kent', 166, 'NXB Giáo dục', 2006, 'Laboris est ea incididunt cupidatat. Id veniam laboris in sunt laborum ullamco aute esse sit officia labore aute dolore ad. Sit aliquip nisi ad cupidatat ullamco do Lorem pariatur labore irure. Ea elit culpa duis cillum reprehenderit laboris mollit in sit nulla laborum amet.\r\nLabore consequat voluptate deserunt nostrud eu elit culpa est laboris. Commodo nisi mollit sit nisi id sit pariatur quis anim cillum enim fugiat. Pariatur minim nostrud irure cupidatat. Consequat amet occaecat aliquip sint adipisicing occaecat quis labore esse minim. Reprehenderit mollit anim labore adipisicing. Sunt laborum fugiat eu cillum. Ipsum ut dolor ex deserunt pariatur ullamco nostrud laborum amet cillum enim et incididunt.\r\n', 'temp-13862094760385571107.jpg', b'0', '2021-06-07 07:01:21', NULL, NULL, NULL);
INSERT INTO `product` VALUES (46, 'Sách Dognosis', 384754, 20, 58, 484, 'Alisa Waters', 129, 'NXB Đại học Sư phạm TP.HCM', 1997, 'Do qui cillum sint in aute tempor. Nisi velit amet do incididunt consequat proident qui nisi exercitation eiusmod excepteur aliqua deserunt. Esse exercitation cupidatat officia id sint irure dolore nisi. Deserunt ex velit id aliqua consectetur. Magna aute ad laboris aliquip irure esse velit ipsum nostrud est sint in voluptate aliqua.\r\nIn exercitation culpa dolore in duis laboris cillum eiusmod enim ullamco incididunt Lorem. Anim amet ut ea anim minim magna ad dolor proident ut cupidatat in exercitation ex. Exercitation nisi irure nisi mollit irure exercitation magna reprehenderit mollit dolore irure reprehenderit nisi deserunt. Consectetur do excepteur enim sunt anim nulla culpa incididunt ipsum. Lorem in proident quis irure sunt adipisicing amet ullamco excepteur consectetur laboris id sunt. Elit nulla veniam id ea ipsum qui consequat incididunt labore qui veniam.\r\n', 'temp-8262627340495498759.jpg', b'0', '2022-01-13 20:55:09', NULL, NULL, NULL);
INSERT INTO `product` VALUES (47, 'Sách Magneato', 62859, 20, 76, 213, 'Bell Anthony', 439, 'NXB Đại học Sư phạm TP.HCM', 2002, 'Commodo nisi sint nulla et duis nostrud sunt nulla. Consequat ad ad excepteur sit aliqua non. Laborum et culpa commodo qui veniam sunt labore nostrud ut est laboris in non. Anim id duis pariatur esse excepteur. Aute ullamco do commodo labore ut consectetur aute pariatur ea Lorem deserunt consequat ex ea.\r\nAliquip proident commodo eu velit veniam mollit ipsum reprehenderit quis. Ullamco duis est esse aliqua officia laborum minim incididunt aliqua. Do mollit ipsum dolor culpa non proident et amet nulla elit consectetur ex tempor. Voluptate qui laborum officia et. Sint magna do aliqua officia aliqua dolor dolor. Commodo deserunt irure qui est nulla. Enim duis aliqua ex do tempor minim.\r\n', 'temp-7329036107498680084.jpg', b'0', '2021-09-01 20:00:43', NULL, NULL, NULL);
INSERT INTO `product` VALUES (48, 'Sách Comdom', 320796, 0, 41, 221, 'Bowen Blackburn', 127, 'NXB Giáo dục', 1999, 'Adipisicing laborum fugiat quis et. Laboris sint magna exercitation Lorem elit enim eiusmod consequat aliqua pariatur duis. Ad est dolor aliquip occaecat commodo. Commodo nisi incididunt voluptate cupidatat cillum nisi qui ex aute occaecat exercitation. Ut officia quis cupidatat sint veniam enim consequat deserunt voluptate dolor nisi. In dolore ea nisi aliquip aliqua ea reprehenderit ex culpa Lorem cupidatat ullamco.\r\nConsequat ea in nisi eu quis minim nulla consequat cillum magna laboris quis Lorem. Culpa laborum pariatur nostrud officia eu est amet excepteur tempor ex ad. Nostrud cupidatat ea fugiat velit in ipsum dolore anim voluptate do. Exercitation dolore officia mollit nostrud excepteur qui enim velit duis.\r\n', 'temp-3984373128647845854.jpg', b'1', '2021-02-18 02:21:04', NULL, NULL, NULL);
INSERT INTO `product` VALUES (49, 'Sách Cognicode', 397947, 0, 75, 225, 'Strickland Flores', 166, 'NXB Đại học Huế', 2016, 'Dolor exercitation incididunt ea voluptate Lorem irure proident quis ullamco occaecat adipisicing incididunt. Proident aliqua est deserunt nostrud est. Ipsum mollit ad sit magna minim cupidatat minim fugiat velit sint est ea id ad.\r\nMollit enim nostrud deserunt voluptate aute id velit et nulla ex ipsum. Deserunt et aliqua labore ipsum sit ullamco ipsum do. Consequat officia commodo dolor adipisicing do ea mollit id ullamco exercitation incididunt aliquip.\r\n', 'temp-13064240004351430671.jpg', b'0', '2021-07-30 09:38:48', NULL, NULL, NULL);
INSERT INTO `product` VALUES (50, 'Sách Lyrichord', 118039, 0, 34, 392, 'Mcconnell Case', 284, 'NXB Đại học Sư phạm Hà Nội', 1996, 'Ea nostrud enim est eu pariatur velit laborum commodo. Reprehenderit pariatur magna nulla eu. Incididunt anim ipsum id ea laborum ad duis amet proident. Nisi do commodo esse nulla ea esse laboris. Sint excepteur laboris veniam incididunt aliquip nulla consequat labore enim culpa. Minim Lorem dolor consequat occaecat ullamco sunt eiusmod adipisicing id.\r\nNostrud in eu reprehenderit et veniam ex non veniam ad. Commodo mollit irure sit eu dolore tempor adipisicing ipsum elit exercitation labore quis dolor velit. Ut voluptate qui adipisicing cillum est excepteur exercitation consectetur sit elit laborum. Amet reprehenderit sit mollit qui pariatur laborum in et id adipisicing. Consectetur dolore nulla ad duis fugiat reprehenderit dolor aliquip sint cillum. Sunt laborum incididunt nisi velit amet ullamco.\r\n', 'temp-16741118072528735594.jpg', b'0', '2021-05-15 04:03:30', NULL, NULL, NULL);
INSERT INTO `product` VALUES (51, 'Sách Comtext', 134415, 20, 72, 480, 'Kristine Weiss', 95, 'NXB Giáo dục', 2021, 'Deserunt exercitation in laborum velit non commodo adipisicing excepteur culpa. Adipisicing consequat nostrud esse labore proident dolor reprehenderit eiusmod deserunt nulla fugiat ad magna proident. Dolor deserunt pariatur ex duis nulla excepteur nisi. Ullamco nostrud minim mollit culpa sit consectetur dolor esse aliquip mollit enim eu ad pariatur. Qui commodo anim est Lorem. Eiusmod dolor occaecat sunt ex enim eu duis ullamco commodo dolor. Irure minim nostrud amet irure exercitation laboris.\r\nId fugiat minim incididunt excepteur excepteur voluptate ad duis. Velit qui amet sit laboris qui dolor ex aute consequat nisi fugiat. Ipsum anim officia sunt ex nulla eu ullamco. Reprehenderit excepteur occaecat dolor laborum non exercitation amet dolor veniam cillum sint nulla. Culpa tempor elit laboris enim id incididunt.\r\n', 'temp-13862094760385571107.jpg', b'1', '2021-09-13 19:22:19', NULL, NULL, NULL);
INSERT INTO `product` VALUES (52, 'Sách Myopium', 349335, 20, 57, 482, 'Mooney Freeman', 71, 'NXB Giáo dục', 2008, 'Eu aliqua exercitation laborum irure ea id officia. Do laboris reprehenderit anim exercitation pariatur consequat ut nostrud. Ad esse qui eiusmod mollit qui nostrud voluptate sit.\r\nNostrud velit ea non veniam reprehenderit eiusmod. Nisi labore sint duis ipsum cupidatat do. Culpa cillum minim velit deserunt. Irure quis cupidatat occaecat veniam reprehenderit nisi sunt exercitation amet consequat ea consectetur pariatur consequat. Consectetur et ex non commodo dolor proident.\r\n', 'temp-7329036107498680084.jpg', b'1', '2021-07-08 12:49:12', NULL, NULL, NULL);
INSERT INTO `product` VALUES (53, 'Sách Bittor', 388247, 20, 76, 270, 'Foley Payne', 486, 'NXB Giáo dục', 2016, 'Quis fugiat eiusmod deserunt duis eu qui aliqua magna Lorem magna et culpa. Velit sunt aliquip officia sunt mollit enim enim laboris. Anim consectetur ullamco quis ut consequat laborum ullamco sit excepteur elit laborum. Voluptate est proident ullamco consectetur excepteur dolor aliqua. Id eiusmod esse dolore anim deserunt aliquip enim occaecat pariatur consequat ipsum amet minim. Do culpa excepteur ea non dolor minim voluptate.\r\nNisi occaecat incididunt aliqua reprehenderit. Laborum pariatur esse dolore incididunt eu aute mollit cillum. Sint mollit aliqua tempor sit irure anim incididunt adipisicing voluptate irure duis commodo officia anim. Laborum pariatur exercitation laboris est labore officia do elit id. Nisi aute do duis eu ea cillum ex eiusmod sunt veniam esse velit culpa. Et laboris non sit duis deserunt sint incididunt mollit sit eiusmod esse exercitation.\r\n', 'temp-18128511448457962576.jpg', b'0', '2021-12-14 03:59:32', NULL, NULL, NULL);
INSERT INTO `product` VALUES (54, 'Sách Chillium', 144536, 20, 81, 417, 'Wynn Poole', 73, 'NXB Đại học Quốc gia Hà Nội', 1998, 'Eiusmod pariatur aliquip aliqua duis Lorem nisi duis ullamco. Esse adipisicing fugiat exercitation laboris reprehenderit excepteur. Amet magna anim amet anim tempor culpa aliqua nostrud nulla Lorem. Cillum do minim voluptate deserunt nisi ex commodo. Eiusmod commodo ut exercitation reprehenderit Lorem cupidatat aute culpa amet excepteur nulla laboris. Ex sint nulla amet officia elit in minim ad veniam sunt aliqua. Est excepteur non in occaecat laborum consectetur.\r\nEa cupidatat velit Lorem exercitation adipisicing in in nulla cupidatat labore Lorem ea aute ut. Lorem laboris id laboris ut ea tempor eiusmod laboris labore nostrud ut. Tempor eiusmod tempor est veniam ipsum quis veniam ut fugiat aliquip. Nisi duis id est anim amet do veniam laboris et aliquip consequat esse duis amet. Nulla id eu incididunt cupidatat id non cillum consequat. Nisi laborum occaecat ex anim id fugiat incididunt. Elit duis sint qui culpa aliquip duis fugiat adipisicing dolor cillum cillum voluptate.\r\n', 'temp-12235989262213754276.jpg', b'0', '2021-08-14 15:42:55', NULL, NULL, NULL);
INSERT INTO `product` VALUES (55, 'Sách Ronelon', 201895, 20, 32, 451, 'Frederick Gilliam', 51, 'NXB Đại học Quốc gia Hà Nội', 2020, 'Ex commodo consectetur proident elit tempor in minim nostrud elit nostrud. Voluptate laborum tempor ullamco non dolore aliquip dolore voluptate voluptate. Dolore enim minim et nostrud ex labore officia sunt. Enim esse voluptate exercitation tempor laborum velit. In magna culpa labore ex consectetur amet pariatur fugiat tempor eu pariatur. Do anim eu dolor ut proident. Ipsum mollit non magna ut mollit mollit ut nulla laboris ad aute aliquip sunt sint.\r\nEsse sit dolor qui nulla dolor magna. Fugiat voluptate dolore esse voluptate irure duis fugiat duis ea fugiat. Id amet qui ea veniam. Aliqua tempor culpa ea minim labore nulla proident eu aute eu in quis consectetur. Culpa fugiat anim sunt cupidatat elit eu deserunt voluptate et. Sit voluptate laboris id culpa cupidatat. Ut qui Lorem ipsum id in nulla eu ad aliqua in laboris eu culpa.\r\n', 'temp-16741118072528735594.jpg', b'0', '2021-06-09 02:42:51', NULL, NULL, NULL);
INSERT INTO `product` VALUES (56, 'Sách Roughies', 124514, 0, 31, 196, 'Pat Atkinson', 50, 'NXB Giáo dục', 2004, 'Aute aliqua dolore qui quis veniam pariatur. Aliquip ut anim qui duis proident consectetur occaecat ut est. Veniam incididunt occaecat veniam culpa culpa enim tempor et.\r\nEst consequat nulla amet ullamco labore incididunt. Ex aliqua duis ad amet culpa occaecat magna laboris ex sunt. Id ea tempor irure non ullamco nulla aliquip ipsum anim magna. Exercitation fugiat ex officia pariatur in anim aute veniam. Eiusmod aliqua cupidatat quis ea occaecat eu proident. Eiusmod magna labore incididunt velit aliquip est fugiat in laborum cillum incididunt.\r\n', 'temp-12235989262213754276.jpg', b'1', '2021-05-12 13:14:00', NULL, NULL, NULL);
INSERT INTO `product` VALUES (57, 'Sách Printspan', 153427, 0, 32, 234, 'Bartlett Hampton', 122, 'NXB Đại học Huế', 2013, 'Aliqua reprehenderit consectetur incididunt elit ullamco veniam tempor tempor incididunt labore elit. Exercitation quis pariatur pariatur ipsum ex minim. Commodo laborum qui irure ut commodo ipsum laborum Lorem occaecat excepteur in occaecat. Do ex occaecat officia ad pariatur. Sunt elit ullamco quis cillum nostrud nostrud pariatur. Ad velit officia commodo ea eiusmod exercitation aliquip et anim deserunt. Labore cillum commodo ex elit quis minim ea voluptate consequat.\r\nVelit et duis commodo cillum mollit incididunt labore. Anim ad deserunt commodo qui ea excepteur culpa qui eiusmod consequat amet. Amet do ullamco nulla laborum sit mollit aute sit ipsum fugiat adipisicing sit eu eiusmod. Dolor in nulla dolor esse consectetur voluptate ea duis fugiat commodo esse ipsum veniam qui.\r\n', 'temp-18128511448457962576.jpg', b'0', '2021-12-28 05:25:08', NULL, NULL, NULL);
INSERT INTO `product` VALUES (58, 'Sách Quantalia', 101367, 20, 90, 305, 'Cherry Hopper', 409, 'NXB Giáo dục', 2019, 'Ex sunt elit minim commodo minim reprehenderit consectetur ea dolor. Sit reprehenderit velit labore deserunt ea incididunt aute pariatur ex. Est adipisicing veniam dolore ut in ad magna sint.\r\nAd qui cillum nulla pariatur mollit ipsum duis labore officia dolor ullamco aliquip mollit. Aliqua labore occaecat tempor commodo eu sunt magna proident duis. Eu magna officia aute minim ex aliquip irure et sunt anim pariatur excepteur sit laboris. Occaecat laborum est voluptate velit. Quis id aliquip eiusmod deserunt nostrud ullamco qui deserunt pariatur eiusmod ea consequat. Officia consectetur ipsum ea dolore magna. Lorem ut mollit magna amet labore id officia veniam ea id est aliqua.\r\n', 'temp-14438611480196141526.jpg', b'0', '2021-06-24 07:23:29', NULL, NULL, NULL);
INSERT INTO `product` VALUES (59, 'Sách Fortean', 243231, 0, 94, 444, 'Tabitha Shepherd', 357, 'NXB Đại học Quốc gia Hà Nội', 2008, 'Amet et elit labore fugiat magna ullamco proident ut excepteur ea elit commodo. Nisi anim laborum nisi irure eiusmod labore. Consectetur sit enim ex veniam eiusmod mollit nulla irure voluptate.\r\nCommodo exercitation sit quis sit officia commodo voluptate aliqua minim. Et dolor non occaecat amet enim ex elit. Amet nisi laborum exercitation duis culpa irure duis eu laborum cupidatat duis excepteur laboris Lorem. Commodo dolore cillum esse ullamco. Enim excepteur elit voluptate ex laboris ut qui. Eiusmod duis veniam dolore dolore enim fugiat. Aliqua adipisicing nulla duis anim esse nostrud in et pariatur.\r\n', 'temp-16741118072528735594.jpg', b'0', '2021-09-21 11:22:31', NULL, NULL, NULL);
INSERT INTO `product` VALUES (60, 'Sách Kengen', 262167, 20, 15, 473, 'Cooke Barber', 79, 'NXB Đại học Quốc gia Hà Nội', 1997, 'Proident sint quis culpa do id eiusmod mollit in culpa ut anim. Exercitation tempor laboris ea ex. Pariatur elit eu duis reprehenderit reprehenderit aliquip magna sunt cupidatat laborum officia esse. Occaecat aliqua qui pariatur minim dolore. Aliquip exercitation reprehenderit nostrud elit cupidatat. Aliqua ex commodo dolore nulla voluptate mollit.\r\nMollit proident est aliquip esse qui minim dolor deserunt mollit. Qui est excepteur voluptate in irure nostrud qui. Reprehenderit Lorem enim labore aliquip magna do nulla amet.\r\n', 'temp-3984373128647845854.jpg', b'0', '2021-11-22 16:02:54', NULL, NULL, NULL);
INSERT INTO `product` VALUES (61, 'Sách Dyno', 422493, 20, 50, 32, 'Laura Simpson', 354, 'NXB Đại học Quốc gia Hà Nội', 1997, 'Proident pariatur ullamco elit aliquip mollit magna sunt ad eiusmod. Ad qui do occaecat do laboris est. Dolor nisi ea exercitation magna ex tempor est reprehenderit magna officia.\r\nLaboris aute mollit incididunt tempor eu aliqua amet sit. Eiusmod aute commodo reprehenderit eiusmod ea consectetur eu. Labore eiusmod nulla ullamco elit adipisicing esse sit proident nostrud magna. Sunt aute et minim consectetur cupidatat dolor aliqua do reprehenderit occaecat id nisi aliqua. Id duis labore sunt sunt aliquip veniam.\r\n', 'temp-13064240004351430671.jpg', b'1', '2021-09-16 06:34:31', NULL, NULL, NULL);
INSERT INTO `product` VALUES (62, 'Sách Geekmosis', 396421, 0, 96, 210, 'Gayle Castillo', 354, 'NXB Đại học Huế', 2006, 'Anim proident et ex ut irure cillum magna non incididunt ipsum dolor. Dolore consectetur amet eiusmod officia veniam. Officia aliquip aute excepteur eiusmod enim non Lorem amet. Duis eiusmod cupidatat eu in fugiat cupidatat enim irure ullamco aliqua. Adipisicing consequat minim officia ex tempor.\r\nExercitation velit ea cillum est sunt ea sit mollit. Reprehenderit adipisicing et nulla velit fugiat pariatur deserunt incididunt ipsum qui veniam est. Pariatur ex ad deserunt incididunt laborum laboris incididunt commodo.\r\n', 'temp-10075522682831764585.jpg', b'1', '2021-02-20 05:53:34', NULL, NULL, NULL);
INSERT INTO `product` VALUES (63, 'Sách Earbang', 162841, 20, 21, 47, 'Elliott Pace', 150, 'NXB Đại học Sư phạm TP.HCM', 2017, 'Amet veniam voluptate consequat adipisicing officia et fugiat cillum ut ullamco elit ea do sit. Ipsum incididunt elit laboris Lorem nostrud duis ipsum sunt id ullamco qui commodo consectetur. Officia elit ad voluptate occaecat consectetur magna do deserunt. Do eu Lorem laborum proident Lorem adipisicing incididunt occaecat ut deserunt dolor. Proident et ea fugiat est incididunt sint id dolor enim laborum laborum officia id. Excepteur anim cillum dolor irure consectetur incididunt do sunt culpa nisi excepteur sit cupidatat.\r\nExercitation adipisicing ipsum magna ex exercitation consequat ullamco. Sunt excepteur nisi do eiusmod aute exercitation labore amet. Pariatur magna est aute id. Est ad tempor sint amet anim.\r\n', 'temp-8262627340495498759.jpg', b'1', '2021-09-02 07:50:35', NULL, NULL, NULL);
INSERT INTO `product` VALUES (64, 'Sách Rodeology', 473815, 0, 10, 370, 'Chelsea Wong', 396, 'NXB Giáo dục', 2009, 'Ipsum magna laborum do officia non quis duis sunt est ipsum. Eu nulla irure aliquip anim minim elit aliqua officia do culpa enim in. Ex qui esse dolor nulla occaecat mollit laborum sunt laboris laboris. Laboris nostrud cillum cupidatat do reprehenderit voluptate elit eu fugiat consectetur. Duis aute labore ea aliqua proident nisi amet aliquip Lorem irure amet veniam aute. Non ea esse duis eiusmod sint nisi et consectetur aliqua consequat cillum ad eu.\r\nNulla Lorem anim aute exercitation consectetur pariatur occaecat exercitation eu commodo. Esse culpa esse enim labore dolore sit deserunt. Ea et qui in Lorem.\r\n', 'temp-14438611480196141526.jpg', b'0', '2021-07-18 03:36:32', NULL, NULL, NULL);
INSERT INTO `product` VALUES (65, 'Sách Locazone', 466018, 0, 58, 196, 'Katina Terrell', 294, 'NXB Đại học Quốc gia Hà Nội', 1996, 'Deserunt cillum culpa in anim voluptate quis quis laborum in non. Irure aliqua laboris exercitation veniam eu. Excepteur enim dolore incididunt magna ad ea anim elit ullamco eiusmod sit incididunt. Ut eiusmod proident sint est non culpa nulla tempor adipisicing.\r\nEiusmod elit occaecat magna nostrud sit. Et in dolore ipsum et cillum reprehenderit voluptate. Sint velit proident commodo ullamco elit esse exercitation exercitation nostrud qui.\r\n', 'temp-6352099207348952932.jpg', b'1', '2021-12-08 23:10:27', NULL, NULL, NULL);
INSERT INTO `product` VALUES (66, 'Sách Zentime', 8106, 20, 25, 162, 'Alfreda Randolph', 161, 'NXB Đại học Sư phạm Hà Nội', 2021, 'Quis aliquip minim irure nisi. Sint in quis adipisicing eu aliqua ex id consectetur aliquip excepteur duis adipisicing duis. Labore eu duis eu consectetur qui ipsum nisi excepteur quis minim duis. Consectetur aute ipsum ipsum anim dolore esse proident do magna adipisicing ipsum qui. Occaecat reprehenderit consequat ad fugiat reprehenderit dolore cillum nulla et.\r\nUt dolor est reprehenderit duis. Excepteur tempor anim fugiat eu aliquip enim nisi anim pariatur. Sint pariatur cillum laborum id duis voluptate ipsum labore quis voluptate tempor fugiat laborum. Anim officia id Lorem reprehenderit elit minim Lorem voluptate id minim velit ipsum. Fugiat Lorem cupidatat duis id id fugiat fugiat occaecat.\r\n', 'temp-13862094760385571107.jpg', b'0', '2021-12-13 11:25:39', NULL, NULL, NULL);
INSERT INTO `product` VALUES (67, 'Sách Xelegyl', 117223, 0, 40, 270, 'Helene Campbell', 340, 'NXB Đại học Huế', 2013, 'Veniam et et fugiat cillum veniam consectetur dolor laborum ipsum aliquip in commodo. Occaecat nisi proident et est dolor voluptate commodo. Sit culpa do commodo nulla ut ad excepteur quis. Voluptate cillum cillum labore non consectetur. Pariatur in ea ex veniam ad veniam in fugiat commodo. Veniam consequat culpa anim aliqua sit nostrud et fugiat esse non non commodo commodo quis.\r\nCillum ut aliquip mollit Lorem ea exercitation. Sit ullamco quis exercitation pariatur. Exercitation dolore magna aliquip laborum occaecat sit. Laboris velit sunt nisi occaecat aliquip qui exercitation ut irure amet cupidatat. Minim officia exercitation consequat ad. Nostrud nisi aute sit ut ad irure ullamco.\r\n', 'temp-8476700387786158058.jpg', b'0', '2021-09-11 01:01:32', NULL, NULL, NULL);
INSERT INTO `product` VALUES (68, 'Sách Oatfarm', 299156, 0, 43, 90, 'Joyner Jarvis', 10, 'NXB Đại học Huế', 2017, 'Dolore aliquip ullamco id ut cupidatat exercitation nulla non veniam adipisicing do elit id. Ea dolor dolor duis esse ex. Irure pariatur aute minim qui veniam in amet nostrud. Dolor labore magna incididunt id mollit sit aute minim nisi amet veniam magna mollit. Excepteur ut cillum veniam labore non enim excepteur eu. Eiusmod cupidatat fugiat cillum cillum. Tempor eu adipisicing consectetur dolor non.\r\nElit voluptate veniam veniam consequat adipisicing duis amet id laboris cillum eiusmod laborum eu. Magna reprehenderit laborum laborum enim qui in aliquip. Officia cillum tempor consectetur pariatur eu veniam non magna elit. Velit aute do amet ad laboris do dolore reprehenderit do ex consectetur excepteur.\r\n', 'temp-3984373128647845854.jpg', b'0', '2021-06-18 17:25:37', NULL, NULL, NULL);
INSERT INTO `product` VALUES (69, 'Sách Dymi', 382118, 20, 50, 381, 'Deirdre Hatfield', 442, 'NXB Giáo dục', 2020, 'Eiusmod anim exercitation aliquip et cupidatat id consectetur exercitation nostrud enim irure mollit non. Excepteur nisi et quis duis ad anim minim. Tempor consectetur id consectetur tempor id culpa amet culpa esse velit laborum veniam est proident. Ipsum proident ullamco ex ullamco velit exercitation. Eiusmod culpa eiusmod aute velit velit veniam tempor esse aliqua. Non nisi Lorem quis id sit consectetur qui magna magna quis ex. Aliqua incididunt adipisicing id tempor.\r\nOccaecat sint elit reprehenderit amet. Esse do sint id magna et nulla. Ipsum cupidatat mollit mollit labore consequat excepteur tempor do sint laborum sit adipisicing id reprehenderit. Do ea consectetur adipisicing do consectetur laborum. Amet elit laborum voluptate ipsum mollit adipisicing Lorem nisi labore ea tempor eiusmod amet.\r\n', 'temp-13064240004351430671.jpg', b'0', '2021-02-12 15:13:38', NULL, NULL, NULL);
INSERT INTO `product` VALUES (70, 'Sách Injoy', 444695, 20, 71, 176, 'Patty Caldwell', 79, 'NXB Đại học Quốc gia Hà Nội', 2001, 'Quis aute occaecat fugiat mollit eu est sunt eu ipsum do excepteur culpa. Quis id adipisicing culpa Lorem pariatur sit amet ut fugiat. Sit aliquip adipisicing et reprehenderit. Do consectetur commodo et commodo exercitation consectetur aliquip sit quis pariatur reprehenderit magna consequat cupidatat. Cupidatat ea adipisicing ex velit reprehenderit dolor sunt. Velit elit officia ut fugiat cupidatat aute consequat culpa. Do excepteur adipisicing non ipsum ullamco.\r\nIpsum occaecat deserunt eiusmod exercitation commodo velit id ut aliquip cillum laborum do nulla reprehenderit. Ut deserunt voluptate ex mollit. Elit proident ex in velit. Cillum culpa dolor in elit adipisicing aute magna anim qui sunt.\r\n', 'temp-13862094760385571107.jpg', b'0', '2021-11-16 22:29:49', NULL, NULL, NULL);
INSERT INTO `product` VALUES (71, 'Sách Globoil', 375062, 0, 25, 59, 'Steele Henson', 362, 'NXB Đại học Sư phạm Hà Nội', 2016, 'Eiusmod do laboris magna ex eiusmod laboris nostrud aliqua anim. Non esse quis amet officia ea enim. Excepteur id incididunt aliquip labore velit fugiat Lorem ad dolor ipsum est ex. Quis qui ex nulla ipsum cillum ad id dolor ex eu. Consequat sunt et tempor deserunt duis ex mollit commodo.\r\nUllamco elit amet id sit pariatur quis sint anim nulla. Cupidatat ullamco ex anim magna adipisicing veniam anim duis ipsum deserunt magna aliqua. Elit pariatur ullamco est qui esse cillum. Adipisicing adipisicing ipsum occaecat consequat do pariatur irure ad. Reprehenderit magna sit nostrud anim quis est laboris deserunt ut esse duis. Exercitation non elit aliqua minim eu ipsum do sint do officia minim.\r\n', 'temp-16741118072528735594.jpg', b'1', '2021-12-22 12:50:21', NULL, NULL, NULL);
INSERT INTO `product` VALUES (72, 'Sách Daido', 170140, 20, 47, 398, 'Dotson Lloyd', 136, 'NXB Đại học Quốc gia Hà Nội', 2012, 'Dolore ipsum occaecat in magna elit Lorem est. Quis eu anim minim non sit minim. Officia adipisicing sit ullamco sunt mollit pariatur ullamco sint sint consectetur est qui. Fugiat cillum incididunt amet adipisicing ullamco ea Lorem voluptate est consectetur quis enim ipsum. Cillum dolore cupidatat et labore excepteur exercitation non sunt nostrud laborum non. Nostrud et enim aute enim ipsum dolore occaecat occaecat nostrud nulla aliquip aliquip sit.\r\nCupidatat veniam aute cillum commodo aliquip quis aliquip eu adipisicing minim ipsum. Sit enim aliqua excepteur cupidatat. Enim consequat adipisicing excepteur in sint veniam esse officia ex Lorem sint ad do.\r\n', 'temp-16741118072528735594.jpg', b'0', '2021-06-25 04:03:26', NULL, NULL, NULL);
INSERT INTO `product` VALUES (73, 'Sách Coash', 443683, 20, 59, 367, 'Lillie Hurst', 67, 'NXB Đại học Sư phạm TP.HCM', 2008, 'Veniam duis cupidatat adipisicing sunt sit. Enim laboris eu veniam nulla nulla enim. Et velit sunt pariatur dolore et quis reprehenderit consectetur eiusmod fugiat et nisi elit dolor. Est aliqua commodo irure quis est do culpa quis officia culpa nostrud. Anim velit dolore amet magna excepteur amet commodo aliqua consectetur voluptate ut consectetur.\r\nQui ipsum nulla ex pariatur eu in cupidatat. Voluptate in ipsum officia do aliqua ipsum nostrud officia consequat proident excepteur laborum. Exercitation ex aute elit duis ad eiusmod. Tempor ullamco qui nostrud ipsum enim sit. Mollit ullamco in dolore ullamco magna proident qui qui laborum.\r\n', 'temp-3984373128647845854.jpg', b'0', '2021-12-13 00:50:17', NULL, NULL, NULL);
INSERT INTO `product` VALUES (74, 'Sách Automon', 109059, 0, 70, 60, 'Melissa Hayes', 301, 'NXB Đại học Sư phạm Hà Nội', 2009, 'Dolor ex commodo Lorem fugiat. Ullamco dolor proident mollit consequat ex irure adipisicing. Ut enim fugiat deserunt cupidatat sunt officia reprehenderit dolore sint qui culpa.\r\nDolor minim incididunt pariatur minim qui commodo veniam cupidatat. Exercitation culpa do commodo voluptate dolor amet aute eiusmod veniam aute aute pariatur adipisicing veniam. Est voluptate anim anim enim aliqua dolore ad ex ex et et. Exercitation Lorem amet sit in ex culpa incididunt irure. Enim sunt duis dolore cupidatat. Dolor eiusmod consectetur incididunt officia nostrud qui amet.\r\n', 'temp-10075522682831764585.jpg', b'0', '2021-05-22 05:34:50', NULL, NULL, NULL);
INSERT INTO `product` VALUES (75, 'Sách Genmom', 118544, 0, 79, 119, 'Delores Johnson', 418, 'NXB Giáo dục', 2007, 'Commodo eiusmod est eu eu. Cillum deserunt aliquip amet cupidatat Lorem sint. Cillum mollit pariatur ullamco excepteur dolor incididunt Lorem duis laboris irure ipsum sunt irure. In amet sunt pariatur mollit mollit sint amet. Elit reprehenderit veniam mollit laboris fugiat proident fugiat occaecat elit nostrud minim. Lorem exercitation reprehenderit id nisi do. Veniam reprehenderit nulla sint id cillum est eu irure eiusmod nisi aute.\r\nEiusmod id nostrud magna culpa laboris in duis exercitation elit nulla consequat in quis non. Veniam proident exercitation nisi et sint tempor. Do incididunt ea officia officia ut. Est amet irure qui consectetur eiusmod ut elit aliqua elit exercitation quis.\r\n', 'temp-18128511448457962576.jpg', b'0', '2021-02-10 13:36:37', NULL, NULL, NULL);
INSERT INTO `product` VALUES (76, 'Sách Idetica', 27956, 0, 69, 50, 'Veronica Coffey', 104, 'NXB Giáo dục', 2014, 'Aliquip enim commodo dolore nulla dolore mollit exercitation fugiat eu ex commodo. Incididunt ipsum amet incididunt Lorem. Consequat magna amet sint nisi labore nisi. Aute laborum mollit aute reprehenderit ad. Ut nostrud fugiat laborum officia anim dolore incididunt dolore adipisicing consequat nostrud duis ea.\r\nSint sint minim eiusmod nisi. Veniam culpa aute dolor sint elit proident do. Labore magna nulla laboris aute labore et excepteur nisi aliqua.\r\n', 'temp-6352099207348952932.jpg', b'0', '2021-02-13 00:56:55', NULL, NULL, NULL);
INSERT INTO `product` VALUES (77, 'Sách Enerforce', 364658, 0, 89, 207, 'Spencer Marshall', 475, 'NXB Đại học Sư phạm TP.HCM', 1999, 'Id laborum aute duis id excepteur exercitation nostrud ad qui sit. Occaecat non veniam qui non velit cupidatat. Non Lorem culpa cillum enim et amet pariatur id pariatur ea sint ea. Pariatur voluptate quis culpa occaecat dolor id consequat quis commodo aliquip deserunt. Consequat elit consequat labore veniam est laboris esse esse. Duis commodo sint voluptate sint mollit esse labore officia reprehenderit laborum irure id.\r\nSunt eu enim labore anim mollit sint ipsum labore cillum consequat cupidatat velit. Culpa commodo irure enim consequat velit reprehenderit nostrud reprehenderit sunt. Exercitation nisi sit id amet duis ullamco officia dolor ea consequat adipisicing minim enim. Cupidatat Lorem cupidatat officia aute et mollit ad irure elit ut.\r\n', 'temp-7329036107498680084.jpg', b'0', '2022-01-04 19:49:25', NULL, NULL, NULL);
INSERT INTO `product` VALUES (78, 'Sách Kenegy', 104405, 0, 92, 406, 'Carrie Boone', 150, 'NXB Đại học Sư phạm TP.HCM', 2011, 'Pariatur ex labore deserunt non deserunt aliqua non reprehenderit elit fugiat elit officia reprehenderit laboris. Irure veniam veniam fugiat aliqua officia ullamco ex sit. Qui esse consequat ipsum sunt et aliqua exercitation Lorem deserunt tempor sunt ullamco. Esse fugiat laborum ut Lorem ad fugiat reprehenderit. Exercitation consequat cupidatat anim sint exercitation est dolor mollit ut cillum non eiusmod eu voluptate. Labore elit sunt labore velit ad anim. Dolor id aliquip et anim sint sint proident duis in sint.\r\nUllamco ad id deserunt reprehenderit deserunt ad laborum ad. Laboris id amet dolor ad ex ut id. Exercitation et velit duis amet elit.\r\n', 'temp-7329036107498680084.jpg', b'1', '2022-01-04 10:35:13', NULL, NULL, NULL);
INSERT INTO `product` VALUES (79, 'Sách Krag', 293321, 20, 84, 31, 'Isabelle Justice', 346, 'NXB Đại học Sư phạm TP.HCM', 2008, 'Aute irure consectetur sunt do incididunt. Nostrud labore excepteur ea tempor esse id. Fugiat esse pariatur tempor labore in consequat in ea duis laboris tempor Lorem enim fugiat. Irure proident excepteur proident cillum voluptate ex. Laborum minim eu do nisi nostrud quis quis aliquip qui magna. Commodo adipisicing reprehenderit consectetur fugiat ex sint magna cillum veniam proident occaecat adipisicing consequat id. Ullamco voluptate enim velit do laboris cillum irure amet adipisicing culpa cupidatat laboris adipisicing.\r\nElit deserunt incididunt incididunt sint occaecat do. Eu nulla dolor sunt laborum mollit deserunt eu aute. Et minim Lorem commodo cillum excepteur quis amet aliquip deserunt. Sunt aliquip tempor adipisicing consectetur quis voluptate exercitation. Anim cillum proident tempor in incididunt fugiat proident amet aliqua esse.\r\n', 'temp-3015888053636485125.jpg', b'0', '2021-10-25 15:41:19', NULL, NULL, NULL);
INSERT INTO `product` VALUES (80, 'Sách Sealoud', 380540, 0, 73, 268, 'Adele Martinez', 499, 'NXB Đại học Huế', 2019, 'Ut esse aliquip proident excepteur et fugiat ullamco fugiat dolor et velit fugiat sit. Occaecat nisi cillum ex consequat deserunt irure sint laborum. Ut dolor qui et do enim. Quis anim id cillum quis minim ad culpa. Mollit Lorem ut aute ex et enim. Enim nostrud labore cillum laboris nisi laborum duis irure laboris cillum deserunt proident. Deserunt ex ut dolor ex reprehenderit est.\r\nIpsum laborum cupidatat cillum qui magna reprehenderit anim do velit nostrud quis ipsum pariatur velit. Consectetur commodo excepteur mollit in do officia veniam. Proident id occaecat dolore aliqua Lorem ea officia veniam commodo Lorem elit tempor eu.\r\n', 'temp-7329036107498680084.jpg', b'0', '2021-08-01 19:32:05', NULL, NULL, NULL);
INSERT INTO `product` VALUES (81, 'Sách Isologics', 268413, 20, 32, 384, 'Jewell Whitfield', 381, 'NXB Đại học Sư phạm Hà Nội', 2010, 'Ut sit fugiat reprehenderit ipsum aliqua incididunt consequat reprehenderit. Consequat eiusmod minim cupidatat anim id veniam voluptate eu tempor nisi proident quis elit. Elit consequat voluptate aliqua consectetur.\r\nLaboris pariatur sit eiusmod quis culpa. Duis ea commodo consectetur ad enim sit id nulla minim. Exercitation elit nostrud voluptate Lorem officia magna excepteur veniam officia sunt voluptate ullamco consequat. Adipisicing tempor labore sit ad eiusmod ipsum veniam occaecat velit exercitation occaecat enim aute ad. Irure dolore velit culpa pariatur eiusmod velit laborum reprehenderit esse commodo magna aliquip officia et. Irure nulla id consequat aute cupidatat ad ipsum.\r\n', 'temp-16741118072528735594.jpg', b'0', '2021-11-28 16:51:08', NULL, NULL, NULL);
INSERT INTO `product` VALUES (82, 'Sách Exiand', 187140, 20, 54, 320, 'Giles Mcdowell', 280, 'NXB Giáo dục', 2020, 'Consequat reprehenderit reprehenderit aliquip amet aliqua fugiat duis eiusmod est in in nostrud. Nostrud occaecat adipisicing incididunt anim esse sint quis irure officia minim. Voluptate labore elit occaecat nostrud qui.\r\nId adipisicing aliqua consequat aliquip ad consectetur ut fugiat. Aliquip est laboris dolor amet aute sunt enim irure nostrud. Quis deserunt nulla deserunt tempor. Eiusmod laboris incididunt do minim sit anim incididunt incididunt id minim in.\r\n', 'temp-13862094760385571107.jpg', b'0', '2021-11-14 02:53:14', NULL, NULL, NULL);
INSERT INTO `product` VALUES (83, 'Sách Terragen', 103129, 0, 51, 388, 'Jackson Fernandez', 264, 'NXB Đại học Quốc gia Hà Nội', 2009, 'Irure deserunt duis ut commodo consequat esse officia. Non laboris enim nostrud veniam. Tempor proident esse consectetur nostrud ea enim in Lorem deserunt. Nisi ullamco consequat officia dolor.\r\nVoluptate qui ipsum id cupidatat ad consequat dolore sunt. Dolor sit id deserunt fugiat sint esse consectetur sit elit incididunt. Voluptate adipisicing irure cillum tempor laborum do. Laborum proident magna mollit aute culpa. Ullamco dolor non amet laboris. Elit proident nisi consequat aliquip.\r\n', 'temp-16741118072528735594.jpg', b'0', '2021-10-29 15:47:05', NULL, NULL, NULL);
INSERT INTO `product` VALUES (84, 'Sách Accidency', 44192, 20, 69, 128, 'Blackburn West', 357, 'NXB Đại học Huế', 2020, 'Nisi esse excepteur sit id adipisicing do voluptate cupidatat voluptate in. Sunt fugiat anim laborum reprehenderit ad consequat ullamco eu mollit occaecat adipisicing laboris. Anim veniam exercitation sint in qui ea duis eiusmod sint qui.\r\nEiusmod mollit non deserunt do. Ex et est non laborum nostrud culpa qui magna adipisicing qui sint labore sit cillum. Id duis laborum velit amet. Proident culpa anim incididunt eu ad labore labore aliquip dolor voluptate officia aute laborum. Tempor exercitation pariatur cillum fugiat sint irure est et esse anim occaecat nulla excepteur sunt.\r\n', 'temp-13862094760385571107.jpg', b'1', '2021-02-07 02:11:02', NULL, NULL, NULL);
INSERT INTO `product` VALUES (85, 'Sách Hairport', 367922, 20, 96, 422, 'Harris Zamora', 328, 'NXB Đại học Sư phạm Hà Nội', 2003, 'Est enim veniam proident ad excepteur cillum ex irure magna duis enim exercitation aliquip fugiat. Esse et magna excepteur ea quis consequat magna do dolore velit sint consectetur nisi. Ex consequat sint sint ullamco quis qui irure id velit incididunt duis laboris culpa.\r\nEa sit eiusmod deserunt sint officia esse velit. Esse irure ex laborum et. Do est labore aute sunt anim do quis minim aute commodo incididunt consequat eu proident. Ex irure eiusmod pariatur consectetur dolore pariatur sint pariatur magna non pariatur.\r\n', 'temp-13862094760385571107.jpg', b'0', '2021-10-24 09:47:35', NULL, NULL, NULL);
INSERT INTO `product` VALUES (86, 'Sách Shepard', 215739, 20, 85, 134, 'Elsie Peters', 198, 'NXB Đại học Huế', 2007, 'Voluptate duis mollit aliquip culpa sint pariatur cillum Lorem. Ullamco ex exercitation sint duis eiusmod aliqua est elit. Adipisicing cupidatat esse deserunt sint occaecat nisi elit ex quis incididunt sunt. Pariatur irure laborum aute consequat dolore proident dolore tempor labore minim fugiat consequat. Sit laboris aliquip sit laboris nostrud duis incididunt dolore cillum nisi nostrud ea cupidatat. Tempor ipsum dolor aliqua magna ea ipsum occaecat dolor laboris labore. Magna labore deserunt proident dolore deserunt anim aliqua.\r\nIncididunt veniam exercitation dolor ullamco sit est. Ex in adipisicing eiusmod pariatur voluptate do. Elit dolor ea consectetur mollit. Incididunt nisi nostrud id do officia duis non ex ea velit. Est anim magna est aliquip ea quis qui dolor laboris culpa. Et sunt officia veniam anim ipsum ea aute reprehenderit occaecat proident duis.\r\n', 'temp-3015888053636485125.jpg', b'1', '2021-04-21 09:30:10', NULL, NULL, NULL);
INSERT INTO `product` VALUES (87, 'Sách Pigzart', 91054, 20, 16, 420, 'Roach Nielsen', 279, 'NXB Đại học Sư phạm Hà Nội', 2005, 'Excepteur aute Lorem proident excepteur magna sit. Labore ex qui amet esse cupidatat nulla exercitation sint culpa deserunt fugiat ut nulla. Ex officia Lorem commodo cillum ad duis do magna sint. Amet esse Lorem laboris mollit dolore consectetur consequat pariatur.\r\nEx sint adipisicing culpa consectetur id aute aliquip amet esse. Ipsum est anim elit nostrud irure id pariatur in. Incididunt commodo ex ea ut amet magna esse sint. Adipisicing dolore id officia aliqua. Eu Lorem aute excepteur qui in est nulla enim est aliqua cupidatat consequat aliquip. Reprehenderit voluptate et ut culpa minim fugiat ex velit ex duis duis. Et Lorem laboris dolore magna pariatur proident ut.\r\n', 'temp-13064240004351430671.jpg', b'1', '2021-03-31 07:39:02', NULL, NULL, NULL);
INSERT INTO `product` VALUES (88, 'Sách Orbaxter', 270543, 0, 54, 140, 'Diaz Howard', 156, 'NXB Đại học Huế', 2000, 'Do aute occaecat qui velit pariatur sit aute Lorem ea fugiat enim ullamco sunt cillum. Excepteur excepteur aliquip exercitation laborum veniam excepteur amet eiusmod amet id commodo. Proident sint ex laborum consequat est irure magna magna nulla pariatur tempor et incididunt. Nostrud tempor officia est cillum sunt excepteur do cupidatat velit. Commodo id ad ex elit aliquip commodo ea proident officia fugiat deserunt aliqua. Eiusmod adipisicing dolore est Lorem consectetur cupidatat velit laboris nulla. Est id non incididunt consectetur elit exercitation magna reprehenderit velit qui.\r\nMagna sunt fugiat velit eiusmod excepteur cillum occaecat. Ipsum et tempor consequat elit nulla est. Non exercitation proident exercitation elit.\r\n', 'temp-8476700387786158058.jpg', b'1', '2021-06-15 14:51:43', NULL, NULL, NULL);
INSERT INTO `product` VALUES (89, 'Sách Cowtown', 29992, 20, 49, 318, 'Mitzi Koch', 191, 'NXB Đại học Sư phạm Hà Nội', 1998, 'Qui elit irure sunt esse voluptate ex laborum. Lorem elit commodo voluptate labore et laboris consectetur. Sunt ut consectetur mollit et.\r\nId excepteur ad velit eiusmod ut eiusmod culpa quis ad. Dolor cillum laborum nisi irure. Excepteur nulla magna anim occaecat minim dolor reprehenderit deserunt officia qui magna occaecat. Anim aute et officia excepteur culpa qui culpa aliquip enim cillum.\r\n', 'temp-6243426685116508297.jpg', b'0', '2021-12-21 11:16:02', NULL, NULL, NULL);
INSERT INTO `product` VALUES (90, 'Sách Makingway', 205442, 20, 85, 380, 'Cynthia Rasmussen', 346, 'NXB Đại học Quốc gia Hà Nội', 2015, 'Nisi qui amet ipsum ea nulla dolor nulla. Consectetur et culpa dolore quis aliqua nulla consequat consequat laborum et. Cillum ex cupidatat dolor cillum sit. Lorem tempor voluptate cillum minim magna sit quis reprehenderit.\r\nEnim Lorem officia quis anim nulla pariatur labore eu minim fugiat esse sint. Cillum duis eu do voluptate laborum id id. Duis nostrud consectetur dolore deserunt. Occaecat velit duis voluptate officia officia duis minim consequat nulla officia non labore nulla. Fugiat irure quis irure fugiat quis ut velit cillum do anim nulla. Incididunt nisi incididunt ullamco voluptate amet dolore adipisicing pariatur cillum.\r\n', 'temp-7329036107498680084.jpg', b'1', '2021-09-02 03:01:38', NULL, NULL, NULL);
INSERT INTO `product` VALUES (91, 'Sách Lunchpad', 129694, 20, 26, 133, 'Bryant Ball', 318, 'NXB Đại học Sư phạm TP.HCM', 2009, 'Quis mollit ipsum ad laboris velit sit est anim ullamco sunt esse. Est esse occaecat sunt tempor tempor tempor id quis ipsum. Ullamco sint eiusmod anim laborum proident deserunt aliquip quis esse aute quis sint minim adipisicing. Labore mollit ex deserunt pariatur nostrud dolore ad labore ex ullamco mollit cupidatat sit. Aliqua ipsum amet nostrud anim.\r\nCupidatat ad veniam esse tempor incididunt pariatur cillum ea dolore irure. Qui ut mollit nisi velit elit. Aliquip ullamco elit velit consectetur commodo excepteur ea non tempor ipsum mollit qui. Id Lorem velit do minim deserunt pariatur nulla proident et sunt pariatur fugiat sint. Eu anim ut consectetur reprehenderit consectetur minim dolor et deserunt sunt exercitation enim veniam. Ad aute labore non eiusmod. Pariatur exercitation Lorem enim elit.\r\n', 'temp-6352099207348952932.jpg', b'1', '2021-03-25 11:05:04', NULL, NULL, NULL);
INSERT INTO `product` VALUES (92, 'Sách Mediot', 216835, 20, 78, 114, 'Rosemary Sampson', 321, 'NXB Đại học Quốc gia Hà Nội', 1998, 'Ut deserunt esse excepteur aliqua commodo Lorem ad et. Non officia Lorem amet qui. Ea cillum qui est ex ea mollit. Voluptate ad id est eiusmod esse officia voluptate sint aute do aute. Labore non ullamco aute ut velit proident ullamco velit veniam non amet.\r\nMinim sunt enim esse cillum. Aliqua dolor velit nostrud ipsum consequat nisi incididunt qui. Pariatur mollit ex ullamco nulla. Ipsum pariatur qui nostrud Lorem deserunt eu ipsum. Est fugiat cillum pariatur adipisicing laborum velit elit qui quis exercitation est officia commodo. Exercitation culpa nulla reprehenderit culpa consectetur Lorem quis aute amet occaecat.\r\n', 'temp-6352099207348952932.jpg', b'0', '2021-05-17 13:49:26', NULL, NULL, NULL);
INSERT INTO `product` VALUES (93, 'Sách Plasto', 215800, 20, 55, 85, 'Santiago Levine', 267, 'NXB Đại học Quốc gia Hà Nội', 2001, 'Amet aliquip sunt in commodo excepteur esse ea aliqua laboris in. Lorem consequat tempor reprehenderit amet occaecat proident deserunt voluptate elit elit excepteur nisi in. Lorem commodo aliquip proident fugiat proident Lorem qui incididunt consectetur nostrud cupidatat quis deserunt. Nulla deserunt commodo nostrud nostrud veniam id proident laborum in in. Qui laboris consectetur cupidatat tempor amet in in in. Laborum ipsum consectetur laboris dolore magna laborum laboris deserunt proident nulla. Elit proident amet minim adipisicing.\r\nSit dolore ullamco mollit veniam ullamco consectetur reprehenderit occaecat. Est incididunt ea laborum labore enim aute aliquip laboris aute. Pariatur exercitation aute in magna. Exercitation est nulla ex fugiat. Magna nostrud proident reprehenderit et laboris. Dolore reprehenderit nulla deserunt quis proident do exercitation do reprehenderit. Qui proident excepteur commodo nostrud minim commodo exercitation.\r\n', 'temp-13064240004351430671.jpg', b'1', '2022-01-27 21:49:53', NULL, NULL, NULL);
INSERT INTO `product` VALUES (94, 'Sách Geekola', 332072, 20, 42, 165, 'Austin Cain', 274, 'NXB Đại học Sư phạm TP.HCM', 2010, 'Duis veniam ad nisi nostrud aliquip ex aliquip laboris ipsum eu velit dolor dolor in. Pariatur dolore amet laborum deserunt aute veniam cillum. Laborum incididunt in duis minim consequat voluptate non dolore fugiat nisi. Ex labore consequat et nostrud sunt enim eu cillum.\r\nEa non voluptate exercitation reprehenderit. Nisi sint enim enim adipisicing enim exercitation sit minim pariatur officia ipsum aliquip. Consectetur nulla Lorem fugiat eu anim pariatur Lorem elit ad adipisicing. Enim sint Lorem tempor ipsum eiusmod duis. Amet proident ipsum irure adipisicing officia ipsum labore consequat veniam fugiat. Est labore irure in eiusmod irure cillum officia cupidatat aute.\r\n', 'temp-14438611480196141526.jpg', b'0', '2021-04-28 06:56:06', NULL, NULL, NULL);
INSERT INTO `product` VALUES (95, 'Sách Gracker', 268831, 0, 49, 248, 'Vasquez Gallegos', 230, 'NXB Giáo dục', 2006, 'Consequat sunt non aute irure voluptate reprehenderit enim consectetur sit sint sit. Qui ullamco officia id commodo mollit velit nulla sint laboris amet voluptate. Exercitation aliquip reprehenderit enim ut eiusmod sit ullamco non. Officia aute sit tempor amet ea non incididunt. Ex est deserunt commodo dolore magna exercitation eu irure sint minim. Eiusmod dolor officia nulla deserunt ex eiusmod dolor labore nisi labore et excepteur non elit.\r\nEt pariatur excepteur nulla eu dolore irure. In in velit quis reprehenderit aliqua excepteur magna et ullamco ad. Pariatur id consectetur fugiat dolor pariatur labore ipsum nulla voluptate cupidatat incididunt. Ex do elit minim est id laborum officia. Eiusmod laborum ullamco officia do amet aliqua elit ex cupidatat commodo culpa. Aliquip magna ullamco amet dolor aliqua elit excepteur. Nisi magna enim duis ea labore.\r\n', 'temp-12235989262213754276.jpg', b'1', '2021-10-25 05:55:27', NULL, NULL, NULL);
INSERT INTO `product` VALUES (96, 'Sách Housedown', 307111, 0, 83, 233, 'Haynes Riggs', 390, 'NXB Đại học Huế', 2020, 'Quis magna tempor laboris adipisicing. Aliquip laboris sunt minim enim velit dolor Lorem veniam fugiat excepteur voluptate ea. Nostrud sunt labore sint nulla. Commodo occaecat proident deserunt et adipisicing commodo cillum sint elit elit duis elit reprehenderit duis.\r\nConsectetur exercitation voluptate laboris velit eu sit incididunt enim dolore sunt. Nulla exercitation aliqua sunt consequat minim ullamco enim culpa anim ex deserunt veniam laborum. Nisi in sint reprehenderit ut.\r\n', 'temp-8476700387786158058.jpg', b'1', '2021-04-17 06:11:57', NULL, NULL, NULL);
INSERT INTO `product` VALUES (97, 'Sách Zillan', 108354, 0, 81, 307, 'Hood Nieves', 192, 'NXB Đại học Sư phạm TP.HCM', 2012, 'Incididunt labore minim enim qui minim cillum est voluptate veniam eu. Aliqua magna labore consectetur irure veniam ex ad do aliquip id voluptate. Eu enim labore enim ipsum Lorem. Do proident esse consectetur excepteur commodo. Ut sint officia aliqua nostrud eiusmod est sit amet sint nostrud. Veniam do aute anim consequat tempor quis culpa.\r\nEa ullamco est officia ipsum excepteur dolore voluptate aliqua excepteur culpa proident irure adipisicing. Fugiat cupidatat irure cillum excepteur ea do consequat commodo fugiat nulla fugiat magna. Tempor excepteur nostrud in in culpa ex. Adipisicing pariatur cillum commodo velit et do deserunt nulla occaecat fugiat veniam occaecat. Commodo voluptate laboris in culpa Lorem. Dolore sunt in consectetur nostrud dolor consectetur.\r\n', 'temp-8262627340495498759.jpg', b'1', '2021-07-03 05:51:31', NULL, NULL, NULL);
INSERT INTO `product` VALUES (98, 'Sách Lovepad', 477477, 20, 18, 120, 'Foster Sims', 91, 'NXB Đại học Sư phạm Hà Nội', 2015, 'Anim do laboris duis aute laboris aliquip amet do nulla aliqua. Excepteur quis dolor proident mollit tempor consectetur ex cupidatat laboris consequat. Et Lorem sint pariatur in qui irure nostrud culpa do amet amet et irure laborum.\r\nSit minim quis dolore tempor exercitation ullamco nulla. Laborum quis labore reprehenderit occaecat adipisicing duis ullamco ullamco ex duis. Aute sunt eu aliqua consectetur quis elit ea. Ad tempor elit consectetur est adipisicing ad exercitation culpa laborum amet ipsum do nulla. Lorem dolore aliqua velit magna laboris in ex laboris sint magna fugiat sit mollit cupidatat.\r\n', 'temp-3984373128647845854.jpg', b'1', '2021-07-09 19:58:01', NULL, NULL, NULL);
INSERT INTO `product` VALUES (99, 'Sách Ontagene', 199763, 20, 51, 86, 'Weeks Charles', 71, 'NXB Đại học Huế', 2009, 'Do in sunt sunt in tempor tempor proident dolor officia irure consequat cupidatat incididunt nulla. Id tempor duis dolore aute Lorem dolor ipsum aliqua fugiat ea. Lorem ullamco non reprehenderit cupidatat qui. Commodo pariatur qui labore anim aute anim tempor eiusmod eiusmod nulla dolor culpa. Voluptate commodo eiusmod tempor ipsum ut culpa sunt minim id laboris commodo ad ullamco in.\r\nEa ad aliquip aliquip tempor. Dolore reprehenderit duis aliquip minim sit duis exercitation labore nisi ad. Deserunt quis nostrud exercitation sunt consectetur aliquip in pariatur.\r\n', 'temp-8476700387786158058.jpg', b'1', '2022-01-22 15:29:03', NULL, NULL, NULL);
INSERT INTO `product` VALUES (100, 'Sách Spacewax', 171403, 20, 34, 198, 'Sadie Logan', 85, 'NXB Đại học Huế', 2014, 'Esse non qui dolor consectetur magna consectetur excepteur exercitation nisi eiusmod laboris nulla laborum. Aliquip adipisicing do adipisicing esse. Nostrud nostrud amet culpa commodo officia.\r\nLaborum id ad veniam nulla incididunt amet mollit pariatur cupidatat amet. Laborum ut veniam ullamco sit velit do magna. Reprehenderit proident nisi incididunt anim. Nostrud magna ut quis exercitation ut ut culpa Lorem cillum deserunt pariatur. Amet commodo duis incididunt non do non. Qui Lorem elit nulla quis in exercitation tempor.\r\n', 'temp-12235989262213754276.jpg', b'1', '2021-08-14 19:14:31', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `productId` bigint NOT NULL,
  `categoryId` bigint NOT NULL,
  PRIMARY KEY (`productId`, `categoryId`) USING BTREE,
  INDEX `idx_product_category_product`(`productId` ASC) USING BTREE,
  INDEX `idx_product_category_category`(`categoryId` ASC) USING BTREE,
  CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_category_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (1, 2);
INSERT INTO `product_category` VALUES (2, 14);
INSERT INTO `product_category` VALUES (3, 5);
INSERT INTO `product_category` VALUES (4, 5);
INSERT INTO `product_category` VALUES (5, 5);
INSERT INTO `product_category` VALUES (6, 3);
INSERT INTO `product_category` VALUES (7, 7);
INSERT INTO `product_category` VALUES (8, 6);
INSERT INTO `product_category` VALUES (9, 7);
INSERT INTO `product_category` VALUES (10, 11);
INSERT INTO `product_category` VALUES (11, 13);
INSERT INTO `product_category` VALUES (12, 6);
INSERT INTO `product_category` VALUES (13, 9);
INSERT INTO `product_category` VALUES (14, 15);
INSERT INTO `product_category` VALUES (15, 14);
INSERT INTO `product_category` VALUES (16, 15);
INSERT INTO `product_category` VALUES (17, 9);
INSERT INTO `product_category` VALUES (18, 2);
INSERT INTO `product_category` VALUES (19, 3);
INSERT INTO `product_category` VALUES (20, 10);
INSERT INTO `product_category` VALUES (21, 13);
INSERT INTO `product_category` VALUES (22, 15);
INSERT INTO `product_category` VALUES (23, 8);
INSERT INTO `product_category` VALUES (24, 14);
INSERT INTO `product_category` VALUES (25, 7);
INSERT INTO `product_category` VALUES (26, 1);
INSERT INTO `product_category` VALUES (27, 7);
INSERT INTO `product_category` VALUES (28, 14);
INSERT INTO `product_category` VALUES (29, 9);
INSERT INTO `product_category` VALUES (30, 2);
INSERT INTO `product_category` VALUES (31, 8);
INSERT INTO `product_category` VALUES (32, 1);
INSERT INTO `product_category` VALUES (33, 10);
INSERT INTO `product_category` VALUES (34, 7);
INSERT INTO `product_category` VALUES (35, 2);
INSERT INTO `product_category` VALUES (36, 7);
INSERT INTO `product_category` VALUES (37, 12);
INSERT INTO `product_category` VALUES (38, 1);
INSERT INTO `product_category` VALUES (39, 12);
INSERT INTO `product_category` VALUES (40, 1);
INSERT INTO `product_category` VALUES (41, 9);
INSERT INTO `product_category` VALUES (42, 4);
INSERT INTO `product_category` VALUES (43, 5);
INSERT INTO `product_category` VALUES (44, 5);
INSERT INTO `product_category` VALUES (45, 3);
INSERT INTO `product_category` VALUES (46, 12);
INSERT INTO `product_category` VALUES (47, 3);
INSERT INTO `product_category` VALUES (48, 7);
INSERT INTO `product_category` VALUES (49, 6);
INSERT INTO `product_category` VALUES (50, 6);
INSERT INTO `product_category` VALUES (51, 11);
INSERT INTO `product_category` VALUES (52, 5);
INSERT INTO `product_category` VALUES (53, 9);
INSERT INTO `product_category` VALUES (54, 4);
INSERT INTO `product_category` VALUES (56, 10);
INSERT INTO `product_category` VALUES (57, 10);
INSERT INTO `product_category` VALUES (58, 3);
INSERT INTO `product_category` VALUES (59, 8);
INSERT INTO `product_category` VALUES (60, 9);
INSERT INTO `product_category` VALUES (61, 12);
INSERT INTO `product_category` VALUES (62, 10);
INSERT INTO `product_category` VALUES (63, 14);
INSERT INTO `product_category` VALUES (64, 8);
INSERT INTO `product_category` VALUES (65, 6);
INSERT INTO `product_category` VALUES (66, 11);
INSERT INTO `product_category` VALUES (67, 14);
INSERT INTO `product_category` VALUES (68, 5);
INSERT INTO `product_category` VALUES (69, 13);
INSERT INTO `product_category` VALUES (70, 8);
INSERT INTO `product_category` VALUES (71, 13);
INSERT INTO `product_category` VALUES (72, 14);
INSERT INTO `product_category` VALUES (73, 2);
INSERT INTO `product_category` VALUES (74, 1);
INSERT INTO `product_category` VALUES (75, 13);
INSERT INTO `product_category` VALUES (76, 2);
INSERT INTO `product_category` VALUES (77, 2);
INSERT INTO `product_category` VALUES (78, 8);
INSERT INTO `product_category` VALUES (79, 3);
INSERT INTO `product_category` VALUES (80, 8);
INSERT INTO `product_category` VALUES (81, 14);
INSERT INTO `product_category` VALUES (82, 2);
INSERT INTO `product_category` VALUES (83, 1);
INSERT INTO `product_category` VALUES (84, 9);
INSERT INTO `product_category` VALUES (85, 13);
INSERT INTO `product_category` VALUES (86, 14);
INSERT INTO `product_category` VALUES (87, 5);
INSERT INTO `product_category` VALUES (88, 13);
INSERT INTO `product_category` VALUES (89, 1);
INSERT INTO `product_category` VALUES (90, 10);
INSERT INTO `product_category` VALUES (91, 4);
INSERT INTO `product_category` VALUES (92, 2);
INSERT INTO `product_category` VALUES (93, 4);
INSERT INTO `product_category` VALUES (94, 15);
INSERT INTO `product_category` VALUES (95, 11);
INSERT INTO `product_category` VALUES (96, 8);
INSERT INTO `product_category` VALUES (97, 11);
INSERT INTO `product_category` VALUES (98, 10);
INSERT INTO `product_category` VALUES (99, 15);
INSERT INTO `product_category` VALUES (100, 8);

-- ----------------------------
-- Table structure for product_details
-- ----------------------------
DROP TABLE IF EXISTS `product_details`;
CREATE TABLE `product_details`  (
  `product_id` int NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stock` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  CONSTRAINT `fk_product_detail` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_details
-- ----------------------------

-- ----------------------------
-- Table structure for product_review
-- ----------------------------
DROP TABLE IF EXISTS `product_review`;
CREATE TABLE `product_review`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint NOT NULL,
  `productId` bigint NOT NULL,
  `ratingScore` tinyint NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isShow` bit(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_product_review_user`(`userId` ASC) USING BTREE,
  INDEX `idx_product_review_product`(`productId` ASC) USING BTREE,
  CONSTRAINT `product_review_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_review_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_review
-- ----------------------------
INSERT INTO `product_review` VALUES (1, 4, 23, 4, 'Deserunt enim ullamco occaecat pariatur magna fugiat. Dolore nostrud cupidatat quis culpa sint fugiat. Anim ipsum id enim quis esse.', b'1', '2021-06-21 08:29:23', NULL);
INSERT INTO `product_review` VALUES (2, 1, 89, 2, 'Nostrud aliquip culpa commodo esse. Veniam aute quis fugiat anim veniam non esse reprehenderit reprehenderit do Lorem. Voluptate cupidatat nostrud laborum proident esse sunt consequat consectetur excepteur ipsum deserunt pariatur fugiat.', b'1', '2021-03-06 04:03:45', NULL);
INSERT INTO `product_review` VALUES (3, 4, 48, 5, 'In duis fugiat labore cillum labore ad pariatur adipisicing ipsum culpa duis sunt nostrud adipisicing. Dolor commodo culpa non dolor. Quis ea quis irure ut eu excepteur velit qui magna laborum ad.', b'1', '2021-02-22 02:36:33', NULL);
INSERT INTO `product_review` VALUES (4, 3, 79, 3, 'Labore magna pariatur consectetur dolore voluptate aliquip Lorem ut adipisicing nostrud consectetur. Ullamco ut irure aute velit in veniam. Dolor sit magna duis laboris nisi.', b'1', '2021-05-18 19:49:12', NULL);
INSERT INTO `product_review` VALUES (5, 1, 95, 1, 'Consectetur laboris aliqua ipsum aute exercitation reprehenderit reprehenderit ullamco nisi anim incididunt esse. Laboris veniam mollit mollit eiusmod eiusmod eu pariatur sunt velit voluptate quis sit. Incididunt sit do Lorem eu eiusmod et cupidatat aliquip ipsum ipsum cillum exercitation qui culpa.', b'1', '2021-10-18 02:21:32', NULL);
INSERT INTO `product_review` VALUES (6, 4, 75, 5, 'Ullamco consectetur irure minim voluptate enim nisi non eu deserunt ea cupidatat cillum. Consectetur ex amet enim veniam cupidatat Lorem nostrud irure anim consectetur. Commodo ad anim veniam commodo ad et est amet sint sit elit eiusmod.', b'1', '2021-04-14 05:48:32', NULL);
INSERT INTO `product_review` VALUES (7, 2, 53, 3, 'Deserunt occaecat aliqua pariatur nostrud dolor ullamco reprehenderit deserunt tempor culpa ad aute. Ea sit incididunt mollit anim ullamco commodo sint irure ut exercitation in ullamco minim elit. Sunt cupidatat veniam do cupidatat do exercitation in consectetur minim incididunt.', b'1', '2021-06-28 17:16:49', NULL);
INSERT INTO `product_review` VALUES (8, 5, 64, 4, 'Eiusmod aliqua exercitation nulla veniam ut veniam incididunt dolore occaecat occaecat eiusmod dolor non enim. Nisi veniam exercitation eu cupidatat ad excepteur sint proident dolor duis deserunt. Cillum deserunt pariatur duis enim enim sit proident pariatur sint aliqua magna.', b'1', '2021-03-20 20:02:01', NULL);
INSERT INTO `product_review` VALUES (9, 5, 53, 1, 'Do sit commodo enim sunt ullamco et. Labore eiusmod aliqua nulla reprehenderit officia excepteur magna proident excepteur dolor elit ullamco. Aliqua adipisicing eu ullamco aliquip consectetur irure exercitation ea mollit enim eu minim esse esse.', b'1', '2021-03-09 06:20:41', NULL);
INSERT INTO `product_review` VALUES (10, 2, 71, 3, 'Commodo aute qui minim eiusmod ipsum culpa sint veniam dolore mollit. Lorem consectetur esse ad do mollit enim mollit qui enim tempor ullamco elit ipsum. Consequat laborum et cupidatat labore excepteur cillum.', b'1', '2021-06-04 13:49:47', NULL);
INSERT INTO `product_review` VALUES (11, 3, 92, 2, 'Voluptate ipsum elit cillum ad cillum consectetur amet anim sint exercitation. Aute ullamco reprehenderit adipisicing sit magna. Dolore exercitation exercitation fugiat ullamco.', b'1', '2021-03-11 16:35:14', NULL);
INSERT INTO `product_review` VALUES (12, 1, 38, 3, 'Amet est enim labore occaecat commodo sit eiusmod duis laboris sint occaecat dolor. Consequat qui reprehenderit consequat nostrud nisi deserunt sit ex occaecat irure adipisicing sit laboris. Consequat irure nisi Lorem dolor aliqua.', b'1', '2021-07-30 06:26:43', NULL);
INSERT INTO `product_review` VALUES (13, 2, 80, 3, 'Ipsum occaecat duis nostrud dolore do commodo ex. Minim irure cupidatat nulla anim mollit fugiat est ex reprehenderit enim velit. Aliqua voluptate ea pariatur minim tempor ullamco anim officia nulla sint laborum elit in.', b'1', '2021-07-08 01:17:45', NULL);
INSERT INTO `product_review` VALUES (14, 1, 36, 5, 'Proident et sunt nulla consectetur eiusmod. Non culpa nisi in qui ullamco ullamco commodo. Magna culpa cillum sint mollit.', b'1', '2021-02-17 12:39:28', NULL);
INSERT INTO `product_review` VALUES (15, 3, 42, 1, 'Eiusmod exercitation irure nisi aute consectetur ipsum ullamco excepteur do occaecat eu est. Veniam velit deserunt eu consequat laboris anim exercitation enim in sint incididunt esse. Veniam sit Lorem aliqua sunt veniam cillum et pariatur ea ex anim cillum.', b'1', '2021-09-29 04:06:08', NULL);
INSERT INTO `product_review` VALUES (16, 5, 30, 5, 'Magna incididunt anim ut nostrud magna cupidatat sit. Reprehenderit quis consectetur in amet enim esse dolor non quis sit voluptate laborum. Fugiat veniam id mollit qui qui sunt voluptate commodo anim excepteur labore culpa ullamco.', b'1', '2021-02-22 23:10:04', NULL);
INSERT INTO `product_review` VALUES (17, 4, 50, 3, 'Mollit magna cillum culpa nulla. Ad est culpa id culpa est commodo quis enim et magna. Non ullamco tempor id commodo ad laborum magna nisi ut pariatur incididunt proident occaecat amet.', b'1', '2022-01-08 21:10:10', NULL);
INSERT INTO `product_review` VALUES (18, 2, 54, 3, 'Officia non est qui ad. Incididunt quis deserunt amet qui. Ea amet deserunt et ex.', b'1', '2021-03-02 23:33:39', NULL);
INSERT INTO `product_review` VALUES (19, 5, 54, 4, 'Nostrud ad occaecat incididunt ex incididunt veniam duis esse ut tempor mollit commodo esse. Anim eu anim laboris eiusmod labore non quis mollit nisi enim. Occaecat veniam et do mollit eu culpa excepteur ad laborum est.', b'1', '2021-03-24 02:11:05', NULL);
INSERT INTO `product_review` VALUES (20, 3, 88, 5, 'Lorem id id nostrud quis. Nulla aute ad aute pariatur in. Pariatur consequat culpa proident excepteur reprehenderit esse qui cillum ex labore excepteur ad amet et.', b'1', '2021-11-24 10:02:51', NULL);
INSERT INTO `product_review` VALUES (21, 5, 93, 2, 'Duis consequat cupidatat enim elit in sint culpa reprehenderit labore excepteur mollit. Pariatur elit dolor et reprehenderit pariatur. Culpa laboris excepteur veniam eiusmod id ut aute pariatur.', b'1', '2021-11-14 01:04:47', NULL);
INSERT INTO `product_review` VALUES (22, 3, 19, 2, 'Anim qui est et laborum irure pariatur deserunt in nulla sint qui. Aliquip eiusmod consectetur culpa labore veniam nulla aliquip officia non eu minim Lorem. Adipisicing esse ea aliquip elit nisi ea pariatur officia sit labore minim eu laborum occaecat.', b'1', '2022-01-23 12:52:13', NULL);
INSERT INTO `product_review` VALUES (23, 3, 54, 2, 'Duis est officia non non aute eiusmod cupidatat ad consectetur amet esse est. Qui cillum aliquip voluptate magna anim anim consectetur cillum duis mollit. Id eiusmod sit nisi ea enim tempor.', b'1', '2021-07-20 14:52:16', NULL);
INSERT INTO `product_review` VALUES (24, 1, 97, 3, 'Pariatur laboris officia voluptate tempor consequat adipisicing. Velit culpa officia id quis consectetur duis veniam. Sunt esse amet irure cupidatat.', b'1', '2021-04-27 19:05:33', NULL);
INSERT INTO `product_review` VALUES (25, 4, 8, 5, 'Voluptate amet deserunt amet laboris eu nisi labore deserunt excepteur laboris aute dolore minim exercitation. Ea duis et minim sint anim ullamco in do labore. Enim nostrud laboris non elit commodo pariatur est minim exercitation nulla mollit commodo deserunt fugiat.', b'1', '2021-09-21 20:55:21', NULL);
INSERT INTO `product_review` VALUES (26, 4, 51, 5, 'Et deserunt exercitation cillum cupidatat Lorem excepteur sit pariatur est id minim minim. In culpa culpa amet anim est fugiat consequat do. Dolore excepteur incididunt est dolore tempor dolor cupidatat amet tempor Lorem dolor.', b'1', '2021-06-14 17:26:50', NULL);
INSERT INTO `product_review` VALUES (27, 2, 11, 5, 'Nisi voluptate ex officia sit ea ea labore. Mollit esse sunt ad commodo nulla. Ullamco dolor laboris aliquip ipsum sint commodo ad nisi aute esse non anim nostrud.', b'1', '2021-08-16 03:13:02', NULL);
INSERT INTO `product_review` VALUES (28, 5, 20, 5, 'Esse quis incididunt fugiat ut elit voluptate tempor ullamco elit sunt ex aliquip laborum. Id ipsum ex consequat dolore nostrud nostrud dolor commodo dolore. Dolor eiusmod consectetur veniam minim et consequat eu ullamco proident est incididunt ut pariatur.', b'1', '2021-09-20 21:45:32', NULL);
INSERT INTO `product_review` VALUES (29, 3, 49, 4, 'Minim duis labore velit laborum. Et nisi commodo anim consectetur. Occaecat cupidatat elit officia est id nulla excepteur cillum eu sunt amet irure magna.', b'1', '2021-10-11 15:45:33', NULL);
INSERT INTO `product_review` VALUES (30, 5, 100, 5, 'Officia cupidatat et aliqua laboris excepteur nostrud occaecat tempor voluptate laboris culpa eiusmod. Officia adipisicing enim laboris consequat dolore sunt labore proident ullamco adipisicing cupidatat aliquip. Ullamco labore nulla consectetur aliquip mollit esse ad ipsum do fugiat nulla do.', b'1', '2021-07-31 07:49:01', NULL);
INSERT INTO `product_review` VALUES (31, 1, 74, 2, 'Esse est pariatur excepteur commodo cillum deserunt laborum culpa. Deserunt qui fugiat amet deserunt eu minim. In ea tempor ipsum ad reprehenderit commodo consectetur tempor elit amet amet ipsum.', b'1', '2021-06-30 07:09:58', NULL);
INSERT INTO `product_review` VALUES (32, 5, 46, 3, 'Minim commodo sint ex elit in. Laborum velit magna eu aliqua deserunt velit aliquip eu in amet quis. Aute aliqua ad Lorem anim voluptate occaecat ad amet dolor.', b'1', '2021-07-13 23:00:20', NULL);
INSERT INTO `product_review` VALUES (33, 3, 38, 5, 'Anim ullamco incididunt duis occaecat commodo excepteur Lorem ipsum nostrud sunt. Deserunt nulla veniam duis dolor consectetur occaecat excepteur esse ipsum et ad tempor esse. Dolor irure velit in et ea.', b'1', '2021-11-25 15:12:50', NULL);
INSERT INTO `product_review` VALUES (34, 3, 57, 2, 'Sunt dolor aliquip labore in dolore. Id aliquip consectetur quis ex ullamco et aliquip nostrud. In enim fugiat dolore ipsum velit ex.', b'1', '2021-03-18 23:49:52', NULL);
INSERT INTO `product_review` VALUES (35, 2, 92, 2, 'Laborum ipsum sint culpa in. Laboris incididunt et irure Lorem id cillum fugiat et nulla voluptate sunt. Eiusmod incididunt enim qui eu elit.', b'1', '2021-10-10 22:41:18', NULL);
INSERT INTO `product_review` VALUES (36, 1, 47, 3, 'Nisi esse aute minim fugiat cupidatat mollit. Dolore deserunt ex sunt enim veniam mollit est nulla adipisicing dolore enim in. Mollit esse enim esse pariatur duis ad ipsum eu laboris cupidatat in est commodo.', b'1', '2021-04-28 15:29:44', NULL);
INSERT INTO `product_review` VALUES (37, 1, 98, 1, 'Ipsum consectetur dolor labore consequat magna cillum nostrud esse irure nisi Lorem. Consequat cillum magna do exercitation do eiusmod deserunt sint proident mollit proident culpa Lorem ipsum. Reprehenderit sunt Lorem velit nulla fugiat id duis et veniam laborum esse ut.', b'1', '2021-03-10 09:40:00', NULL);
INSERT INTO `product_review` VALUES (38, 4, 24, 2, 'Sunt duis excepteur Lorem aute enim deserunt laboris occaecat et labore aliquip sunt dolore laboris. Fugiat ad consequat magna sint enim mollit cupidatat incididunt tempor ad ad consectetur culpa. Duis exercitation culpa pariatur consequat tempor et velit veniam.', b'1', '2021-08-06 20:17:49', NULL);
INSERT INTO `product_review` VALUES (39, 2, 12, 1, 'Nulla proident magna mollit labore. Proident et ea ex occaecat ad adipisicing aliquip labore anim Lorem enim. Pariatur id tempor cupidatat laborum culpa elit consequat sint officia sint et veniam.', b'1', '2021-05-02 01:40:44', NULL);
INSERT INTO `product_review` VALUES (40, 1, 52, 2, 'Exercitation dolor ex officia aliqua esse minim culpa enim occaecat officia reprehenderit. In veniam amet laborum nostrud consectetur non. Ipsum pariatur amet dolor nisi ipsum Lorem labore excepteur commodo minim mollit officia.', b'1', '2021-09-20 21:34:52', NULL);
INSERT INTO `product_review` VALUES (41, 3, 34, 4, 'Esse nisi dolor irure eu nulla. Cillum elit sunt et pariatur. Veniam et ea adipisicing est ipsum sunt exercitation aute et.', b'1', '2021-05-21 13:32:40', NULL);
INSERT INTO `product_review` VALUES (42, 3, 49, 5, 'Est sunt et cupidatat non nisi aliqua. Irure incididunt enim incididunt Lorem aliqua deserunt. Veniam laborum velit reprehenderit ullamco duis commodo excepteur eu esse consequat.', b'1', '2021-04-24 09:39:36', NULL);
INSERT INTO `product_review` VALUES (43, 5, 25, 3, 'Quis reprehenderit anim ullamco eu officia occaecat sint dolor excepteur eiusmod. Ipsum excepteur esse excepteur aliquip voluptate reprehenderit. Exercitation voluptate proident dolore cupidatat incididunt eu exercitation voluptate commodo consectetur excepteur laboris.', b'1', '2021-11-08 09:19:05', NULL);
INSERT INTO `product_review` VALUES (44, 1, 95, 2, 'Minim voluptate aute ea veniam ipsum ad nostrud deserunt magna quis ea ullamco nostrud sit. Nisi aliquip cupidatat minim nostrud adipisicing pariatur reprehenderit ex labore duis. Velit laborum adipisicing veniam excepteur laborum occaecat anim excepteur quis enim sit.', b'1', '2021-08-18 13:25:56', NULL);
INSERT INTO `product_review` VALUES (45, 4, 94, 2, 'Duis ea sunt proident adipisicing tempor irure. Aliquip non id eiusmod minim sint anim Lorem in est velit elit. Nostrud consequat nulla nulla id ex in irure duis nisi irure fugiat sit mollit.', b'1', '2021-04-27 08:10:30', NULL);
INSERT INTO `product_review` VALUES (46, 2, 48, 3, 'Consequat laboris irure id laboris ea cupidatat occaecat. Ex nostrud ipsum et excepteur ullamco nisi officia eiusmod duis nostrud nulla sint ipsum. Eiusmod excepteur anim eu exercitation id est ad ea quis enim.', b'1', '2021-05-25 03:52:56', NULL);
INSERT INTO `product_review` VALUES (47, 2, 1, 3, 'Non in dolor non aliquip elit Lorem ipsum tempor mollit commodo aliquip veniam. Esse velit exercitation nostrud aliquip ullamco elit enim laborum sit tempor amet aliqua eiusmod pariatur. Eu laboris Lorem minim ullamco consequat pariatur cillum excepteur est irure veniam.', b'1', '2021-11-16 11:56:13', NULL);
INSERT INTO `product_review` VALUES (48, 5, 13, 1, 'In sint et laborum culpa nostrud ea eu eu esse aliquip culpa nisi dolor. Aute culpa esse cillum ad do voluptate do laborum sit proident dolor sint duis elit. Cupidatat eiusmod incididunt sunt ea qui laborum fugiat occaecat.', b'1', '2021-12-15 06:31:00', NULL);
INSERT INTO `product_review` VALUES (49, 4, 80, 2, 'Fugiat commodo dolore elit incididunt nisi aliqua ea aliqua. Aliquip consectetur do esse non veniam minim cupidatat id exercitation quis cillum. Ea incididunt nulla ea laboris esse ex culpa ullamco duis velit commodo adipisicing occaecat.', b'1', '2021-03-16 17:13:55', NULL);
INSERT INTO `product_review` VALUES (50, 4, 63, 4, 'Deserunt est incididunt nostrud Lorem aliquip. Fugiat qui incididunt proident mollit nisi non cillum voluptate sunt ullamco Lorem aute ad occaecat. Sint esse sit consequat esse nostrud labore id excepteur excepteur elit fugiat exercitation dolore magna.', b'1', '2021-05-01 16:32:04', NULL);
INSERT INTO `product_review` VALUES (51, 5, 39, 1, 'Ex fugiat eiusmod amet labore ad commodo enim. Laborum nostrud ad ullamco ex in. Nulla do commodo excepteur incididunt in ullamco in aliquip magna.', b'1', '2022-01-18 07:58:58', NULL);
INSERT INTO `product_review` VALUES (52, 2, 18, 5, 'In sit occaecat esse magna mollit cupidatat ex eu non eiusmod et sit deserunt. Velit do commodo voluptate id exercitation laborum irure ad aute. Pariatur reprehenderit dolor id aliqua est minim adipisicing aute ex aliqua.', b'1', '2021-12-31 06:39:01', NULL);
INSERT INTO `product_review` VALUES (53, 5, 69, 1, 'Commodo sint ipsum labore qui voluptate dolor id laborum adipisicing cillum. Excepteur est sit non officia aliquip labore. Cupidatat esse nostrud culpa et.', b'1', '2021-07-20 13:53:30', NULL);
INSERT INTO `product_review` VALUES (54, 4, 100, 5, 'Pariatur consequat consectetur magna nostrud aliqua irure dolor. Aute esse exercitation officia et cillum incididunt est nisi et ut in Lorem. Qui commodo et irure sint aute.', b'1', '2022-01-17 07:42:11', NULL);
INSERT INTO `product_review` VALUES (55, 1, 52, 3, 'Amet eu non dolor ex officia laboris quis eu qui excepteur sit do. Eu commodo amet non velit ipsum commodo excepteur duis. Incididunt quis magna velit labore ullamco non fugiat laboris tempor in.', b'1', '2021-08-22 15:50:47', NULL);
INSERT INTO `product_review` VALUES (56, 5, 58, 3, 'Fugiat enim consequat eu duis proident cillum nostrud cillum minim adipisicing eiusmod. Non dolor qui ad dolore eiusmod labore excepteur labore anim deserunt. Deserunt laborum occaecat ad sunt officia reprehenderit sit pariatur dolore amet Lorem.', b'1', '2021-10-27 19:23:11', NULL);
INSERT INTO `product_review` VALUES (57, 5, 44, 5, 'Eu reprehenderit proident officia dolor sunt qui eiusmod ad eiusmod exercitation occaecat adipisicing. Cillum culpa sint tempor labore adipisicing et aute irure incididunt consectetur occaecat. Non minim Lorem id anim mollit incididunt culpa anim.', b'1', '2021-06-08 03:26:15', NULL);
INSERT INTO `product_review` VALUES (58, 2, 36, 2, 'Dolor esse Lorem id veniam elit. Dolore nulla ullamco aliqua dolor dolor eiusmod veniam eu qui qui ex est qui. Amet qui voluptate ullamco magna officia amet veniam veniam.', b'1', '2021-11-15 20:15:04', NULL);
INSERT INTO `product_review` VALUES (59, 2, 51, 1, 'In qui nostrud et exercitation. Ut et consectetur laboris dolor anim exercitation ipsum nisi aliquip ipsum ex cillum. Duis anim sit pariatur commodo dolor enim aute.', b'1', '2021-04-11 07:42:46', NULL);
INSERT INTO `product_review` VALUES (60, 4, 3, 5, 'Labore anim non consequat velit id ea pariatur deserunt adipisicing. Nulla labore pariatur ut qui occaecat. Anim occaecat pariatur nisi veniam irure irure veniam nisi ut.', b'1', '2021-07-14 08:56:52', NULL);
INSERT INTO `product_review` VALUES (61, 4, 61, 1, 'Tempor amet ipsum Lorem est mollit magna quis aliqua excepteur adipisicing consectetur id. Aute in aliquip nulla duis irure consequat elit commodo ut. Elit nulla esse elit excepteur nostrud incididunt ut veniam eiusmod in anim eiusmod ad.', b'1', '2021-07-29 09:22:28', NULL);
INSERT INTO `product_review` VALUES (62, 3, 83, 3, 'Commodo tempor incididunt nisi exercitation elit ex mollit. Laboris anim cillum do labore occaecat ullamco eu amet non id ea incididunt deserunt. Excepteur irure deserunt in do labore.', b'1', '2021-03-15 15:48:58', NULL);
INSERT INTO `product_review` VALUES (63, 3, 41, 1, 'Pariatur et non nostrud minim est aliqua. Consectetur sunt tempor ea nulla duis Lorem est culpa ullamco. Tempor ipsum nostrud proident ullamco irure tempor quis officia veniam aliqua officia duis proident.', b'1', '2021-12-22 18:46:26', NULL);
INSERT INTO `product_review` VALUES (64, 3, 38, 4, 'Est tempor nulla pariatur cillum occaecat quis. Irure ipsum amet mollit qui qui consectetur ea cupidatat sit velit nulla Lorem. Nostrud eu officia in duis occaecat minim proident enim sint irure dolor.', b'1', '2021-11-04 14:06:53', NULL);
INSERT INTO `product_review` VALUES (65, 4, 61, 1, 'Laboris quis sunt ad sint velit ut Lorem non. Culpa labore fugiat incididunt labore laborum reprehenderit velit Lorem sint aliquip proident. Nostrud duis do aliquip consectetur ea consequat cillum aliquip magna laborum.', b'1', '2021-10-09 10:45:50', NULL);
INSERT INTO `product_review` VALUES (66, 3, 45, 1, 'Labore magna pariatur ex mollit labore excepteur ex. In laboris et proident voluptate proident culpa est adipisicing amet amet cupidatat eu esse. Officia enim aliqua qui amet.', b'1', '2021-08-16 07:06:22', NULL);
INSERT INTO `product_review` VALUES (67, 1, 31, 2, 'Ad elit nulla mollit do nulla non non nisi ipsum laboris anim occaecat dolor Lorem. Amet veniam dolor cupidatat id velit do magna tempor sit. Aliquip id velit aute do et tempor qui occaecat non irure labore aliquip incididunt fugiat.', b'1', '2021-05-29 22:13:23', NULL);
INSERT INTO `product_review` VALUES (68, 2, 3, 5, 'Occaecat do ipsum nisi culpa ipsum culpa dolore duis reprehenderit exercitation consequat anim. Deserunt veniam dolore tempor enim minim elit ad consequat cupidatat cupidatat dolor eu Lorem. Sit minim quis id aliqua.', b'1', '2021-02-13 09:48:17', NULL);
INSERT INTO `product_review` VALUES (69, 1, 7, 2, 'Pariatur eiusmod aliqua qui excepteur excepteur velit ut ipsum pariatur commodo fugiat. Mollit incididunt ullamco consectetur voluptate cillum pariatur cillum id amet laboris occaecat. Velit Lorem occaecat quis est Lorem.', b'1', '2021-03-16 08:29:14', NULL);
INSERT INTO `product_review` VALUES (70, 4, 95, 5, 'Labore qui proident ut amet occaecat eiusmod et. Nisi dolore eu nostrud cupidatat ad non consequat quis aliqua excepteur velit commodo. Id ut elit ullamco ea est cillum.', b'1', '2021-08-18 04:22:17', NULL);
INSERT INTO `product_review` VALUES (71, 4, 32, 4, 'Lorem excepteur cillum et esse velit enim culpa elit dolore ut nisi ad. Exercitation irure labore ex non duis sint. Adipisicing qui non veniam ut.', b'1', '2021-05-29 18:18:29', NULL);
INSERT INTO `product_review` VALUES (72, 4, 7, 3, 'Anim ullamco consectetur anim ullamco esse incididunt aute velit velit cillum minim velit ullamco. Ad non cillum sit commodo nostrud reprehenderit in reprehenderit. Magna et tempor elit sit excepteur sunt.', b'1', '2021-04-18 02:03:58', NULL);
INSERT INTO `product_review` VALUES (73, 5, 28, 3, 'Dolore fugiat amet dolore fugiat eu enim quis magna. Amet ad mollit proident consequat veniam aliquip. Mollit ut nisi duis excepteur est irure nostrud proident.', b'1', '2021-06-13 18:37:11', NULL);
INSERT INTO `product_review` VALUES (74, 1, 30, 2, 'Consectetur labore laborum elit proident dolor. Lorem sint esse ullamco in proident irure consectetur aliquip cupidatat sunt occaecat ipsum qui. Exercitation nisi dolor anim commodo culpa qui culpa.', b'1', '2021-11-08 10:50:08', NULL);
INSERT INTO `product_review` VALUES (75, 5, 77, 4, 'Commodo incididunt elit in ipsum eiusmod laborum velit deserunt pariatur pariatur. Voluptate eiusmod excepteur minim elit. Occaecat quis id in sit.', b'1', '2021-06-14 18:40:34', NULL);
INSERT INTO `product_review` VALUES (76, 1, 93, 4, 'Mollit esse laboris aliqua consequat culpa velit. Et fugiat aliqua id nostrud proident. Exercitation incididunt proident cillum minim anim incididunt.', b'1', '2021-09-09 05:08:15', NULL);
INSERT INTO `product_review` VALUES (77, 4, 27, 4, 'Minim duis nulla do culpa eu fugiat nisi Lorem duis nisi magna eiusmod. Occaecat minim consequat laboris nulla exercitation duis ut ipsum non aliqua anim do ex. Nostrud amet aliquip velit irure exercitation quis minim officia sit nulla.', b'1', '2021-10-12 02:01:52', NULL);
INSERT INTO `product_review` VALUES (78, 1, 4, 2, 'Laborum amet voluptate pariatur aliqua. Nostrud magna et mollit magna sit Lorem dolore ex quis Lorem consequat culpa. Nulla et velit dolore elit velit sint Lorem elit occaecat adipisicing dolor ut.', b'1', '2021-08-26 12:28:57', NULL);
INSERT INTO `product_review` VALUES (79, 2, 54, 1, 'Nulla laboris elit commodo consequat commodo incididunt in exercitation. Sunt dolore minim consequat laboris ea ad deserunt incididunt aliquip dolor do. Culpa culpa proident ex ea culpa ex labore esse adipisicing voluptate culpa consequat aliqua.', b'1', '2021-06-25 03:21:42', NULL);
INSERT INTO `product_review` VALUES (80, 2, 26, 1, 'Culpa ipsum proident sint eu labore aliquip sit. Anim culpa in minim id labore anim duis pariatur eu consectetur ullamco eiusmod occaecat occaecat. Esse officia proident eiusmod consequat do magna nisi exercitation nulla ex amet velit elit.', b'1', '2021-11-19 12:31:15', NULL);
INSERT INTO `product_review` VALUES (81, 5, 72, 1, 'Id reprehenderit officia ea aliquip. Sit amet sint laborum labore. Occaecat ullamco in sunt nulla laboris ut.', b'1', '2021-06-05 19:17:14', NULL);
INSERT INTO `product_review` VALUES (82, 5, 85, 1, 'Occaecat ea labore cillum ullamco. Commodo aliquip id culpa nulla ex consequat Lorem reprehenderit nostrud sit sunt duis ex. Eiusmod aliqua irure nostrud nostrud.', b'1', '2021-12-13 01:42:22', NULL);
INSERT INTO `product_review` VALUES (83, 1, 86, 4, 'Qui exercitation cillum dolore labore nostrud mollit aliqua pariatur ad nulla cupidatat non. Amet consequat aute nostrud ea excepteur voluptate amet laborum anim dolor Lorem aliquip Lorem consectetur. Lorem ea enim qui eiusmod Lorem minim do.', b'1', '2021-03-22 20:45:11', NULL);
INSERT INTO `product_review` VALUES (84, 4, 32, 5, 'Irure exercitation sunt ex id officia dolore exercitation aliquip sunt incididunt. Veniam Lorem quis ut dolor commodo dolor exercitation amet. Reprehenderit sunt sunt laborum qui exercitation id reprehenderit tempor tempor.', b'1', '2022-01-17 16:26:09', NULL);
INSERT INTO `product_review` VALUES (85, 5, 9, 1, 'Anim laborum ea pariatur id et fugiat nisi exercitation eu aliquip. Quis incididunt cillum ipsum magna elit et sit ipsum cillum eiusmod labore nulla irure aliquip. Tempor et voluptate reprehenderit qui adipisicing est adipisicing incididunt ad est.', b'1', '2021-08-12 10:30:41', NULL);
INSERT INTO `product_review` VALUES (86, 3, 10, 1, 'Veniam consequat dolore labore duis ullamco nostrud est. Excepteur qui amet adipisicing tempor eiusmod. Proident eiusmod deserunt occaecat laborum commodo sit quis adipisicing enim non culpa.', b'1', '2021-12-04 21:16:47', NULL);
INSERT INTO `product_review` VALUES (87, 4, 44, 2, 'Enim ex laborum ullamco eu proident occaecat. Cupidatat non dolore adipisicing labore nulla labore cupidatat. Cupidatat ex aute amet adipisicing commodo.', b'1', '2021-05-19 06:21:03', NULL);
INSERT INTO `product_review` VALUES (88, 5, 38, 4, 'Dolore nostrud amet nulla mollit amet est et et. Nulla laborum voluptate reprehenderit consectetur. Laborum laboris eu eiusmod anim.', b'1', '2021-06-28 04:10:34', NULL);
INSERT INTO `product_review` VALUES (89, 4, 98, 3, 'Ad excepteur nulla et sint adipisicing sit culpa et non consequat. Eiusmod mollit enim excepteur veniam quis. Elit ad ex excepteur proident dolor deserunt qui labore fugiat labore ullamco.', b'1', '2021-06-27 16:33:32', NULL);
INSERT INTO `product_review` VALUES (90, 3, 89, 5, 'Officia in Lorem voluptate eiusmod velit cillum eu minim ullamco voluptate quis pariatur. Deserunt enim consectetur tempor quis est magna velit reprehenderit minim voluptate et laborum do. Dolore id anim nulla elit eiusmod ipsum deserunt elit anim culpa reprehenderit id elit.', b'1', '2021-02-13 21:42:58', NULL);
INSERT INTO `product_review` VALUES (91, 3, 91, 5, 'Eu dolore qui minim Lorem mollit anim Lorem irure aliquip velit commodo. Do deserunt aute consequat non aute sit minim sint reprehenderit velit pariatur ipsum sunt cillum. Commodo mollit culpa incididunt pariatur fugiat enim nostrud Lorem deserunt ut quis nostrud.', b'1', '2021-08-19 16:12:43', NULL);
INSERT INTO `product_review` VALUES (92, 5, 3, 4, 'Dolor aute aliqua labore qui aliquip nulla excepteur minim duis. Consequat esse occaecat laboris culpa cillum irure qui adipisicing et. Fugiat nisi veniam id anim aliquip.', b'1', '2022-01-28 13:15:21', NULL);
INSERT INTO `product_review` VALUES (93, 1, 13, 4, 'Nulla sint culpa ex exercitation cupidatat commodo enim ullamco pariatur sint. Id ad deserunt sint laborum cupidatat magna. Reprehenderit officia ut eiusmod ad eu et consectetur pariatur esse aliquip officia.', b'1', '2021-03-07 10:01:45', NULL);
INSERT INTO `product_review` VALUES (94, 5, 49, 5, 'Laboris et laboris aliqua minim elit magna nostrud dolor nisi irure ea ea et pariatur. Quis occaecat ipsum culpa qui incididunt tempor sint non. Consectetur incididunt cupidatat id veniam.', b'1', '2021-06-16 22:06:26', NULL);
INSERT INTO `product_review` VALUES (95, 3, 14, 3, 'Voluptate cillum aliqua in in cupidatat qui. Deserunt incididunt irure sit est et nisi excepteur eiusmod reprehenderit. Reprehenderit aliqua labore voluptate tempor ad voluptate reprehenderit.', b'1', '2021-02-14 19:24:01', NULL);
INSERT INTO `product_review` VALUES (96, 1, 10, 5, 'Eu nostrud commodo mollit laborum. Anim aute in quis nulla tempor deserunt nulla. Reprehenderit Lorem labore consequat eu pariatur tempor tempor exercitation ipsum mollit.', b'1', '2021-07-16 10:49:39', NULL);
INSERT INTO `product_review` VALUES (97, 3, 83, 1, 'Officia occaecat sunt et mollit id esse duis nostrud sint veniam nisi cupidatat nulla quis. Reprehenderit consectetur tempor eu labore velit anim do incididunt. Consectetur exercitation consequat est ipsum sint ex consequat magna cillum est voluptate ea.', b'1', '2021-05-24 21:41:47', NULL);
INSERT INTO `product_review` VALUES (98, 1, 11, 2, 'Sit mollit nisi pariatur aliqua proident amet non incididunt. Et non sint officia ullamco ut est. Do cillum aliquip laboris aute aute voluptate nisi voluptate magna sint ut dolor culpa nulla.', b'1', '2021-03-22 02:30:42', NULL);
INSERT INTO `product_review` VALUES (99, 4, 97, 1, 'Magna ipsum velit sit sunt duis velit. Consequat exercitation nostrud officia esse deserunt consequat aliquip ad Lorem anim labore. Reprehenderit et sit aliqua dolore.', b'1', '2021-03-18 19:39:24', NULL);
INSERT INTO `product_review` VALUES (100, 1, 33, 5, 'Reprehenderit duis aliquip deserunt voluptate labore. Ea laboris commodo exercitation ullamco eu elit proident. Adipisicing amet deserunt irure duis exercitation occaecat quis.', b'1', '2021-07-17 03:23:09', NULL);
INSERT INTO `product_review` VALUES (101, 5, 77, 4, 'Enim fugiat cillum in dolor deserunt voluptate fugiat non in proident reprehenderit incididunt. Ea anim enim excepteur duis nisi eiusmod sit voluptate incididunt eu ullamco minim. Magna pariatur aute non enim laboris est aliquip deserunt veniam adipisicing.', b'1', '2021-03-06 03:45:16', NULL);
INSERT INTO `product_review` VALUES (102, 3, 9, 1, 'Consequat sit fugiat irure elit Lorem et. Ipsum non culpa mollit enim ut sint minim duis velit. Aliquip ipsum quis ullamco et cupidatat magna excepteur magna.', b'1', '2021-11-06 22:22:17', NULL);
INSERT INTO `product_review` VALUES (103, 4, 95, 5, 'Nisi mollit elit excepteur ipsum deserunt exercitation eiusmod deserunt dolore. Minim ad irure elit laboris consectetur in. Consectetur eu velit tempor veniam proident amet commodo ut cupidatat.', b'1', '2021-03-02 15:14:30', NULL);
INSERT INTO `product_review` VALUES (104, 4, 21, 4, 'Fugiat aliqua ipsum minim sunt incididunt aliquip amet et nisi amet veniam voluptate elit anim. Veniam ipsum commodo non occaecat magna magna commodo do consequat sit. Exercitation ut qui dolore id cupidatat velit aliquip duis et.', b'1', '2022-01-05 15:15:16', NULL);
INSERT INTO `product_review` VALUES (105, 1, 40, 4, 'Anim veniam nostrud laboris tempor ullamco ea elit aute amet aute elit quis est. Ullamco id eiusmod minim irure. Magna deserunt elit deserunt consequat aliqua et labore.', b'1', '2021-03-06 09:13:52', NULL);
INSERT INTO `product_review` VALUES (106, 4, 12, 2, 'Elit incididunt fugiat laborum adipisicing. Ipsum ut ut commodo occaecat ut ut dolore aute eiusmod ad deserunt commodo eu non. Duis sunt fugiat reprehenderit do dolor dolor sint consectetur magna exercitation sunt.', b'1', '2021-08-27 05:50:18', NULL);
INSERT INTO `product_review` VALUES (107, 3, 75, 2, 'Elit nostrud duis proident nostrud occaecat do nisi culpa deserunt. Reprehenderit elit elit mollit exercitation eiusmod cillum amet et incididunt enim nulla. Proident commodo fugiat elit proident est aliquip ad laborum laborum.', b'1', '2021-09-21 12:07:35', NULL);
INSERT INTO `product_review` VALUES (108, 4, 76, 5, 'Cillum nostrud irure magna veniam Lorem amet sint. Aliquip non dolor anim ea non non ad ipsum dolor aute adipisicing. Pariatur eiusmod ad esse anim consectetur ea tempor dolor ex deserunt esse nostrud velit.', b'1', '2021-04-28 15:25:37', NULL);
INSERT INTO `product_review` VALUES (109, 4, 17, 1, 'Id magna irure anim ut non aute ut nulla nostrud. Voluptate sunt aliquip cupidatat sit pariatur irure sunt excepteur anim duis excepteur irure sint. Adipisicing cupidatat occaecat veniam veniam cupidatat ea consectetur ipsum dolore laborum.', b'1', '2021-11-21 14:37:04', NULL);
INSERT INTO `product_review` VALUES (110, 5, 79, 3, 'Deserunt amet exercitation culpa labore duis exercitation adipisicing. Fugiat esse ad cillum est officia sit ut adipisicing elit. Incididunt enim commodo eiusmod consectetur cupidatat eiusmod consequat consequat voluptate.', b'1', '2022-01-03 16:07:37', NULL);
INSERT INTO `product_review` VALUES (111, 2, 43, 2, 'Non aliquip veniam consectetur ut magna aute velit sint veniam ut. Aliquip commodo ullamco ea sunt aute nostrud ut veniam enim. Ex consectetur irure magna consequat.', b'1', '2021-08-15 20:54:48', NULL);
INSERT INTO `product_review` VALUES (112, 5, 43, 5, 'Excepteur sint nisi cupidatat aute mollit tempor adipisicing incididunt. Enim veniam quis voluptate est. Amet do excepteur nostrud nostrud.', b'1', '2021-08-18 05:52:08', NULL);
INSERT INTO `product_review` VALUES (113, 5, 97, 5, 'Quis dolore duis exercitation aute ullamco exercitation reprehenderit officia sunt reprehenderit reprehenderit. Duis tempor occaecat in minim magna consectetur voluptate Lorem. Deserunt proident exercitation est sunt.', b'1', '2021-05-05 15:17:07', NULL);
INSERT INTO `product_review` VALUES (114, 1, 11, 5, 'Fugiat labore eiusmod nostrud ea pariatur. Cupidatat officia labore eiusmod commodo ea deserunt fugiat voluptate aliquip id. Sunt nostrud minim ex id minim consequat.', b'1', '2021-05-06 09:00:55', NULL);
INSERT INTO `product_review` VALUES (115, 1, 88, 5, 'Laborum officia ipsum ullamco anim ex elit cillum. Tempor nisi sunt esse ad aliqua culpa ea magna ea Lorem cillum. Nulla tempor occaecat est cillum ad tempor nisi ea ullamco pariatur magna.', b'1', '2021-11-02 04:39:03', NULL);
INSERT INTO `product_review` VALUES (116, 3, 7, 5, 'Est reprehenderit dolor do occaecat non ut non consequat consequat. Aute pariatur laboris amet elit minim velit mollit ullamco exercitation do in do do. Culpa voluptate eu proident aute incididunt eiusmod nisi ut reprehenderit culpa ad mollit ut.', b'1', '2021-06-07 00:24:18', NULL);
INSERT INTO `product_review` VALUES (117, 2, 26, 3, 'Nostrud consectetur voluptate adipisicing veniam nostrud excepteur exercitation. Mollit laboris tempor qui mollit. Adipisicing commodo mollit nulla pariatur consectetur voluptate culpa sunt minim velit.', b'1', '2021-06-18 06:26:37', NULL);
INSERT INTO `product_review` VALUES (118, 2, 53, 1, 'Tempor voluptate qui quis irure. Tempor Lorem in do cillum cupidatat officia culpa. Elit id proident nisi minim magna ipsum.', b'1', '2021-10-05 19:44:06', NULL);
INSERT INTO `product_review` VALUES (119, 5, 47, 5, 'Consequat ut duis laboris mollit amet voluptate mollit cillum velit do Lorem. Nulla tempor et enim nisi adipisicing occaecat tempor eiusmod dolor exercitation excepteur amet laboris ullamco. Laboris veniam in excepteur ipsum aute officia culpa ex anim eiusmod velit cillum incididunt.', b'1', '2021-06-03 22:41:00', NULL);
INSERT INTO `product_review` VALUES (120, 4, 28, 5, 'Elit id qui ad incididunt cupidatat cillum dolore. Velit esse dolor id est aliqua reprehenderit consectetur tempor ex sint ea enim. Aute cillum ea quis ea aute excepteur.', b'1', '2021-04-08 16:49:03', NULL);
INSERT INTO `product_review` VALUES (121, 1, 24, 2, 'Culpa duis minim excepteur aliqua ea. Occaecat occaecat excepteur consectetur magna ut veniam id commodo dolor. Culpa exercitation incididunt incididunt sit excepteur voluptate magna reprehenderit.', b'1', '2021-08-09 05:58:38', NULL);
INSERT INTO `product_review` VALUES (122, 4, 83, 1, 'Labore quis anim eiusmod dolore veniam sunt eiusmod consequat commodo tempor nostrud consectetur. Veniam elit ad eiusmod tempor laborum occaecat dolore velit duis aliqua ut. Do excepteur laboris excepteur dolore esse est elit mollit ipsum Lorem consequat nostrud.', b'1', '2021-12-22 09:13:42', NULL);
INSERT INTO `product_review` VALUES (123, 4, 21, 2, 'Ipsum commodo eu commodo et esse sint est consequat in ea excepteur id dolore. Mollit sunt laboris excepteur tempor ipsum do nulla ipsum cupidatat cillum laborum. Officia tempor velit incididunt tempor non aliqua.', b'1', '2021-06-02 01:16:25', NULL);
INSERT INTO `product_review` VALUES (124, 3, 12, 3, 'Veniam eiusmod magna amet ipsum. Tempor cillum aliquip sit cillum cupidatat. Ut sit Lorem reprehenderit adipisicing sint voluptate eu ipsum exercitation labore sunt dolore labore culpa.', b'1', '2021-07-09 15:59:11', NULL);
INSERT INTO `product_review` VALUES (125, 5, 37, 3, 'Sunt fugiat excepteur deserunt irure irure. Magna exercitation veniam eu consectetur enim ipsum ullamco in cillum elit dolore. Occaecat cillum elit sit incididunt minim.', b'1', '2021-10-13 08:31:39', NULL);
INSERT INTO `product_review` VALUES (126, 4, 86, 5, 'Pariatur officia occaecat occaecat aliquip enim non eiusmod aliquip sint tempor nisi tempor. Qui in aute aliqua reprehenderit minim irure cillum. Irure reprehenderit cupidatat consectetur velit reprehenderit sit veniam excepteur Lorem cillum consequat nulla qui adipisicing.', b'1', '2021-09-08 05:56:29', NULL);
INSERT INTO `product_review` VALUES (127, 3, 99, 4, 'Eu nulla nostrud in qui nisi ut laborum labore cupidatat officia aliqua nostrud dolore. Velit cupidatat laborum Lorem est est ea pariatur ullamco occaecat non reprehenderit ea incididunt. Est ad amet sit dolor commodo.', b'1', '2021-06-12 03:09:05', NULL);
INSERT INTO `product_review` VALUES (128, 2, 95, 1, 'Laboris ullamco et qui ad enim dolore magna. Irure commodo ea laborum reprehenderit anim laborum nostrud dolore adipisicing proident eiusmod adipisicing nulla. Nulla cillum voluptate exercitation voluptate anim magna quis non nostrud dolore esse.', b'1', '2021-09-23 05:38:59', NULL);
INSERT INTO `product_review` VALUES (129, 3, 35, 3, 'Eiusmod velit laboris duis nostrud mollit voluptate mollit deserunt esse anim irure culpa sunt sit. Magna fugiat do eiusmod non amet proident ullamco. Deserunt ipsum aute ipsum laboris consequat aute duis ullamco.', b'1', '2021-11-28 18:36:38', NULL);
INSERT INTO `product_review` VALUES (130, 5, 32, 2, 'Nostrud magna consectetur adipisicing duis incididunt amet id ea labore do aliquip minim et. Deserunt exercitation ullamco enim cillum elit nulla aliquip laboris non mollit id deserunt ut. Proident non aliqua velit id irure esse et laboris cupidatat consectetur.', b'1', '2021-04-14 18:43:43', NULL);
INSERT INTO `product_review` VALUES (131, 3, 39, 3, 'Sunt dolor cillum elit aute eiusmod eu aliquip labore adipisicing magna. Ullamco sit excepteur aliqua ut. Reprehenderit anim nostrud labore nulla velit mollit eu sunt Lorem ad.', b'1', '2021-05-13 07:39:32', NULL);
INSERT INTO `product_review` VALUES (132, 2, 90, 4, 'In incididunt pariatur anim est minim esse incididunt magna sit velit. Ad irure pariatur ullamco magna duis ipsum non consectetur eu magna minim reprehenderit aute nisi. Duis cupidatat laboris exercitation aliqua.', b'1', '2021-12-23 13:41:51', NULL);
INSERT INTO `product_review` VALUES (133, 4, 39, 3, 'Lorem elit enim ea labore eu duis do consectetur reprehenderit eu dolore consequat nulla. Est fugiat Lorem labore laboris do ex mollit ut qui aute id et. Excepteur excepteur eu elit mollit dolore aliquip sint in ea nostrud irure fugiat ut consequat.', b'1', '2021-09-02 01:42:05', NULL);
INSERT INTO `product_review` VALUES (134, 4, 57, 1, 'Cupidatat mollit quis et tempor culpa labore ex eu sint. Sit id velit incididunt enim qui. Enim reprehenderit ut do elit culpa.', b'1', '2022-01-20 07:49:47', NULL);
INSERT INTO `product_review` VALUES (135, 3, 51, 4, 'Nulla fugiat et irure excepteur esse Lorem amet voluptate velit ipsum sunt esse. Excepteur sit amet adipisicing do reprehenderit proident. Tempor voluptate nulla occaecat incididunt ipsum anim pariatur duis.', b'1', '2021-07-01 19:49:46', NULL);
INSERT INTO `product_review` VALUES (136, 3, 17, 4, 'Anim anim eu aliquip irure culpa consequat fugiat. Pariatur et reprehenderit amet ea esse. Excepteur consequat labore quis eiusmod in pariatur.', b'1', '2021-07-16 19:01:27', NULL);
INSERT INTO `product_review` VALUES (137, 4, 61, 1, 'Exercitation laboris minim mollit in deserunt sint in in magna. Anim deserunt pariatur eu elit officia aliquip excepteur proident ullamco eiusmod deserunt duis. Mollit nostrud laboris irure quis magna sunt consequat proident excepteur aliqua cillum.', b'1', '2021-11-18 04:49:00', NULL);
INSERT INTO `product_review` VALUES (138, 3, 68, 3, 'Id non eiusmod sint aute sint reprehenderit eiusmod incididunt eu officia. Irure pariatur velit aute culpa irure. Est occaecat tempor exercitation aute aliqua quis sint est id ea.', b'1', '2021-03-11 22:25:56', NULL);
INSERT INTO `product_review` VALUES (139, 1, 42, 4, 'Magna officia incididunt ut exercitation quis anim duis quis. Eu ipsum irure velit reprehenderit tempor aliqua irure excepteur Lorem voluptate ex. Sint et fugiat sit voluptate tempor ut labore reprehenderit proident.', b'1', '2021-07-21 18:22:13', NULL);
INSERT INTO `product_review` VALUES (140, 1, 65, 5, 'Occaecat nisi pariatur exercitation commodo cillum elit dolor dolor fugiat reprehenderit aliqua aute. Dolore esse ut ad eiusmod pariatur dolor non qui commodo eu amet incididunt ipsum veniam. Sunt amet incididunt elit enim excepteur sit ut mollit quis deserunt aliquip id officia.', b'1', '2021-10-27 13:31:07', NULL);
INSERT INTO `product_review` VALUES (141, 3, 59, 2, 'Laboris ea reprehenderit ad reprehenderit culpa tempor nostrud tempor aute dolore mollit. Aliquip minim pariatur ipsum culpa adipisicing irure fugiat laborum laborum occaecat. In esse dolor laborum irure.', b'1', '2021-12-13 06:04:33', NULL);
INSERT INTO `product_review` VALUES (142, 1, 45, 2, 'Ex tempor cillum eu ex id ullamco pariatur elit dolor ea cillum pariatur. Cillum ad aliqua mollit Lorem incididunt. Fugiat est in consectetur nisi officia dolore ut nulla et ad qui eiusmod laborum.', b'1', '2021-06-23 03:57:14', NULL);
INSERT INTO `product_review` VALUES (143, 3, 28, 5, 'Irure ipsum elit Lorem officia tempor duis qui et adipisicing qui. Dolor in elit qui id ullamco adipisicing ipsum irure exercitation non veniam. Voluptate ipsum anim et sint culpa dolore.', b'1', '2021-02-27 15:12:06', NULL);
INSERT INTO `product_review` VALUES (144, 4, 21, 1, 'Ut irure magna voluptate fugiat nulla esse sit enim consectetur. Esse velit culpa laboris exercitation aliquip eiusmod proident ipsum voluptate ex dolor mollit laborum magna. Esse in dolore elit est consectetur ipsum dolor ut est ex nulla labore irure.', b'1', '2021-11-26 07:35:46', NULL);
INSERT INTO `product_review` VALUES (145, 2, 97, 3, 'Nostrud occaecat in veniam enim cillum ipsum. Commodo enim ex in consectetur consequat aute pariatur culpa. Velit nostrud culpa nostrud esse et elit.', b'1', '2021-12-31 04:06:04', NULL);
INSERT INTO `product_review` VALUES (146, 5, 66, 4, 'Sit commodo culpa sunt ea est sunt do enim magna consectetur do. Cillum ea voluptate anim tempor minim adipisicing dolor ipsum irure exercitation dolor ad. Velit deserunt occaecat qui consequat officia labore irure excepteur eu esse ipsum velit.', b'1', '2021-02-17 07:03:55', NULL);
INSERT INTO `product_review` VALUES (147, 4, 51, 3, 'Et ipsum excepteur consequat excepteur laborum mollit ullamco irure incididunt enim tempor pariatur. Do in fugiat sit tempor ipsum quis id commodo. Mollit pariatur ad anim cupidatat esse.', b'1', '2021-02-28 20:43:43', NULL);
INSERT INTO `product_review` VALUES (148, 3, 12, 4, 'Minim incididunt nostrud excepteur ipsum exercitation eiusmod commodo amet. Cupidatat velit qui incididunt reprehenderit cupidatat sunt voluptate dolore adipisicing laboris. Occaecat eu labore et laborum ut ad Lorem magna mollit.', b'1', '2021-05-26 22:19:40', NULL);
INSERT INTO `product_review` VALUES (149, 2, 81, 3, 'Cupidatat qui magna nisi Lorem sit dolor aliqua. Cupidatat nostrud pariatur quis Lorem consequat laboris anim nostrud anim proident in. Velit qui sint laborum minim exercitation id fugiat cupidatat.', b'1', '2022-01-26 17:46:55', NULL);
INSERT INTO `product_review` VALUES (150, 3, 42, 2, 'Velit aliqua ullamco exercitation est minim nulla occaecat et officia veniam minim voluptate. Commodo sit et proident ex cupidatat. Nulla ad exercitation eiusmod veniam aliqua adipisicing incididunt tempor dolore aute.', b'1', '2021-02-24 12:50:14', NULL);
INSERT INTO `product_review` VALUES (151, 1, 70, 5, 'Ngu Ngu Ngu Ngu Ngu', b'1', '2025-12-23 14:55:20', NULL);
INSERT INTO `product_review` VALUES (152, 6, 60, 5, 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', b'1', '2025-12-25 21:29:22', '2025-12-25 21:31:12');
INSERT INTO `product_review` VALUES (153, 6, 60, 3, 'aaaaaaaaaaaaaaaaaaaaaaaaa', b'1', '2025-12-25 21:31:30', NULL);
INSERT INTO `product_review` VALUES (154, 6, 60, 1, 'aaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbb', b'0', '2025-12-25 21:31:45', '2026-01-02 14:22:59');
INSERT INTO `product_review` VALUES (155, 1, 52, 5, 'AAAXXXXXXXXXXXXXXXXXXXXXXXXXXXX', b'1', '2025-12-25 21:54:20', '2026-01-02 14:22:52');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price` int NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `fk_product_category`(`category_id` ASC) USING BTREE,
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 420 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 1, 'Hồi kí về Bác Hồ - Gần bên Bác và học ở Bác', 32000, 'https://product.hstatic.net/200000343865/product/ki-ve-bac-ho_gan-ben-bac-va-hoc-o-bac_a7b06cf30df94bebbc0453254c052089_b1124d48bb0c432c8cf42372cbf49f59_master.jpg');
INSERT INTO `products` VALUES (2, 1, 'Bác Hồ viết Di chúc và Di chúc của Bác Hồ', 44000, 'https://product.hstatic.net/200000343865/product/bac-ho-viet-di-chuc-va-di-chuc-cua-bac-ho---tb-2023_7b0f3a74cd97465eabfcf877264256d6_master.png');
INSERT INTO `products` VALUES (3, 1, 'Hồi kí về Bác Hồ - Mãi nhớ ơn Người', 32000, 'https://product.hstatic.net/200000343865/product/hoi-ki-ve-bac-ho_mai-nho-on-nguoi_6a5ac11987ee49ceb288199915f78e6a_5b33065e3cdb433bb35f269e6e79d348_master.jpg');
INSERT INTO `products` VALUES (4, 1, 'Chị Út Tịch', 28000, 'https://product.hstatic.net/200000343865/product/chi-ut-tich_bia_8b38576569c44f59ba5294c65bba3052_master.jpg');
INSERT INTO `products` VALUES (5, 1, 'Búp sen xanh', 57600, 'https://product.hstatic.net/200000343865/product/2022_a6e962d1ceec452d8efaed8162fa0928_e40c26cb340a439185360675cff58ffa_29fb2374fd4d4ba896efbad85f1cf1af_master.jpg');
INSERT INTO `products` VALUES (6, 1, 'Những anh hùng trẻ tuổi - Nguyễn Bá Ngọc', 28000, 'https://product.hstatic.net/200000343865/product/nhung-anh-hung-tre-tuoi_nguyen-ba-ngoc_bia_4579ac78765e4dacaa51236d88a34947_master.jpg');
INSERT INTO `products` VALUES (7, 1, 'Suốt đời học Bác', 32000, 'https://product.hstatic.net/200000343865/product/suot-doi-hoc-bac_1a11cdb72a6c4f07bed3dff68acdd993_master.png');
INSERT INTO `products` VALUES (8, 1, 'Cha và Con', 80000, 'https://product.hstatic.net/200000343865/product/cha-va-con--tb-2022_eb856581b80a4a71a4e2f07d1c77005b_master.jpg');
INSERT INTO `products` VALUES (9, 1, 'Những thiếu nhi bên Bác ngày ấy', 20800, 'https://product.hstatic.net/200000343865/product/nhung-thieu-nhi-ben-bac-ngay-ay_bia_db1f6739491649c681ba56514c50da59_master.png');
INSERT INTO `products` VALUES (10, 1, 'Chuyện hay sử Việt - Nhà Mạc và thời Lê Trịnh - Đất nước phân ly', 48000, 'https://product.hstatic.net/200000343865/product/nha-mac-_-thoi-le-trinh_bbf1b724b9214c2db4a710acc8db9665_master.jpg');
INSERT INTO `products` VALUES (11, 1, 'Chuyện hay sử Việt - Nhà Nguyễn - Quốc gia thống nhất', 48000, 'https://product.hstatic.net/200000343865/product/nha-nguyen_189cbe5ab4fa459e94ab0d57c5f953d9_master.jpg');
INSERT INTO `products` VALUES (12, 1, 'Những anh hùng trẻ tuổi - Phạm Ngọc Đa', 32000, 'https://product.hstatic.net/200000343865/product/pham-ngoc-da_bia_13x19_d9b1331c06e14ee5abc0ae22beb9c649_master.jpg');
INSERT INTO `products` VALUES (13, 1, 'BNhững anh hùng trẻ tuổi - Tô Vĩnh Diện', 40000, 'https://product.hstatic.net/200000343865/product/nhung-anh-hung-tre-tuoi_to-vinh-dien_tb-2025_ffc13e3d54ae49b485e21ee8a3495130_master.png');
INSERT INTO `products` VALUES (14, 1, 'Tấm chân dung Bác Hồ', 45000, 'https://product.hstatic.net/200000343865/product/tam-chan-dung-bac-ho_bia_tb-2024_afba3d735bfb4d2b9f9cb6a8c58e0750_f193ad0e1dde4a568b8f8f455c6456ab_master.jpg');
INSERT INTO `products` VALUES (15, 1, 'Chuyện hay sử Việt - Nhà Lê sơ - Những trang sử bi hùng', 48000, 'https://product.hstatic.net/200000343865/product/nha-le-so_b1649624779c4f3cbd3c768da2f900c1_master.jpg');
INSERT INTO `products` VALUES (16, 1, 'Những anh hùng trẻ tuổi - Vừ A Dính', 16000, 'https://product.hstatic.net/200000343865/product/nhung-anh-hung-tre-tuoi_vu-a-dinh_bia_tb-2024_4fc22c4bed6b416a99f9258cf28732f4_master.jpg');
INSERT INTO `products` VALUES (17, 1, 'Nguyễn Thị Minh Khai - Khúc hát vườn trầu', 32000, 'https://cdn.hstatic.net/products/200000343865/cac-nha-cach-mang-tien-boi_nguyen-thi-minh-khai-khuc-hat-vuon-trau_bia_a3349508ae2d410eb7075fb9e63ae739_master.jpg');
INSERT INTO `products` VALUES (18, 1, 'Chuyện hay sử Việt - Thời kì đầu độc lập - Khai mở nền tự chủ', 48000, 'https://product.hstatic.net/200000343865/product/thoi-ki-dau-doc-lap_7df3aca01d474920a4467097082721bc_master.jpg');
INSERT INTO `products` VALUES (19, 1, 'Những anh hùng trẻ tuổi - Võ Thị Sáu', 40000, 'https://product.hstatic.net/200000343865/product/vo-thi-sau_bia_tb-2024_a1f990df85874de594b550516023ef92_d799bb3fd6ef454a813c02dbf65d62f8_master.jpg');
INSERT INTO `products` VALUES (20, 1, 'Ngàn năm sử Việt - Nhà Lý - Ỷ Lan phu nhân', 44000, 'https://product.hstatic.net/200000343865/product/ngan-nam-su-viet_y-lan-phu-nhan_bia_10ae36a12f4a4d9ab11e1a799a955071_master.jpg');
INSERT INTO `products` VALUES (21, 1, 'Ngô Gia Tự', 28000, 'https://cdn.hstatic.net/products/200000343865/tu-sach-cac-nha-cach-mang-tien-boi_ngo-gia-tu_bia_76123f174d6741f391a5550f1f936e70_master.jpg');
INSERT INTO `products` VALUES (22, 1, 'Nguyễn Hữu Tiến - Người vẽ cờ Tổ quốc', 56000, 'https://cdn.hstatic.net/products/200000343865/ach-cac-nha-cach-mang-tien-boi_nguyen-huu-tien-nguoi-ve-co-to-quoc_bia_0a80876f87d14d9e8d56372d0fb8c173_master.jpg');
INSERT INTO `products` VALUES (23, 1, 'Trường Sa - Kì vĩ và gian lao', 40000, 'https://product.hstatic.net/200000343865/product/truong-sa-ki-vi-va-giao-lao_bia_tb-2025_c5f9afbbca1b46abb8c7dddb1ea3bcec_master.jpg');
INSERT INTO `products` VALUES (24, 1, 'Lý Tự Trọng - Sống mãi tên anh', 25600, 'https://cdn.hstatic.net/products/200000343865/ly-tu-trong_song-mai-ten-anh_bia_2025_3752e8f0b8f3458593a782febf49fa0e_master.png');
INSERT INTO `products` VALUES (25, 1, 'Rèn nhân cách - Luyện tài năng - Bác Hồ - Tấm gương giản dị', 22400, 'https://product.hstatic.net/200000343865/product/ren-nhan-cach_luyen-tai-nang_bac-ho_tam-guong-gian-di_bia_73bba60c4f9844cf88cf60982d3f1726_master.png');
INSERT INTO `products` VALUES (26, 1, 'Trong giông gió Trường Sa', 32000, 'https://product.hstatic.net/200000343865/product/trong-giong-gio-truong-sa_bia_tb-2025_a99a89a94e0142259a64f842f2c07903_master.jpg');
INSERT INTO `products` VALUES (27, 1, 'Những kí ức Điện Biên', 32000, 'https://product.hstatic.net/200000343865/product/nhung-ki-uc-dien-bien_bia_tb-2025_5ad7ce67d7c648109d84aced4421058b_master.jpg');
INSERT INTO `products` VALUES (28, 1, 'Chuyện ở đồi A1', 32000, 'https://product.hstatic.net/200000343865/product/chuyen-o-doi-a1_bia_tb-2025_7fe077a574e9448ab09a519fc39c0196_master.jpg');
INSERT INTO `products` VALUES (29, 1, 'Ngàn năm sử Việt – Thời Bắc thuộc – Vua Đen', 64000, 'https://product.hstatic.net/200000343865/product/ngan-nam-su-viet_thoi-bac-thuoc_vua-den_bia_28139b9cedd54604a4de4e521cc03cc3_master.jpg');
INSERT INTO `products` VALUES (30, 1, 'Những anh hùng trẻ tuổi - Bế Văn Đàn', 40000, 'https://product.hstatic.net/200000343865/product/nhung-anh-hung-tre-tuoi_be-van-dan_tb-2025_17e18c21c3084500972ecc634b024c3c_master.png');
INSERT INTO `products` VALUES (31, 1, 'Gương thiếu nhi làm theo lời Bác - Tình yêu với bóng bàn', 24000, 'https://cdn.hstatic.net/products/200000343865/guong-thieu-nhi-lam-theo-loi-bac_tinh-yeu-voi-bong-ban_8743479d1d3f4647a789e5f462c7e8df_master.jpg');
INSERT INTO `products` VALUES (32, 1, 'Gương thiếu nhi làm theo lời Bác - Cậu bé say mê toán học', 24000, 'https://product.hstatic.net/200000343865/product/2022_796b7d0c7b6d4817bced8ae212ba1868_2b4552498d21497d823caaca2bc505e3_d440f91ac4d4471bbc50dffa08af85fb_master.jpgg');
INSERT INTO `products` VALUES (33, 1, 'Gương thiếu nhi làm theo lời Bác - Cậu bé mồ côi ham học', 24000, 'https://product.hstatic.net/200000343865/product/2022_9430d92a6e084946a73aecc8cd1d56ad_ec0804c8ead34aa7976c65dd0b98cf1a_a207989028eb45e58b7d0627db454c76_master.jpg');
INSERT INTO `products` VALUES (34, 1, 'Chuyện hay sử Việt - Thời Cận đại - Đông Tây đối đầu', 48000, 'https://product.hstatic.net/200000343865/product/thoi-can-dai_600f488b11ad46b8b7015fe305c1568e_master.jpg');
INSERT INTO `products` VALUES (35, 1, 'Những anh hùng trẻ tuổi - Trần Văn Ơn', 25600, 'https://product.hstatic.net/200000343865/product/nhung-anh-hung-tre-tuoi_tran-van-on_bia_tb-2024_e7bcc2807b05476ea9c46a63510f218e_master.jpg');
INSERT INTO `products` VALUES (36, 1, 'Những anh hùng trẻ tuổi - Bế Văn Đàn', 40000, 'https://product.hstatic.net/200000343865/product/nhung-anh-hung-tre-tuoi_be-van-dan_tb-2025_17e18c21c3084500972ecc634b024c3c_master.png');
INSERT INTO `products` VALUES (37, 1, 'Ngàn năm sử Việt - Nhà Tây Sơn - Lưỡi gươm nhân ái', 36000, 'https://product.hstatic.net/200000343865/product/ngan-nam-su-viet_nha-tay-son_luoi-guom-nhan-ai_c9db5ef95cf2436094313bcd0d755c67_master.jpg');
INSERT INTO `products` VALUES (38, 1, 'Những anh hùng trẻ tuổi - Phan Đình Giót', 40000, 'https://product.hstatic.net/200000343865/product/nhung-anh-hung-tre-tuoi_phan-dinh-giot_bia_tb-2025_00763212047a43e68eaae1a249b56e37_master.jpg');
INSERT INTO `products` VALUES (39, 1, 'Trẻ em thời chiến - Children at war', 100000, 'https://cdn.hstatic.net/products/200000343865/tre-em-thoi-chien_bia_ab7c7b60e3b44dbb926031340ff67586_master.jpg');
INSERT INTO `products` VALUES (40, 1, 'Ngàn năm sử Việt - Nhà Đinh - Cờ lau dựng nước', 32000, 'https://product.hstatic.net/200000343865/product/ngan-nam-su-viet_co-lau-dung-nuoc_bia_0d4bcffd71db44a18d9ea8c6064abf74_master.jpg');
INSERT INTO `products` VALUES (41, 1, 'Thư kí Bác Hồ kể chuyện', 40000, 'https://product.hstatic.net/200000343865/product/thu-ki-bac-ho-ke-chuyen_bia_cf76d77a1bae4a6b9ea69c426bebf66c_master.png');
INSERT INTO `products` VALUES (42, 1, 'Những anh hùng trẻ tuổi - Chị Sáu ở Côn Đảo', 16000, 'https://product.hstatic.net/200000343865/product/chi-sau-o-con-dao_bia_tb-2024_a40064f4fef94529861b1756415db4a6_master.jpg');
INSERT INTO `products` VALUES (43, 1, 'Nguyên phi Ỷ Lan', 96000, 'https://product.hstatic.net/200000343865/product/nguyen-phi-y-lan_bia_nxb-thanh-nien_952d07e3347f4a80a87fc4fa9d3d5cf2_master.jpg');
INSERT INTO `products` VALUES (44, 1, 'Nghìn xưa văn hiến', 158400, 'https://product.hstatic.net/200000343865/product/nghin-xua-van-hien_tb-2025_c006423320c6466faf908cd38131b464_master.jpg');
INSERT INTO `products` VALUES (45, 1, 'Những sư tử non', 20000, 'https://product.hstatic.net/200000343865/product/nhung-su-tu-non_bia_fbf4f254e6744c6b975b50d61ce8c53d_master.jpg');
INSERT INTO `products` VALUES (46, 1, 'Ngàn năm sử Việt - Nhà Thục - Chuyện nỏ thần', 64000, 'https://product.hstatic.net/200000343865/product/ngan-nam-su-viet_thoi-thuc_chuyen-no-than_3a950221a40e481db2028f06368a13c3_master.jpg');
INSERT INTO `products` VALUES (47, 1, 'Điện Biên chiến thắng, Điện Biên thơ', 96000, 'https://product.hstatic.net/200000343865/product/dien-bien-phu-chien-thang_-dien-bien-tho_c9444c771aca4be38f6ef9c3f25479c5_master.jpg');
INSERT INTO `products` VALUES (48, 1, 'Người người lớp lớp', 76000, 'https://product.hstatic.net/200000343865/product/nguoi-nguoi-lop-lop_bia_tb2025_24710b09e046451897444c09631ee5cc_master.jpg');
INSERT INTO `products` VALUES (49, 1, 'Ngàn năm sử Việt - Nhà Trần - Ông trạng thả diều', 24000, 'https://product.hstatic.net/200000343865/product/ngan-nam-su-viet_nha-tran_ong-trang-tha-dieu_bia_07f598a7dad341a9a57d6e2997c34c63_master.jpg');
INSERT INTO `products` VALUES (50, 1, 'Thầy giáo Nguyễn Tất Thành ở trường Dục Thanh', 24000, 'https://product.hstatic.net/200000343865/product/thay-giao-nguyen-tat-thanh-o-truong-duc-thanh_9aae7dc9270846728e2b8de4edb0bdee_master.png');
INSERT INTO `products` VALUES (51, 1, 'Phía núi bên kia', 52000, 'https://product.hstatic.net/200000343865/product/phia-ben-kia-nui_bia_d4eb48c963b74613bb8617fdb375bd46_master.jpg');
INSERT INTO `products` VALUES (52, 1, 'Kim Đồng', 24000, 'https://product.hstatic.net/200000343865/product/kim-dong_c3968482b2be486c95a9753d683a29ac_23fb946b89ad4e7599f60979e129b283_master.jpg');
INSERT INTO `products` VALUES (53, 1, 'Thăng Long Kinh Kì - Kẻ Chợ - Thời Lê - Trịnh', 30000, 'https://product.hstatic.net/200000343865/product/thang-long-kinh-ki-ke-cho-thoi-le-trinh_0a60c17a9ca04513a9e68728e53d7cbd_master.jpg');
INSERT INTO `products` VALUES (54, 1, 'Rèn nhân cách - Luyện tài năng - Bác Hồ - Tấm gương khiêm tốn', 17600, 'https://product.hstatic.net/200000343865/product/ren-nhan-cach_luyen-tai-nang_bac-ho_tam-guong-khiem-ton_bia_5a66b35a69d64c35bd9d0c827db552f4_master.png');
INSERT INTO `products` VALUES (55, 1, 'Bác Hồ với thiếu nhi', 48000, 'https://cdn.hstatic.net/products/200000343865/bac_ho_voi_thieu_nhi_bia_tb_2025_7ad45705817d450e956521a9b26cf6b5_master.jpg');
INSERT INTO `products` VALUES (56, 1, 'Rèn nhân cách - Luyện tài năng - Bác Hồ - Tấm gương tiết kiệm', 23000, 'https://product.hstatic.net/200000343865/product/ren-nhan-cach_luyen-tai-nang_bac-ho_tam-guong-tiet-kiem_bia_86114d9a98c5452584de62fda076dbeb_master.png');
INSERT INTO `products` VALUES (57, 1, 'Người thợ chữa đồng hồ tại đường hầm số 1', 24000, 'https://product.hstatic.net/200000343865/product/nguoi-tho-sua-dong-ho_bia_bd2ff382ff614bdd84305368fedbaa80_master.jpg');
INSERT INTO `products` VALUES (58, 1, 'Hào kiệt đất phương Nam - Mạc Cửu - Người mở đất Hà Tiên', 22400, 'https://product.hstatic.net/200000343865/product/hao-kiet-dat-phuong-nam---mac-cuu_93dd7a924db94e189fce1a7f565bc429_6f51ee2e79b041f8a7bcd555254b559b_master.jpg');
INSERT INTO `products` VALUES (59, 1, 'Bác Hồ viết Tuyên ngôn Độc lập', 32000, 'https://product.hstatic.net/200000343865/product/bac-ho-viet-tuyen-ngon-doc-lap_aa1a0e985d814f49b1d026419efe0a7f_master.png');
INSERT INTO `products` VALUES (60, 1, 'Lá cờ chuẩn đỏ thắm', 32000, 'https://product.hstatic.net/200000343865/product/la-co-chuan-do-tham_bia_tb-2025_dc102c519885445ba957bc95f0649e40_master.jpg');
INSERT INTO `products` VALUES (61, 1, 'Người lính phi công kể chuyện - 19 Ace của Việt Nam – Những phi công huyền thoại trên máy bay MiG', 44000, 'https://cdn.hstatic.net/products/200000343865/nguoi-linh-phi-cong-ke-chuyen_19-ace-cua-viet-nam_bia_5922c669554d4a368881a41680b4e5b7_master.png');
INSERT INTO `products` VALUES (62, 1, 'Những anh hùng trẻ tuổi - Nguyễn Văn Trỗi', 40000, 'https://product.hstatic.net/200000343865/product/nhung-anh-hung-tre-tuoi_nguyen-van-troi_bia_tb-2024_ddad311b4857401db0130c40a527650b_master.jpg');
INSERT INTO `products` VALUES (63, 1, 'Những vị vua trẻ trong sử Việt', 56000, 'https://product.hstatic.net/200000343865/product/nhung-vi-vua-tre-trong-su-viet_3cd327a9a2d242c3b3a7f9b4d7bf6f4b_master.jpg');
INSERT INTO `products` VALUES (64, 1, 'Kí họa trong chiến hào', 132000, 'https://product.hstatic.net/200000343865/product/ki-hoa-trong-chien-hao_14x22_bia-ao_d88cf8489c95468cb5d9a94077c9d721_master.jpg');
INSERT INTO `products` VALUES (65, 1, 'Người cập rằng hầm xay lúa', 20000, 'https://product.hstatic.net/200000343865/product/2022_a6e962d1ceec452d8efaed8162fa0928_e40c26cb340a439185360675cff58ffa_29fb2374fd4d4ba896efbad85f1cf1af_master.jpg');
INSERT INTO `products` VALUES (66, 1, 'Chuyện hay sử Việt - Thời cổ - Không chỉ là huyền sử', 48000, 'https://product.hstatic.net/200000343865/product/thoi-co_52dfd70d0788442fa02f74f7d53f903c_master.jpg');
INSERT INTO `products` VALUES (67, 1, 'Thăng Long Kinh Kì - Kẻ Chợ - Thời Tây Sơn và nhà Nguyễn', 30000, 'https://product.hstatic.net/200000343865/product/thoi-tay-son-nha-nguyen_5dea2d6acbd54a0dbbf77aa536536ada_master.jpg');
INSERT INTO `products` VALUES (68, 1, '70 câu Hỏi - Đáp về Chiến thắng Điện Biên Phủ', 24000, 'https://product.hstatic.net/200000343865/product/70-cau-hoi-dap-ve-chien-thang-dien-bien-phu_2648c5ab6ed8482889f54b7b04840fa0_master.jpg');
INSERT INTO `products` VALUES (69, 1, 'Gương thiếu nhi làm theo lời Bác - Niềm đam mê chế tạo', 24000, 'https://product.hstatic.net/200000343865/product/niem-dam-em-che-tao_ddbb12fc8b3b4be49dcffb05cc13363a_master.jpg');
INSERT INTO `products` VALUES (70, 1, 'Sống mãi với Thủ đô', 120000, 'https://product.hstatic.net/200000343865/product/song-mai-voi-thu-do_bia-2024_9812a82e478b4df387b988d50ec2d638_master.jpg');
INSERT INTO `products` VALUES (71, 1, 'Theo dấu chân Người', 140000, 'https://product.hstatic.net/200000343865/product/theo-dau-chan-nguoi_bia_file-in_18cb5425f6dd4edf866f058ba7b3878c_master.png');
INSERT INTO `products` VALUES (72, 1, 'Chuyện hay sử Việt - Thời Bắc thuộc - Cuộc kháng cự ngàn năm', 48000, 'https://cdn.hstatic.net/products/200000343865/chuyen-hay-su-viet-2_thoi-bac-thuoc_816fc1cedacc4319be6ec52b23fe6514_master.png');
INSERT INTO `products` VALUES (73, 1, 'Những người thầy trong sử Việt - Tập 1', 68000, 'https://product.hstatic.net/200000343865/product/1_231aff1062c541acbac159b801f08780_master.jpg');
INSERT INTO `products` VALUES (74, 1, 'Kể chuyện Thăng Long - Hà Nội - Cảnh sắc Hà Nội', 32000, 'https://product.hstatic.net/200000343865/product/ke-chuyen-thang-long-ha-noi_canh-sac-ha-noi_c65c51b9ef17488292056d7b29b01e1a_master.jpg');
INSERT INTO `products` VALUES (75, 1, 'Những người thầy trong sử Việt - Tập 2', 72000, 'https://product.hstatic.net/200000343865/product/2_e5093ed8cd79445a9c996cac85f0483b_master.jpg');
INSERT INTO `products` VALUES (76, 1, 'Yersin - Khúc hát Cá Ông', 196000, 'https://cdn.hstatic.net/products/200000343865/yersin---khuc-hat-ca-ong_bia_e24b4b33bfb84e3f9afa14168fa6c050_master.jpg');
INSERT INTO `products` VALUES (77, 1, 'Bác Hồ kính yêu', 60000, 'https://product.hstatic.net/200000343865/product/bac-ho-kinh-yeu---tb-2023_f1790991922e41de9ca82e5d5def6f1e_master.jpg');
INSERT INTO `products` VALUES (78, 1, 'Mùa ban thay áo', 24000, 'https://product.hstatic.net/200000343865/product/mua-ban-thay-ao_bia_044618f0d93d4d6ba1ab6efb131e3efb_master.jpg');
INSERT INTO `products` VALUES (79, 1, 'Việt Nam sử lược - Bản đặc biệt', 200000, 'https://product.hstatic.net/200000343865/product/viet-nam-su-luoc_ban-dac-biet---tb2019_665b9b244c724bd9b23d12d2f1876101_master.jpg');
INSERT INTO `products` VALUES (80, 1, 'Người lính Điện Biên kể chuyện', 28000, 'https://product.hstatic.net/200000343865/product/nguoi-linh-db-ke-chuyen_bia_in_d950104886fd49a386617c12c0a6c6a5_master.jpg');
INSERT INTO `products` VALUES (81, 1, 'Đại tướng Võ Nguyên Giáp thời trẻ', 40000, 'https://product.hstatic.net/200000343865/product/dai_tuong_vo_nguyen_giap_thoi_tre_tb_2024_66cb10e2d75f493ba2531621aeaf6bc7_master.jpg');
INSERT INTO `products` VALUES (82, 1, 'Nhật kí trong tù', 52000, 'https://product.hstatic.net/200000343865/product/nhat-ky-trong-tu_f7c46171806342e981e8421585c4ae08_master.jpg');
INSERT INTO `products` VALUES (83, 1, 'Kể chuyện Điện Biên Phủ', 48000, 'https://product.hstatic.net/200000343865/product/ke-chuyen-dien-bien-phu_bia_tb-2025_cfd8b7d07e9e40c398f067904616bdc8_master.jpg');
INSERT INTO `products` VALUES (84, 1, 'Những anh hùng trẻ tuổi - Người con trai Nà Mạ', 20000, 'https://product.hstatic.net/200000343865/product/nguoi-con-trai-na-ma_bia_9beff410922a4e85990de33260c4040b_master.jpg');
INSERT INTO `products` VALUES (85, 1, 'Hồ Chí Minh - Một con người và một dân tộc', 278000, 'https://product.hstatic.net/200000343865/product/ho-chi-minh_mot-con-nguoi-va-mot-dan-toc_bia_1dd8549c8886401e849bc2149d9326ad_master.png');
INSERT INTO `products` VALUES (86, 2, 'Lặng lẽ Sa Pa', 48000, 'https://cdn.hstatic.net/products/200000343865/lang-le-sapa_e21d2937bedc4ff5b6f594e508893a6a_4162c022e880456394cb5f3a51d7ced7_master.jpg');
INSERT INTO `products` VALUES (87, 2, 'Truyền kỳ mạn lục', 320000, 'https://cdn.hstatic.net/products/200000343865/truyen-ki-man-luc_179b495566fc4107a241a5fc1eea54be_master.jpg');
INSERT INTO `products` VALUES (88, 2, 'Mộng du khi xa xứ', 76000, 'https://cdn.hstatic.net/products/200000343865/mong-du-khi-xa-xu_bia_d4a020e9f2b84facb33b2e75dfe7d322_master.jpg');
INSERT INTO `products` VALUES (89, 2, 'Nhà văn Sơn Tùng - Những kí ức sáng trong', 32000, 'https://cdn.hstatic.net/products/200000343865/nha-van-son-tung_nhung-ki-uc-sang-trong_bia_27b0bf6215e34279bd6fc24c08bfcbf9_master.jpg');
INSERT INTO `products` VALUES (90, 2, 'Đi tìm xứ Tu-Bo', 84000, 'https://cdn.hstatic.net/products/200000343865/di-tim-xu-tu-bo_bia_f5b94a9615174468a1e999119de40789_master.jpg');
INSERT INTO `products` VALUES (91, 2, 'Viết cho những điều bé nhỏ - Về nghe hoa hòe kể chuyện', 32000, 'https://cdn.hstatic.net/products/200000343865/viet-cho-nhung-dieu-be-nho_ve-nghe-hoa-hoe-ke-chuyen_bia_a736011f470c403484c9f6c0c2ad5b8d_master.jpg');
INSERT INTO `products` VALUES (92, 2, 'Tủ sách Tuổi thần tiên - Đôi cánh chuồn lấp lánh', 44000, 'https://cdn.hstatic.net/products/200000343865/tu-sach-tuoi-than-tien_doi-canh-chuon-lap-lanh_bia_6fc1ae97033848e5a88ac28a8ea92358_master.jpg');
INSERT INTO `products` VALUES (93, 2, 'Mắt biếc', 55000, 'https://cdn1.fahasa.com/media/catalog/product/n/x/nxbtre_full_06402022_014041.jpg');
INSERT INTO `products` VALUES (94, 2, 'Tắt đèn', 40000, 'https://cdn.hstatic.net/products/200000343865/tu-sach-van-hoc-trong-nha-truong_tat-den_bia_305269f79abb4aa0ae9c0c411ba9d289_master.jpg');
INSERT INTO `products` VALUES (95, 2, 'Nam Hải dị nhân liệt truyện', 400000, 'https://cdn.hstatic.net/products/200000343865/nam-hai-di-nhan-liet-truyen_6478777fc3514889ac03f5be4fb5ab72_master.jpg');
INSERT INTO `products` VALUES (96, 2, 'Mẹ mìn bố mìn', 72000, 'https://cdn.hstatic.net/products/200000343865/me-min-bo-min_bia_633768a96c0147efb665d1cd2ea15174_master.jpg');
INSERT INTO `products` VALUES (97, 2, 'Mảnh đất, mảnh tình', 36000, 'https://cdn.hstatic.net/products/200000343865/manh-dat-manh-tinh_bia_4ffcf5fb1b99423d896665a318e44030_master.jpg');
INSERT INTO `products` VALUES (98, 2, 'Đời không trọn vẹn', 40000, 'https://cdn.hstatic.net/products/200000343865/doi-khong-tron-ven_bia_088d3329886244c0a37c81696c8472df_master.jpg');
INSERT INTO `products` VALUES (99, 2, 'Gánh nhớ ngang trời', 44000, 'https://cdn.hstatic.net/products/200000343865/ganh-nho-ngang-troi_bia_f6a1141c0c4947a2a01bd6625af1b6b5_master.jpg');
INSERT INTO `products` VALUES (100, 2, 'Kẻ cướp bến Bỏi', 42000, 'https://cdn.hstatic.net/products/200000343865/bo-ca-voi-dem-bao_5-cuon_5ea5b52bc2cc47f4991a481e36e1b519_master.jpg');
INSERT INTO `products` VALUES (101, 2, 'Kịch và Văn', 35000, 'https://cdn.hstatic.net/products/200000343865/tu-sach-van-hoc-trong-nha-truong_kich-va-van_tb-2025_36eddf2073104ab7b41836f524918988_master.jpg');
INSERT INTO `products` VALUES (102, 2, 'Những ngày thơ ấu', 26000, 'https://cdn.hstatic.net/products/200000343865/nhung-ngay-tho-au_bia_tb-2024_40d03834f9a34a1b9180d8ca3859b296_master.jpg');
INSERT INTO `products` VALUES (103, 2, 'Những ngõ phố', 76000, 'https://cdn.hstatic.net/products/200000343865/nhung-ngo-pho_bia_5c10ca6808424dd8a330af81998f8c12_master.jpg');
INSERT INTO `products` VALUES (104, 2, 'Thơ Thế Lữ', 30000, 'https://cdn.hstatic.net/products/200000343865/tu-sach-van-hoc-trong-nha-truong_tho-the-lu_bia_882cffceb08c4fda81dce3da7d6df22f_master.jpg');
INSERT INTO `products` VALUES (105, 2, 'Hà Nội băm sáu phố phường', 25000, 'https://cdn.hstatic.net/products/200000343865/van-hoc-trong-nha-truong_ha-noi-bam-sau-pho-phuong_bia_77a8d789a6704997975f92576442fb78_master.jpg');
INSERT INTO `products` VALUES (106, 2, 'Lão Hạc', 44000, 'https://cdn1.fahasa.com/media/catalog/product/8/9/8935236427838.jpg');
INSERT INTO `products` VALUES (107, 2, 'Chí Phèo', 35000, 'https://cdn1.fahasa.com/media/catalog/product/8/9/8936067604825.jpg');
INSERT INTO `products` VALUES (108, 2, 'Gió lạnh đầu mùa', 35500, 'https://cdn.hstatic.net/products/200000343865/tu-sach-van-hoc-trong-nha-truong_gio-lanh-dau-mua_tb-2025_565c7840ffe54685874f426a6d57bd9f_master.jpg');
INSERT INTO `products` VALUES (109, 2, 'Sóng ở đáy sông', 88000, 'https://tramdoc.net/wp-content/uploads/song-o-day-song-sbooks-1-1.jpg');
INSERT INTO `products` VALUES (110, 2, 'Văn học Tuổi hoa - Người thầy trên núi', 33000, 'https://cdn.hstatic.net/products/200000343865/tu-sach-tuoi-hoa_nguoi-thay-tren-nui_bia_3cfccb3a62e04726b6278cf73d3a5883_master.jpg');
INSERT INTO `products` VALUES (111, 2, 'Đoàn binh Tây Tiến', 36000, 'https://cdn.hstatic.net/products/200000343865/doan-binh-tay-tien_bia_tb-2025_7bd44edc1cbe42b38eb1b7e82afa7fbd_master.jpg');
INSERT INTO `products` VALUES (112, 2, 'Trong rừng dẻ gai', 33000, 'https://cdn.hstatic.net/products/200000343865/tu-sach-vang_trong-rung-de-gai_tb-2025_41970dad13934b1dab822ebae7bbabf9_master.jpg');
INSERT INTO `products` VALUES (113, 2, 'Số đỏ', 45000, 'https://cdn.hstatic.net/products/200000343865/tu-sach-van-hoc-trong-nha-truong_so-do_tb-2023_f08641b0b2ab495aa70d997b1d518f00_master.jpg');
INSERT INTO `products` VALUES (114, 2, 'Thơ Hàn Mặc Tử', 39000, 'https://product.hstatic.net/200000343865/product/ia-1_8afa8f76bd754655a2d97a3078b7e1ff_75f4b251b85d493892336dec6e2b40e0_89d9a1a703b54e7c87c130324a6b1d9d_master.jpg');
INSERT INTO `products` VALUES (115, 2, 'Đất rừng phương Nam', 65000, 'https://product.hstatic.net/200000343865/product/dat-rung-ph__ng-nam_tb-2025_3c4cec52bdcf4b3f96b723473c58c7f6_master.png');
INSERT INTO `products` VALUES (116, 2, 'Con của đảo', 76500, 'https://product.hstatic.net/200000343865/product/tu_sach_bien_dao_viet_nam_con_cua_dao_bia_3e039572d0fe4d188ac81d544f28ac89_master.jpg');
INSERT INTO `products` VALUES (117, 2, 'Truyện Kiều', 32000, 'https://product.hstatic.net/200000343865/product/van-hoc-trong-nha-truong_truyen-kieu_0ddde9ba494b4b27b3d8e2a54a246ad7_master.jpg');
INSERT INTO `products` VALUES (118, 2, 'Dế Mèn phiêu lưu ký', 120000, 'https://product.hstatic.net/200000343865/product/6241412630003_de6248c7042d465895c63ee497a9d49d_master.jpg');
INSERT INTO `products` VALUES (119, 2, 'Thơ Xuân Quỳnh', 28500, 'https://product.hstatic.net/200000343865/product/van-hoc-trong-nha-truong_tho-xuan-quynh_de44ca716ca84ac89c427b6ec58d945d_master.jpg');
INSERT INTO `products` VALUES (120, 2, 'Người mẹ cầm súng', 32500, 'https://product.hstatic.net/200000343865/product/tu-sach-vang_nguoi-me-cam-sung_tb-2025_4c41aaac97a2447faa374cee5160904b_master.jpg');
INSERT INTO `products` VALUES (121, 2, 'Thơ Hồ Xuân Hương', 23000, 'https://product.hstatic.net/200000343865/product/van-hoc-trong-nha-truong_tho-ho-xuan-huong_b968419849894822beabb15dd814c1a8_master.jpg');
INSERT INTO `products` VALUES (122, 2, 'Thơ Trần Tế Xương', 36000, 'Thơ Trần Tế Xương');
INSERT INTO `products` VALUES (123, 2, 'Thức dậy với Mặt Trời', 28000, 'https://product.hstatic.net/200000343865/product/thuc-day-voi-mat-troi_bia_461218f15a78469f99d0d01f7d56b042_master.jpg');
INSERT INTO `products` VALUES (124, 2, 'Thái Long tráng sĩ', 59000, 'https://product.hstatic.net/200000343865/product/thai-long-trang-si_bia_eb55fdb37953434f990ab3a41e29b2fa_master.jpg');
INSERT INTO `products` VALUES (125, 2, 'Truyện ngắn Lê Minh Khuê', 49000, 'https://product.hstatic.net/200000343865/product/tu-sach-van-hoc-trong-nha-truong_truyen-ngan-le-minh-khue_bia_0e577954b137431199a6f841238744ea_master.jpg');
INSERT INTO `products` VALUES (126, 2, 'Chuyện xứ Đồng Hóp', 36000, 'https://product.hstatic.net/200000343865/product/chuyen-xu-dong-hop_bia_7c38faa3f50a4675834a701ae1441362_master.jpg');
INSERT INTO `products` VALUES (127, 2, 'Mai rồi mưa tạnh trong xuân', 85000, 'https://product.hstatic.net/200000343865/product/mai-roi-mua-tanh-trong-xuan_bia_2025_9f7654e10edd469ba636db1a1859ab03_master.jpg');
INSERT INTO `products` VALUES (128, 2, 'Truyện Tây Bắc', 40000, 'https://product.hstatic.net/200000343865/product/van-hoc-trong-nha-truong_truyen-tay-bac_bia_3184faf0df9346d28cfdffd1f2f9a3f4_master.jpg');
INSERT INTO `products` VALUES (129, 2, 'Ve sầu phiêu du Bắc Cực', 62000, 'https://product.hstatic.net/200000343865/product/ve-sau-phieu-du-bac-cuc_bia_fef59fefb5d44b47a27accd193a0a9e2_master.jpg');
INSERT INTO `products` VALUES (130, 2, 'Sông vừa đi vừa lớn', 41000, 'https://product.hstatic.net/200000343865/product/song-vua-di-vua-lon_bia_1ec3ee7d52b845ad9ffc0ad62d832948_master.jpg');
INSERT INTO `products` VALUES (131, 2, 'Hoa hướng dương', 44000, 'https://product.hstatic.net/200000343865/product/hoa-huong-duong_bia_241f0956680044939f2e44958bf45e83_master.png');
INSERT INTO `products` VALUES (132, 2, 'Cá bống mú', 35000, 'https://product.hstatic.net/200000343865/product/ca-bong-mu_bia_6ae62e58476746d4b1715dcf3f4e4979_master.png');
INSERT INTO `products` VALUES (133, 2, 'Rừng đêm xào xạc', 43000, 'https://product.hstatic.net/200000343865/product/rung-dem-xao-xac_bia_78d665e9173b4ce5ab524aa7d715699f_master.png');
INSERT INTO `products` VALUES (134, 2, 'Những chuyện lạ về cá', 29000, 'https://product.hstatic.net/200000343865/product/nhung-chuyen-la-ve-ca_bia_79e15c2360224801aa6c7c46e737a9fe_master.png');
INSERT INTO `products` VALUES (135, 2, 'Tê giác trong ngàn xanh', 37000, 'https://product.hstatic.net/200000343865/product/te-giac-trong-ngan-xanh_bia_1b03fe856c8c4a4bbdf6ae5353f473b3_master.png');
INSERT INTO `products` VALUES (136, 2, 'Người thủy thủ già trên hòn đảo lưu đày', 51000, 'https://product.hstatic.net/200000343865/product/nguoi-thuy-thu-gia-tren-hon-dao-luu-day_bia_1f3d91feca8d43629ed66a5a80a87105_master.png');
INSERT INTO `products` VALUES (137, 2, 'Cuộc truy tầm kho vũ khí', 39000, 'https://product.hstatic.net/200000343865/product/cuoc-truy-tam-kho-vu-khi_bia_5a23ee5a9ce1485883f313aedd45aa2c_master.png');
INSERT INTO `products` VALUES (138, 2, 'Cuộc truy tầm kho vũ khí', 39000, 'https://product.hstatic.net/200000343865/product/cuoc-truy-tam-kho-vu-khi_bia_5a23ee5a9ce1485883f313aedd45aa2c_master.png');
INSERT INTO `products` VALUES (139, 2, 'Tiếng sáo Gà Lôi', 48000, 'https://product.hstatic.net/200000343865/product/tieng-sao-ga-loi_bia_18370d208ed04ffa8da66c3dfbd7a29e_master.png');
INSERT INTO `products` VALUES (140, 2, 'Tuổi thơ dữ dội - Tập 1', 63000, 'https://product.hstatic.net/200000343865/product/tuoi-tho-du-doi_tap-1---tb-2023_37610d8b4cd0453aa96ab4f7873defee_master.png');
INSERT INTO `products` VALUES (141, 2, 'Tuổi thơ dữ dội - Tập 2', 63000, 'https://product.hstatic.net/200000343865/product/tuoi-tho-du-doi_tap-2_f94c0d9a05f0449b8f02f5da3cd067d4_master.png');
INSERT INTO `products` VALUES (142, 2, 'Cho mùa xuân ở lại', 48000, 'https://product.hstatic.net/200000343865/product/cho-mua-xuan-o-lai_bia_0bc0d416c1be4a9a98d3fcbcff94498d_master.jpg');
INSERT INTO `products` VALUES (143, 2, 'Bầu trời trong quả trứng', 48000, 'https://product.hstatic.net/200000343865/product/bau-troi-trong-qua-trung_bia_tb-2025_1e159ee6093e451db196745d018d1c67_master.jpg');
INSERT INTO `products` VALUES (144, 2, 'Mũ rơm đi học', 64000, 'https://product.hstatic.net/200000343865/product/mu-rom-di-hoc_bia_2d53a4b051594e0ab384a4df6412bf6e_master.jpg');
INSERT INTO `products` VALUES (145, 2, 'Trang trại cuối rừng', 60000, 'https://product.hstatic.net/200000343865/product/trang-trai-cuoi-rung_bia_47bf4e8541654248980ddb65143fea1d_master.jpg');
INSERT INTO `products` VALUES (146, 2, 'Đất nước ngàn năm - Tập 1', 66000, 'https://product.hstatic.net/200000343865/product/dat-nuoc-ngan-nam_tap-1_51fb1c62c8c94ac284f7bce8dcd4ac4e_master.jpg');
INSERT INTO `products` VALUES (147, 2, 'Đất nước ngàn năm - Tập 2', 66000, 'https://product.hstatic.net/200000343865/product/dat-nuoc-ngan-nam_tap-2_10e2424229a3477e880a3ac6f41e2b29_master.jpg');
INSERT INTO `products` VALUES (148, 2, 'Làng ta có một anh hùng', 55000, 'https://product.hstatic.net/200000343865/product/lang-ta-co-mot-anh-hung_bia_cc507c72f5004c708e90bf0ac46e4c0c_master.jpg');
INSERT INTO `products` VALUES (149, 2, 'Cỏ trong rào bót', 20000, 'https://product.hstatic.net/200000343865/product/co-trong-rao-bot_bia_e84e899fc27d431c96c07aad1a9e7b4e_master.jpg');
INSERT INTO `products` VALUES (150, 2, 'Những thứ bạn dùng để lấp một cái hố', 72000, 'https://product.hstatic.net/200000343865/product/nhung-thu-ban-dung-de-lap-mot-cai-ho_bia_4c2a28b783a74b41a4089762980a5b93_master.jpg');
INSERT INTO `products` VALUES (151, 2, 'Xóm nhỏ yêu thương', 36000, 'https://product.hstatic.net/200000343865/product/xom-nho-yeu-thuong_bia-truoc_fc03bf9a2083400eae1a17179539c209_master.jpg');
INSERT INTO `products` VALUES (152, 2, 'Xám Ngố đi thành phố', 102000, 'https://product.hstatic.net/200000343865/product/xam-ngo-di-thanh-pho_bia_a25e432205234a32a30889111507d953_master.png');
INSERT INTO `products` VALUES (153, 2, 'Bầy cừu bay ngang thành phố', 49000, 'https://product.hstatic.net/200000343865/product/bay-cuu-bay-ngang-thanh-pho_bia_b9c289cf6a3247d0be09b6a839b426fa_master.jpg');
INSERT INTO `products` VALUES (154, 2, 'Đừng mở cửa cho người lạ', 38000, 'https://product.hstatic.net/200000343865/product/dung-mo-cua-cho-nguoi-la_bia_cef0f89ac28d4e29825a6563b6959c7e_master.jpg');
INSERT INTO `products` VALUES (155, 2, 'Bà Túng', 28000, 'https://product.hstatic.net/200000343865/product/ba-tung_bia_1fac8772b4624cd999ef835811f7e798_master.jpg');
INSERT INTO `products` VALUES (156, 2, 'Kính vạn hoa - Tập 1', 108000, 'https://product.hstatic.net/200000343865/product/kinh-van-hoa-_-bia-t1_tb2019_77abf05d7c154ee0ac16c0b50c0066a6_master.jpg');
INSERT INTO `products` VALUES (157, 2, 'Kính vạn hoa - Tập 2', 108000, 'https://product.hstatic.net/200000343865/product/kinh-van-hoa-_-bia---tap-2---tb-2019_b9118145eb924ebeac875f6584cbe9d3_master.jpg');
INSERT INTO `products` VALUES (158, 2, 'Kính vạn hoa - Tập 3', 108000, 'https://product.hstatic.net/200000343865/product/kinh-van-hoa-_-bia---tap-3_tb2019_b395356feb5b4353b2d1e5d508485806_master.jpg');
INSERT INTO `products` VALUES (159, 2, 'Kính vạn hoa - Tập 4', 108000, 'https://product.hstatic.net/200000343865/product/kinh-van-hoa-_-t4_tb-2019_39671bb200674e20a06c146092a9c9d1_master.jpg');
INSERT INTO `products` VALUES (160, 2, 'Kính vạn hoa - Tập 5', 108000, 'https://product.hstatic.net/200000343865/product/kinh-van-hoa-_-t5_tb-2019_ff63b1318aac4b40abe6ab9e5241d0f0_master.jpg');
INSERT INTO `products` VALUES (161, 2, 'Kính vạn hoa - Tập 6', 108000, 'https://product.hstatic.net/200000343865/product/kinh-van-hoa-_-t6_tb-2019_3402139d4abf47019c25420b5ccd4505_master.jpg');
INSERT INTO `products` VALUES (162, 2, 'Kính vạn hoa - Tập 7', 108000, 'https://product.hstatic.net/200000343865/product/kinh-van-hoa-_-t7_tb-2019_c0077d03fd944c4b9f4ae85af0234578_master.jpg');
INSERT INTO `products` VALUES (163, 2, 'Kính vạn hoa - Tập 8', 108000, 'https://product.hstatic.net/200000343865/product/kinh-van-hoa-_-t8_tb-2019_8b794815c0144fe392085c75492f429d_master.jpg');
INSERT INTO `products` VALUES (164, 2, 'Kính vạn hoa - Tập 9', 108000, 'https://product.hstatic.net/200000343865/product/kinh-van-hoa-_-t9_tb-2019_e59e4e503c3f416a9915c741a9bad862_master.jpg');
INSERT INTO `products` VALUES (165, 2, 'Thơ Nguyễn Bính', 34000, 'https://product.hstatic.net/200000343865/product/binh_b25ed1b1051644e9a7d4a9631fbdd26c_25c0cb27ac8244ca83efb9336cd4050c_e1bbf95a653a471b82721624c5ebfb92_master.jpg');
INSERT INTO `products` VALUES (166, 2, 'Xứ nước', 48000, 'https://product.hstatic.net/200000343865/product/xu-nuoc_bia_61f72cbc2a5b4c1084bee9f675bc32cc_master.jpg');
INSERT INTO `products` VALUES (167, 2, 'Sông còn chưa cạn', 64000, 'https://product.hstatic.net/200000343865/product/song-con-chua-can_bia_ea1f6ab45ea3428f8c6121fb38eb8b14_master.jpg');
INSERT INTO `products` VALUES (168, 2, 'Trái tim của đảo', 49000, 'https://product.hstatic.net/200000343865/product/trai-tim-cua-dao_bia_b509ba31d1e84a95931c57d52e2e0e41_master.jpg');
INSERT INTO `products` VALUES (169, 2, 'Thi nhân Việt Nam', 120000, 'https://product.hstatic.net/200000343865/product/thi-nhan-viet-nam_bia_aefb5d3ef4294a84ae4508619781ad16_master.jpg');
INSERT INTO `products` VALUES (170, 2, 'Chuyện kể thành ngữ', 75000, 'https://product.hstatic.net/200000343865/product/-ngu_b8378860408a480280836e77cd39f35a_80bf65cbf4384caba88b1d79704c22eb_4812025b3dc4424980c9f1402f3898d7_master.jpg');
INSERT INTO `products` VALUES (171, 2, 'Qua khỏi dốc là nhà', 56000, 'https://product.hstatic.net/200000343865/product/qua-khoi-doc-la-nha_c42c522f4a4647f3be392c54c277c50d_master.jpg');
INSERT INTO `products` VALUES (172, 2, 'Lân Tinh', 48000, 'https://product.hstatic.net/200000343865/product/lan-tinh_bia_e614ead30453495a8842ea128efbbe69_master.jpg');
INSERT INTO `products` VALUES (173, 2, 'Dưới bầu trời xa cách', 52000, 'https://product.hstatic.net/200000343865/product/duoi-bau-troi-xa-cach_bia_fdd1dee9104a4d48be9d61f2cad9d1c1_master.jpg');
INSERT INTO `products` VALUES (174, 2, 'Hoàng Lê nhất thống chí', 112000, 'https://product.hstatic.net/200000343865/product/hoang-le-nhat-thong-chi_bia_c58cba14bde64764b2ade424de428676_e723251bad2c4168b7ee553dccfd3b37_master.jpg');
INSERT INTO `products` VALUES (175, 2, 'Cô bé Drât Drâng Dĩng Bôl (Truyện cổ M\'nông)', 28000, 'https://product.hstatic.net/200000343865/product/truyen-co-m_nong_co-be-drat-drang-ding-bol_bia_eb56502bc07f48f18167ee03e924a272_master.jpg');
INSERT INTO `products` VALUES (176, 2, 'Thơ Lưu Trọng Lư', 28000, 'https://product.hstatic.net/200000343865/product/tho-luu-trong-lu_bia_61d818be3d394ac4ae920e032a4e69cd_master.jpg');
INSERT INTO `products` VALUES (177, 2, 'Đảo chìm', 29000, 'https://product.hstatic.net/200000343865/product/tu-sach-bien-dao_dao-chim_bia_tb-2024_ae7fb91badfb4311bb996fc1be5398ce_master.jpg');
INSERT INTO `products` VALUES (178, 2, 'Thơ Thâm Tâm', 28000, 'https://product.hstatic.net/200000343865/product/tu-sach-van-hoc-trong-nha-truong_tho-tham-tam_bia_2b723e58c8294dceb2cd39fedc0429d9_master.jpg');
INSERT INTO `products` VALUES (179, 2, 'Vùng trời thơ ấu', 48000, 'https://product.hstatic.net/200000343865/product/tu-sach-vang_vung-troi-tho-au_bia_tb-2024_ff2ec757f12f48bebcd11f7cd2568692_master.jpg');
INSERT INTO `products` VALUES (180, 2, 'Hạt phù sa kì diệu', 64000, 'https://product.hstatic.net/200000343865/product/hat-phu-sa-ki-dieu_bia_99993592675c41a8b1b877f942dd25ea_master.jpg');
INSERT INTO `products` VALUES (181, 2, 'Xe đạp và những kịch bản hoạt hình đặc sắc', 49000, 'https://product.hstatic.net/200000343865/product/xe-dap-va-nhung-kich-ban-hoat-hinh-dac-sac_bia_tb-2024_c7ef8aff47e140f196c5baad123de242_master.jpg');
INSERT INTO `products` VALUES (182, 2, 'Mùa rễ ngọt', 65000, 'https://product.hstatic.net/200000343865/product/mua-re-ngot_bia_d94581aeed904eebadeb552c3bcbd7b2_master.jpg');
INSERT INTO `products` VALUES (183, 2, 'Lục địa rồng - 1 - Hành trình phía Tây', 44000, 'https://product.hstatic.net/200000343865/product/1_dc11f5e8bf42442da818e36390a0e030_master.jpg');
INSERT INTO `products` VALUES (184, 2, 'Lục địa rồng - 2 - Hành trình phía Đông', 44000, 'https://product.hstatic.net/200000343865/product/2_1db5e951bd564e51a375aee5ebe8f422_master.jpg');
INSERT INTO `products` VALUES (185, 2, 'Lục địa rồng - 3 - Lời nói dối của vị thần', 44000, 'https://product.hstatic.net/200000343865/product/3_4daf35717c2b4a839d12f93dbf352333_master.jpg');
INSERT INTO `products` VALUES (186, 2, 'Lục địa rồng - 4 - Săn lùng tà thần', 44000, 'https://product.hstatic.net/200000343865/product/4_d832fffd91414e2da1b4894882e1bbcc_master.jpg');
INSERT INTO `products` VALUES (187, 2, 'Lục địa rồng - 5 - Hoàng hôn của thế giới', 44000, 'https://product.hstatic.net/200000343865/product/5_7fe49a14259e400f9dc66a5cdae8a692_master.jpg');
INSERT INTO `products` VALUES (188, 2, 'Quê nội', 70000, 'https://product.hstatic.net/200000343865/product/-noi_85a87915312048539db21b454eba372b_cce99b98738c4de0943b86fcd72c1bda_602bf7f9831c4bcca5bf754332352dd6_master.jpg');
INSERT INTO `products` VALUES (189, 2, 'Chuyện cũ Hà Nội - Phần 1', 70200, 'https://product.hstatic.net/200000343865/product/chuyen-cu-ha-noi-phan-1_f15bdd82088d4ddf8221c80d85c01cbc_6f7bc76dea344978ad9690a62ae68a03_master.jpg');
INSERT INTO `products` VALUES (190, 2, 'Ký ức Đông Dương', 48000, 'https://product.hstatic.net/200000343865/product/ky-uc-dong-duong_bia_1bc49da3f4ad472b8abf0062730699a9_master.jpg');
INSERT INTO `products` VALUES (191, 2, 'Ký ức phiên lãng', 88000, 'https://product.hstatic.net/200000343865/product/ky-uc-phien-lang_bia_1dc09ca52c1143b9b0f387f09a71a4a1_master.jpg');
INSERT INTO `products` VALUES (192, 2, 'Miền xanh thẳm', 64000, 'https://product.hstatic.net/200000343865/product/tu-sach-vang_mien-xanh-tham_bia_tb-2024_e1ed83caa7754bef9fdb421f9a63f2a1_master.jpg');
INSERT INTO `products` VALUES (193, 2, 'Gánh xiếc lớp tôi', 40000, 'https://product.hstatic.net/200000343865/product/tu-sach-vang_ganh-xiec-lop-toi_bia_tb-2024_28b73fa18ca0406eb1b13345ca1e86df_master.jpg');
INSERT INTO `products` VALUES (194, 2, 'Một vì sao không bao giờ khóc', 44000, 'https://product.hstatic.net/200000343865/product/mot-vi-sao-khong-bao-gio-khoc_bia_755e66f2e2ad401b89a35d24ca15c25f_master.jpg');
INSERT INTO `products` VALUES (195, 2, 'Nếu tất cả những gì tôi có là ngôn từ', 88000, 'https://product.hstatic.net/200000343865/product/neu-tat-ca-nhung-gi-toi-co-la-ngon-tu_bia_6f0d0795d3ff49dc8d0c15a03e440772_master.jpg');
INSERT INTO `products` VALUES (196, 2, 'Mực tàu giấy bản', 68000, 'https://product.hstatic.net/200000343865/product/muc-tau-giay-ban_bia_8341de9c7c674b1ebac5a398ea323b21_master.jpg');
INSERT INTO `products` VALUES (197, 2, 'Cổ tích và thắng cảnh Hà Nội', 52200, 'https://product.hstatic.net/200000343865/product/co-tich-va-thang-canh-ha-noi_tb-2024_377a6c931c814eae837cd882e80bdb93_master.jpg');
INSERT INTO `products` VALUES (198, 2, 'Hà Nội thanh lịch', 60000, 'https://product.hstatic.net/200000343865/product/ha-noi-thanh-lich_tb-2024_972e9df55fa04ac4a47f0989aaeecb27_master.jpg');
INSERT INTO `products` VALUES (199, 2, 'Phố phường Hà Nội xưa', 46000, 'Phố phường Hà Nội xưa');
INSERT INTO `products` VALUES (200, 2, 'Tục ngữ - Ca dao - Dân ca Việt Nam - Tập 1', 76000, 'https://product.hstatic.net/200000343865/product/gu-ca-dao-dan-ca-vn_bia_tap-1_tb-2021_11b71701d6ff4751bf4608748aebad38_88be4fef43634be1a085c1e87b0b5994_master.jpg');
INSERT INTO `products` VALUES (201, 2, 'Tục ngữ - Ca dao - Dân ca Việt Nam - Tập 2', 76000, 'https://product.hstatic.net/200000343865/product/-dao_dan-ca_viet-nam_-tap-2---tb-2021_2a1e0c2fe3a4486b8d9fb0bd392bb933_858bb1e0b6b0426e9a4f21b9c7b84bb1_master.jpg');
INSERT INTO `products` VALUES (202, 2, 'Tuổi nhỏ chí cao', 18000, 'https://product.hstatic.net/200000343865/product/tuoi-nho-chi-cao---tb-2022_40cfa7732a384eb6b8e89a624518da74_16a9da5cff3d403f81cf643ca3b60200_master.jpg');
INSERT INTO `products` VALUES (203, 3, 'Ông già Noel bất đắc dĩ', 48000, 'https://cdn.hstatic.net/products/200000343865/ong-gia-noel-bat-dac-di_bia_e417a1ef843a47539c4ee60c305ee545_master.jpg');
INSERT INTO `products` VALUES (204, 3, 'To All the Boys I\'ve Loved Before - Tập 1 - Gửi những chàng trai tôi từng yêu', 92000, 'https://cdn.hstatic.net/products/200000343865/the-boys-i_ve-loved-before_tap-1_gui-nhung-chang-trai-toi-tung-yeu_bia_cb4d908a3d4641d784ac34edd567cc13_master.jpg');
INSERT INTO `products` VALUES (205, 3, 'To All the Boys I\'ve Loved Before - Tập 2 - P.S. Em vẫn còn yêu', 92000, 'https://cdn.hstatic.net/products/200000343865/to-all-the-boys-i_ve-loved-before_tap-2_ps-em-van-con-yeu_bia_0a71e0d346884ab1b1ad9276f8a53c2d_master.jpg');
INSERT INTO `products` VALUES (206, 3, 'To All the Boys I\'ve Loved Before - Tập 3 - Luôn mãi yêu, Lara Jean', 48000, 'https://cdn.hstatic.net/products/200000343865/to-all-the-boys-i_ve-loved-before_tap-3_luon-mai-yeu-lara-jean_bia_c6c474d0c1d3458db926560ea2c92ea1_master.jpg');
INSERT INTO `products` VALUES (207, 3, 'Truyện cổ Grimm - Tập 1', 52000, 'https://cdn.hstatic.net/products/200000343865/truyen-co-grimm-tap-1_bia_38d6abee9d534a7ba6d698b0993693dc_master.png');
INSERT INTO `products` VALUES (208, 3, 'Truyện cổ Grimm - Tập 2', 52000, 'https://product.hstatic.net/200000343865/product/2_6b4ba78edb86446e9a10f42f321d5abe_127d26fab7924ac4978c65b9edd6de39_master.jpg');
INSERT INTO `products` VALUES (209, 3, 'Truyện cổ Grimm - Tập 3', 52000, 'https://product.hstatic.net/200000343865/product/3_ffe83e26cb3248b7b430214c72ec75a4_5d59821e0af346e89d1659212c3b2887_master.jpg');
INSERT INTO `products` VALUES (210, 3, 'Truyện cổ Grimm - Tập 4', 52000, 'https://cdn.hstatic.net/products/200000343865/truyen_co_grimm_tap_4_tai_ban_2019_597795d789d14d659cf9ee65fd77ef9e_master.jpg');
INSERT INTO `products` VALUES (211, 3, 'Kẹp hạt dẻ', 40500, 'https://cdn.hstatic.net/products/200000343865/tac-pham-chon-loc_van-hoc-duc_kep-hat-de_bia_3b239f3412964a1eab115623e6b1a8d4_master.jpg');
INSERT INTO `products` VALUES (212, 3, 'Những nhà du hành vĩ đại', 44800, 'https://cdn.hstatic.net/products/200000343865/nhung-nha-du-hanh-vi-dai_bia_eac79e0aa74e4733bc0fe40c47662ee4_master.jpg');
INSERT INTO `products` VALUES (213, 3, 'Những cuộc phiêu lưu của Huck Finn', 112000, 'https://cdn.hstatic.net/products/200000343865/nhung-cuoc-phieu-luu-cua-huck-finn_bia_83aaf980c4f046ed96db6320fa56fe82_master.jpg');
INSERT INTO `products` VALUES (214, 3, 'Mập và Mực - Chuyện hai thằng oái oăm cùng bảy trò chơi khăm', 28000, 'https://cdn.hstatic.net/products/200000343865/map-va-muc_chuyen-hai-thang-oai-am-cung-bay-tro-choi-kham_bia_588cde481671463e8f66f0bb07673496_master.jpg');
INSERT INTO `products` VALUES (215, 3, 'Tiếng gọi nơi hoang dã', 44000, 'https://cdn.hstatic.net/products/200000343865/tieng-goi-noi-hoang-da_tb-2025_44b62c1c3a4b4415a3f964721c9d7eea_master.jpg');
INSERT INTO `products` VALUES (216, 3, 'Hai vạn dặm dưới biển', 79200, 'https://cdn.hstatic.net/products/200000343865/hai-van-dam-duoi-bien_tb-2023_530ebaf897894b0cbc3ee8f97ac4bf38_master.jpg');
INSERT INTO `products` VALUES (217, 3, 'Điều ước thủy tinh', 40000, 'https://cdn.hstatic.net/products/200000343865/dieu-uoc-thuy-tinh_bia_af60eb5f19eb40f18887086e66619102_master.png');
INSERT INTO `products` VALUES (218, 3, 'Nàng tiên cá cuối cùng', 64000, 'https://cdn.hstatic.net/products/200000343865/nang-tien-ca-cuoi-cung_ac901f6666f14df5ae89423cb7c547d0_master.jpg');
INSERT INTO `products` VALUES (219, 3, 'Cậu bé trong hộp thiếc', 79200, 'https://cdn.hstatic.net/products/200000343865/cau-be-trong-hop-thiec_bia_eaae3d252f0349dc9b8815a25cc46288_master.jpg');
INSERT INTO `products` VALUES (220, 3, 'Chiếc chìa khóa vàng hay chuyện li kì của Buratino', 176000, 'https://cdn.hstatic.net/products/200000343865/chiec-chia-khoa-vang-hay-chuyen-li-ki-cua-buratino---2022_efa13847f4ed4ff68982e58494d8af39_master.jpg');
INSERT INTO `products` VALUES (221, 3, 'Truyện ngắn Lỗ Tấn', 48000, 'https://cdn.hstatic.net/products/200000343865/tu-sach-van-hoc-trong-nha-truong_truyen-ngan-lo-tan_tb-2023_2544266b4b324f0fba571492f2e89a0e_master.jpg');
INSERT INTO `products` VALUES (222, 3, 'Ông già và biển cả', 36000, 'https://product.hstatic.net/200000343865/product/ong-gia-va-bien-ca---tac-pham-chon-loc---van-hoc-my_tb-2025_11fb155f0aad4bcc8350e0fdaf9a7109_master.jpg');
INSERT INTO `products` VALUES (223, 3, 'Robinson Crusoe', 40000, 'https://product.hstatic.net/200000343865/product/robinson-crusoe_tb-2025_ce9d8d32662b4152a7c1eeefec35dad3_master.jpg');
INSERT INTO `products` VALUES (224, 3, 'Bác sĩ Aibôlít', 24000, 'https://product.hstatic.net/200000343865/product/bac-si-aibolit_tb-2022_ee751cf2a4b642179f457d6b6a5c3706_master.jpg');
INSERT INTO `products` VALUES (225, 3, 'Cuộc phiêu lưu tới Mặt Trăng của anh bọ béo', 40000, 'https://product.hstatic.net/200000343865/product/m_chon_loc_van_hoc_duc_cuoc_phieu_luu_toi_mat_trang_cua_anh_bo_beo_bia_95006bfa161743e38dc33170783982c6_master.jpg');
INSERT INTO `products` VALUES (226, 3, 'Hoàng tử bé', 28000, 'https://product.hstatic.net/200000343865/product/hoang-tu-be_tb-2025_137e72f8d7a04ef294f95e756136bb1c_master.jpg');
INSERT INTO `products` VALUES (227, 3, 'Ngàn lẻ một đêm kể chuyện cho mèo', 56000, 'https://product.hstatic.net/200000343865/product/ngan_le_mot_dem_ke_chuyen_cho_meo_bia_3a5a7515a9ba4f7dad9728545e88cc5a_master.jpg');
INSERT INTO `products` VALUES (228, 3, 'Gà Mờ và Vịt Khờ - Phiêu lưu đến vùng đất mộng mơ', 40000, 'https://product.hstatic.net/200000343865/product/ga_mo_va_vit_kho_phieu_luu_toi_vung_dat_mong_mo_bia_cd85a714e9b8421789855cc42c9a69b6_master.jpg');
INSERT INTO `products` VALUES (229, 3, 'Gà Mờ và Vịt Khờ - Bữa tiệc chất chơi ở bể bơi', 40000, 'https://product.hstatic.net/200000343865/product/ga_mo_va_vit_kho_bua_tiec_chat_choi_o_be_boi_preview_bia_260faa1c81144a1095c0691e14c17ca7_master.jpg');
INSERT INTO `products` VALUES (230, 3, 'Trên sa mạc và trong rừng thẳm', 78400, 'https://product.hstatic.net/200000343865/product/tren-sa-mac-va-trong-rung-tham_bia-tb-2019_97ac351331dc4fca9b2404d12595ab8b_master.jpg');
INSERT INTO `products` VALUES (231, 3, 'Ngôi nhà nhỏ trên thảo nguyên - Tập 1 - Giữa đại ngàn', 32000, 'https://product.hstatic.net/200000343865/product/1_70a56c7ba03e42318a9367547b09f6e5_a61f7e18a44544a288a0607635bffc8e_master.jpg');
INSERT INTO `products` VALUES (232, 3, 'Ngôi nhà nhỏ trên thảo nguyên - Tập 2 - Cậu bé nhà nông', 56000, 'https://product.hstatic.net/200000343865/product/ngoi-nha-nho-tren-thao-nguyen---cau-be-nha-nong_bia_tb2010_ca0e9e3e002141528d93ff63376eec02_master.jpg');
INSERT INTO `products` VALUES (233, 3, 'Ngôi nhà nhỏ trên thảo nguyên - Tập 3 - Trên thảo nguyên', 56000, 'https://product.hstatic.net/200000343865/product/ngoi-nha-nho-tren-thao-nguyen---tren-thao-nguyen_bia_tb2019_02f310f01c9048dcaece7fc48dbf259e_master.jpg');
INSERT INTO `products` VALUES (234, 3, 'Ngôi nhà nhỏ trên thảo nguyên - Tập 4 - Bên dòng Rạch Mận', 56000, 'https://product.hstatic.net/200000343865/product/4_a300792260ca480289eaeddbd8e672d3_bc4d17625b1e4c6aa68a145ff690f952_master.jpg');
INSERT INTO `products` VALUES (235, 3, 'Ngôi nhà nhỏ trên thảo nguyên - Tập 5 - Ven bờ Hồ Bạc', 56000, 'https://product.hstatic.net/200000343865/product/5_ba8a647514844e68ac13cf4593f1d6f6_1235b802d46f446a89511315e2c22ed4_master.jpg');
INSERT INTO `products` VALUES (236, 3, 'Ngôi nhà nhỏ trên thảo nguyên - Tập 6 - Mùa đông bất tận', 64000, 'https://product.hstatic.net/200000343865/product/6_24d32baff2cd48e5bb2503b4c1720e0e_9de191b8f8ad415ca9805ac4fe6c30d3_master.jpg');
INSERT INTO `products` VALUES (237, 3, 'Ngôi nhà nhỏ trên thảo nguyên - Tập 7 - Thị trấn nhỏ', 56000, 'https://product.hstatic.net/200000343865/product/7_0e08a65a6e2b4e498dca0b903bd72238_2f7b6f08731943ef98428ff80068396d_master.jpg');
INSERT INTO `products` VALUES (238, 3, 'Ngôi nhà nhỏ trên thảo nguyên - Tập 8 - Năm tháng vàng son', 56000, 'https://product.hstatic.net/200000343865/product/8_198d0aaae9074f47a14bcd6fd07a5957_c29cdede66f74e96920ba6d12c87be6d_master.jpg');
INSERT INTO `products` VALUES (239, 3, 'Ngôi nhà nhỏ trên thảo nguyên - Tập 9 - Thuở ban đầu', 24000, 'https://product.hstatic.net/200000343865/product/9_9ba8b439c91343e8b80d2400049225a6_72fc25b80ae4475a8d621d55cd82d654_master.jpg');
INSERT INTO `products` VALUES (240, 3, 'Không gia đình', 120000, 'https://product.hstatic.net/200000343865/product/khong-gia-dinh---tb-2022_4779893e7a6f45d8bb315e69f90c5033_master.jpg');
INSERT INTO `products` VALUES (241, 3, 'Nhật kí trong khu rừng mộng mơ', 88000, 'https://product.hstatic.net/200000343865/product/nhat-ki-trong-khu-rung-mong-mo_bia_dfd14dc21542463bbb934aac95589df2_master.jpg');
INSERT INTO `products` VALUES (242, 3, 'Đảo giấu vàng', 48000, 'https://cdn.hstatic.net/products/200000343865/ong-gia-noel-bat-dac-di_bia_e417a1ef843a47539c4ee60c305ee545_master.jpg');
INSERT INTO `products` VALUES (243, 3, 'Sứ Mệnh Hail Mary - Project Hail Mary', 125000, 'https://cdn1.fahasa.com/media/catalog/product/b/_/b_a-1_7_12.jpg');
INSERT INTO `products` VALUES (244, 3, 'Nhà Giả Kim', 66000, 'https://cdn1.fahasa.com/media/catalog/product/i/m/image_195509_1_36793.jpg');
INSERT INTO `products` VALUES (245, 3, 'Charlie và nhà máy sôcôla', 48000, 'https://product.hstatic.net/200000343865/product/roald-dahl---charlie-va-nha-may-socola_a4875bf2d6c440d4bd1024288fb6ada2_master.jpg');
INSERT INTO `products` VALUES (246, 3, 'Cổ tích dưới bóng sồi ngàn tuổi', 132000, 'https://product.hstatic.net/200000343865/product/co-tich-duoi-bong-soi-ngan-tuoi_bia_f0eacf938eee4e0caf1ff82113b0bb1b_master.jpg');
INSERT INTO `products` VALUES (247, 3, 'Beartown - Thị Trấn Nhỏ, Giấc Mơ Lớn', 177000, 'https://cdn1.fahasa.com/media/catalog/product/8/9/8934974186083.jpg');
INSERT INTO `products` VALUES (248, 3, 'Gia đình ong', 44000, 'https://product.hstatic.net/200000343865/product/gia-dinh-ong_bia_b0440da393a44baa8565abe7102f86b5_master.jpg');
INSERT INTO `products` VALUES (249, 3, 'Từ nhà anh về nhà em - Hành trình 16,000 km đạp xe xuyên Âu-Á của cặp đôi Pháp-Việt', 120000, 'https://product.hstatic.net/200000343865/product/tu-nha-anh-ve-nha-em_bia_8a28111675bd42078604acc331b44ae8_master.jpg');
INSERT INTO `products` VALUES (250, 3, 'Hai Số Phận - Kane And Abel', 236000, 'https://cdn1.fahasa.com/media/catalog/product/b/i/bia_1_hai_so_phan_bc_1480e4f883424e25aba89a0dee7cbab8_master_1.jpg');
INSERT INTO `products` VALUES (251, 3, ' Chuyện phiêu lưu của Mít Đặc và các bạn', 144000, 'https://product.hstatic.net/200000343865/product/chuyen-phieu-luu-cua-mit-dac-va-cac-ban_-bia_tb-2025_6c0f39ee68ed4cfba1ce0302e4cc6bae_master.jpg');
INSERT INTO `products` VALUES (252, 3, 'Trường Ca Achilles', 133000, 'https://cdn1.fahasa.com/media/catalog/product/i/m/image_195509_1_41170.jpg');
INSERT INTO `products` VALUES (253, 3, 'Hachiko - chú chó đợi chờ', 48000, 'https://product.hstatic.net/200000343865/product/hachiko-chu-cho-doi-cho_bia-mem_a1c8fd670ca64fab953c7b3d5561360d_master.jpg');
INSERT INTO `products` VALUES (254, 3, 'Những tấm lòng cao cả', 68000, 'https://product.hstatic.net/200000343865/product/nhung-tam-long-cao-ca_bia---tb-2019_8207782f856c4c8a922cd7c9d11f35aa_master.jpg');
INSERT INTO `products` VALUES (255, 3, 'Chỉ có một trên đời', 72000, 'https://product.hstatic.net/200000343865/product/chi-co-mot-tren-doi_bia_c0979cfb2dda4cfbaf9118e5cf137279_master.jpg');
INSERT INTO `products` VALUES (256, 3, 'Người Mohican cuối cùng', 48000, 'https://product.hstatic.net/200000343865/product/nguoi-mohican-cuoi-cung_bia_963bc46af56549c89a3d116fdb696d19_master.jpg');
INSERT INTO `products` VALUES (257, 3, 'Đảo ngàn sao', 48000, 'https://product.hstatic.net/200000343865/product/dao-ngan-sao_bia_6c097ac58eed4bb18808286655b4a965_88fe4fe353314672bc2c528193311864_master.jpg');
INSERT INTO `products` VALUES (258, 3, 'Những đứa con của đường rừng', 24000, 'https://product.hstatic.net/200000343865/product/nhung-dua-con-duong-rung_bia_3fd4ac030b244398a0c0875cc8418432_master.jpg');
INSERT INTO `products` VALUES (259, 3, 'Ông già Noel bất đắc dĩ', 48000, 'https://cdn.hstatic.net/products/200000343865/ong-gia-noel-bat-dac-di_bia_e417a1ef843a47539c4ee60c305ee545_master.jpg');
INSERT INTO `products` VALUES (260, 3, 'Nhím Charlie tài ba - Xông pha trị thủy', 36000, 'https://product.hstatic.net/200000343865/product/nhim-charlie-tai-ba_xong-pha-tri-thuy_bia_008fed5bedfc4b2a98c9fcb1296e29ac_master.jpg');
INSERT INTO `products` VALUES (261, 3, 'Nhím Charlie tài ba - Phiêu lưu nơi đảo xa', 40000, 'https://product.hstatic.net/200000343865/product/nhim-charlie-tai-ba_phieu-luu-noi-dao-xa_bia_4869f24879ae4ddbad395a8e11e9cded_master.jpg');
INSERT INTO `products` VALUES (262, 3, 'Cô bé chong chóng', 48000, 'https://product.hstatic.net/200000343865/product/co-be-chong-chong_bia_f0d8769b05a64393958970d01ad92968_master.jpg');
INSERT INTO `products` VALUES (263, 3, 'Nanh trắng', 72000, 'https://product.hstatic.net/200000343865/product/nanh-trang_bia_3f7a6d71c8614c808e0cdd57d9137a0e_master.jpg');
INSERT INTO `products` VALUES (264, 3, 'Một xu một ngày', 110000, 'https://product.hstatic.net/200000343865/product/mot-xu-mot-ngay_bia_tb-2024_62bd5ee06ba647e79232f964917561f6_master.jpg');
INSERT INTO `products` VALUES (265, 3, 'Ngài Hổ, Betsy và con ngựa biển vàng', 40000, 'https://product.hstatic.net/200000343865/product/ngai-ho_-betsy-va-con-ngua-bien-vang_bia_fa7bd11ec6994a23b55a25c813460e75_master.jpg');
INSERT INTO `products` VALUES (266, 3, 'Ngài Hổ, Betsy và chú Rồng Biển', 40000, 'https://product.hstatic.net/200000343865/product/ngai-ho_-betsy-va-chu-rong-bien_bia_b80b4a28e0d540e5996d6dfa7c79a403_master.jpg');
INSERT INTO `products` VALUES (267, 3, 'Ngài Hổ, Betsy và Mặt Trăng Xanh', 40000, 'https://product.hstatic.net/200000343865/product/ngai-ho_-betsy-va-mat-trang-xanh_bia_9b5202053e2f4a85b5bd163a667277a2_master.jpg');
INSERT INTO `products` VALUES (268, 3, 'Khúc ca mừng Giáng sinh', 44000, 'https://product.hstatic.net/200000343865/product/khuc-ca-mung-giang-sinh_bia_tb-2024_fcc8fd4e3b43446085f6455d9f3151ef_master.jpg');
INSERT INTO `products` VALUES (269, 3, 'Charlie thương nhớ', 60000, 'https://product.hstatic.net/200000343865/product/charlie-thuong-nho_bia_cf84e5e54365460ebf6c3e85ad00b069_master.jpg');
INSERT INTO `products` VALUES (270, 3, 'Cánh buồm đỏ thắm', 24000, 'https://product.hstatic.net/200000343865/product/22-1_3d9a184ae7b0477495a0247f1af9f1fa_235f1bad9ea6461a805e8140db513aa9_149481f31cbc4d39abf8c80c48f9a206_master.jpg');
INSERT INTO `products` VALUES (271, 3, 'Lớn lên trên đảo vắng', 76000, 'https://product.hstatic.net/200000343865/product/lon-len-tren-dao-vang_bia_tb-2024_ced3ef5dcee04dda956a43e5da426a34_master.jpg');
INSERT INTO `products` VALUES (272, 3, 'Quán trọ Ancuta', 40000, 'https://product.hstatic.net/200000343865/product/tac-pham-chon-loc_van-hoc-rumani_quan-tro-ancuta_bia_tb-2024_2b501c0ed4674a0488734fb5ba2c2557_master.jpg');
INSERT INTO `products` VALUES (273, 3, 'Những đứa trẻ kì diệu - Cô bé tí hon', 24000, 'https://product.hstatic.net/200000343865/product/co-be-ti-hon_f6fd5dd5ee1d4592bbfe4971186130e9_01e66d566ce343929d40cc2d49e909a5_master.jpg');
INSERT INTO `products` VALUES (274, 3, 'Những đứa trẻ kì diệu - Cô bé khỏe nhất thế giới', 24000, 'https://product.hstatic.net/200000343865/product/co-be-khoe-nhat-the-gioi_3d315c225f3340729a62912d7c0ba2dd_1__f2f4e3b83b234f3d9fa4276f2ba436dd_master.jpg');
INSERT INTO `products` VALUES (275, 3, 'Những đứa trẻ kì diệu - Cậu bé biết bay', 24000, 'https://product.hstatic.net/200000343865/product/cau-be-biet-bay_526bc0854a5b475e920f90127b5f7cd9_29b553a8b7ce4d88a54679ec48018456_master.jpg');
INSERT INTO `products` VALUES (276, 3, 'Những đứa trẻ kì diệu - Cậu bé và những con số màu nhiệm', 24000, 'https://product.hstatic.net/200000343865/product/cau-be-va-nhung-con-so_f1bdc1e07b1d462ab75aef4e88e508a2_2a8d0fcc11f549f4baf59445831b90ba_master.jpg');
INSERT INTO `products` VALUES (277, 3, 'Những đứa trẻ kì diệu - Cậu bé tàng hình', 24000, 'https://product.hstatic.net/200000343865/product/cau-be-tang-hinh_815a7f55d472485bb82c21ebabd59f4d_20bc39618a8a4ac9b110f5ce94fe4119_master.jpg');
INSERT INTO `products` VALUES (278, 3, 'Những đứa trẻ kì diệu - Cậu bé có đôi chân tia chớp', 24000, 'https://product.hstatic.net/200000343865/product/cau-be-co-doi-chan-tia-chop_5c51909c3a8b418ab04569d67d201acc_07f1f1c53b95411aa0709bdcdfb21adf_master.jpg');
INSERT INTO `products` VALUES (279, 3, 'Chuyện rừng xanh', 56000, 'https://product.hstatic.net/200000343865/product/chuyen-rung-xanh_tb-2024_71e1f46ea70942829af804db896fe58e_master.jpg');
INSERT INTO `products` VALUES (280, 3, 'Cuộc phiêu lưu của Tom Sawyer', 78000, 'https://product.hstatic.net/200000343865/product/cuoc-phieu-luu-cua-tom-sawyer_bia_tb-2024_407612f3fb6147d9a1b2b30762f3e2af_master.jpg');
INSERT INTO `products` VALUES (281, 3, 'Bà Ngoại Tôi Gửi Lời Xin Lỗi', 163000, 'https://cdn1.fahasa.com/media/catalog/product/8/9/8934974185086.jpg');
INSERT INTO `products` VALUES (282, 3, 'Khu vườn kì diệu - 1 - Công thức kì lạ của phù thủy dược thảo', 48000, 'https://product.hstatic.net/200000343865/product/1_9a5b79387c4643b7ae3b47b850fd4373_master.jpg');
INSERT INTO `products` VALUES (283, 3, 'Khu vườn kì diệu - 2 - Trà dược thảo của phù thủy nhỏ', 48000, 'https://product.hstatic.net/200000343865/product/2_f0e53e2484304ef4bde988eb65a05107_master.jpg');
INSERT INTO `products` VALUES (284, 3, 'Khu vườn kì diệu - 3 - Phép màu nhỏ xíu của lá bạc hà', 48000, 'https://product.hstatic.net/200000343865/product/3_bb2e2caf7ac54303aad128eab563e456_master.jpg');
INSERT INTO `products` VALUES (285, 3, 'Khu vườn kì diệu - 4 - Bó hoa dược thảo và ba cô phù thủy', 48000, 'https://product.hstatic.net/200000343865/product/4_67834a3fc30047ecac76736092954e8a_master.jpg');
INSERT INTO `products` VALUES (286, 3, 'Khu vườn kì diệu - 5 - Phép màu tuyệt diệu với mọi người', 48000, 'https://product.hstatic.net/200000343865/product/5_e21a8470d2ca427f97f5f266df8cd83d_master.jpg');
INSERT INTO `products` VALUES (287, 3, 'Thần thoại Nhật Bản', 64000, 'https://product.hstatic.net/200000343865/product/than-thoai-nhat-ban_bia_b874a364550e4026a067525beb3afc7f_master.jpg');
INSERT INTO `products` VALUES (288, 3, 'Ngụ ngôn La Fontaine', 60000, 'https://product.hstatic.net/200000343865/product/ngu-ngon-la-fontaine_bia_5e5f5cab31ae47b8b0134c682dc156f7_0024959159a949f8845210a0026d0df3_master.jpg');
INSERT INTO `products` VALUES (289, 3, 'Chiếc nhẫn bằng thép', 48000, 'https://product.hstatic.net/200000343865/product/chiec-nhan-bang-thep_bia_tb-2024_b21e6a394d09401db51944639a62c603_master.jpg');
INSERT INTO `products` VALUES (290, 3, 'Người kể chuyện cuối cùng', 79000, 'https://product.hstatic.net/200000343865/product/nguoi-ke-chuyen-cuoi-cung_bia_dd389beca4b44f59adba6fdc5c302a71_master.jpg');
INSERT INTO `products` VALUES (291, 3, 'Hoàng tử bé', 28000, 'https://product.hstatic.net/200000343865/product/hoang-tu-be_tb-2022_6e3dfd01ace949c6b114186402117726_5f8abf11a050414eb4996caabc94e49a_master.jpg');
INSERT INTO `products` VALUES (292, 3, 'Bé Sương Mù và những gã Đa Sắc', 58000, 'https://product.hstatic.net/200000343865/product/be-suong-mu-va-nhung-ga-da-sac_bia_3f68ebafd8c24059babedfd499f8c27d_master.jpg');
INSERT INTO `products` VALUES (293, 3, 'Nhật kí Gian Rắc Rối', 68000, 'https://product.hstatic.net/200000343865/product/nhat-ki-gian-rac-roi_bia_b5cce066874044619616b23267c2f817_master.jpg');
INSERT INTO `products` VALUES (294, 3, 'Những truyện ngụ ngôn hay nhất của Aesop', 38000, 'https://product.hstatic.net/200000343865/product/ngu-ngon-hay-nhat-cua--edop-chuyen-in_7e44957c5ce4408ca33d2b0664a97659_3afdad2580b14524a31be2f7201663de_master.jpg');
INSERT INTO `products` VALUES (295, 3, 'Túp lều bác Tôm', 78000, 'https://product.hstatic.net/200000343865/product/tup-leu-bac-tom_bia_file-in_ad9997a0247f40b68d63c2db42a8923b_e09af0e1cca148fb9e3c9684789bc926_master.jpg');
INSERT INTO `products` VALUES (296, 3, 'Tác giả kinh điển Nhật Bản - Truyện hay cho tuổi học đường - Tập 3 - Chén uống trà của Lãnh chúa', 48000, 'https://product.hstatic.net/200000343865/product/chen-tra-cua-lanh-chua_bia_e48e91cbb23f424385917cb796aa0258_afbc2288386c42babb5e4bd6415c0fa2_master.jpg');
INSERT INTO `products` VALUES (297, 3, 'Tác giả kinh điển Nhật Bản - Truyện hay cho tuổi học đường - Tập 4 - Quán ăn thích mè nheo', 36000, 'https://product.hstatic.net/200000343865/product/quan-an-thich-me-nheo_bia_8d4acc6f630e4ea0a4ba8b3a32da6ac0_756c8042a00543baa75d58b1bf3a800b_master.jpg');
INSERT INTO `products` VALUES (298, 3, 'Tác giả kinh điển Nhật Bản - Truyện hay cho tuổi học đường - Tập 2 - Cây nến đỏ và nàng tiên cá', 48000, 'https://product.hstatic.net/200000343865/product/cay-nen-do-va-nang-tien-ca_bia_915b0989498946dda5a994490c3fbb09_8d604a47c15247899f0a56db2c26409e_master.jpg');
INSERT INTO `products` VALUES (299, 3, 'Tác giả kinh điển Nhật Bản - Truyện hay cho tuổi học đường - Tập 1 - Mèo rừng và hạt dẻ', 36000, 'https://product.hstatic.net/200000343865/product/meo-rung-va-hat-de_bia_172d3f360d4f460eaccefaaa5592c8ec_8c0e5e3944de4bf097882fc60dd7f65e_master.jpg');
INSERT INTO `products` VALUES (300, 3, 'Chàng Hoàng Tử Hạnh Phúc - Ngôi nhà Thạch Lựu', 56000, 'https://product.hstatic.net/200000343865/product/oscar-wilde_chang-hoang-tu-hanh-phuc---ngoi-nha-thach-luu_bia_tb-2024_9672146601284f498d7e9afa3b458c2b_master.jpg');
INSERT INTO `products` VALUES (301, 3, 'Những ngày thứ Ba với thầy Morrie', 60000, 'https://product.hstatic.net/200000343865/product/nhung-ngay-thu-ba-voi-thay-morrie_6cba4e499407490e96661cfabf2b2ebe_b293f26303944aa988d835e1620ed59a_master.jpg');
INSERT INTO `products` VALUES (302, 3, 'Chuyện phiêu lưu của Mít Đặc và các bạn (Bìa cứng)', 148000, 'https://product.hstatic.net/200000343865/product/-luu-cua-mit-dac-va-cac-ban---tb-2022_b971a69bd5e743c3ad5d4940a820dc87_92cc1b9690a44ca4830026247eed7717_master.jpg');
INSERT INTO `products` VALUES (303, 3, 'Sinh vật thần thoại khắp thế gian', 62000, 'https://product.hstatic.net/200000343865/product/nh-vat-than-thoai-khap-the-gian_bia-1_bed53d66bffc4056982523d86e9a9f69_2576807d90af42789cb291236a7db3ca_master.jpg');
INSERT INTO `products` VALUES (304, 3, 'Cuộc phiêu lưu kì diệu của Nils Holgersson', 80000, 'https://product.hstatic.net/200000343865/product/-ki-dieu-cua-nil-hogersson_bia_2022-1_2161bea9d77d453f9601095d2404b910_c13cd0fd5cd6460c80be1269a09052cd_master.jpg');
INSERT INTO `products` VALUES (305, 3, 'Huệ tím', 34000, 'https://product.hstatic.net/200000343865/product/loc---van-hoc-duc---hue-tim---tb-2022_9466302a353d46ac917ddb3e246a020d_a11f163cea92467ea44b0cd21a297e8f_master.jpg');
INSERT INTO `products` VALUES (306, 3, 'Kho báu mất tích', 68000, 'https://product.hstatic.net/200000343865/product/kho-bau-mat-tich_bia_ab5b4407fff24148ad817ffb1dfac991_master.jpg');
INSERT INTO `products` VALUES (307, 3, 'Trong gia đình', 66000, 'https://product.hstatic.net/200000343865/product/trong-gia-dinh_bia_tb2019_0_3fc0a81ef5474430a9a8d2076547f31b_c3cd8396cec1487e8fe2cea594bdb685_master.jpg');
INSERT INTO `products` VALUES (308, 3, 'Sau lưng Gió Bấc', 92000, 'https://product.hstatic.net/200000343865/product/sau-lung-gio-bac_92730470d679403991df72d1db7cf3c3_master.jpg');
INSERT INTO `products` VALUES (309, 3, 'Alice ở xứ sở thần tiên', 40000, 'https://product.hstatic.net/200000343865/product/alice-o-xu-so-than-tien_tb-2024_17f4df5a299f4ea98cac40f4f501db5b_master.jpg');
INSERT INTO `products` VALUES (310, 4, 'Xôn xao đầu đời - Tất tần tật về cơ thể bé', 30000, 'https://product.hstatic.net/200000343865/product/xon-xao-dau-doi---tat-tan-tat-ve-co-the-be_6625bd7c6ac3462c88c0f9d97e9710a3_master.jpg');
INSERT INTO `products` VALUES (311, 4, 'Xôn xao đầu đời - Gia đình bạn - Gia đình tớ', 30000, 'https://product.hstatic.net/200000343865/product/xon-xao-dau-doi---gia-dinh-ban-gia-dinh-toi_d6e67d8d76a045999e9437276f6d1cf8_master.jpg');
INSERT INTO `products` VALUES (312, 4, 'Xôn xao đầu đời - Em bé từ đâu đến', 30000, 'https://product.hstatic.net/200000343865/product/xon-xao-dau-doi---em-be-den-tu-dau_de059345feac4ad68828a7fac0eb8808_master.jpg');
INSERT INTO `products` VALUES (313, 4, 'Who? Chuyện kể về danh nhân thế giới - Winston Churchill', 48000, 'https://product.hstatic.net/200000343865/product/churchill_1621ab217a6e40e0854d7d880cedf1cb_38194ca216d7482db063dd3b9e1a8660_master.jpg');
INSERT INTO `products` VALUES (314, 4, 'Who? Chuyện kể về danh nhân thế giới - Wilhelm Roentgen', 48000, 'https://product.hstatic.net/200000343865/product/roentgen_7549a3508fa849c2aea03d1253f5e8b4_0b7df40ffda6466fbe6769ddc8394fe1_master.jpg');
INSERT INTO `products` VALUES (315, 4, 'Who? Chuyện kể về danh nhân thế giới - Warren Buffett', 44000, 'https://product.hstatic.net/200000343865/product/warren-buffett_dc2600a96ac24bc9807fa50c72e9ce44_master.jpg');
INSERT INTO `products` VALUES (316, 4, 'Who? Chuyện kể về danh nhân thế giới - Walt Disney', 44000, 'Who? Chuyện kể về danh nhân thế giới - Walt Disney');
INSERT INTO `products` VALUES (317, 4, 'Who? Chuyện kể về danh nhân thế giới - Vincent van Gogh', 44000, 'https://product.hstatic.net/200000343865/product/chuyen-ke-ve-danh-nhan-the-gioi_vincent-van-gogh_bia-tb-2019_2b3f7f1396784403b53ca383982bb252_master.jpg');
INSERT INTO `products` VALUES (318, 4, 'Who? Chuyện kể về danh nhân thế giới - Usain Bolt', 48000, 'https://product.hstatic.net/200000343865/product/usain-bolt_b9c18d23cc92456eac222cb17b8172ae_676c5a9d0a4a49a4b7e95cc9ac7d0f4b_master.jpg');
INSERT INTO `products` VALUES (319, 4, 'Who? Chuyện kể về danh nhân thế giới - Steven Spielberg', 48000, 'https://product.hstatic.net/200000343865/product/steve-spielberg_b7fb9b704e28459aa368033eb8f4dc7b_eb27cbfea02848a6acb80cff79e1db19_master.jpg');
INSERT INTO `products` VALUES (320, 4, 'Who? Chuyện kể về danh nhân thế giới - Steve Jobs', 48000, 'https://product.hstatic.net/200000343865/product/steve-jobs_e34f45b434514a51bdcfd15c67a3f4bb_3e68511d35ba4d61b55166f4c88c812b_master.jpg');
INSERT INTO `products` VALUES (321, 4, 'Who? Chuyện kể về danh nhân thế giới - Stephen Hawking', 52000, 'https://product.hstatic.net/200000343865/product/who---chuyen-ke-ve-danh-nhan-the-gioi---stephen-hawking---tb-2023_e1d80c539d6345aa8aea03cc996ecacb_master.jpg');
INSERT INTO `products` VALUES (322, 4, 'Who? Chuyện kể về danh nhân thế giới - Simone de Beauvoir', 48000, 'https://product.hstatic.net/200000343865/product/danh-nhan-who_simone-de-beauvoir_bia_14b85d7e6a29431881228ebf3bef8d00_master.jpg');
INSERT INTO `products` VALUES (323, 4, 'Who? Chuyện kể về danh nhân thế giới - Pele', 48000, 'https://product.hstatic.net/200000343865/product/pele_96e623385c934bb7adf8f0fc84fd8198_b7dda100cba14da18a58ee1a1c665705_0229b8971dca446d8017a219d31cbd6e_master.jpg');
INSERT INTO `products` VALUES (324, 4, 'Who? Chuyện kể về danh nhân thế giới - Oprah Winfrey', 52000, 'https://product.hstatic.net/200000343865/product/winfrey_7fac90945cd24566aa83768212e65801_62dba80af5204b9791842f287fd29415_master.jpg');
INSERT INTO `products` VALUES (325, 4, 'Who? Chuyện kể về danh nhân thế giới - Nikola Tesla', 48000, 'https://product.hstatic.net/200000343865/product/who_chuyen-ke-danh-nhan-the-gioi_nikola-tesla_bia_392f941aa7654af996386af4f0aeb5b6_master.jpg');
INSERT INTO `products` VALUES (326, 4, 'Who? Chuyện kể về danh nhân thế giới - Nelson Mandela', 48000, 'https://product.hstatic.net/200000343865/product/mandela_ad3bdc71348b4150be5bec51f820439b_41c6cf4d23e544bc92b6435292cb8428_master.jpg');
INSERT INTO `products` VALUES (327, 4, 'Who? Chuyện kể về danh nhân thế giới - Michael Jordan', 48000, 'https://product.hstatic.net/200000343865/product/michael-jordan_a6d8cb1e47ae47e7989476812cfec002_7102b8e7c75447de9fa0f5dd185f31db_master.jpg');
INSERT INTO `products` VALUES (328, 4, 'Who? Chuyện kể về danh nhân thế giới - Michael Jackson', 48000, 'https://product.hstatic.net/200000343865/product/who_chuyen-ke-ve-danh-nhan-the-gioi_michael-jackson_db85ec10e7734d1c974ba06d3321e23d_master.jpg');
INSERT INTO `products` VALUES (329, 4, 'Who? Chuyện kể về danh nhân thế giới - Martin Luther King', 48000, 'https://product.hstatic.net/200000343865/product/luther-king_d8c9963d9a2847f3b7d807816b4612a0_af2f44c13c78460a8047d3bc8179e319_master.jpg');
INSERT INTO `products` VALUES (330, 4, 'Who? Chuyện kể về danh nhân thế giới - Mark Twain', 48000, 'https://product.hstatic.net/200000343865/product/danh-nhan-who_mark-twain_bia_aff1b49728a341ff8f918661c95ecd78_master.jpg');
INSERT INTO `products` VALUES (331, 4, 'Who? Chuyện kể về danh nhân thế giới - Maria Montessori', 48000, 'https://product.hstatic.net/200000343865/product/maria-montessori_cfad8d8db64e4a0bb788b73f414950be_0d31ecbe0a52492d8686b2caedaf9895_master.jpg');
INSERT INTO `products` VALUES (332, 4, 'Who? Chuyện kể về danh nhân thế giới - Mahatma Gandhi', 48000, 'https://product.hstatic.net/200000343865/product/mahatma-gandhi_c644a9816aac465ba7ab987af1285b46_9e8f2f7516a44922b6beef1017318245_master.jpg');
INSERT INTO `products` VALUES (333, 4, 'Who? Chuyện kể về danh nhân thế giới - Ludwig van Beethoven', 44000, 'https://product.hstatic.net/200000343865/product/chuyen-ke-ve-danh-nhan-the-gioi---bia---tb-2019---ludwig-van-beethoven_a3822d87bcf24c618ef04e35dcef749a_master.jpg');
INSERT INTO `products` VALUES (334, 4, 'Who? Chuyện kể về danh nhân thế giới - Louis Pasteur', 44000, 'https://product.hstatic.net/200000343865/product/chuyen-ke-ve-danh-nhan-the-gioi_louis-pasteur_fb9b746b80454d66b4003e481a1f2081_master.jpg');
INSERT INTO `products` VALUES (335, 4, 'Who? Chuyện kể về danh nhân thế giới - Louis Braille', 52000, 'https://product.hstatic.net/200000343865/product/louis-braille_9e894a3ab8d94fc1a272925ae79b1295_e6ac8d5b43574386b6bec2ef0e47d663_master.jpg');
INSERT INTO `products` VALUES (336, 4, 'Who? Chuyện kể về danh nhân thế giới - Lionel Messi', 52000, 'https://product.hstatic.net/200000343865/product/who_chuyen-ke-ve-danh-nhan-the-gioi_lionel-messi_a58c63cf6a834b93999e5ecc42a592b4_master.jpg');
INSERT INTO `products` VALUES (337, 4, 'Who? Chuyện kể về danh nhân thế giới - Leonardo da Vinci', 44000, 'https://product.hstatic.net/200000343865/product/who-chuyen-ke-ve-danh-nhan-the-gioi--leonardo-da-vinci-_tb-2020__511ee93d225e40318723b24717f0fc2d_master.jpg');
INSERT INTO `products` VALUES (338, 4, 'Who? Chuyện kể về danh nhân thế giới - Karl Marx', 44000, 'https://product.hstatic.net/200000343865/product/karl-marx_5b52a1f559fc420aa5b392b140c24b0e_1e570d1745df405a8257ec9bd47e4df5_master.jpg');
INSERT INTO `products` VALUES (339, 4, 'Who? Chuyện kể về danh nhân thế giới - Joseph Pulitzer', 48000, 'https://product.hstatic.net/200000343865/product/who_chuyen-ke-danh-nhan-the-gioi_joseph-pulitzer_fbaf2379b20b427f94e18dd7f1e1d431_master.jpg');
INSERT INTO `products` VALUES (340, 4, 'Who? Chuyện kể về danh nhân thế giới - John Lennon (2021)', 44000, 'https://product.hstatic.net/200000343865/product/john-lennon_a2c81f47ac8b4061a63396a9818be1ef_master.jpg');
INSERT INTO `products` VALUES (341, 4, 'Who? Chuyện kể về danh nhân thế giới - Jeff Bezos', 48000, 'https://product.hstatic.net/200000343865/product/danh-nhan-who_jeff-bezos_bia_2efa726fbbfd4186a405c2f965880216_master.jpg');
INSERT INTO `products` VALUES (342, 4, 'Who? Chuyện kể về danh nhân thế giới - Jane Goodall', 44000, 'https://product.hstatic.net/200000343865/product/who_chuyen-ke-ve-danh-nhan-the-gioi_jane-goodall_tb-2023_a2900d1f51de4d3a93574262a5db1dce_master.jpg');
INSERT INTO `products` VALUES (343, 4, 'Who? Chuyện kể về danh nhân thế giới - James Watt', 48000, 'https://product.hstatic.net/200000343865/product/who_chuyen-ke-danh-nhan-the-gioi_james-watt_bia_0f6be6d462ed4a999e234068fcb2f85c_master.jpg');
INSERT INTO `products` VALUES (344, 4, 'Who? Chuyện kể về danh nhân thế giới - Immanuel Kant', 48000, 'https://product.hstatic.net/200000343865/product/who_chuyen-ke-danh-nhan-the-gioi_immanuel-kant_bia_7a0a2129f04f4da59465dba72469ac67_master.jpg');
INSERT INTO `products` VALUES (345, 4, 'Who? Chuyện kể về danh nhân thế giới - Hillary Clinton', 52000, 'https://product.hstatic.net/200000343865/product/clinton_308977643352480fabd8b5285791182f_15fde7715774493c8910822aff2bf69a_master.jpg');
INSERT INTO `products` VALUES (346, 4, 'Who? Chuyện kể về danh nhân thế giới - Henry David Thoreau', 44000, 'https://product.hstatic.net/200000343865/product/thoureau_26789dbac2244e33b6ad26fd0ba502cf_465a1b1bd1fb4cd79a619de9d1a89631_master.jpg');
INSERT INTO `products` VALUES (347, 4, 'Who? Chuyện kể về danh nhân thế giới - Hans Christian Andersen', 44000, 'https://product.hstatic.net/200000343865/product/andersen_1743e31945824350ad7f8f1d7e596ac8_bbde36032b3c4a23b81b7590f88bbca3_master.jpg');
INSERT INTO `products` VALUES (348, 4, 'Who? Chuyện kể về danh nhân thế giới - Gregor Mendel', 48000, 'https://product.hstatic.net/200000343865/product/who---chuyen-ke-ve-danh-nhan-the-gioi---bia---tb-2019---gregor-mendel_514f3ff1bbf940b39f6754505993ff79_master.jpg');
INSERT INTO `products` VALUES (349, 4, 'Who? Chuyện kể về danh nhân thế giới - Elon Musk', 48000, 'https://product.hstatic.net/200000343865/product/danh-nhan-who_elon-musk_bia_883c9093921e4b179fae48ea3be4fc4c_master.png');
INSERT INTO `products` VALUES (350, 4, 'Who? Chuyện kể về danh nhân thế giới - Coco Chanel', 44000, 'Who? Chuyện kể về danh nhân thế giới - Coco Chanel');
INSERT INTO `products` VALUES (351, 4, 'Who? Chuyện kể về danh nhân thế giới - Che Guevara', 44000, 'https://product.hstatic.net/200000343865/product/che-guevara_90eddc631d674a96b27bf3ee303d250e_master.jpg');
INSERT INTO `products` VALUES (352, 4, 'Who? Chuyện kể về danh nhân thế giới - Charlie Chaplin', 44000, 'https://product.hstatic.net/200000343865/product/chaplin_82fff149b5c7413d8658eb9d5a62c528_5fdb60e27dec40c3bf3e65454bc964fe_master.jpg');
INSERT INTO `products` VALUES (353, 4, 'Who? Chuyện kể về danh nhân thế giới - Charles Darwin', 52000, 'https://product.hstatic.net/200000343865/product/darwin_47c44ebd2f0343b18570c2624a054ca6_e6f3f2cabbaf42d6a29bfb6e7c517dc4_master.jpg');
INSERT INTO `products` VALUES (354, 4, 'Who? Chuyện kể về danh nhân thế giới - Bill Gates', 48000, 'https://cdn.hstatic.net/products/200000343865/who---chuyen-ke-ve-danh-nhan-the-gioi-bill-gates---tb-2023_d506b50cc3534241af1afc002656ec25_master.jpg');
INSERT INTO `products` VALUES (355, 4, 'Who? Chuyện kể về danh nhân thế giới - Barack Obama', 54000, 'https://cdn.hstatic.net/products/200000343865/who-chuyen-ke-ve-danh-nhan-the-gioi_barack-obama_tb-2023_0b70d840074846949e0cb419854f0b3e_master.jpg');
INSERT INTO `products` VALUES (356, 4, 'Who? Chuyện kể về danh nhân thế giới - Audrey Hepburn', 48000, 'https://product.hstatic.net/200000343865/product/who---chuyen-ke-ve-danh-nhan-the-gioi---bia---tb-2019---audrey-hepburn_2b63ae94ddd14840b063fa01efa5448e_master.jpg');
INSERT INTO `products` VALUES (357, 4, 'Who? Chuyện kể về danh nhân thế giới - Antoni Gaudi', 48000, 'https://product.hstatic.net/200000343865/product/danh-nhan-who_antoni-gaudi_bia_418f629e45ce4bec97860d230ab33cfe_master.jpg');
INSERT INTO `products` VALUES (358, 4, 'Who? Chuyện kể về danh nhân thế giới - Anh em nhà Wright', 44000, 'https://product.hstatic.net/200000343865/product/anh-em-nha-wright_111d303567c84ceaadcbdbb5526d2294_c796fac71f9c48529a2074f0fc38460a_master.jpg');
INSERT INTO `products` VALUES (359, 4, 'Who? Chuyện kể về danh nhân thế giới - Angela Merkel', 48000, 'https://product.hstatic.net/200000343865/product/who_chuyen-ke-danh-nhan-the-gioi_angela-merkel_bia_82a31e67699f4776a63e5053875789cd_master.jpg');
INSERT INTO `products` VALUES (360, 4, 'Vua Tutankhamun - Chuyện giờ mới kể', 27000, 'https://product.hstatic.net/200000343865/product/vua-tutankhamun_9677bf53dc284f10bdd4d856a5430be5_master.jpg');
INSERT INTO `products` VALUES (361, 4, 'Nữ hoàng Cleopatra - Chuyện giờ mới kể', 27000, 'https://product.hstatic.net/200000343865/product/nu-hoang-cleopatra_a22ef2f5e6214db2a0ea6047e7b7c6f3_master.jpg');
INSERT INTO `products` VALUES (362, 4, 'Vòng quanh thế giới - Indonesia', 9600, 'https://cdn.hstatic.net/products/200000343865/esia_5f2d8acfcf884ef491721373627f4976_d60b979cd88840219f1e8b32357d42fd_1f5c271645cf44fdadf264420cd531ea_master.jpg');
INSERT INTO `products` VALUES (363, 4, 'Vòng quanh thế giới - Nam Phi', 9600, 'https://cdn.hstatic.net/products/200000343865/-phi_42fe83fff37f4d639593517b926fa446_092b953cdebf4bbea3d40b56ed691fe2_595be30b342d49d1bc84716c59a391f7_master.jpg');
INSERT INTO `products` VALUES (364, 4, 'Vòng quanh thế giới - Ý', 9600, 'https://product.hstatic.net/200000343865/product/y_cover_1200ef607d0c416cad80131a40796850_f4d633f901f24399892fb9f6b9474290_master.jpg');
INSERT INTO `products` VALUES (365, 4, 'Vòng quanh thế giới - Ấn Độ', 9600, 'https://cdn.hstatic.net/products/200000343865/vong-quanh-the-gioi_an-do_tb-2025_6900853441b74f448bafa91d36a62cc4_master.jpg');
INSERT INTO `products` VALUES (366, 4, 'Vòng quanh thế giới - Thái Lan', 9600, 'https://cdn.hstatic.net/products/200000343865/vong-quanh-the-gioi---thai-lan_988cbce308484268a86e938031bf4a29_master.jpg');
INSERT INTO `products` VALUES (367, 4, 'Vòng quanh thế giới - Tây Ban Nha', 9600, 'Vòng quanh thế giới - Tây Ban Nha');
INSERT INTO `products` VALUES (368, 4, 'Vòng quanh thế giới - Nga', 9600, 'https://cdn.hstatic.net/products/200000343865/vong-quanh-the-gioi---nga_3d051f5f32494688937f5a64a346cca5_master.jpg');
INSERT INTO `products` VALUES (369, 4, 'Vòng quanh thế giới - Mỹ', 9600, 'https://cdn.hstatic.net/products/200000343865/vong-quanh-the-gioi---my_40008220de3e4c179fcff118295bc8cc_master.jpg');
INSERT INTO `products` VALUES (370, 4, 'Vòng quanh thế giới - Đức', 9600, 'https://cdn.hstatic.net/products/200000343865/vong-quanh-the-gioi---d_c_f967e14329534125aaad789e687a8f72_master.jpg');
INSERT INTO `products` VALUES (371, 4, 'Vòng quanh thế giới - Việt Nam', 9600, 'https://product.hstatic.net/200000343865/product/vong-quanh-the-gioi--tb-2019---bia---viet-nam_f6ea0a6f3e414ff8960e70aed88c92c5_master.jpg');
INSERT INTO `products` VALUES (372, 4, 'Vòng quanh thế giới - Úc', 9600, 'https://product.hstatic.net/200000343865/product/vong-quanh-the-gioi---uc_1a8e9bc972dd46879ebdda4a99075899_master.jpg');
INSERT INTO `products` VALUES (373, 4, 'Vòng quanh thế giới - Trung Quốc', 9600, 'https://product.hstatic.net/200000343865/product/vong-quanh-the-gioi---trung-quoc_7138a01d61894e1ca5b6fe08ea5c3dc0_master.jpg');
INSERT INTO `products` VALUES (374, 4, 'Vòng quanh thế giới - Pháp', 9600, 'https://product.hstatic.net/200000343865/product/vong-quanh-the-gioi---phap_19dbea2637434c679d5bb01cfbc0eb1f_master.jpg');
INSERT INTO `products` VALUES (375, 4, 'Vòng quanh thế giới - Nhật Bản', 9600, 'https://product.hstatic.net/200000343865/product/vong-quanh-the-gioi---nhat-ban_e4545289d78c4714942cbc177d7e9b81_master.jpg');
INSERT INTO `products` VALUES (376, 4, 'Vòng quanh thế giới - Mông Cổ', 9600, 'https://product.hstatic.net/200000343865/product/vong-quanh-the-gioi---m_ng-c__7c3ac4dc1a4a49bdbde19ba3a76cc9d1_master.jpg');
INSERT INTO `products` VALUES (377, 4, 'Vòng quanh thế giới - Hàn Quốc', 9600, 'https://product.hstatic.net/200000343865/product/vong-quanh-the-gioi---han-quoc_483475e599b141d2b47fc374e128524d_master.jpg');
INSERT INTO `products` VALUES (378, 4, 'Vòng quanh thế giới - Hà Lan', 9600, 'https://product.hstatic.net/200000343865/product/vong-quanh-the-gioi---h_-lan_a59005bb5fc34e2aa5552822f3320b13_master.jpg');
INSERT INTO `products` VALUES (379, 4, 'Vòng quanh thế giới - Anh', 9600, 'https://product.hstatic.net/200000343865/product/v_ng-quanh-th_-gi_i---anh_e01ae80070fd41c79ef609b5ba31d7e3_master.jpg');
INSERT INTO `products` VALUES (380, 4, 'Vòng quanh thế giới - Ai Cập', 9600, 'https://product.hstatic.net/200000343865/product/v_ng-quanh-th_-gi_i---ai-c_p_a939db9a6be8469aa69d228f168dcf2a_master.jpg');
INSERT INTO `products` VALUES (381, 4, 'Vòng quanh thế giới - Lào', 9600, 'https://product.hstatic.net/200000343865/product/vong-quanh-the-gioi_lao_bia_868282b847d6453d91e981d62beb57fa_master.png');
INSERT INTO `products` VALUES (382, 4, 'Vòng quanh thế giới - Bồ Đào Nha', 9600, 'https://product.hstatic.net/200000343865/product/vong-quanh-the-gioi_bo-dao-nha_bia_1cdc9f1e13a0481e987961273495902f_master.png');
INSERT INTO `products` VALUES (383, 4, 'Vòng quanh thế giới - Bhutan', 9600, 'Vòng quanh thế giới - Bhutan');
INSERT INTO `products` VALUES (384, 4, 'Vòng quanh thế giới - Argentina', 9600, 'https://product.hstatic.net/200000343865/product/vong-quanh-the-gioi_argentina_bia_190fce45edc44d9d90f444eba8c2ed03_master.png');
INSERT INTO `products` VALUES (385, 4, 'Vòng quanh thế giới - Đài Loan', 9600, 'https://product.hstatic.net/200000343865/product/vong-quanh-the-gioi_dai-loan_bia_cae2983605ad4e7089de205cdab213ed_master.png');
INSERT INTO `products` VALUES (386, 4, 'Vòng quanh thế giới - Na Uy', 9600, 'https://product.hstatic.net/200000343865/product/a-uy_6975c99987b440f48ea166aa1dd0e557_89bd0e2ccc8641c395c536ec930b678e_8aa986974b6e4b3b9ccb724156a9c463_master.jpg');
INSERT INTO `products` VALUES (387, 4, 'Vòng quanh thế giới - Madagascar', 9600, 'https://product.hstatic.net/200000343865/product/scar_7fce77dbe19143139272a8efd80e27b9_766fa98a42fb4c07b7b9c44444e8fbd7_6d7927850c6244969f29abeb9e07d5dd_master.jpg');
INSERT INTO `products` VALUES (388, 4, 'Vòng quanh thế giới - Israel', 9600, 'https://product.hstatic.net/200000343865/product/rael_0e44be7555614c248369156407d2b4e5_13b2357e2705467a9a9e3257374fe734_c5d93ab0c48b48f7bef66067c98795a0_master.jpg');
INSERT INTO `products` VALUES (389, 4, 'Vòng quanh thế giới - Cu Ba', 9600, 'https://product.hstatic.net/200000343865/product/cuba_fa52029b7af64b38989730c9c85bea58_a365d5b9e1fa43c8b9a55de745595b98_512c742290834309a27c930241a2ecaa_master.jpg');
INSERT INTO `products` VALUES (390, 4, 'Vòng quanh thế giới - Áo', 9600, 'https://product.hstatic.net/200000343865/product/vong-quanh-the-gioi-ao_e2e6bbc306404c94a32915cf4a984f64_bf2c714364fd4cb4ab28d9e94e3ca7cd_master.jpg');
INSERT INTO `products` VALUES (391, 4, 'Vòng quanh thế giới - Thổ Nhĩ Kì', 9600, 'https://product.hstatic.net/200000343865/product/tho-nhi-ki_645dded13b2b42a6a96fb556afb0210d_6a87a62748004da4bda85002d82daa73_master.jpg');
INSERT INTO `products` VALUES (392, 4, 'Vòng quanh thế giới - Hi Lạp', 9600, 'https://product.hstatic.net/200000343865/product/hi-lap_0103a998a625463ea17674aa1799b05e_777c0391c4614244b5172931a684108f_master.jpg');
INSERT INTO `products` VALUES (393, 4, 'Vòng quanh thế giới - Đan Mạch', 9600, 'https://product.hstatic.net/200000343865/product/h_868187103dbd4868ae52d121cc22a34d_d56b7c15393d47748261a55a6c4f810b_1__7e6ed484b0ce48dab95300c9f89d547a_master.jpg');
INSERT INTO `products` VALUES (394, 4, 'Vòng quanh thế giới - Campuchia', 9600, 'https://product.hstatic.net/200000343865/product/campuchia_cover_8052317897224129b712cc698e7fc42d_a7370c8f58cc4a138a43f7198ac598ac_master.jpg');
INSERT INTO `products` VALUES (395, 4, 'Vòng quanh thế giới - Nigeria', 9600, 'https://product.hstatic.net/200000343865/product/nigeria_20625e0253df450a95a6a9af0485378d_005818cdde0e400a94da4f0165187ebe_master.jpg');
INSERT INTO `products` VALUES (396, 4, 'Vòng quanh thế giới - Brazil', 9600, 'https://product.hstatic.net/200000343865/product/brazil_cover_afedba98d19640c3b65f6ff08b225a83_40a2327859284dbf86ee3ae7bc17b573_master.jpg');
INSERT INTO `products` VALUES (397, 4, 'Vòng quanh thế giới - Iceland', 9600, 'https://product.hstatic.net/200000343865/product/iceland_49061214a9c14f819c6f522e5c8297f4_e878afc80b1e48ae94fd6c8c0b2b584c_master.jpg');
INSERT INTO `products` VALUES (398, 4, 'Vòng quanh thế giới - Nepal', 9600, 'https://product.hstatic.net/200000343865/product/nepal_55d88444ae7047898dcfe7001ad79e7a_88c4dd91f32b4a249957cf38cacf6a75_master.jpg');
INSERT INTO `products` VALUES (399, 4, 'Vòng quanh thế giới - Dubai', 9600, 'https://product.hstatic.net/200000343865/product/du-bai_96bdbf04b41645a5826c7499a2f2ee0e_01d3d0c4223b4374a77d92af2993592e_master.jpg');
INSERT INTO `products` VALUES (400, 4, 'Vòng quanh thế giới - Mexico', 9600, 'https://product.hstatic.net/200000343865/product/mexico_31ec4593e1b14826bd5245ec4b245b89_master.jpg');
INSERT INTO `products` VALUES (401, 4, 'Vòng quanh thế giới - Canada', 9600, 'https://product.hstatic.net/200000343865/product/canada_6d6b5e55071943cb97184cc445de2481_master.jpg');
INSERT INTO `products` VALUES (402, 4, 'Việt vị - Những góc tối của môn thể thao Vua', 88500, 'https://product.hstatic.net/200000343865/product/viet-vi-red_bafbb0cd304545d182715bb4889376a6_master.jpg');
INSERT INTO `products` VALUES (403, 4, 'Vietnamese Art', 160000, 'https://product.hstatic.net/200000343865/product/vietnamese-art_bia_27b922cb99b04b4b979fc268f29b859a_master.jpg');
INSERT INTO `products` VALUES (404, 4, 'Virus không cố ý - Câu chuyện về virus, vi khuẩn và COVID-19', 44500, 'https://product.hstatic.net/200000343865/product/virus-ko-co-y_330014fdd1894b4187016af77f975b08_master.jpg');
INSERT INTO `products` VALUES (405, 4, 'Tuyệt chủng hay sống sót? Nhập vai tiến hoá của muôn loài', 108000, 'https://cdn.hstatic.net/products/200000343865/tuyet-chung-hay-song-sot_bia_4e49aa6c65b94a639512149bc4b746b6_master.jpg');
INSERT INTO `products` VALUES (406, 4, 'Việt Nam phong tục', 108000, 'https://cdn.hstatic.net/products/200000343865/viet-nam-phong-tuc_bia-mem_tb-2023_a08a402199d44486b427fc2f919f6c4b_master.jpg');
INSERT INTO `products` VALUES (407, 4, 'Vì sao nghệ thuật toàn người khỏa thân?', 26000, 'https://product.hstatic.net/200000343865/product/vi_sao_nghe_thuat_toan_nguoi_khoa_than_bia_0_1a1947794804410694a25e18931c19f1_master.jpg');
INSERT INTO `products` VALUES (408, 4, 'Vẹt đuôi dài đã trông thấy gì ?', 25000, 'https://product.hstatic.net/200000343865/product/vet-duoi-dai-da-trong-thay-gi_22b9ee811eb6415eac4c37442d695bb8_master.jpg');
INSERT INTO `products` VALUES (409, 4, 'Vén màn ảo thuật - Ảo thuật mạo hiểm', 13000, 'Vén màn ảo thuật - Ảo thuật mạo hiểm');
INSERT INTO `products` VALUES (410, 4, 'Vén màn ảo thuật - Ảo thuật đánh lừa thị giác', 13000, 'Vén màn ảo thuật - Ảo thuật đánh lừa thị giác');
INSERT INTO `products` VALUES (411, 4, 'Tư duy như Steve Jobs', 50000, 'https://product.hstatic.net/200000343865/product/tu-duy-nhu-steve-jobs_bia-final-in_1_57acf3bc315e47b6b3c1d491992194ae_af090ea0599d471f81f0a426980a9e8b_master.jpg');
INSERT INTO `products` VALUES (412, 4, 'Tư duy như Stephen Hawking', 50000, 'https://product.hstatic.net/200000343865/product/tu-nhu-nhu-stephen-hawking_bia-view_e094b4420f0642d894798014e34009b2_master.jpg');
INSERT INTO `products` VALUES (413, 4, 'Tư duy như Sigmund Freud', 50000, 'https://product.hstatic.net/200000343865/product/freud_1_db94269188ed4e06836a93516c0f4aaf_master.jpg');
INSERT INTO `products` VALUES (414, 4, 'Tư duy như Sherlock Holmes', 50000, 'https://product.hstatic.net/200000343865/product/sherlockholmes_a71c7d8fa60c42bd89fb350b350e60a9_0ab41982a49743258af7b5a9e4f99855_master.jpg');
INSERT INTO `products` VALUES (415, 4, 'Tư duy như Mandela', 50000, 'Tư duy như Mandela');
INSERT INTO `products` VALUES (416, 4, 'Tư duy như Bill Gates', 50000, 'https://product.hstatic.net/200000343865/product/bill-gate_525873f89fd240dda7730c22b3096b40_master.jpg');
INSERT INTO `products` VALUES (417, 4, 'Tư duy như Churchill', 50000, 'https://product.hstatic.net/200000343865/product/tu-nhu-nhu_churchill-sigmundfreud-final-in-1_1_26b47b58429a48a2a5b848b22c3229d4_master.jpg');
INSERT INTO `products` VALUES (418, 4, 'Tư duy như Da Vinci', 50000, 'https://product.hstatic.net/200000343865/product/da-vinci_fb8c4e39677542a9addc19e499f5908b_master.jpg');
INSERT INTO `products` VALUES (419, 4, 'Từ điển văn hóa cổ truyền Việt Nam', 200000, 'https://product.hstatic.net/200000343865/product/tu-dien-van-hoa-co-truyen-viet-nam_fad997c63a574cb49a092911759d1942_edb1e38c58c448b194b85c2ac9e27049_master.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` bit(1) NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `uq_email`(`email` ASC) USING BTREE,
  UNIQUE INDEX `uq_phoneNumber`(`phoneNumber` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '21232F297A57A5A743894A0E4A801FC3', 'ADMIN', 'dunnmcpherson@recrisys.com', '0989894900', b'0', '8 Virginia Place, Troy, Norway', 'ADMIN');
INSERT INTO `user` VALUES (2, 'user2', '202CB962AC59075B964B07152D234B70', 'Foreman Carter', 'foremancarter@recrisys.com', '0993194154', b'0', '28 Richardson Street, Layhill, Netherlands', 'EMPLOYEE');
INSERT INTO `user` VALUES (3, 'user3', '202CB962AC59075B964B07152D234B70', 'Felecia Cabrera', 'feleciacabrera@recrisys.com', '0930174351', b'1', '41 Linden Street, Slovan, S. Georgia and S. Sandwich Isls.', 'EMPLOYEE');
INSERT INTO `user` VALUES (4, 'user4', '202CB962AC59075B964B07152D234B70', 'Juliette Mcdowell', 'juliettemcdowell@recrisys.com', '0911925643', b'1', '5 Schenck Court, Dana, Cyprus', 'CUSTOMER');
INSERT INTO `user` VALUES (5, 'user5', '202CB962AC59075B964B07152D234B70', 'Vilma Spencer', 'vilmaspencer@recrisys.com', '0987509391', b'1', '5 Pooles Lane, Allentown, Zambia', 'CUSTOMER');
INSERT INTO `user` VALUES (6, 'lpv', 'BA3CF11F01AD5F048A95D6626D0A5D3E', 'Lê Phi Vũ', 'nguyenphivu10b10@gmail.com', '0329769915', b'0', 'TP.HCM', 'CUSTOMER');

-- ----------------------------
-- Table structure for user_profiles
-- ----------------------------
DROP TABLE IF EXISTS `user_profiles`;
CREATE TABLE `user_profiles`  (
  `profile_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `birth_date` date NULL DEFAULT NULL,
  `gender` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`profile_id`) USING BTREE,
  INDEX `fk_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_profiles
-- ----------------------------
INSERT INTO `user_profiles` VALUES (1, 1, 'Admin', '2025-12-23', 'male', '0123456789');
INSERT INTO `user_profiles` VALUES (2, 2, 'Lê Đình Hùng', '2000-10-05', 'male', '0987654321');
INSERT INTO `user_profiles` VALUES (3, 3, 'Kông Tiến', '2004-10-27', 'male', '0997755331');
INSERT INTO `user_profiles` VALUES (4, 4, 'Trần Cơ Vũ', '2003-11-05', 'male', '0888842222');
INSERT INTO `user_profiles` VALUES (5, 5, 'Trần Phan Thùy Linh', '2004-06-11', 'female', '0113355779');
INSERT INTO `user_profiles` VALUES (6, 6, 'Phạm Thu Thủy', '2002-01-15', 'female', '0123456789');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role` enum('client','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin@gmail.com', '1234', 'admin');
INSERT INTO `users` VALUES (2, 'hung', 'hung36@gmail.com', '123', 'client');
INSERT INTO `users` VALUES (3, 'kien', 'tongkien930@gmail.com', '1334', 'client');
INSERT INTO `users` VALUES (4, 'vu', 'phivule2002@gmail.com', '1024', 'client');
INSERT INTO `users` VALUES (5, 'linh', 'linx0611@gmail.com', '6666', 'client');
INSERT INTO `users` VALUES (6, 'thuy', 'thuthuy67@gmail.com', '7859', 'client');

-- ----------------------------
-- Table structure for wishlist_item
-- ----------------------------
DROP TABLE IF EXISTS `wishlist_item`;
CREATE TABLE `wishlist_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint NOT NULL,
  `productId` bigint NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_userId_productId`(`userId` ASC, `productId` ASC) USING BTREE,
  INDEX `idx_wishlist_item_user`(`userId` ASC) USING BTREE,
  INDEX `idx_wishlist_item_product`(`productId` ASC) USING BTREE,
  CONSTRAINT `wishlist_item_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `wishlist_item_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wishlist_item
-- ----------------------------
INSERT INTO `wishlist_item` VALUES (1, 4, 1, '2021-07-21 02:09:42');
INSERT INTO `wishlist_item` VALUES (2, 4, 2, '2021-04-11 17:08:10');
INSERT INTO `wishlist_item` VALUES (3, 4, 3, '2021-08-24 21:06:10');
INSERT INTO `wishlist_item` VALUES (4, 5, 4, '2021-10-25 10:00:44');
INSERT INTO `wishlist_item` VALUES (5, 5, 5, '2021-06-10 18:29:11');
INSERT INTO `wishlist_item` VALUES (6, 5, 6, '2021-10-22 04:19:32');
INSERT INTO `wishlist_item` VALUES (7, 4, 7, '2021-09-22 19:37:18');
INSERT INTO `wishlist_item` VALUES (8, 4, 8, '2021-04-27 00:52:04');
INSERT INTO `wishlist_item` VALUES (9, 5, 9, '2021-12-10 18:11:25');
INSERT INTO `wishlist_item` VALUES (10, 4, 10, '2021-11-16 20:54:23');
INSERT INTO `wishlist_item` VALUES (11, 4, 11, '2021-06-10 03:54:36');
INSERT INTO `wishlist_item` VALUES (12, 5, 12, '2022-01-11 23:15:34');
INSERT INTO `wishlist_item` VALUES (13, 4, 13, '2021-06-03 16:02:59');
INSERT INTO `wishlist_item` VALUES (14, 5, 14, '2021-11-12 13:26:01');
INSERT INTO `wishlist_item` VALUES (15, 5, 15, '2021-05-25 04:12:50');
INSERT INTO `wishlist_item` VALUES (16, 5, 16, '2021-03-04 09:34:08');
INSERT INTO `wishlist_item` VALUES (17, 5, 17, '2021-07-27 16:00:13');
INSERT INTO `wishlist_item` VALUES (18, 4, 18, '2021-11-19 04:20:43');
INSERT INTO `wishlist_item` VALUES (19, 4, 19, '2021-07-30 21:17:17');
INSERT INTO `wishlist_item` VALUES (20, 5, 20, '2021-03-24 11:46:29');
INSERT INTO `wishlist_item` VALUES (21, 4, 21, '2021-03-27 08:05:54');
INSERT INTO `wishlist_item` VALUES (22, 4, 22, '2021-03-19 16:57:13');
INSERT INTO `wishlist_item` VALUES (23, 4, 23, '2021-12-09 02:19:39');
INSERT INTO `wishlist_item` VALUES (24, 5, 24, '2021-10-02 15:22:36');
INSERT INTO `wishlist_item` VALUES (25, 4, 25, '2021-12-20 03:25:18');
INSERT INTO `wishlist_item` VALUES (26, 5, 26, '2021-02-22 10:32:54');
INSERT INTO `wishlist_item` VALUES (27, 4, 27, '2021-10-24 14:34:35');
INSERT INTO `wishlist_item` VALUES (28, 4, 28, '2021-05-04 09:40:17');
INSERT INTO `wishlist_item` VALUES (29, 4, 29, '2021-03-04 20:11:19');
INSERT INTO `wishlist_item` VALUES (30, 5, 30, '2021-03-12 12:44:19');
INSERT INTO `wishlist_item` VALUES (31, 1, 70, '2025-12-23 14:54:53');
INSERT INTO `wishlist_item` VALUES (33, 6, 22, '2026-01-02 14:13:34');

SET FOREIGN_KEY_CHECKS = 1;
