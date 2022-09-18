-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 13, 2022 lúc 11:57 AM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mu_bao_hiem`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$TYajFz38DUkx1qCU.ebTWukU9M8uAPf5tjHz5x.mBoDvT.Y2JvF5O', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `branch`
--

CREATE TABLE `branch` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `branch`
--

INSERT INTO `branch` (`id`, `name`, `slug`, `avatar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Asia', 'asia', 'backend/upload/branch/1660381624_asia.png', '2022-08-13 09:03:59', '2022-08-13 09:07:04', NULL),
(2, 'Andes', 'andes', 'backend/upload/branch/1660381642_logo-andes-nho.png', '2022-08-13 09:07:22', '2022-08-13 09:07:22', NULL),
(3, 'Protec', 'protec', 'backend/upload/branch/1660381669_logo-protec-nho.png', '2022-08-13 09:07:49', '2022-08-13 09:07:49', NULL),
(4, 'Royal', 'royal', 'backend/upload/branch/1660381681_logo-royal-helmet-nho.png', '2022-08-13 09:08:01', '2022-08-13 09:08:01', NULL),
(5, 'Khác', 'khac', 'backend/upload/branch/1660381696_logo-khac-35.png', '2022-08-13 09:08:16', '2022-08-13 09:08:16', NULL),
(6, 'Scoot', 'scoot', 'backend/upload/branch/1660381847_scoot-and-ride-logo-be.png', '2022-08-13 09:10:47', '2022-08-13 09:10:47', NULL),
(7, 'Hàng việt nam', 'hang-viet-nam', 'backend/upload/branch/1660381876_logo-hang-VN-nho.png', '2022-08-13 09:11:16', '2022-08-13 09:11:16', NULL);

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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `level` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `parent_id`, `level`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nón Fullface', 'non-fullface', 0, 1, '2022-08-13 09:11:35', '2022-08-13 09:11:35', NULL),
(2, 'Mũ bảo hiểm 3/4', 'mu-bao-hiem-34', 0, 1, '2022-08-13 09:11:44', '2022-08-13 09:11:44', NULL),
(3, 'Mũ bảo hiểm nửa đầu', 'mu-bao-hiem-nua-dau', 0, 1, '2022-08-13 09:11:55', '2022-08-13 09:11:55', NULL),
(4, 'Mũ bảo hiểm trẻ em', 'mu-bao-hiem-tre-em', 0, 1, '2022-08-13 09:12:04', '2022-08-13 09:12:04', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(18, '2021_05_17_000002_create_cart_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 2, 'mot', 'HN', '0964047001', '932500.00', 2, '2022-08-13 09:56:14', '2022-08-13 09:56:40', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price_origin` decimal(16,2) NOT NULL,
  `product_price_sell` decimal(16,2) NOT NULL,
  `product_sale` int(11) DEFAULT NULL,
  `product_avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1, 1, 25, 'Nón bảo hiểm 1/2 đầu Asia MT-117K', '350000.00', '280000.00', 20, 'backend/upload/product/1660383219_1non-bao-hiem-1-2-dau-asia-mt-117k-500.jpg', 1, NULL, '2022-08-13 09:56:15', '2022-08-13 09:56:15', NULL),
(2, 1, 13, 'Mũ bảo hiểm Royal M179', '750000.00', '652500.00', 13, 'backend/upload/product/1660382739_non-bao-hiem-3-4-dau-royal-m139-1.jpg', 1, NULL, '2022-08-13 09:56:15', '2022-08-13 09:56:15', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_origin` decimal(16,2) DEFAULT NULL,
  `price_sell` decimal(16,2) DEFAULT NULL,
  `sale` int(11) DEFAULT 0,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hot` int(11) DEFAULT 2,
  `sort_describe` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `category_id`, `branch_id`, `name`, `price_origin`, `price_sell`, `sale`, `avatar`, `hot`, `sort_describe`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 4, 'Mũ bảo hiểm Fullface 2 kính Royal M266 trơn', '790000.00', '553000.00', 30, 'backend/upload/product/1660382217_mu-bao-hiem-fullface-2-kinh-royal-m266-tron-g.jpg', 2, NULL, '2022-08-13 09:16:57', '2022-08-13 09:16:57', NULL),
(2, 1, 1, 'Nón bảo hiểm nguyên đầu Asia MT-120', '550000.00', '451000.00', 18, 'backend/upload/product/1660382269_non-bao-hiem-nguyen-dau-asia-mt-120.jpg', 2, NULL, '2022-08-13 09:17:49', '2022-08-13 09:17:49', NULL),
(3, 1, 4, 'Mũ bảo hiểm fullface Royal Helmet M02 tem', '680000.00', '503200.00', 26, 'backend/upload/product/1660382308_mu-bao-hiem-fullface-royal-m02-tem.jpg', 2, NULL, '2022-08-13 09:18:28', '2022-08-13 09:18:28', NULL),
(4, 1, 4, 'Mũ bảo hiểm Royal M179', '750000.00', '652500.00', 13, 'backend/upload/product/1660382347_mu-bao-hiem-royal-m179.jpg', 2, NULL, '2022-08-13 09:19:07', '2022-08-13 09:19:07', NULL),
(5, 1, 4, 'Mũ bảo hiểm Royal M138B trơn', '830000.00', '697200.00', 16, 'backend/upload/product/1660382410_mu-bao-hiem-royal-m138b-tron.jpg', 2, NULL, '2022-08-13 09:20:10', '2022-08-13 09:20:10', NULL),
(6, 1, 4, 'Mũ bảo hiểm Royal M02 trơn', '640000.00', '480000.00', 25, 'backend/upload/product/1660382451_mu-bao-hiem-royal-m02-tron.jpg', 2, NULL, '2022-08-13 09:20:51', '2022-08-13 09:20:51', NULL),
(7, 1, 4, 'Mũ bảo hiểm Royal M138B tem', '990000.00', '801900.00', 19, 'backend/upload/product/1660382491_mu-bao-hiem-royal-m138b-tem-1.jpg', 2, NULL, '2022-08-13 09:21:31', '2022-08-13 09:21:31', NULL),
(8, 1, 4, 'Mũ bảo hiểm Royal M07 Sabre', '950000.00', '750500.00', 21, 'backend/upload/product/1660382525_mu-bao-hiem-royal-m07-sabre.jpg', 2, NULL, '2022-08-13 09:22:05', '2022-08-13 09:22:05', NULL),
(9, 1, 4, 'Mũ bảo hiểm Royal M138B tem', '900000.00', '729000.00', 19, 'backend/upload/product/1660382564_mu-bao-hiem-royal-m18.jpg', 2, NULL, '2022-08-13 09:22:44', '2022-08-13 09:22:44', NULL),
(10, 2, 4, 'Mũ bảo hiểm Royal Helmet M01 trơn', '410000.00', '369000.00', 10, 'backend/upload/product/1660382674_mu-bao-hiem-royal-m01-tron.jpg', 2, NULL, '2022-08-13 09:24:34', '2022-08-13 09:24:34', NULL),
(11, 2, 4, 'Nón bảo hiểm 3/4 đầu Royal Helmet M20C', '550000.00', '489500.00', 11, 'backend/upload/product/1660382696_non-bao-hiem-3-4-dau-royal-m20c.jpg', 2, NULL, '2022-08-13 09:24:56', '2022-08-13 09:24:56', NULL),
(12, 2, 4, 'Nón bảo hiểm 3/4 đầu Royal Helmet M139 (kính âm)', '690000.00', '593400.00', 14, 'backend/upload/product/1660382714_mu-bao-hiem-royal-m179-300.jpg', 2, NULL, '2022-08-13 09:25:14', '2022-08-13 09:25:14', NULL),
(13, 2, 4, 'Mũ bảo hiểm Royal M179', '750000.00', '652500.00', 13, 'backend/upload/product/1660382739_non-bao-hiem-3-4-dau-royal-m139-1.jpg', 1, NULL, '2022-08-13 09:25:39', '2022-08-13 09:46:24', NULL),
(14, 2, 1, 'Nón bảo hiểm trẻ em 3/4 đầu Asia MT-122', '400000.00', '324000.00', 19, 'backend/upload/product/1660382811_non-bao-hiem-tre-em-3-4-dau-asia-mt-122.jpg', 2, NULL, '2022-08-13 09:26:51', '2022-08-13 09:26:51', NULL),
(15, 2, 4, 'Mũ bảo hiểm 3/4 Royal M268 trơn (2 kính)', '640000.00', '428800.00', 33, 'backend/upload/product/1660382831_2mu-bao-hiem-3-4-royal-m268-tron-2-kinh-300.jpg', 2, NULL, '2022-08-13 09:27:11', '2022-08-13 09:27:11', NULL),
(16, 2, 1, 'Nón bảo hiểm 3/4 đầu Asia MT-124C/124A trơn', '390000.00', '339300.00', 13, 'backend/upload/product/1660382900_3non-bao-hiem-3-4-dau-asia-mt-124c-tron-s4.jpg', 2, NULL, '2022-08-13 09:27:31', '2022-08-13 09:28:20', NULL),
(17, 2, 4, 'Mũ bảo hiểm 3/4 Royal M269 trơn', '600000.00', '378000.00', 37, 'backend/upload/product/1660382889_4mu-bao-hiem-3-4-royal-m269-tron-300.jpg', 2, NULL, '2022-08-13 09:28:09', '2022-08-13 09:28:09', NULL),
(18, 2, 4, 'Nón bảo hiểm 3/4 đầu Royal Helmet M134 trơn', '450000.00', '400500.00', 11, 'backend/upload/product/1660382927_5non-bao-hiem-3-4-dau-royal-m134-tron-truoc.jpg', 2, NULL, '2022-08-13 09:28:47', '2022-08-13 09:28:47', NULL),
(19, 2, 3, 'Mũ bảo hiểm Protec Star 2 màu', '448000.00', '358400.00', 20, 'backend/upload/product/1660382986_6mu-bao-hiem-protec-star-2-mau-1.jpg', 2, NULL, '2022-08-13 09:29:46', '2022-08-13 09:29:46', NULL),
(20, 2, 3, 'Mũ bảo hiểm Protec Racing 2 màu RALWKZ', '598000.00', '490360.00', 18, 'backend/upload/product/1660383007_7mu-bao-hiem-protec-racing-2-mau-ralwkz.jpg', 2, NULL, '2022-08-13 09:30:07', '2022-08-13 09:30:07', NULL),
(21, 2, 3, 'Mũ bảo hiểm Protec Viva 1 màu VALWKZ', '538000.00', '430400.00', 20, 'backend/upload/product/1660383032_8mu-bao-hiem-protec-viva-1-mau-valwkz-300.jpg', 2, NULL, '2022-08-13 09:30:32', '2022-08-13 09:30:32', NULL),
(22, 2, 2, 'Mũ bảo hiểm 3/4 Andes 3S-306E (AS-306E) tem nhám (Size 57~59 cm)', '770000.00', '693000.00', 10, 'backend/upload/product/1660383071_9mu-bao-hiem-3-4-andes-3s-306e-tem-nham-size-57-59-cm-300.jpg', 2, NULL, '2022-08-13 09:31:11', '2022-08-13 09:31:11', NULL),
(23, 2, 2, 'Mũ bảo hiểm trơn nhám Andes Luxury LU-382DC', '800000.00', '760000.00', 5, 'backend/upload/product/1660383089_10mu-bao-hiem-tron-nham-andes-luxury-lu-382dc-300.jpg', 2, NULL, '2022-08-13 09:31:29', '2022-08-13 09:31:29', NULL),
(24, 2, 1, 'Nón bảo hiểm 3/4 đầu Asia MT-124A tem', '350000.00', '290500.00', 17, 'backend/upload/product/1660383120_non-bao-hiem-3-4-dau-asia-mt-124a-tem.jpg', 2, NULL, '2022-08-13 09:32:00', '2022-08-13 09:32:00', NULL),
(25, 3, 1, 'Nón bảo hiểm 1/2 đầu Asia MT-117K', '350000.00', '280000.00', 20, 'backend/upload/product/1660383219_1non-bao-hiem-1-2-dau-asia-mt-117k-500.jpg', 1, NULL, '2022-08-13 09:33:39', '2022-08-13 09:46:08', NULL),
(26, 3, 1, 'Nón bảo hiểm 1/2 đầu Asia MT-117', '250000.00', '190000.00', 24, 'backend/upload/product/1660383242_2non-bao-hiem-1-2-dau-asia-mt-117-500.jpg', 2, NULL, '2022-08-13 09:34:02', '2022-08-13 09:34:02', NULL),
(27, 3, 1, 'Nón bảo hiểm 1/2 đầu Asia MT-105', '250000.00', '195000.00', 22, 'backend/upload/product/1660383260_3non-bao-hiem-1-2-dau-asia-mt-105-500.jpg', 2, NULL, '2022-08-13 09:34:20', '2022-08-13 09:34:20', NULL),
(28, 3, 3, 'Mũ bảo hiểm Protec VIC không kính', '260000.00', '234000.00', 10, 'backend/upload/product/1660383294_4mu-bao-hiem-protec-vic-khong-kinh-1.jpg', 2, NULL, '2022-08-13 09:34:54', '2022-08-13 09:34:54', NULL),
(29, 3, 3, 'Mũ bảo hiểm Protec Rosa RLWF 2 màu', '318000.00', '248040.00', 22, 'backend/upload/product/1660383312_5mu-bao-hiem-protec-rosa-rlwf-2-mau-1.jpg', 2, NULL, '2022-08-13 09:35:12', '2022-08-13 09:35:12', NULL),
(30, 3, 3, 'Mũ bảo hiểm Protec Disco DLWF 2 màu', '318000.00', '257580.00', 19, 'backend/upload/product/1660383331_6mu-bao-hiem-protec-disco-dlwf-2-mau-1.jpg', 2, NULL, '2022-08-13 09:35:31', '2022-08-13 09:35:31', NULL),
(31, 3, 2, 'Mũ bảo hiểm Andes trơn nhám có kính 3S-139 (AS-139)', '450000.00', '400500.00', 11, 'backend/upload/product/1660383366_7mu-bao-hiem-andes-tron-nham-co-kinh-3s-139-300.jpg', 2, NULL, '2022-08-13 09:36:06', '2022-08-13 09:36:06', NULL),
(32, 3, 2, 'Mũ bảo hiểm Andes 3S (AS)- Haly - Tem W326 nhám (54cm - 56cm)', '290000.00', '261000.00', 10, 'backend/upload/product/1660383387_8mu-bao-hiem-andes-3s-as-haly-tem-w326-nham-54cm-56cm-500.jpg', 2, NULL, '2022-08-13 09:36:27', '2022-08-13 09:36:27', NULL),
(33, 3, 7, 'Mũ bảo hiểm khang dược Ích Nhân', '50000.00', '50000.00', 0, 'backend/upload/product/1660383413_mu-bao-hiem-khang-duoc-ich-nhan-300.jpg', 2, NULL, '2022-08-13 09:36:53', '2022-08-13 09:36:53', NULL),
(34, 3, 5, 'Mũ bảo hiểm Ajino', '99000.00', '99000.00', 0, 'backend/upload/product/1660383438_mu-bao-hiem-ajino-500.jpg', 2, NULL, '2022-08-13 09:37:18', '2022-08-13 09:37:18', NULL),
(35, 4, 6, 'Mũ đội đầu cho bé Scoot and Ride size S', '1000000.00', '950000.00', 5, 'backend/upload/product/1660383521_1mu-doi-dau-cho-be-scoot-and-ride-size-s-15.jpg', 2, NULL, '2022-08-13 09:38:41', '2022-08-13 09:38:41', NULL),
(36, 4, 6, 'Mũ đội đầu cho bé Scoot and Ride size XXS', '950000.00', '902500.00', 5, 'backend/upload/product/1660383540_2mu-doi-dau-cho-be-scoot-and-ride-size-xxs-9.jpg', 2, NULL, '2022-08-13 09:39:00', '2022-08-13 09:39:00', NULL),
(37, 4, 6, 'Mũ đội đầu phản quang cho bé Scoot and Ride size XXS', '1100000.00', '990000.00', 10, 'backend/upload/product/1660383559_3mu-doi-dau-phan-quang-cho-be-scoot-and-ride-size-xxs-6.jpg', 2, NULL, '2022-08-13 09:39:19', '2022-08-13 09:39:19', NULL),
(38, 4, 3, 'Mũ bảo hiểm Protec Kitty M 2 màu (có kính)', '368000.00', '320160.00', 13, 'backend/upload/product/1660383606_4mu-bao-hiem-protec-kitty-m-2-mau-co-kinh-500.jpg', 2, NULL, '2022-08-13 09:40:06', '2022-08-13 09:40:06', NULL),
(39, 4, 3, 'Mũ bảo hiểm Protec Kitty S 2 màu (có kính)', '310000.00', '310000.00', 0, 'backend/upload/product/1660383622_5mu-bao-hiem-protec-kitty-s-2-mau-co-kinh-1.jpg', 2, NULL, '2022-08-13 09:40:22', '2022-08-13 09:40:22', NULL),
(40, 4, 3, 'Mũ bảo hiểm Protec Kitty M 1 màu (có kính)', '350000.00', '290500.00', 17, 'backend/upload/product/1660383641_6mu-bao-hiem-protec-kitty-m-1-mau-co-kinh-500.jpg', 2, NULL, '2022-08-13 09:40:41', '2022-08-13 09:40:41', NULL),
(41, 4, 3, 'Mũ bảo hiểm trẻ em Protec Pooh 2 màu', '378000.00', '328860.00', 13, 'backend/upload/product/1660383658_7mu-bao-hiem-tre-em-protec-pooh-2-mau.jpg', 2, NULL, '2022-08-13 09:40:58', '2022-08-13 09:40:58', NULL),
(42, 4, 1, 'Nón bảo hiểm trẻ em 1/2 đầu Asia MT-103S', '215000.00', '184900.00', 14, 'backend/upload/product/1660383690_8non-bao-hiem-tre-em-1-2-dau-asia-mt-103s-1.jpg', 2, NULL, '2022-08-13 09:41:30', '2022-08-13 09:41:30', NULL),
(43, 4, 1, 'Mũ bảo hiểm trẻ em Asia MT-103KS (Sừng)', '390000.00', '249600.00', 36, 'backend/upload/product/1660383706_9mu-bao-hiem-tre-em-asia-mt-103ks-sung-300.jpg', 2, NULL, '2022-08-13 09:41:46', '2022-08-13 09:41:46', NULL),
(44, 4, 1, 'Nón bảo hiểm trẻ em 1/2 đầu Asia MT-128KS', '250000.00', '190000.00', 24, 'backend/upload/product/1660383725_10non-bao-hiem-tre-em-1-2-dau-asia-mt-128ks-1.jpg', 2, NULL, '2022-08-13 09:42:05', '2022-08-13 09:42:05', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `address`, `phone`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'User', 'user@gmail.com', '$2y$10$P508ZSGPUYJl3jmff9isPO4gXRN4lqFsQZgwLn8ltiXMYz0HwXEru', NULL, '1234567890', NULL, NULL, NULL),
(2, 'mot', 'mot@gmail.com', '$2y$10$QgSLI8Xg0TiXeTAc3h/HO.SvK9nQ27.g22oZdaCHcqFL4CTGUyQie', 'HN', '0964047001', '2022-08-13 09:54:52', '2022-08-13 09:54:52', NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
