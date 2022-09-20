-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 20, 2022 lúc 04:02 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dien_thoai_chinh_hang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$tceWfvnfANDTIPCI6VaTee/KNx/LNM0tYEZZvdvb3TFH/aO2XKR1e', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `branch`
--

CREATE TABLE `branch` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `level` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `avatar`, `parent_id`, `level`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Apple', 'apple', 'backend/upload/category/1663471894_apple.png', 0, 1, '2022-09-18 03:31:34', '2022-09-18 03:31:34', NULL),
(2, 'Samsung', 'samsung', 'backend/upload/category/1663471909_samsung42-b_25_1_1.jpg', 0, 1, '2022-09-18 03:31:49', '2022-09-18 03:31:49', NULL),
(3, 'xiaomi', 'xiaomi', 'backend/upload/category/1663471939_danh-muc-xiaomi.jpg', 0, 1, '2022-09-18 03:32:19', '2022-09-18 03:32:19', NULL),
(4, 'Oppo', 'oppo', 'backend/upload/category/1663471957_oppo42-b_9.png', 0, 1, '2022-09-18 03:32:37', '2022-09-18 03:32:37', NULL),
(5, 'vivo', 'vivo', 'backend/upload/category/1663471967_vivo42-b_50.jpg', 0, 1, '2022-09-18 03:32:47', '2022-09-18 03:32:47', NULL),
(6, 'nokia', 'nokia', 'backend/upload/category/1663471982_nokia42-b_21.jpg', 0, 1, '2022-09-18 03:33:02', '2022-09-18 03:33:02', NULL),
(7, 'Realme', 'realme', 'backend/upload/category/1663472018_t_i_xu_ng_76_.png', 0, 1, '2022-09-18 03:33:38', '2022-09-18 03:33:38', NULL),
(8, 'tcl', 'tcl', 'backend/upload/category/1663472027_dien-thoai-tcl-didongviet_1.png', 0, 1, '2022-09-18 03:33:47', '2022-09-18 03:33:47', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2021_04_20_000001_create_user_table', 1),
(12, '2021_04_20_000002_create_admin_table', 1),
(13, '2021_04_23_000001_create_category_table', 1),
(14, '2021_04_23_000003_create_product_table', 1),
(15, '2021_04_23_000004_create_order_table', 1),
(16, '2021_04_23_000005_create_order_detail_table', 1),
(17, '2021_05_17_000002_create_branch_table', 1),
(18, '2021_05_17_000002_create_cart_table', 1),
(20, '2022_09_20_000001_add_amount_to_product_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_money` decimal(16,2) NOT NULL,
  `status` int(11) DEFAULT 1 COMMENT '1 new, 2 success, 3: cancel by admin, 4: cancel by user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `user_id`, `name`, `address`, `phone`, `total_money`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'User', 'th', '1234567890', '11425990.00', 1, '2022-09-20 14:01:12', '2022-09-20 14:01:12', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price_origin` decimal(16,2) NOT NULL,
  `product_price_sell` decimal(16,2) NOT NULL,
  `product_sale` int(11) DEFAULT NULL,
  `product_avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int(11) NOT NULL DEFAULT 1,
  `product_sort_describe` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `product_name`, `product_price_origin`, `product_price_sell`, `product_sale`, `product_avatar`, `product_quantity`, `product_sort_describe`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'iPhone 11 64GB I Chính hãng VN/A', '14990000.00', '10642900.00', 29, 'backend/upload/product/1663472256_iphone_11_white_4_.png', 1, NULL, '2022-09-20 14:01:12', '2022-09-20 14:01:12', NULL),
(2, 1, 88, 'test', '791000.00', '783090.00', 1, 'backend/upload/product/1663681654_tcl-30-plus-didongviet.webp', 1, NULL, '2022-09-20 14:01:12', '2022-09-20 14:01:12', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_origin` decimal(16,2) DEFAULT NULL,
  `price_sell` decimal(16,2) DEFAULT NULL,
  `sale` int(11) DEFAULT 0,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hot` int(11) DEFAULT 2,
  `sort_describe` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `amount` int(11) DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `price_origin`, `price_sell`, `sale`, `avatar`, `hot`, `sort_describe`, `created_at`, `updated_at`, `deleted_at`, `amount`) VALUES
(1, 1, 'iPhone 11 64GB I Chính hãng VN/A', '14990000.00', '10642900.00', 29, 'backend/upload/product/1663472256_iphone_11_white_4_.png', 2, NULL, '2022-09-18 03:37:36', '2022-09-20 14:01:12', NULL, 9),
(2, 1, 'iPhone 14 Pro 128GB | Chính hãng VN/A', '30990000.00', '30990000.00', 0, 'backend/upload/product/1663472290_t_m_ar_1.png', 2, NULL, '2022-09-18 03:38:10', '2022-09-18 03:38:10', NULL, 10),
(3, NULL, 'iPhone 13 Pro Max 128GB | Chính hãng VN/A', '34990000.00', '26592400.00', 24, 'backend/upload/product/1663472365_iphone_13-_pro-5_4.jpg', 2, 'Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao\r\nKhông gian hiển thị sống động - Màn hình 6.7\" Super Retina XDR độ sáng cao, sắc nét\r\nTrải nghiệm điện ảnh đỉnh cao - Cụm 3 camera kép 12MP, hỗ trợ ổn định hình ảnh quang học', '2022-09-18 03:39:25', '2022-09-18 03:40:14', NULL, 10),
(4, 1, 'iPhone 14 Pro Max 128GB | Chính hãng VN/A', '33990000.00', '33990000.00', 0, 'backend/upload/product/1663472482_iphone_11_white_4_.png', 2, NULL, '2022-09-18 03:41:22', '2022-09-18 03:41:22', NULL, 10),
(5, 1, 'iPhone 13 128GB | Chính hãng VN/A', '24990000.00', '18992400.00', 24, 'backend/upload/product/1663472550_ip13-pro_2.jpg', 2, '- Máy mới 100% , chính hãng Apple Việt Nam.\r\nCellphoneS hiện là đại lý bán lẻ uỷ quyền iPhone chính hãng VN/A của Apple Việt Nam\r\n- iPhone 13 128GB, cáp USB-C sang Lightning', '2022-09-18 03:42:30', '2022-09-18 03:42:30', NULL, 10),
(6, 1, 'iPhone 13 Pro 128GB | Chính hãng VN/A', '31990000.00', '23352700.00', 27, 'backend/upload/product/1663472599_iphone_13-_pro-5.jpg', 2, NULL, '2022-09-18 03:43:19', '2022-09-18 03:43:19', NULL, 10),
(7, 1, 'iPhone 13 Pro Max 256GB I Chính hãng VN/A', '37990000.00', '29252300.00', 23, 'backend/upload/product/1663472620_iphone_13-_pro-5_4_1.jpg', 2, NULL, '2022-09-18 03:43:40', '2022-09-18 03:43:40', NULL, 10),
(8, 1, 'iPhone 12 64GB I Chính hãng VN/A', '19990000.00', '15792100.00', 21, 'backend/upload/product/1663472686_iphone_12_blue.png', 2, '- Mạnh mẽ, siêu nhanh với chip A14, RAM 4GB, mạng 5G tốc độ cao\r\n- Rực rỡ, sắc nét, độ sáng cao - Màn hình OLED cao cấp, Super Retina XDR hỗ trợ HDR10, Dolby Vision\r\n- Chụp đêm ấn tượng - Night Mode cho 2 camera, thuật toán Deep Fusion, Smart HDR 3\r\n- Bền bỉ vượt trội - Kháng nước, kháng bụi IP68, mặt lưng Ceramic Shield', '2022-09-18 03:44:46', '2022-09-18 03:44:46', NULL, 10),
(9, NULL, 'iPhone 12 Pro Max 128GB I Chính hãng VN/A', '28990000.00', '25511200.00', 12, 'backend/upload/product/1663472717_iphone_12_pro_max_white_1.png', 2, NULL, '2022-09-18 03:45:17', '2022-09-18 03:45:17', NULL, 10),
(10, 1, 'iPhone 12 128GB I Chính hãng VN/A', '28990000.00', '24931400.00', 14, 'backend/upload/product/1663472752_iphone-12_7__6_3.jpg', 2, NULL, '2022-09-18 03:45:52', '2022-09-18 03:45:52', NULL, 10),
(11, 1, 'iPhone 12 Pro Max 256GB I Chính hãng VN/A', '31990000.00', '27511400.00', 14, 'backend/upload/product/1663472769_iphone-12-pro-max_3__5.jpg', 2, NULL, '2022-09-18 03:46:09', '2022-09-18 03:46:09', NULL, 10),
(12, 1, 'iPhone 12 Pro Max 256GB I Chính hãng VN/A', '13000000.00', '11700000.00', 10, 'backend/upload/product/1663472932_iphone-11-128gb-chinh-hang_2.webp', 2, NULL, '2022-09-18 03:48:52', '2022-09-18 03:48:52', NULL, 10),
(13, 1, 'iPhone SE 2022 | Chính hãng VN/A', '12990000.00', '10002300.00', 23, 'backend/upload/product/1663473024_iphone-se-2020_1__5.jpg', 2, NULL, '2022-09-18 03:50:24', '2022-09-18 03:50:24', NULL, 10),
(14, 1, 'iPhone SE 2022 128GB | Chính hãng VN/A', '13990000.00', '12031400.00', 14, 'backend/upload/product/1663473040_iphone-se-midnight-select-2022031_1.jpg', 2, NULL, '2022-09-18 03:50:40', '2022-09-18 03:50:40', NULL, 10),
(15, NULL, 'iPhone SE 2020 I Chính hãng VN/A', '10990000.00', '9011800.00', 18, 'backend/upload/product/1663473056_iphone-se-red-select-20220322.jpg', 2, NULL, '2022-09-18 03:50:56', '2022-09-18 03:50:56', NULL, 10),
(16, NULL, 'iPhone SE 2020 128GB I Chính hãng VN/A', '11990000.00', '9951700.00', 17, 'backend/upload/product/1663473071_iphone-se-2020_1__6.jpg', 2, NULL, '2022-09-18 03:51:11', '2022-09-18 03:51:11', NULL, 10),
(17, 2, 'Samsung Galaxy Z Fold4 512GB', '44490000.00', '44490000.00', 0, 'backend/upload/product/1663473213_1.jpg', 2, NULL, '2022-09-18 03:53:33', '2022-09-18 03:53:33', NULL, 10),
(18, 2, 'Samsung Galaxy Z Fold4', '40990000.00', '40990000.00', 0, 'backend/upload/product/1663473230_2.jpg', 2, NULL, '2022-09-18 03:53:50', '2022-09-18 03:53:50', NULL, 10),
(19, 2, 'Samsung Galaxy Z Fold3 5G 512GB', '44990000.00', '30593200.00', 32, 'backend/upload/product/1663473267_3.jpg', 2, '- 7.6 inches\r\n- 12 GB\r\n- 5412 GB', '2022-09-18 03:54:27', '2022-09-18 03:54:27', NULL, 10),
(20, 2, 'Samsung Galaxy S22 Ultra (12GB - 512GB)', '39990000.00', '31992000.00', 20, 'backend/upload/product/1663473309_sm-s908_galaxys22ultra_front_burgundy_211119_3.jpg', 2, '- 6.8 inches\r\n- 12 GB\r\n- 512 GB', '2022-09-18 03:55:09', '2022-09-18 03:55:09', NULL, 10),
(21, 1, 'Samsung Galaxy S10', '20990000.00', '19310800.00', 8, 'backend/upload/product/1663473348_636863643187455627_ss-galaxy-s10-trang-1.jpg', 2, NULL, '2022-09-18 03:55:48', '2022-09-18 03:55:48', NULL, 10),
(22, 2, 'Samsung Galaxy S22 Plus (8GB + 128GB)', '23490000.00', '15973200.00', 32, 'backend/upload/product/1663473393_s22_4_1.jpg', 2, '- 6.1 inches\r\n- 8 GB\r\n- 256 GB', '2022-09-18 03:56:33', '2022-09-18 03:56:33', NULL, 10),
(23, 2, 'Samsung Galaxy A73 128GB', '11990000.00', '10071600.00', 16, 'backend/upload/product/1663473429_samsung-galaxy-a73-1-600x600.jpg', 2, '- 6.7 inches\r\n- 8 GB\r\n- 128 GB', '2022-09-18 03:57:09', '2022-09-18 03:57:09', NULL, 10),
(24, 2, 'Sams', '26990000.00', '15924100.00', 41, 'backend/upload/product/1663473471_sm-f926_zfold3_5g_openback_phantomsilver_210611.jpg', 2, '- 6.7 inches\r\n- 8 GB\r\n- 256 GB', '2022-09-18 03:57:51', '2022-09-18 03:57:51', NULL, 10),
(25, 2, 'Samsung Galaxy A04s', '3990000.00', '3830400.00', 4, 'backend/upload/product/1663473535_samsung-galaxy-a73-1-600x600.jpg', 2, NULL, '2022-09-18 03:58:55', '2022-09-18 03:58:55', NULL, 10),
(26, 3, 'Xiaomi Redmi Note 11 Pro 5G (8GB|128GB) Chính Hãng', '8990000.00', '8091000.00', 10, 'backend/upload/product/1663475973_xiaomi-redmi-note-11-pro-5g-128gb-didongviet_2.webp', 2, NULL, '2022-09-18 04:39:33', '2022-09-18 04:39:33', NULL, 10),
(27, 3, 'Xiaomi Redmi 10A Chính Hãng', '2990000.00', '2810600.00', 6, 'backend/upload/product/1663475993_xiaomi-redmi-10a-didongviet.webp', 2, NULL, '2022-09-18 04:39:53', '2022-09-18 04:39:53', NULL, 10),
(28, 3, 'alt=\"Xiaomi Redmi 10 2022 (4GB|128GB) Chính Hãng\"', '3890000.00', '3306500.00', 15, 'backend/upload/product/1663476013_xiaomi-redmi-10-2022-didongviet.webp', 2, NULL, '2022-09-18 04:40:13', '2022-09-18 04:40:13', NULL, 10),
(29, 3, 'Xiaomi Redmi 10C (4GB|128GB) Chính Hãng', '3890000.00', '3695500.00', 5, 'backend/upload/product/1663476094_xiaomi-redmi-10c-didongviet.webp', 2, NULL, '2022-09-18 04:41:34', '2022-09-18 04:41:43', NULL, 10),
(30, 3, 'Xiaomi Redmi 10 5G Chính Hãng', '791000.00', '711900.00', 10, 'backend/upload/product/1663476139_xiaomi-redmi-10-5g-didongviet.webp', 2, NULL, '2022-09-18 04:42:19', '2022-09-18 04:42:19', NULL, 10),
(31, 3, 'Xiaomi Redmi Note 11S 5G Chính Hãng', '791000.00', '711900.00', 10, 'backend/upload/product/1663476180_xiaomi-redmi-note-11s-5g-didongviet.webp', 2, NULL, '2022-09-18 04:43:00', '2022-09-18 04:43:00', NULL, 10),
(32, 3, 'Xiaomi Redmi Note 11 (4GB|64GB) Chính Hãng', '4690000.00', '4221000.00', 10, 'backend/upload/product/1663476227_xiaomi-redmi-note-11-128gb-didongviet_1.webp', 2, NULL, '2022-09-18 04:43:47', '2022-09-18 04:43:47', NULL, 10),
(33, 3, 'Xiaomi Redmi Note 11 (4GB|128GB) Chính Hãng', '4990000.00', '4740500.00', 5, 'backend/upload/product/1663476243_xiaomi-redmi-note-11-128gb-didongviet_1_1.webp', 2, NULL, '2022-09-18 04:44:03', '2022-09-18 04:44:03', NULL, 10),
(34, 3, 'Xiaomi Redmi Note 11s (8GB|128GB) Chính Hãng', '6690000.00', '6021000.00', 10, 'backend/upload/product/1663476261_xiaomi-redmi-note-11s-128gb-didongviet.webp', 2, NULL, '2022-09-18 04:44:21', '2022-09-18 04:44:21', NULL, 10),
(35, 3, 'Xiaomi Redmi Note 11 Pro (8GB|128GB) Chính Hãng', '6390000.00', '6390000.00', 0, 'backend/upload/product/1663476282_xiaomi-11-128gb-didongviet.webp', 2, NULL, '2022-09-18 04:44:42', '2022-09-18 04:44:42', NULL, 10),
(36, 4, 'OPPO Find X3 Pro 5G', '26990000.00', '18893000.00', 30, 'backend/upload/product/1663476381_oppo-find-x3-pro-5g-3_2.jpg', 2, NULL, '2022-09-18 04:46:21', '2022-09-18 04:46:21', NULL, 10),
(37, 4, 'OPPO Reno8 5G 8GB 256GB', '13990000.00', '13990000.00', 0, 'backend/upload/product/1663476397_combo_product_-_reno8_5g_-_black.png', 2, NULL, '2022-09-18 04:46:37', '2022-09-18 04:46:37', NULL, 10),
(38, 4, 'OPPO Reno7 (5G)', '10990000.00', '9341500.00', 15, 'backend/upload/product/1663476420_combo_product_-_blue_-_reno7_5g.png', 2, NULL, '2022-09-18 04:47:00', '2022-09-18 04:47:00', NULL, 10),
(39, 4, 'OPPO Reno8 Z', '10490000.00', '10490000.00', 0, 'backend/upload/product/1663476436_photo_2022-08-05_09-40-15.jpg', 2, NULL, '2022-09-18 04:47:16', '2022-09-18 04:47:16', NULL, 10),
(40, 4, 'OPPO Reno6 5G', '12990000.00', '10002300.00', 23, 'backend/upload/product/1663476481_reno6-1_1.jpg', 2, NULL, '2022-09-18 04:48:01', '2022-09-18 04:48:01', NULL, 10),
(41, 4, 'OPPO Reno7 Z (5G)', '9990000.00', '9190800.00', 8, 'backend/upload/product/1663476497_combo_product_-_rainbow_spectrum_-_reno7_z.png', 2, NULL, '2022-09-18 04:48:17', '2022-09-18 04:48:17', NULL, 10),
(42, 4, 'OPPO Reno5 5G', '11990000.00', '8992500.00', 25, 'backend/upload/product/1663476515_oppo-reno-5-5g_2_.jpg', 2, NULL, '2022-09-18 04:48:35', '2022-09-18 04:48:35', NULL, 10),
(43, 4, 'OPPO Reno8', '8990000.00', '8990000.00', 0, 'backend/upload/product/1663476530_combo_product_-_reno8_4g_-_gold.png', 2, NULL, '2022-09-18 04:48:50', '2022-09-18 04:48:50', NULL, 10),
(44, 4, 'OPPO Reno7 4G (8GB - 128GB)', '8990000.00', '7461700.00', 17, 'backend/upload/product/1663476585_combo_product_-_black_-_reno7_4g.png', 2, NULL, '2022-09-18 04:49:45', '2022-09-18 04:49:45', NULL, 10),
(45, 4, 'OPPO Reno6 Z 5G', '9490000.00', '6548100.00', 31, 'backend/upload/product/1663476601_oppo_reno6.jpg', 2, NULL, '2022-09-18 04:50:01', '2022-09-18 04:50:01', NULL, 10),
(46, 4, 'OPPO A96', '6990000.00', '6500700.00', 7, 'backend/upload/product/1663476617_combo_a95_-_en_-_cmyk.jpg', 2, NULL, '2022-09-18 04:50:17', '2022-09-18 04:50:17', NULL, 10),
(47, 4, 'OPPO A95', '6990000.00', '5801700.00', 17, 'backend/upload/product/1663476634_combo_a95_-_en_-_cmyk.jpg', 2, NULL, '2022-09-18 04:50:34', '2022-09-18 04:50:34', NULL, 10),
(48, 4, 'OPPO A55', '4990000.00', '3992000.00', 20, 'backend/upload/product/1663476669_combo_a55_-_xanh_-_cmyk.jpg', 2, NULL, '2022-09-18 04:51:09', '2022-09-18 04:51:09', NULL, 10),
(49, 4, 'Oppo A16', '3990000.00', '3591000.00', 10, 'backend/upload/product/1663476685_combo_-_a16_-_b_c.jpg', 2, NULL, '2022-09-18 04:51:25', '2022-09-18 04:51:25', NULL, 10),
(50, 4, 'OPPO A16K', '3690000.00', '2988900.00', 19, 'backend/upload/product/1663476712_combo_a16k_-_black.jpg', 2, NULL, '2022-09-18 04:51:52', '2022-09-18 04:51:52', NULL, 10),
(51, 5, 'Vivo Y22S 8GB 128GB', '5990000.00', '5630600.00', 6, 'backend/upload/product/1663476790_542434226.jpeg', 2, NULL, '2022-09-18 04:53:10', '2022-09-18 04:53:10', NULL, 10),
(52, 5, 'Vivo T1 5G', '7990000.00', '7430700.00', 7, 'backend/upload/product/1663476804_t_i_xu_ng_59_.png', 2, NULL, '2022-09-18 04:53:24', '2022-09-18 04:53:24', NULL, 10),
(53, 5, 'Vivo T1X', '4490000.00', '4220600.00', 6, 'backend/upload/product/1663476824_t1x_01.png', 2, NULL, '2022-09-18 04:53:44', '2022-09-18 04:53:44', NULL, 10),
(54, 5, 'Vivo Y15s', '3490000.00', '2966500.00', 15, 'backend/upload/product/1663476840_vivo-y15s-2021-261021-114837-600x600.jpg', 2, NULL, '2022-09-18 04:54:00', '2022-09-18 04:54:00', NULL, 10),
(55, 5, 'Vivo Y16', '4490000.00', '4265500.00', 5, 'backend/upload/product/1663476906_vivo-y16-den.jpg', 2, NULL, '2022-09-18 04:55:06', '2022-09-18 04:55:06', NULL, 10),
(56, 5, 'Vivo Y02s 3G 32GB', '3490000.00', '3315500.00', 5, 'backend/upload/product/1663476922_vivo-y02s-thumb-1-2-600x600.jpg', 2, NULL, '2022-09-18 04:55:22', '2022-09-18 04:55:22', NULL, 10),
(57, 5, 'Vivo X80', '19990000.00', '17191400.00', 14, 'backend/upload/product/1663476937_53_2_11.jpg', 2, NULL, '2022-09-18 04:55:37', '2022-09-18 04:55:37', NULL, 10),
(58, 5, 'Vivo X80 Pro', '29990000.00', '24891700.00', 17, 'backend/upload/product/1663476953_gallery-pc-img1_2.jpg', 2, NULL, '2022-09-18 04:55:53', '2022-09-18 04:55:53', NULL, 10),
(59, 5, 'Vivo Y21', '3990000.00', '3511200.00', 12, 'backend/upload/product/1663476969_vivo-y21-white-01-1-600x600.jpg', 2, NULL, '2022-09-18 04:56:09', '2022-09-18 04:56:09', NULL, 10),
(60, 5, 'Vivo Y22', '5000000.00', '4900000.00', 2, 'backend/upload/product/1663476986_vivo-y16-den.jpg', 2, NULL, '2022-09-18 04:56:26', '2022-09-18 04:56:26', NULL, 10),
(61, 5, 'Vivo V23 5G', '12990000.00', '10521900.00', 19, 'backend/upload/product/1663477008_vivo_v23_03.jpg', 2, NULL, '2022-09-18 04:56:48', '2022-09-18 04:56:48', NULL, 10),
(62, 5, 'Vivo X60 Pro 5G', '19990000.00', '13193400.00', 34, 'backend/upload/product/1663477025_vivo-x60-pro-8.jpg', 2, NULL, '2022-09-18 04:57:05', '2022-09-18 04:57:05', NULL, 10),
(63, 6, 'Nokia X10 5G', '5490000.00', '4611600.00', 16, 'backend/upload/product/1663510534_nokia-x10.jpg', 2, NULL, '2022-09-18 14:15:34', '2022-09-18 14:15:34', NULL, 10),
(64, 6, 'Nokia G11 Plus 3GB 64GB', '3590000.00', '2979700.00', 17, 'backend/upload/product/1663510555_nokia-g11-plus-blue.jpg', 2, NULL, '2022-09-18 14:15:55', '2022-09-18 14:15:55', NULL, 10),
(65, 6, 'Nokia 8210 4G', '1490000.00', '1490000.00', 0, 'backend/upload/product/1663510573_nokia-8210_4g-sand-front_back-int.png', 2, NULL, '2022-09-18 14:16:13', '2022-09-18 14:16:13', NULL, 10),
(66, 6, 'Nokia G50 (5G)', '6490000.00', '6490000.00', 0, 'backend/upload/product/1663510592_nokia-g50-4_1.jpeg', 2, NULL, '2022-09-18 14:16:32', '2022-09-18 14:16:32', NULL, 10),
(67, 6, 'Nokia 105 2 SIM (2019)', '500000.00', '500000.00', 0, 'backend/upload/product/1663510607_ae08c25c6e913812f2fd60aca318bd8a_1.jpg', 2, NULL, '2022-09-18 14:16:47', '2022-09-18 14:16:47', NULL, 10),
(68, 6, 'Nokia G21', '4290000.00', '3603600.00', 16, 'backend/upload/product/1663510626_thumb_602966_default_big.jpg', 2, NULL, '2022-09-18 14:17:06', '2022-09-18 14:17:06', NULL, 10),
(69, 6, 'Nokia 2660 Flip', '1590000.00', '1590000.00', 0, 'backend/upload/product/1663510641_fwfu.png', 2, NULL, '2022-09-18 14:17:21', '2022-09-18 14:17:21', NULL, 10),
(70, 6, 'Nokia C21 Plus 3GB 32GB', '2990000.00', '2691000.00', 10, 'backend/upload/product/1663510688_nokia-c21-plus-600x600_2.jpg', 2, NULL, '2022-09-18 14:18:08', '2022-09-18 14:18:08', NULL, 10),
(71, 6, 'Nokia C20', '2490000.00', '2091600.00', 16, 'backend/upload/product/1663510706_nokia-c20-2.jpg', 2, NULL, '2022-09-18 14:18:26', '2022-09-18 14:18:26', NULL, 10),
(72, 6, 'Nokia C30', '3450000.00', '2380500.00', 31, 'backend/upload/product/1663510725_637649100605269420_nokia-c30-xanh-1.jpg', 2, NULL, '2022-09-18 14:18:45', '2022-09-18 14:18:45', NULL, 10),
(73, 6, 'Nokia C21 Plus 3GB 64GB', '3190000.00', '2902900.00', 9, 'backend/upload/product/1663510744_nokia-c21-plus-600x600_2_1.jpg', 2, NULL, '2022-09-18 14:19:04', '2022-09-18 14:19:04', NULL, 10),
(74, 6, 'Nokia C20 2GB 16GB', '2290000.00', '1900700.00', 17, 'backend/upload/product/1663510768_nokia-c20-2.jpg', 2, NULL, '2022-09-18 14:19:28', '2022-09-18 14:19:28', NULL, 10),
(75, 6, 'Nokia C21 Plus 2GB 64GB', '2890000.00', '2398700.00', 17, 'backend/upload/product/1663510786_nokia-c21-plus-600x600_2_1.jpg', 2, NULL, '2022-09-18 14:19:46', '2022-09-18 14:19:46', NULL, 10),
(76, 6, 'Nokia G11 Plus 3GB 32GB', '3390000.00', '2813700.00', 17, 'backend/upload/product/1663510802_nokia-g11-plus-blue.jpg', 2, NULL, '2022-09-18 14:20:02', '2022-09-18 14:20:02', NULL, 10),
(77, 7, 'Realme C35 4GB 64GB', '4290000.00', '3989700.00', 7, 'backend/upload/product/1663510886_frame3935-640x640.png', 2, NULL, '2022-09-18 14:21:26', '2022-09-18 14:21:26', NULL, 10),
(78, 7, 'Realme C11 (2021)', '2990000.00', '2392000.00', 20, 'backend/upload/product/1663510906_download_15_5.jpg', 2, NULL, '2022-09-18 14:21:46', '2022-09-18 14:21:46', NULL, 10),
(79, 7, 'Realme 8', '7290000.00', '6415200.00', 12, 'backend/upload/product/1663510922_realme-8-1_2.png', 2, NULL, '2022-09-18 14:22:02', '2022-09-18 14:22:02', NULL, 10),
(80, 7, 'Realme 9 Pro', '7990000.00', '7191000.00', 10, 'backend/upload/product/1663510939_t_i_xu_ng_2__3_6.png', 2, NULL, '2022-09-18 14:22:19', '2022-09-18 14:22:19', NULL, 10),
(81, 7, 'Realme 9i 6GB 128GB', '6490000.00', '5321800.00', 18, 'backend/upload/product/1663510955_real_me_pro_002.jpg', 2, NULL, '2022-09-18 14:22:35', '2022-09-18 14:22:35', NULL, 10),
(82, 7, 'Realme 9 Pro Plus', '9990000.00', '8991000.00', 10, 'backend/upload/product/1663510972_9_ro_plus.png', 2, NULL, '2022-09-18 14:22:52', '2022-09-18 14:22:52', NULL, 10),
(83, 7, 'Realme C11 2021 4GB 64GB', '3790000.00', '2690900.00', 29, 'backend/upload/product/1663510998_realme-c11-2021-gray-600x600_2.jpg', 2, NULL, '2022-09-18 14:23:18', '2022-09-18 14:23:18', NULL, 10),
(84, 7, 'Nubia Z40S Pro', '10000000.00', '10000000.00', 0, 'backend/upload/product/1663511017__oor.png', 2, NULL, '2022-09-18 14:23:37', '2022-09-18 14:23:37', NULL, 10),
(85, 8, 'TCL 305 Chính Hãng', '3000000.00', '3000000.00', 0, 'backend/upload/product/1663511152_tcl-305-didongviet.webp', 2, NULL, '2022-09-18 14:25:52', '2022-09-18 14:25:52', NULL, 10),
(86, 8, 'TCL 30 SE Chính Hãng', '4000000.00', '3600000.00', 10, 'backend/upload/product/1663511171_tcl-30-se-didongviet.webp', 2, NULL, '2022-09-18 14:26:11', '2022-09-18 14:26:11', NULL, 10),
(87, 8, 'TCL 30 plus Chính Hãng', '5200000.00', '4420000.00', 15, 'backend/upload/product/1663511189_tcl-30-plus-didongviet.webp', 2, NULL, '2022-09-18 14:26:29', '2022-09-18 14:26:29', NULL, 10),
(88, 1, 'test', '791000.00', '783090.00', 1, 'backend/upload/product/1663681654_tcl-30-plus-didongviet.webp', 2, '22', '2022-09-20 13:47:34', '2022-09-20 14:01:12', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `address`, `phone`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'User', 'user@gmail.com', '$2y$10$cZmOF2.RKG0S1fU3DlkR9OHC/D3Yg15kCt3rK5jxcQVaHrJzR4mHm', NULL, '1234567890', NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_email_unique` (`email`);

--
-- Chỉ mục cho bảng `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `branch`
--
ALTER TABLE `branch`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
