-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： localhost
-- 產生時間： 2022 年 08 月 31 日 06:23
-- 伺服器版本： 8.0.30
-- PHP 版本： 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `order_data`
--
CREATE DATABASE IF NOT EXISTS `order_data` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `order_data`;

-- --------------------------------------------------------

--
-- 資料表結構 `login`
--

CREATE TABLE `login` (
  `id` int NOT NULL,
  `login_id` varchar(18) COLLATE utf8mb4_general_ci NOT NULL,
  `login_pw` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `login`
--

INSERT INTO `login` (`id`, `login_id`, `login_pw`) VALUES
(1, '127.0.0.1', '12345678');

-- --------------------------------------------------------

--
-- 資料表結構 `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL,
  `order_item_value` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order_item_size` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order_item_adjust` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order_item_count` int NOT NULL,
  `order_item_price` int NOT NULL,
  `order_list_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_item_value`, `order_item_size`, `order_item_adjust`, `order_item_count`, `order_item_price`, `order_list_id`) VALUES
(1, '蟬吃烏龍綠', 'L', '半糖少冰', 6, 30, 1),
(2, '台灣明月紅', 'L', '正常正常', 1, 30, 1),
(3, '高山冷泓青', 'L', '正常正常', 1, 35, 1),
(4, '蟬吃金玉紅', 'L', '正常正常', 1, 35, 1),
(5, '台灣明月紅', 'L', '無糖常溫', 6, 30, 2),
(6, '蟬吃金玉紅', 'L', '正常正常', 1, 35, 2),
(7, '蟬吃金玉紅', 'L', '正常正常', 1, 35, 2),
(8, '蟬吃烏龍綠', 'L', '正常正常', 13, 30, 3),
(9, '蟬吃金玉紅', 'L', '正常正常', 7, 35, 3),
(10, '蟬吃烏龍綠', 'L', '正常正常', 1, 30, 5),
(11, '高山冷泓青', 'L', '正常正常', 1, 35, 5),
(12, '蟬吃金玉紅', 'L', '正常正常', 1, 35, 5),
(13, '蟬吃烏龍綠', 'L', '正常正常', 1, 30, 6),
(14, '高山冷泓青', 'L', '正常正常', 1, 35, 6);

-- --------------------------------------------------------

--
-- 資料表結構 `order_list`
--

CREATE TABLE `order_list` (
  `order_list_id` int NOT NULL,
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_type` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `order_list_price` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `order_list`
--

INSERT INTO `order_list` (`order_list_id`, `order_time`, `order_type`, `order_list_price`) VALUES
(1, '2022-08-30 08:56:20', '現場', 280),
(2, '2022-08-30 08:56:35', '現場', 250),
(3, '2022-08-30 10:36:55', '現場', 635),
(4, '2022-08-30 10:42:50', '現場', 0),
(5, '2022-08-31 03:29:35', '現場', 100),
(6, '2022-08-31 03:29:42', '現場', 65);

-- --------------------------------------------------------

--
-- 資料表結構 `tea_adjust`
--

CREATE TABLE `tea_adjust` (
  `adjust_id` int NOT NULL,
  `adjust_value` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `tea_adjust`
--

INSERT INTO `tea_adjust` (`adjust_id`, `adjust_value`) VALUES
(1, '少糖'),
(2, '半糖'),
(3, '微糖'),
(4, '無糖'),
(5, '多糖'),
(6, '2分糖'),
(7, '多冰'),
(8, '少冰'),
(9, '去冰'),
(10, '常溫'),
(11, '溫'),
(12, '熱'),
(13, '珍珠'),
(14, '小芋圓'),
(15, '混珠'),
(16, '仙草'),
(17, '蜂蜜'),
(18, '小紫蘇'),
(19, '中杯'),
(20, '自帶杯'),
(21, '料多'),
(22, '料少'),
(23, '無茶'),
(24, '全茶');

-- --------------------------------------------------------

--
-- 資料表結構 `tea_name`
--

CREATE TABLE `tea_name` (
  `name_id` int NOT NULL,
  `name_value` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `tea_name`
--

INSERT INTO `tea_name` (`name_id`, `name_value`, `type_id`) VALUES
(1, '蟬吃烏龍綠', 1),
(2, '台灣明月紅', 1),
(3, '烏龍明月茶', 1),
(4, '高山冷泓青', 1),
(5, '蟬吃金玉紅', 1),
(6, '蟬吃金針綠茶', 1),
(7, '桂圓紅棗茶', 1),
(8, '寶山黑玉紅茶', 1),
(9, '蟬吃鮮翠烏龍', 2),
(10, '蟬吃手採蜜香紅', 2),
(11, '蟬吃炭培烏龍', 2),
(12, '蟬吃手採佳葉龍', 2),
(13, '蟬吃手採紅玉紅', 2),
(14, '蟬吃玉山烏龍茶', 2),
(15, '蟬吃蓮花綠茶', 2),
(16, '生機檸檬[紅]', 3),
(17, '生機檸檬[紅]', 3),
(18, '[鮮]檸冷泓青', 3),
(19, '[香]檸冷泓青', 3),
(20, '[苦]檸冷泓青', 3),
(21, '苦檸檬汁', 3),
(22, '生機檸檬醋溜', 3),
(23, '檸檬汁', 3),
(24, '金桔檸檬', 3),
(25, '牛乳紅茶', 4),
(26, '牛乳綠茶', 4),
(27, '蟬吃金玉牛乳', 4),
(28, '寶山黑糖牛乳', 4),
(29, '黑糖薑牛乳', 4),
(30, '牛乳冷泓青', 4),
(31, '紅茶拿鐵', 5),
(32, '烏龍拿鐵', 5),
(33, '蟬吃金玉拿鐵', 5),
(34, '寶山黑糖拿鐵', 5),
(35, '黑糖[薑]拿鐵', 5),
(36, '拿鐵冷泓青', 5),
(37, '珍珠金玉拿鐵', 5),
(38, '養顏蜂蜜水', 6),
(39, '蟬吃蜂蜜[紅]', 6),
(40, '蟬吃蜂蜜[綠]', 6),
(41, '蜂蜜檸檬汁', 6),
(42, '蜂蜜冷泓[青]', 6),
(43, '蜂蜜[檸檬紅]', 6),
(44, '蜂蜜[檸檬綠]', 6),
(45, '蜂蜜[檸檬青]', 6),
(56, '珍珠奶茶', 7),
(57, '珍珠奶綠', 7),
(58, '小芋圓珍奶', 7),
(59, '冷泓青纖子', 7),
(60, '小毛綠豆冰沙', 7),
(61, '小芋圓珍奶綠', 7),
(62, '蟬吃黑糖薑紅', 8),
(63, '蟬吃烏龍薑茶', 8),
(64, '蟬吃黑龍薑茶', 8),
(65, '蟬吃薑薑好', 8),
(66, '黑糖薑茶(無茶)', 8),
(67, '黑糖桂圓紅', 8),
(68, '黑糖桂圓[薑]紅', 8),
(69, '金桔檸檬加鹽', 8),
(70, '養生薑黃[紅]', 9),
(71, '養生薑黃[綠]', 9),
(72, '寶山黑玉紅茶', 9),
(73, '蜜香樟芝紅茶', 9),
(74, '檸檬汁', 11),
(75, '金桔檸檬加鹽巴', 11),
(76, '台灣百香[青]', 11),
(77, '台灣百香[綠]', 11),
(78, '台灣百香[紅]', 11),
(79, '黑糖桂圓紅', 11),
(80, '黑糖桂圓[薑]紅', 11),
(81, '火龍檸檬青', 11),
(82, '黑糖薑紅2杯', 12),
(83, '烏龍薑茶2杯', 12),
(84, '黑龍薑茶2杯', 12),
(85, '薑薑好2杯', 12),
(86, '黑糖薑茶2杯(無茶)', 12),
(87, '蟬吃鮮翠烏龍4兩', 10),
(88, '蟬吃鮮翠烏龍特價', 10),
(89, '蟬吃鮮翠烏龍半兩', 10),
(90, '蟬吃炭培烏龍4兩', 10),
(91, '蟬吃炭培烏龍特價', 10),
(92, '蟬吃炭培烏龍半兩', 10),
(93, '蟬吃佳葉龍茶4兩', 10),
(94, '蟬吃佳葉龍茶特價', 10),
(95, '蟬吃佳葉龍茶半兩', 10);

-- --------------------------------------------------------

--
-- 資料表結構 `tea_size`
--

CREATE TABLE `tea_size` (
  `size_id` int NOT NULL,
  `size_value` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `name_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `tea_size`
--

INSERT INTO `tea_size` (`size_id`, `size_value`, `price`, `name_id`) VALUES
(1, 'L', 30, 1),
(2, 'L', 30, 2),
(3, 'L', 30, 3),
(4, 'L', 35, 4),
(5, 'L', 35, 5);

-- --------------------------------------------------------

--
-- 資料表結構 `tea_type`
--

CREATE TABLE `tea_type` (
  `type_id` int NOT NULL,
  `type_value` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `tea_type`
--

INSERT INTO `tea_type` (`type_id`, `type_value`) VALUES
(1, '高山茶'),
(2, '蟬吃茶'),
(3, '檸檬飲'),
(4, '乳特調'),
(5, '拿鐵飲'),
(6, '蜜茶園'),
(7, '口感Ｑ'),
(8, '暖呼呼'),
(9, '養生飲'),
(10, '茶葉'),
(11, '季節限定'),
(12, '冬暖系列');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_list_id` (`order_list_id`);

--
-- 資料表索引 `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`order_list_id`);

--
-- 資料表索引 `tea_adjust`
--
ALTER TABLE `tea_adjust`
  ADD PRIMARY KEY (`adjust_id`);

--
-- 資料表索引 `tea_name`
--
ALTER TABLE `tea_name`
  ADD PRIMARY KEY (`name_id`),
  ADD KEY `type_id` (`type_id`);

--
-- 資料表索引 `tea_size`
--
ALTER TABLE `tea_size`
  ADD PRIMARY KEY (`size_id`),
  ADD KEY `name` (`name_id`);

--
-- 資料表索引 `tea_type`
--
ALTER TABLE `tea_type`
  ADD PRIMARY KEY (`type_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `login`
--
ALTER TABLE `login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_list`
--
ALTER TABLE `order_list`
  MODIFY `order_list_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tea_adjust`
--
ALTER TABLE `tea_adjust`
  MODIFY `adjust_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tea_name`
--
ALTER TABLE `tea_name`
  MODIFY `name_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tea_size`
--
ALTER TABLE `tea_size`
  MODIFY `size_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tea_type`
--
ALTER TABLE `tea_type`
  MODIFY `type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `tea_name`
--
ALTER TABLE `tea_name`
  ADD CONSTRAINT `type_id` FOREIGN KEY (`type_id`) REFERENCES `tea_type` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- 資料表的限制式 `tea_size`
--
ALTER TABLE `tea_size`
  ADD CONSTRAINT `name` FOREIGN KEY (`name_id`) REFERENCES `tea_name` (`name_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
