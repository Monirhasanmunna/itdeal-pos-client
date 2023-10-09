-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 09, 2023 at 04:45 PM
-- Server version: 10.3.39-MariaDB
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itdealbd_amishghor_db1`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_no` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double NOT NULL,
  `note` text DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `account_no`, `name`, `initial_balance`, `total_balance`, `note`, `is_default`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '1010', 'Cash', NULL, 0, NULL, 1, 1, '2023-05-26 15:18:36', '2023-10-07 16:06:44'),
(2, '2020', 'Company Account', 0, 0, NULL, 0, 1, '2023-09-11 12:04:52', '2023-10-07 16:06:44');

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adjustments`
--

INSERT INTO `adjustments` (`id`, `reference_no`, `warehouse_id`, `document`, `total_qty`, `item`, `note`, `created_at`, `updated_at`) VALUES
(1, 'adr-20230922-055803', 1, NULL, 1, 1, NULL, '2023-09-22 11:58:03', '2023-09-22 11:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin` varchar(191) NOT NULL,
  `checkout` varchar(191) NOT NULL,
  `status` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `branch` varchar(30) NOT NULL,
  `account_no` varchar(30) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`, `branch`, `account_no`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'tests', 'Shapla, Rangpur', '001', 1, '2023-09-10 14:17:39', '2023-09-10 14:23:24');

-- --------------------------------------------------------

--
-- Table structure for table `billers`
--

CREATE TABLE `billers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) NOT NULL,
  `vat_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billers`
--

INSERT INTO `billers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Default', NULL, 'default@gmail.com', '00000', 'Rangpur', 'Dhaka', 'RAgnpur', '5400', 'Bangladesh', 1, '2023-02-27 17:03:28', '2023-02-27 17:03:28');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Oppo', NULL, 0, '2023-09-08 12:40:48', '2023-09-11 08:05:50'),
(2, 'Test', NULL, 1, '2023-10-08 05:49:55', '2023-10-08 05:49:55');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_in_hand` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `cash_in_hand`, `user_id`, `warehouse_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 1, 1, '2023-02-27 17:10:06', '2023-02-27 17:10:06'),
(2, 0, 37, 1, 0, '2023-02-27 17:44:52', '2023-03-01 19:33:00'),
(3, 0, 37, 1, 1, '2023-03-02 10:44:48', '2023-03-02 10:44:48'),
(4, 0, 41, 1, 1, '2023-03-03 06:03:55', '2023-03-03 06:03:55'),
(5, 0, 40, 1, 1, '2023-03-03 10:27:30', '2023-03-03 10:27:30'),
(6, 0, 39, 1, 1, '2023-03-14 11:20:30', '2023-03-14 11:20:30'),
(7, 0, 45, 1, 0, '2023-09-08 12:44:11', '2023-09-11 12:05:35'),
(8, 0, 45, 1, 0, '2023-09-11 12:09:15', '2023-09-11 12:13:50'),
(9, 0, 45, 1, 0, '2023-09-11 12:22:30', '2023-09-12 15:04:41'),
(10, 0, 45, 1, 0, '2023-09-13 05:05:21', '2023-09-14 05:06:17'),
(11, 10, 45, 1, 0, '2023-09-14 05:07:46', '2023-09-15 11:12:46'),
(12, 0, 45, 1, 0, '2023-09-15 11:20:25', '2023-09-16 15:00:13'),
(13, 10, 45, 1, 0, '2023-09-17 03:24:08', '2023-09-17 14:27:46'),
(14, 10, 45, 1, 0, '2023-09-18 04:06:10', '2023-09-18 16:39:39'),
(15, 10, 45, 1, 0, '2023-09-19 06:05:00', '2023-09-19 15:58:04'),
(16, 10, 45, 1, 0, '2023-09-20 04:05:40', '2023-09-20 16:58:43'),
(17, 10, 45, 1, 0, '2023-09-21 03:53:45', '2023-09-21 16:34:15'),
(18, 1, 45, 1, 0, '2023-09-21 16:34:24', '2023-09-22 14:44:07'),
(19, 1, 45, 1, 0, '2023-09-22 14:44:13', '2023-09-23 14:37:13'),
(20, 100, 45, 1, 0, '2023-09-23 14:37:20', '2023-09-24 16:51:06'),
(21, 10, 45, 1, 0, '2023-09-25 04:21:10', '2023-09-25 16:40:39'),
(22, 10, 45, 1, 0, '2023-09-26 05:49:09', '2023-09-26 15:40:02'),
(23, 10, 45, 1, 1, '2023-09-27 04:57:02', '2023-09-27 04:57:02'),
(24, 500, 46, 1, 1, '2023-10-03 05:31:55', '2023-10-03 05:31:55');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Food', NULL, NULL, 1, '2023-09-08 12:41:08', '2023-09-11 11:06:39'),
(2, 'Broiler', NULL, 1, 1, '2023-09-15 11:18:02', '2023-09-15 11:18:02'),
(3, 'Beef', NULL, 1, 1, '2023-09-15 11:18:30', '2023-09-15 11:18:30'),
(4, 'Sonaly', NULL, 1, 1, '2023-09-16 07:07:04', '2023-09-16 07:07:04'),
(5, 'Egg', NULL, 1, 1, '2023-09-16 07:07:17', '2023-09-16 07:07:17'),
(6, 'Milk', NULL, 1, 1, '2023-09-16 07:07:29', '2023-09-16 07:07:29');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'Taka', 'BDT', 1, '2020-11-01 12:22:58', '2023-02-24 14:01:30');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone_number` varchar(191) NOT NULL,
  `tax_no` varchar(191) DEFAULT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `points` double DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `expense` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `user_id`, `name`, `company_name`, `email`, `phone_number`, `tax_no`, `address`, `city`, `state`, `postal_code`, `country`, `points`, `deposit`, `expense`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Walking Customer 1', NULL, NULL, '009209023', NULL, 'rangpur', 'Rangpur', NULL, NULL, NULL, 1797, NULL, NULL, 1, '2023-09-08 12:44:52', '2023-09-27 12:00:06'),
(2, 1, NULL, 'Bagdad Restaurant', NULL, NULL, '010000000', NULL, 'Rangpur', 'Rangpur', NULL, NULL, NULL, 79, NULL, NULL, 1, '2023-09-14 15:47:42', '2023-09-27 07:11:22'),
(3, 1, NULL, 'Mahmudul Hasan', NULL, 'cpdfl.bd@gmail.com', '01705489145', NULL, 'Rangpur', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-16 07:21:05', '2023-09-16 07:21:05'),
(4, 1, NULL, 'Tushar', NULL, NULL, '01722934151', NULL, 'Rangpur', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-18 14:45:50', '2023-09-18 14:45:50'),
(5, 1, NULL, 'Mofij Hotel', NULL, NULL, '01776570000', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-18 14:48:05', '2023-09-18 14:48:05'),
(6, 1, NULL, 'Home Delivery', NULL, NULL, '01705489142', NULL, 'Rangpur', 'Rangpur', NULL, NULL, NULL, 90, NULL, NULL, 1, '2023-09-18 14:51:51', '2023-09-27 11:56:11'),
(7, 1, NULL, 'Dhaka Fahad', NULL, NULL, '01711506588', NULL, 'Dhanmondi', 'Dhaka', NULL, NULL, NULL, 46, NULL, NULL, 1, '2023-09-18 14:54:39', '2023-09-18 15:03:37'),
(8, 1, NULL, 'Shahidul', NULL, NULL, '01724425278', NULL, 'Rangpur', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-18 15:27:16', '2023-09-18 15:27:16'),
(9, 1, NULL, 'ajahar sir', NULL, NULL, '01712932661', NULL, 'Rangpur', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-18 15:47:57', '2023-09-18 15:47:57'),
(10, 1, NULL, 'nahid vai', NULL, NULL, '01706952566', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, 12, NULL, NULL, 1, '2023-09-19 11:52:44', '2023-09-27 06:46:42'),
(11, 1, NULL, 'Mofij Hotel', NULL, NULL, '01749411245', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-19 14:10:28', '2023-09-19 14:10:28'),
(12, 1, NULL, 'pavel', NULL, NULL, '01717255923', NULL, 'Rangpur', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-19 14:47:03', '2023-09-19 14:47:03'),
(13, 1, NULL, 'soyon sir', NULL, NULL, '01307325019', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-20 05:16:20', '2023-09-20 05:16:20'),
(14, 1, NULL, 'shahid sir', NULL, NULL, '01717727329', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-20 05:20:10', '2023-09-20 05:20:10'),
(15, 1, NULL, 'Aminur sir', NULL, NULL, '01715572339', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-20 06:13:49', '2023-09-20 06:13:49'),
(16, 1, NULL, 'Nur Alom', NULL, NULL, '01820536912', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-20 09:35:30', '2023-09-20 09:35:30'),
(17, 1, NULL, 'samilul Vai', NULL, NULL, '01738169081', NULL, 'Purbo Dilabari', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-20 09:38:42', '2023-09-20 09:38:42'),
(18, 1, NULL, 'Khaleda Begom', NULL, NULL, '01704212177', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-20 11:03:32', '2023-09-20 11:03:32'),
(19, 1, NULL, 'Nasir Sir', NULL, NULL, '01715292995', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, 7, NULL, NULL, 1, '2023-09-20 12:07:35', '2023-09-20 12:08:27'),
(20, 1, NULL, 'Abdul Razzak', NULL, NULL, '01957600010', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-21 04:50:42', '2023-09-21 04:50:42'),
(21, 1, NULL, 'Kurigram Chal Ghor', NULL, NULL, '01324569774', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, 27, NULL, NULL, 1, '2023-09-21 05:45:20', '2023-09-27 07:03:10'),
(22, 1, NULL, 'Mithu Vai Mohipur', NULL, NULL, '01722437402', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, 70, NULL, NULL, 1, '2023-09-21 06:56:15', '2023-09-27 07:07:04'),
(23, 1, NULL, 'Sumon Vai Amish Ghor', NULL, NULL, '01722520619', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-21 09:25:34', '2023-09-21 09:25:34'),
(24, 1, NULL, 'Abdul Hamid', NULL, NULL, '01794964517', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-21 10:15:16', '2023-09-21 10:15:16'),
(25, 1, NULL, 'Faizul Brai', NULL, NULL, '01606362720', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-21 13:15:19', '2023-09-21 13:15:19'),
(26, 1, NULL, 'Raihan', NULL, NULL, '01303590861', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-21 13:47:02', '2023-09-21 13:47:02'),
(27, 1, NULL, 'Hira Sir', NULL, NULL, '01834066492', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-21 14:21:29', '2023-09-21 14:21:29'),
(28, 1, NULL, 'Monir Sir', NULL, NULL, '01710401803', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-21 14:43:05', '2023-09-21 14:43:05'),
(29, 1, NULL, 'Hazipara Madrasa', NULL, NULL, '01737113494', NULL, 'Rangpur', 'Rangpur', NULL, NULL, NULL, 43, NULL, NULL, 1, '2023-09-22 02:23:18', '2023-09-27 06:16:11'),
(30, 1, NULL, 'Juel vai', NULL, NULL, '01785341534', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, 5, NULL, NULL, 1, '2023-09-22 02:55:39', '2023-09-22 02:56:50'),
(31, 1, NULL, 'faruk', NULL, NULL, '01745338719', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-22 03:19:40', '2023-09-22 03:19:40'),
(32, 1, NULL, 'Nazmul', NULL, NULL, '01723936371', NULL, 'CO Bazar', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-22 03:49:13', '2023-09-22 03:49:13'),
(33, 1, NULL, 'Tareq sir', NULL, NULL, '01711427794', NULL, 'Rangpur', 'Rangpur', NULL, NULL, NULL, 7, NULL, NULL, 1, '2023-09-22 04:13:29', '2023-09-22 04:15:02'),
(34, 1, NULL, 'Gobindo saha', NULL, NULL, '01741722619', NULL, 'CO Bazar', 'Rangpur', NULL, NULL, NULL, 4, NULL, NULL, 1, '2023-09-22 05:50:44', '2023-09-22 06:02:16'),
(35, 1, NULL, 'A Jalil', NULL, NULL, '01708497361', NULL, 'Pandardighi', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-22 05:59:26', '2023-09-22 05:59:26'),
(36, 1, NULL, 'Doha Store', NULL, NULL, '01717678385', NULL, 'Hazipara', 'Rangpur', NULL, NULL, NULL, 21, NULL, NULL, 1, '2023-09-22 06:12:19', '2023-09-26 07:14:20'),
(37, 1, NULL, 'Rima Mam', NULL, NULL, '01934664089', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-22 06:17:02', '2023-09-22 06:17:02'),
(38, 1, NULL, 'grand castle', NULL, NULL, '01764722316', NULL, 'dhap', 'Rangpur', NULL, NULL, NULL, 60, NULL, NULL, 1, '2023-09-22 12:44:13', '2023-09-24 15:26:35'),
(39, 1, NULL, 'Abdul Jolil', NULL, NULL, '01764638987', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-23 04:48:04', '2023-09-23 04:48:04'),
(40, 1, NULL, 'Rakib Hasan', NULL, NULL, '01938563012', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-23 05:26:47', '2023-09-23 05:26:47'),
(41, 1, NULL, 'Anawer Sir', NULL, NULL, '01738580127', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-23 08:34:38', '2023-09-23 08:34:38'),
(42, 1, NULL, 'Saddam Hossin', NULL, NULL, '01764450480', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-23 08:49:52', '2023-09-23 08:49:52'),
(43, 1, NULL, 'Mehedi', NULL, NULL, '01722377312', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-23 08:57:38', '2023-09-23 08:57:38'),
(44, 1, NULL, 'Nasir hossen', NULL, NULL, '01314253467', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-23 09:55:26', '2023-09-23 09:55:26'),
(45, 1, NULL, 'Dc.Mahamud', NULL, NULL, '01723752968', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-23 10:06:08', '2023-09-23 10:06:08'),
(46, 1, NULL, 'Protik', NULL, NULL, '01721915322', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, 4, NULL, NULL, 1, '2023-09-23 10:15:33', '2023-09-23 10:16:35'),
(47, 1, NULL, 'Amor Faruk', NULL, NULL, '01788185217', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-23 11:04:25', '2023-09-23 11:04:25'),
(48, 1, NULL, 'Nur Nobi', NULL, NULL, '0178876905', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-23 13:10:39', '2023-09-23 13:10:39'),
(49, 1, NULL, 'Danish', NULL, NULL, '01682791574', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-23 13:13:42', '2023-09-23 13:13:42'),
(50, 1, NULL, 'Sujon Vai', NULL, NULL, '01770852512', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-23 13:19:14', '2023-09-23 13:19:14'),
(51, 1, NULL, 'Limon Sir', NULL, NULL, '01737341502', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-23 13:30:18', '2023-09-23 13:30:18'),
(52, 1, NULL, 'Md Moniruz Jaman', NULL, NULL, '01722304108', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, 4, NULL, NULL, 1, '2023-09-23 14:03:02', '2023-09-23 14:03:57'),
(53, 1, NULL, 'Laila Medam', NULL, NULL, '01301447346', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-24 04:17:11', '2023-09-24 04:17:11'),
(54, 1, NULL, 'Runa Medam', NULL, NULL, '01774040201', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-24 04:42:06', '2023-09-24 04:42:06'),
(55, 1, NULL, 'Fojlul Huq', NULL, NULL, '01718716005', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-24 05:33:41', '2023-09-24 05:33:41'),
(56, 1, NULL, 'Md Ferdos hossen', NULL, NULL, '01774461519', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-24 07:07:27', '2023-09-24 07:07:27'),
(57, 1, NULL, 'Vai Vai Dokan', NULL, NULL, '01307330603', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, 7, NULL, NULL, 1, '2023-09-24 10:34:51', '2023-09-24 10:35:11'),
(58, 1, NULL, 'Moksedul Islam', NULL, NULL, '01709109358', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, 3, NULL, NULL, 1, '2023-09-24 12:35:41', '2023-09-24 12:35:59'),
(59, 1, NULL, 'Monjil Vai', NULL, NULL, '01704348576', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, 433, NULL, NULL, 1, '2023-09-24 13:57:02', '2023-09-27 14:38:54'),
(60, 1, NULL, 'Shohag', NULL, NULL, '01737539690', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-24 14:11:19', '2023-09-24 14:11:19'),
(61, 1, NULL, 'Abul Kalam Azad', NULL, NULL, '01718942828', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-24 15:07:06', '2023-09-24 15:07:06'),
(62, 1, NULL, 'Abu Akkas', NULL, NULL, '01328599450', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-26 06:39:25', '2023-09-26 06:39:25'),
(63, 1, NULL, 'Morshad Sir', NULL, NULL, '01718634303', NULL, 'Pakarmatha', 'Rangpur', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-26 10:08:26', '2023-09-26 10:08:26');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `percentage` varchar(191) NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `name`, `percentage`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Customer', '0', 1, '2023-02-27 16:59:08', '2023-02-27 16:59:08'),
(2, 'Employee', '0', 1, '2023-02-27 17:00:00', '2023-05-27 06:05:39'),
(3, 'Black Membership', '0', 1, '2023-03-10 18:42:12', '2023-05-27 06:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` text NOT NULL,
  `delivered_by` varchar(191) DEFAULT NULL,
  `recieved_by` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `applicable_for` varchar(191) NOT NULL,
  `product_list` longtext DEFAULT NULL,
  `valid_from` date NOT NULL,
  `valid_till` date NOT NULL,
  `type` varchar(191) NOT NULL,
  `value` double NOT NULL,
  `minimum_qty` double NOT NULL,
  `maximum_qty` double NOT NULL,
  `days` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_plans`
--

CREATE TABLE `discount_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_plan_customers`
--

CREATE TABLE `discount_plan_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_plan_discounts`
--

CREATE TABLE `discount_plan_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` int(11) NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dso_alerts`
--

CREATE TABLE `dso_alerts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_info` longtext NOT NULL,
  `number_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone_number`, `department_id`, `user_id`, `image`, `address`, `city`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Rahul', 'rahul@colzz.com', '0153900887', 2, 38, NULL, 'Tajmahal Road, Mohamadpur', 'Dhaka', 'Bangladeh', 0, '2023-03-01 18:32:28', '2023-04-17 20:12:02'),
(2, 'Hasan', 'hasan@colzz.com', '01518449510', 2, 39, NULL, 'Tajmahal Road, Mohamadpur', 'Dhaka', 'Bangladeh', 1, '2023-03-01 18:34:22', '2023-03-01 18:34:22'),
(3, 'Tuhin', 'tuhin@colzz.com', '0153900887', 2, 40, NULL, 'Tajmahal Road, Mohamadpur', 'Dhaka', 'Bangladeh', 0, '2023-03-01 18:35:54', '2023-03-04 12:45:28'),
(4, 'Ibrahim', 'ibrahim@colzz.com', '01780380827', 2, 41, NULL, 'Mohammadpur,Dhaka-1205', 'Dhaka', 'Bangladesh', 0, '2023-03-03 05:51:14', '2023-04-17 20:12:11'),
(5, 'Tumpa Akter', 'tumpa@colzz.com', '01896198501', 2, 42, NULL, 'Mohammadpur,Dhaka-1205', 'Dhaka', 'Bangladesh', 1, '2023-03-03 10:14:14', '2023-03-03 10:14:14'),
(6, 'Tuhin', 'tuhin@gmail.com', '01974442822', 2, 43, NULL, 'Mohammadpur,Dhaka-1205', 'Dhaka', 'Bangladesh', 1, '2023-03-04 12:46:26', '2023-03-04 12:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `reference_no`, `expense_category_id`, `warehouse_id`, `account_id`, `user_id`, `cash_register_id`, `amount`, `note`, `created_at`, `updated_at`) VALUES
(2, 'er-20230918-095957', 3, 1, 1, 45, 14, 20, NULL, '2023-09-18 15:59:57', '2023-09-18 15:59:57'),
(3, 'er-20230921-103036', 4, 1, 1, 45, 17, 4300, NULL, '2023-09-20 18:00:00', '2023-09-21 16:30:36');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `code`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '1008', 'Office Expense', 1, '2023-09-11 12:07:41', '2023-09-16 06:59:22'),
(2, '1001', 'Transport', 1, '2023-09-16 06:53:58', '2023-09-16 06:53:58'),
(3, '1002', 'Entertainment', 1, '2023-09-16 06:54:14', '2023-09-16 06:54:14'),
(4, '1003', 'Electricity', 1, '2023-09-16 06:54:59', '2023-09-16 06:54:59'),
(5, '1004', 'Supply Exp', 1, '2023-09-16 06:55:16', '2023-09-16 06:55:16'),
(6, '1005', 'Shop Rent', 1, '2023-09-16 06:56:09', '2023-09-16 06:56:09'),
(7, '1006', 'Salary', 1, '2023-09-16 06:58:26', '2023-09-16 06:58:26'),
(8, '1007', 'Sales Bonus', 1, '2023-09-16 06:58:46', '2023-09-16 06:58:46');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_title` varchar(191) NOT NULL,
  `site_logo` varchar(191) DEFAULT NULL,
  `is_rtl` tinyint(1) DEFAULT NULL,
  `currency` varchar(191) NOT NULL,
  `staff_access` varchar(191) NOT NULL,
  `date_format` varchar(191) NOT NULL,
  `developed_by` varchar(191) DEFAULT NULL,
  `invoice_format` varchar(191) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `theme` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_title`, `site_logo`, `is_rtl`, `currency`, `staff_access`, `date_format`, `developed_by`, `invoice_format`, `state`, `theme`, `created_at`, `updated_at`, `currency_position`) VALUES
(1, 'Amishghor', '20230911014834.png', 0, '1', 'own', 'd-m-Y', 'ITDeal', 'standard', 1, 'default.css', '2018-07-06 18:13:11', '2023-09-11 07:48:34', 'prefix');

-- --------------------------------------------------------

--
-- Table structure for table `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `card_no` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gift_card_recharges`
--

CREATE TABLE `gift_card_recharges` (
  `id` int(10) UNSIGNED NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hrm_settings`
--

CREATE TABLE `hrm_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `checkin` varchar(191) NOT NULL,
  `checkout` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hrm_settings`
--

INSERT INTO `hrm_settings` (`id`, `checkin`, `checkout`, `created_at`, `updated_at`) VALUES
(1, '10:00am', '10:00pm', '2019-01-02 14:20:08', '2023-03-01 19:09:15');

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `note` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `incomes`
--

INSERT INTO `incomes` (`id`, `amount`, `note`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 100, 'Test', 45, '2023-10-08 15:19:09', '2023-10-08 15:19:09');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `created_at`, `updated_at`) VALUES
(1, 'en', '2018-07-08 10:59:17', '2019-12-25 05:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_02_17_060412_create_categories_table', 1),
(4, '2018_02_20_035727_create_brands_table', 1),
(5, '2018_02_25_100635_create_suppliers_table', 1),
(6, '2018_02_27_101619_create_warehouse_table', 1),
(7, '2018_03_03_040448_create_units_table', 1),
(8, '2018_03_04_041317_create_taxes_table', 1),
(9, '2018_03_10_061915_create_customer_groups_table', 1),
(10, '2018_03_10_090534_create_customers_table', 1),
(11, '2018_03_11_095547_create_billers_table', 1),
(12, '2018_04_05_054401_create_products_table', 1),
(13, '2018_04_06_133606_create_purchases_table', 1),
(14, '2018_04_06_154600_create_product_purchases_table', 1),
(15, '2018_04_06_154915_create_product_warhouse_table', 1),
(16, '2018_04_10_085927_create_sales_table', 1),
(17, '2018_04_10_090133_create_product_sales_table', 1),
(18, '2018_04_10_090254_create_payments_table', 1),
(19, '2018_04_10_090341_create_payment_with_cheque_table', 1),
(20, '2018_04_10_090509_create_payment_with_credit_card_table', 1),
(21, '2018_04_13_121436_create_quotation_table', 1),
(22, '2018_04_13_122324_create_product_quotation_table', 1),
(23, '2018_04_14_121802_create_transfers_table', 1),
(24, '2018_04_14_121913_create_product_transfer_table', 1),
(25, '2018_05_13_082847_add_payment_id_and_change_sale_id_to_payments_table', 2),
(26, '2018_05_13_090906_change_customer_id_to_payment_with_credit_card_table', 3),
(27, '2018_05_20_054532_create_adjustments_table', 4),
(28, '2018_05_20_054859_create_product_adjustments_table', 4),
(29, '2018_05_21_163419_create_returns_table', 5),
(30, '2018_05_21_163443_create_product_returns_table', 5),
(31, '2018_06_02_050905_create_roles_table', 6),
(32, '2018_06_02_073430_add_columns_to_users_table', 7),
(33, '2018_06_03_053738_create_permission_tables', 8),
(36, '2018_06_21_063736_create_pos_setting_table', 9),
(37, '2018_06_21_094155_add_user_id_to_sales_table', 10),
(38, '2018_06_21_101529_add_user_id_to_purchases_table', 11),
(39, '2018_06_21_103512_add_user_id_to_transfers_table', 12),
(40, '2018_06_23_061058_add_user_id_to_quotations_table', 13),
(41, '2018_06_23_082427_add_is_deleted_to_users_table', 14),
(42, '2018_06_25_043308_change_email_to_users_table', 15),
(43, '2018_07_06_115449_create_general_settings_table', 16),
(44, '2018_07_08_043944_create_languages_table', 17),
(45, '2018_07_11_102144_add_user_id_to_returns_table', 18),
(46, '2018_07_11_102334_add_user_id_to_payments_table', 18),
(47, '2018_07_22_130541_add_digital_to_products_table', 19),
(49, '2018_07_24_154250_create_deliveries_table', 20),
(50, '2018_08_16_053336_create_expense_categories_table', 21),
(51, '2018_08_17_115415_create_expenses_table', 22),
(55, '2018_08_18_050418_create_gift_cards_table', 23),
(56, '2018_08_19_063119_create_payment_with_gift_card_table', 24),
(57, '2018_08_25_042333_create_gift_card_recharges_table', 25),
(58, '2018_08_25_101354_add_deposit_expense_to_customers_table', 26),
(59, '2018_08_26_043801_create_deposits_table', 27),
(60, '2018_09_02_044042_add_keybord_active_to_pos_setting_table', 28),
(61, '2018_09_09_092713_create_payment_with_paypal_table', 29),
(62, '2018_09_10_051254_add_currency_to_general_settings_table', 30),
(63, '2018_10_22_084118_add_biller_and_store_id_to_users_table', 31),
(65, '2018_10_26_034927_create_coupons_table', 32),
(66, '2018_10_27_090857_add_coupon_to_sales_table', 33),
(67, '2018_11_07_070155_add_currency_position_to_general_settings_table', 34),
(68, '2018_11_19_094650_add_combo_to_products_table', 35),
(69, '2018_12_09_043712_create_accounts_table', 36),
(70, '2018_12_17_112253_add_is_default_to_accounts_table', 37),
(71, '2018_12_19_103941_add_account_id_to_payments_table', 38),
(72, '2018_12_20_065900_add_account_id_to_expenses_table', 39),
(73, '2018_12_20_082753_add_account_id_to_returns_table', 40),
(74, '2018_12_26_064330_create_return_purchases_table', 41),
(75, '2018_12_26_144210_create_purchase_product_return_table', 42),
(76, '2018_12_26_144708_create_purchase_product_return_table', 43),
(77, '2018_12_27_110018_create_departments_table', 44),
(78, '2018_12_30_054844_create_employees_table', 45),
(79, '2018_12_31_125210_create_payrolls_table', 46),
(80, '2018_12_31_150446_add_department_id_to_employees_table', 47),
(81, '2019_01_01_062708_add_user_id_to_expenses_table', 48),
(82, '2019_01_02_075644_create_hrm_settings_table', 49),
(83, '2019_01_02_090334_create_attendances_table', 50),
(84, '2019_01_27_160956_add_three_columns_to_general_settings_table', 51),
(85, '2019_02_15_183303_create_stock_counts_table', 52),
(86, '2019_02_17_101604_add_is_adjusted_to_stock_counts_table', 53),
(87, '2019_04_13_101707_add_tax_no_to_customers_table', 54),
(89, '2019_10_14_111455_create_holidays_table', 55),
(90, '2019_11_13_145619_add_is_variant_to_products_table', 56),
(91, '2019_11_13_150206_create_product_variants_table', 57),
(92, '2019_11_13_153828_create_variants_table', 57),
(93, '2019_11_25_134041_add_qty_to_product_variants_table', 58),
(94, '2019_11_25_134922_add_variant_id_to_product_purchases_table', 58),
(95, '2019_11_25_145341_add_variant_id_to_product_warehouse_table', 58),
(96, '2019_11_29_182201_add_variant_id_to_product_sales_table', 59),
(97, '2019_12_04_121311_add_variant_id_to_product_quotation_table', 60),
(98, '2019_12_05_123802_add_variant_id_to_product_transfer_table', 61),
(100, '2019_12_08_114954_add_variant_id_to_product_returns_table', 62),
(101, '2019_12_08_203146_add_variant_id_to_purchase_product_return_table', 63),
(102, '2020_02_28_103340_create_money_transfers_table', 64),
(103, '2020_07_01_193151_add_image_to_categories_table', 65),
(105, '2020_09_26_130426_add_user_id_to_deliveries_table', 66),
(107, '2020_10_11_125457_create_cash_registers_table', 67),
(108, '2020_10_13_155019_add_cash_register_id_to_sales_table', 68),
(109, '2020_10_13_172624_add_cash_register_id_to_returns_table', 69),
(110, '2020_10_17_212338_add_cash_register_id_to_payments_table', 70),
(111, '2020_10_18_124200_add_cash_register_id_to_expenses_table', 71),
(112, '2020_10_21_121632_add_developed_by_to_general_settings_table', 72),
(113, '2019_08_19_000000_create_failed_jobs_table', 73),
(114, '2020_10_30_135557_create_notifications_table', 73),
(115, '2020_11_01_044954_create_currencies_table', 74),
(116, '2020_11_01_140736_add_price_to_product_warehouse_table', 75),
(117, '2020_11_02_050633_add_is_diff_price_to_products_table', 76),
(118, '2020_11_09_055222_add_user_id_to_customers_table', 77),
(119, '2020_11_17_054806_add_invoice_format_to_general_settings_table', 78),
(120, '2021_02_10_074859_add_variant_id_to_product_adjustments_table', 79),
(121, '2021_03_07_093606_create_product_batches_table', 80),
(122, '2021_03_07_093759_add_product_batch_id_to_product_warehouse_table', 80),
(123, '2021_03_07_093900_add_product_batch_id_to_product_purchases_table', 80),
(124, '2021_03_11_132603_add_product_batch_id_to_product_sales_table', 81),
(127, '2021_03_25_125421_add_is_batch_to_products_table', 82),
(128, '2021_05_19_120127_add_product_batch_id_to_product_returns_table', 82),
(130, '2021_05_22_105611_add_product_batch_id_to_purchase_product_return_table', 83),
(131, '2021_05_23_124848_add_product_batch_id_to_product_transfer_table', 84),
(132, '2021_05_26_153106_add_product_batch_id_to_product_quotation_table', 85),
(133, '2021_06_08_213007_create_reward_point_settings_table', 86),
(134, '2021_06_16_104155_add_points_to_customers_table', 87),
(135, '2021_06_17_101057_add_used_points_to_payments_table', 88),
(136, '2021_07_06_132716_add_variant_list_to_products_table', 89),
(137, '2021_09_27_161141_add_is_imei_to_products_table', 90),
(138, '2021_09_28_170052_add_imei_number_to_product_warehouse_table', 91),
(139, '2021_09_28_170126_add_imei_number_to_product_purchases_table', 91),
(140, '2021_10_03_170652_add_imei_number_to_product_sales_table', 92),
(141, '2021_10_10_145214_add_imei_number_to_product_returns_table', 93),
(142, '2021_10_11_104504_add_imei_number_to_product_transfer_table', 94),
(143, '2021_10_12_160107_add_imei_number_to_purchase_product_return_table', 95),
(144, '2021_10_12_205146_add_is_rtl_to_general_settings_table', 96),
(145, '2021_10_23_142451_add_is_approve_to_payments_table', 97),
(146, '2022_01_13_191242_create_discount_plans_table', 97),
(147, '2022_01_14_174318_create_discount_plan_customers_table', 97),
(148, '2022_01_14_202439_create_discounts_table', 98),
(149, '2022_01_16_153506_create_discount_plan_discounts_table', 98),
(150, '2022_02_05_174210_add_order_discount_type_and_value_to_sales_table', 99),
(154, '2022_05_26_195506_add_daily_sale_objective_to_products_table', 100),
(155, '2022_05_28_104209_create_dso_alerts_table', 101),
(156, '2022_06_01_112100_add_is_embeded_to_products_table', 102);

-- --------------------------------------------------------

--
-- Table structure for table `money_transfers`
--

CREATE TABLE `money_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `money_transfers`
--

INSERT INTO `money_transfers` (`id`, `reference_no`, `from_account_id`, `to_account_id`, `amount`, `created_at`, `updated_at`) VALUES
(3, 'mtr-20230915-052858', 1, 2, 40000, '2023-09-15 11:28:58', '2023-09-15 11:28:58'),
(4, 'mtr-20230918-104411', 1, 2, 23000, '2023-09-18 16:44:11', '2023-09-18 16:44:11'),
(5, 'mtr-20230920-105833', 1, 2, 22416, '2023-09-20 16:58:33', '2023-09-20 16:58:33'),
(6, 'mtr-20230921-102848', 1, 2, 11700, '2023-09-21 16:28:48', '2023-09-21 16:28:48'),
(7, 'mtr-20230922-084355', 1, 1, 95060, '2023-09-22 14:43:55', '2023-09-22 14:43:55'),
(8, 'mtr-20230923-083700', 1, 2, 18000, '2023-09-23 14:37:00', '2023-09-23 14:37:00'),
(9, 'mtr-20230924-105049', 1, 2, 95080, '2023-09-24 16:50:49', '2023-09-24 16:50:49'),
(10, 'mtr-20230926-093957', 1, 2, 56919, '2023-09-26 15:39:57', '2023-09-26 15:39:57'),
(11, 'mtr-20231007-100741', 1, 2, 2000, '2023-10-07 16:07:41', '2023-10-07 16:07:41');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`id`, `name`, `phone`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'test', '010000000', 'test', 0, '2023-09-09 07:32:03', '2023-09-10 04:56:06'),
(2, 'test2', '01000000000', 'tst', 1, '2023-09-10 05:40:55', '2023-09-10 05:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `owner_transections`
--

CREATE TABLE `owner_transections` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT 'transection type 1=withdwar/0=deposit',
  `amount_type` tinyint(1) NOT NULL COMMENT 'amount type 1=cash/0=bank',
  `bank_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `owner_transections`
--

INSERT INTO `owner_transections` (`id`, `owner_id`, `type`, `amount_type`, `bank_id`, `amount`, `note`, `created_at`, `updated_at`) VALUES
(2, 2, 0, 0, 1, 1000, NULL, '2023-09-10 18:00:00', '2023-09-11 03:56:12'),
(3, 2, 1, 1, NULL, 500, NULL, '2023-09-10 18:00:00', '2023-09-11 03:59:17');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_reference` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `used_points` double DEFAULT NULL,
  `change` double NOT NULL,
  `paying_method` varchar(191) NOT NULL,
  `payment_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `payment_reference`, `user_id`, `purchase_id`, `sale_id`, `cash_register_id`, `account_id`, `amount`, `used_points`, `change`, `paying_method`, `payment_note`, `created_at`, `updated_at`) VALUES
(14, 'spr-20230912-094549', 45, NULL, 15, 9, 1, 339.9, NULL, 0, 'Cash', NULL, '2023-09-12 03:45:49', '2023-09-12 03:45:49'),
(15, 'spr-20230912-095435', 45, NULL, 17, 9, 1, 279, NULL, 221, 'Cash', NULL, '2023-09-12 03:54:35', '2023-09-12 03:54:35'),
(16, 'spr-20230912-100752', 45, NULL, 18, 9, 1, 533.2, NULL, 0.79999999999995, 'Cash', NULL, '2023-09-12 04:07:52', '2023-09-12 04:07:52'),
(17, 'spr-20230912-101134', 45, NULL, 19, 9, 1, 345, NULL, 155, 'Cash', NULL, '2023-09-12 04:11:34', '2023-09-12 04:11:34'),
(18, 'spr-20230912-101536', 45, NULL, 20, 9, 1, 415.4, NULL, 599.6, 'Cash', NULL, '2023-09-12 04:15:36', '2023-09-12 04:15:36'),
(19, 'spr-20230913-064953', 45, NULL, 23, 10, 1, 2281.4, NULL, 0, 'Cash', '2281', '2023-09-13 12:49:53', '2023-09-13 12:49:53'),
(20, 'spr-20230913-065129', 45, NULL, 24, 10, 1, 306, NULL, 0, 'Cash', '305', '2023-09-13 12:51:29', '2023-09-13 12:51:29'),
(21, 'spr-20230913-070050', 45, NULL, 25, 10, 1, 345, NULL, 0, 'Cash', '400', '2023-09-13 13:00:50', '2023-09-13 13:00:50'),
(22, 'spr-20230913-070830', 45, NULL, 26, 10, 1, 748, NULL, 0, 'Cash', '800', '2023-09-13 13:08:30', '2023-09-13 13:08:30'),
(23, 'spr-20230913-070959', 45, NULL, 27, 10, 1, 149.5, NULL, 0, 'Cash', '200', '2023-09-13 13:09:59', '2023-09-13 13:09:59'),
(24, 'spr-20230913-072749', 45, NULL, 28, 10, 1, 138, NULL, 0, 'Cash', '500', '2023-09-13 13:27:49', '2023-09-13 13:27:49'),
(25, 'spr-20230913-073658', 45, NULL, 29, 10, 1, 7497, NULL, 0, 'Cash', '7497', '2023-09-13 13:36:58', '2023-09-13 13:36:58'),
(26, 'spr-20230913-074148', 45, NULL, 30, 10, 1, 5364, NULL, 300, 'Cash', NULL, '2023-09-13 13:41:48', '2023-09-13 13:41:48'),
(27, 'spr-20230913-080412', 45, NULL, 31, 10, 1, 6249.12, NULL, 0, 'Cash', NULL, '2023-09-13 14:04:12', '2023-09-13 14:04:12'),
(28, 'spr-20230913-080659', 45, NULL, 32, 10, 1, 6209.5, NULL, 0, 'Cash', NULL, '2023-09-13 14:06:59', '2023-09-13 14:06:59'),
(29, 'spr-20230913-080720', 45, NULL, 33, 10, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-13 14:07:20', '2023-09-13 14:07:20'),
(30, 'spr-20230913-080735', 45, NULL, 34, 10, 1, 138, NULL, 0, 'Cash', NULL, '2023-09-13 14:07:35', '2023-09-13 14:07:35'),
(31, 'spr-20230913-081308', 45, NULL, 35, 10, 1, 585, NULL, 0, 'Cash', NULL, '2023-09-13 14:13:08', '2023-09-13 14:13:08'),
(32, 'spr-20230913-081457', 45, NULL, 36, 10, 1, 559, NULL, 0, 'Cash', NULL, '2023-09-13 14:14:57', '2023-09-13 14:14:57'),
(33, 'spr-20230913-081621', 45, NULL, 37, 10, 1, 714, NULL, 0, 'Cash', NULL, '2023-09-13 14:16:21', '2023-09-13 14:16:21'),
(34, 'spr-20230913-081845', 45, NULL, 38, 10, 1, 317.9, NULL, 0, 'Cash', NULL, '2023-09-13 14:18:45', '2023-09-13 14:18:45'),
(35, 'spr-20230913-082505', 45, NULL, 39, 10, 1, 45, NULL, 0, 'Cash', NULL, '2023-09-13 14:25:05', '2023-09-13 14:25:05'),
(36, 'spr-20230913-082534', 45, NULL, 40, 10, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-13 14:25:34', '2023-09-13 14:25:34'),
(37, 'spr-20230913-082830', 45, NULL, 41, 10, 1, 845.3, NULL, 0, 'Cash', 'maidul', '2023-09-13 14:28:30', '2023-09-13 14:28:30'),
(38, 'spr-20230913-083222', 45, NULL, 42, 10, 1, 1867.6, NULL, 0, 'Cash', 'due gran castle', '2023-09-13 14:32:22', '2023-09-13 14:32:22'),
(39, 'spr-20230913-083951', 45, NULL, 43, 10, 1, 366.4, NULL, 0, 'Cash', NULL, '2023-09-13 14:39:51', '2023-09-13 14:39:51'),
(40, 'spr-20230913-085055', 45, NULL, 44, 10, 1, 676, NULL, 0, 'Cash', 'maidul h d', '2023-09-13 14:50:55', '2023-09-13 14:50:55'),
(41, 'spr-20230913-093625', 45, NULL, 45, 10, 1, 690, NULL, 0, 'Cash', NULL, '2023-09-13 15:36:25', '2023-09-13 15:36:25'),
(42, 'spr-20230914-110549', 45, NULL, 46, 10, 1, 304, NULL, 0, 'Cash', NULL, '2023-09-14 05:05:49', '2023-09-14 05:05:49'),
(43, 'spr-20230914-035915', 45, NULL, 47, 11, 1, 1125, NULL, 0, 'Cash', NULL, '2023-09-14 09:59:15', '2023-09-14 09:59:15'),
(44, 'spr-20230914-040007', 45, NULL, 48, 11, 1, 92, NULL, 0, 'Cash', NULL, '2023-09-14 10:00:07', '2023-09-14 10:00:07'),
(45, 'spr-20230914-040121', 45, NULL, 49, 11, 1, 2250, NULL, 0, 'Cash', NULL, '2023-09-14 10:01:21', '2023-09-14 10:01:21'),
(46, 'spr-20230914-040232', 45, NULL, 50, 11, 1, 450, NULL, 0, 'Cash', NULL, '2023-09-14 10:02:32', '2023-09-14 10:02:32'),
(47, 'spr-20230914-040255', 45, NULL, 51, 11, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-14 10:02:55', '2023-09-14 10:02:55'),
(48, 'spr-20230914-042722', 45, NULL, 52, 11, 1, 5876, NULL, 0, 'Cash', NULL, '2023-09-14 10:27:22', '2023-09-14 10:27:22'),
(49, 'spr-20230914-043015', 45, NULL, 53, 11, 1, 12840, NULL, 0, 'Cash', NULL, '2023-09-14 10:30:15', '2023-09-14 10:30:15'),
(50, 'spr-20230914-043040', 45, NULL, 54, 11, 1, 130, NULL, 0, 'Cash', NULL, '2023-09-14 10:30:40', '2023-09-14 10:30:40'),
(51, 'spr-20230914-043323', 45, NULL, 55, 11, 1, 1525, NULL, 0, 'Cash', NULL, '2023-09-14 10:33:23', '2023-09-14 10:33:23'),
(52, 'spr-20230914-050119', 45, NULL, 56, 11, 1, 477.4, NULL, 0, 'Cash', NULL, '2023-09-14 11:01:19', '2023-09-14 11:01:19'),
(53, 'spr-20230914-053421', 45, NULL, 57, 11, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-14 11:34:21', '2023-09-14 11:34:21'),
(54, 'spr-20230914-064102', 45, NULL, 58, 11, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-14 12:41:02', '2023-09-14 12:41:02'),
(55, 'spr-20230914-064119', 45, NULL, 59, 11, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-14 12:41:19', '2023-09-14 12:41:19'),
(56, 'spr-20230914-064720', 45, NULL, 60, 11, 1, 481, NULL, 0, 'Cash', NULL, '2023-09-14 12:47:20', '2023-09-14 12:47:20'),
(57, 'spr-20230914-064748', 45, NULL, 61, 11, 1, 598, NULL, 0, 'Cash', NULL, '2023-09-14 12:47:48', '2023-09-14 12:47:48'),
(58, 'spr-20230914-065054', 45, NULL, 62, 11, 1, 902.1, NULL, 0, 'Cash', NULL, '2023-09-14 12:50:54', '2023-09-14 12:50:54'),
(59, 'spr-20230914-065150', 45, NULL, 63, 11, 1, 138, NULL, 0, 'Cash', NULL, '2023-09-14 12:51:50', '2023-09-14 12:51:50'),
(60, 'spr-20230914-070053', 45, NULL, 64, 11, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-14 13:00:53', '2023-09-14 13:00:53'),
(61, 'spr-20230914-070441', 45, NULL, 65, 11, 1, 96, NULL, 0, 'Cash', NULL, '2023-09-14 13:04:41', '2023-09-14 13:04:41'),
(62, 'spr-20230914-070749', 45, NULL, 66, 11, 1, 229.4, NULL, 0, 'Cash', NULL, '2023-09-14 13:07:49', '2023-09-14 13:07:49'),
(63, 'spr-20230914-072824', 45, NULL, 67, 11, 1, 682, NULL, 0, 'Cash', NULL, '2023-09-14 13:28:24', '2023-09-14 13:28:24'),
(64, 'spr-20230914-074502', 45, NULL, 68, 11, 1, 660, NULL, 0, 'Cash', NULL, '2023-09-14 13:45:02', '2023-09-14 13:45:02'),
(65, 'spr-20230914-075416', 45, NULL, 69, 11, 1, 3864.48, NULL, 0, 'Cash', NULL, '2023-09-14 13:54:16', '2023-09-14 13:54:16'),
(66, 'spr-20230914-075618', 45, NULL, 70, 11, 1, 2920, NULL, 0, 'Cash', NULL, '2023-09-14 13:56:18', '2023-09-14 13:56:18'),
(67, 'spr-20230914-080228', 45, NULL, 71, 11, 1, 2700, NULL, 0, 'Cash', NULL, '2023-09-14 14:02:28', '2023-09-14 14:02:28'),
(68, 'spr-20230914-081802', 45, NULL, 72, 11, 1, 1105, NULL, 0, 'Cash', NULL, '2023-09-14 14:18:02', '2023-09-14 14:18:02'),
(69, 'spr-20230914-082035', 45, NULL, 73, 11, 1, 442, NULL, 0, 'Cash', NULL, '2023-09-14 14:20:35', '2023-09-14 14:20:35'),
(70, 'spr-20230914-082150', 45, NULL, 74, 11, 1, 170.5, NULL, 0, 'Cash', NULL, '2023-09-14 14:21:50', '2023-09-14 14:21:50'),
(71, 'spr-20230914-082232', 45, NULL, 75, 11, 1, 138, NULL, 0, 'Cash', NULL, '2023-09-14 14:22:32', '2023-09-14 14:22:32'),
(72, 'spr-20230914-082336', 45, NULL, 76, 11, 1, 353.6, NULL, 0, 'Cash', NULL, '2023-09-14 14:23:36', '2023-09-14 14:23:36'),
(73, 'spr-20230914-082353', 45, NULL, 77, 11, 1, 138, NULL, 0, 'Cash', NULL, '2023-09-14 14:23:53', '2023-09-14 14:23:53'),
(74, 'spr-20230914-084045', 45, NULL, 78, 11, 1, 350.2, NULL, 0, 'Cash', NULL, '2023-09-14 14:40:45', '2023-09-14 14:40:45'),
(75, 'spr-20230914-101702', 45, NULL, 79, 11, 1, 195, NULL, 0, 'Cash', NULL, '2023-09-14 16:17:02', '2023-09-14 16:17:02'),
(76, 'spr-20230915-041957', 45, NULL, 80, 11, 1, 992, NULL, 0, 'Cash', NULL, '2023-09-15 10:19:57', '2023-09-15 10:19:57'),
(77, 'spr-20230915-042046', 45, NULL, 81, 11, 1, 559, NULL, 0, 'Cash', NULL, '2023-09-15 10:20:46', '2023-09-15 10:20:46'),
(78, 'spr-20230915-042610', 45, NULL, 82, 11, 1, 9125.6, NULL, 0, 'Cash', NULL, '2023-09-15 10:26:10', '2023-09-15 10:26:10'),
(79, 'spr-20230915-042941', 45, NULL, 83, 11, 1, 4165, NULL, 0, 'Cash', NULL, '2023-09-15 10:29:41', '2023-09-15 10:29:41'),
(80, 'spr-20230915-051144', 45, NULL, 84, 11, 1, 4520, NULL, 0, 'Cash', NULL, '2023-09-15 11:11:44', '2023-09-15 11:11:44'),
(81, 'spr-20230915-052211', 45, NULL, 85, 12, 1, 170, NULL, 0, 'Cash', NULL, '2023-09-15 11:22:11', '2023-09-15 11:22:11'),
(82, 'spr-20230915-054236', 45, NULL, 86, 12, 1, 28420, NULL, 0, 'Cash', NULL, '2023-09-15 11:42:36', '2023-09-15 11:42:36'),
(83, 'spr-20230915-060508', 45, NULL, 87, 12, 1, 16750, NULL, 0, 'Cash', NULL, '2023-09-15 12:05:08', '2023-09-15 12:05:08'),
(84, 'spr-20230915-064708', 45, NULL, 88, 12, 1, 17063, NULL, 0, 'Cash', NULL, '2023-09-15 12:47:08', '2023-09-15 12:47:08'),
(85, 'spr-20230915-065213', 45, NULL, 89, 12, 1, 292.5, NULL, 0, 'Cash', NULL, '2023-09-15 12:52:13', '2023-09-15 12:52:13'),
(86, 'spr-20230915-065614', 45, NULL, 90, 12, 1, 340, NULL, 0, 'Cash', NULL, '2023-09-15 12:56:14', '2023-09-15 12:56:14'),
(87, 'spr-20230915-070025', 45, NULL, 91, 12, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-15 13:00:25', '2023-09-15 13:00:25'),
(88, 'spr-20230915-070156', 45, NULL, 92, 12, 1, 839.1, NULL, 0, 'Cash', NULL, '2023-09-15 13:01:56', '2023-09-15 13:01:56'),
(89, 'spr-20230915-070357', 45, NULL, 93, 12, 1, 32.5, NULL, 0, 'Cash', NULL, '2023-09-15 13:03:57', '2023-09-15 13:03:57'),
(90, 'spr-20230916-012258', 45, NULL, 94, 12, 1, 340, NULL, 0, 'Cash', NULL, '2023-09-16 07:22:58', '2023-09-16 07:22:58'),
(91, 'spr-20230916-013037', 45, NULL, 95, 12, 1, 340, NULL, 0, 'Cash', NULL, '2023-09-16 07:30:37', '2023-09-16 07:30:37'),
(92, 'spr-20230916-023811', 45, NULL, 96, 12, 1, 92, NULL, 0, 'Cash', NULL, '2023-09-16 08:38:11', '2023-09-16 08:38:11'),
(93, 'spr-20230916-023856', 45, NULL, 97, 12, 1, 2350, NULL, 0, 'Cash', NULL, '2023-09-16 08:38:56', '2023-09-16 08:38:56'),
(94, 'spr-20230916-023923', 45, NULL, 98, 12, 1, 2800, NULL, 0, 'Cash', NULL, '2023-09-16 08:39:23', '2023-09-16 08:39:23'),
(95, 'spr-20230916-023948', 45, NULL, 99, 12, 1, 2250, NULL, 0, 'Cash', NULL, '2023-09-16 08:39:48', '2023-09-16 08:39:48'),
(96, 'spr-20230916-024002', 45, NULL, 100, 12, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-16 08:40:02', '2023-09-16 08:40:02'),
(97, 'spr-20230916-024017', 45, NULL, 101, 12, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-16 08:40:17', '2023-09-16 08:40:17'),
(98, 'spr-20230916-024111', 45, NULL, 102, 12, 1, 168.5, NULL, 0, 'Cash', NULL, '2023-09-16 08:41:11', '2023-09-16 08:41:11'),
(99, 'spr-20230916-024137', 45, NULL, 103, 12, 1, 1120, NULL, 0, 'Cash', NULL, '2023-09-16 08:41:37', '2023-09-16 08:41:37'),
(100, 'spr-20230916-024223', 45, NULL, 104, 12, 1, 195, NULL, 0, 'Cash', NULL, '2023-09-16 08:42:23', '2023-09-16 08:42:23'),
(101, 'spr-20230916-024301', 45, NULL, 105, 12, 1, 330, NULL, 0, 'Cash', NULL, '2023-09-16 08:43:01', '2023-09-16 08:43:01'),
(102, 'spr-20230916-024326', 45, NULL, 106, 12, 1, 340, NULL, 0, 'Cash', NULL, '2023-09-16 08:43:26', '2023-09-16 08:43:26'),
(103, 'spr-20230916-024337', 45, NULL, 107, 12, 1, 138, NULL, 0, 'Cash', NULL, '2023-09-16 08:43:37', '2023-09-16 08:43:37'),
(104, 'spr-20230916-024407', 45, NULL, 108, 12, 1, 713, NULL, 0, 'Cash', NULL, '2023-09-16 08:44:07', '2023-09-16 08:44:07'),
(105, 'spr-20230916-024429', 45, NULL, 109, 12, 1, 120, NULL, 0, 'Cash', NULL, '2023-09-16 08:44:29', '2023-09-16 08:44:29'),
(106, 'spr-20230916-024447', 45, NULL, 110, 12, 1, 257.3, NULL, 0, 'Cash', NULL, '2023-09-16 08:44:47', '2023-09-16 08:44:47'),
(107, 'spr-20230916-024522', 45, NULL, 111, 12, 1, 3375, NULL, 0, 'Cash', NULL, '2023-09-16 08:45:22', '2023-09-16 08:45:22'),
(108, 'spr-20230916-024555', 45, NULL, 112, 12, 1, 500, NULL, 0, 'Cash', NULL, '2023-09-16 08:45:55', '2023-09-16 08:45:55'),
(109, 'spr-20230916-024616', 45, NULL, 113, 12, 1, 1380, NULL, 0, 'Cash', NULL, '2023-09-16 08:46:16', '2023-09-16 08:46:16'),
(110, 'spr-20230916-024632', 45, NULL, 114, 12, 1, 690, NULL, 0, 'Cash', NULL, '2023-09-16 08:46:32', '2023-09-16 08:46:32'),
(111, 'spr-20230916-025040', 45, NULL, 115, 12, 1, 1600, NULL, 0, 'Cash', NULL, '2023-09-16 08:50:40', '2023-09-16 08:50:40'),
(112, 'spr-20230916-025213', 45, NULL, 116, 12, 1, 5650, NULL, 0, 'Cash', NULL, '2023-09-16 08:52:13', '2023-09-16 08:52:13'),
(113, 'spr-20230916-025644', 45, NULL, 117, 12, 1, 394.4, NULL, 0, 'Cash', NULL, '2023-09-16 08:56:44', '2023-09-16 08:56:44'),
(114, 'spr-20230916-025707', 45, NULL, 118, 12, 1, 340, NULL, 0, 'Cash', NULL, '2023-09-16 08:57:07', '2023-09-16 08:57:07'),
(115, 'spr-20230916-025741', 45, NULL, 119, 12, 1, 1000, NULL, 0, 'Cash', NULL, '2023-09-16 08:57:41', '2023-09-16 08:57:41'),
(116, 'spr-20230916-025758', 45, NULL, 120, 12, 1, 314.5, NULL, 0, 'Cash', NULL, '2023-09-16 08:57:58', '2023-09-16 08:57:58'),
(117, 'spr-20230916-025854', 45, NULL, 121, 12, 1, 1500.8, NULL, 0, 'Cash', NULL, '2023-09-16 08:58:54', '2023-09-16 08:58:54'),
(118, 'spr-20230916-025915', 45, NULL, 122, 12, 1, 329.8, NULL, 0, 'Cash', NULL, '2023-09-16 08:59:15', '2023-09-16 08:59:15'),
(119, 'spr-20230916-025941', 45, NULL, 123, 12, 1, 263.5, NULL, 0, 'Cash', NULL, '2023-09-16 08:59:41', '2023-09-16 08:59:41'),
(120, 'spr-20230916-025955', 45, NULL, 124, 12, 1, 368.9, NULL, 0, 'Cash', NULL, '2023-09-16 08:59:55', '2023-09-16 08:59:55'),
(121, 'spr-20230916-030050', 45, NULL, 125, 12, 1, 300.4, NULL, 0, 'Cash', NULL, '2023-09-16 09:00:50', '2023-09-16 09:00:50'),
(122, 'spr-20230916-030103', 45, NULL, 126, 12, 1, 326.4, NULL, 0, 'Cash', NULL, '2023-09-16 09:01:03', '2023-09-16 09:01:03'),
(123, 'spr-20230916-030126', 45, NULL, 127, 12, 1, 425, NULL, 0, 'Cash', NULL, '2023-09-16 09:01:26', '2023-09-16 09:01:26'),
(124, 'spr-20230916-030217', 45, NULL, 128, 12, 1, 368.9, NULL, 0, 'Cash', NULL, '2023-09-16 09:02:17', '2023-09-16 09:02:17'),
(125, 'spr-20230916-030331', 45, NULL, 129, 12, 1, 1017, NULL, 0, 'Cash', NULL, '2023-09-16 09:03:31', '2023-09-16 09:03:31'),
(126, 'spr-20230916-045414', 45, NULL, 130, 12, 1, 1125, NULL, 0, 'Cash', NULL, '2023-09-16 10:54:14', '2023-09-16 10:54:14'),
(127, 'spr-20230916-045455', 45, NULL, 131, 12, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-16 10:54:55', '2023-09-16 10:54:55'),
(128, 'spr-20230916-045520', 45, NULL, 132, 12, 1, 1125, NULL, 0, 'Cash', NULL, '2023-09-16 10:55:20', '2023-09-16 10:55:20'),
(129, 'spr-20230916-045623', 45, NULL, 133, 12, 1, 297.6, NULL, 0, 'Cash', NULL, '2023-09-16 10:56:23', '2023-09-16 10:56:23'),
(130, 'spr-20230916-045644', 45, NULL, 134, 12, 1, 390, NULL, 0, 'Cash', NULL, '2023-09-16 10:56:44', '2023-09-16 10:56:44'),
(131, 'spr-20230916-053920', 45, NULL, 135, 12, 1, 580, NULL, 0, 'Cash', NULL, '2023-09-16 11:39:20', '2023-09-16 11:39:20'),
(132, 'spr-20230916-054942', 45, NULL, 136, 12, 1, 260, NULL, 0, 'Cash', NULL, '2023-09-16 11:49:42', '2023-09-16 11:49:42'),
(133, 'spr-20230916-055324', 45, NULL, 137, 12, 1, 325, NULL, 0, 'Cash', NULL, '2023-09-16 11:53:24', '2023-09-16 11:53:24'),
(134, 'spr-20230916-061216', 45, NULL, 138, 12, 1, 839.8, NULL, 0, 'Cash', NULL, '2023-09-16 12:12:16', '2023-09-16 12:12:16'),
(135, 'spr-20230916-063352', 45, NULL, 139, 12, 1, 289, NULL, 0, 'Cash', NULL, '2023-09-16 12:33:52', '2023-09-16 12:33:52'),
(136, 'spr-20230916-064850', 45, NULL, 140, 12, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-16 12:48:50', '2023-09-16 12:48:50'),
(137, 'spr-20230916-065315', 45, NULL, 141, 12, 1, 1300, NULL, 0, 'Cash', NULL, '2023-09-16 12:53:15', '2023-09-16 12:53:15'),
(138, 'spr-20230916-070453', 45, NULL, 142, 12, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-16 13:04:53', '2023-09-16 13:04:53'),
(139, 'spr-20230916-080413', 45, NULL, 143, 12, 1, 59064, NULL, 0, 'Cash', NULL, '2023-09-16 14:04:13', '2023-09-16 14:04:13'),
(140, 'spr-20230916-080510', 45, NULL, 144, 12, 1, 4704, NULL, 0, 'Cash', NULL, '2023-09-16 14:05:10', '2023-09-16 14:05:10'),
(141, 'spr-20230916-081109', 45, NULL, 145, 12, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-16 14:11:09', '2023-09-16 14:11:09'),
(142, 'spr-20230916-081242', 45, NULL, 146, 12, 1, 275.4, NULL, 0, 'Cash', NULL, '2023-09-16 14:12:42', '2023-09-16 14:12:42'),
(143, 'spr-20230916-082513', 45, NULL, 147, 12, 1, 1865.6, NULL, 0, 'Cash', NULL, '2023-09-16 14:25:13', '2023-09-16 14:25:13'),
(144, 'spr-20230916-083955', 45, NULL, 148, 12, 1, 162.5, NULL, 0, 'Cash', NULL, '2023-09-16 14:39:55', '2023-09-16 14:39:55'),
(145, 'spr-20230917-095353', 45, NULL, 149, 13, 1, 640, NULL, 0, 'Cash', NULL, '2023-09-17 03:53:53', '2023-09-17 03:53:53'),
(146, 'spr-20230917-095444', 45, NULL, 150, 13, 1, 198, NULL, 0, 'Cash', NULL, '2023-09-17 03:54:44', '2023-09-17 03:54:44'),
(147, 'spr-20230917-095506', 45, NULL, 151, 13, 1, 340, NULL, 0, 'Cash', NULL, '2023-09-17 03:55:06', '2023-09-17 03:55:06'),
(148, 'spr-20230917-105628', 45, NULL, 152, 13, 1, 690, NULL, 0, 'Cash', NULL, '2023-09-17 04:56:28', '2023-09-17 04:56:28'),
(149, 'spr-20230917-110221', 45, NULL, 153, 13, 1, 30, NULL, 0, 'Cash', NULL, '2023-09-17 05:02:21', '2023-09-17 05:02:21'),
(150, 'spr-20230917-110420', 45, NULL, 154, 13, 1, 311.1, NULL, 0, 'Cash', NULL, '2023-09-17 05:04:20', '2023-09-17 05:04:20'),
(151, 'spr-20230917-111330', 45, NULL, 155, 13, 1, 11.5, NULL, 0, 'Cash', NULL, '2023-09-17 05:13:30', '2023-09-17 05:13:30'),
(152, 'spr-20230917-112216', 45, NULL, 156, 13, 1, 330, NULL, 0, 'Cash', '1020', '2023-09-17 05:22:16', '2023-09-17 05:22:16'),
(153, 'spr-20230917-112456', 45, NULL, 157, 13, 1, 1680, NULL, 0, 'Cash', NULL, '2023-09-17 05:24:56', '2023-09-17 05:24:56'),
(154, 'spr-20230917-112834', 45, NULL, 158, 13, 1, 3360, NULL, 0, 'Cash', NULL, '2023-09-17 05:28:34', '2023-09-17 05:28:34'),
(155, 'spr-20230917-115244', 45, NULL, 159, 13, 1, 582.1, NULL, 0, 'Cash', '700', '2023-09-17 05:52:44', '2023-09-17 05:52:44'),
(156, 'spr-20230917-115646', 45, NULL, 160, 13, 1, 260.1, NULL, 0, 'Cash', '500', '2023-09-17 05:56:46', '2023-09-17 05:56:46'),
(157, 'spr-20230917-122737', 45, NULL, 161, 13, 1, 501.89, NULL, 0, 'Cash', NULL, '2023-09-17 06:27:37', '2023-09-17 06:27:37'),
(158, 'spr-20230917-122813', 45, NULL, 162, 13, 1, 120, NULL, 0, 'Cash', NULL, '2023-09-17 06:28:13', '2023-09-17 06:28:13'),
(159, 'spr-20230917-125847', 45, NULL, 163, 13, 1, 900, NULL, 0, 'Cash', NULL, '2023-09-17 06:58:47', '2023-09-17 06:58:47'),
(160, 'spr-20230917-011058', 45, NULL, 164, 13, 1, 3562.5, NULL, 0, 'Cash', NULL, '2023-09-17 07:10:58', '2023-09-17 07:10:58'),
(161, 'spr-20230917-013341', 45, NULL, 165, 13, 1, 195, NULL, 0, 'Cash', NULL, '2023-09-17 07:33:41', '2023-09-17 07:33:41'),
(162, 'spr-20230917-013442', 45, NULL, 166, 13, 1, 92, NULL, 0, 'Cash', NULL, '2023-09-17 07:34:42', '2023-09-17 07:34:42'),
(163, 'spr-20230917-013502', 45, NULL, 167, 13, 1, 46, NULL, 0, 'Cash', NULL, '2023-09-17 07:35:02', '2023-09-17 07:35:02'),
(164, 'spr-20230917-014611', 45, NULL, 168, 13, 1, 1120, NULL, 0, 'Cash', NULL, '2023-09-17 07:46:11', '2023-09-17 07:46:11'),
(165, 'spr-20230917-021325', 45, NULL, 169, 13, 1, 351.3, NULL, 0, 'Cash', NULL, '2023-09-17 08:13:25', '2023-09-17 08:13:25'),
(166, 'spr-20230917-021638', 45, NULL, 170, 13, 1, 225, NULL, 0, 'Cash', NULL, '2023-09-17 08:16:38', '2023-09-17 08:16:38'),
(167, 'spr-20230917-050505', 45, NULL, 171, 13, 1, 46, NULL, 0, 'Cash', NULL, '2023-09-17 11:05:05', '2023-09-17 11:05:05'),
(168, 'spr-20230917-050644', 45, NULL, 172, 13, 1, 477.4, NULL, 0, 'Cash', NULL, '2023-09-17 11:06:44', '2023-09-17 11:06:44'),
(169, 'spr-20230917-050735', 45, NULL, 173, 13, 1, 691.3, NULL, 0, 'Cash', NULL, '2023-09-17 11:07:35', '2023-09-17 11:07:35'),
(170, 'spr-20230917-050757', 45, NULL, 174, 13, 1, 195, NULL, 0, 'Cash', NULL, '2023-09-17 11:07:57', '2023-09-17 11:07:57'),
(171, 'spr-20230917-051437', 45, NULL, 175, 13, 1, 339, NULL, 0, 'Cash', NULL, '2023-09-17 11:14:37', '2023-09-17 11:14:37'),
(172, 'spr-20230917-054633', 45, NULL, 176, 13, 1, 1350, NULL, 0, 'Cash', NULL, '2023-09-17 11:46:33', '2023-09-17 11:46:33'),
(173, 'spr-20230917-054919', 45, NULL, 177, 13, 1, 4520, NULL, 0, 'Cash', NULL, '2023-09-17 11:49:19', '2023-09-17 11:49:19'),
(174, 'spr-20230917-054950', 45, NULL, 178, 13, 1, 678, NULL, 0, 'Cash', NULL, '2023-09-17 11:49:50', '2023-09-17 11:49:50'),
(175, 'spr-20230917-055048', 45, NULL, 179, 13, 1, 690, NULL, 0, 'Cash', NULL, '2023-09-17 11:50:48', '2023-09-17 11:50:48'),
(176, 'spr-20230917-055749', 45, NULL, 180, 13, 1, 640, NULL, 0, 'Cash', NULL, '2023-09-17 11:57:49', '2023-09-17 11:57:49'),
(177, 'spr-20230917-055952', 45, NULL, 181, 13, 1, 5695.2, NULL, 0, 'Cash', NULL, '2023-09-17 11:59:52', '2023-09-17 11:59:52'),
(178, 'spr-20230917-060743', 45, NULL, 182, 13, 1, 374, NULL, 0, 'Cash', NULL, '2023-09-17 12:07:43', '2023-09-17 12:07:43'),
(179, 'spr-20230917-061327', 45, NULL, 183, 13, 1, 97.5, NULL, 0, 'Cash', NULL, '2023-09-17 12:13:27', '2023-09-17 12:13:27'),
(180, 'spr-20230917-065430', 45, NULL, 184, 13, 1, 507, NULL, 0, 'Cash', NULL, '2023-09-17 12:54:30', '2023-09-17 12:54:30'),
(181, 'spr-20230917-071626', 45, NULL, 185, 13, 1, 678.9, NULL, 0, 'Cash', NULL, '2023-09-17 13:16:26', '2023-09-17 13:16:26'),
(182, 'spr-20230917-073638', 45, NULL, 186, 13, 1, 1300, NULL, 0, 'Cash', NULL, '2023-09-17 13:36:38', '2023-09-17 13:36:38'),
(183, 'spr-20230917-075707', 45, NULL, 187, 13, 1, 360.1, NULL, 0, 'Cash', NULL, '2023-09-17 13:57:07', '2023-09-17 13:57:07'),
(184, 'spr-20230917-080110', 45, NULL, 188, 13, 1, 759.9, NULL, 0, 'Cash', NULL, '2023-09-17 14:01:10', '2023-09-17 14:01:10'),
(185, 'spr-20230917-080301', 45, NULL, 189, 13, 1, 6720, NULL, 0, 'Cash', NULL, '2023-09-17 14:03:01', '2023-09-17 14:03:01'),
(186, 'spr-20230917-081436', 45, NULL, 190, 13, 1, 714, NULL, 0, 'Cash', NULL, '2023-09-17 14:14:36', '2023-09-17 14:14:36'),
(187, 'spr-20230918-100514', 45, NULL, 191, NULL, 1, 455.6, NULL, 0, 'Cash', NULL, '2023-09-18 04:05:14', '2023-09-18 04:05:14'),
(188, 'spr-20230918-100833', 45, NULL, 192, 14, 1, 483, NULL, 0, 'Cash', NULL, '2023-09-18 04:08:33', '2023-09-18 04:08:33'),
(189, 'spr-20230918-101319', 45, NULL, 193, 14, 1, 675, NULL, 0, 'Cash', NULL, '2023-09-18 04:13:19', '2023-09-18 04:13:19'),
(190, 'spr-20230918-103041', 45, NULL, 194, 14, 1, 92, NULL, 0, 'Cash', NULL, '2023-09-18 04:30:41', '2023-09-18 04:30:41'),
(191, 'spr-20230918-111034', 45, NULL, 195, 14, 1, 195.5, NULL, 0, 'Cash', NULL, '2023-09-18 05:10:34', '2023-09-18 05:10:34'),
(192, 'spr-20230918-111227', 45, NULL, 196, 14, 1, 200, NULL, 0, 'Cash', NULL, '2023-09-18 05:12:27', '2023-09-18 05:12:27'),
(193, 'spr-20230918-111326', 45, NULL, 197, 14, 1, 1120, NULL, 0, 'Cash', NULL, '2023-09-18 05:13:26', '2023-09-18 05:13:26'),
(194, 'spr-20230918-111434', 45, NULL, 198, 14, 1, 368.9, NULL, 0, 'Cash', NULL, '2023-09-18 05:14:34', '2023-09-18 05:14:34'),
(195, 'spr-20230918-111734', 45, NULL, 199, 14, 1, 576, NULL, 0, 'Cash', NULL, '2023-09-18 05:17:34', '2023-09-18 05:17:34'),
(196, 'spr-20230918-111834', 45, NULL, 200, 14, 1, 520, NULL, 0, 'Cash', NULL, '2023-09-18 05:18:34', '2023-09-18 05:18:34'),
(197, 'spr-20230918-111941', 45, NULL, 201, 14, 1, 3375, NULL, 0, 'Cash', NULL, '2023-09-18 05:19:41', '2023-09-18 05:19:41'),
(198, 'spr-20230918-114835', 45, NULL, 202, 14, 1, 243.1, NULL, 0, 'Cash', NULL, '2023-09-18 05:48:35', '2023-09-18 05:48:35'),
(199, 'spr-20230918-120820', 45, NULL, 203, 14, 1, 214.2, NULL, 0, 'Cash', NULL, '2023-09-18 06:08:20', '2023-09-18 06:08:20'),
(200, 'spr-20230918-121003', 45, NULL, 204, 14, 1, 768, NULL, 0, 'Cash', NULL, '2023-09-18 06:10:03', '2023-09-18 06:10:03'),
(201, 'spr-20230918-121945', 45, NULL, 205, 14, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-18 06:19:45', '2023-09-18 06:19:45'),
(202, 'spr-20230918-122114', 45, NULL, 206, 14, 1, 520, NULL, 0, 'Cash', NULL, '2023-09-18 06:21:14', '2023-09-18 06:21:14'),
(203, 'spr-20230918-124518', 45, NULL, 207, 14, 1, 1125, NULL, 0, 'Cash', NULL, '2023-09-18 06:45:18', '2023-09-18 06:45:18'),
(205, 'spr-20230918-124753', 45, NULL, 209, 14, 1, 370, NULL, 0, 'Cash', NULL, '2023-09-18 06:47:53', '2023-09-18 06:47:53'),
(206, 'spr-20230918-124834', 45, NULL, 210, 14, 1, 335, NULL, 0, 'Cash', NULL, '2023-09-18 06:48:34', '2023-09-18 06:48:34'),
(207, 'spr-20230918-124914', 45, NULL, 211, 14, 1, 200, NULL, 0, 'Cash', NULL, '2023-09-18 06:49:14', '2023-09-18 06:49:14'),
(208, 'spr-20230918-012200', 45, NULL, 212, 14, 1, 221, NULL, 0, 'Cash', NULL, '2023-09-18 07:22:00', '2023-09-18 07:22:00'),
(209, 'spr-20230918-020636', 45, NULL, 213, 14, 1, 1125, NULL, 0, 'Cash', NULL, '2023-09-18 08:06:36', '2023-09-18 08:06:36'),
(210, 'spr-20230918-020752', 45, NULL, 214, 14, 1, 60, NULL, 0, 'Cash', NULL, '2023-09-18 08:07:52', '2023-09-18 08:07:52'),
(211, 'spr-20230918-035145', 45, NULL, 215, 14, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-18 09:51:45', '2023-09-18 09:51:45'),
(212, 'spr-20230918-042401', 45, NULL, 216, 14, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-18 10:24:01', '2023-09-18 10:24:01'),
(213, 'spr-20230918-044547', 45, NULL, 217, 14, 1, 326.4, NULL, 0, 'Cash', NULL, '2023-09-18 10:45:47', '2023-09-18 10:45:47'),
(214, 'spr-20230918-052010', 45, NULL, 218, 14, 1, 1125, NULL, 0, 'Cash', NULL, '2023-09-18 11:20:10', '2023-09-18 11:20:10'),
(215, 'spr-20230918-052809', 45, NULL, 219, 14, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-18 11:28:09', '2023-09-18 11:28:09'),
(216, 'spr-20230918-053726', 45, NULL, 220, 14, 1, 2764.8, NULL, 0, 'Cash', NULL, '2023-09-18 11:37:26', '2023-09-18 11:37:26'),
(217, 'spr-20230918-053834', 45, NULL, 221, 14, 1, 548.1, NULL, 0, 'Cash', NULL, '2023-09-18 11:38:34', '2023-09-18 11:38:34'),
(218, 'spr-20230918-055817', 45, NULL, 222, 14, 1, 224, NULL, 0, 'Cash', NULL, '2023-09-18 11:58:17', '2023-09-18 11:58:17'),
(219, 'spr-20230918-055913', 45, NULL, 223, 14, 1, 753.3, NULL, 0, 'Cash', NULL, '2023-09-18 11:59:13', '2023-09-18 11:59:13'),
(220, 'spr-20230918-060928', 45, NULL, 224, 14, 1, 1680, NULL, 0, 'Cash', NULL, '2023-09-18 12:09:28', '2023-09-18 12:09:28'),
(221, 'spr-20230918-060959', 45, NULL, 225, 14, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-18 12:09:59', '2023-09-18 12:09:59'),
(222, 'spr-20230918-062415', 45, NULL, 226, 14, 1, 315.9, NULL, 0, 'Cash', NULL, '2023-09-18 12:24:15', '2023-09-18 12:24:15'),
(223, 'spr-20230918-063947', 45, NULL, 227, 14, 1, 46, NULL, 0, 'Cash', NULL, '2023-09-18 12:39:47', '2023-09-18 12:39:47'),
(224, 'spr-20230918-064019', 45, NULL, 228, 14, 1, 130, NULL, 0, 'Cash', NULL, '2023-09-18 12:40:19', '2023-09-18 12:40:19'),
(225, 'spr-20230918-064343', 45, NULL, 229, 14, 1, 520, NULL, 0, 'Cash', NULL, '2023-09-18 12:43:43', '2023-09-18 12:43:43'),
(226, 'spr-20230918-065445', 45, NULL, 230, 14, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-18 12:54:45', '2023-09-18 12:54:45'),
(227, 'spr-20230918-071517', 45, NULL, 231, 14, 1, 340, NULL, 0, 'Cash', NULL, '2023-09-18 13:15:17', '2023-09-18 13:15:17'),
(228, 'spr-20230918-072151', 45, NULL, 232, 14, 1, 2144, NULL, 0, 'Cash', NULL, '2023-09-18 13:21:51', '2023-09-18 13:21:51'),
(229, 'spr-20230918-073207', 45, NULL, 233, 14, 1, 335, NULL, 0, 'Cash', NULL, '2023-09-18 13:32:07', '2023-09-18 13:32:07'),
(230, 'spr-20230918-073243', 45, NULL, 234, 14, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-18 13:32:43', '2023-09-18 13:32:43'),
(231, 'spr-20230918-073824', 45, NULL, 235, 14, 1, 184, NULL, 0, 'Cash', NULL, '2023-09-18 13:38:24', '2023-09-18 13:38:24'),
(232, 'spr-20230918-074244', 45, NULL, 236, 14, 1, 263.5, NULL, 0, 'Cash', NULL, '2023-09-18 13:42:44', '2023-09-18 13:42:44'),
(233, 'spr-20230918-074258', 45, NULL, 237, 14, 1, 92, NULL, 0, 'Cash', NULL, '2023-09-18 13:42:58', '2023-09-18 13:42:58'),
(234, 'spr-20230918-075041', 45, NULL, 238, 14, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-18 13:50:41', '2023-09-18 13:50:41'),
(235, 'spr-20230918-075344', 45, NULL, 239, 14, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-18 13:53:44', '2023-09-18 13:53:44'),
(236, 'spr-20230918-080854', 45, NULL, 240, 14, 1, 209.1, NULL, 0, 'Cash', NULL, '2023-09-18 14:08:54', '2023-09-18 14:08:54'),
(237, 'spr-20230918-080928', 45, NULL, 241, 14, 1, 709.9, NULL, 0, 'Cash', NULL, '2023-09-18 14:09:28', '2023-09-18 14:09:28'),
(238, 'spr-20230918-080956', 45, NULL, 242, 14, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-18 14:09:56', '2023-09-18 14:09:56'),
(239, 'spr-20230918-081059', 45, NULL, 243, 14, 1, 240, NULL, 0, 'Cash', NULL, '2023-09-18 14:10:59', '2023-09-18 14:10:59'),
(240, 'spr-20230918-082456', 45, NULL, 244, 14, 1, 3729, NULL, 0, 'Cash', NULL, '2023-09-18 14:24:56', '2023-09-18 14:24:56'),
(241, 'spr-20230918-084853', 45, NULL, 245, 14, 1, 575, NULL, 0, 'Cash', NULL, '2023-09-18 14:48:53', '2023-09-18 14:48:53'),
(242, 'spr-20230918-085009', 45, NULL, 246, 14, 1, 560, NULL, 0, 'Cash', NULL, '2023-09-18 14:50:09', '2023-09-18 14:50:09'),
(243, 'spr-20230918-090337', 45, NULL, 247, 14, 1, 13910, NULL, 0, 'Cash', NULL, '2023-09-18 15:03:37', '2023-09-18 15:03:37'),
(244, 'spr-20230918-090824', 45, NULL, 248, 14, 1, 178.5, NULL, 0, 'Cash', NULL, '2023-09-18 15:08:24', '2023-09-18 15:08:24'),
(245, 'spr-20230918-092730', 45, NULL, 249, 14, 1, 504.9, NULL, 0, 'Cash', NULL, '2023-09-18 15:27:30', '2023-09-18 15:27:30'),
(246, 'spr-20230918-094834', 45, NULL, 250, 14, 1, 138, NULL, 0, 'Cash', NULL, '2023-09-18 15:48:34', '2023-09-18 15:48:34'),
(247, 'spr-20230919-121925', 45, NULL, 251, 15, 1, 220, NULL, 0, 'Cash', NULL, '2023-09-19 06:19:25', '2023-09-19 06:19:25'),
(248, 'spr-20230919-012922', 45, NULL, 252, 15, 1, 1680, NULL, 0, 'Cash', NULL, '2023-09-19 07:29:22', '2023-09-19 07:29:22'),
(249, 'spr-20230919-013047', 45, NULL, 253, 15, 1, 500.3, NULL, 0, 'Cash', NULL, '2023-09-19 07:30:47', '2023-09-19 07:30:47'),
(250, 'spr-20230919-013111', 45, NULL, 254, 15, 1, 130, NULL, 0, 'Cash', NULL, '2023-09-19 07:31:11', '2023-09-19 07:31:11'),
(251, 'spr-20230919-013443', 45, NULL, 255, 15, 1, 170, NULL, 0, 'Cash', NULL, '2023-09-19 07:34:43', '2023-09-19 07:34:43'),
(252, 'spr-20230919-013658', 45, NULL, 256, 15, 1, 608, NULL, 0, 'Cash', NULL, '2023-09-19 07:36:58', '2023-09-19 07:36:58'),
(253, 'spr-20230919-013920', 45, NULL, 257, 15, 1, 221, NULL, 0, 'Cash', NULL, '2023-09-19 07:39:20', '2023-09-19 07:39:20'),
(254, 'spr-20230919-014435', 45, NULL, 258, 15, 1, 347, NULL, 0, 'Cash', NULL, '2023-09-19 07:44:35', '2023-09-19 07:44:35'),
(255, 'spr-20230919-014534', 45, NULL, 259, 15, 1, 1125, NULL, 0, 'Cash', NULL, '2023-09-19 07:45:34', '2023-09-19 07:45:34'),
(256, 'spr-20230919-015333', 45, NULL, 260, 15, 1, 138, NULL, 0, 'Cash', NULL, '2023-09-19 07:53:33', '2023-09-19 07:53:33'),
(257, 'spr-20230919-015553', 45, NULL, 261, 15, 1, 849.3, NULL, 0, 'Cash', NULL, '2023-09-19 07:55:53', '2023-09-19 07:55:53'),
(258, 'spr-20230919-021924', 45, NULL, 262, 15, 1, 325.45, NULL, 0, 'Cash', NULL, '2023-09-19 08:19:24', '2023-09-19 08:19:24'),
(259, 'spr-20230919-021950', 45, NULL, 263, 15, 1, 260, NULL, 0, 'Cash', NULL, '2023-09-19 08:19:50', '2023-09-19 08:19:50'),
(260, 'spr-20230919-022454', 45, NULL, 264, 15, 1, 3577, NULL, 0, 'Cash', NULL, '2023-09-19 08:24:54', '2023-09-19 08:24:54'),
(261, 'spr-20230919-022714', 45, NULL, 265, 15, 1, 675, NULL, 0, 'Cash', NULL, '2023-09-19 08:27:14', '2023-09-19 08:27:14'),
(262, 'spr-20230919-023135', 45, NULL, 266, 15, 1, 2016, NULL, 0, 'Cash', NULL, '2023-09-19 08:31:35', '2023-09-19 08:31:35'),
(263, 'spr-20230919-023159', 45, NULL, 267, 15, 1, 138, NULL, 0, 'Cash', NULL, '2023-09-19 08:31:59', '2023-09-19 08:31:59'),
(264, 'spr-20230919-023249', 45, NULL, 268, 15, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-19 08:32:49', '2023-09-19 08:32:49'),
(265, 'spr-20230919-023309', 45, NULL, 269, 15, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-19 08:33:09', '2023-09-19 08:33:09'),
(266, 'spr-20230919-023336', 45, NULL, 270, 15, 1, 184, NULL, 0, 'Cash', NULL, '2023-09-19 08:33:36', '2023-09-19 08:33:36'),
(267, 'spr-20230919-023618', 45, NULL, 271, 15, 1, 310.1, NULL, 0, 'Cash', NULL, '2023-09-19 08:36:18', '2023-09-19 08:36:18'),
(268, 'spr-20230919-023817', 45, NULL, 272, 15, 1, 3360, NULL, 0, 'Cash', NULL, '2023-09-19 08:38:17', '2023-09-19 08:38:17'),
(269, 'spr-20230919-023917', 45, NULL, 273, 15, 1, 323, NULL, 0, 'Cash', NULL, '2023-09-19 08:39:17', '2023-09-19 08:39:17'),
(270, 'spr-20230919-024142', 45, NULL, 274, 15, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-19 08:41:42', '2023-09-19 08:41:42'),
(271, 'spr-20230919-024333', 45, NULL, 275, 15, 1, 340.31, NULL, 0, 'Cash', NULL, '2023-09-19 08:43:33', '2023-09-19 08:43:33'),
(272, 'spr-20230919-024427', 45, NULL, 276, 15, 1, 185.15, NULL, 0, 'Cash', NULL, '2023-09-19 08:44:27', '2023-09-19 08:44:27'),
(273, 'spr-20230919-024606', 45, NULL, 277, 15, 1, 575, NULL, 0, 'Cash', NULL, '2023-09-19 08:46:06', '2023-09-19 08:46:06'),
(274, 'spr-20230919-024711', 45, NULL, 278, 15, 1, 315, NULL, 0, 'Cash', NULL, '2023-09-19 08:47:11', '2023-09-19 08:47:11'),
(275, 'spr-20230919-025236', 45, NULL, 279, 15, 1, 260, NULL, 0, 'Cash', NULL, '2023-09-19 08:52:36', '2023-09-19 08:52:36'),
(276, 'spr-20230919-025426', 45, NULL, 280, 15, 1, 330.8, NULL, 0, 'Cash', NULL, '2023-09-19 08:54:26', '2023-09-19 08:54:26'),
(277, 'spr-20230919-025736', 45, NULL, 281, 15, 1, 1150, NULL, 0, 'Cash', NULL, '2023-09-19 08:57:36', '2023-09-19 08:57:36'),
(278, 'spr-20230919-033441', 45, NULL, 282, 15, 1, 650, NULL, 0, 'Cash', NULL, '2023-09-19 09:34:41', '2023-09-19 09:34:41'),
(279, 'spr-20230919-052157', 45, NULL, 283, 15, 1, 96, NULL, 0, 'Cash', NULL, '2023-09-19 11:21:57', '2023-09-19 11:21:57'),
(280, 'spr-20230919-052248', 45, NULL, 284, 15, 1, 340, NULL, 0, 'Cash', NULL, '2023-09-19 11:22:48', '2023-09-19 11:22:48'),
(281, 'spr-20230919-052407', 45, NULL, 285, 15, 1, 353.6, NULL, 0, 'Cash', NULL, '2023-09-19 11:24:07', '2023-09-19 11:24:07'),
(282, 'spr-20230919-052650', 45, NULL, 286, 15, 1, 605, NULL, 0, 'Cash', NULL, '2023-09-19 11:26:50', '2023-09-19 11:26:50'),
(283, 'spr-20230919-052841', 45, NULL, 287, 15, 1, 328.1, NULL, 0, 'Cash', NULL, '2023-09-19 11:28:41', '2023-09-19 11:28:41'),
(284, 'spr-20230919-055422', 45, NULL, 288, 15, 1, 330, NULL, 0, 'Cash', NULL, '2023-09-19 11:54:22', '2023-09-19 11:54:22'),
(285, 'spr-20230919-061204', 45, NULL, 289, 15, 1, 576, NULL, 0, 'Cash', NULL, '2023-09-19 12:12:04', '2023-09-19 12:12:04'),
(286, 'spr-20230919-062026', 45, NULL, 290, 15, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-19 12:20:26', '2023-09-19 12:20:26'),
(287, 'spr-20230919-074804', 45, NULL, 291, 15, 1, 1017, NULL, 0, 'Cash', NULL, '2023-09-19 13:48:04', '2023-09-19 13:48:04'),
(288, 'spr-20230919-074907', 45, NULL, 292, 15, 1, 3390, NULL, 0, 'Cash', NULL, '2023-09-19 13:49:07', '2023-09-19 13:49:07'),
(289, 'spr-20230919-075952', 45, NULL, 293, 15, 1, 16050, NULL, 0, 'Cash', NULL, '2023-09-19 13:59:52', '2023-09-19 13:59:52'),
(290, 'spr-20230919-080046', 45, NULL, 294, 15, 1, 180, NULL, 0, 'Cash', NULL, '2023-09-19 14:00:46', '2023-09-19 14:00:46'),
(291, 'spr-20230919-080530', 45, NULL, 295, 15, 1, 325, NULL, 0, 'Cash', NULL, '2023-09-19 14:05:30', '2023-09-19 14:05:30'),
(292, 'spr-20230919-080634', 45, NULL, 296, 15, 1, 325, NULL, 0, 'Cash', NULL, '2023-09-19 14:06:34', '2023-09-19 14:06:34'),
(293, 'spr-20230919-080800', 45, NULL, 297, 15, 1, 130, NULL, 0, 'Cash', NULL, '2023-09-19 14:08:00', '2023-09-19 14:08:00'),
(294, 'spr-20230919-080819', 45, NULL, 298, 15, 1, 130, NULL, 0, 'Cash', NULL, '2023-09-19 14:08:19', '2023-09-19 14:08:19'),
(295, 'spr-20230919-081037', 45, NULL, 299, 15, 1, 565, NULL, 0, 'Cash', NULL, '2023-09-19 14:10:37', '2023-09-19 14:10:37'),
(296, 'spr-20230919-081421', 45, NULL, 300, 15, 1, 272, NULL, 0, 'Cash', NULL, '2023-09-19 14:14:21', '2023-09-19 14:14:21'),
(297, 'spr-20230919-082959', 45, NULL, 301, 15, 1, 149.5, NULL, 0, 'Cash', NULL, '2023-09-19 14:29:59', '2023-09-19 14:29:59'),
(298, 'spr-20230919-083145', 45, NULL, 302, 15, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-19 14:31:45', '2023-09-19 14:31:45'),
(299, 'spr-20230919-083207', 45, NULL, 303, 15, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-19 14:32:07', '2023-09-19 14:32:07'),
(300, 'spr-20230919-084722', 45, NULL, 304, 15, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-19 14:47:22', '2023-09-19 14:47:22'),
(301, 'spr-20230919-091200', 45, NULL, 305, 15, 1, 92, NULL, 0, 'Cash', NULL, '2023-09-19 15:12:00', '2023-09-19 15:12:00'),
(302, 'spr-20230919-092754', 45, NULL, 306, 15, 1, 260.7, NULL, 0, 'Cash', NULL, '2023-09-19 15:27:54', '2023-09-19 15:27:54'),
(303, 'spr-20230919-093526', 45, NULL, 307, 15, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-19 15:35:26', '2023-09-19 15:35:26'),
(304, 'spr-20230919-093641', 45, NULL, 308, 15, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-19 15:36:41', '2023-09-19 15:36:41'),
(305, 'spr-20230920-102038', 45, NULL, 309, 16, 1, 670, NULL, 0, 'Cash', NULL, '2023-09-20 04:20:38', '2023-09-20 04:20:38'),
(306, 'spr-20230920-102954', 45, NULL, 310, 16, 1, 46, NULL, 0, 'Cash', NULL, '2023-09-20 04:29:54', '2023-09-20 04:29:54'),
(307, 'spr-20230920-111652', 45, NULL, 311, 16, 1, 200.6, NULL, 0, 'Cash', NULL, '2023-09-20 05:16:52', '2023-09-20 05:16:52'),
(308, 'spr-20230920-111742', 45, NULL, 312, 16, 1, 1680, NULL, 0, 'Cash', NULL, '2023-09-20 05:17:42', '2023-09-20 05:17:42'),
(309, 'spr-20230920-111820', 45, NULL, 313, 16, 1, 33.5, NULL, 0, 'Cash', NULL, '2023-09-20 05:18:20', '2023-09-20 05:18:20'),
(310, 'spr-20230920-111908', 45, NULL, 314, 16, 1, 700, NULL, 0, 'Cash', NULL, '2023-09-20 05:19:08', '2023-09-20 05:19:08'),
(311, 'spr-20230920-112031', 45, NULL, 315, 16, 1, 348.5, NULL, 0, 'Cash', NULL, '2023-09-20 05:20:31', '2023-09-20 05:20:31'),
(312, 'spr-20230920-112113', 45, NULL, 316, 16, 1, 333.05, NULL, 0, 'Cash', NULL, '2023-09-20 05:21:13', '2023-09-20 05:21:13'),
(313, 'spr-20230920-112158', 45, NULL, 317, 16, 1, 600.5, NULL, 0, 'Cash', NULL, '2023-09-20 05:21:58', '2023-09-20 05:21:58'),
(314, 'spr-20230920-113336', 45, NULL, 318, 16, 1, 312.4, NULL, 0, 'Cash', NULL, '2023-09-20 05:33:36', '2023-09-20 05:33:36'),
(315, 'spr-20230920-113524', 45, NULL, 319, 16, 1, 3360, NULL, 0, 'Cash', NULL, '2023-09-20 05:35:24', '2023-09-20 05:35:24'),
(316, 'spr-20230920-115452', 45, NULL, 320, 16, 1, 316.2, NULL, 0, 'Cash', NULL, '2023-09-20 05:54:52', '2023-09-20 05:54:52'),
(317, 'spr-20230920-120814', 45, NULL, 321, 16, 1, 350, NULL, 0, 'Cash', NULL, '2023-09-20 06:08:14', '2023-09-20 06:08:14'),
(318, 'spr-20230920-121457', 45, NULL, 322, 16, 1, 960, NULL, 0, 'Cash', NULL, '2023-09-20 06:14:57', '2023-09-20 06:14:57'),
(319, 'spr-20230920-123024', 45, NULL, 323, 16, 1, 520.4, NULL, 0, 'Cash', NULL, '2023-09-20 06:30:24', '2023-09-20 06:30:24'),
(320, 'spr-20230920-033239', 45, NULL, 324, 16, 1, 46, NULL, 0, 'Cash', NULL, '2023-09-20 09:32:39', '2023-09-20 09:32:39'),
(321, 'spr-20230920-033426', 45, NULL, 325, 16, 1, 1120, NULL, 0, 'Cash', NULL, '2023-09-20 09:34:26', '2023-09-20 09:34:26'),
(322, 'spr-20230920-033620', 45, NULL, 326, 16, 1, 336, NULL, 0, 'Cash', NULL, '2023-09-20 09:36:20', '2023-09-20 09:36:20'),
(323, 'spr-20230920-034033', 45, NULL, 327, 16, 1, 275.8, NULL, 0, 'Cash', NULL, '2023-09-20 09:40:33', '2023-09-20 09:40:33'),
(324, 'spr-20230920-034139', 45, NULL, 328, 16, 1, 660, NULL, 0, 'Cash', NULL, '2023-09-20 09:41:39', '2023-09-20 09:41:39'),
(325, 'spr-20230920-034255', 45, NULL, 329, 16, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-20 09:42:55', '2023-09-20 09:42:55'),
(326, 'spr-20230920-050356', 45, NULL, 330, 16, 1, 350.6, NULL, 0, 'Cash', NULL, '2023-09-20 11:03:56', '2023-09-20 11:03:56'),
(327, 'spr-20230920-052309', 45, NULL, 331, 16, 1, 33.5, NULL, 0, 'Cash', NULL, '2023-09-20 11:23:09', '2023-09-20 11:23:09'),
(328, 'spr-20230920-052430', 45, NULL, 332, 16, 1, 1130, NULL, 0, 'Cash', NULL, '2023-09-20 11:24:30', '2023-09-20 11:24:30'),
(329, 'spr-20230920-055505', 45, NULL, 333, 16, 1, 92, NULL, 0, 'Cash', NULL, '2023-09-20 11:55:05', '2023-09-20 11:55:05'),
(330, 'spr-20230920-060827', 45, NULL, 334, 16, 1, 2100, NULL, 0, 'Cash', NULL, '2023-09-20 12:08:27', '2023-09-20 12:08:27'),
(331, 'spr-20230920-083308', 45, NULL, 335, 16, 1, 560, NULL, 0, 'Cash', NULL, '2023-09-20 14:33:08', '2023-09-20 14:33:08'),
(332, 'spr-20230920-083439', 45, NULL, 336, 16, 1, 256, NULL, 0, 'Cash', NULL, '2023-09-20 14:34:39', '2023-09-20 14:34:39'),
(333, 'spr-20230920-083517', 45, NULL, 337, 16, 1, 290, NULL, 0, 'Cash', NULL, '2023-09-20 14:35:17', '2023-09-20 14:35:17'),
(334, 'spr-20230920-083645', 45, NULL, 338, 16, 1, 1104.8, NULL, 0, 'Cash', NULL, '2023-09-20 14:36:45', '2023-09-20 14:36:45'),
(335, 'spr-20230920-083713', 45, NULL, 339, 16, 1, 306, NULL, 0, 'Cash', NULL, '2023-09-20 14:37:13', '2023-09-20 14:37:13'),
(336, 'spr-20230920-083821', 45, NULL, 340, 16, 1, 497, NULL, 0, 'Cash', NULL, '2023-09-20 14:38:21', '2023-09-20 14:38:21'),
(337, 'spr-20230920-083853', 45, NULL, 341, 16, 1, 325, NULL, 0, 'Cash', NULL, '2023-09-20 14:38:53', '2023-09-20 14:38:53'),
(338, 'spr-20230920-083955', 45, NULL, 342, 16, 1, 1344, NULL, 0, 'Cash', NULL, '2023-09-20 14:39:55', '2023-09-20 14:39:55'),
(339, 'spr-20230920-084052', 45, NULL, 343, 16, 1, 333, NULL, 0, 'Cash', NULL, '2023-09-20 14:40:52', '2023-09-20 14:40:52'),
(340, 'spr-20230920-084121', 45, NULL, 344, 16, 1, 162.5, NULL, 0, 'Cash', NULL, '2023-09-20 14:41:21', '2023-09-20 14:41:21'),
(341, 'spr-20230920-084236', 45, NULL, 345, 16, 1, 240, NULL, 0, 'Cash', NULL, '2023-09-20 14:42:36', '2023-09-20 14:42:36'),
(342, 'spr-20230920-084303', 45, NULL, 346, 16, 1, 130, NULL, 0, 'Cash', NULL, '2023-09-20 14:43:03', '2023-09-20 14:43:03'),
(343, 'spr-20230920-084353', 45, NULL, 347, 16, 1, 445.4, NULL, 0, 'Cash', NULL, '2023-09-20 14:43:53', '2023-09-20 14:43:53'),
(344, 'spr-20230920-084502', 45, NULL, 348, 16, 1, 260, NULL, 0, 'Cash', NULL, '2023-09-20 14:45:02', '2023-09-20 14:45:02'),
(345, 'spr-20230920-084655', 45, NULL, 349, 16, 1, 16050, NULL, 0, 'Cash', NULL, '2023-09-20 14:46:55', '2023-09-20 14:46:55'),
(346, 'spr-20230920-084742', 45, NULL, 350, 16, 1, 338, NULL, 0, 'Cash', NULL, '2023-09-20 14:47:42', '2023-09-20 14:47:42'),
(347, 'spr-20230920-084803', 45, NULL, 351, 16, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-20 14:48:03', '2023-09-20 14:48:03'),
(348, 'spr-20230920-084846', 45, NULL, 352, 16, 1, 3375, NULL, 0, 'Cash', NULL, '2023-09-20 14:48:46', '2023-09-20 14:48:46'),
(349, 'spr-20230921-100921', 45, NULL, 353, 17, 1, 818.6, NULL, 0, 'Cash', NULL, '2023-09-21 04:09:21', '2023-09-21 04:09:21'),
(350, 'spr-20230921-101008', 45, NULL, 354, 17, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-21 04:10:08', '2023-09-21 04:10:08'),
(351, 'spr-20230921-101042', 45, NULL, 355, 17, 1, 92, NULL, 0, 'Cash', NULL, '2023-09-21 04:10:42', '2023-09-21 04:10:42'),
(352, 'spr-20230921-101133', 45, NULL, 356, 17, 1, 340, NULL, 0, 'Cash', NULL, '2023-09-21 04:11:33', '2023-09-21 04:11:33'),
(353, 'spr-20230921-101322', 45, NULL, 357, 17, 1, 275, NULL, 0, 'Cash', NULL, '2023-09-21 04:13:22', '2023-09-21 04:13:22'),
(354, 'spr-20230921-101344', 45, NULL, 358, 17, 1, 138, NULL, 0, 'Cash', NULL, '2023-09-21 04:13:44', '2023-09-21 04:13:44'),
(355, 'spr-20230921-101831', 45, NULL, 359, 17, 1, 480.7, NULL, 0, 'Cash', NULL, '2023-09-21 04:18:31', '2023-09-21 04:18:31'),
(356, 'spr-20230921-102314', 45, NULL, 360, 17, 1, 330, NULL, 0, 'Cash', NULL, '2023-09-21 04:23:14', '2023-09-21 04:23:14'),
(357, 'spr-20230921-102829', 45, NULL, 361, 17, 1, 184, NULL, 0, 'Cash', NULL, '2023-09-21 04:28:29', '2023-09-21 04:28:29'),
(358, 'spr-20230921-105151', 45, NULL, 362, 17, 1, 260.8, NULL, 0, 'Cash', NULL, '2023-09-21 04:51:51', '2023-09-21 04:51:51'),
(359, 'spr-20230921-105405', 45, NULL, 363, 17, 1, 553.2, NULL, 0, 'Cash', NULL, '2023-09-21 04:54:05', '2023-09-21 04:54:05'),
(360, 'spr-20230921-110812', 45, NULL, 364, 17, 1, 3390, NULL, 0, 'Cash', NULL, '2023-09-21 05:08:12', '2023-09-21 05:08:12'),
(361, 'spr-20230921-111053', 45, NULL, 365, 17, 1, 791, NULL, 0, 'Cash', NULL, '2023-09-21 05:10:53', '2023-09-21 05:10:53'),
(362, 'spr-20230921-111405', 45, NULL, 366, 17, 1, 260.1, NULL, 0, 'Cash', NULL, '2023-09-21 05:14:05', '2023-09-21 05:14:05'),
(363, 'spr-20230921-114633', 45, NULL, 367, 17, 1, 3360, NULL, 0, 'Cash', NULL, '2023-09-21 05:46:33', '2023-09-21 05:46:33'),
(364, 'spr-20230921-124951', 45, NULL, 368, 17, 1, 330, NULL, 0, 'Cash', NULL, '2023-09-21 06:49:51', '2023-09-21 06:49:51'),
(365, 'spr-20230921-125436', 45, NULL, 369, 17, 1, 174.5, NULL, 0, 'Cash', NULL, '2023-09-21 06:54:36', '2023-09-21 06:54:36'),
(366, 'spr-20230921-125702', 45, NULL, 370, 17, 1, 672, NULL, 0, 'Cash', NULL, '2023-09-21 06:57:02', '2023-09-21 06:57:02'),
(367, 'spr-20230921-125740', 45, NULL, 371, 17, 1, 2240, NULL, 0, 'Cash', NULL, '2023-09-21 06:57:40', '2023-09-21 06:57:40'),
(368, 'spr-20230921-125811', 45, NULL, 372, 17, 1, 1120, NULL, 0, 'Cash', NULL, '2023-09-21 06:58:11', '2023-09-21 06:58:11'),
(369, 'spr-20230921-125859', 45, NULL, 373, 17, 1, 200, NULL, 0, 'Cash', NULL, '2023-09-21 06:58:59', '2023-09-21 06:58:59'),
(370, 'spr-20230921-010010', 45, NULL, 374, 17, 1, 308.1, NULL, 0, 'Cash', NULL, '2023-09-21 07:00:10', '2023-09-21 07:00:10'),
(371, 'spr-20230921-010101', 45, NULL, 375, 17, 1, 3375, NULL, 0, 'Cash', NULL, '2023-09-21 07:01:01', '2023-09-21 07:01:01'),
(372, 'spr-20230921-012556', 45, NULL, 376, 17, 1, 314, NULL, 0, 'Cash', NULL, '2023-09-21 07:25:56', '2023-09-21 07:25:56'),
(373, 'spr-20230921-012615', 45, NULL, 377, 17, 1, 80.5, NULL, 0, 'Cash', NULL, '2023-09-21 07:26:15', '2023-09-21 07:26:15'),
(374, 'spr-20230921-013902', 45, NULL, 378, 17, 1, 230.6, NULL, 0, 'Cash', NULL, '2023-09-21 07:39:02', '2023-09-21 07:39:02'),
(375, 'spr-20230921-014408', 45, NULL, 379, 17, 1, 300.6, NULL, 0, 'Cash', NULL, '2023-09-21 07:44:08', '2023-09-21 07:44:08'),
(376, 'spr-20230921-014431', 45, NULL, 380, 17, 1, 207, NULL, 0, 'Cash', NULL, '2023-09-21 07:44:31', '2023-09-21 07:44:31'),
(377, 'spr-20230921-020555', 45, NULL, 381, 17, 1, 46, NULL, 0, 'Cash', NULL, '2023-09-21 08:05:55', '2023-09-21 08:05:55'),
(378, 'spr-20230921-020629', 45, NULL, 382, 17, 1, 1120, NULL, 0, 'Cash', NULL, '2023-09-21 08:06:29', '2023-09-21 08:06:29'),
(379, 'spr-20230921-022659', 45, NULL, 383, 17, 1, 792, NULL, 0, 'Cash', NULL, '2023-09-21 08:26:59', '2023-09-21 08:26:59'),
(380, 'spr-20230921-030248', 45, NULL, 384, 17, 1, 340, NULL, 0, 'Cash', NULL, '2023-09-21 09:02:48', '2023-09-21 09:02:48'),
(381, 'spr-20230921-030335', 45, NULL, 385, 17, 1, 784, NULL, 0, 'Cash', NULL, '2023-09-21 09:03:35', '2023-09-21 09:03:35'),
(382, 'spr-20230921-032602', 45, NULL, 386, 17, 1, 660, NULL, 0, 'Cash', NULL, '2023-09-21 09:26:02', '2023-09-21 09:26:02'),
(383, 'spr-20230921-035712', 45, NULL, 387, 17, 1, 306, NULL, 0, 'Cash', NULL, '2023-09-21 09:57:12', '2023-09-21 09:57:12'),
(384, 'spr-20230921-041600', 45, NULL, 388, 17, 1, 360, NULL, 0, 'Cash', NULL, '2023-09-21 10:16:00', '2023-09-21 10:16:00'),
(385, 'spr-20230921-041830', 45, NULL, 389, 17, 1, 135, NULL, 0, 'Cash', NULL, '2023-09-21 10:18:30', '2023-09-21 10:18:30'),
(386, 'spr-20230921-042514', 45, NULL, 390, 17, 1, 67, NULL, 0, 'Cash', NULL, '2023-09-21 10:25:14', '2023-09-21 10:25:14'),
(387, 'spr-20230921-045614', 45, NULL, 391, 17, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-21 10:56:14', '2023-09-21 10:56:14'),
(388, 'spr-20230921-045633', 45, NULL, 392, 17, 1, 46, NULL, 0, 'Cash', NULL, '2023-09-21 10:56:33', '2023-09-21 10:56:33'),
(389, 'spr-20230921-050341', 45, NULL, 393, 17, 1, 325, NULL, 0, 'Cash', NULL, '2023-09-21 11:03:41', '2023-09-21 11:03:41'),
(390, 'spr-20230921-050551', 45, NULL, 394, 17, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-21 11:05:51', '2023-09-21 11:05:51'),
(391, 'spr-20230921-052922', 45, NULL, 395, 17, 1, 592, NULL, 0, 'Cash', NULL, '2023-09-21 11:29:22', '2023-09-21 11:29:22'),
(392, 'spr-20230921-061246', 45, NULL, 396, 17, 1, 1320, NULL, 0, 'Cash', NULL, '2023-09-21 12:12:46', '2023-09-21 12:12:46'),
(393, 'spr-20230921-061332', 45, NULL, 397, 17, 1, 330, NULL, 0, 'Cash', NULL, '2023-09-21 12:13:32', '2023-09-21 12:13:32'),
(394, 'spr-20230921-061414', 45, NULL, 398, 17, 1, 135, NULL, 0, 'Cash', NULL, '2023-09-21 12:14:14', '2023-09-21 12:14:14'),
(395, 'spr-20230921-061709', 45, NULL, 399, 17, 1, 474.6, NULL, 0, 'Cash', NULL, '2023-09-21 12:17:09', '2023-09-21 12:17:09'),
(396, 'spr-20230921-061957', 45, NULL, 400, 17, 1, 6608, NULL, 0, 'Cash', NULL, '2023-09-21 12:19:57', '2023-09-21 12:19:57'),
(397, 'spr-20230921-062710', 45, NULL, 401, 17, 1, 935, NULL, 0, 'Cash', NULL, '2023-09-21 12:27:10', '2023-09-21 12:27:10'),
(398, 'spr-20230921-062742', 45, NULL, 402, 17, 1, 650, NULL, 0, 'Cash', NULL, '2023-09-21 12:27:42', '2023-09-21 12:27:42'),
(399, 'spr-20230921-063222', 45, NULL, 403, 17, 1, 100.5, NULL, 0, 'Cash', NULL, '2023-09-21 12:32:22', '2023-09-21 12:32:22'),
(400, 'spr-20230921-064317', 45, NULL, 404, 17, 1, 302.6, NULL, 0, 'Cash', NULL, '2023-09-21 12:43:17', '2023-09-21 12:43:17'),
(401, 'spr-20230921-064530', 45, NULL, 405, 17, 1, 174.8, NULL, 0, 'Cash', NULL, '2023-09-21 12:45:30', '2023-09-21 12:45:30'),
(402, 'spr-20230921-064628', 45, NULL, 406, 17, 1, 33.5, NULL, 0, 'Cash', NULL, '2023-09-21 12:46:28', '2023-09-21 12:46:28'),
(403, 'spr-20230921-065902', 45, NULL, 407, 17, 1, 285.6, NULL, 0, 'Cash', NULL, '2023-09-21 12:59:02', '2023-09-21 12:59:02'),
(404, 'spr-20230921-065939', 45, NULL, 408, 17, 1, 225, NULL, 0, 'Cash', NULL, '2023-09-21 12:59:39', '2023-09-21 12:59:39'),
(405, 'spr-20230921-070023', 45, NULL, 409, 17, 1, 549.3, NULL, 0, 'Cash', NULL, '2023-09-21 13:00:23', '2023-09-21 13:00:23'),
(406, 'spr-20230921-070043', 45, NULL, 410, 17, 1, 46, NULL, 0, 'Cash', NULL, '2023-09-21 13:00:43', '2023-09-21 13:00:43'),
(407, 'spr-20230921-070532', 45, NULL, 411, 17, 1, 299.3, NULL, 0, 'Cash', NULL, '2023-09-21 13:05:32', '2023-09-21 13:05:32'),
(408, 'spr-20230921-070622', 45, NULL, 412, 17, 1, 290, NULL, 0, 'Cash', NULL, '2023-09-21 13:06:22', '2023-09-21 13:06:22'),
(409, 'spr-20230921-070706', 45, NULL, 413, 17, 1, 300.2, NULL, 0, 'Cash', NULL, '2023-09-21 13:07:06', '2023-09-21 13:07:06'),
(410, 'spr-20230921-071547', 45, NULL, 414, 17, 1, 317.9, NULL, 0, 'Cash', NULL, '2023-09-21 13:15:47', '2023-09-21 13:15:47'),
(411, 'spr-20230921-072835', 45, NULL, 415, 17, 1, 294.1, NULL, 0, 'Cash', NULL, '2023-09-21 13:28:35', '2023-09-21 13:28:35'),
(412, 'spr-20230921-072904', 45, NULL, 416, 17, 1, 300.9, NULL, 0, 'Cash', NULL, '2023-09-21 13:29:04', '2023-09-21 13:29:04'),
(413, 'spr-20230921-072935', 45, NULL, 417, 17, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-21 13:29:35', '2023-09-21 13:29:35'),
(414, 'spr-20230921-074906', 45, NULL, 418, 17, 1, 330.4, NULL, 0, 'Cash', NULL, '2023-09-21 13:49:06', '2023-09-21 13:49:06');
INSERT INTO `payments` (`id`, `payment_reference`, `user_id`, `purchase_id`, `sale_id`, `cash_register_id`, `account_id`, `amount`, `used_points`, `change`, `paying_method`, `payment_note`, `created_at`, `updated_at`) VALUES
(415, 'spr-20230921-075302', 45, NULL, 419, 17, 1, 330, NULL, 0, 'Cash', NULL, '2023-09-21 13:53:02', '2023-09-21 13:53:02'),
(416, 'spr-20230921-081706', 45, NULL, 420, 17, 1, 330, NULL, 0, 'Cash', NULL, '2023-09-21 14:17:06', '2023-09-21 14:17:06'),
(417, 'spr-20230921-081726', 45, NULL, 421, 17, 1, 130, NULL, 0, 'Cash', NULL, '2023-09-21 14:17:26', '2023-09-21 14:17:26'),
(418, 'spr-20230921-082210', 45, NULL, 422, 17, 1, 290, NULL, 0, 'Cash', NULL, '2023-09-21 14:22:10', '2023-09-21 14:22:10'),
(419, 'spr-20230921-084750', 45, NULL, 423, 17, 1, 300.6, NULL, 0, 'Cash', NULL, '2023-09-21 14:47:50', '2023-09-21 14:47:50'),
(420, 'spr-20230921-084827', 45, NULL, 424, 17, 1, 330, NULL, 0, 'Cash', NULL, '2023-09-21 14:48:27', '2023-09-21 14:48:27'),
(421, 'spr-20230921-085519', 45, NULL, 425, 17, 1, 945, NULL, 0, 'Cash', NULL, '2023-09-21 14:55:19', '2023-09-21 14:55:19'),
(422, 'spr-20230921-085630', 45, NULL, 426, 17, 1, 330.8, NULL, 0, 'Cash', NULL, '2023-09-21 14:56:30', '2023-09-21 14:56:30'),
(423, 'spr-20230921-085714', 45, NULL, 427, 17, 1, 277.1, NULL, 0, 'Cash', NULL, '2023-09-21 14:57:14', '2023-09-21 14:57:14'),
(424, 'spr-20230921-091526', 45, NULL, 428, 17, 1, 166.6, NULL, 0, 'Cash', NULL, '2023-09-21 15:15:26', '2023-09-21 15:15:26'),
(425, 'spr-20230921-091641', 45, NULL, 429, 17, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-21 15:16:41', '2023-09-21 15:16:41'),
(426, 'spr-20230921-092033', 45, NULL, 430, 17, 1, 8215, NULL, 0, 'Cash', NULL, '2023-09-21 15:20:33', '2023-09-21 15:20:33'),
(427, 'spr-20230921-092157', 45, NULL, 431, 17, 1, 7200, NULL, 0, 'Cash', NULL, '2023-09-21 15:21:57', '2023-09-21 15:21:57'),
(428, 'spr-20230922-082439', 45, NULL, 432, 18, 1, 4191, NULL, 0, 'Cash', NULL, '2023-09-22 02:24:39', '2023-09-22 02:24:39'),
(429, 'spr-20230922-085457', 45, NULL, 433, 18, 1, 1100, NULL, 0, 'Cash', NULL, '2023-09-22 02:54:57', '2023-09-22 02:54:57'),
(430, 'spr-20230922-085650', 45, NULL, 434, 18, 1, 1718, NULL, 0, 'Cash', NULL, '2023-09-22 02:56:50', '2023-09-22 02:56:50'),
(431, 'spr-20230922-092025', 45, NULL, 435, 18, 1, 138, NULL, 0, 'Cash', NULL, '2023-09-22 03:20:25', '2023-09-22 03:20:25'),
(432, 'spr-20230922-093357', 45, NULL, 436, 18, 1, 291.4, NULL, 0, 'Cash', NULL, '2023-09-22 03:33:57', '2023-09-22 03:33:57'),
(433, 'spr-20230922-094956', 45, NULL, 437, 18, 1, 369, NULL, 0, 'Cash', NULL, '2023-09-22 03:49:56', '2023-09-22 03:49:56'),
(434, 'spr-20230922-101502', 45, NULL, 438, 18, 1, 2100, NULL, 0, 'Cash', NULL, '2023-09-22 04:15:02', '2023-09-22 04:15:02'),
(435, 'spr-20230922-103529', 45, NULL, 439, 18, 1, 350, NULL, 0, 'Cash', NULL, '2023-09-22 04:35:29', '2023-09-22 04:35:29'),
(436, 'spr-20230922-104847', 45, NULL, 440, 18, 1, 17136, NULL, 0, 'Cash', NULL, '2023-09-22 04:48:47', '2023-09-22 04:48:47'),
(437, 'spr-20230922-120216', 45, NULL, 441, 18, 1, 1429.5, NULL, 0, 'Cash', NULL, '2023-09-22 06:02:16', '2023-09-22 06:02:16'),
(438, 'spr-20230922-121242', 45, NULL, 442, 18, 1, 3450, NULL, 0, 'Cash', NULL, '2023-09-22 06:12:42', '2023-09-22 06:12:42'),
(439, 'spr-20230922-121742', 45, NULL, 443, 18, 1, 295.75, NULL, 0, 'Cash', NULL, '2023-09-22 06:17:42', '2023-09-22 06:17:42'),
(440, 'spr-20230922-040852', 45, NULL, 444, 18, 1, 500.5, NULL, 0, 'Cash', NULL, '2023-09-22 10:08:52', '2023-09-22 10:08:52'),
(441, 'spr-20230922-041020', 45, NULL, 445, 18, 1, 230.1, NULL, 0, 'Cash', NULL, '2023-09-22 10:10:20', '2023-09-22 10:10:20'),
(442, 'spr-20230922-041115', 45, NULL, 446, 18, 1, 315, NULL, 0, 'Cash', NULL, '2023-09-22 10:11:15', '2023-09-22 10:11:15'),
(443, 'spr-20230922-041310', 45, NULL, 447, 18, 1, 320, NULL, 0, 'Cash', NULL, '2023-09-22 10:13:10', '2023-09-22 10:13:10'),
(444, 'spr-20230922-041355', 45, NULL, 448, 18, 1, 315, NULL, 0, 'Cash', NULL, '2023-09-22 10:13:55', '2023-09-22 10:13:55'),
(445, 'spr-20230922-041436', 45, NULL, 449, 18, 1, 332, NULL, 0, 'Cash', NULL, '2023-09-22 10:14:36', '2023-09-22 10:14:36'),
(446, 'spr-20230922-041830', 45, NULL, 450, 18, 1, 3456, NULL, 0, 'Cash', NULL, '2023-09-22 10:18:30', '2023-09-22 10:18:30'),
(447, 'spr-20230922-041910', 45, NULL, 451, 18, 1, 270, NULL, 0, 'Cash', NULL, '2023-09-22 10:19:10', '2023-09-22 10:19:10'),
(448, 'spr-20230922-042739', 45, NULL, 452, 18, 1, 315, NULL, 0, 'Cash', NULL, '2023-09-22 10:27:39', '2023-09-22 10:27:39'),
(449, 'spr-20230922-042931', 45, NULL, 453, 18, 1, 270.2, NULL, 0, 'Cash', NULL, '2023-09-22 10:29:31', '2023-09-22 10:29:31'),
(450, 'spr-20230922-043026', 45, NULL, 454, 18, 1, 1000.3, NULL, 0, 'Cash', NULL, '2023-09-22 10:30:26', '2023-09-22 10:30:26'),
(451, 'spr-20230922-043113', 45, NULL, 455, 18, 1, 292.9, NULL, 0, 'Cash', NULL, '2023-09-22 10:31:13', '2023-09-22 10:31:13'),
(452, 'spr-20230922-043211', 45, NULL, 456, 18, 1, 309.4, NULL, 0, 'Cash', NULL, '2023-09-22 10:32:11', '2023-09-22 10:32:11'),
(453, 'spr-20230922-044150', 45, NULL, 457, 18, 1, 321.8, NULL, 0, 'Cash', NULL, '2023-09-22 10:41:50', '2023-09-22 10:41:50'),
(454, 'spr-20230922-050206', 45, NULL, 458, 18, 1, 310, NULL, 0, 'Cash', NULL, '2023-09-22 11:02:06', '2023-09-22 11:02:06'),
(455, 'spr-20230922-050342', 45, NULL, 459, 18, 1, 3850, NULL, 0, 'Cash', NULL, '2023-09-22 11:03:42', '2023-09-22 11:03:42'),
(456, 'spr-20230922-050900', 45, NULL, 460, 18, 1, 262, NULL, 0, 'Cash', NULL, '2023-09-22 11:09:00', '2023-09-22 11:09:00'),
(457, 'spr-20230922-050957', 45, NULL, 461, 18, 1, 348, NULL, 0, 'Cash', NULL, '2023-09-22 11:09:57', '2023-09-22 11:09:57'),
(458, 'spr-20230922-051226', 45, NULL, 462, 18, 1, 267.6, NULL, 0, 'Cash', NULL, '2023-09-22 11:12:26', '2023-09-22 11:12:26'),
(459, 'spr-20230922-051351', 45, NULL, 463, 18, 1, 262.2, NULL, 0, 'Cash', NULL, '2023-09-22 11:13:51', '2023-09-22 11:13:51'),
(460, 'spr-20230922-051429', 45, NULL, 464, 18, 1, 288.3, NULL, 0, 'Cash', NULL, '2023-09-22 11:14:29', '2023-09-22 11:14:29'),
(461, 'spr-20230922-051512', 45, NULL, 465, 18, 1, 285.5, NULL, 0, 'Cash', NULL, '2023-09-22 11:15:12', '2023-09-22 11:15:12'),
(462, 'spr-20230922-051539', 45, NULL, 466, 18, 1, 260.1, NULL, 0, 'Cash', NULL, '2023-09-22 11:15:39', '2023-09-22 11:15:39'),
(463, 'spr-20230922-051632', 45, NULL, 467, 18, 1, 210, NULL, 0, 'Cash', NULL, '2023-09-22 11:16:32', '2023-09-22 11:16:32'),
(464, 'spr-20230922-051713', 45, NULL, 468, 18, 1, 250, NULL, 0, 'Cash', NULL, '2023-09-22 11:17:13', '2023-09-22 11:17:13'),
(465, 'spr-20230922-051815', 45, NULL, 469, 18, 1, 262.8, NULL, 0, 'Cash', NULL, '2023-09-22 11:18:15', '2023-09-22 11:18:15'),
(466, 'spr-20230922-051902', 45, NULL, 470, 18, 1, 293.8, NULL, 0, 'Cash', NULL, '2023-09-22 11:19:02', '2023-09-22 11:19:02'),
(467, 'spr-20230922-051953', 45, NULL, 471, 18, 1, 260.4, NULL, 0, 'Cash', NULL, '2023-09-22 11:19:53', '2023-09-22 11:19:53'),
(468, 'spr-20230922-052054', 45, NULL, 472, 18, 1, 240.3, NULL, 0, 'Cash', NULL, '2023-09-22 11:20:54', '2023-09-22 11:20:54'),
(469, 'spr-20230922-052137', 45, NULL, 473, 18, 1, 450.1, NULL, 0, 'Cash', NULL, '2023-09-22 11:21:37', '2023-09-22 11:21:37'),
(470, 'spr-20230922-052305', 45, NULL, 474, 18, 1, 262, NULL, 0, 'Cash', NULL, '2023-09-22 11:23:05', '2023-09-22 11:23:05'),
(471, 'spr-20230922-052331', 45, NULL, 475, 18, 1, 350, NULL, 0, 'Cash', NULL, '2023-09-22 11:23:31', '2023-09-22 11:23:31'),
(472, 'spr-20230922-052351', 45, NULL, 476, 18, 1, 700, NULL, 0, 'Cash', NULL, '2023-09-22 11:23:51', '2023-09-22 11:23:51'),
(473, 'spr-20230922-052532', 45, NULL, 477, 18, 1, 4930, NULL, 0, 'Cash', NULL, '2023-09-22 11:25:32', '2023-09-22 11:25:32'),
(474, 'spr-20230922-052554', 45, NULL, 478, 18, 1, 798, NULL, 0, 'Cash', NULL, '2023-09-22 11:25:54', '2023-09-22 11:25:54'),
(475, 'spr-20230922-052710', 45, NULL, 479, 18, 1, 5250, NULL, 0, 'Cash', NULL, '2023-09-22 11:27:10', '2023-09-22 11:27:10'),
(476, 'spr-20230922-052728', 45, NULL, 480, 18, 1, 994, NULL, 0, 'Cash', NULL, '2023-09-22 11:27:28', '2023-09-22 11:27:28'),
(477, 'spr-20230922-052742', 45, NULL, 481, 18, 1, 350, NULL, 0, 'Cash', NULL, '2023-09-22 11:27:42', '2023-09-22 11:27:42'),
(478, 'spr-20230922-052759', 45, NULL, 482, 18, 1, 896, NULL, 0, 'Cash', NULL, '2023-09-22 11:27:59', '2023-09-22 11:27:59'),
(479, 'spr-20230922-052814', 45, NULL, 483, 18, 1, 2800, NULL, 0, 'Cash', NULL, '2023-09-22 11:28:14', '2023-09-22 11:28:14'),
(480, 'spr-20230922-052830', 45, NULL, 484, 18, 1, 499.8, NULL, 0, 'Cash', NULL, '2023-09-22 11:28:30', '2023-09-22 11:28:30'),
(481, 'spr-20230922-052849', 45, NULL, 485, 18, 1, 1372, NULL, 0, 'Cash', NULL, '2023-09-22 11:28:49', '2023-09-22 11:28:49'),
(482, 'spr-20230922-052917', 45, NULL, 486, 18, 1, 1750, NULL, 0, 'Cash', NULL, '2023-09-22 11:29:17', '2023-09-22 11:29:17'),
(483, 'spr-20230922-053005', 45, NULL, 487, 18, 1, 644, NULL, 0, 'Cash', NULL, '2023-09-22 11:30:05', '2023-09-22 11:30:05'),
(484, 'spr-20230922-053017', 45, NULL, 488, 18, 1, 350, NULL, 0, 'Cash', NULL, '2023-09-22 11:30:17', '2023-09-22 11:30:17'),
(485, 'spr-20230922-053122', 45, NULL, 489, 18, 1, 4725, NULL, 0, 'Cash', NULL, '2023-09-22 11:31:22', '2023-09-22 11:31:22'),
(486, 'spr-20230922-053203', 45, NULL, 490, 18, 1, 4900, NULL, 0, 'Cash', NULL, '2023-09-22 11:32:03', '2023-09-22 11:32:03'),
(487, 'spr-20230922-053722', 45, NULL, 491, 18, 1, 478.3, NULL, 0, 'Cash', NULL, '2023-09-22 11:37:22', '2023-09-22 11:37:22'),
(488, 'spr-20230922-053757', 45, NULL, 492, 18, 1, 3500, NULL, 0, 'Cash', NULL, '2023-09-22 11:37:57', '2023-09-22 11:37:57'),
(489, 'spr-20230922-053914', 45, NULL, 493, 18, 1, 2100, NULL, 0, 'Cash', NULL, '2023-09-22 11:39:14', '2023-09-22 11:39:14'),
(490, 'spr-20230922-054002', 45, NULL, 494, 18, 1, 46, NULL, 0, 'Cash', NULL, '2023-09-22 11:40:02', '2023-09-22 11:40:02'),
(491, 'spr-20230922-054151', 45, NULL, 495, 18, 1, 1456, NULL, 0, 'Cash', NULL, '2023-09-22 11:41:51', '2023-09-22 11:41:51'),
(492, 'spr-20230922-054227', 45, NULL, 496, 18, 1, 330, NULL, 0, 'Cash', NULL, '2023-09-22 11:42:27', '2023-09-22 11:42:27'),
(493, 'spr-20230922-054831', 45, NULL, 497, 18, 1, 92, NULL, 0, 'Cash', NULL, '2023-09-22 11:48:31', '2023-09-22 11:48:31'),
(494, 'spr-20230922-061337', 45, NULL, 498, 18, 1, 266.5, NULL, 0, 'Cash', NULL, '2023-09-22 12:13:37', '2023-09-22 12:13:37'),
(495, 'spr-20230922-061506', 45, NULL, 499, 18, 1, 345, NULL, 0, 'Cash', NULL, '2023-09-22 12:15:06', '2023-09-22 12:15:06'),
(496, 'spr-20230922-061643', 45, NULL, 500, 18, 1, 1980, NULL, 0, 'Cash', NULL, '2023-09-22 12:16:43', '2023-09-22 12:16:43'),
(497, 'spr-20230922-061708', 45, NULL, 501, 18, 1, 337.5, NULL, 0, 'Cash', NULL, '2023-09-22 12:17:08', '2023-09-22 12:17:08'),
(498, 'spr-20230922-061747', 45, NULL, 502, 18, 1, 56.25, NULL, 0, 'Cash', NULL, '2023-09-22 12:17:47', '2023-09-22 12:17:47'),
(499, 'spr-20230922-061825', 45, NULL, 503, 18, 1, 45, NULL, 0, 'Cash', NULL, '2023-09-22 12:18:25', '2023-09-22 12:18:25'),
(500, 'spr-20230922-061853', 45, NULL, 504, 18, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-22 12:18:53', '2023-09-22 12:18:53'),
(501, 'spr-20230922-062133', 45, NULL, 505, 18, 1, 6720, NULL, 0, 'Cash', NULL, '2023-09-22 12:21:33', '2023-09-22 12:21:33'),
(502, 'spr-20230922-062323', 45, NULL, 506, 18, 1, 830.3, NULL, 0, 'Cash', NULL, '2023-09-22 12:23:23', '2023-09-22 12:23:23'),
(503, 'spr-20230922-062651', 45, NULL, 507, 18, 1, 1445, NULL, 0, 'Cash', NULL, '2023-09-22 12:26:51', '2023-09-22 12:26:51'),
(504, 'spr-20230922-062848', 45, NULL, 508, 18, 1, 559, NULL, 0, 'Cash', NULL, '2023-09-22 12:28:48', '2023-09-22 12:28:48'),
(505, 'spr-20230922-062930', 45, NULL, 509, 18, 1, 2070, NULL, 0, 'Cash', NULL, '2023-09-22 12:29:30', '2023-09-22 12:29:30'),
(506, 'spr-20230922-062956', 45, NULL, 510, 18, 1, 38, NULL, 0, 'Cash', NULL, '2023-09-22 12:29:56', '2023-09-22 12:29:56'),
(507, 'spr-20230922-063427', 45, NULL, 511, 18, 1, 112.5, NULL, 0, 'Cash', NULL, '2023-09-22 12:34:27', '2023-09-22 12:34:27'),
(508, 'spr-20230922-064133', 45, NULL, 512, 18, 1, 3300, NULL, 0, 'Cash', NULL, '2023-09-22 12:41:33', '2023-09-22 12:41:33'),
(509, 'spr-20230922-064617', 45, NULL, 513, 18, 1, 1456, NULL, 0, 'Cash', NULL, '2023-09-22 12:46:17', '2023-09-22 12:46:17'),
(510, 'spr-20230922-065308', 45, NULL, 514, 18, 1, 3850, NULL, 0, 'Cash', NULL, '2023-09-22 12:53:08', '2023-09-22 12:53:08'),
(511, 'spr-20230922-065438', 45, NULL, 515, 18, 1, 2400, NULL, 0, 'Cash', NULL, '2023-09-22 12:54:38', '2023-09-22 12:54:38'),
(512, 'spr-20230922-065521', 45, NULL, 516, 18, 1, 1380, NULL, 0, 'Cash', NULL, '2023-09-22 12:55:21', '2023-09-22 12:55:21'),
(513, 'spr-20230922-070730', 45, NULL, 517, 18, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-22 13:07:30', '2023-09-22 13:07:30'),
(514, 'spr-20230922-071337', 45, NULL, 518, 18, 1, 720, NULL, 0, 'Cash', NULL, '2023-09-22 13:13:37', '2023-09-22 13:13:37'),
(515, 'spr-20230923-103150', 45, NULL, 519, 19, 1, 350, NULL, 0, 'Cash', NULL, '2023-09-23 04:31:50', '2023-09-23 04:31:50'),
(516, 'spr-20230923-110649', 45, NULL, 520, 19, 1, 909.5, NULL, 0, 'Cash', NULL, '2023-09-23 05:06:49', '2023-09-23 05:06:49'),
(517, 'spr-20230923-114811', 45, NULL, 521, 19, 1, 700, NULL, 0, 'Cash', NULL, '2023-09-23 05:48:11', '2023-09-23 05:48:11'),
(518, 'spr-20230923-120613', 45, NULL, 522, 19, 1, 350, NULL, 0, 'Cash', NULL, '2023-09-23 06:06:13', '2023-09-23 06:06:13'),
(519, 'spr-20230923-123708', 45, NULL, 523, 19, 1, 630, NULL, 0, 'Cash', NULL, '2023-09-23 06:37:08', '2023-09-23 06:37:08'),
(520, 'spr-20230923-123914', 45, NULL, 524, 19, 1, 353.5, NULL, 0, 'Cash', NULL, '2023-09-23 06:39:14', '2023-09-23 06:39:14'),
(521, 'spr-20230923-124028', 45, NULL, 525, 19, 1, 112.5, NULL, 0, 'Cash', NULL, '2023-09-23 06:40:28', '2023-09-23 06:40:28'),
(522, 'spr-20230923-010258', 45, NULL, 526, 19, 1, 214, NULL, 0, 'Cash', NULL, '2023-09-23 07:02:58', '2023-09-23 07:02:58'),
(523, 'spr-20230923-010636', 45, NULL, 527, 19, 1, 240.5, NULL, 0, 'Cash', NULL, '2023-09-23 07:06:36', '2023-09-23 07:06:36'),
(524, 'spr-20230923-010657', 45, NULL, 528, 19, 1, 130, NULL, 0, 'Cash', NULL, '2023-09-23 07:06:57', '2023-09-23 07:06:57'),
(525, 'spr-20230923-012957', 45, NULL, 529, 19, 1, 3300, NULL, 0, 'Cash', NULL, '2023-09-23 07:29:57', '2023-09-23 07:29:57'),
(526, 'spr-20230923-013201', 45, NULL, 530, 19, 1, 1332, NULL, 0, 'Cash', NULL, '2023-09-23 07:32:01', '2023-09-23 07:32:01'),
(527, 'spr-20230923-014153', 45, NULL, 531, 19, 1, 4288, NULL, 0, 'Cash', NULL, '2023-09-23 07:41:53', '2023-09-23 07:41:53'),
(528, 'spr-20230923-014307', 45, NULL, 532, 19, 1, 8750, NULL, 0, 'Cash', NULL, '2023-09-23 07:43:07', '2023-09-23 07:43:07'),
(529, 'spr-20230923-014456', 45, NULL, 533, 19, 1, 1600, NULL, 0, 'Cash', NULL, '2023-09-23 07:44:56', '2023-09-23 07:44:56'),
(530, 'spr-20230923-023457', 45, NULL, 534, 19, 1, 276, NULL, 0, 'Cash', NULL, '2023-09-23 08:34:57', '2023-09-23 08:34:57'),
(531, 'spr-20230923-025024', 45, NULL, 535, 19, 1, 335.5, NULL, 0, 'Cash', NULL, '2023-09-23 08:50:24', '2023-09-23 08:50:24'),
(532, 'spr-20230923-025313', 45, NULL, 536, 19, 1, 306, NULL, 0, 'Cash', NULL, '2023-09-23 08:53:13', '2023-09-23 08:53:13'),
(533, 'spr-20230923-025342', 45, NULL, 537, 19, 1, 840, NULL, 0, 'Cash', NULL, '2023-09-23 08:53:42', '2023-09-23 08:53:42'),
(534, 'spr-20230923-025420', 45, NULL, 538, 19, 1, 335.5, NULL, 0, 'Cash', NULL, '2023-09-23 08:54:20', '2023-09-23 08:54:20'),
(535, 'spr-20230923-025513', 45, NULL, 539, 19, 1, 1100, NULL, 0, 'Cash', NULL, '2023-09-23 08:55:13', '2023-09-23 08:55:13'),
(536, 'spr-20230923-025757', 45, NULL, 540, 19, 1, 335.5, NULL, 0, 'Cash', NULL, '2023-09-23 08:57:57', '2023-09-23 08:57:57'),
(537, 'spr-20230923-025757', 45, NULL, 541, 19, 1, 335.5, NULL, 0, 'Cash', NULL, '2023-09-23 08:57:57', '2023-09-23 08:57:57'),
(538, 'spr-20230923-031116', 45, NULL, 542, 19, 1, 135, NULL, 0, 'Cash', NULL, '2023-09-23 09:11:16', '2023-09-23 09:11:16'),
(539, 'spr-20230923-033122', 45, NULL, 543, 19, 1, 297.5, NULL, 0, 'Cash', NULL, '2023-09-23 09:31:22', '2023-09-23 09:31:22'),
(540, 'spr-20230923-033606', 45, NULL, 544, 19, 1, 660, NULL, 0, 'Cash', NULL, '2023-09-23 09:36:06', '2023-09-23 09:36:06'),
(541, 'spr-20230923-033644', 45, NULL, 545, 19, 1, 65.5, NULL, 0, 'Cash', NULL, '2023-09-23 09:36:44', '2023-09-23 09:36:44'),
(542, 'spr-20230923-034043', 45, NULL, 546, 19, 1, 1100, NULL, 0, 'Cash', NULL, '2023-09-23 09:40:43', '2023-09-23 09:40:43'),
(543, 'spr-20230923-034729', 45, NULL, 547, 19, 1, 3705, NULL, 0, 'Cash', NULL, '2023-09-23 09:47:29', '2023-09-23 09:47:29'),
(544, 'spr-20230923-035550', 45, NULL, 548, 19, 1, 340, NULL, 0, 'Cash', NULL, '2023-09-23 09:55:50', '2023-09-23 09:55:50'),
(545, 'spr-20230923-035843', 45, NULL, 549, 19, 1, 170, NULL, 0, 'Cash', NULL, '2023-09-23 09:58:43', '2023-09-23 09:58:43'),
(546, 'spr-20230923-040707', 45, NULL, 550, 19, 1, 540, NULL, 0, 'Cash', NULL, '2023-09-23 10:07:07', '2023-09-23 10:07:07'),
(547, 'spr-20230923-041635', 45, NULL, 551, 19, 1, 1300.5, NULL, 0, 'Cash', NULL, '2023-09-23 10:16:35', '2023-09-23 10:16:35'),
(548, 'spr-20230923-041949', 45, NULL, 552, 19, 1, 720, NULL, 0, 'Cash', NULL, '2023-09-23 10:19:49', '2023-09-23 10:19:49'),
(549, 'spr-20230923-044454', 45, NULL, 553, 19, 1, 1040, NULL, 0, 'Cash', NULL, '2023-09-23 10:44:54', '2023-09-23 10:44:54'),
(550, 'spr-20230923-045528', 45, NULL, 554, 19, 1, 530, NULL, 0, 'Cash', NULL, '2023-09-23 10:55:28', '2023-09-23 10:55:28'),
(551, 'spr-20230923-050144', 45, NULL, 555, 19, 1, 627.5, NULL, 0, 'Cash', NULL, '2023-09-23 11:01:44', '2023-09-23 11:01:44'),
(552, 'spr-20230923-050438', 45, NULL, 556, 19, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-23 11:04:38', '2023-09-23 11:04:38'),
(553, 'spr-20230923-060514', 45, NULL, 557, 19, 1, 1650, NULL, 0, 'Cash', NULL, '2023-09-23 12:05:14', '2023-09-23 12:05:14'),
(554, 'spr-20230923-071100', 45, NULL, 558, 19, 1, 240, NULL, 0, 'Cash', NULL, '2023-09-23 13:11:00', '2023-09-23 13:11:00'),
(555, 'spr-20230923-072027', 45, NULL, 559, 19, 1, 590, NULL, 0, 'Cash', NULL, '2023-09-23 13:20:27', '2023-09-23 13:20:27'),
(556, 'spr-20230923-072208', 45, NULL, 560, 19, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-23 13:22:08', '2023-09-23 13:22:08'),
(557, 'spr-20230923-072446', 45, NULL, 561, 19, 1, 2720, NULL, 0, 'Cash', NULL, '2023-09-23 13:24:46', '2023-09-23 13:24:46'),
(558, 'spr-20230923-073103', 45, NULL, 562, 19, 1, 665.6, NULL, 0, 'Cash', NULL, '2023-09-23 13:31:03', '2023-09-23 13:31:03'),
(559, 'spr-20230923-073740', 45, NULL, 563, 19, 1, 288.75, NULL, 0, 'Cash', NULL, '2023-09-23 13:37:40', '2023-09-23 13:37:40'),
(560, 'spr-20230923-073805', 45, NULL, 564, 19, 1, 335.5, NULL, 0, 'Cash', NULL, '2023-09-23 13:38:05', '2023-09-23 13:38:05'),
(561, 'spr-20230923-075207', 45, NULL, 565, 19, 1, 60, NULL, 0, 'Cash', NULL, '2023-09-23 13:52:07', '2023-09-23 13:52:07'),
(562, 'spr-20230923-080357', 45, NULL, 566, 19, 1, 1200, NULL, 0, 'Cash', NULL, '2023-09-23 14:03:57', '2023-09-23 14:03:57'),
(563, 'spr-20230924-100917', 45, NULL, 567, 20, 1, 1100, NULL, 0, 'Cash', NULL, '2023-09-24 04:09:17', '2023-09-24 04:09:17'),
(564, 'spr-20230924-101014', 45, NULL, 568, 20, 1, 325.5, NULL, 0, 'Cash', NULL, '2023-09-24 04:10:14', '2023-09-24 04:10:14'),
(565, 'spr-20230924-101741', 45, NULL, 569, 20, 1, 330, NULL, 0, 'Cash', NULL, '2023-09-24 04:17:41', '2023-09-24 04:17:41'),
(566, 'spr-20230924-104221', 45, NULL, 570, 20, 1, 346.5, NULL, 0, 'Cash', NULL, '2023-09-24 04:42:21', '2023-09-24 04:42:21'),
(567, 'spr-20230924-110957', 45, NULL, 571, 20, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-24 05:09:57', '2023-09-24 05:09:57'),
(568, 'spr-20230924-111834', 45, NULL, 572, 20, 1, 3300, NULL, 0, 'Cash', NULL, '2023-09-24 05:18:34', '2023-09-24 05:18:34'),
(569, 'spr-20230924-112344', 45, NULL, 573, 20, 1, 315, NULL, 0, 'Cash', NULL, '2023-09-24 05:23:44', '2023-09-24 05:23:44'),
(570, 'spr-20230924-113422', 45, NULL, 574, 20, 1, 78.5, NULL, 0, 'Cash', NULL, '2023-09-24 05:34:22', '2023-09-24 05:34:22'),
(571, 'spr-20230924-115800', 45, NULL, 575, 20, 1, 1980, NULL, 0, 'Cash', NULL, '2023-09-24 05:58:00', '2023-09-24 05:58:00'),
(572, 'spr-20230924-123152', 45, NULL, 576, 20, 1, 1200.5, NULL, 0, 'Cash', NULL, '2023-09-24 06:31:52', '2023-09-24 06:31:52'),
(573, 'spr-20230924-124708', 45, NULL, 577, 20, 1, 330, NULL, 0, 'Cash', NULL, '2023-09-24 06:47:08', '2023-09-24 06:47:08'),
(574, 'spr-20230924-124936', 45, NULL, 578, 20, 1, 154, NULL, 0, 'Cash', NULL, '2023-09-24 06:49:36', '2023-09-24 06:49:36'),
(575, 'spr-20230924-010807', 45, NULL, 579, 20, 1, 322, NULL, 0, 'Cash', NULL, '2023-09-24 07:08:07', '2023-09-24 07:08:07'),
(576, 'spr-20230924-040223', 45, NULL, 580, 20, 1, 332.75, NULL, 0, 'Cash', NULL, '2023-09-24 10:02:23', '2023-09-24 10:02:23'),
(577, 'spr-20230924-040313', 45, NULL, 581, 20, 1, 130, NULL, 0, 'Cash', NULL, '2023-09-24 10:03:13', '2023-09-24 10:03:13'),
(578, 'spr-20230924-040337', 45, NULL, 582, 20, 1, 700, NULL, 0, 'Cash', NULL, '2023-09-24 10:03:37', '2023-09-24 10:03:37'),
(579, 'spr-20230924-040402', 45, NULL, 583, 20, 1, 1400, NULL, 0, 'Cash', NULL, '2023-09-24 10:04:02', '2023-09-24 10:04:02'),
(580, 'spr-20230924-040659', 45, NULL, 584, 20, 1, 360.5, NULL, 0, 'Cash', NULL, '2023-09-24 10:06:59', '2023-09-24 10:06:59'),
(581, 'spr-20230924-040728', 45, NULL, 585, 20, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-24 10:07:28', '2023-09-24 10:07:28'),
(582, 'spr-20230924-040759', 45, NULL, 586, 20, 1, 1100, NULL, 0, 'Cash', NULL, '2023-09-24 10:07:59', '2023-09-24 10:07:59'),
(583, 'spr-20230924-043511', 45, NULL, 587, 20, 1, 2200, NULL, 0, 'Cash', NULL, '2023-09-24 10:35:11', '2023-09-24 10:35:11'),
(584, 'spr-20230924-061950', 45, NULL, 588, 20, 1, 5673.75, NULL, 0, 'Cash', NULL, '2023-09-24 12:19:50', '2023-09-24 12:19:50'),
(585, 'spr-20230924-062100', 45, NULL, 589, 20, 1, 315, NULL, 0, 'Cash', NULL, '2023-09-24 12:21:00', '2023-09-24 12:21:00'),
(586, 'spr-20230924-062211', 45, NULL, 590, 20, 1, 300, NULL, 0, 'Cash', NULL, '2023-09-24 12:22:11', '2023-09-24 12:22:11'),
(587, 'spr-20230924-062354', 45, NULL, 591, 20, 1, 176, NULL, 0, 'Cash', NULL, '2023-09-24 12:23:54', '2023-09-24 12:23:54'),
(588, 'spr-20230924-062542', 45, NULL, 592, 20, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-24 12:25:42', '2023-09-24 12:25:42'),
(589, 'spr-20230924-062610', 45, NULL, 593, 20, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-24 12:26:10', '2023-09-24 12:26:10'),
(590, 'spr-20230924-062632', 45, NULL, 594, 20, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-24 12:26:32', '2023-09-24 12:26:32'),
(591, 'spr-20230924-062654', 45, NULL, 595, 20, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-24 12:26:54', '2023-09-24 12:26:54'),
(592, 'spr-20230924-062720', 45, NULL, 596, 20, 1, 1100, NULL, 0, 'Cash', NULL, '2023-09-24 12:27:20', '2023-09-24 12:27:20'),
(593, 'spr-20230924-062744', 45, NULL, 597, 20, 1, 100.25, NULL, 0, 'Cash', NULL, '2023-09-24 12:27:44', '2023-09-24 12:27:44'),
(594, 'spr-20230924-062806', 45, NULL, 598, 20, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-24 12:28:06', '2023-09-24 12:28:06'),
(595, 'spr-20230924-062858', 45, NULL, 599, 20, 1, 325, NULL, 0, 'Cash', NULL, '2023-09-24 12:28:58', '2023-09-24 12:28:58'),
(596, 'spr-20230924-062925', 45, NULL, 600, 20, 1, 260, NULL, 0, 'Cash', NULL, '2023-09-24 12:29:25', '2023-09-24 12:29:25'),
(597, 'spr-20230924-063006', 45, NULL, 601, 20, 1, 450, NULL, 0, 'Cash', NULL, '2023-09-24 12:30:06', '2023-09-24 12:30:06'),
(598, 'spr-20230924-063440', 45, NULL, 602, 20, 1, 170.75, NULL, 0, 'Cash', NULL, '2023-09-24 12:34:40', '2023-09-24 12:34:40'),
(599, 'spr-20230924-063559', 45, NULL, 603, 20, 1, 1100, NULL, 0, 'Cash', NULL, '2023-09-24 12:35:59', '2023-09-24 12:35:59'),
(600, 'spr-20230924-064357', 45, NULL, 604, 20, 1, 45, NULL, 0, 'Cash', NULL, '2023-09-24 12:43:57', '2023-09-24 12:43:57'),
(601, 'spr-20230924-074210', 45, NULL, 605, 20, 1, 990, NULL, 0, 'Cash', NULL, '2023-09-24 13:42:10', '2023-09-24 13:42:10'),
(602, 'spr-20230924-075831', 45, NULL, 606, 20, 1, 53040, NULL, 0, 'Cash', NULL, '2023-09-24 13:58:31', '2023-09-24 13:58:31'),
(603, 'spr-20230924-075942', 45, NULL, 607, 20, 1, 9588, NULL, 0, 'Cash', NULL, '2023-09-24 13:59:42', '2023-09-24 13:59:42'),
(604, 'spr-20230924-080034', 45, NULL, 608, 20, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-24 14:00:34', '2023-09-24 14:00:34'),
(605, 'spr-20230924-080113', 45, NULL, 609, 20, 1, 330.5, NULL, 0, 'Cash', NULL, '2023-09-24 14:01:13', '2023-09-24 14:01:13'),
(606, 'spr-20230924-081134', 45, NULL, 610, 20, 1, 45, NULL, 0, 'Cash', NULL, '2023-09-24 14:11:34', '2023-09-24 14:11:34'),
(607, 'spr-20230924-083120', 45, NULL, 611, 20, 1, 135, NULL, 0, 'Cash', NULL, '2023-09-24 14:31:20', '2023-09-24 14:31:20'),
(608, 'spr-20230924-083714', 45, NULL, 612, 20, 1, 330.5, NULL, 0, 'Cash', NULL, '2023-09-24 14:37:14', '2023-09-24 14:37:14'),
(609, 'spr-20230924-083730', 45, NULL, 613, 20, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-24 14:37:30', '2023-09-24 14:37:30'),
(610, 'spr-20230924-083740', 45, NULL, 614, 20, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-24 14:37:40', '2023-09-24 14:37:40'),
(611, 'spr-20230924-083951', 45, NULL, 615, 20, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-24 14:39:51', '2023-09-24 14:39:51'),
(612, 'spr-20230924-090904', 45, NULL, 616, 20, 1, 690, NULL, 0, 'Cash', NULL, '2023-09-24 15:09:04', '2023-09-24 15:09:04'),
(613, 'spr-20230924-090953', 45, NULL, 617, 20, 1, 135, NULL, 0, 'Cash', NULL, '2023-09-24 15:09:53', '2023-09-24 15:09:53'),
(614, 'spr-20230924-091505', 45, NULL, 618, 20, 1, 210, NULL, 0, 'Cash', NULL, '2023-09-24 15:15:05', '2023-09-24 15:15:05'),
(615, 'spr-20230924-091530', 45, NULL, 619, 20, 1, 330.5, NULL, 0, 'Cash', NULL, '2023-09-24 15:15:30', '2023-09-24 15:15:30'),
(616, 'spr-20230924-091922', 45, NULL, 620, 20, 1, 195, NULL, 0, 'Cash', NULL, '2023-09-24 15:19:22', '2023-09-24 15:19:22'),
(617, 'spr-20230924-092242', 45, NULL, 621, 20, 1, 315, NULL, 0, 'Cash', NULL, '2023-09-24 15:22:42', '2023-09-24 15:22:42'),
(618, 'spr-20230924-092511', 45, NULL, 622, 20, 1, 3300, NULL, 0, 'Cash', NULL, '2023-09-24 15:25:11', '2023-09-24 15:25:11'),
(619, 'spr-20230924-092604', 45, NULL, 623, 20, 1, 3270, NULL, 0, 'Cash', NULL, '2023-09-24 15:26:04', '2023-09-24 15:26:04'),
(620, 'spr-20230924-092635', 45, NULL, 624, 20, 1, 1276.5, NULL, 0, 'Cash', NULL, '2023-09-24 15:26:35', '2023-09-24 15:26:35'),
(621, 'spr-20230924-092903', 45, NULL, 625, 20, 1, 867.5, NULL, 0, 'Cash', NULL, '2023-09-24 15:29:03', '2023-09-24 15:29:03'),
(622, 'spr-20230924-092935', 45, NULL, 626, 20, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-24 15:29:35', '2023-09-24 15:29:35'),
(623, 'spr-20230924-093604', 45, NULL, 627, 20, 1, 1320, NULL, 0, 'Cash', NULL, '2023-09-24 15:36:04', '2023-09-24 15:36:04'),
(624, 'spr-20230924-093643', 45, NULL, 628, 20, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-24 15:36:43', '2023-09-24 15:36:43'),
(625, 'spr-20230924-093853', 45, NULL, 629, 20, 1, 325.5, NULL, 0, 'Cash', NULL, '2023-09-24 15:38:53', '2023-09-24 15:38:53'),
(626, 'spr-20230924-101241', 45, NULL, 630, 20, 1, 1202.5, NULL, 0, 'Cash', NULL, '2023-09-24 16:12:41', '2023-09-24 16:12:41'),
(627, 'spr-20230924-101714', 45, NULL, 631, 20, 1, 660, NULL, 0, 'Cash', NULL, '2023-09-24 16:17:14', '2023-09-24 16:17:14'),
(628, 'spr-20230924-101740', 45, NULL, 632, 20, 1, 313, NULL, 0, 'Cash', NULL, '2023-09-24 16:17:40', '2023-09-24 16:17:40'),
(629, 'spr-20230925-042624', 45, NULL, 633, 21, 1, 374, NULL, 0, 'Cash', NULL, '2023-09-25 10:26:24', '2023-09-25 10:26:24'),
(630, 'spr-20230925-042749', 45, NULL, 634, 21, 1, 360.5, NULL, 0, 'Cash', NULL, '2023-09-25 10:27:49', '2023-09-25 10:27:49'),
(631, 'spr-20230925-043704', 45, NULL, 635, 21, 1, 300, NULL, 0, 'Cash', NULL, '2023-09-25 10:37:04', '2023-09-25 10:37:04'),
(632, 'spr-20230925-043826', 45, NULL, 636, 21, 1, 570.5, NULL, 0, 'Cash', NULL, '2023-09-25 10:38:26', '2023-09-25 10:38:26'),
(633, 'spr-20230925-044748', 45, NULL, 637, 21, 1, 397.5, NULL, 0, 'Cash', NULL, '2023-09-25 10:47:48', '2023-09-25 10:47:48'),
(634, 'spr-20230925-045502', 45, NULL, 638, 21, 1, 297.5, NULL, 0, 'Cash', NULL, '2023-09-25 10:55:02', '2023-09-25 10:55:02'),
(635, 'spr-20230925-045553', 45, NULL, 639, 21, 1, 336.75, NULL, 0, 'Cash', NULL, '2023-09-25 10:55:53', '2023-09-25 10:55:53'),
(636, 'spr-20230925-045716', 45, NULL, 640, 21, 1, 365.5, NULL, 0, 'Cash', NULL, '2023-09-25 10:57:16', '2023-09-25 10:57:16'),
(637, 'spr-20230925-045831', 45, NULL, 641, 21, 1, 357.5, NULL, 0, 'Cash', NULL, '2023-09-25 10:58:31', '2023-09-25 10:58:31'),
(638, 'spr-20230925-053536', 45, NULL, 642, 21, 1, 4413, NULL, 0, 'Cash', NULL, '2023-09-25 11:35:36', '2023-09-25 11:35:36'),
(639, 'spr-20230925-053645', 45, NULL, 643, 21, 1, 246.75, NULL, 0, 'Cash', NULL, '2023-09-25 11:36:45', '2023-09-25 11:36:45'),
(640, 'spr-20230925-054824', 45, NULL, 644, 21, 1, 6050, NULL, 0, 'Cash', NULL, '2023-09-25 11:48:24', '2023-09-25 11:48:24'),
(641, 'spr-20230925-055037', 45, NULL, 645, 21, 1, 1343.5, NULL, 0, 'Cash', NULL, '2023-09-25 11:50:37', '2023-09-25 11:50:37'),
(642, 'spr-20230925-055548', 45, NULL, 646, 21, 1, 270, NULL, 0, 'Cash', NULL, '2023-09-25 11:55:48', '2023-09-25 11:55:48'),
(643, 'spr-20230925-055841', 45, NULL, 647, 21, 1, 337.5, NULL, 0, 'Cash', NULL, '2023-09-25 11:58:41', '2023-09-25 11:58:41'),
(644, 'spr-20230925-055937', 45, NULL, 648, 21, 1, 40, NULL, 0, 'Cash', NULL, '2023-09-25 11:59:37', '2023-09-25 11:59:37'),
(645, 'spr-20230925-060015', 45, NULL, 649, 21, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-25 12:00:15', '2023-09-25 12:00:15'),
(646, 'spr-20230925-060039', 45, NULL, 650, 21, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-25 12:00:39', '2023-09-25 12:00:39'),
(647, 'spr-20230925-060320', 45, NULL, 651, 21, 1, 70.75, NULL, 0, 'Cash', NULL, '2023-09-25 12:03:20', '2023-09-25 12:03:20'),
(648, 'spr-20230925-060626', 45, NULL, 652, 21, 1, 2160, NULL, 0, 'Cash', NULL, '2023-09-25 12:06:26', '2023-09-25 12:06:26'),
(649, 'spr-20230925-060654', 45, NULL, 653, 21, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-25 12:06:54', '2023-09-25 12:06:54'),
(650, 'spr-20230925-060903', 45, NULL, 654, 21, 1, 45, NULL, 0, 'Cash', NULL, '2023-09-25 12:09:03', '2023-09-25 12:09:03'),
(651, 'spr-20230925-061047', 45, NULL, 655, 21, 1, 1650.5, NULL, 0, 'Cash', NULL, '2023-09-25 12:10:47', '2023-09-25 12:10:47'),
(652, 'spr-20230925-061218', 45, NULL, 656, 21, 1, 50.25, NULL, 0, 'Cash', NULL, '2023-09-25 12:12:18', '2023-09-25 12:12:18'),
(653, 'spr-20230925-061815', 45, NULL, 657, 21, 1, 168.75, NULL, 0, 'Cash', NULL, '2023-09-25 12:18:15', '2023-09-25 12:18:15'),
(654, 'spr-20230925-061903', 45, NULL, 658, 21, 1, 270, NULL, 0, 'Cash', NULL, '2023-09-25 12:19:03', '2023-09-25 12:19:03'),
(655, 'spr-20230925-061927', 45, NULL, 659, 21, 1, 525, NULL, 0, 'Cash', NULL, '2023-09-25 12:19:27', '2023-09-25 12:19:27'),
(656, 'spr-20230925-062003', 45, NULL, 660, 21, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-25 12:20:03', '2023-09-25 12:20:03'),
(657, 'spr-20230925-062017', 45, NULL, 661, 21, 1, 130, NULL, 0, 'Cash', NULL, '2023-09-25 12:20:17', '2023-09-25 12:20:17'),
(658, 'spr-20230925-062108', 45, NULL, 662, 21, 1, 490.5, NULL, 0, 'Cash', NULL, '2023-09-25 12:21:08', '2023-09-25 12:21:08'),
(659, 'spr-20230925-063504', 45, NULL, 663, 21, 1, 560, NULL, 0, 'Cash', NULL, '2023-09-25 12:35:04', '2023-09-25 12:35:04'),
(660, 'spr-20230925-065200', 45, NULL, 664, 21, 1, 290.5, NULL, 0, 'Cash', NULL, '2023-09-25 12:52:00', '2023-09-25 12:52:00'),
(661, 'spr-20230925-065221', 45, NULL, 665, 21, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-25 12:52:21', '2023-09-25 12:52:21'),
(662, 'spr-20230925-065239', 45, NULL, 666, 21, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-25 12:52:39', '2023-09-25 12:52:39'),
(663, 'spr-20230925-065311', 45, NULL, 667, 21, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-25 12:53:11', '2023-09-25 12:53:11'),
(664, 'spr-20230925-065433', 45, NULL, 668, 21, 1, 654, NULL, 0, 'Cash', NULL, '2023-09-25 12:54:33', '2023-09-25 12:54:33'),
(665, 'spr-20230925-065550', 45, NULL, 669, 21, 1, 3300, NULL, 0, 'Cash', NULL, '2023-09-25 12:55:50', '2023-09-25 12:55:50'),
(666, 'spr-20230925-065653', 45, NULL, 670, 21, 1, 3270, NULL, 0, 'Cash', NULL, '2023-09-25 12:56:53', '2023-09-25 12:56:53'),
(667, 'spr-20230925-071303', 45, NULL, 671, 21, 1, 130, NULL, 0, 'Cash', NULL, '2023-09-25 13:13:03', '2023-09-25 13:13:03'),
(668, 'spr-20230925-071930', 45, NULL, 672, 21, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-25 13:19:30', '2023-09-25 13:19:30'),
(669, 'spr-20230925-074117', 45, NULL, 673, 21, 1, 32.5, NULL, 0, 'Cash', NULL, '2023-09-25 13:41:17', '2023-09-25 13:41:17'),
(670, 'spr-20230925-082007', 45, NULL, 674, 21, 1, 742, NULL, 0, 'Cash', NULL, '2023-09-25 14:20:07', '2023-09-25 14:20:07'),
(671, 'spr-20230925-082142', 45, NULL, 675, 21, 1, 870.5, NULL, 0, 'Cash', NULL, '2023-09-25 14:21:42', '2023-09-25 14:21:42'),
(672, 'spr-20230925-082230', 45, NULL, 676, 21, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-25 14:22:30', '2023-09-25 14:22:30'),
(673, 'spr-20230925-082722', 45, NULL, 677, 21, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-25 14:27:22', '2023-09-25 14:27:22'),
(674, 'spr-20230925-084217', 45, NULL, 678, 21, 1, 780, NULL, 0, 'Cash', NULL, '2023-09-25 14:42:17', '2023-09-25 14:42:17'),
(675, 'spr-20230925-084518', 45, NULL, 679, 21, 1, 440, NULL, 0, 'Cash', NULL, '2023-09-25 14:45:18', '2023-09-25 14:45:18'),
(676, 'spr-20230925-091110', 45, NULL, 680, 21, 1, 345.13, NULL, 0, 'Cash', NULL, '2023-09-25 15:11:10', '2023-09-25 15:11:10'),
(677, 'spr-20230925-091249', 45, NULL, 681, 21, 1, 680, NULL, 0, 'Cash', NULL, '2023-09-25 15:12:49', '2023-09-25 15:12:49'),
(678, 'spr-20230925-091556', 45, NULL, 682, 21, 1, 300, NULL, 0, 'Cash', NULL, '2023-09-25 15:15:56', '2023-09-25 15:15:56'),
(679, 'spr-20230925-092151', 45, NULL, 683, 21, 1, 100, NULL, 0, 'Cash', NULL, '2023-09-25 15:21:51', '2023-09-25 15:21:51'),
(680, 'spr-20230925-093146', 45, NULL, 684, 21, 1, 135, NULL, 0, 'Cash', NULL, '2023-09-25 15:31:46', '2023-09-25 15:31:46'),
(681, 'spr-20230926-120515', 45, NULL, 685, 22, 1, 575.5, NULL, 0, 'Cash', NULL, '2023-09-26 06:05:15', '2023-09-26 06:05:15'),
(682, 'spr-20230926-120741', 45, NULL, 686, 22, 1, 945.5, NULL, 0, 'Cash', NULL, '2023-09-26 06:07:41', '2023-09-26 06:07:41'),
(683, 'spr-20230926-121152', 45, NULL, 687, 22, 1, 195, NULL, 0, 'Cash', NULL, '2023-09-26 06:11:52', '2023-09-26 06:11:52'),
(684, 'spr-20230926-121749', 45, NULL, 688, 22, 1, 320.25, NULL, 0, 'Cash', NULL, '2023-09-26 06:17:49', '2023-09-26 06:17:49'),
(685, 'spr-20230926-121927', 45, NULL, 689, 22, 1, 45, NULL, 0, 'Cash', NULL, '2023-09-26 06:19:27', '2023-09-26 06:19:27'),
(686, 'spr-20230926-122015', 45, NULL, 690, 22, 1, 1090, NULL, 0, 'Cash', NULL, '2023-09-26 06:20:15', '2023-09-26 06:20:15'),
(687, 'spr-20230926-124143', 45, NULL, 691, 22, 1, 398.5, NULL, 0, 'Cash', NULL, '2023-09-26 06:41:43', '2023-09-26 06:41:43'),
(688, 'spr-20230926-124239', 45, NULL, 692, 22, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-26 06:42:39', '2023-09-26 06:42:39'),
(689, 'spr-20230926-124411', 45, NULL, 693, 22, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-26 06:44:11', '2023-09-26 06:44:11'),
(690, 'spr-20230926-124455', 45, NULL, 694, 22, 1, 135, NULL, 0, 'Cash', NULL, '2023-09-26 06:44:55', '2023-09-26 06:44:55'),
(691, 'spr-20230926-124632', 45, NULL, 695, 22, 1, 2484.5, NULL, 0, 'Cash', NULL, '2023-09-26 06:46:32', '2023-09-26 06:46:32'),
(692, 'spr-20230926-124651', 45, NULL, 696, 22, 1, 135, NULL, 0, 'Cash', NULL, '2023-09-26 06:46:51', '2023-09-26 06:46:51'),
(693, 'spr-20230926-124719', 45, NULL, 697, 22, 1, 270, NULL, 0, 'Cash', NULL, '2023-09-26 06:47:19', '2023-09-26 06:47:19'),
(694, 'spr-20230926-011420', 45, NULL, 698, 22, 1, 3270, NULL, 0, 'Cash', NULL, '2023-09-26 07:14:20', '2023-09-26 07:14:20'),
(695, 'spr-20230926-020843', 45, NULL, 699, 22, 1, 340.53, NULL, 0, 'Cash', NULL, '2023-09-26 08:08:43', '2023-09-26 08:08:43'),
(696, 'spr-20230926-022505', 45, NULL, 700, 22, 1, 335.5, NULL, 0, 'Cash', NULL, '2023-09-26 08:25:05', '2023-09-26 08:25:05'),
(697, 'spr-20230926-022633', 45, NULL, 701, 22, 1, 565.5, NULL, 0, 'Cash', NULL, '2023-09-26 08:26:33', '2023-09-26 08:26:33'),
(698, 'spr-20230926-025455', 45, NULL, 702, 22, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-26 08:54:55', '2023-09-26 08:54:55'),
(699, 'spr-20230926-035328', 45, NULL, 703, 22, 1, 318.13, NULL, 0, 'Cash', NULL, '2023-09-26 09:53:28', '2023-09-26 09:53:28'),
(700, 'spr-20230926-035357', 45, NULL, 704, 22, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-26 09:53:57', '2023-09-26 09:53:57'),
(701, 'spr-20230926-040840', 45, NULL, 705, 22, 1, 975, NULL, 0, 'Cash', NULL, '2023-09-26 10:08:40', '2023-09-26 10:08:40'),
(702, 'spr-20230926-040936', 45, NULL, 706, 22, 1, 290.5, NULL, 0, 'Cash', NULL, '2023-09-26 10:09:36', '2023-09-26 10:09:36'),
(703, 'spr-20230926-041245', 45, NULL, 707, 22, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-26 10:12:45', '2023-09-26 10:12:45'),
(704, 'spr-20230926-050530', 45, NULL, 708, 22, 1, 70, NULL, 0, 'Cash', NULL, '2023-09-26 11:05:30', '2023-09-26 11:05:30'),
(705, 'spr-20230926-052148', 45, NULL, 709, 22, 1, 290.5, NULL, 0, 'Cash', NULL, '2023-09-26 11:21:48', '2023-09-26 11:21:48'),
(706, 'spr-20230926-052219', 45, NULL, 710, 22, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-26 11:22:19', '2023-09-26 11:22:19'),
(707, 'spr-20230926-052328', 45, NULL, 711, 22, 1, 1100, NULL, 0, 'Cash', NULL, '2023-09-26 11:23:28', '2023-09-26 11:23:28'),
(708, 'spr-20230926-060751', 45, NULL, 712, 22, 1, 195, NULL, 0, 'Cash', NULL, '2023-09-26 12:07:51', '2023-09-26 12:07:51'),
(709, 'spr-20230926-060833', 45, NULL, 713, 22, 1, 555.75, NULL, 0, 'Cash', NULL, '2023-09-26 12:08:33', '2023-09-26 12:08:33'),
(710, 'spr-20230926-060927', 45, NULL, 714, 22, 1, 338.5, NULL, 0, 'Cash', NULL, '2023-09-26 12:09:27', '2023-09-26 12:09:27'),
(711, 'spr-20230926-061115', 45, NULL, 715, 22, 1, 306, NULL, 0, 'Cash', NULL, '2023-09-26 12:11:15', '2023-09-26 12:11:15'),
(712, 'spr-20230926-061139', 45, NULL, 716, 22, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-26 12:11:39', '2023-09-26 12:11:39'),
(713, 'spr-20230926-061158', 45, NULL, 717, 22, 1, 45, NULL, 0, 'Cash', NULL, '2023-09-26 12:11:58', '2023-09-26 12:11:58'),
(714, 'spr-20230926-063624', 45, NULL, 718, 22, 1, 110.5, NULL, 0, 'Cash', NULL, '2023-09-26 12:36:24', '2023-09-26 12:36:24'),
(715, 'spr-20230926-063648', 45, NULL, 719, 22, 1, 220, NULL, 0, 'Cash', NULL, '2023-09-26 12:36:48', '2023-09-26 12:36:48'),
(716, 'spr-20230926-063757', 45, NULL, 720, 22, 1, 664.5, NULL, 0, 'Cash', NULL, '2023-09-26 12:37:57', '2023-09-26 12:37:57'),
(717, 'spr-20230926-063823', 45, NULL, 721, 22, 1, 420, NULL, 0, 'Cash', NULL, '2023-09-26 12:38:23', '2023-09-26 12:38:23'),
(718, 'spr-20230926-064454', 45, NULL, 722, 22, 1, 135, NULL, 0, 'Cash', NULL, '2023-09-26 12:44:54', '2023-09-26 12:44:54'),
(719, 'spr-20230926-064818', 45, NULL, 723, 22, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-26 12:48:18', '2023-09-26 12:48:18'),
(720, 'spr-20230926-065209', 45, NULL, 724, 22, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-26 12:52:09', '2023-09-26 12:52:09'),
(721, 'spr-20230926-065958', 45, NULL, 725, 22, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-26 12:59:58', '2023-09-26 12:59:58'),
(722, 'spr-20230926-072255', 45, NULL, 726, 22, 1, 1150.75, NULL, 0, 'Cash', NULL, '2023-09-26 13:22:55', '2023-09-26 13:22:55'),
(723, 'spr-20230926-082909', 45, NULL, 727, 22, 1, 250.75, NULL, 0, 'Cash', NULL, '2023-09-26 14:29:09', '2023-09-26 14:29:09'),
(724, 'spr-20230926-082953', 45, NULL, 728, 22, 1, 340, NULL, 0, 'Cash', NULL, '2023-09-26 14:29:53', '2023-09-26 14:29:53'),
(726, 'spr-20230926-083145', 45, NULL, 730, 22, 1, 646, NULL, 0, 'Cash', NULL, '2023-09-26 14:31:45', '2023-09-26 14:31:45'),
(727, 'spr-20230926-083229', 45, NULL, 731, 22, 1, 1065, NULL, 0, 'Cash', NULL, '2023-09-26 14:32:29', '2023-09-26 14:32:29'),
(728, 'spr-20230926-083325', 45, NULL, 732, 22, 1, 230.5, NULL, 0, 'Cash', NULL, '2023-09-26 14:33:25', '2023-09-26 14:33:25'),
(729, 'spr-20230926-083348', 45, NULL, 733, 22, 1, 98.5, NULL, 0, 'Cash', NULL, '2023-09-26 14:33:48', '2023-09-26 14:33:48'),
(730, 'spr-20230926-083444', 45, NULL, 734, 22, 1, 660, NULL, 0, 'Cash', NULL, '2023-09-26 14:34:44', '2023-09-26 14:34:44'),
(731, 'spr-20230926-083504', 45, NULL, 735, 22, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-26 14:35:04', '2023-09-26 14:35:04'),
(732, 'spr-20230926-083520', 45, NULL, 736, 22, 1, 45, NULL, 0, 'Cash', NULL, '2023-09-26 14:35:20', '2023-09-26 14:35:20'),
(733, 'spr-20230926-084657', 45, NULL, 737, 22, 1, 550.5, NULL, 0, 'Cash', NULL, '2023-09-26 14:46:57', '2023-09-26 14:46:57'),
(734, 'spr-20230926-085125', 45, NULL, 738, 22, 1, 55608.5, NULL, 0, 'Cash', NULL, '2023-09-26 14:51:25', '2023-09-26 14:51:25'),
(735, 'spr-20230926-090135', 45, NULL, 739, 22, 1, 3270, NULL, 0, 'Cash', NULL, '2023-09-26 15:01:35', '2023-09-26 15:01:35'),
(736, 'spr-20230926-090256', 45, NULL, 740, 22, 1, 4360, NULL, 0, 'Cash', NULL, '2023-09-26 15:02:56', '2023-09-26 15:02:56'),
(737, 'spr-20230926-090418', 45, NULL, 741, 22, 1, 2240, NULL, 0, 'Cash', NULL, '2023-09-26 15:04:18', '2023-09-26 15:04:18'),
(738, 'spr-20230927-120045', 45, NULL, 742, 23, 1, 530.5, NULL, 0, 'Cash', NULL, '2023-09-27 06:00:45', '2023-09-27 06:00:45'),
(739, 'spr-20230927-121611', 45, NULL, 743, 23, 1, 3200.5, NULL, 0, 'Cash', NULL, '2023-09-27 06:16:11', '2023-09-27 06:16:11'),
(740, 'spr-20230927-121710', 45, NULL, 744, 23, 1, 320.5, NULL, 0, 'Cash', NULL, '2023-09-27 06:17:10', '2023-09-27 06:17:10'),
(741, 'spr-20230927-122130', 45, NULL, 745, 23, 1, 500.5, NULL, 0, 'Cash', NULL, '2023-09-27 06:21:30', '2023-09-27 06:21:30'),
(742, 'spr-20230927-122925', 45, NULL, 746, 23, 1, 945.5, NULL, 0, 'Cash', NULL, '2023-09-27 06:29:25', '2023-09-27 06:29:25'),
(743, 'spr-20230927-122958', 45, NULL, 747, 23, 1, 315, NULL, 0, 'Cash', NULL, '2023-09-27 06:29:58', '2023-09-27 06:29:58'),
(744, 'spr-20230927-123022', 45, NULL, 748, 23, 1, 280, NULL, 0, 'Cash', NULL, '2023-09-27 06:30:22', '2023-09-27 06:30:22'),
(745, 'spr-20230927-123338', 45, NULL, 749, 23, 1, 290.5, NULL, 0, 'Cash', NULL, '2023-09-27 06:33:38', '2023-09-27 06:33:38'),
(746, 'spr-20230927-123501', 45, NULL, 750, 23, 1, 310, NULL, 0, 'Cash', NULL, '2023-09-27 06:35:01', '2023-09-27 06:35:01'),
(747, 'spr-20230927-123556', 45, NULL, 751, 23, 1, 270, NULL, 0, 'Cash', NULL, '2023-09-27 06:35:56', '2023-09-27 06:35:56'),
(748, 'spr-20230927-124238', 45, NULL, 752, 23, 1, 55.25, NULL, 0, 'Cash', NULL, '2023-09-27 06:42:38', '2023-09-27 06:42:38'),
(749, 'spr-20230927-124332', 45, NULL, 753, 23, 1, 20.5, NULL, 0, 'Cash', NULL, '2023-09-27 06:43:32', '2023-09-27 06:43:32'),
(750, 'spr-20230927-124357', 45, NULL, 754, 23, 1, 330.5, NULL, 0, 'Cash', NULL, '2023-09-27 06:43:57', '2023-09-27 06:43:57'),
(751, 'spr-20230927-124417', 45, NULL, 755, 23, 1, 330.5, NULL, 0, 'Cash', NULL, '2023-09-27 06:44:17', '2023-09-27 06:44:17'),
(752, 'spr-20230927-124642', 45, NULL, 756, 23, 1, 1090, NULL, 0, 'Cash', NULL, '2023-09-27 06:46:42', '2023-09-27 06:46:42'),
(753, 'spr-20230927-010021', 45, NULL, 757, 23, 1, 45, NULL, 0, 'Cash', NULL, '2023-09-27 07:00:21', '2023-09-27 07:00:21'),
(754, 'spr-20230927-010047', 45, NULL, 758, 23, 1, 680, NULL, 0, 'Cash', NULL, '2023-09-27 07:00:47', '2023-09-27 07:00:47'),
(755, 'spr-20230927-010110', 45, NULL, 759, 23, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-27 07:01:10', '2023-09-27 07:01:10'),
(756, 'spr-20230927-010310', 45, NULL, 760, 23, 1, 1080, NULL, 0, 'Cash', NULL, '2023-09-27 07:03:10', '2023-09-27 07:03:10'),
(757, 'spr-20230927-010704', 45, NULL, 761, 23, 1, 4632.5, NULL, 0, 'Cash', NULL, '2023-09-27 07:07:04', '2023-09-27 07:07:04'),
(758, 'spr-20230927-010838', 45, NULL, 762, 23, 1, 130, NULL, 0, 'Cash', NULL, '2023-09-27 07:08:38', '2023-09-27 07:08:38'),
(759, 'spr-20230927-010929', 45, NULL, 763, 23, 1, 245, NULL, 0, 'Cash', NULL, '2023-09-27 07:09:29', '2023-09-27 07:09:29'),
(760, 'spr-20230927-010947', 45, NULL, 764, 23, 1, 130, NULL, 0, 'Cash', NULL, '2023-09-27 07:09:47', '2023-09-27 07:09:47'),
(761, 'spr-20230927-011004', 45, NULL, 765, 23, 1, 130, NULL, 0, 'Cash', NULL, '2023-09-27 07:10:04', '2023-09-27 07:10:04'),
(762, 'spr-20230927-011020', 45, NULL, 766, 23, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-27 07:10:20', '2023-09-27 07:10:20'),
(763, 'spr-20230927-011122', 45, NULL, 767, 23, 1, 3270, NULL, 0, 'Cash', NULL, '2023-09-27 07:11:22', '2023-09-27 07:11:22'),
(764, 'spr-20230927-011236', 45, NULL, 768, 23, 1, 3240, NULL, 0, 'Cash', NULL, '2023-09-27 07:12:36', '2023-09-27 07:12:36'),
(765, 'spr-20230927-011307', 45, NULL, 769, 23, 1, 10.25, NULL, 0, 'Cash', NULL, '2023-09-27 07:13:07', '2023-09-27 07:13:07'),
(766, 'spr-20230927-012931', 45, NULL, 770, 23, 1, 240, NULL, 0, 'Cash', NULL, '2023-09-27 07:29:31', '2023-09-27 07:29:31'),
(767, 'spr-20230927-013002', 45, NULL, 771, 23, 1, 306, NULL, 0, 'Cash', NULL, '2023-09-27 07:30:02', '2023-09-27 07:30:02'),
(768, 'spr-20230927-014417', 45, NULL, 772, 23, 1, 180, NULL, 0, 'Cash', NULL, '2023-09-27 07:44:17', '2023-09-27 07:44:17'),
(769, 'spr-20230927-021851', 45, NULL, 773, 23, 1, 1944, NULL, 0, 'Cash', NULL, '2023-09-27 08:18:51', '2023-09-27 08:18:51'),
(770, 'spr-20230927-021913', 45, NULL, 774, 23, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-27 08:19:13', '2023-09-27 08:19:13'),
(771, 'spr-20230927-022001', 45, NULL, 775, 23, 1, 700, NULL, 0, 'Cash', NULL, '2023-09-27 08:20:01', '2023-09-27 08:20:01'),
(772, 'spr-20230927-024104', 45, NULL, 776, 23, 1, 240, NULL, 0, 'Cash', NULL, '2023-09-27 08:41:04', '2023-09-27 08:41:04'),
(773, 'spr-20230927-024138', 45, NULL, 777, 23, 1, 237, NULL, 0, 'Cash', NULL, '2023-09-27 08:41:38', '2023-09-27 08:41:38'),
(774, 'spr-20230927-052412', 45, NULL, 778, 23, 1, 80.15, NULL, 0, 'Cash', NULL, '2023-09-27 11:24:12', '2023-09-27 11:24:12'),
(775, 'spr-20230927-053458', 45, NULL, 779, 23, 1, 365.25, NULL, 0, 'Cash', NULL, '2023-09-27 11:34:58', '2023-09-27 11:34:58'),
(776, 'spr-20230927-055434', 45, NULL, 780, 23, 1, 300.5, NULL, 0, 'Cash', NULL, '2023-09-27 11:54:34', '2023-09-27 11:54:34'),
(777, 'spr-20230927-055611', 45, NULL, 781, 23, 1, 1752.2, NULL, 0, 'Cash', NULL, '2023-09-27 11:56:11', '2023-09-27 11:56:11'),
(778, 'spr-20230927-055809', 45, NULL, 782, 23, 1, 310, NULL, 0, 'Cash', NULL, '2023-09-27 11:58:09', '2023-09-27 11:58:09'),
(779, 'spr-20230927-055838', 45, NULL, 783, 23, 1, 45, NULL, 0, 'Cash', NULL, '2023-09-27 11:58:38', '2023-09-27 11:58:38'),
(780, 'spr-20230927-055930', 45, NULL, 784, 23, 1, 65.5, NULL, 0, 'Cash', NULL, '2023-09-27 11:59:30', '2023-09-27 11:59:30'),
(781, 'spr-20230927-060006', 45, NULL, 785, 23, 1, 1090, NULL, 0, 'Cash', NULL, '2023-09-27 12:00:06', '2023-09-27 12:00:06'),
(782, 'spr-20230927-060139', 45, NULL, 786, 23, 1, 680, NULL, 0, 'Cash', NULL, '2023-09-27 12:01:39', '2023-09-27 12:01:39'),
(783, 'spr-20230927-060202', 45, NULL, 787, 23, 1, 130, NULL, 0, 'Cash', NULL, '2023-09-27 12:02:02', '2023-09-27 12:02:02'),
(784, 'spr-20230927-060323', 45, NULL, 788, 23, 1, 510, NULL, 0, 'Cash', NULL, '2023-09-27 12:03:23', '2023-09-27 12:03:23'),
(785, 'spr-20230927-062338', 45, NULL, 789, 23, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-27 12:23:38', '2023-09-27 12:23:38'),
(786, 'spr-20230927-062437', 45, NULL, 790, 23, 1, 577.5, NULL, 0, 'Cash', NULL, '2023-09-27 12:24:37', '2023-09-27 12:24:37'),
(787, 'spr-20230927-062617', 45, NULL, 791, 23, 1, 910, NULL, 0, 'Cash', NULL, '2023-09-27 12:26:17', '2023-09-27 12:26:17'),
(788, 'spr-20230927-062919', 45, NULL, 792, 23, 1, 30, NULL, 0, 'Cash', NULL, '2023-09-27 12:29:19', '2023-09-27 12:29:19'),
(789, 'spr-20230927-064924', 45, NULL, 793, 23, 1, 380.2, NULL, 0, 'Cash', NULL, '2023-09-27 12:49:24', '2023-09-27 12:49:24'),
(790, 'spr-20230927-071855', 45, NULL, 794, 23, 1, 340.5, NULL, 0, 'Cash', NULL, '2023-09-27 13:18:55', '2023-09-27 13:18:55'),
(791, 'spr-20230927-074044', 45, NULL, 795, 23, 1, 65, NULL, 0, 'Cash', NULL, '2023-09-27 13:40:44', '2023-09-27 13:40:44'),
(792, 'spr-20230927-082557', 45, NULL, 796, 23, 1, 295.75, NULL, 0, 'Cash', NULL, '2023-09-27 14:25:57', '2023-09-27 14:25:57'),
(793, 'spr-20230927-082753', 45, NULL, 797, 23, 1, 330.5, NULL, 0, 'Cash', NULL, '2023-09-27 14:27:53', '2023-09-27 14:27:53'),
(794, 'spr-20230927-083456', 45, NULL, 798, 23, 1, 110.5, NULL, 0, 'Cash', NULL, '2023-09-27 14:34:56', '2023-09-27 14:34:56'),
(795, 'spr-20230927-083854', 45, NULL, 799, 23, 1, 12480, NULL, 0, 'Cash', NULL, '2023-09-27 14:38:54', '2023-09-27 14:38:54'),
(796, 'spr-20230927-084043', 45, NULL, 800, 23, 1, 330.5, NULL, 0, 'Cash', NULL, '2023-09-27 14:40:43', '2023-09-27 14:40:43'),
(797, 'spr-20230927-084834', 45, NULL, 801, 23, 1, 90, NULL, 0, 'Cash', NULL, '2023-09-27 14:48:34', '2023-09-27 14:48:34'),
(798, 'spr-20230927-084850', 45, NULL, 802, 23, 1, 22.5, NULL, 0, 'Cash', NULL, '2023-09-27 14:48:50', '2023-09-27 14:48:50');

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_cheque`
--

CREATE TABLE `payment_with_cheque` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `cheque_no` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_credit_card`
--

CREATE TABLE `payment_with_credit_card` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_stripe_id` varchar(191) DEFAULT NULL,
  `charge_id` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_gift_card`
--

CREATE TABLE `payment_with_gift_card` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_paypal`
--

CREATE TABLE `payment_with_paypal` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `transaction_id` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(191) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(4, 'products-edit', 'web', '2018-06-03 13:00:09', '2018-06-03 13:00:09'),
(5, 'products-delete', 'web', '2018-06-04 10:54:22', '2018-06-04 10:54:22'),
(6, 'products-add', 'web', '2018-06-04 12:34:14', '2018-06-04 12:34:14'),
(7, 'products-index', 'web', '2018-06-04 15:34:27', '2018-06-04 15:34:27'),
(8, 'purchases-index', 'web', '2018-06-04 20:03:19', '2018-06-04 20:03:19'),
(9, 'purchases-add', 'web', '2018-06-04 20:12:25', '2018-06-04 20:12:25'),
(10, 'purchases-edit', 'web', '2018-06-04 21:47:36', '2018-06-04 21:47:36'),
(11, 'purchases-delete', 'web', '2018-06-04 21:47:36', '2018-06-04 21:47:36'),
(12, 'sales-index', 'web', '2018-06-04 22:49:08', '2018-06-04 22:49:08'),
(13, 'sales-add', 'web', '2018-06-04 22:49:52', '2018-06-04 22:49:52'),
(14, 'sales-edit', 'web', '2018-06-04 22:49:52', '2018-06-04 22:49:52'),
(15, 'sales-delete', 'web', '2018-06-04 22:49:53', '2018-06-04 22:49:53'),
(16, 'quotes-index', 'web', '2018-06-05 10:05:10', '2018-06-05 10:05:10'),
(17, 'quotes-add', 'web', '2018-06-05 10:05:10', '2018-06-05 10:05:10'),
(18, 'quotes-edit', 'web', '2018-06-05 10:05:10', '2018-06-05 10:05:10'),
(19, 'quotes-delete', 'web', '2018-06-05 10:05:10', '2018-06-05 10:05:10'),
(20, 'transfers-index', 'web', '2018-06-05 10:30:03', '2018-06-05 10:30:03'),
(21, 'transfers-add', 'web', '2018-06-05 10:30:03', '2018-06-05 10:30:03'),
(22, 'transfers-edit', 'web', '2018-06-05 10:30:03', '2018-06-05 10:30:03'),
(23, 'transfers-delete', 'web', '2018-06-05 10:30:03', '2018-06-05 10:30:03'),
(24, 'returns-index', 'web', '2018-06-05 10:50:24', '2018-06-05 10:50:24'),
(25, 'returns-add', 'web', '2018-06-05 10:50:24', '2018-06-05 10:50:24'),
(26, 'returns-edit', 'web', '2018-06-05 10:50:25', '2018-06-05 10:50:25'),
(27, 'returns-delete', 'web', '2018-06-05 10:50:25', '2018-06-05 10:50:25'),
(28, 'customers-index', 'web', '2018-06-05 11:15:54', '2018-06-05 11:15:54'),
(29, 'customers-add', 'web', '2018-06-05 11:15:55', '2018-06-05 11:15:55'),
(30, 'customers-edit', 'web', '2018-06-05 11:15:55', '2018-06-05 11:15:55'),
(31, 'customers-delete', 'web', '2018-06-05 11:15:55', '2018-06-05 11:15:55'),
(32, 'suppliers-index', 'web', '2018-06-05 11:40:12', '2018-06-05 11:40:12'),
(33, 'suppliers-add', 'web', '2018-06-05 11:40:12', '2018-06-05 11:40:12'),
(34, 'suppliers-edit', 'web', '2018-06-05 11:40:12', '2018-06-05 11:40:12'),
(35, 'suppliers-delete', 'web', '2018-06-05 11:40:12', '2018-06-05 11:40:12'),
(36, 'product-report', 'web', '2018-06-25 11:05:33', '2018-06-25 11:05:33'),
(37, 'purchase-report', 'web', '2018-06-25 11:24:56', '2018-06-25 11:24:56'),
(38, 'sale-report', 'web', '2018-06-25 11:33:13', '2018-06-25 11:33:13'),
(39, 'customer-report', 'web', '2018-06-25 11:36:51', '2018-06-25 11:36:51'),
(40, 'due-report', 'web', '2018-06-25 11:39:52', '2018-06-25 11:39:52'),
(41, 'users-index', 'web', '2018-06-25 12:00:10', '2018-06-25 12:00:10'),
(42, 'users-add', 'web', '2018-06-25 12:00:10', '2018-06-25 12:00:10'),
(43, 'users-edit', 'web', '2018-06-25 12:01:30', '2018-06-25 12:01:30'),
(44, 'users-delete', 'web', '2018-06-25 12:01:30', '2018-06-25 12:01:30'),
(45, 'profit-loss', 'web', '2018-07-15 09:50:05', '2018-07-15 09:50:05'),
(46, 'best-seller', 'web', '2018-07-15 10:01:38', '2018-07-15 10:01:38'),
(47, 'daily-sale', 'web', '2018-07-15 10:24:21', '2018-07-15 10:24:21'),
(48, 'monthly-sale', 'web', '2018-07-15 10:30:41', '2018-07-15 10:30:41'),
(49, 'daily-purchase', 'web', '2018-07-15 10:36:46', '2018-07-15 10:36:46'),
(50, 'monthly-purchase', 'web', '2018-07-15 10:48:17', '2018-07-15 10:48:17'),
(51, 'payment-report', 'web', '2018-07-15 11:10:41', '2018-07-15 11:10:41'),
(52, 'warehouse-stock-report', 'web', '2018-07-15 11:16:55', '2018-07-15 11:16:55'),
(53, 'product-qty-alert', 'web', '2018-07-15 11:33:21', '2018-07-15 11:33:21'),
(54, 'supplier-report', 'web', '2018-07-30 15:00:01', '2018-07-30 15:00:01'),
(55, 'expenses-index', 'web', '2018-09-05 13:07:10', '2018-09-05 13:07:10'),
(56, 'expenses-add', 'web', '2018-09-05 13:07:10', '2018-09-05 13:07:10'),
(57, 'expenses-edit', 'web', '2018-09-05 13:07:10', '2018-09-05 13:07:10'),
(58, 'expenses-delete', 'web', '2018-09-05 13:07:11', '2018-09-05 13:07:11'),
(59, 'general_setting', 'web', '2018-10-20 11:10:04', '2018-10-20 11:10:04'),
(60, 'mail_setting', 'web', '2018-10-20 11:10:04', '2018-10-20 11:10:04'),
(61, 'pos_setting', 'web', '2018-10-20 11:10:04', '2018-10-20 11:10:04'),
(62, 'hrm_setting', 'web', '2019-01-02 22:30:23', '2019-01-02 22:30:23'),
(63, 'purchase-return-index', 'web', '2019-01-03 09:45:14', '2019-01-03 09:45:14'),
(64, 'purchase-return-add', 'web', '2019-01-03 09:45:14', '2019-01-03 09:45:14'),
(65, 'purchase-return-edit', 'web', '2019-01-03 09:45:14', '2019-01-03 09:45:14'),
(66, 'purchase-return-delete', 'web', '2019-01-03 09:45:14', '2019-01-03 09:45:14'),
(67, 'account-index', 'web', '2019-01-03 10:06:13', '2019-01-03 10:06:13'),
(68, 'balance-sheet', 'web', '2019-01-03 10:06:14', '2019-01-03 10:06:14'),
(69, 'account-statement', 'web', '2019-01-03 10:06:14', '2019-01-03 10:06:14'),
(70, 'department', 'web', '2019-01-03 10:30:01', '2019-01-03 10:30:01'),
(71, 'attendance', 'web', '2019-01-03 10:30:01', '2019-01-03 10:30:01'),
(72, 'payroll', 'web', '2019-01-03 10:30:01', '2019-01-03 10:30:01'),
(73, 'employees-index', 'web', '2019-01-03 10:52:19', '2019-01-03 10:52:19'),
(74, 'employees-add', 'web', '2019-01-03 10:52:19', '2019-01-03 10:52:19'),
(75, 'employees-edit', 'web', '2019-01-03 10:52:19', '2019-01-03 10:52:19'),
(76, 'employees-delete', 'web', '2019-01-03 10:52:19', '2019-01-03 10:52:19'),
(77, 'user-report', 'web', '2019-01-16 18:48:18', '2019-01-16 18:48:18'),
(78, 'stock_count', 'web', '2019-02-17 22:32:01', '2019-02-17 22:32:01'),
(79, 'adjustment', 'web', '2019-02-17 22:32:02', '2019-02-17 22:32:02'),
(80, 'sms_setting', 'web', '2019-02-22 17:18:03', '2019-02-22 17:18:03'),
(81, 'create_sms', 'web', '2019-02-22 17:18:03', '2019-02-22 17:18:03'),
(82, 'print_barcode', 'web', '2019-03-07 17:02:19', '2019-03-07 17:02:19'),
(83, 'empty_database', 'web', '2019-03-07 17:02:19', '2019-03-07 17:02:19'),
(84, 'customer_group', 'web', '2019-03-07 17:37:15', '2019-03-07 17:37:15'),
(85, 'unit', 'web', '2019-03-07 17:37:15', '2019-03-07 17:37:15'),
(86, 'tax', 'web', '2019-03-07 17:37:15', '2019-03-07 17:37:15'),
(87, 'gift_card', 'web', '2019-03-07 18:29:38', '2019-03-07 18:29:38'),
(88, 'coupon', 'web', '2019-03-07 18:29:38', '2019-03-07 18:29:38'),
(89, 'holiday', 'web', '2019-10-19 20:57:15', '2019-10-19 20:57:15'),
(90, 'warehouse-report', 'web', '2019-10-22 18:00:23', '2019-10-22 18:00:23'),
(91, 'warehouse', 'web', '2020-02-26 18:47:32', '2020-02-26 18:47:32'),
(92, 'brand', 'web', '2020-02-26 18:59:59', '2020-02-26 18:59:59'),
(93, 'billers-index', 'web', '2020-02-26 19:11:15', '2020-02-26 19:11:15'),
(94, 'billers-add', 'web', '2020-02-26 19:11:15', '2020-02-26 19:11:15'),
(95, 'billers-edit', 'web', '2020-02-26 19:11:15', '2020-02-26 19:11:15'),
(96, 'billers-delete', 'web', '2020-02-26 19:11:15', '2020-02-26 19:11:15'),
(97, 'money-transfer', 'web', '2020-03-02 17:41:48', '2020-03-02 17:41:48'),
(98, 'category', 'web', '2020-07-14 00:13:16', '2020-07-14 00:13:16'),
(99, 'delivery', 'web', '2020-07-14 00:13:16', '2020-07-14 00:13:16'),
(100, 'send_notification', 'web', '2020-10-31 18:21:31', '2020-10-31 18:21:31'),
(101, 'today_sale', 'web', '2020-10-31 18:57:04', '2020-10-31 18:57:04'),
(102, 'today_profit', 'web', '2020-10-31 18:57:04', '2020-10-31 18:57:04'),
(103, 'currency', 'web', '2020-11-09 12:23:11', '2020-11-09 12:23:11'),
(104, 'backup_database', 'web', '2020-11-15 12:16:55', '2020-11-15 12:16:55'),
(105, 'reward_point_setting', 'web', '2021-06-27 16:34:42', '2021-06-27 16:34:42'),
(106, 'revenue_profit_summary', 'web', '2022-02-09 01:57:21', '2022-02-09 01:57:21'),
(107, 'cash_flow', 'web', '2022-02-09 01:57:22', '2022-02-09 01:57:22'),
(108, 'monthly_summary', 'web', '2022-02-09 01:57:22', '2022-02-09 01:57:22'),
(109, 'yearly_report', 'web', '2022-02-09 01:57:22', '2022-02-09 01:57:22'),
(110, 'discount_plan', 'web', '2022-02-16 21:12:26', '2022-02-16 21:12:26'),
(111, 'discount', 'web', '2022-02-16 21:12:38', '2022-02-16 21:12:38'),
(112, 'product-expiry-report', 'web', '2022-03-30 17:39:20', '2022-03-30 17:39:20'),
(113, 'purchase-payment-index', 'web', '2022-06-06 02:12:27', '2022-06-06 02:12:27'),
(114, 'purchase-payment-add', 'web', '2022-06-06 02:12:28', '2022-06-06 02:12:28'),
(115, 'purchase-payment-edit', 'web', '2022-06-06 02:12:28', '2022-06-06 02:12:28'),
(116, 'purchase-payment-delete', 'web', '2022-06-06 02:12:28', '2022-06-06 02:12:28'),
(117, 'sale-payment-index', 'web', '2022-06-06 02:12:28', '2022-06-06 02:12:28'),
(118, 'sale-payment-add', 'web', '2022-06-06 02:12:28', '2022-06-06 02:12:28'),
(119, 'sale-payment-edit', 'web', '2022-06-06 02:12:28', '2022-06-06 02:12:28'),
(120, 'sale-payment-delete', 'web', '2022-06-06 02:12:28', '2022-06-06 02:12:28'),
(121, 'all_notification', 'web', '2022-06-06 02:12:29', '2022-06-06 02:12:29'),
(122, 'sale-report-chart', 'web', '2022-06-06 02:12:29', '2022-06-06 02:12:29'),
(123, 'dso-report', 'web', '2022-06-06 02:12:29', '2022-06-06 02:12:29'),
(124, 'supplier-due-report', 'web', '2023-02-25 04:50:43', '2023-02-25 04:50:43'),
(125, 'product_history', 'web', '2023-02-25 04:50:43', '2023-02-25 04:50:43');

-- --------------------------------------------------------

--
-- Table structure for table `pos_setting`
--

CREATE TABLE `pos_setting` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `keybord_active` tinyint(1) NOT NULL,
  `stripe_public_key` varchar(191) DEFAULT NULL,
  `stripe_secret_key` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_setting`
--

INSERT INTO `pos_setting` (`id`, `customer_id`, `warehouse_id`, `biller_id`, `product_number`, `keybord_active`, `stripe_public_key`, `stripe_secret_key`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 5, 0, 'ftg', '4', '2018-09-02 15:17:04', '2023-09-18 15:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `barcode_symbology` varchar(191) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `size_id` int(11) DEFAULT NULL,
  `cartoon_size` int(11) DEFAULT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `cost` double NOT NULL,
  `price` double NOT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `daily_sale_objective` double DEFAULT NULL,
  `promotion` tinyint(4) DEFAULT NULL,
  `promotion_price` varchar(191) DEFAULT NULL,
  `starting_date` varchar(200) DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `tax_method` int(11) DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `is_embeded` tinyint(1) DEFAULT NULL,
  `is_variant` tinyint(1) DEFAULT NULL,
  `is_batch` tinyint(1) DEFAULT NULL,
  `is_diffPrice` tinyint(1) DEFAULT NULL,
  `is_imei` tinyint(1) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `product_list` varchar(191) DEFAULT NULL,
  `variant_list` varchar(191) DEFAULT NULL,
  `qty_list` varchar(191) DEFAULT NULL,
  `price_list` varchar(191) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `variant_option` text DEFAULT NULL,
  `variant_value` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `code`, `type`, `barcode_symbology`, `brand_id`, `category_id`, `unit_id`, `size_id`, `cartoon_size`, `purchase_unit_id`, `sale_unit_id`, `cost`, `price`, `qty`, `alert_quantity`, `daily_sale_objective`, `promotion`, `promotion_price`, `starting_date`, `last_date`, `tax_id`, `tax_method`, `image`, `file`, `is_embeded`, `is_variant`, `is_batch`, `is_diffPrice`, `is_imei`, `featured`, `product_list`, `variant_list`, `qty_list`, `price_list`, `product_details`, `variant_option`, `variant_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'efesfs', '69802257', 'standard', 'C128', NULL, 1, 1, NULL, 0, 1, 1, 120, 400, 0, 500, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2023-09-30 14:02:15', '2023-09-30 14:02:15');

-- --------------------------------------------------------

--
-- Table structure for table `product_adjustments`
--

CREATE TABLE `product_adjustments` (
  `id` int(10) UNSIGNED NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `action` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_adjustments`
--

INSERT INTO `product_adjustments` (`id`, `adjustment_id`, `product_id`, `variant_id`, `qty`, `action`, `created_at`, `updated_at`) VALUES
(1, 1, 17, NULL, 1, '+', '2023-09-22 11:58:03', '2023-09-22 11:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `product_batches`
--

CREATE TABLE `product_batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `batch_no` varchar(191) NOT NULL,
  `expired_date` date NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_purchases`
--

CREATE TABLE `product_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_purchases`
--

INSERT INTO `product_purchases` (`id`, `purchase_id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `qty`, `recieved`, `purchase_unit_id`, `net_unit_cost`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(18, 15, 14, NULL, NULL, NULL, 14, 14, 2, 275, 0, 0, 0, 3850, '2023-09-11 15:58:19', '2023-09-11 15:58:19'),
(19, 15, 5, NULL, NULL, NULL, 3525, 3525, 1, 10.9, 0, 0, 0, 38422.5, '2023-09-11 15:58:19', '2023-09-11 15:58:19'),
(20, 15, 15, NULL, NULL, NULL, 80, 80, 3, 145, 0, 0, 0, 11600, '2023-09-11 15:58:19', '2023-09-11 15:58:19'),
(21, 16, 12, NULL, NULL, NULL, 4, 4, 3, 1200, 0, 0, 0, 4800, '2023-09-11 16:05:04', '2023-09-11 16:05:04'),
(22, 16, 10, NULL, NULL, NULL, 3, 3, 3, 450, 0, 0, 0, 1350, '2023-09-11 16:05:04', '2023-09-11 16:05:04'),
(23, 16, 11, NULL, NULL, NULL, 1, 1, 3, 200, 0, 0, 0, 200, '2023-09-11 16:05:04', '2023-09-11 16:05:04'),
(24, 17, 7, NULL, NULL, NULL, 20, 20, 2, 650, 0, 0, 0, 13000, '2023-09-12 04:53:40', '2023-09-12 04:53:40'),
(25, 18, 5, NULL, NULL, NULL, 1800, 1800, 1, 10.9, 0, 0, 0, 19620, '2023-09-12 13:29:49', '2023-09-12 13:29:49'),
(26, 18, 15, NULL, NULL, NULL, 41, 41, 3, 145, 0, 0, 0, 5945, '2023-09-12 13:29:49', '2023-09-12 13:29:49'),
(27, 19, 6, NULL, NULL, NULL, 225, 225, 3, 60, 0, 0, 0, 13500, '2023-09-12 13:32:51', '2023-09-12 13:32:51'),
(28, 20, 16, NULL, NULL, NULL, 22, 22, 3, 60, 0, 0, 0, 1320, '2023-09-12 13:39:42', '2023-09-12 13:39:42'),
(29, 21, 17, NULL, NULL, NULL, 20, 20, 3, 660, 0, 0, 0, 13200, '2023-09-12 13:43:13', '2023-09-12 13:43:13'),
(33, 24, 16, NULL, NULL, NULL, 22, 22, 3, 60, 0, 0, 0, 1320, '2023-09-13 13:06:03', '2023-09-13 13:06:03'),
(34, 25, 15, NULL, NULL, NULL, 84, 84, 3, 145, 0, 0, 0, 12180, '2023-09-13 13:34:25', '2023-09-13 13:34:25'),
(35, 26, 13, NULL, NULL, NULL, 19, 19, 3, 540, 0, 0, 0, 10260, '2023-09-13 14:12:31', '2023-09-13 14:12:31'),
(36, 27, 5, NULL, NULL, NULL, 3000, 3000, 1, 10.9, 0, 0, 0, 32700, '2023-09-13 15:33:34', '2023-09-13 15:33:34'),
(37, 27, 14, NULL, NULL, NULL, 38, 38, 2, 280, 0, 0, 0, 10640, '2023-09-13 15:33:34', '2023-09-13 15:33:34'),
(38, 28, 16, NULL, NULL, NULL, 20, 20, 3, 60, 0, 0, 0, 1200, '2023-09-14 10:29:34', '2023-09-14 10:29:34'),
(39, 28, 5, NULL, NULL, NULL, 3180, 3180, 1, 10.9, 0, 0, 0, 34662, '2023-09-14 10:29:34', '2023-09-14 10:29:34'),
(40, 29, 15, NULL, NULL, NULL, 154, 154, 3, 145, 0, 0, 0, 22330, '2023-09-14 13:50:00', '2023-09-14 13:50:00'),
(42, 31, 17, NULL, NULL, NULL, 124.4, 124.4, 2, 660000, 0, 0, 0, 82104000, '2023-09-15 09:42:12', '2023-09-15 09:42:12'),
(43, 31, 16, NULL, NULL, NULL, 20, 20, 3, 60, 0, 0, 0, 1200, '2023-09-15 09:42:12', '2023-09-15 09:42:12'),
(44, 31, 15, NULL, NULL, NULL, 43, 43, 3, 145, 0, 0, 0, 6235, '2023-09-15 09:42:12', '2023-09-15 09:42:12'),
(45, 30, 5, NULL, NULL, NULL, 3240, 3240, 1, 10.9, 0, 0, 0, 35316, '2023-09-16 07:19:26', '2023-09-16 07:19:26'),
(46, 32, 14, NULL, NULL, NULL, 40, 40, 2, 275, 0, 0, 0, 11000, '2023-09-16 08:20:00', '2023-09-16 08:20:00'),
(47, 32, 16, NULL, NULL, NULL, 23.5, 23.5, 3, 60, 0, 0, 0, 1410, '2023-09-16 08:20:00', '2023-09-16 08:20:00'),
(48, 32, 15, NULL, NULL, NULL, 108, 108, 3, 145, 0, 0, 0, 15660, '2023-09-16 08:20:00', '2023-09-16 08:20:00'),
(49, 32, 5, NULL, NULL, NULL, 2280, 2280, 1, 10.9, 0, 0, 0, 24852, '2023-09-16 08:20:00', '2023-09-16 08:20:00'),
(50, 33, 5, NULL, NULL, NULL, 2910, 2910, 1, 10.9, 0, 0, 0, 31719, '2023-09-16 12:11:09', '2023-09-16 12:11:09'),
(51, 33, 15, NULL, NULL, NULL, 43.42, 43.42, 3, 145, 0, 0, 0, 6295.9, '2023-09-16 12:11:09', '2023-09-16 12:11:09'),
(52, 34, 16, NULL, NULL, NULL, 22, 22, 3, 60, 0, 0, 0, 1320, '2023-09-17 05:03:28', '2023-09-17 05:03:28'),
(53, 34, 5, NULL, NULL, NULL, 1560, 1560, 1, 10.9, 0, 0, 0, 17004, '2023-09-17 05:03:28', '2023-09-17 05:03:28'),
(54, 35, 16, NULL, NULL, NULL, 20, 20, 3, 60, 0, 0, 0, 1200, '2023-09-17 07:10:30', '2023-09-17 07:10:30'),
(55, 36, 15, NULL, NULL, NULL, 40, 40, 3, 145, 0, 0, 0, 5800, '2023-09-17 13:14:04', '2023-09-17 13:14:04'),
(56, 36, 5, NULL, NULL, NULL, 1500, 1500, 1, 10.9, 0, 0, 0, 16350, '2023-09-17 13:14:04', '2023-09-17 13:14:04'),
(60, 38, 5, NULL, NULL, NULL, 1080, 1080, 1, 10.9, 0, 0, 0, 11772, '2023-09-18 12:41:53', '2023-09-18 12:41:53'),
(61, 38, 15, NULL, NULL, NULL, 31.8, 31.8, 3, 145, 0, 0, 0, 4611, '2023-09-18 12:41:53', '2023-09-18 12:41:53'),
(62, 39, 18, NULL, NULL, NULL, 900, 900, 1, 11.5, 0, 0, 0, 10350, '2023-09-18 14:59:04', '2023-09-18 14:59:04'),
(63, 40, 19, NULL, NULL, NULL, 10, 10, 1, 155, 0, 0, 0, 1550, '2023-09-18 15:14:41', '2023-09-18 15:14:41'),
(64, 37, 5, NULL, NULL, NULL, 1800, 1800, 1, 10.9, 0, 0, 0, 19620, '2023-09-18 15:19:19', '2023-09-18 15:19:19'),
(65, 37, 16, NULL, NULL, NULL, 19, 19, 3, 60, 0, 0, 0, 1140, '2023-09-18 15:19:19', '2023-09-18 15:19:19'),
(66, 37, 15, NULL, NULL, NULL, 27, 27, 3, 145, 0, 0, 0, 3915, '2023-09-18 15:19:19', '2023-09-18 15:19:19'),
(67, 41, 14, NULL, NULL, NULL, 39.3, 39.3, 2, 275, 0, 0, 0, 10807.5, '2023-09-19 06:00:08', '2023-09-19 06:00:08'),
(68, 41, 15, NULL, NULL, NULL, 94.9, 94.9, 3, 145, 0, 0, 0, 13760.5, '2023-09-19 06:00:08', '2023-09-19 06:00:08'),
(69, 41, 16, NULL, NULL, NULL, 23, 23, 3, 60, 0, 0, 0, 1380, '2023-09-19 06:00:08', '2023-09-19 06:00:08'),
(70, 41, 5, NULL, NULL, NULL, 1440, 1440, 1, 10.9, 0, 0, 0, 15696, '2023-09-19 06:00:08', '2023-09-19 06:00:08'),
(71, 42, 14, NULL, NULL, NULL, 32, 32, 2, 275, 0, 0, 0, 8800, '2023-09-19 14:34:16', '2023-09-19 14:34:16'),
(72, 43, 17, NULL, NULL, NULL, 20, 20, 2, 660000, 0, 0, 0, 13200000, '2023-09-20 05:44:56', '2023-09-20 05:44:56'),
(73, 43, 16, NULL, NULL, NULL, 20.5, 20.5, 3, 60, 0, 0, 0, 1230, '2023-09-20 05:44:56', '2023-09-20 05:44:56'),
(74, 43, 5, NULL, NULL, NULL, 2970, 2970, 1, 10.9, 0, 0, 0, 32373, '2023-09-20 05:44:56', '2023-09-20 05:44:56'),
(75, 44, 16, NULL, NULL, NULL, 22, 22, 3, 60, 0, 0, 0, 1320, '2023-09-21 07:15:35', '2023-09-21 07:15:35'),
(76, 44, 5, NULL, NULL, NULL, 2880, 2880, 1, 10.9, 0, 0, 0, 31392, '2023-09-21 07:15:35', '2023-09-21 07:15:35'),
(79, 46, 19, NULL, NULL, NULL, 91, 91, 1, 155, 0, 0, 0, 14105, '2023-09-21 09:49:25', '2023-09-21 09:49:25'),
(80, 46, 18, NULL, NULL, NULL, 1674, 1674, 1, 11.5, 0, 0, 0, 19251, '2023-09-21 09:49:25', '2023-09-21 09:49:25'),
(81, 45, 14, NULL, NULL, NULL, 13.2, 13.2, 2, 275, 0, 0, 0, 3630, '2023-09-22 03:22:44', '2023-09-22 03:22:44'),
(82, 45, 15, NULL, NULL, NULL, 67.3, 67.3, 3, 145, 0, 0, 0, 9758.5, '2023-09-22 03:22:44', '2023-09-22 03:22:44'),
(84, 47, 17, NULL, NULL, NULL, 120, 120, 2, 660, 0, 0, 0, 79200, '2023-09-22 03:39:58', '2023-09-22 03:39:58'),
(85, 48, 18, NULL, NULL, NULL, 600, 600, 1, 11.5, 0, 0, 0, 6900, '2023-09-23 06:51:28', '2023-09-23 06:51:28'),
(86, 48, 5, NULL, NULL, NULL, 3600, 3600, 1, 10.9, 0, 0, 0, 39240, '2023-09-23 06:51:28', '2023-09-23 06:51:28'),
(87, 48, 16, NULL, NULL, NULL, 22, 22, 3, 60, 0, 0, 0, 1320, '2023-09-23 06:51:28', '2023-09-23 06:51:28'),
(88, 49, 14, NULL, NULL, NULL, 30.5, 30.5, 2, 275, 0, 0, 0, 8387.5, '2023-09-23 07:38:00', '2023-09-23 07:38:00'),
(89, 49, 15, NULL, NULL, NULL, 26.8, 26.8, 3, 165, 0, 0, 0, 4422, '2023-09-23 07:38:00', '2023-09-23 07:38:00'),
(90, 50, 14, NULL, NULL, NULL, 27.1, 27.1, 2, 275, 0, 0, 0, 7452.5, '2023-09-23 07:39:36', '2023-09-23 07:39:36'),
(91, 50, 15, NULL, NULL, NULL, 54.8, 54.8, 3, 165, 0, 0, 0, 9042, '2023-09-23 07:39:36', '2023-09-23 07:39:36'),
(92, 51, 16, NULL, NULL, NULL, 23, 23, 3, 60, 0, 0, 0, 1380, '2023-09-24 09:58:49', '2023-09-24 09:58:49'),
(93, 51, 18, NULL, NULL, NULL, 450, 450, 1, 11.5, 0, 0, 0, 5175, '2023-09-24 09:58:49', '2023-09-24 09:58:49'),
(94, 51, 5, NULL, NULL, NULL, 4950, 4950, 1, 10.9, 0, 0, 0, 53955, '2023-09-24 09:58:49', '2023-09-24 09:58:49'),
(95, 52, 5, NULL, NULL, NULL, 1380, 1380, 1, 10.9, 0, 0, 0, 15042, '2023-09-24 12:55:20', '2023-09-24 12:55:20'),
(96, 53, 15, NULL, NULL, NULL, 167, 167, 3, 165, 0, 0, 0, 27555, '2023-09-25 05:34:57', '2023-09-25 05:34:57'),
(97, 54, 5, NULL, NULL, NULL, 6900, 6900, 1, 10.9, 0, 0, 0, 75210, '2023-09-25 07:46:00', '2023-09-25 07:46:00'),
(98, 55, 16, NULL, NULL, NULL, 19.5, 19.5, 3, 60, 0, 0, 0, 1170, '2023-09-25 08:04:12', '2023-09-25 08:04:12'),
(99, 56, 14, NULL, NULL, NULL, 40.7, 40.7, 2, 275, 0, 0, 0, 11192.5, '2023-09-25 08:06:12', '2023-09-25 08:06:12'),
(100, 57, 5, NULL, NULL, NULL, 2880, 2880, 1, 10.9, 0, 0, 0, 31392, '2023-09-25 12:44:41', '2023-09-25 12:44:41'),
(101, 58, 16, NULL, NULL, NULL, 21.5, 21.5, 3, 60, 0, 0, 0, 1290, '2023-09-26 09:46:49', '2023-09-26 09:46:49'),
(102, 58, 5, NULL, NULL, NULL, 2700, 2700, 1, 10.9, 0, 0, 0, 29430, '2023-09-26 09:46:49', '2023-09-26 09:46:49'),
(103, 59, 10, NULL, NULL, NULL, 7.925, 7.925, 3, 450, 0, 0, 0, 3566.25, '2023-09-26 13:55:46', '2023-09-26 13:55:46'),
(104, 60, 16, NULL, NULL, NULL, 20.5, 20.5, 3, 60, 0, 0, 0, 1230, '2023-09-27 05:35:17', '2023-09-27 05:35:17'),
(105, 60, 5, NULL, NULL, NULL, 2160, 2160, 1, 10.9, 0, 0, 0, 23544, '2023-09-27 05:35:17', '2023-09-27 05:35:17'),
(106, 61, 5, NULL, NULL, NULL, 1500, 1500, 1, 10.9, 0, 0, 0, 16350, '2023-09-27 12:09:32', '2023-09-27 12:09:32'),
(107, 62, 10, NULL, NULL, NULL, 4.3, 4.3, 3, 450, 0, 0, 0, 1935, '2023-09-27 14:27:26', '2023-09-27 14:27:26');

-- --------------------------------------------------------

--
-- Table structure for table `product_quotation`
--

CREATE TABLE `product_quotation` (
  `id` int(10) UNSIGNED NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_returns`
--

CREATE TABLE `product_returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_returns`
--

INSERT INTO `product_returns` (`id`, `return_id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `qty`, `sale_unit_id`, `net_unit_price`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(1, 3, 65, NULL, 1, NULL, 1, 1, 450, 49, 0, 0, 450, '2023-04-05 15:12:00', '2023-04-05 15:16:17'),
(3, 5, 45, NULL, 4, NULL, 1, 1, 1750, 100, 0, 0, 1750, '2023-04-05 15:48:17', '2023-04-05 15:49:27'),
(4, 6, 102, NULL, NULL, NULL, 1, 1, 1650, 0, 0, 0, 1650, '2023-04-13 11:48:20', '2023-04-13 11:48:20'),
(5, 7, 113, NULL, NULL, NULL, 1, 1, 1650, 0, 0, 0, 1650, '2023-04-18 17:01:44', '2023-04-18 17:01:44'),
(6, 10, 111, NULL, NULL, NULL, 1, 1, 1450, 0, 0, 0, 1450, '2023-04-20 16:14:43', '2023-04-20 16:14:43');

-- --------------------------------------------------------

--
-- Table structure for table `product_sales`
--

CREATE TABLE `product_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `unit_cost` double NOT NULL DEFAULT 0,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sales`
--

INSERT INTO `product_sales` (`id`, `sale_id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `qty`, `sale_unit_id`, `net_unit_price`, `discount`, `tax_rate`, `tax`, `unit_cost`, `total`, `created_at`, `updated_at`) VALUES
(16, 15, 5, NULL, NULL, NULL, 30, 1, 11.33, 0, 0, 0, 10.9, 339.9, '2023-09-12 03:45:49', '2023-09-12 03:45:49'),
(17, 16, 15, NULL, NULL, NULL, 3.66, 3, 160, 0, 0, 0, 165, 585.6, '2023-09-12 03:47:48', '2023-09-12 03:47:48'),
(18, 17, 14, NULL, NULL, NULL, 0.9, 2, 310, 0, 0, 0, 0.275, 279, '2023-09-12 03:54:35', '2023-09-12 03:54:35'),
(19, 18, 14, NULL, NULL, NULL, 1.72, 2, 310, 0, 0, 0, 0.275, 533.2, '2023-09-12 04:07:52', '2023-09-12 04:07:52'),
(20, 19, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-12 04:11:34', '2023-09-12 04:11:34'),
(21, 20, 14, NULL, NULL, NULL, 1.34, 2, 310, 0, 0, 0, 0.275, 415.4, '2023-09-12 04:15:36', '2023-09-12 04:15:36'),
(22, 21, 16, NULL, NULL, NULL, 12.5, 3, 65, 0, 0, 0, 60, 812.5, '2023-09-12 15:04:02', '2023-09-12 15:04:02'),
(23, 21, 14, NULL, NULL, NULL, 9.3, 2, 310, 0, 0, 0, 0.275, 2883, '2023-09-12 15:04:02', '2023-09-12 15:04:02'),
(24, 21, 15, NULL, NULL, NULL, 83, 3, 170, 0, 0, 0, 165, 14110, '2023-09-12 15:04:02', '2023-09-12 15:04:02'),
(25, 21, 5, NULL, NULL, NULL, 4914, 1, 10.4, 0, 0, 0, 10.9, 51105.6, '2023-09-12 15:04:02', '2023-09-12 15:04:02'),
(26, 21, 17, NULL, NULL, NULL, 14.5, 3, 690, 0, 0, 0, 660, 10005, '2023-09-12 15:04:02', '2023-09-12 15:04:02'),
(27, 22, 16, NULL, NULL, NULL, 9.5, 3, 65, 0, 0, 0, 60, 617.5, '2023-09-12 15:06:42', '2023-09-12 15:06:42'),
(28, 23, 12, NULL, NULL, NULL, 0.83, 3, 1300, 0, 0, 0, 1200, 1079, '2023-09-13 12:49:53', '2023-09-13 12:49:53'),
(29, 23, 5, NULL, NULL, NULL, 24, 1, 11.5, 0, 0, 0, 10.9, 276, '2023-09-13 12:49:53', '2023-09-13 12:49:53'),
(30, 23, 10, NULL, NULL, NULL, 1.93, 3, 480, 0, 0, 0, 450, 926.4, '2023-09-13 12:49:53', '2023-09-13 12:49:53'),
(31, 24, 15, NULL, NULL, NULL, 1.8, 3, 170, 0, 0, 0, 165, 306, '2023-09-13 12:51:29', '2023-09-13 12:51:29'),
(32, 25, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-13 13:00:50', '2023-09-13 13:00:50'),
(33, 26, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-13 13:08:30', '2023-09-13 13:08:30'),
(34, 26, 10, NULL, NULL, NULL, 1, 3, 480, 0, 0, 0, 450, 480, '2023-09-13 13:08:30', '2023-09-13 13:08:30'),
(35, 26, 5, NULL, NULL, NULL, 12, 1, 11.5, 0, 0, 0, 10.9, 138, '2023-09-13 13:08:30', '2023-09-13 13:08:30'),
(36, 27, 5, NULL, NULL, NULL, 13, 1, 11.5, 0, 0, 0, 10.9, 149.5, '2023-09-13 13:09:59', '2023-09-13 13:09:59'),
(37, 28, 5, NULL, NULL, NULL, 12, 1, 11.5, 0, 0, 0, 10.9, 138, '2023-09-13 13:27:49', '2023-09-13 13:27:49'),
(38, 29, 15, NULL, NULL, NULL, 44.1, 3, 170, 0, 0, 0, 165, 7497, '2023-09-13 13:36:58', '2023-09-13 13:36:58'),
(39, 30, 15, NULL, NULL, NULL, 35.4, 3, 160, 0, 0, 0, 165, 5664, '2023-09-13 13:41:48', '2023-09-13 13:41:48'),
(40, 31, 5, NULL, NULL, NULL, 554, 1, 11.28, 0, 0, 0, 10.9, 6249.12, '2023-09-13 14:04:12', '2023-09-13 14:04:12'),
(41, 32, 5, NULL, NULL, NULL, 550, 1, 11.29, 0, 0, 0, 10.9, 6209.5, '2023-09-13 14:06:59', '2023-09-13 14:06:59'),
(42, 33, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-13 14:07:20', '2023-09-13 14:07:20'),
(43, 34, 5, NULL, NULL, NULL, 12, 1, 11.5, 0, 0, 0, 10.9, 138, '2023-09-13 14:07:35', '2023-09-13 14:07:35'),
(44, 35, 13, NULL, NULL, NULL, 0.9, 3, 650, 0, 0, 0, 540, 585, '2023-09-13 14:13:08', '2023-09-13 14:13:08'),
(45, 36, 16, NULL, NULL, NULL, 8.6, 3, 65, 0, 0, 0, 60, 559, '2023-09-13 14:14:57', '2023-09-13 14:14:57'),
(46, 37, 15, NULL, NULL, NULL, 4.2, 3, 170, 0, 0, 0, 165, 714, '2023-09-13 14:16:21', '2023-09-13 14:16:21'),
(47, 38, 15, NULL, NULL, NULL, 1.87, 3, 170, 0, 0, 0, 165, 317.9, '2023-09-13 14:18:45', '2023-09-13 14:18:45'),
(48, 39, 5, NULL, NULL, NULL, 4, 1, 11.5, 0, 0, 0, 10.9, 46, '2023-09-13 14:25:05', '2023-09-13 14:25:05'),
(49, 40, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-13 14:25:34', '2023-09-13 14:25:34'),
(50, 41, 14, NULL, NULL, NULL, 1.63, 2, 310, 0, 0, 0, 0.275, 505.3, '2023-09-13 14:28:30', '2023-09-13 14:28:30'),
(51, 41, 15, NULL, NULL, NULL, 2, 3, 170, 0, 0, 0, 165, 340, '2023-09-13 14:28:30', '2023-09-13 14:28:30'),
(52, 42, 14, NULL, NULL, NULL, 6.67, 2, 280, 0, 0, 0, 0.275, 1867.6, '2023-09-13 14:32:22', '2023-09-13 14:32:22'),
(53, 43, 15, NULL, NULL, NULL, 2.29, 3, 160, 0, 0, 0, 165, 366.4, '2023-09-13 14:39:51', '2023-09-13 14:39:51'),
(54, 44, 16, NULL, NULL, NULL, 10.4, 3, 65, 0, 0, 0, 60, 676, '2023-09-13 14:50:55', '2023-09-13 14:50:55'),
(55, 45, 5, NULL, NULL, NULL, 60, 1, 11.5, 0, 0, 0, 10.9, 690, '2023-09-13 15:36:24', '2023-09-13 15:36:24'),
(56, 46, 15, NULL, NULL, NULL, 1.9, 3, 160, 0, 0, 0, 165, 304, '2023-09-14 05:05:49', '2023-09-14 05:05:49'),
(57, 47, 5, NULL, NULL, NULL, 100, 1, 11.25, 0, 0, 0, 10.9, 1125, '2023-09-14 09:59:15', '2023-09-14 09:59:15'),
(58, 48, 5, NULL, NULL, NULL, 8, 1, 11.5, 0, 0, 0, 10.9, 92, '2023-09-14 10:00:07', '2023-09-14 10:00:07'),
(59, 49, 5, NULL, NULL, NULL, 200, 1, 11.25, 0, 0, 0, 10.9, 2250, '2023-09-14 10:01:21', '2023-09-14 10:01:21'),
(60, 50, 5, NULL, NULL, NULL, 40, 1, 11.25, 0, 0, 0, 10.9, 450, '2023-09-14 10:02:32', '2023-09-14 10:02:32'),
(61, 51, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-14 10:02:55', '2023-09-14 10:02:55'),
(62, 52, 5, NULL, NULL, NULL, 520, 1, 11.3, 0, 0, 0, 10.9, 5876, '2023-09-14 10:27:22', '2023-09-14 10:27:22'),
(63, 53, 5, NULL, NULL, NULL, 1200, 1, 10.7, 0, 0, 0, 10.9, 12840, '2023-09-14 10:30:15', '2023-09-14 10:30:15'),
(64, 54, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-14 10:30:40', '2023-09-14 10:30:40'),
(65, 55, 14, NULL, NULL, NULL, 5, 2, 305, 0, 0, 0, 0.275, 1525, '2023-09-14 10:33:23', '2023-09-14 10:33:23'),
(66, 56, 14, NULL, NULL, NULL, 1.54, 2, 310, 0, 0, 0, 0.275, 477.4, '2023-09-14 11:01:19', '2023-09-14 11:01:19'),
(67, 57, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-14 11:34:21', '2023-09-14 11:34:21'),
(68, 58, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-14 12:41:02', '2023-09-14 12:41:02'),
(69, 59, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-14 12:41:19', '2023-09-14 12:41:19'),
(70, 60, 13, NULL, NULL, NULL, 0.74, 3, 650, 0, 0, 0, 540, 481, '2023-09-14 12:47:20', '2023-09-14 12:47:20'),
(71, 61, 13, NULL, NULL, NULL, 0.92, 3, 650, 0, 0, 0, 540, 598, '2023-09-14 12:47:48', '2023-09-14 12:47:48'),
(72, 62, 14, NULL, NULL, NULL, 2.91, 2, 310, 0, 0, 0, 0.275, 902.1, '2023-09-14 12:50:54', '2023-09-14 12:50:54'),
(73, 63, 5, NULL, NULL, NULL, 12, 1, 11.5, 0, 0, 0, 10.9, 138, '2023-09-14 12:51:50', '2023-09-14 12:51:50'),
(74, 64, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-14 13:00:53', '2023-09-14 13:00:53'),
(75, 65, 5, NULL, NULL, NULL, 12, 1, 8, 0, 0, 0, 10.9, 96, '2023-09-14 13:04:41', '2023-09-14 13:04:41'),
(76, 66, 14, NULL, NULL, NULL, 0.74, 2, 310, 0, 0, 0, 0.275, 229.4, '2023-09-14 13:07:49', '2023-09-14 13:07:49'),
(77, 67, 14, NULL, NULL, NULL, 2.2, 2, 310, 0, 0, 0, 0.275, 682, '2023-09-14 13:28:24', '2023-09-14 13:28:24'),
(78, 68, 5, NULL, NULL, NULL, 60, 1, 11, 0, 0, 0, 10.9, 660, '2023-09-14 13:45:02', '2023-09-14 13:45:02'),
(79, 69, 15, NULL, NULL, NULL, 23.28, 3, 166, 0, 0, 0, 165, 3864.48, '2023-09-14 13:54:16', '2023-09-14 13:54:16'),
(80, 70, 15, NULL, NULL, NULL, 19.5, 3, 160, 0, 0, 0, 165, 3120, '2023-09-14 13:56:18', '2023-09-14 13:56:18'),
(81, 71, 17, NULL, NULL, NULL, 4, 3, 675, 0, 0, 0, 660, 2700, '2023-09-14 14:02:28', '2023-09-14 14:02:28'),
(82, 72, 16, NULL, NULL, NULL, 14, 3, 65, 0, 0, 0, 60, 910, '2023-09-14 14:18:02', '2023-09-14 16:09:16'),
(83, 73, 15, NULL, NULL, NULL, 2.6, 3, 170, 0, 0, 0, 165, 442, '2023-09-14 14:20:35', '2023-09-14 14:20:35'),
(84, 74, 5, NULL, NULL, NULL, 15, 1, 11.5, 0, 0, 0, 10.9, 172.5, '2023-09-14 14:21:50', '2023-09-14 14:21:50'),
(85, 75, 5, NULL, NULL, NULL, 12, 1, 11.5, 0, 0, 0, 10.9, 138, '2023-09-14 14:22:32', '2023-09-14 14:22:32'),
(86, 76, 15, NULL, NULL, NULL, 2.08, 3, 170, 0, 0, 0, 165, 353.6, '2023-09-14 14:23:36', '2023-09-14 14:23:36'),
(87, 77, 5, NULL, NULL, NULL, 12, 1, 11.5, 0, 0, 0, 10.9, 138, '2023-09-14 14:23:53', '2023-09-14 14:23:53'),
(88, 78, 15, NULL, NULL, NULL, 2.06, 3, 170, 0, 0, 0, 165, 350.2, '2023-09-14 14:40:45', '2023-09-14 14:40:45'),
(89, 79, 16, NULL, NULL, NULL, 3, 3, 65, 0, 0, 0, 60, 195, '2023-09-14 16:17:02', '2023-09-14 16:17:02'),
(90, 80, 14, NULL, NULL, NULL, 3.2, 2, 310, 0, 0, 0, 0.275, 992, '2023-09-15 10:19:57', '2023-09-15 10:19:57'),
(91, 81, 13, NULL, NULL, NULL, 0.86, 3, 650, 0, 0, 0, 540, 559, '2023-09-15 10:20:46', '2023-09-15 10:20:46'),
(92, 82, 15, NULL, NULL, NULL, 53.68, 3, 170, 0, 0, 0, 165, 9125.6, '2023-09-15 10:26:10', '2023-09-15 10:26:10'),
(93, 83, 15, NULL, NULL, NULL, 24.5, 3, 170, 0, 0, 0, 165, 4165, '2023-09-15 10:29:41', '2023-09-15 10:29:41'),
(94, 84, 5, NULL, NULL, NULL, 400, 1, 11.5, 0, 0, 0, 10.9, 4600, '2023-09-15 11:11:44', '2023-09-15 11:11:44'),
(95, 85, 15, NULL, NULL, NULL, 1, 3, 170, 0, 0, 0, 165, 170, '2023-09-15 11:22:11', '2023-09-15 11:22:11'),
(96, 86, 17, NULL, NULL, NULL, 40.6, 3, 700, 0, 0, 0, 660, 28420, '2023-09-15 11:42:36', '2023-09-15 11:42:36'),
(97, 87, 17, NULL, NULL, NULL, 24, 3, 700, 0, 0, 0, 660, 16800, '2023-09-15 12:05:08', '2023-09-15 12:05:08'),
(98, 88, 5, NULL, NULL, NULL, 1510, 1, 11.3, 0, 0, 0, 10.9, 17063, '2023-09-15 12:47:08', '2023-09-15 12:47:08'),
(99, 89, 16, NULL, NULL, NULL, 4.5, 3, 65, 0, 0, 0, 60, 292.5, '2023-09-15 12:52:13', '2023-09-15 12:52:13'),
(100, 90, 15, NULL, NULL, NULL, 2, 3, 170, 0, 0, 0, 165, 340, '2023-09-15 12:56:14', '2023-09-15 12:56:14'),
(101, 91, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-15 13:00:25', '2023-09-15 13:00:25'),
(102, 92, 14, NULL, NULL, NULL, 1.56, 2, 310, 0, 0, 0, 0.275, 483.6, '2023-09-15 13:01:56', '2023-09-15 13:01:56'),
(103, 92, 15, NULL, NULL, NULL, 2.15, 3, 170, 0, 0, 0, 165, 365.5, '2023-09-15 13:01:56', '2023-09-15 13:01:56'),
(104, 93, 16, NULL, NULL, NULL, 0.5, 3, 65, 0, 0, 0, 60, 32.5, '2023-09-15 13:03:57', '2023-09-15 13:03:57'),
(105, 94, 15, NULL, NULL, NULL, 2, 3, 170, 0, 0, 0, 165, 340, '2023-09-16 07:22:58', '2023-09-16 07:22:58'),
(106, 95, 15, NULL, NULL, NULL, 2, 3, 170, 0, 0, 0, 165, 340, '2023-09-16 07:30:37', '2023-09-16 07:30:37'),
(107, 96, 5, NULL, NULL, NULL, 8, 1, 11.5, 0, 0, 0, 10.9, 92, '2023-09-16 08:38:11', '2023-09-16 08:38:11'),
(108, 97, 5, NULL, NULL, NULL, 210, 1, 11.5, 0, 0, 0, 10.9, 2415, '2023-09-16 08:38:56', '2023-09-16 08:38:56'),
(109, 98, 5, NULL, NULL, NULL, 250, 1, 11.5, 0, 0, 0, 10.9, 2875, '2023-09-16 08:39:23', '2023-09-16 08:39:23'),
(110, 99, 5, NULL, NULL, NULL, 200, 1, 11.5, 0, 0, 0, 10.9, 2300, '2023-09-16 08:39:48', '2023-09-16 08:39:48'),
(111, 100, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-16 08:40:02', '2023-09-16 08:40:02'),
(112, 101, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-16 08:40:17', '2023-09-16 08:40:17'),
(113, 102, 5, NULL, NULL, NULL, 15, 1, 11.5, 0, 0, 0, 10.9, 172.5, '2023-09-16 08:41:11', '2023-09-16 08:41:11'),
(114, 103, 5, NULL, NULL, NULL, 100, 1, 11.5, 0, 0, 0, 10.9, 1150, '2023-09-16 08:41:37', '2023-09-16 08:41:37'),
(115, 104, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-16 08:42:23', '2023-09-16 08:42:23'),
(116, 105, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-16 08:43:01', '2023-09-16 08:43:01'),
(117, 106, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-16 08:43:26', '2023-09-16 08:43:26'),
(118, 107, 5, NULL, NULL, NULL, 12, 1, 11.5, 0, 0, 0, 10.9, 138, '2023-09-16 08:43:37', '2023-09-16 08:43:37'),
(119, 108, 5, NULL, NULL, NULL, 62, 1, 11.5, 0, 0, 0, 10.9, 713, '2023-09-16 08:44:07', '2023-09-16 08:44:07'),
(120, 109, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-16 08:44:29', '2023-09-16 08:44:29'),
(121, 110, 14, NULL, NULL, NULL, 0.83, 2, 310, 0, 0, 0, 0.275, 257.3, '2023-09-16 08:44:47', '2023-09-16 08:44:47'),
(122, 111, 17, NULL, NULL, NULL, 5, 3, 690, 0, 0, 0, 660, 3450, '2023-09-16 08:45:22', '2023-09-16 08:45:22'),
(123, 112, 17, NULL, NULL, NULL, 1, 3, 690, 0, 0, 0, 660, 690, '2023-09-16 08:45:55', '2023-09-16 08:45:55'),
(124, 113, 17, NULL, NULL, NULL, 2, 3, 690, 0, 0, 0, 660, 1380, '2023-09-16 08:46:16', '2023-09-16 08:46:16'),
(125, 114, 17, NULL, NULL, NULL, 1, 3, 690, 0, 0, 0, 660, 690, '2023-09-16 08:46:32', '2023-09-16 08:46:32'),
(126, 115, 17, NULL, NULL, NULL, 2, 3, 690, 0, 0, 0, 660, 1380, '2023-09-16 08:50:40', '2023-09-16 08:50:40'),
(127, 116, 5, NULL, NULL, NULL, 500, 1, 11.5, 0, 0, 0, 10.9, 5750, '2023-09-16 08:52:13', '2023-09-16 08:52:13'),
(128, 117, 15, NULL, NULL, NULL, 2.32, 3, 170, 0, 0, 0, 165, 394.4, '2023-09-16 08:56:44', '2023-09-16 08:56:44'),
(129, 118, 15, NULL, NULL, NULL, 2, 3, 170, 0, 0, 0, 165, 340, '2023-09-16 08:57:07', '2023-09-16 08:57:07'),
(130, 119, 15, NULL, NULL, NULL, 6.3, 3, 170, 0, 0, 0, 165, 1071, '2023-09-16 08:57:41', '2023-09-16 08:57:41'),
(131, 120, 15, NULL, NULL, NULL, 1.85, 3, 170, 0, 0, 0, 165, 314.5, '2023-09-16 08:57:58', '2023-09-16 08:57:58'),
(132, 121, 15, NULL, NULL, NULL, 8.94, 3, 170, 0, 0, 0, 165, 1519.8, '2023-09-16 08:58:54', '2023-09-16 08:58:54'),
(133, 122, 15, NULL, NULL, NULL, 1.94, 3, 170, 0, 0, 0, 165, 329.8, '2023-09-16 08:59:15', '2023-09-16 08:59:15'),
(134, 123, 15, NULL, NULL, NULL, 1.55, 3, 170, 0, 0, 0, 165, 263.5, '2023-09-16 08:59:41', '2023-09-16 08:59:41'),
(135, 124, 15, NULL, NULL, NULL, 2.17, 3, 170, 0, 0, 0, 165, 368.9, '2023-09-16 08:59:55', '2023-09-16 08:59:55'),
(136, 125, 15, NULL, NULL, NULL, 1.92, 3, 170, 0, 0, 0, 165, 326.4, '2023-09-16 09:00:50', '2023-09-16 09:00:50'),
(137, 126, 15, NULL, NULL, NULL, 1.92, 3, 170, 0, 0, 0, 165, 326.4, '2023-09-16 09:01:03', '2023-09-16 09:01:03'),
(138, 127, 15, NULL, NULL, NULL, 2.5, 3, 170, 0, 0, 0, 165, 425, '2023-09-16 09:01:26', '2023-09-16 09:01:26'),
(139, 128, 15, NULL, NULL, NULL, 2.17, 3, 170, 0, 0, 0, 165, 368.9, '2023-09-16 09:02:17', '2023-09-16 09:02:17'),
(140, 129, 5, NULL, NULL, NULL, 90, 1, 11.5, 0, 0, 0, 10.9, 1035, '2023-09-16 09:03:31', '2023-09-16 09:03:31'),
(141, 130, 5, NULL, NULL, NULL, 100, 1, 11.5, 0, 0, 0, 10.9, 1150, '2023-09-16 10:54:14', '2023-09-16 10:54:14'),
(142, 131, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-16 10:54:55', '2023-09-16 10:54:55'),
(143, 132, 5, NULL, NULL, NULL, 100, 1, 11.5, 0, 0, 0, 10.9, 1150, '2023-09-16 10:55:20', '2023-09-16 10:55:20'),
(144, 133, 14, NULL, NULL, NULL, 0.96, 2, 310, 0, 0, 0, 0.275, 297.6, '2023-09-16 10:56:23', '2023-09-16 10:56:23'),
(145, 134, 16, NULL, NULL, NULL, 6, 3, 65, 0, 0, 0, 60, 390, '2023-09-16 10:56:44', '2023-09-16 10:56:44'),
(146, 135, 15, NULL, NULL, NULL, 3.6, 3, 170, 0, 0, 0, 165, 612, '2023-09-16 11:39:20', '2023-09-16 11:39:20'),
(147, 136, 16, NULL, NULL, NULL, 4, 3, 65, 0, 0, 0, 60, 260, '2023-09-16 11:49:42', '2023-09-16 11:49:42'),
(148, 137, 16, NULL, NULL, NULL, 5, 3, 65, 0, 0, 0, 60, 325, '2023-09-16 11:53:24', '2023-09-16 11:53:24'),
(149, 138, 15, NULL, NULL, NULL, 4.94, 3, 170, 0, 0, 0, 165, 839.8, '2023-09-16 12:12:16', '2023-09-16 12:12:16'),
(150, 139, 15, NULL, NULL, NULL, 1.7, 3, 170, 0, 0, 0, 165, 289, '2023-09-16 12:33:52', '2023-09-16 12:33:52'),
(151, 140, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-16 12:48:50', '2023-09-16 12:48:50'),
(152, 141, 16, NULL, NULL, NULL, 20, 3, 65, 0, 0, 0, 60, 1300, '2023-09-16 12:53:15', '2023-09-16 12:53:15'),
(153, 142, 5, NULL, NULL, NULL, 8, 1, 11.5, 0, 0, 0, 10.9, 92, '2023-09-16 13:04:53', '2023-09-16 13:04:53'),
(154, 143, 5, NULL, NULL, NULL, 5520, 1, 10.7, 0, 0, 0, 10.9, 59064, '2023-09-16 14:04:13', '2023-09-16 14:04:13'),
(155, 144, 5, NULL, NULL, NULL, 480, 1, 9.8, 0, 0, 0, 10.9, 4704, '2023-09-16 14:05:10', '2023-09-16 14:05:10'),
(156, 145, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-16 14:11:09', '2023-09-16 14:11:09'),
(157, 146, 15, NULL, NULL, NULL, 1.62, 3, 170, 0, 0, 0, 165, 275.4, '2023-09-16 14:12:42', '2023-09-16 14:12:42'),
(158, 147, 15, NULL, NULL, NULL, 12.41, 3, 160, 0, 0, 0, 165, 1985.6, '2023-09-16 14:25:13', '2023-09-16 14:25:13'),
(159, 148, 16, NULL, NULL, NULL, 2.5, 3, 65, 0, 0, 0, 60, 162.5, '2023-09-16 14:39:55', '2023-09-16 14:39:55'),
(160, 149, 15, NULL, NULL, NULL, 4, 3, 160, 0, 0, 0, 165, 640, '2023-09-17 03:53:53', '2023-09-17 03:53:53'),
(161, 150, 5, NULL, NULL, NULL, 30, 1, 6.6, 0, 0, 0, 10.9, 198, '2023-09-17 03:54:44', '2023-09-17 03:54:44'),
(162, 151, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-17 03:55:06', '2023-09-17 03:55:06'),
(163, 152, 17, NULL, NULL, NULL, 1, 3, 690, 0, 0, 0, 660, 690, '2023-09-17 04:56:28', '2023-09-17 04:56:28'),
(164, 153, 5, NULL, NULL, NULL, 4, 1, 11.5, 0, 0, 0, 10.9, 46, '2023-09-17 05:02:21', '2023-09-17 05:02:21'),
(165, 154, 15, NULL, NULL, NULL, 1.83, 3, 170, 0, 0, 0, 165, 311.1, '2023-09-17 05:04:20', '2023-09-17 05:04:20'),
(166, 155, 5, NULL, NULL, NULL, 1, 1, 11.5, 0, 0, 0, 10.9, 11.5, '2023-09-17 05:13:30', '2023-09-17 05:13:30'),
(167, 156, 15, NULL, NULL, NULL, 2, 3, 170, 0, 0, 0, 165, 340, '2023-09-17 05:22:16', '2023-09-17 05:22:16'),
(168, 157, 5, NULL, NULL, NULL, 150, 1, 11.5, 0, 0, 0, 10.9, 1725, '2023-09-17 05:24:56', '2023-09-17 05:24:56'),
(169, 158, 5, NULL, NULL, NULL, 300, 1, 11.5, 0, 0, 0, 10.9, 3450, '2023-09-17 05:28:34', '2023-09-17 05:28:34'),
(170, 159, 5, NULL, NULL, NULL, 12, 1, 11.5, 0, 0, 0, 10.9, 138, '2023-09-17 05:52:44', '2023-09-17 05:52:44'),
(171, 159, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-17 05:52:44', '2023-09-17 05:52:44'),
(172, 159, 15, NULL, NULL, NULL, 2.23, 3, 170, 0, 0, 0, 165, 379.1, '2023-09-17 05:52:44', '2023-09-17 05:52:44'),
(173, 160, 15, NULL, NULL, NULL, 1.53, 3, 170, 0, 0, 0, 165, 260.1, '2023-09-17 05:56:46', '2023-09-17 05:56:46'),
(174, 161, 14, NULL, NULL, NULL, 1.619, 2, 310, 0, 0, 0, 0.275, 501.89, '2023-09-17 06:27:37', '2023-09-17 06:27:37'),
(175, 162, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-17 06:28:13', '2023-09-17 06:28:13'),
(176, 163, 15, NULL, NULL, NULL, 2.4, 3, 170, 0, 0, 0, 165, 408, '2023-09-17 06:58:47', '2023-09-17 06:58:47'),
(177, 163, 13, NULL, NULL, NULL, 0.8, 3, 650, 0, 0, 0, 540, 520, '2023-09-17 06:58:47', '2023-09-17 06:58:47'),
(178, 164, 16, NULL, NULL, NULL, 2.5, 3, 65, 0, 0, 0, 60, 162.5, '2023-09-17 07:10:58', '2023-09-17 07:10:58'),
(179, 164, 17, NULL, NULL, NULL, 5, 3, 690, 0, 0, 0, 660, 3450, '2023-09-17 07:10:58', '2023-09-17 07:10:58'),
(180, 165, 16, NULL, NULL, NULL, 3, 3, 65, 0, 0, 0, 60, 195, '2023-09-17 07:33:41', '2023-09-17 07:33:41'),
(181, 166, 5, NULL, NULL, NULL, 8, 1, 11.5, 0, 0, 0, 10.9, 92, '2023-09-17 07:34:42', '2023-09-17 07:34:42'),
(182, 167, 5, NULL, NULL, NULL, 4, 1, 11.5, 0, 0, 0, 10.9, 46, '2023-09-17 07:35:02', '2023-09-17 07:35:02'),
(183, 168, 5, NULL, NULL, NULL, 100, 1, 11.5, 0, 0, 0, 10.9, 1150, '2023-09-17 07:46:11', '2023-09-17 07:46:11'),
(184, 169, 15, NULL, NULL, NULL, 0.79, 3, 170, 0, 0, 0, 165, 134.3, '2023-09-17 08:13:25', '2023-09-17 08:13:25'),
(185, 169, 14, NULL, NULL, NULL, 0.7, 2, 310, 0, 0, 0, 0.275, 217, '2023-09-17 08:13:25', '2023-09-17 08:13:25'),
(186, 170, 5, NULL, NULL, NULL, 20, 1, 11.5, 0, 0, 0, 10.9, 230, '2023-09-17 08:16:38', '2023-09-17 08:16:38'),
(187, 171, 5, NULL, NULL, NULL, 4, 1, 11.5, 0, 0, 0, 10.9, 46, '2023-09-17 11:05:05', '2023-09-17 11:05:05'),
(188, 172, 14, NULL, NULL, NULL, 1.54, 2, 310, 0, 0, 0, 0.275, 477.4, '2023-09-17 11:06:44', '2023-09-17 11:06:44'),
(189, 173, 14, NULL, NULL, NULL, 2.23, 2, 310, 0, 0, 0, 0.275, 691.3, '2023-09-17 11:07:35', '2023-09-17 11:07:35'),
(190, 174, 16, NULL, NULL, NULL, 3, 3, 65, 0, 0, 0, 60, 195, '2023-09-17 11:07:57', '2023-09-17 11:07:57'),
(191, 175, 16, NULL, NULL, NULL, 3, 3, 65, 0, 0, 0, 60, 195, '2023-09-17 11:14:37', '2023-09-17 11:14:37'),
(192, 175, 5, NULL, NULL, NULL, 12, 1, 12, 0, 0, 0, 10.9, 144, '2023-09-17 11:14:37', '2023-09-17 11:14:37'),
(193, 176, 5, NULL, NULL, NULL, 120, 1, 11.25, 0, 0, 0, 10.9, 1350, '2023-09-17 11:46:33', '2023-09-17 11:46:33'),
(194, 177, 5, NULL, NULL, NULL, 400, 1, 11.3, 0, 0, 0, 10.9, 4520, '2023-09-17 11:49:19', '2023-09-17 11:49:19'),
(195, 178, 5, NULL, NULL, NULL, 60, 1, 11.3, 0, 0, 0, 10.9, 678, '2023-09-17 11:49:50', '2023-09-17 11:49:50'),
(196, 179, 5, NULL, NULL, NULL, 60, 1, 11.5, 0, 0, 0, 10.9, 690, '2023-09-17 11:50:48', '2023-09-17 11:50:48'),
(197, 180, 15, NULL, NULL, NULL, 4, 3, 160, 0, 0, 0, 165, 640, '2023-09-17 11:57:49', '2023-09-17 11:57:49'),
(198, 181, 15, NULL, NULL, NULL, 37.47, 3, 160, 0, 0, 0, 165, 5995.2, '2023-09-17 11:59:52', '2023-09-17 11:59:52'),
(199, 182, 15, NULL, NULL, NULL, 2.2, 3, 170, 0, 0, 0, 165, 374, '2023-09-17 12:07:43', '2023-09-17 12:07:43'),
(200, 183, 16, NULL, NULL, NULL, 1.5, 3, 65, 0, 0, 0, 60, 97.5, '2023-09-17 12:13:27', '2023-09-17 12:13:27'),
(201, 184, 13, NULL, NULL, NULL, 0.78, 3, 650, 0, 0, 0, 540, 507, '2023-09-17 12:54:30', '2023-09-17 12:54:30'),
(202, 185, 14, NULL, NULL, NULL, 2.19, 2, 310, 0, 0, 0, 0.275, 678.9, '2023-09-17 13:16:26', '2023-09-17 13:16:26'),
(203, 186, 16, NULL, NULL, NULL, 20, 3, 65, 0, 0, 0, 60, 1300, '2023-09-17 13:36:38', '2023-09-17 13:36:38'),
(204, 187, 15, NULL, NULL, NULL, 2.13, 3, 170, 0, 0, 0, 165, 362.1, '2023-09-17 13:57:07', '2023-09-17 13:57:07'),
(205, 188, 15, NULL, NULL, NULL, 4.47, 3, 170, 0, 0, 0, 165, 759.9, '2023-09-17 14:01:10', '2023-09-17 14:01:10'),
(206, 189, 5, NULL, NULL, NULL, 600, 1, 11.2, 0, 0, 0, 10.9, 6720, '2023-09-17 14:03:01', '2023-09-17 14:03:01'),
(207, 190, 15, NULL, NULL, NULL, 4.2, 3, 170, 0, 0, 0, 165, 714, '2023-09-17 14:14:36', '2023-09-17 14:14:36'),
(208, 191, 15, NULL, NULL, NULL, 2.68, 3, 170, 0, 0, 0, 165, 455.6, '2023-09-18 04:05:14', '2023-09-18 04:05:14'),
(209, 192, 5, NULL, NULL, NULL, 42, 1, 11.5, 0, 0, 0, 10.9, 483, '2023-09-18 04:08:33', '2023-09-18 04:08:33'),
(210, 193, 5, NULL, NULL, NULL, 60, 1, 11.5, 0, 0, 0, 10.9, 690, '2023-09-18 04:13:19', '2023-09-18 04:13:19'),
(211, 194, 5, NULL, NULL, NULL, 8, 1, 11.5, 0, 0, 0, 10.9, 92, '2023-09-18 04:30:41', '2023-09-18 04:30:41'),
(212, 195, 5, NULL, NULL, NULL, 17, 1, 11.5, 0, 0, 0, 10.9, 195.5, '2023-09-18 05:10:34', '2023-09-18 05:10:34'),
(213, 196, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-18 05:12:27', '2023-09-18 05:12:27'),
(214, 197, 5, NULL, NULL, NULL, 100, 1, 11.5, 0, 0, 0, 10.9, 1150, '2023-09-18 05:13:26', '2023-09-18 05:13:26'),
(215, 198, 15, NULL, NULL, NULL, 2.17, 3, 170, 0, 0, 0, 165, 368.9, '2023-09-18 05:14:34', '2023-09-18 05:14:34'),
(216, 199, 15, NULL, NULL, NULL, 3.6, 3, 170, 0, 0, 0, 165, 612, '2023-09-18 05:17:34', '2023-09-18 05:17:34'),
(217, 200, 13, NULL, NULL, NULL, 0.8, 3, 650, 0, 0, 0, 540, 520, '2023-09-18 05:18:34', '2023-09-18 05:18:34'),
(218, 201, 17, NULL, NULL, NULL, 5, 3, 690, 0, 0, 0, 660, 3450, '2023-09-18 05:19:41', '2023-09-18 05:19:41'),
(219, 202, 15, NULL, NULL, NULL, 1.43, 3, 170, 0, 0, 0, 165, 243.1, '2023-09-18 05:48:35', '2023-09-18 05:48:35'),
(220, 203, 15, NULL, NULL, NULL, 1.26, 3, 170, 0, 0, 0, 165, 214.2, '2023-09-18 06:08:20', '2023-09-18 06:08:20'),
(221, 204, 15, NULL, NULL, NULL, 4.8, 3, 160, 0, 0, 0, 165, 768, '2023-09-18 06:10:03', '2023-09-18 06:10:03'),
(222, 205, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-18 06:19:45', '2023-09-18 06:19:45'),
(223, 206, 13, NULL, NULL, NULL, 0.8, 3, 650, 0, 0, 0, 540, 520, '2023-09-18 06:21:14', '2023-09-18 06:21:14'),
(224, 207, 5, NULL, NULL, NULL, 100, 1, 11.5, 0, 0, 0, 10.9, 1150, '2023-09-18 06:45:18', '2023-09-18 06:45:18'),
(226, 209, 15, NULL, NULL, NULL, 2.3, 3, 170, 0, 0, 0, 165, 391, '2023-09-18 06:47:53', '2023-09-18 06:47:53'),
(227, 210, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-18 06:48:34', '2023-09-18 06:48:34'),
(228, 211, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-18 06:49:14', '2023-09-18 06:49:14'),
(229, 212, 15, NULL, NULL, NULL, 1.3, 3, 170, 0, 0, 0, 165, 221, '2023-09-18 07:22:00', '2023-09-18 07:22:00'),
(230, 213, 5, NULL, NULL, NULL, 100, 1, 11.5, 0, 0, 0, 10.9, 1150, '2023-09-18 08:06:36', '2023-09-18 08:06:36'),
(231, 214, 5, NULL, NULL, NULL, 8, 1, 11.5, 0, 0, 0, 10.9, 92, '2023-09-18 08:07:52', '2023-09-18 08:07:52'),
(232, 215, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-18 09:51:45', '2023-09-18 09:51:45'),
(233, 216, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-18 10:24:01', '2023-09-18 10:24:01'),
(234, 217, 15, NULL, NULL, NULL, 1.92, 3, 170, 0, 0, 0, 165, 326.4, '2023-09-18 10:45:47', '2023-09-18 10:45:47'),
(235, 218, 5, NULL, NULL, NULL, 100, 1, 11.5, 0, 0, 0, 10.9, 1150, '2023-09-18 11:20:10', '2023-09-18 11:20:10'),
(236, 219, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-18 11:28:09', '2023-09-18 11:28:09'),
(237, 220, 15, NULL, NULL, NULL, 18.53, 3, 160, 0, 0, 0, 165, 2964.8, '2023-09-18 11:37:26', '2023-09-18 11:37:26'),
(238, 221, 15, NULL, NULL, NULL, 3.43, 3, 170, 0, 0, 0, 165, 583.1, '2023-09-18 11:38:34', '2023-09-18 11:38:34'),
(239, 222, 5, NULL, NULL, NULL, 20, 1, 11.5, 0, 0, 0, 10.9, 230, '2023-09-18 11:58:17', '2023-09-18 11:58:17'),
(240, 223, 14, NULL, NULL, NULL, 2.43, 2, 310, 0, 0, 0, 0.275, 753.3, '2023-09-18 11:59:13', '2023-09-18 11:59:13'),
(241, 224, 5, NULL, NULL, NULL, 150, 1, 11.2, 0, 0, 0, 10.9, 1680, '2023-09-18 12:09:28', '2023-09-18 12:09:28'),
(242, 225, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-18 12:09:59', '2023-09-18 12:09:59'),
(243, 226, 15, NULL, NULL, NULL, 1.97, 3, 170, 0, 0, 0, 165, 334.9, '2023-09-18 12:24:15', '2023-09-18 12:24:15'),
(244, 227, 5, NULL, NULL, NULL, 4, 1, 11.5, 0, 0, 0, 10.9, 46, '2023-09-18 12:39:47', '2023-09-18 12:39:47'),
(245, 228, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-18 12:40:19', '2023-09-18 12:40:19'),
(246, 229, 16, NULL, NULL, NULL, 8, 3, 65, 0, 0, 0, 60, 520, '2023-09-18 12:43:43', '2023-09-18 12:43:43'),
(247, 230, 5, NULL, NULL, NULL, 8, 1, 11.5, 0, 0, 0, 10.9, 92, '2023-09-18 12:54:45', '2023-09-18 12:54:45'),
(248, 231, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-18 13:15:17', '2023-09-18 13:15:17'),
(249, 232, 15, NULL, NULL, NULL, 13.4, 3, 160, 0, 0, 0, 165, 2144, '2023-09-18 13:21:51', '2023-09-18 13:21:51'),
(250, 233, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-18 13:32:07', '2023-09-18 13:32:07'),
(251, 234, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-18 13:32:43', '2023-09-18 13:32:43'),
(252, 235, 5, NULL, NULL, NULL, 16, 1, 11.5, 0, 0, 0, 10.9, 184, '2023-09-18 13:38:24', '2023-09-18 13:38:24'),
(253, 236, 14, NULL, NULL, NULL, 0.85, 2, 310, 0, 0, 0, 0.275, 263.5, '2023-09-18 13:42:44', '2023-09-18 13:42:44'),
(254, 237, 5, NULL, NULL, NULL, 8, 1, 11.5, 0, 0, 0, 10.9, 92, '2023-09-18 13:42:58', '2023-09-18 13:42:58'),
(255, 238, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-18 13:50:41', '2023-09-18 13:50:41'),
(256, 239, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-18 13:53:44', '2023-09-18 13:53:44'),
(257, 240, 15, NULL, NULL, NULL, 1.23, 3, 170, 0, 0, 0, 165, 209.1, '2023-09-18 14:08:54', '2023-09-18 14:08:54'),
(258, 241, 14, NULL, NULL, NULL, 2.29, 2, 310, 0, 0, 0, 0.275, 709.9, '2023-09-18 14:09:28', '2023-09-18 14:09:28'),
(259, 242, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-18 14:09:56', '2023-09-18 14:09:56'),
(260, 243, 5, NULL, NULL, NULL, 30, 1, 8, 0, 0, 0, 10.9, 240, '2023-09-18 14:10:59', '2023-09-18 14:10:59'),
(261, 244, 5, NULL, NULL, NULL, 330, 1, 11.3, 0, 0, 0, 10.9, 3729, '2023-09-18 14:24:56', '2023-09-18 14:24:56'),
(262, 245, 5, NULL, NULL, NULL, 50, 1, 11.5, 0, 0, 0, 10.9, 575, '2023-09-18 14:48:53', '2023-09-18 14:48:53'),
(263, 246, 5, NULL, NULL, NULL, 50, 1, 11.5, 0, 0, 0, 10.9, 575, '2023-09-18 14:50:09', '2023-09-18 14:50:09'),
(264, 247, 15, NULL, NULL, NULL, 31, 3, 170, 0, 0, 0, 165, 5270, '2023-09-18 15:03:37', '2023-09-18 15:03:37'),
(265, 247, 18, NULL, NULL, NULL, 720, 1, 12, 0, 0, 0, 11.5, 8640, '2023-09-18 15:03:37', '2023-09-18 15:03:37'),
(266, 248, 15, NULL, NULL, NULL, 1.05, 3, 170, 0, 0, 0, 165, 178.5, '2023-09-18 15:08:24', '2023-09-18 15:08:24'),
(267, 249, 15, NULL, NULL, NULL, 2.97, 3, 170, 0, 0, 0, 165, 504.9, '2023-09-18 15:27:30', '2023-09-18 15:27:30'),
(268, 250, 5, NULL, NULL, NULL, 12, 1, 11.5, 0, 0, 0, 10.9, 138, '2023-09-18 15:48:34', '2023-09-18 15:48:34'),
(269, 251, 15, NULL, NULL, NULL, 1.3, 3, 170, 0, 0, 0, 165, 221, '2023-09-19 06:19:25', '2023-09-19 06:19:25'),
(270, 252, 5, NULL, NULL, NULL, 150, 1, 11.5, 0, 0, 0, 10.9, 1725, '2023-09-19 07:29:22', '2023-09-19 07:29:22'),
(271, 253, 14, NULL, NULL, NULL, 1.63, 2, 310, 0, 0, 0, 0.275, 505.3, '2023-09-19 07:30:47', '2023-09-19 07:30:47'),
(272, 254, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-19 07:31:11', '2023-09-19 07:31:11'),
(273, 255, 15, NULL, NULL, NULL, 1, 3, 170, 0, 0, 0, 165, 170, '2023-09-19 07:34:43', '2023-09-19 07:34:43'),
(274, 256, 15, NULL, NULL, NULL, 3.8, 3, 170, 0, 0, 0, 165, 646, '2023-09-19 07:36:58', '2023-09-19 07:36:58'),
(275, 257, 15, NULL, NULL, NULL, 1.3, 3, 170, 0, 0, 0, 165, 221, '2023-09-19 07:39:20', '2023-09-19 07:39:20'),
(276, 258, 15, NULL, NULL, NULL, 2.1, 3, 170, 0, 0, 0, 165, 357, '2023-09-19 07:44:35', '2023-09-19 07:44:35'),
(277, 259, 5, NULL, NULL, NULL, 100, 1, 11.5, 0, 0, 0, 10.9, 1150, '2023-09-19 07:45:34', '2023-09-19 07:45:34'),
(278, 260, 5, NULL, NULL, NULL, 12, 1, 11.5, 0, 0, 0, 10.9, 138, '2023-09-19 07:53:33', '2023-09-19 07:53:33'),
(279, 261, 14, NULL, NULL, NULL, 2.83, 2, 310, 0, 0, 0, 0.275, 877.3, '2023-09-19 07:55:53', '2023-09-19 07:55:53'),
(280, 262, 14, NULL, NULL, NULL, 1.095, 2, 310, 0, 0, 0, 0.275, 339.45, '2023-09-19 08:19:24', '2023-09-19 08:19:24'),
(281, 263, 16, NULL, NULL, NULL, 4, 3, 65, 0, 0, 0, 60, 260, '2023-09-19 08:19:50', '2023-09-19 08:19:50'),
(282, 264, 17, NULL, NULL, NULL, 5.3, 3, 690, 0, 0, 0, 660, 3657, '2023-09-19 08:24:54', '2023-09-19 08:24:54'),
(283, 265, 5, NULL, NULL, NULL, 60, 1, 11.5, 0, 0, 0, 10.9, 690, '2023-09-19 08:27:13', '2023-09-19 08:27:13'),
(284, 266, 5, NULL, NULL, NULL, 180, 1, 11.5, 0, 0, 0, 10.9, 2070, '2023-09-19 08:31:35', '2023-09-19 08:31:35'),
(285, 267, 5, NULL, NULL, NULL, 12, 1, 11.5, 0, 0, 0, 10.9, 138, '2023-09-19 08:31:59', '2023-09-19 08:31:59'),
(286, 268, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-19 08:32:49', '2023-09-19 08:32:49'),
(287, 269, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-19 08:33:09', '2023-09-19 08:33:09'),
(288, 270, 5, NULL, NULL, NULL, 16, 1, 11.5, 0, 0, 0, 10.9, 184, '2023-09-19 08:33:36', '2023-09-19 08:33:36'),
(289, 271, 15, NULL, NULL, NULL, 1.83, 3, 170, 0, 0, 0, 165, 311.1, '2023-09-19 08:36:18', '2023-09-19 08:36:18'),
(290, 272, 5, NULL, NULL, NULL, 300, 1, 11.5, 0, 0, 0, 10.9, 3450, '2023-09-19 08:38:17', '2023-09-19 08:38:17'),
(291, 273, 15, NULL, NULL, NULL, 1.9, 3, 170, 0, 0, 0, 165, 323, '2023-09-19 08:39:17', '2023-09-19 08:39:17'),
(292, 274, 5, NULL, NULL, NULL, 8, 1, 11.5, 0, 0, 0, 10.9, 92, '2023-09-19 08:41:42', '2023-09-19 08:41:42'),
(293, 275, 15, NULL, NULL, NULL, 2.043, 3, 170, 0, 0, 0, 165, 347.31, '2023-09-19 08:43:33', '2023-09-19 08:43:33'),
(294, 276, 15, NULL, NULL, NULL, 1.095, 3, 170, 0, 0, 0, 165, 186.15, '2023-09-19 08:44:27', '2023-09-19 08:44:27'),
(295, 277, 15, NULL, NULL, NULL, 3.6, 3, 170, 0, 0, 0, 165, 612, '2023-09-19 08:46:06', '2023-09-19 08:46:06'),
(296, 278, 15, NULL, NULL, NULL, 1.9, 3, 170, 0, 0, 0, 165, 323, '2023-09-19 08:47:11', '2023-09-19 08:47:11'),
(297, 279, 15, NULL, NULL, NULL, 1.8, 3, 170, 0, 0, 0, 165, 306, '2023-09-19 08:52:36', '2023-09-19 08:52:36'),
(298, 280, 15, NULL, NULL, NULL, 1.94, 3, 170, 0, 0, 0, 165, 329.8, '2023-09-19 08:54:26', '2023-09-19 08:54:26'),
(299, 281, 15, NULL, NULL, NULL, 6.8, 3, 170, 0, 0, 0, 165, 1156, '2023-09-19 08:57:36', '2023-09-19 08:57:36'),
(300, 282, 15, NULL, NULL, NULL, 4, 3, 170, 0, 0, 0, 165, 680, '2023-09-19 09:34:41', '2023-09-19 09:34:41'),
(301, 283, 5, NULL, NULL, NULL, 8, 1, 12, 0, 0, 0, 10.9, 96, '2023-09-19 11:21:57', '2023-09-19 11:21:57'),
(302, 284, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-19 11:22:48', '2023-09-19 11:22:48'),
(303, 285, 15, NULL, NULL, NULL, 2.08, 3, 170, 0, 0, 0, 165, 353.6, '2023-09-19 11:24:07', '2023-09-19 11:24:07'),
(304, 286, 15, NULL, NULL, NULL, 3.6, 3, 170, 0, 0, 0, 165, 612, '2023-09-19 11:26:50', '2023-09-19 11:26:50'),
(305, 287, 15, NULL, NULL, NULL, 1.93, 3, 170, 0, 0, 0, 165, 328.1, '2023-09-19 11:28:41', '2023-09-19 11:28:41'),
(306, 288, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-19 11:54:22', '2023-09-19 11:54:22'),
(307, 289, 15, NULL, NULL, NULL, 3.6, 3, 170, 0, 0, 0, 165, 612, '2023-09-19 12:12:04', '2023-09-19 12:12:04'),
(308, 290, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-19 12:20:26', '2023-09-19 12:20:26'),
(309, 291, 5, NULL, NULL, NULL, 90, 1, 11.5, 0, 0, 0, 10.9, 1035, '2023-09-19 13:48:04', '2023-09-19 13:48:04'),
(310, 292, 5, NULL, NULL, NULL, 300, 1, 11.5, 0, 0, 0, 10.9, 3450, '2023-09-19 13:49:07', '2023-09-19 13:49:07'),
(311, 293, 5, NULL, NULL, NULL, 1500, 1, 11.5, 0, 0, 0, 10.9, 17250, '2023-09-19 13:59:52', '2023-09-19 13:59:52'),
(312, 294, 15, NULL, NULL, NULL, 1.1, 3, 170, 0, 0, 0, 165, 187, '2023-09-19 14:00:46', '2023-09-19 14:00:46'),
(313, 295, 16, NULL, NULL, NULL, 5, 3, 65, 0, 0, 0, 60, 325, '2023-09-19 14:05:30', '2023-09-19 14:05:30'),
(314, 296, 16, NULL, NULL, NULL, 5, 3, 65, 0, 0, 0, 60, 325, '2023-09-19 14:06:34', '2023-09-19 14:06:34'),
(315, 297, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-19 14:08:00', '2023-09-19 14:08:00'),
(316, 298, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-19 14:08:19', '2023-09-19 14:08:19'),
(317, 299, 5, NULL, NULL, NULL, 50, 1, 11.5, 0, 0, 0, 10.9, 575, '2023-09-19 14:10:37', '2023-09-19 14:10:37'),
(318, 300, 15, NULL, NULL, NULL, 1.7, 3, 170, 0, 0, 0, 165, 289, '2023-09-19 14:14:21', '2023-09-19 14:14:21'),
(319, 301, 5, NULL, NULL, NULL, 13, 1, 11.5, 0, 0, 0, 10.9, 149.5, '2023-09-19 14:29:59', '2023-09-19 14:29:59'),
(320, 302, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-19 14:31:45', '2023-09-19 14:31:45'),
(321, 303, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-19 14:32:07', '2023-09-19 14:32:07'),
(322, 304, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-19 14:47:22', '2023-09-19 14:47:22'),
(323, 305, 5, NULL, NULL, NULL, 8, 1, 11.5, 0, 0, 0, 10.9, 92, '2023-09-19 15:12:00', '2023-09-19 15:12:00'),
(324, 306, 14, NULL, NULL, NULL, 0.87, 2, 310, 0, 0, 0, 0.275, 269.7, '2023-09-19 15:27:54', '2023-09-19 15:27:54'),
(325, 307, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-19 15:35:26', '2023-09-19 15:35:26'),
(326, 308, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-19 15:36:41', '2023-09-19 15:36:41'),
(327, 309, 5, NULL, NULL, NULL, 60, 1, 11.5, 0, 0, 0, 10.9, 690, '2023-09-20 04:20:38', '2023-09-20 04:20:38'),
(328, 310, 5, NULL, NULL, NULL, 4, 1, 11.5, 0, 0, 0, 10.9, 46, '2023-09-20 04:29:54', '2023-09-20 04:29:54'),
(329, 311, 15, NULL, NULL, NULL, 1.18, 3, 170, 0, 0, 0, 165, 200.6, '2023-09-20 05:16:52', '2023-09-20 05:16:52'),
(330, 312, 5, NULL, NULL, NULL, 150, 1, 11.5, 0, 0, 0, 10.9, 1725, '2023-09-20 05:17:42', '2023-09-20 05:17:42'),
(331, 313, 16, NULL, NULL, NULL, 0.5, 3, 65, 0, 0, 0, 60, 32.5, '2023-09-20 05:18:20', '2023-09-20 05:18:20'),
(332, 314, 17, NULL, NULL, NULL, 1, 3, 700, 0, 0, 0, 660, 700, '2023-09-20 05:19:08', '2023-09-20 05:19:08'),
(333, 315, 15, NULL, NULL, NULL, 2.05, 3, 170, 0, 0, 0, 165, 348.5, '2023-09-20 05:20:31', '2023-09-20 05:20:31'),
(334, 316, 15, NULL, NULL, NULL, 1.965, 3, 170, 0, 0, 0, 165, 334.05, '2023-09-20 05:21:13', '2023-09-20 05:21:13'),
(335, 317, 15, NULL, NULL, NULL, 3.75, 3, 170, 0, 0, 0, 165, 637.5, '2023-09-20 05:21:58', '2023-09-20 05:21:58'),
(336, 318, 14, NULL, NULL, NULL, 1.04, 2, 310, 0, 0, 0, 0.275, 322.4, '2023-09-20 05:33:36', '2023-09-20 05:33:36'),
(337, 319, 5, NULL, NULL, NULL, 300, 1, 11.5, 0, 0, 0, 10.9, 3450, '2023-09-20 05:35:24', '2023-09-20 05:35:24'),
(338, 320, 15, NULL, NULL, NULL, 1.86, 3, 170, 0, 0, 0, 165, 316.2, '2023-09-20 05:54:52', '2023-09-20 05:54:52'),
(339, 321, 17, NULL, NULL, NULL, 0.5, 3, 690, 0, 0, 0, 660, 345, '2023-09-20 06:08:14', '2023-09-20 06:08:14'),
(340, 322, 14, NULL, NULL, NULL, 3.2, 2, 310, 0, 0, 0, 0.275, 992, '2023-09-20 06:14:57', '2023-09-20 06:14:57'),
(341, 323, 17, NULL, NULL, NULL, 0.76, 3, 690, 0, 0, 0, 660, 524.4, '2023-09-20 06:30:24', '2023-09-20 06:30:24'),
(342, 324, 5, NULL, NULL, NULL, 4, 1, 11.5, 0, 0, 0, 10.9, 46, '2023-09-20 09:32:39', '2023-09-20 09:32:39'),
(343, 325, 5, NULL, NULL, NULL, 100, 1, 11.5, 0, 0, 0, 10.9, 1150, '2023-09-20 09:34:26', '2023-09-20 09:34:26'),
(344, 326, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-20 09:36:20', '2023-09-20 09:36:20'),
(345, 327, 14, NULL, NULL, NULL, 1.08, 2, 310, 0, 0, 0, 0.275, 334.8, '2023-09-20 09:40:33', '2023-09-20 09:40:33'),
(346, 328, 17, NULL, NULL, NULL, 1, 3, 690, 0, 0, 0, 660, 690, '2023-09-20 09:41:39', '2023-09-20 09:41:39'),
(347, 329, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-20 09:42:55', '2023-09-20 09:42:55'),
(348, 330, 15, NULL, NULL, NULL, 2.08, 3, 170, 0, 0, 0, 165, 353.6, '2023-09-20 11:03:56', '2023-09-20 11:03:56'),
(349, 331, 16, NULL, NULL, NULL, 0.5, 3, 65, 0, 0, 0, 60, 32.5, '2023-09-20 11:23:09', '2023-09-20 11:23:09'),
(350, 332, 5, NULL, NULL, NULL, 100, 1, 11.5, 0, 0, 0, 10.9, 1150, '2023-09-20 11:24:30', '2023-09-20 11:24:30'),
(351, 333, 5, NULL, NULL, NULL, 8, 1, 11.5, 0, 0, 0, 10.9, 92, '2023-09-20 11:55:05', '2023-09-20 11:55:05'),
(352, 334, 17, NULL, NULL, NULL, 3, 3, 690, 0, 0, 0, 660, 2070, '2023-09-20 12:08:27', '2023-09-20 12:08:27'),
(353, 335, 15, NULL, NULL, NULL, 3.5, 3, 170, 0, 0, 0, 165, 595, '2023-09-20 14:33:08', '2023-09-20 14:33:08'),
(354, 336, 15, NULL, NULL, NULL, 1.6, 3, 170, 0, 0, 0, 165, 272, '2023-09-20 14:34:39', '2023-09-20 14:34:39'),
(355, 337, 15, NULL, NULL, NULL, 1.7, 3, 170, 0, 0, 0, 165, 289, '2023-09-20 14:35:17', '2023-09-20 14:35:17'),
(356, 338, 14, NULL, NULL, NULL, 3.68, 2, 310, 0, 0, 0, 0.275, 1140.8, '2023-09-20 14:36:45', '2023-09-20 14:36:45'),
(357, 339, 15, NULL, NULL, NULL, 1.8, 3, 170, 0, 0, 0, 165, 306, '2023-09-20 14:37:13', '2023-09-20 14:37:13'),
(358, 340, 13, NULL, NULL, NULL, 0.8, 3, 650, 0, 0, 0, 540, 520, '2023-09-20 14:38:21', '2023-09-20 14:38:21'),
(359, 341, 16, NULL, NULL, NULL, 5, 3, 65, 0, 0, 0, 60, 325, '2023-09-20 14:38:53', '2023-09-20 14:38:53'),
(360, 342, 5, NULL, NULL, NULL, 120, 1, 11.5, 0, 0, 0, 10.9, 1380, '2023-09-20 14:39:55', '2023-09-20 14:39:55'),
(361, 343, 14, NULL, NULL, NULL, 1.1, 2, 310, 0, 0, 0, 0.275, 341, '2023-09-20 14:40:52', '2023-09-20 14:40:52'),
(362, 344, 16, NULL, NULL, NULL, 2.5, 3, 65, 0, 0, 0, 60, 162.5, '2023-09-20 14:41:21', '2023-09-20 14:41:21'),
(363, 345, 16, NULL, NULL, NULL, 4, 3, 65, 0, 0, 0, 60, 260, '2023-09-20 14:42:36', '2023-09-20 14:42:36'),
(364, 346, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-20 14:43:03', '2023-09-20 14:43:03'),
(365, 347, 15, NULL, NULL, NULL, 2.62, 3, 170, 0, 0, 0, 165, 445.4, '2023-09-20 14:43:53', '2023-09-20 14:43:53'),
(366, 348, 15, NULL, NULL, NULL, 1.7, 3, 170, 0, 0, 0, 165, 289, '2023-09-20 14:45:02', '2023-09-20 14:45:02'),
(367, 349, 5, NULL, NULL, NULL, 1500, 1, 11.5, 0, 0, 0, 10.9, 17250, '2023-09-20 14:46:55', '2023-09-20 14:46:55'),
(368, 350, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-20 14:47:42', '2023-09-20 14:47:42'),
(369, 351, 5, NULL, NULL, NULL, 8, 1, 11.5, 0, 0, 0, 10.9, 92, '2023-09-20 14:48:03', '2023-09-20 14:48:03'),
(370, 352, 17, NULL, NULL, NULL, 5, 3, 690, 0, 0, 0, 660, 3450, '2023-09-20 14:48:46', '2023-09-20 14:48:46'),
(371, 353, 15, NULL, NULL, NULL, 5.28, 3, 170, 0, 0, 0, 165, 897.6, '2023-09-21 04:09:21', '2023-09-21 04:09:21'),
(372, 354, 15, NULL, NULL, NULL, 2.1, 3, 170, 0, 0, 0, 165, 357, '2023-09-21 04:10:08', '2023-09-21 04:10:08'),
(373, 355, 5, NULL, NULL, NULL, 8, 1, 11.5, 0, 0, 0, 10.9, 92, '2023-09-21 04:10:42', '2023-09-21 04:10:42'),
(374, 356, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-21 04:11:33', '2023-09-21 04:11:33'),
(375, 357, 5, NULL, NULL, NULL, 28, 1, 11.5, 0, 0, 0, 10.9, 322, '2023-09-21 04:13:22', '2023-09-21 04:13:22'),
(376, 358, 5, NULL, NULL, NULL, 12, 1, 11.5, 0, 0, 0, 10.9, 138, '2023-09-21 04:13:44', '2023-09-21 04:13:44'),
(377, 359, 13, NULL, NULL, NULL, 0.738, 3, 650, 0, 0, 0, 540, 479.7, '2023-09-21 04:18:31', '2023-09-21 04:18:31'),
(378, 360, 17, NULL, NULL, NULL, 0.5, 3, 690, 0, 0, 0, 660, 345, '2023-09-21 04:23:14', '2023-09-21 04:23:14'),
(379, 361, 5, NULL, NULL, NULL, 16, 1, 11.5, 0, 0, 0, 10.9, 184, '2023-09-21 04:28:29', '2023-09-21 04:28:29'),
(380, 362, 15, NULL, NULL, NULL, 1.54, 3, 170, 0, 0, 0, 165, 261.8, '2023-09-21 04:51:51', '2023-09-21 04:51:51'),
(381, 363, 15, NULL, NULL, NULL, 3.46, 3, 170, 0, 0, 0, 165, 588.2, '2023-09-21 04:54:05', '2023-09-21 04:54:05'),
(382, 364, 5, NULL, NULL, NULL, 300, 1, 11.5, 0, 0, 0, 10.9, 3450, '2023-09-21 05:08:12', '2023-09-21 05:08:12'),
(383, 365, 5, NULL, NULL, NULL, 70, 1, 11.5, 0, 0, 0, 10.9, 805, '2023-09-21 05:10:53', '2023-09-21 05:10:53'),
(384, 366, 15, NULL, NULL, NULL, 1.63, 3, 170, 0, 0, 0, 165, 277.1, '2023-09-21 05:14:05', '2023-09-21 05:14:05'),
(385, 367, 5, NULL, NULL, NULL, 300, 1, 11.5, 0, 0, 0, 10.9, 3450, '2023-09-21 05:46:33', '2023-09-21 05:46:33'),
(386, 368, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-21 06:49:51', '2023-09-21 06:49:51'),
(387, 369, 5, NULL, NULL, NULL, 19, 1, 11.5, 0, 0, 0, 10.9, 218.5, '2023-09-21 06:54:36', '2023-09-21 06:54:36'),
(388, 370, 5, NULL, NULL, NULL, 60, 1, 11.5, 0, 0, 0, 10.9, 690, '2023-09-21 06:57:02', '2023-09-21 06:57:02'),
(389, 371, 5, NULL, NULL, NULL, 200, 1, 11.5, 0, 0, 0, 10.9, 2300, '2023-09-21 06:57:40', '2023-09-21 06:57:40'),
(390, 372, 5, NULL, NULL, NULL, 100, 1, 11.5, 0, 0, 0, 10.9, 1150, '2023-09-21 06:58:11', '2023-09-21 06:58:11'),
(391, 373, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-21 06:58:59', '2023-09-21 06:58:59'),
(392, 374, 15, NULL, NULL, NULL, 1.93, 3, 170, 0, 0, 0, 165, 328.1, '2023-09-21 07:00:10', '2023-09-21 07:00:10'),
(393, 375, 17, NULL, NULL, NULL, 5, 3, 690, 0, 0, 0, 660, 3450, '2023-09-21 07:01:01', '2023-09-21 07:01:01'),
(394, 376, 15, NULL, NULL, NULL, 1.9, 3, 170, 0, 0, 0, 165, 323, '2023-09-21 07:25:56', '2023-09-21 07:25:56'),
(395, 377, 5, NULL, NULL, NULL, 7, 1, 11.5, 0, 0, 0, 10.9, 80.5, '2023-09-21 07:26:15', '2023-09-21 07:26:15'),
(396, 378, 14, NULL, NULL, NULL, 0.76, 2, 310, 0, 0, 0, 0.275, 235.6, '2023-09-21 07:39:02', '2023-09-21 07:39:02'),
(397, 379, 15, NULL, NULL, NULL, 1.78, 3, 170, 0, 0, 0, 165, 302.6, '2023-09-21 07:44:08', '2023-09-21 07:44:08'),
(398, 380, 5, NULL, NULL, NULL, 18, 1, 11.5, 0, 0, 0, 10.9, 207, '2023-09-21 07:44:31', '2023-09-21 07:44:31'),
(399, 381, 5, NULL, NULL, NULL, 4, 1, 11.5, 0, 0, 0, 10.9, 46, '2023-09-21 08:05:55', '2023-09-21 08:05:55'),
(400, 382, 5, NULL, NULL, NULL, 100, 1, 11.5, 0, 0, 0, 10.9, 1150, '2023-09-21 08:06:29', '2023-09-21 08:06:29'),
(401, 383, 5, NULL, NULL, NULL, 72, 1, 11.5, 0, 0, 0, 10.9, 828, '2023-09-21 08:26:59', '2023-09-21 08:26:59'),
(402, 384, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-21 09:02:48', '2023-09-21 09:02:48'),
(403, 385, 5, NULL, NULL, NULL, 70, 1, 11.5, 0, 0, 0, 10.9, 805, '2023-09-21 09:03:35', '2023-09-21 09:03:35'),
(404, 386, 17, NULL, NULL, NULL, 1, 3, 690, 0, 0, 0, 660, 690, '2023-09-21 09:26:02', '2023-09-21 09:26:02'),
(405, 387, 15, NULL, NULL, NULL, 1.8, 3, 170, 0, 0, 0, 165, 306, '2023-09-21 09:57:12', '2023-09-21 09:57:12'),
(406, 388, 14, NULL, NULL, NULL, 1.2, 2, 310, 0, 0, 0, 0.275, 372, '2023-09-21 10:16:00', '2023-09-21 10:16:00'),
(407, 389, 5, NULL, NULL, NULL, 12, 1, 11.5, 0, 0, 0, 10.9, 138, '2023-09-21 10:18:30', '2023-09-21 10:18:30'),
(408, 390, 5, NULL, NULL, NULL, 6, 1, 11.5, 0, 0, 0, 10.9, 69, '2023-09-21 10:25:14', '2023-09-21 10:25:14'),
(409, 391, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-21 10:56:14', '2023-09-21 10:56:14'),
(410, 392, 5, NULL, NULL, NULL, 4, 1, 11.5, 0, 0, 0, 10.9, 46, '2023-09-21 10:56:33', '2023-09-21 10:56:33'),
(411, 393, 16, NULL, NULL, NULL, 5, 3, 65, 0, 0, 0, 60, 325, '2023-09-21 11:03:41', '2023-09-21 11:03:41'),
(412, 394, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-21 11:05:51', '2023-09-21 11:05:51'),
(413, 395, 15, NULL, NULL, NULL, 3.7, 3, 170, 0, 0, 0, 165, 629, '2023-09-21 11:29:22', '2023-09-21 11:29:22'),
(414, 396, 5, NULL, NULL, NULL, 120, 1, 11.5, 0, 0, 0, 10.9, 1380, '2023-09-21 12:12:46', '2023-09-21 12:12:46'),
(415, 397, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-21 12:13:32', '2023-09-21 12:13:32'),
(416, 398, 5, NULL, NULL, NULL, 12, 1, 11.5, 0, 0, 0, 10.9, 138, '2023-09-21 12:14:14', '2023-09-21 12:14:14'),
(417, 399, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-21 12:17:09', '2023-09-21 12:17:09'),
(418, 399, 5, NULL, NULL, NULL, 8, 1, 11.25, 0, 0, 0, 10.9, 90, '2023-09-21 12:17:09', '2023-09-21 12:17:09'),
(419, 399, 15, NULL, NULL, NULL, 1.88, 3, 170, 0, 0, 0, 165, 319.6, '2023-09-21 12:17:09', '2023-09-21 12:17:09'),
(420, 400, 14, NULL, NULL, NULL, 23.6, 2, 310, 0, 0, 0, 0.275, 7316, '2023-09-21 12:19:57', '2023-09-21 12:19:57'),
(421, 401, 15, NULL, NULL, NULL, 5.5, 3, 170, 0, 0, 0, 165, 935, '2023-09-21 12:27:10', '2023-09-21 12:27:10'),
(422, 402, 16, NULL, NULL, NULL, 10, 3, 65, 0, 0, 0, 60, 650, '2023-09-21 12:27:42', '2023-09-21 12:27:42'),
(423, 403, 5, NULL, NULL, NULL, 9, 1, 11.5, 0, 0, 0, 10.9, 103.5, '2023-09-21 12:32:22', '2023-09-21 12:32:22'),
(424, 404, 15, NULL, NULL, NULL, 1.78, 3, 170, 0, 0, 0, 165, 302.6, '2023-09-21 12:43:17', '2023-09-21 12:43:17'),
(425, 405, 14, NULL, NULL, NULL, 0.58, 2, 310, 0, 0, 0, 0.275, 179.8, '2023-09-21 12:45:30', '2023-09-21 12:45:30'),
(426, 406, 16, NULL, NULL, NULL, 0.5, 3, 65, 0, 0, 0, 60, 32.5, '2023-09-21 12:46:28', '2023-09-21 12:46:28'),
(427, 407, 15, NULL, NULL, NULL, 1.68, 3, 170, 0, 0, 0, 165, 285.6, '2023-09-21 12:59:02', '2023-09-21 12:59:02'),
(428, 408, 5, NULL, NULL, NULL, 20, 1, 11.5, 0, 0, 0, 10.9, 230, '2023-09-21 12:59:39', '2023-09-21 12:59:39'),
(429, 409, 14, NULL, NULL, NULL, 1.83, 2, 310, 0, 0, 0, 0.275, 567.3, '2023-09-21 13:00:23', '2023-09-21 13:00:23'),
(430, 410, 5, NULL, NULL, NULL, 4, 1, 11.5, 0, 0, 0, 10.9, 46, '2023-09-21 13:00:43', '2023-09-21 13:00:43'),
(431, 411, 15, NULL, NULL, NULL, 1.79, 3, 170, 0, 0, 0, 165, 304.3, '2023-09-21 13:05:32', '2023-09-21 13:05:32'),
(432, 412, 15, NULL, NULL, NULL, 1.7, 3, 170, 0, 0, 0, 165, 289, '2023-09-21 13:06:22', '2023-09-21 13:06:22'),
(433, 413, 15, NULL, NULL, NULL, 1.76, 3, 170, 0, 0, 0, 165, 299.2, '2023-09-21 13:07:06', '2023-09-21 13:07:06'),
(434, 414, 15, NULL, NULL, NULL, 1.87, 3, 170, 0, 0, 0, 165, 317.9, '2023-09-21 13:15:47', '2023-09-21 13:15:47'),
(435, 415, 15, NULL, NULL, NULL, 1.73, 3, 170, 0, 0, 0, 165, 294.1, '2023-09-21 13:28:35', '2023-09-21 13:28:35'),
(436, 416, 15, NULL, NULL, NULL, 1.77, 3, 170, 0, 0, 0, 165, 300.9, '2023-09-21 13:29:04', '2023-09-21 13:29:04'),
(437, 417, 5, NULL, NULL, NULL, 8, 1, 11.5, 0, 0, 0, 10.9, 92, '2023-09-21 13:29:35', '2023-09-21 13:29:35'),
(438, 418, 14, NULL, NULL, NULL, 1.14, 2, 310, 0, 0, 0, 0.275, 353.4, '2023-09-21 13:49:06', '2023-09-21 13:49:06'),
(439, 419, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-21 13:53:02', '2023-09-21 13:53:02'),
(440, 420, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-21 14:17:06', '2023-09-21 14:17:06'),
(441, 421, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-21 14:17:26', '2023-09-21 14:17:26'),
(442, 422, 15, NULL, NULL, NULL, 1.7, 3, 170, 0, 0, 0, 165, 289, '2023-09-21 14:22:10', '2023-09-21 14:22:10'),
(443, 423, 15, NULL, NULL, NULL, 1.78, 3, 170, 0, 0, 0, 165, 302.6, '2023-09-21 14:47:50', '2023-09-21 14:47:50'),
(444, 424, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-21 14:48:27', '2023-09-21 14:48:27'),
(445, 425, 5, NULL, NULL, NULL, 90, 1, 11.5, 0, 0, 0, 10.9, 1035, '2023-09-21 14:55:18', '2023-09-21 14:55:18'),
(446, 426, 15, NULL, NULL, NULL, 1.94, 3, 170, 0, 0, 0, 165, 329.8, '2023-09-21 14:56:30', '2023-09-21 14:56:30'),
(447, 427, 15, NULL, NULL, NULL, 1.63, 3, 170, 0, 0, 0, 165, 277.1, '2023-09-21 14:57:14', '2023-09-21 14:57:14'),
(448, 428, 14, NULL, NULL, NULL, 0.56, 2, 310, 0, 0, 0, 0.275, 173.6, '2023-09-21 15:15:26', '2023-09-21 15:15:26'),
(449, 429, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-21 15:16:41', '2023-09-21 15:16:41'),
(450, 430, 19, NULL, NULL, NULL, 53, 1, 155, 0, 0, 0, 155, 8215, '2023-09-21 15:20:33', '2023-09-21 15:20:33'),
(451, 431, 18, NULL, NULL, NULL, 600, 1, 12, 0, 0, 0, 11.5, 7200, '2023-09-21 15:21:57', '2023-09-21 15:21:57'),
(452, 432, 15, NULL, NULL, NULL, 25.4, 3, 170, 0, 0, 0, 165, 4318, '2023-09-22 02:24:39', '2023-09-22 02:24:39'),
(453, 433, 5, NULL, NULL, NULL, 100, 1, 11.25, 0, 0, 0, 10.9, 1125, '2023-09-22 02:54:57', '2023-09-22 02:54:57'),
(454, 434, 15, NULL, NULL, NULL, 10.4, 3, 170, 0, 0, 0, 165, 1768, '2023-09-22 02:56:50', '2023-09-22 02:56:50'),
(455, 435, 5, NULL, NULL, NULL, 12, 1, 11.5, 0, 0, 0, 10.9, 138, '2023-09-22 03:20:25', '2023-09-22 03:20:25'),
(456, 436, 14, NULL, NULL, NULL, 0.94, 2, 310, 0, 0, 0, 0.275, 291.4, '2023-09-22 03:33:57', '2023-09-22 03:33:57'),
(457, 437, 5, NULL, NULL, NULL, 4, 1, 11.5, 0, 0, 0, 10.9, 46, '2023-09-22 03:49:56', '2023-09-22 03:49:56'),
(458, 437, 15, NULL, NULL, NULL, 1.9, 3, 170, 0, 0, 0, 165, 323, '2023-09-22 03:49:56', '2023-09-22 03:49:56'),
(459, 438, 17, NULL, NULL, NULL, 3, 3, 700, 0, 0, 0, 660, 2100, '2023-09-22 04:15:02', '2023-09-22 04:15:02'),
(460, 439, 15, NULL, NULL, NULL, 2.1, 3, 170, 0, 0, 0, 165, 357, '2023-09-22 04:35:29', '2023-09-22 04:35:29'),
(461, 440, 17, NULL, NULL, NULL, 25.2, 3, 680, 0, 0, 0, 660, 17136, '2023-09-22 04:48:47', '2023-09-22 04:48:47'),
(462, 441, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-22 06:02:16', '2023-09-22 06:02:16'),
(463, 441, 14, NULL, NULL, NULL, 2.99, 2, 300, 0, 0, 0, 0.275, 897, '2023-09-22 06:02:16', '2023-09-22 06:02:16'),
(464, 441, 16, NULL, NULL, NULL, 3, 3, 65, 0, 0, 0, 60, 195, '2023-09-22 06:02:16', '2023-09-22 06:02:16'),
(465, 442, 5, NULL, NULL, NULL, 300, 1, 11.5, 0, 0, 0, 10.9, 3450, '2023-09-22 06:12:42', '2023-09-22 06:12:42'),
(466, 443, 15, NULL, NULL, NULL, 1.69, 3, 175, 0, 0, 0, 165, 295.75, '2023-09-22 06:17:42', '2023-09-22 06:17:42'),
(467, 444, 15, NULL, NULL, NULL, 2.95, 3, 170, 0, 0, 0, 165, 501.5, '2023-09-22 10:08:52', '2023-09-22 10:08:52');
INSERT INTO `product_sales` (`id`, `sale_id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `qty`, `sale_unit_id`, `net_unit_price`, `discount`, `tax_rate`, `tax`, `unit_cost`, `total`, `created_at`, `updated_at`) VALUES
(468, 445, 15, NULL, NULL, NULL, 1.33, 3, 170, 0, 0, 0, 165, 226.1, '2023-09-22 10:10:20', '2023-09-22 10:10:20'),
(469, 446, 15, NULL, NULL, NULL, 1.9, 3, 170, 0, 0, 0, 165, 323, '2023-09-22 10:11:15', '2023-09-22 10:11:15'),
(470, 447, 15, NULL, NULL, NULL, 1.9, 3, 170, 0, 0, 0, 165, 323, '2023-09-22 10:13:10', '2023-09-22 10:13:10'),
(471, 448, 15, NULL, NULL, NULL, 1.9, 3, 170, 0, 0, 0, 165, 323, '2023-09-22 10:13:55', '2023-09-22 10:13:55'),
(472, 449, 15, NULL, NULL, NULL, 2, 3, 170, 0, 0, 0, 165, 340, '2023-09-22 10:14:36', '2023-09-22 10:14:36'),
(473, 450, 15, NULL, NULL, NULL, 22.3, 3, 170, 0, 0, 0, 165, 3791, '2023-09-22 10:18:30', '2023-09-22 10:18:30'),
(474, 451, 15, NULL, NULL, NULL, 1.6, 3, 170, 0, 0, 0, 165, 272, '2023-09-22 10:19:10', '2023-09-22 10:19:10'),
(475, 452, 15, NULL, NULL, NULL, 1.9, 3, 170, 0, 0, 0, 165, 323, '2023-09-22 10:27:39', '2023-09-22 10:27:39'),
(476, 453, 15, NULL, NULL, NULL, 1.56, 3, 170, 0, 0, 0, 165, 265.2, '2023-09-22 10:29:31', '2023-09-22 10:29:31'),
(477, 454, 15, NULL, NULL, NULL, 5.89, 3, 170, 0, 0, 0, 165, 1001.3, '2023-09-22 10:30:26', '2023-09-22 10:30:26'),
(478, 455, 15, NULL, NULL, NULL, 1.67, 3, 170, 0, 0, 0, 165, 283.9, '2023-09-22 10:31:13', '2023-09-22 10:31:13'),
(479, 456, 15, NULL, NULL, NULL, 1.82, 3, 170, 0, 0, 0, 165, 309.4, '2023-09-22 10:32:11', '2023-09-22 10:32:11'),
(480, 457, 15, NULL, NULL, NULL, 1.84, 3, 170, 0, 0, 0, 165, 312.8, '2023-09-22 10:41:50', '2023-09-22 10:41:50'),
(481, 458, 19, NULL, NULL, NULL, 2, 1, 155, 0, 0, 0, 155, 310, '2023-09-22 11:02:06', '2023-09-22 11:02:06'),
(482, 459, 18, NULL, NULL, NULL, 350, 1, 11, 0, 0, 0, 11.5, 3850, '2023-09-22 11:03:42', '2023-09-22 11:03:42'),
(483, 460, 15, NULL, NULL, NULL, 1.5, 3, 170, 0, 0, 0, 165, 255, '2023-09-22 11:09:00', '2023-09-22 11:09:00'),
(484, 461, 15, NULL, NULL, NULL, 2, 3, 170, 0, 0, 0, 165, 340, '2023-09-22 11:09:57', '2023-09-22 11:09:57'),
(485, 462, 15, NULL, NULL, NULL, 1.58, 3, 170, 0, 0, 0, 165, 268.6, '2023-09-22 11:12:26', '2023-09-22 11:12:26'),
(486, 463, 15, NULL, NULL, NULL, 1.56, 3, 170, 0, 0, 0, 165, 265.2, '2023-09-22 11:13:51', '2023-09-22 11:13:51'),
(487, 464, 15, NULL, NULL, NULL, 1.69, 3, 170, 0, 0, 0, 165, 287.3, '2023-09-22 11:14:29', '2023-09-22 11:14:29'),
(488, 465, 15, NULL, NULL, NULL, 1.65, 3, 170, 0, 0, 0, 165, 280.5, '2023-09-22 11:15:12', '2023-09-22 11:15:12'),
(489, 466, 15, NULL, NULL, NULL, 1.53, 3, 170, 0, 0, 0, 165, 260.1, '2023-09-22 11:15:39', '2023-09-22 11:15:39'),
(490, 467, 15, NULL, NULL, NULL, 1.3, 3, 170, 0, 0, 0, 165, 221, '2023-09-22 11:16:32', '2023-09-22 11:16:32'),
(491, 468, 15, NULL, NULL, NULL, 1.5, 3, 170, 0, 0, 0, 165, 255, '2023-09-22 11:17:13', '2023-09-22 11:17:13'),
(492, 469, 15, NULL, NULL, NULL, 1.54, 3, 170, 0, 0, 0, 165, 261.8, '2023-09-22 11:18:15', '2023-09-22 11:18:15'),
(493, 470, 15, NULL, NULL, NULL, 1.74, 3, 170, 0, 0, 0, 165, 295.8, '2023-09-22 11:19:02', '2023-09-22 11:19:02'),
(494, 471, 15, NULL, NULL, NULL, 1.52, 3, 170, 0, 0, 0, 165, 258.4, '2023-09-22 11:19:53', '2023-09-22 11:19:53'),
(495, 472, 15, NULL, NULL, NULL, 1.39, 3, 170, 0, 0, 0, 165, 236.3, '2023-09-22 11:20:54', '2023-09-22 11:20:54'),
(496, 473, 15, NULL, NULL, NULL, 2.63, 3, 170, 0, 0, 0, 165, 447.1, '2023-09-22 11:21:37', '2023-09-22 11:21:37'),
(497, 474, 15, NULL, NULL, NULL, 1.6, 3, 170, 0, 0, 0, 165, 272, '2023-09-22 11:23:05', '2023-09-22 11:23:05'),
(498, 475, 17, NULL, NULL, NULL, 0.5, 3, 700, 0, 0, 0, 660, 350, '2023-09-22 11:23:31', '2023-09-22 11:23:31'),
(499, 476, 17, NULL, NULL, NULL, 1, 3, 700, 0, 0, 0, 660, 700, '2023-09-22 11:23:51', '2023-09-22 11:23:51'),
(500, 477, 17, NULL, NULL, NULL, 7, 3, 700, 0, 0, 0, 660, 4900, '2023-09-22 11:25:32', '2023-09-22 11:25:32'),
(501, 478, 17, NULL, NULL, NULL, 1.14, 3, 700, 0, 0, 0, 660, 798, '2023-09-22 11:25:54', '2023-09-22 11:25:54'),
(502, 479, 17, NULL, NULL, NULL, 7.5, 3, 700, 0, 0, 0, 660, 5250, '2023-09-22 11:27:10', '2023-09-22 11:27:10'),
(503, 480, 17, NULL, NULL, NULL, 1.42, 3, 700, 0, 0, 0, 660, 994, '2023-09-22 11:27:28', '2023-09-22 11:27:28'),
(504, 481, 17, NULL, NULL, NULL, 0.5, 3, 700, 0, 0, 0, 660, 350, '2023-09-22 11:27:42', '2023-09-22 11:27:42'),
(505, 482, 17, NULL, NULL, NULL, 1.28, 3, 700, 0, 0, 0, 660, 896, '2023-09-22 11:27:59', '2023-09-22 11:27:59'),
(506, 483, 17, NULL, NULL, NULL, 4, 3, 700, 0, 0, 0, 660, 2800, '2023-09-22 11:28:14', '2023-09-22 11:28:14'),
(507, 484, 17, NULL, NULL, NULL, 0.714, 3, 700, 0, 0, 0, 660, 499.8, '2023-09-22 11:28:30', '2023-09-22 11:28:30'),
(508, 485, 17, NULL, NULL, NULL, 1.96, 3, 700, 0, 0, 0, 660, 1372, '2023-09-22 11:28:49', '2023-09-22 11:28:49'),
(509, 486, 17, NULL, NULL, NULL, 2.5, 3, 700, 0, 0, 0, 660, 1750, '2023-09-22 11:29:17', '2023-09-22 11:29:17'),
(510, 487, 17, NULL, NULL, NULL, 0.92, 3, 700, 0, 0, 0, 660, 644, '2023-09-22 11:30:05', '2023-09-22 11:30:05'),
(511, 488, 17, NULL, NULL, NULL, 0.5, 3, 700, 0, 0, 0, 660, 350, '2023-09-22 11:30:17', '2023-09-22 11:30:17'),
(512, 489, 17, NULL, NULL, NULL, 7, 3, 700, 0, 0, 0, 660, 4900, '2023-09-22 11:31:22', '2023-09-22 11:31:22'),
(513, 490, 17, NULL, NULL, NULL, 7, 3, 700, 0, 0, 0, 660, 4900, '2023-09-22 11:32:03', '2023-09-22 11:32:03'),
(514, 491, 15, NULL, NULL, NULL, 2.89, 3, 170, 0, 0, 0, 165, 491.3, '2023-09-22 11:37:22', '2023-09-22 11:37:22'),
(515, 492, 17, NULL, NULL, NULL, 5, 3, 700, 0, 0, 0, 660, 3500, '2023-09-22 11:37:57', '2023-09-22 11:37:57'),
(516, 493, 17, NULL, NULL, NULL, 3, 3, 700, 0, 0, 0, 660, 2100, '2023-09-22 11:39:14', '2023-09-22 11:39:14'),
(517, 494, 5, NULL, NULL, NULL, 4, 1, 11.5, 0, 0, 0, 10.9, 46, '2023-09-22 11:40:02', '2023-09-22 11:40:02'),
(518, 495, 5, NULL, NULL, NULL, 130, 1, 11.5, 0, 0, 0, 10.9, 1495, '2023-09-22 11:41:51', '2023-09-22 11:41:51'),
(519, 496, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-22 11:42:27', '2023-09-22 11:42:27'),
(520, 497, 5, NULL, NULL, NULL, 8, 1, 11.5, 0, 0, 0, 10.9, 92, '2023-09-22 11:48:31', '2023-09-22 11:48:31'),
(521, 498, 15, NULL, NULL, NULL, 1.58, 3, 175, 0, 0, 0, 165, 276.5, '2023-09-22 12:13:37', '2023-09-22 12:13:37'),
(522, 499, 5, NULL, NULL, NULL, 30, 1, 11.5, 0, 0, 0, 10.9, 345, '2023-09-22 12:15:06', '2023-09-22 12:15:06'),
(523, 500, 5, NULL, NULL, NULL, 180, 1, 11.25, 0, 0, 0, 10.9, 2025, '2023-09-22 12:16:43', '2023-09-22 12:16:43'),
(524, 501, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-22 12:17:08', '2023-09-22 12:17:08'),
(525, 502, 5, NULL, NULL, NULL, 5, 1, 11.25, 0, 0, 0, 10.9, 56.25, '2023-09-22 12:17:47', '2023-09-22 12:17:47'),
(526, 503, 5, NULL, NULL, NULL, 4, 1, 11.25, 0, 0, 0, 10.9, 45, '2023-09-22 12:18:25', '2023-09-22 12:18:25'),
(527, 504, 5, NULL, NULL, NULL, 8, 1, 11.25, 0, 0, 0, 10.9, 90, '2023-09-22 12:18:53', '2023-09-22 12:18:53'),
(528, 505, 14, NULL, NULL, NULL, 22.4, 2, 300, 0, 0, 0, 0.275, 6720, '2023-09-22 12:21:33', '2023-09-22 12:21:33'),
(529, 506, 12, NULL, NULL, NULL, 0.721, 3, 1300, 0, 0, 0, 1200, 937.3, '2023-09-22 12:23:23', '2023-09-22 12:23:23'),
(530, 507, 13, NULL, NULL, NULL, 2.3, 3, 650, 0, 0, 0, 540, 1495, '2023-09-22 12:26:51', '2023-09-22 12:26:51'),
(531, 508, 13, NULL, NULL, NULL, 0.86, 3, 650, 0, 0, 0, 540, 559, '2023-09-22 12:28:48', '2023-09-22 12:28:48'),
(532, 509, 17, NULL, NULL, NULL, 3, 3, 700, 0, 0, 0, 660, 2100, '2023-09-22 12:29:30', '2023-09-22 12:29:30'),
(533, 510, 5, NULL, NULL, NULL, 4, 1, 11.25, 0, 0, 0, 10.9, 45, '2023-09-22 12:29:56', '2023-09-22 12:29:56'),
(534, 511, 5, NULL, NULL, NULL, 10, 1, 11.25, 0, 0, 0, 10.9, 112.5, '2023-09-22 12:34:27', '2023-09-22 12:34:27'),
(535, 512, 5, NULL, NULL, NULL, 300, 1, 11, 0, 0, 0, 10.9, 3300, '2023-09-22 12:41:33', '2023-09-22 12:41:33'),
(536, 513, 5, NULL, NULL, NULL, 130, 1, 11.2, 0, 0, 0, 10.9, 1456, '2023-09-22 12:46:17', '2023-09-22 12:46:17'),
(537, 514, 5, NULL, NULL, NULL, 350, 1, 11, 0, 0, 0, 10.9, 3850, '2023-09-22 12:53:08', '2023-09-22 12:53:08'),
(538, 515, 17, NULL, NULL, NULL, 3, 3, 800, 0, 0, 0, 660, 2400, '2023-09-22 12:54:38', '2023-09-22 12:54:38'),
(539, 516, 17, NULL, NULL, NULL, 2, 3, 700, 0, 0, 0, 660, 1400, '2023-09-22 12:55:21', '2023-09-22 12:55:21'),
(540, 517, 5, NULL, NULL, NULL, 8, 1, 11.25, 0, 0, 0, 10.9, 90, '2023-09-22 13:07:30', '2023-09-22 13:07:30'),
(541, 518, 18, NULL, NULL, NULL, 60, 1, 12, 0, 0, 0, 11.5, 720, '2023-09-22 13:13:37', '2023-09-22 13:13:37'),
(542, 519, 17, NULL, NULL, NULL, 0.5, 3, 700, 0, 0, 0, 660, 350, '2023-09-23 04:31:50', '2023-09-23 04:31:50'),
(543, 520, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-23 05:06:49', '2023-09-23 05:06:49'),
(544, 520, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-23 05:06:49', '2023-09-23 05:06:49'),
(545, 520, 14, NULL, NULL, NULL, 1.69, 2, 300, 0, 0, 0, 0.275, 507, '2023-09-23 05:06:49', '2023-09-23 05:06:49'),
(546, 521, 17, NULL, NULL, NULL, 1, 3, 700, 0, 0, 0, 660, 700, '2023-09-23 05:48:11', '2023-09-23 05:48:11'),
(547, 522, 17, NULL, NULL, NULL, 0.5, 3, 700, 0, 0, 0, 660, 350, '2023-09-23 06:06:13', '2023-09-23 06:06:13'),
(548, 523, 15, NULL, NULL, NULL, 1.6, 3, 175, 0, 0, 0, 165, 280, '2023-09-23 06:37:08', '2023-09-23 06:37:08'),
(549, 523, 17, NULL, NULL, NULL, 0.5, 3, 700, 0, 0, 0, 660, 350, '2023-09-23 06:37:08', '2023-09-23 06:37:08'),
(550, 524, 15, NULL, NULL, NULL, 2.02, 3, 175, 0, 0, 0, 165, 353.5, '2023-09-23 06:39:14', '2023-09-23 06:39:14'),
(551, 525, 5, NULL, NULL, NULL, 10, 1, 11.25, 0, 0, 0, 10.9, 112.5, '2023-09-23 06:40:28', '2023-09-23 06:40:28'),
(552, 526, 15, NULL, NULL, NULL, 1.28, 3, 175, 0, 0, 0, 165, 224, '2023-09-23 07:02:58', '2023-09-23 07:02:58'),
(553, 527, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-23 07:06:36', '2023-09-23 07:06:36'),
(554, 528, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-23 07:06:57', '2023-09-23 07:06:57'),
(555, 529, 5, NULL, NULL, NULL, 300, 1, 11.25, 0, 0, 0, 10.9, 3375, '2023-09-23 07:29:57', '2023-09-23 07:29:57'),
(556, 530, 5, NULL, NULL, NULL, 120, 1, 11.25, 0, 0, 0, 10.9, 1350, '2023-09-23 07:32:01', '2023-09-23 07:32:01'),
(557, 531, 15, NULL, NULL, NULL, 26.8, 3, 175, 0, 0, 0, 165, 4690, '2023-09-23 07:41:53', '2023-09-23 07:41:53'),
(558, 532, 14, NULL, NULL, NULL, 31.2, 2, 300, 0, 0, 0, 0.275, 9360, '2023-09-23 07:43:07', '2023-09-23 07:43:07'),
(559, 533, 17, NULL, NULL, NULL, 2, 3, 800, 0, 0, 0, 660, 1600, '2023-09-23 07:44:56', '2023-09-23 07:44:56'),
(560, 534, 14, NULL, NULL, NULL, 0.92, 2, 300, 0, 0, 0, 0.275, 276, '2023-09-23 08:34:57', '2023-09-23 08:34:57'),
(561, 535, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-23 08:50:24', '2023-09-23 08:50:24'),
(562, 536, 15, NULL, NULL, NULL, 1.8, 3, 175, 0, 0, 0, 165, 315, '2023-09-23 08:53:13', '2023-09-23 08:53:13'),
(563, 537, 14, NULL, NULL, NULL, 2.8, 2, 300, 0, 0, 0, 0.275, 840, '2023-09-23 08:53:42', '2023-09-23 08:53:42'),
(564, 538, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-23 08:54:20', '2023-09-23 08:54:20'),
(565, 539, 5, NULL, NULL, NULL, 100, 1, 11.25, 0, 0, 0, 10.9, 1125, '2023-09-23 08:55:13', '2023-09-23 08:55:13'),
(566, 540, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-23 08:57:57', '2023-09-23 08:57:57'),
(567, 541, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-23 08:57:57', '2023-09-23 08:57:57'),
(568, 542, 5, NULL, NULL, NULL, 12, 1, 11.25, 0, 0, 0, 10.9, 135, '2023-09-23 09:11:16', '2023-09-23 09:11:16'),
(569, 543, 15, NULL, NULL, NULL, 1.7, 3, 175, 0, 0, 0, 165, 297.5, '2023-09-23 09:31:22', '2023-09-23 09:31:22'),
(570, 544, 5, NULL, NULL, NULL, 60, 1, 11.25, 0, 0, 0, 10.9, 675, '2023-09-23 09:36:06', '2023-09-23 09:36:06'),
(571, 545, 5, NULL, NULL, NULL, 6, 1, 11.25, 0, 0, 0, 10.9, 67.5, '2023-09-23 09:36:44', '2023-09-23 09:36:44'),
(572, 546, 5, NULL, NULL, NULL, 100, 1, 11.25, 0, 0, 0, 10.9, 1125, '2023-09-23 09:40:43', '2023-09-23 09:40:43'),
(573, 547, 5, NULL, NULL, NULL, 30, 1, 11, 0, 0, 0, 10.9, 330, '2023-09-23 09:47:29', '2023-09-23 09:47:29'),
(574, 547, 17, NULL, NULL, NULL, 5, 3, 700, 0, 0, 0, 660, 3500, '2023-09-23 09:47:29', '2023-09-23 09:47:29'),
(575, 548, 17, NULL, NULL, NULL, 0.5, 3, 700, 0, 0, 0, 660, 350, '2023-09-23 09:55:50', '2023-09-23 09:55:50'),
(576, 549, 17, NULL, NULL, NULL, 0.25, 3, 700, 0, 0, 0, 660, 175, '2023-09-23 09:58:43', '2023-09-23 09:58:43'),
(577, 550, 5, NULL, NULL, NULL, 60, 1, 11.25, 0, 0, 0, 10.9, 675, '2023-09-23 10:07:07', '2023-09-23 10:07:07'),
(578, 551, 15, NULL, NULL, NULL, 7.7, 3, 175, 0, 0, 0, 165, 1347.5, '2023-09-23 10:16:35', '2023-09-23 10:16:35'),
(579, 552, 5, NULL, NULL, NULL, 72, 1, 11.25, 0, 0, 0, 10.9, 810, '2023-09-23 10:19:49', '2023-09-23 10:19:49'),
(580, 553, 14, NULL, NULL, NULL, 3.6, 2, 300, 0, 0, 0, 0.275, 1080, '2023-09-23 10:44:54', '2023-09-23 10:44:54'),
(581, 554, 17, NULL, NULL, NULL, 0.78, 3, 700, 0, 0, 0, 660, 546, '2023-09-23 10:55:28', '2023-09-23 10:55:28'),
(582, 555, 15, NULL, NULL, NULL, 1.7, 3, 175, 0, 0, 0, 165, 297.5, '2023-09-23 11:01:44', '2023-09-23 11:01:44'),
(583, 555, 5, NULL, NULL, NULL, 30, 1, 11, 0, 0, 0, 10.9, 330, '2023-09-23 11:01:44', '2023-09-23 11:01:44'),
(584, 556, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-23 11:04:38', '2023-09-23 11:04:38'),
(585, 557, 5, NULL, NULL, NULL, 150, 1, 11, 0, 0, 0, 10.9, 1650, '2023-09-23 12:05:14', '2023-09-23 12:05:14'),
(586, 558, 14, NULL, NULL, NULL, 0.8, 2, 300, 0, 0, 0, 0.275, 240, '2023-09-23 13:11:00', '2023-09-23 13:11:00'),
(587, 559, 15, NULL, NULL, NULL, 3.6, 3, 165, 0, 0, 0, 165, 594, '2023-09-23 13:20:27', '2023-09-23 13:20:27'),
(588, 560, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-23 13:22:08', '2023-09-23 13:22:08'),
(589, 561, 17, NULL, NULL, NULL, 4, 3, 700, 0, 0, 0, 660, 2800, '2023-09-23 13:24:46', '2023-09-23 13:24:46'),
(590, 562, 14, NULL, NULL, NULL, 1, 2, 300, 0, 0, 0, 0.275, 300, '2023-09-23 13:31:03', '2023-09-23 13:31:03'),
(591, 562, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-23 13:31:03', '2023-09-23 13:31:03'),
(592, 562, 15, NULL, NULL, NULL, 1.78, 3, 170, 0, 0, 0, 165, 302.6, '2023-09-23 13:31:03', '2023-09-23 13:31:03'),
(593, 563, 15, NULL, NULL, NULL, 1.75, 3, 165, 0, 0, 0, 165, 288.75, '2023-09-23 13:37:40', '2023-09-23 13:37:40'),
(594, 564, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-23 13:38:05', '2023-09-23 13:38:05'),
(595, 565, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-23 13:52:07', '2023-09-23 13:52:07'),
(596, 566, 14, NULL, NULL, NULL, 0.97, 2, 300, 0, 0, 0, 0.275, 291, '2023-09-23 14:03:57', '2023-09-23 14:03:57'),
(597, 566, 12, NULL, NULL, NULL, 0.7, 3, 1300, 0, 0, 0, 1200, 910, '2023-09-23 14:03:57', '2023-09-23 14:03:57'),
(598, 567, 5, NULL, NULL, NULL, 100, 1, 11.25, 0, 0, 0, 10.9, 1125, '2023-09-24 04:09:17', '2023-09-24 04:09:17'),
(599, 568, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-24 04:10:14', '2023-09-24 04:10:14'),
(600, 569, 15, NULL, NULL, NULL, 1.88, 3, 175, 0, 0, 0, 165, 329, '2023-09-24 04:17:41', '2023-09-24 04:17:41'),
(601, 570, 15, NULL, NULL, NULL, 1.98, 3, 175, 0, 0, 0, 165, 346.5, '2023-09-24 04:42:21', '2023-09-24 04:42:21'),
(602, 571, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-24 05:09:57', '2023-09-24 05:09:57'),
(603, 572, 5, NULL, NULL, NULL, 300, 1, 11.25, 0, 0, 0, 10.9, 3375, '2023-09-24 05:18:34', '2023-09-24 05:18:34'),
(604, 573, 15, NULL, NULL, NULL, 1.8, 3, 175, 0, 0, 0, 165, 315, '2023-09-24 05:23:44', '2023-09-24 05:23:44'),
(605, 574, 16, NULL, NULL, NULL, 0.5, 3, 65, 0, 0, 0, 60, 32.5, '2023-09-24 05:34:22', '2023-09-24 05:34:22'),
(606, 574, 5, NULL, NULL, NULL, 4, 1, 11.25, 0, 0, 0, 10.9, 45, '2023-09-24 05:34:22', '2023-09-24 05:34:22'),
(607, 575, 5, NULL, NULL, NULL, 180, 1, 11.25, 0, 0, 0, 10.9, 2025, '2023-09-24 05:58:00', '2023-09-24 05:58:00'),
(608, 576, 15, NULL, NULL, NULL, 6.9, 3, 175, 0, 0, 0, 165, 1207.5, '2023-09-24 06:31:52', '2023-09-24 06:31:52'),
(609, 577, 15, NULL, NULL, NULL, 2, 3, 165, 0, 0, 0, 165, 330, '2023-09-24 06:47:08', '2023-09-24 06:47:08'),
(610, 578, 5, NULL, NULL, NULL, 20, 1, 7.7, 0, 0, 0, 10.9, 154, '2023-09-24 06:49:36', '2023-09-24 06:49:36'),
(611, 579, 15, NULL, NULL, NULL, 1.84, 3, 175, 0, 0, 0, 165, 322, '2023-09-24 07:08:07', '2023-09-24 07:08:07'),
(612, 580, 15, NULL, NULL, NULL, 1.89, 3, 175, 0, 0, 0, 165, 330.75, '2023-09-24 10:02:23', '2023-09-24 10:02:23'),
(613, 581, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-24 10:03:13', '2023-09-24 10:03:13'),
(614, 582, 17, NULL, NULL, NULL, 1, 3, 700, 0, 0, 0, 660, 700, '2023-09-24 10:03:37', '2023-09-24 10:03:37'),
(615, 583, 17, NULL, NULL, NULL, 2, 3, 700, 0, 0, 0, 660, 1400, '2023-09-24 10:04:02', '2023-09-24 10:04:02'),
(616, 584, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-24 10:06:59', '2023-09-24 10:06:59'),
(617, 585, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-24 10:07:28', '2023-09-24 10:07:28'),
(618, 586, 5, NULL, NULL, NULL, 100, 1, 11.25, 0, 0, 0, 10.9, 1125, '2023-09-24 10:07:59', '2023-09-24 10:07:59'),
(619, 587, 5, NULL, NULL, NULL, 200, 1, 11, 0, 0, 0, 10.9, 2200, '2023-09-24 10:35:11', '2023-09-24 10:35:11'),
(620, 588, 5, NULL, NULL, NULL, 60, 1, 11, 0, 0, 0, 10.9, 660, '2023-09-24 12:19:50', '2023-09-24 12:19:50'),
(621, 588, 15, NULL, NULL, NULL, 1.75, 3, 165, 0, 0, 0, 165, 288.75, '2023-09-24 12:19:50', '2023-09-24 12:19:50'),
(622, 588, 17, NULL, NULL, NULL, 7, 3, 700, 0, 0, 0, 660, 4900, '2023-09-24 12:19:50', '2023-09-24 12:19:50'),
(623, 589, 15, NULL, NULL, NULL, 1.8, 3, 175, 0, 0, 0, 165, 315, '2023-09-24 12:21:00', '2023-09-24 12:21:00'),
(624, 590, 15, NULL, NULL, NULL, 1.76, 3, 175, 0, 0, 0, 165, 308, '2023-09-24 12:22:11', '2023-09-24 12:22:11'),
(625, 591, 5, NULL, NULL, NULL, 16, 1, 11.25, 0, 0, 0, 10.9, 180, '2023-09-24 12:23:54', '2023-09-24 12:23:54'),
(626, 592, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-24 12:25:42', '2023-09-24 12:25:42'),
(627, 593, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-24 12:26:10', '2023-09-24 12:26:10'),
(628, 594, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-24 12:26:32', '2023-09-24 12:26:32'),
(629, 595, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-24 12:26:54', '2023-09-24 12:26:54'),
(630, 596, 5, NULL, NULL, NULL, 100, 1, 11.25, 0, 0, 0, 10.9, 1125, '2023-09-24 12:27:20', '2023-09-24 12:27:20'),
(631, 597, 5, NULL, NULL, NULL, 9, 1, 11.25, 0, 0, 0, 10.9, 101.25, '2023-09-24 12:27:44', '2023-09-24 12:27:44'),
(632, 598, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-24 12:28:06', '2023-09-24 12:28:06'),
(633, 599, 16, NULL, NULL, NULL, 5, 3, 65, 0, 0, 0, 60, 325, '2023-09-24 12:28:56', '2023-09-24 12:28:56'),
(634, 600, 16, NULL, NULL, NULL, 4, 3, 65, 0, 0, 0, 60, 260, '2023-09-24 12:29:25', '2023-09-24 12:29:25'),
(635, 601, 17, NULL, NULL, NULL, 0.65, 3, 700, 0, 0, 0, 660, 455, '2023-09-24 12:30:06', '2023-09-24 12:30:06'),
(636, 602, 5, NULL, NULL, NULL, 15, 1, 11.25, 0, 0, 0, 10.9, 168.75, '2023-09-24 12:34:40', '2023-09-24 12:34:40'),
(637, 603, 5, NULL, NULL, NULL, 100, 1, 11.25, 0, 0, 0, 10.9, 1125, '2023-09-24 12:35:59', '2023-09-24 12:35:59'),
(638, 604, 5, NULL, NULL, NULL, 4, 1, 11.25, 0, 0, 0, 10.9, 45, '2023-09-24 12:43:57', '2023-09-24 12:43:57'),
(639, 605, 5, NULL, NULL, NULL, 90, 1, 11, 0, 0, 0, 10.9, 990, '2023-09-24 13:42:10', '2023-09-24 13:42:10'),
(640, 606, 5, NULL, NULL, NULL, 5100, 1, 10.4, 0, 0, 0, 10.9, 53040, '2023-09-24 13:58:31', '2023-09-24 13:58:31'),
(641, 607, 5, NULL, NULL, NULL, 1020, 1, 9.4, 0, 0, 0, 10.9, 9588, '2023-09-24 13:59:42', '2023-09-24 13:59:42'),
(642, 608, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-24 14:00:34', '2023-09-24 14:00:34'),
(643, 609, 15, NULL, NULL, NULL, 1.9, 3, 175, 0, 0, 0, 165, 332.5, '2023-09-24 14:01:13', '2023-09-24 14:01:13'),
(644, 610, 5, NULL, NULL, NULL, 4, 1, 11.25, 0, 0, 0, 10.9, 45, '2023-09-24 14:11:34', '2023-09-24 14:11:34'),
(645, 611, 5, NULL, NULL, NULL, 12, 1, 11.25, 0, 0, 0, 10.9, 135, '2023-09-24 14:31:20', '2023-09-24 14:31:20'),
(646, 612, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-24 14:37:14', '2023-09-24 14:37:14'),
(647, 613, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-24 14:37:30', '2023-09-24 14:37:30'),
(648, 614, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-24 14:37:40', '2023-09-24 14:37:40'),
(649, 615, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-24 14:39:51', '2023-09-24 14:39:51'),
(650, 616, 5, NULL, NULL, NULL, 8, 1, 11.25, 0, 0, 0, 10.9, 90, '2023-09-24 15:09:04', '2023-09-24 15:09:04'),
(651, 616, 13, NULL, NULL, NULL, 0.84, 3, 650, 0, 0, 0, 540, 546, '2023-09-24 15:09:04', '2023-09-24 15:09:04'),
(652, 616, 16, NULL, NULL, NULL, 1, 3, 60, 0, 0, 0, 60, 60, '2023-09-24 15:09:04', '2023-09-24 15:09:04'),
(653, 617, 5, NULL, NULL, NULL, 12, 1, 11.25, 0, 0, 0, 10.9, 135, '2023-09-24 15:09:53', '2023-09-24 15:09:53'),
(654, 618, 15, NULL, NULL, NULL, 1.2, 3, 175, 0, 0, 0, 165, 210, '2023-09-24 15:15:05', '2023-09-24 15:15:05'),
(655, 619, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-24 15:15:30', '2023-09-24 15:15:30'),
(656, 620, 15, NULL, NULL, NULL, 1.2, 3, 175, 0, 0, 0, 165, 210, '2023-09-24 15:19:22', '2023-09-24 15:19:22'),
(657, 621, 15, NULL, NULL, NULL, 1.8, 3, 175, 0, 0, 0, 165, 315, '2023-09-24 15:22:42', '2023-09-24 15:22:42'),
(658, 622, 5, NULL, NULL, NULL, 300, 1, 11, 0, 0, 0, 10.9, 3300, '2023-09-24 15:25:11', '2023-09-24 15:25:11'),
(659, 623, 5, NULL, NULL, NULL, 300, 1, 10.9, 0, 0, 0, 10.9, 3270, '2023-09-24 15:26:04', '2023-09-24 15:26:04'),
(660, 624, 5, NULL, NULL, NULL, 115, 1, 11.1, 0, 0, 0, 10.9, 1276.5, '2023-09-24 15:26:35', '2023-09-24 15:26:35'),
(661, 625, 14, NULL, NULL, NULL, 1.9, 2, 300, 0, 0, 0, 0.275, 570, '2023-09-24 15:29:03', '2023-09-24 15:29:03'),
(662, 625, 15, NULL, NULL, NULL, 1.7, 3, 175, 0, 0, 0, 165, 297.5, '2023-09-24 15:29:03', '2023-09-24 15:29:03'),
(663, 626, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-24 15:29:35', '2023-09-24 15:29:35'),
(664, 627, 5, NULL, NULL, NULL, 120, 1, 11.25, 0, 0, 0, 10.9, 1350, '2023-09-24 15:36:04', '2023-09-24 15:36:04'),
(665, 628, 5, NULL, NULL, NULL, 8, 1, 11.25, 0, 0, 0, 10.9, 90, '2023-09-24 15:36:43', '2023-09-24 15:36:43'),
(666, 629, 15, NULL, NULL, NULL, 1.86, 3, 175, 0, 0, 0, 165, 325.5, '2023-09-24 15:38:53', '2023-09-24 15:38:53'),
(667, 630, 16, NULL, NULL, NULL, 18.5, 3, 65, 0, 0, 0, 60, 1202.5, '2023-09-24 16:12:41', '2023-09-24 16:12:41'),
(668, 631, 17, NULL, NULL, NULL, 1, 3, 700, 0, 0, 0, 660, 700, '2023-09-24 16:17:14', '2023-09-24 16:17:14'),
(669, 632, 15, NULL, NULL, NULL, 1.8, 3, 175, 0, 0, 0, 165, 315, '2023-09-24 16:17:40', '2023-09-24 16:17:40'),
(670, 633, 15, NULL, NULL, NULL, 2.2, 3, 175, 0, 0, 0, 165, 385, '2023-09-25 10:26:24', '2023-09-25 10:26:24'),
(671, 634, 15, NULL, NULL, NULL, 2.1, 3, 175, 0, 0, 0, 165, 367.5, '2023-09-25 10:27:49', '2023-09-25 10:27:49'),
(672, 635, 15, NULL, NULL, NULL, 1.8, 3, 175, 0, 0, 0, 165, 315, '2023-09-25 10:37:04', '2023-09-25 10:37:04'),
(673, 636, 15, NULL, NULL, NULL, 3.3, 3, 175, 0, 0, 0, 165, 577.5, '2023-09-25 10:38:26', '2023-09-25 10:38:26'),
(674, 637, 15, NULL, NULL, NULL, 2.3, 3, 175, 0, 0, 0, 165, 402.5, '2023-09-25 10:47:48', '2023-09-25 10:47:48'),
(675, 638, 15, NULL, NULL, NULL, 1.7, 3, 175, 0, 0, 0, 165, 297.5, '2023-09-25 10:55:02', '2023-09-25 10:55:02'),
(676, 639, 15, NULL, NULL, NULL, 1.97, 3, 175, 0, 0, 0, 165, 344.75, '2023-09-25 10:55:53', '2023-09-25 10:55:53'),
(677, 640, 15, NULL, NULL, NULL, 2.1, 3, 175, 0, 0, 0, 165, 367.5, '2023-09-25 10:57:16', '2023-09-25 10:57:16'),
(678, 641, 15, NULL, NULL, NULL, 2.1, 3, 175, 0, 0, 0, 165, 367.5, '2023-09-25 10:58:31', '2023-09-25 10:58:31'),
(679, 642, 17, NULL, NULL, NULL, 5, 3, 675, 0, 0, 0, 660, 3375, '2023-09-25 11:35:36', '2023-09-25 11:35:36'),
(680, 642, 5, NULL, NULL, NULL, 60, 1, 11.25, 0, 0, 0, 10.9, 675, '2023-09-25 11:35:36', '2023-09-25 11:35:36'),
(681, 642, 15, NULL, NULL, NULL, 2.2, 3, 165, 0, 0, 0, 165, 363, '2023-09-25 11:35:36', '2023-09-25 11:35:36'),
(682, 643, 15, NULL, NULL, NULL, 1.45, 3, 175, 0, 0, 0, 165, 253.75, '2023-09-25 11:36:45', '2023-09-25 11:36:45'),
(683, 644, 5, NULL, NULL, NULL, 650, 1, 11, 0, 0, 0, 10.9, 7150, '2023-09-25 11:48:24', '2023-09-25 11:48:24'),
(684, 645, 15, NULL, NULL, NULL, 7.7, 3, 175, 0, 0, 0, 165, 1347.5, '2023-09-25 11:50:37', '2023-09-25 11:50:37'),
(685, 646, 5, NULL, NULL, NULL, 30, 1, 9, 0, 0, 0, 10.9, 270, '2023-09-25 11:55:48', '2023-09-25 11:55:48'),
(686, 647, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-25 11:58:41', '2023-09-25 11:58:41'),
(687, 648, 5, NULL, NULL, NULL, 4, 1, 11.25, 0, 0, 0, 10.9, 45, '2023-09-25 11:59:37', '2023-09-25 11:59:37'),
(688, 649, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-25 12:00:15', '2023-09-25 12:00:15'),
(689, 650, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-25 12:00:39', '2023-09-25 12:00:39'),
(690, 651, 5, NULL, NULL, NULL, 7, 1, 11.25, 0, 0, 0, 10.9, 78.75, '2023-09-25 12:03:20', '2023-09-25 12:03:20'),
(691, 652, 5, NULL, NULL, NULL, 200, 1, 11.25, 0, 0, 0, 10.9, 2250, '2023-09-25 12:06:26', '2023-09-25 12:06:26'),
(692, 653, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-25 12:06:54', '2023-09-25 12:06:54'),
(693, 654, 5, NULL, NULL, NULL, 4, 1, 11.25, 0, 0, 0, 10.9, 45, '2023-09-25 12:09:03', '2023-09-25 12:09:03'),
(694, 655, 5, NULL, NULL, NULL, 150, 1, 11.25, 0, 0, 0, 10.9, 1687.5, '2023-09-25 12:10:47', '2023-09-25 12:10:47'),
(695, 656, 5, NULL, NULL, NULL, 5, 1, 11.25, 0, 0, 0, 10.9, 56.25, '2023-09-25 12:12:18', '2023-09-25 12:12:18'),
(696, 657, 5, NULL, NULL, NULL, 15, 1, 11.25, 0, 0, 0, 10.9, 168.75, '2023-09-25 12:18:15', '2023-09-25 12:18:15'),
(697, 658, 14, NULL, NULL, NULL, 0.9, 2, 300, 0, 0, 0, 0.275, 270, '2023-09-25 12:19:03', '2023-09-25 12:19:03'),
(698, 659, 14, NULL, NULL, NULL, 1.75, 2, 300, 0, 0, 0, 0.275, 525, '2023-09-25 12:19:27', '2023-09-25 12:19:27'),
(699, 660, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-25 12:20:03', '2023-09-25 12:20:03'),
(700, 661, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-25 12:20:17', '2023-09-25 12:20:17'),
(701, 662, 13, NULL, NULL, NULL, 0.75, 3, 650, 0, 0, 0, 540, 487.5, '2023-09-25 12:21:08', '2023-09-25 12:21:08'),
(702, 663, 15, NULL, NULL, NULL, 3.4, 3, 175, 0, 0, 0, 165, 595, '2023-09-25 12:35:03', '2023-09-25 12:35:03'),
(703, 664, 15, NULL, NULL, NULL, 1.7, 3, 175, 0, 0, 0, 165, 297.5, '2023-09-25 12:52:00', '2023-09-25 12:52:00'),
(704, 665, 5, NULL, NULL, NULL, 8, 1, 11.25, 0, 0, 0, 10.9, 90, '2023-09-25 12:52:21', '2023-09-25 12:52:21'),
(705, 666, 5, NULL, NULL, NULL, 8, 1, 11.25, 0, 0, 0, 10.9, 90, '2023-09-25 12:52:39', '2023-09-25 12:52:39'),
(706, 667, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-25 12:53:11', '2023-09-25 12:53:11'),
(707, 668, 5, NULL, NULL, NULL, 60, 1, 11.25, 0, 0, 0, 10.9, 675, '2023-09-25 12:54:33', '2023-09-25 12:54:33'),
(708, 669, 5, NULL, NULL, NULL, 300, 1, 11.25, 0, 0, 0, 10.9, 3375, '2023-09-25 12:55:50', '2023-09-25 12:55:50'),
(709, 670, 5, NULL, NULL, NULL, 300, 1, 11.25, 0, 0, 0, 10.9, 3375, '2023-09-25 12:56:53', '2023-09-25 12:56:53'),
(710, 671, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-25 13:13:03', '2023-09-25 13:13:03'),
(711, 672, 5, NULL, NULL, NULL, 8, 1, 11.25, 0, 0, 0, 10.9, 90, '2023-09-25 13:19:30', '2023-09-25 13:19:30'),
(712, 673, 16, NULL, NULL, NULL, 0.5, 3, 65, 0, 0, 0, 60, 32.5, '2023-09-25 13:41:17', '2023-09-25 13:41:17'),
(713, 674, 14, NULL, NULL, NULL, 2.56, 2, 300, 0, 0, 0, 0.275, 768, '2023-09-25 14:20:07', '2023-09-25 14:20:07'),
(714, 675, 15, NULL, NULL, NULL, 5.3, 3, 175, 0, 0, 0, 165, 927.5, '2023-09-25 14:21:42', '2023-09-25 14:21:42'),
(715, 676, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-25 14:22:30', '2023-09-25 14:22:30'),
(716, 677, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-25 14:27:22', '2023-09-25 14:27:22'),
(717, 678, 16, NULL, NULL, NULL, 12, 3, 65, 0, 0, 0, 60, 780, '2023-09-25 14:42:17', '2023-09-25 14:42:17'),
(718, 679, 5, NULL, NULL, NULL, 40, 1, 11.25, 0, 0, 0, 10.9, 450, '2023-09-25 14:45:18', '2023-09-25 14:45:18'),
(719, 680, 15, NULL, NULL, NULL, 2.035, 3, 175, 0, 0, 0, 165, 356.13, '2023-09-25 15:11:10', '2023-09-25 15:11:10'),
(720, 681, 5, NULL, NULL, NULL, 60, 1, 11.25, 0, 0, 0, 10.9, 675, '2023-09-25 15:12:48', '2023-09-25 15:12:48'),
(721, 682, 15, NULL, NULL, NULL, 1.8, 3, 175, 0, 0, 0, 165, 315, '2023-09-25 15:15:56', '2023-09-25 15:15:56'),
(722, 683, 5, NULL, NULL, NULL, 12, 1, 11.25, 0, 0, 0, 10.9, 135, '2023-09-25 15:21:51', '2023-09-25 15:21:51'),
(723, 684, 5, NULL, NULL, NULL, 12, 1, 11.25, 0, 0, 0, 10.9, 135, '2023-09-25 15:31:46', '2023-09-25 15:31:46'),
(724, 685, 15, NULL, NULL, NULL, 3.5, 3, 175, 0, 0, 0, 165, 612.5, '2023-09-26 06:05:15', '2023-09-26 06:05:15'),
(725, 686, 15, NULL, NULL, NULL, 5.9, 3, 175, 0, 0, 0, 165, 1032.5, '2023-09-26 06:07:41', '2023-09-26 06:07:41'),
(726, 687, 16, NULL, NULL, NULL, 3, 3, 65, 0, 0, 0, 60, 195, '2023-09-26 06:11:52', '2023-09-26 06:11:52'),
(727, 688, 15, NULL, NULL, NULL, 1.95, 3, 175, 0, 0, 0, 165, 341.25, '2023-09-26 06:17:49', '2023-09-26 06:17:49'),
(728, 689, 5, NULL, NULL, NULL, 4, 1, 11.25, 0, 0, 0, 10.9, 45, '2023-09-26 06:19:27', '2023-09-26 06:19:27'),
(729, 690, 5, NULL, NULL, NULL, 100, 1, 11.25, 0, 0, 0, 10.9, 1125, '2023-09-26 06:20:15', '2023-09-26 06:20:15'),
(730, 691, 15, NULL, NULL, NULL, 2.34, 3, 175, 0, 0, 0, 165, 409.5, '2023-09-26 06:41:43', '2023-09-26 06:41:43'),
(731, 692, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-26 06:42:39', '2023-09-26 06:42:39'),
(732, 693, 5, NULL, NULL, NULL, 8, 1, 11.25, 0, 0, 0, 10.9, 90, '2023-09-26 06:44:11', '2023-09-26 06:44:11'),
(733, 694, 5, NULL, NULL, NULL, 12, 1, 11.25, 0, 0, 0, 10.9, 135, '2023-09-26 06:44:55', '2023-09-26 06:44:55'),
(734, 695, 5, NULL, NULL, NULL, 230, 1, 11.25, 0, 0, 0, 10.9, 2587.5, '2023-09-26 06:46:32', '2023-09-26 06:46:32'),
(735, 696, 5, NULL, NULL, NULL, 12, 1, 11.25, 0, 0, 0, 10.9, 135, '2023-09-26 06:46:51', '2023-09-26 06:46:51'),
(736, 697, 14, NULL, NULL, NULL, 0.9, 2, 300, 0, 0, 0, 0.275, 270, '2023-09-26 06:47:19', '2023-09-26 06:47:19'),
(737, 698, 5, NULL, NULL, NULL, 300, 1, 10.9, 0, 0, 0, 10.9, 3270, '2023-09-26 07:14:20', '2023-09-26 07:14:20'),
(738, 699, 15, NULL, NULL, NULL, 2.043, 3, 175, 0, 0, 0, 165, 357.53, '2023-09-26 08:08:43', '2023-09-26 08:08:43'),
(739, 700, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-26 08:25:05', '2023-09-26 08:25:05'),
(740, 701, 13, NULL, NULL, NULL, 0.89, 3, 650, 0, 0, 0, 540, 578.5, '2023-09-26 08:26:33', '2023-09-26 08:26:33'),
(741, 702, 5, NULL, NULL, NULL, 8, 1, 11.25, 0, 0, 0, 10.9, 90, '2023-09-26 08:54:55', '2023-09-26 08:54:55'),
(742, 703, 15, NULL, NULL, NULL, 1.875, 3, 175, 0, 0, 0, 165, 328.13, '2023-09-26 09:53:28', '2023-09-26 09:53:28'),
(743, 704, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-26 09:53:57', '2023-09-26 09:53:57'),
(744, 705, 16, NULL, NULL, NULL, 15, 3, 65, 0, 0, 0, 60, 975, '2023-09-26 10:08:40', '2023-09-26 10:08:40'),
(745, 706, 15, NULL, NULL, NULL, 1.7, 3, 175, 0, 0, 0, 165, 297.5, '2023-09-26 10:09:36', '2023-09-26 10:09:36'),
(746, 707, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-26 10:12:45', '2023-09-26 10:12:45'),
(747, 708, 5, NULL, NULL, NULL, 8, 1, 11.25, 0, 0, 0, 10.9, 90, '2023-09-26 11:05:30', '2023-09-26 11:05:30'),
(748, 709, 15, NULL, NULL, NULL, 1.7, 3, 175, 0, 0, 0, 165, 297.5, '2023-09-26 11:21:48', '2023-09-26 11:21:48'),
(749, 710, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-26 11:22:19', '2023-09-26 11:22:19'),
(750, 711, 5, NULL, NULL, NULL, 100, 1, 11.25, 0, 0, 0, 10.9, 1125, '2023-09-26 11:23:28', '2023-09-26 11:23:28'),
(751, 712, 16, NULL, NULL, NULL, 3, 3, 65, 0, 0, 0, 60, 195, '2023-09-26 12:07:51', '2023-09-26 12:07:51'),
(752, 713, 15, NULL, NULL, NULL, 3.37, 3, 175, 0, 0, 0, 165, 589.75, '2023-09-26 12:08:33', '2023-09-26 12:08:33'),
(753, 714, 15, NULL, NULL, NULL, 1.9, 3, 175, 0, 0, 0, 165, 332.5, '2023-09-26 12:09:27', '2023-09-26 12:09:27'),
(754, 715, 15, NULL, NULL, NULL, 1.8, 3, 175, 0, 0, 0, 165, 315, '2023-09-26 12:11:15', '2023-09-26 12:11:15'),
(755, 716, 5, NULL, NULL, NULL, 8, 1, 11.25, 0, 0, 0, 10.9, 90, '2023-09-26 12:11:39', '2023-09-26 12:11:39'),
(756, 717, 5, NULL, NULL, NULL, 4, 1, 11.25, 0, 0, 0, 10.9, 45, '2023-09-26 12:11:58', '2023-09-26 12:11:58'),
(757, 718, 5, NULL, NULL, NULL, 10, 1, 11.25, 0, 0, 0, 10.9, 112.5, '2023-09-26 12:36:24', '2023-09-26 12:36:24'),
(758, 719, 5, NULL, NULL, NULL, 20, 1, 11.25, 0, 0, 0, 10.9, 225, '2023-09-26 12:36:48', '2023-09-26 12:36:48'),
(759, 720, 15, NULL, NULL, NULL, 3.9, 3, 175, 0, 0, 0, 165, 682.5, '2023-09-26 12:37:57', '2023-09-26 12:37:57'),
(760, 721, 14, NULL, NULL, NULL, 1.4, 2, 300, 0, 0, 0, 0.275, 420, '2023-09-26 12:38:23', '2023-09-26 12:38:23'),
(761, 722, 5, NULL, NULL, NULL, 12, 1, 11.25, 0, 0, 0, 10.9, 135, '2023-09-26 12:44:54', '2023-09-26 12:44:54'),
(762, 723, 5, NULL, NULL, NULL, 8, 1, 11.25, 0, 0, 0, 10.9, 90, '2023-09-26 12:48:18', '2023-09-26 12:48:18'),
(763, 724, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-26 12:52:09', '2023-09-26 12:52:09'),
(764, 725, 5, NULL, NULL, NULL, 8, 1, 11.25, 0, 0, 0, 10.9, 90, '2023-09-26 12:59:58', '2023-09-26 12:59:58'),
(765, 726, 18, NULL, NULL, NULL, 30, 1, 12, 0, 0, 0, 11.5, 360, '2023-09-26 13:22:55', '2023-09-26 13:22:55'),
(766, 726, 14, NULL, NULL, NULL, 1.6, 2, 300, 0, 0, 0, 0.275, 480, '2023-09-26 13:22:55', '2023-09-26 13:22:55'),
(767, 726, 15, NULL, NULL, NULL, 1.81, 3, 175, 0, 0, 0, 165, 316.75, '2023-09-26 13:22:55', '2023-09-26 13:22:55'),
(768, 727, 15, NULL, NULL, NULL, 1.45, 3, 175, 0, 0, 0, 165, 253.75, '2023-09-26 14:29:09', '2023-09-26 14:29:09'),
(769, 728, 15, NULL, NULL, NULL, 2, 3, 175, 0, 0, 0, 165, 350, '2023-09-26 14:29:53', '2023-09-26 14:29:53'),
(771, 730, 15, NULL, NULL, NULL, 3.8, 3, 175, 0, 0, 0, 165, 665, '2023-09-26 14:31:45', '2023-09-26 14:31:45'),
(772, 731, 14, NULL, NULL, NULL, 3.55, 2, 300, 0, 0, 0, 0.275, 1065, '2023-09-26 14:32:29', '2023-09-26 14:32:29'),
(773, 732, 16, NULL, NULL, NULL, 3.5, 3, 65, 0, 0, 0, 60, 227.5, '2023-09-26 14:33:25', '2023-09-26 14:33:25'),
(774, 733, 16, NULL, NULL, NULL, 1.5, 3, 65, 0, 0, 0, 60, 97.5, '2023-09-26 14:33:48', '2023-09-26 14:33:48'),
(775, 734, 5, NULL, NULL, NULL, 60, 1, 11.25, 0, 0, 0, 10.9, 675, '2023-09-26 14:34:44', '2023-09-26 14:34:44'),
(776, 735, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-26 14:35:04', '2023-09-26 14:35:04'),
(777, 736, 5, NULL, NULL, NULL, 4, 1, 11.25, 0, 0, 0, 10.9, 45, '2023-09-26 14:35:20', '2023-09-26 14:35:20'),
(778, 737, 5, NULL, NULL, NULL, 50, 1, 11.25, 0, 0, 0, 10.9, 562.5, '2023-09-26 14:46:57', '2023-09-26 14:46:57'),
(779, 738, 5, NULL, NULL, NULL, 5370, 1, 11.25, 0, 0, 0, 10.9, 60412.5, '2023-09-26 14:51:25', '2023-09-26 14:51:25'),
(780, 739, 5, NULL, NULL, NULL, 300, 1, 11.25, 0, 0, 0, 10.9, 3375, '2023-09-26 15:01:35', '2023-09-26 15:01:35'),
(781, 740, 5, NULL, NULL, NULL, 400, 1, 11.25, 0, 0, 0, 10.9, 4500, '2023-09-26 15:02:56', '2023-09-26 15:02:56'),
(782, 741, 5, NULL, NULL, NULL, 200, 1, 11.25, 0, 0, 0, 10.9, 2250, '2023-09-26 15:04:18', '2023-09-26 15:04:18'),
(783, 742, 15, NULL, NULL, NULL, 3.1, 3, 175, 0, 0, 0, 165, 542.5, '2023-09-27 06:00:45', '2023-09-27 06:00:45'),
(784, 743, 15, NULL, NULL, NULL, 18.5, 3, 175, 0, 0, 0, 165, 3237.5, '2023-09-27 06:16:11', '2023-09-27 06:16:11'),
(785, 744, 15, NULL, NULL, NULL, 1.9, 3, 175, 0, 0, 0, 165, 332.5, '2023-09-27 06:17:10', '2023-09-27 06:17:10'),
(786, 745, 15, NULL, NULL, NULL, 2.9, 3, 175, 0, 0, 0, 165, 507.5, '2023-09-27 06:21:30', '2023-09-27 06:21:30'),
(787, 746, 15, NULL, NULL, NULL, 5.5, 3, 175, 0, 0, 0, 165, 962.5, '2023-09-27 06:29:25', '2023-09-27 06:29:25'),
(788, 747, 15, NULL, NULL, NULL, 1.8, 3, 175, 0, 0, 0, 165, 315, '2023-09-27 06:29:58', '2023-09-27 06:29:58'),
(789, 748, 15, NULL, NULL, NULL, 1.6, 3, 175, 0, 0, 0, 165, 280, '2023-09-27 06:30:22', '2023-09-27 06:30:22'),
(790, 749, 15, NULL, NULL, NULL, 1.7, 3, 175, 0, 0, 0, 165, 297.5, '2023-09-27 06:33:38', '2023-09-27 06:33:38'),
(791, 750, 15, NULL, NULL, NULL, 1.8, 3, 175, 0, 0, 0, 165, 315, '2023-09-27 06:35:01', '2023-09-27 06:35:01'),
(792, 751, 15, NULL, NULL, NULL, 1.6, 3, 175, 0, 0, 0, 165, 280, '2023-09-27 06:35:56', '2023-09-27 06:35:56'),
(793, 752, 5, NULL, NULL, NULL, 5, 1, 11.25, 0, 0, 0, 10.9, 56.25, '2023-09-27 06:42:38', '2023-09-27 06:42:38'),
(794, 753, 5, NULL, NULL, NULL, 2, 1, 11.25, 0, 0, 0, 10.9, 22.5, '2023-09-27 06:43:32', '2023-09-27 06:43:32'),
(795, 754, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-27 06:43:57', '2023-09-27 06:43:57'),
(796, 755, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-27 06:44:17', '2023-09-27 06:44:17'),
(797, 756, 5, NULL, NULL, NULL, 100, 1, 11.25, 0, 0, 0, 10.9, 1125, '2023-09-27 06:46:42', '2023-09-27 06:46:42'),
(798, 757, 5, NULL, NULL, NULL, 4, 1, 11.25, 0, 0, 0, 10.9, 45, '2023-09-27 07:00:21', '2023-09-27 07:00:21'),
(799, 758, 5, NULL, NULL, NULL, 60, 1, 11.25, 0, 0, 0, 10.9, 675, '2023-09-27 07:00:46', '2023-09-27 07:00:46'),
(800, 759, 5, NULL, NULL, NULL, 8, 1, 11.25, 0, 0, 0, 10.9, 90, '2023-09-27 07:01:10', '2023-09-27 07:01:10'),
(801, 760, 5, NULL, NULL, NULL, 100, 1, 11.25, 0, 0, 0, 10.9, 1125, '2023-09-27 07:03:10', '2023-09-27 07:03:10'),
(802, 761, 5, NULL, NULL, NULL, 60, 1, 11.25, 0, 0, 0, 10.9, 675, '2023-09-27 07:07:04', '2023-09-27 07:07:04'),
(803, 761, 17, NULL, NULL, NULL, 5, 3, 675, 0, 0, 0, 660, 3375, '2023-09-27 07:07:04', '2023-09-27 07:07:04'),
(804, 761, 15, NULL, NULL, NULL, 3.5, 3, 165, 0, 0, 0, 165, 577.5, '2023-09-27 07:07:04', '2023-09-27 07:07:04'),
(805, 762, 15, NULL, NULL, NULL, 0.8, 3, 175, 0, 0, 0, 165, 140, '2023-09-27 07:08:38', '2023-09-27 07:08:38'),
(806, 763, 14, NULL, NULL, NULL, 0.8, 2, 300, 0, 0, 0, 0.275, 240, '2023-09-27 07:09:29', '2023-09-27 07:09:29'),
(807, 764, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-27 07:09:47', '2023-09-27 07:09:47'),
(808, 765, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-27 07:10:04', '2023-09-27 07:10:04'),
(809, 766, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-27 07:10:20', '2023-09-27 07:10:20'),
(810, 767, 5, NULL, NULL, NULL, 300, 1, 11.25, 0, 0, 0, 10.9, 3375, '2023-09-27 07:11:22', '2023-09-27 07:11:22'),
(811, 768, 5, NULL, NULL, NULL, 300, 1, 11.25, 0, 0, 0, 10.9, 3375, '2023-09-27 07:12:36', '2023-09-27 07:12:36'),
(812, 769, 5, NULL, NULL, NULL, 1, 1, 11.25, 0, 0, 0, 10.9, 11.25, '2023-09-27 07:13:07', '2023-09-27 07:13:07'),
(813, 770, 14, NULL, NULL, NULL, 0.8, 2, 300, 0, 0, 0, 0.275, 240, '2023-09-27 07:29:31', '2023-09-27 07:29:31'),
(814, 771, 15, NULL, NULL, NULL, 1.8, 3, 175, 0, 0, 0, 165, 315, '2023-09-27 07:30:02', '2023-09-27 07:30:02'),
(815, 772, 5, NULL, NULL, NULL, 16, 1, 11.25, 0, 0, 0, 10.9, 180, '2023-09-27 07:44:17', '2023-09-27 07:44:17'),
(816, 773, 5, NULL, NULL, NULL, 180, 1, 11.25, 0, 0, 0, 10.9, 2025, '2023-09-27 08:18:51', '2023-09-27 08:18:51'),
(817, 774, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-27 08:19:13', '2023-09-27 08:19:13'),
(818, 775, 14, NULL, NULL, NULL, 2.34, 2, 300, 0, 0, 0, 0.275, 702, '2023-09-27 08:20:01', '2023-09-27 08:20:01'),
(819, 776, 14, NULL, NULL, NULL, 0.8, 2, 300, 0, 0, 0, 0.275, 240, '2023-09-27 08:41:04', '2023-09-27 08:41:04'),
(820, 777, 15, NULL, NULL, NULL, 1.4, 3, 175, 0, 0, 0, 165, 245, '2023-09-27 08:41:38', '2023-09-27 08:41:38'),
(821, 778, 15, NULL, NULL, NULL, 0.258, 3, 175, 0, 0, 0, 165, 45.15, '2023-09-27 11:24:12', '2023-09-27 11:24:12'),
(822, 779, 15, NULL, NULL, NULL, 2.15, 3, 175, 0, 0, 0, 165, 376.25, '2023-09-27 11:34:58', '2023-09-27 11:34:58'),
(823, 780, 15, NULL, NULL, NULL, 1.7, 3, 175, 0, 0, 0, 165, 297.5, '2023-09-27 11:54:34', '2023-09-27 11:54:34'),
(824, 781, 14, NULL, NULL, NULL, 1.5, 2, 300, 0, 0, 0, 0.275, 450, '2023-09-27 11:56:11', '2023-09-27 11:56:11'),
(825, 781, 15, NULL, NULL, NULL, 7.66, 3, 170, 0, 0, 0, 165, 1302.2, '2023-09-27 11:56:11', '2023-09-27 11:56:11'),
(826, 782, 15, NULL, NULL, NULL, 1.8, 3, 175, 0, 0, 0, 165, 315, '2023-09-27 11:58:09', '2023-09-27 11:58:09'),
(827, 783, 5, NULL, NULL, NULL, 4, 1, 11.25, 0, 0, 0, 10.9, 45, '2023-09-27 11:58:38', '2023-09-27 11:58:38'),
(828, 784, 5, NULL, NULL, NULL, 6, 1, 11.25, 0, 0, 0, 10.9, 67.5, '2023-09-27 11:59:30', '2023-09-27 11:59:30'),
(829, 785, 5, NULL, NULL, NULL, 100, 1, 11.25, 0, 0, 0, 10.9, 1125, '2023-09-27 12:00:06', '2023-09-27 12:00:06'),
(830, 786, 5, NULL, NULL, NULL, 60, 1, 11.25, 0, 0, 0, 10.9, 675, '2023-09-27 12:01:39', '2023-09-27 12:01:39'),
(831, 787, 16, NULL, NULL, NULL, 2, 3, 65, 0, 0, 0, 60, 130, '2023-09-27 12:02:02', '2023-09-27 12:02:02'),
(832, 788, 13, NULL, NULL, NULL, 0.82, 3, 650, 0, 0, 0, 540, 533, '2023-09-27 12:03:23', '2023-09-27 12:03:23'),
(833, 789, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-27 12:23:37', '2023-09-27 12:23:37'),
(834, 790, 15, NULL, NULL, NULL, 3.3, 3, 175, 0, 0, 0, 165, 577.5, '2023-09-27 12:24:37', '2023-09-27 12:24:37'),
(835, 791, 16, NULL, NULL, NULL, 14, 3, 65, 0, 0, 0, 60, 910, '2023-09-27 12:26:17', '2023-09-27 12:26:17'),
(836, 792, 5, NULL, NULL, NULL, 4, 1, 11.25, 0, 0, 0, 10.9, 45, '2023-09-27 12:29:19', '2023-09-27 12:29:19'),
(837, 793, 10, NULL, NULL, NULL, 0.84, 3, 480, 0, 0, 0, 450, 403.2, '2023-09-27 12:49:24', '2023-09-27 12:49:24'),
(838, 794, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-27 13:18:55', '2023-09-27 13:18:55'),
(839, 795, 16, NULL, NULL, NULL, 1, 3, 65, 0, 0, 0, 60, 65, '2023-09-27 13:40:44', '2023-09-27 13:40:44'),
(840, 796, 15, NULL, NULL, NULL, 1.73, 3, 175, 0, 0, 0, 165, 302.75, '2023-09-27 14:25:57', '2023-09-27 14:25:57'),
(841, 797, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-27 14:27:53', '2023-09-27 14:27:53'),
(842, 798, 5, NULL, NULL, NULL, 10, 1, 11.25, 0, 0, 0, 10.9, 112.5, '2023-09-27 14:34:56', '2023-09-27 14:34:56'),
(843, 799, 5, NULL, NULL, NULL, 1200, 1, 10.4, 0, 0, 0, 10.9, 12480, '2023-09-27 14:38:54', '2023-09-27 14:38:54'),
(844, 800, 5, NULL, NULL, NULL, 30, 1, 11.25, 0, 0, 0, 10.9, 337.5, '2023-09-27 14:40:43', '2023-09-27 14:40:43'),
(845, 801, 5, NULL, NULL, NULL, 8, 1, 11.25, 0, 0, 0, 10.9, 90, '2023-09-27 14:48:34', '2023-09-27 14:48:34'),
(846, 802, 5, NULL, NULL, NULL, 2, 1, 11.25, 0, 0, 0, 10.9, 22.5, '2023-09-27 14:48:50', '2023-09-27 14:48:50');

-- --------------------------------------------------------

--
-- Table structure for table `product_transfer`
--

CREATE TABLE `product_transfer` (
  `id` int(10) UNSIGNED NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `item_code` varchar(191) NOT NULL,
  `additional_cost` double DEFAULT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_warehouse`
--

CREATE TABLE `product_warehouse` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` varchar(191) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_warehouse`
--

INSERT INTO `product_warehouse` (`id`, `product_id`, `product_batch_id`, `variant_id`, `imei_number`, `warehouse_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(1, '1', NULL, NULL, NULL, 1, 0, NULL, '2023-09-08 12:43:41', '2023-09-11 08:05:32'),
(2, '4', NULL, NULL, NULL, 1, 0, NULL, '2023-09-09 09:10:04', '2023-09-11 08:05:32'),
(3, '5', NULL, NULL, NULL, 1, 6265, NULL, '2023-09-11 11:10:28', '2023-09-27 14:48:50'),
(4, '9', NULL, NULL, NULL, 1, -14985, NULL, '2023-09-11 11:34:21', '2023-09-11 11:45:02'),
(5, '8', NULL, NULL, NULL, 1, -9990, NULL, '2023-09-11 11:34:21', '2023-09-11 11:44:11'),
(6, '14', NULL, NULL, NULL, 1, 84146, NULL, '2023-09-11 11:47:12', '2023-09-27 11:56:11'),
(7, '10', NULL, NULL, NULL, 1, 11.455, NULL, '2023-09-11 14:09:59', '2023-09-27 14:27:26'),
(8, '15', NULL, NULL, NULL, 1, 31.226, NULL, '2023-09-11 15:58:19', '2023-09-27 14:25:57'),
(9, '12', NULL, NULL, NULL, 1, 1.749, NULL, '2023-09-11 16:05:04', '2023-09-23 14:03:57'),
(10, '11', NULL, NULL, NULL, 1, 1, NULL, '2023-09-11 16:05:04', '2023-09-11 16:05:04'),
(11, '7', NULL, NULL, NULL, 1, 20000, NULL, '2023-09-12 04:53:40', '2023-09-12 04:53:40'),
(12, '6', NULL, NULL, NULL, 1, 225, NULL, '2023-09-12 13:32:51', '2023-09-12 13:32:51'),
(13, '16', NULL, NULL, NULL, 1, 6.5, NULL, '2023-09-12 13:39:42', '2023-09-27 13:40:44'),
(14, '17', NULL, NULL, NULL, 1, 30.43, NULL, '2023-09-12 13:43:13', '2023-09-27 07:07:04'),
(15, '13', NULL, NULL, NULL, 1, 4.401999999999, NULL, '2023-09-13 12:14:36', '2023-09-27 12:03:23'),
(16, '18', NULL, NULL, NULL, 1, 1864, NULL, '2023-09-18 14:59:04', '2023-09-26 13:22:55'),
(17, '19', NULL, NULL, NULL, 1, 46, NULL, '2023-09-18 15:14:41', '2023-09-22 11:02:06');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `reference_no`, `user_id`, `warehouse_id`, `supplier_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_cost`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `grand_total`, `paid_amount`, `status`, `payment_status`, `document`, `note`, `created_at`, `updated_at`) VALUES
(15, 'pr-20230911-095819', 45, 1, 2, 3, 3619, 0, 0, 53872.5, 0, 0, NULL, NULL, 53872.5, 0, 1, 1, NULL, NULL, '2023-09-10 18:00:00', '2023-09-11 15:58:19'),
(16, 'pr-20230911-100504', 45, 1, 2, 3, 8, 0, 0, 6350, 0, 0, NULL, NULL, 6350, 0, 1, 1, NULL, NULL, '2023-09-11 16:05:04', '2023-09-11 16:05:04'),
(17, 'pr-20230912-105340', 45, 1, 2, 1, 20, 0, 0, 13000, 0, 0, NULL, NULL, 13000, 0, 1, 1, NULL, NULL, '2023-09-11 18:00:00', '2023-09-12 04:53:40'),
(18, 'pr-20230912-072949', 45, 1, 2, 2, 1841, 0, 0, 25565, 0, 0, NULL, NULL, 25565, 0, 1, 1, NULL, NULL, '2023-09-11 18:00:00', '2023-09-12 13:29:49'),
(19, 'pr-20230912-073251', 45, 1, 2, 1, 225, 0, 0, 13500, 0, 0, NULL, NULL, 13500, 0, 1, 1, NULL, NULL, '2023-09-11 18:00:00', '2023-09-12 13:32:51'),
(20, 'pr-20230912-073942', 45, 1, 2, 1, 22, 0, 0, 1320, 0, 0, NULL, NULL, 1320, 0, 1, 1, NULL, NULL, '2023-09-11 18:00:00', '2023-09-12 13:39:42'),
(21, 'pr-20230912-074313', 45, 1, 2, 1, 20, 0, 0, 13200, 0, 0, NULL, NULL, 13200, 0, 1, 1, NULL, NULL, '2023-09-11 18:00:00', '2023-09-12 13:43:13'),
(24, 'pr-20230913-070603', 45, 1, 2, 1, 22, 0, 0, 1320, 0, 0, NULL, NULL, 1320, 0, 1, 1, NULL, NULL, '2023-09-12 18:00:00', '2023-09-13 13:06:03'),
(25, 'pr-20230913-073425', 45, 1, 2, 1, 84, 0, 0, 12180, 0, 0, NULL, NULL, 12180, 0, 1, 1, NULL, NULL, '2023-09-12 18:00:00', '2023-09-13 13:34:25'),
(26, 'pr-20230913-081231', 45, 1, 2, 1, 19, 0, 0, 10260, 0, 0, NULL, NULL, 10260, 0, 1, 1, NULL, NULL, '2023-09-12 18:00:00', '2023-09-13 14:12:31'),
(27, 'pr-20230913-093334', 45, 1, 2, 2, 3038, 0, 0, 43340, 0, 0, NULL, NULL, 43340, 0, 1, 1, NULL, NULL, '2023-09-12 18:00:00', '2023-09-13 15:33:34'),
(28, 'pr-20230914-042934', 45, 1, 2, 2, 3200, 0, 0, 35862, 0, 0, NULL, NULL, 35862, 0, 1, 1, NULL, NULL, '2023-09-13 18:00:00', '2023-09-14 10:29:34'),
(29, 'pr-20230914-075000', 45, 1, 2, 1, 154, 0, 0, 22330, 0, 0, NULL, NULL, 22330, 0, 1, 1, NULL, NULL, '2023-09-13 18:00:00', '2023-09-14 13:50:00'),
(30, 'pr-20230915-032826', 45, 1, 2, 1, 3240, 0, 0, 35316, 0, 0, 0, 0, 35316, 0, 1, 1, NULL, NULL, '2023-09-14 18:00:00', '2023-09-16 07:19:26'),
(31, 'pr-20230915-034212', 45, 1, 2, 3, 187.4, 0, 0, 82111435, 0, 0, NULL, NULL, 82111435, 0, 1, 1, NULL, NULL, '2023-09-14 18:00:00', '2023-09-15 09:42:12'),
(32, 'pr-20230916-022000', 45, 1, 2, 4, 2451.5, 0, 0, 52922, 0, 0, NULL, NULL, 52922, 0, 1, 1, NULL, NULL, '2023-09-15 18:00:00', '2023-09-16 08:20:00'),
(33, 'pr-20230916-061109', 45, 1, 2, 2, 2953.42, 0, 0, 38014.9, 0, 0, NULL, NULL, 38014.9, 0, 1, 1, NULL, NULL, '2023-09-15 18:00:00', '2023-09-16 12:11:09'),
(34, 'pr-20230917-110328', 45, 1, 2, 2, 1582, 0, 0, 18324, 0, 0, NULL, NULL, 18324, 0, 1, 1, NULL, NULL, '2023-09-16 18:00:00', '2023-09-17 05:03:28'),
(35, 'pr-20230917-011030', 45, 1, 2, 1, 20, 0, 0, 1200, 0, 0, NULL, NULL, 1200, 0, 1, 1, NULL, NULL, '2023-09-16 18:00:00', '2023-09-17 07:10:30'),
(36, 'pr-20230917-071404', 45, 1, 2, 2, 1540, 0, 0, 22150, 0, 0, NULL, NULL, 22150, 0, 1, 1, NULL, NULL, '2023-09-16 18:00:00', '2023-09-17 13:14:04'),
(37, 'pr-20230918-112929', 45, 1, 2, 3, 1846, 0, 0, 24675, 0, 0, 0, 0, 24675, 0, 1, 1, NULL, NULL, '2023-09-17 18:00:00', '2023-09-18 15:19:20'),
(38, 'pr-20230918-064153', 45, 1, 2, 2, 1111.8, 0, 0, 16383, 0, 0, NULL, NULL, 16383, 0, 1, 1, NULL, NULL, '2023-09-17 18:00:00', '2023-09-18 12:41:53'),
(39, 'pr-20230918-085904', 45, 1, 2, 1, 900, 0, 0, 10350, 0, 0, NULL, NULL, 10350, 0, 1, 1, NULL, NULL, '2023-09-17 18:00:00', '2023-09-18 14:59:04'),
(40, 'pr-20230918-091441', 45, 1, NULL, 1, 10, 0, 0, 1550, 0, 0, NULL, NULL, 1550, 0, 1, 1, NULL, NULL, '2023-09-17 18:00:00', '2023-09-18 15:14:41'),
(41, 'pr-20230919-120007', 45, 1, 2, 4, 1597.2, 0, 0, 41644, 0, 0, NULL, NULL, 41644, 0, 1, 1, NULL, NULL, '2023-09-18 18:00:00', '2023-09-19 06:00:07'),
(42, 'pr-20230919-083416', 45, 1, 4, 1, 32, 0, 0, 8800, 0, 0, NULL, NULL, 8800, 0, 1, 1, NULL, NULL, '2023-09-18 18:00:00', '2023-09-19 14:34:16'),
(43, 'pr-20230920-114456', 45, 1, 2, 3, 3010.5, 0, 0, 13233603, 0, 0, NULL, NULL, 13233603, 0, 1, 1, NULL, NULL, '2023-09-19 18:00:00', '2023-09-20 05:44:56'),
(44, 'pr-20230921-011535', 45, 1, 2, 2, 2902, 0, 0, 32712, 0, 0, NULL, NULL, 32712, 0, 1, 1, NULL, NULL, '2023-09-20 18:00:00', '2023-09-21 07:15:35'),
(45, 'pr-20230921-011900', 45, 1, 2, 2, 80.5, 0, 0, 13388.5, 0, 0, 0, 0, 13388.5, 0, 1, 1, NULL, NULL, '2023-09-20 18:00:00', '2023-09-22 03:22:44'),
(46, 'pr-20230921-034925', 45, 1, 2, 2, 1765, 0, 0, 33356, 0, 0, NULL, NULL, 33356, 0, 1, 1, NULL, NULL, '2023-09-20 18:00:00', '2023-09-21 09:49:25'),
(47, 'pr-20230922-092614', 45, 1, 3, 1, 120, 0, 0, 79200, 0, 0, 0, 0, 79200, 0, 1, 1, NULL, NULL, '2023-09-21 18:00:00', '2023-09-22 03:39:58'),
(48, 'pr-20230923-125128', 45, 1, 2, 3, 4222, 0, 0, 47460, 0, 0, NULL, NULL, 47460, 0, 1, 1, NULL, NULL, '2023-09-22 18:00:00', '2023-09-23 06:51:28'),
(49, 'pr-20230923-013800', 45, 1, 2, 2, 57.3, 0, 0, 12809.5, 0, 0, NULL, NULL, 12809.5, 0, 1, 1, NULL, NULL, '2023-09-22 18:00:00', '2023-09-23 07:38:00'),
(50, 'pr-20230923-013936', 45, 1, 2, 2, 81.9, 0, 0, 16494.5, 0, 0, NULL, NULL, 16494.5, 0, 1, 1, NULL, NULL, '2023-09-22 18:00:00', '2023-09-23 07:39:36'),
(51, 'pr-20230924-035849', 45, 1, 2, 3, 5423, 0, 0, 60510, 0, 0, NULL, NULL, 60510, 0, 1, 1, NULL, NULL, '2023-09-23 18:00:00', '2023-09-24 09:58:49'),
(52, 'pr-20230924-065520', 45, 1, 2, 1, 1380, 0, 0, 15042, 0, 0, NULL, NULL, 15042, 0, 1, 1, NULL, NULL, '2023-09-23 18:00:00', '2023-09-24 12:55:20'),
(53, 'pr-20230925-113457', 45, 1, 2, 1, 167, 0, 0, 27555, 0, 0, NULL, NULL, 27555, 0, 1, 1, NULL, NULL, '2023-09-24 18:00:00', '2023-09-25 05:34:57'),
(54, 'pr-20230925-014600', 45, 1, 2, 1, 6900, 0, 0, 75210, 0, 0, NULL, NULL, 75210, 0, 1, 1, NULL, NULL, '2023-09-24 18:00:00', '2023-09-25 07:46:00'),
(55, 'pr-20230925-020412', 45, 1, 2, 1, 19.5, 0, 0, 1170, 0, 0, NULL, NULL, 1170, 0, 1, 1, NULL, NULL, '2023-09-24 18:00:00', '2023-09-25 08:04:12'),
(56, 'pr-20230925-020612', 45, 1, 2, 1, 40.7, 0, 0, 11192.5, 0, 0, NULL, NULL, 11192.5, 0, 1, 1, NULL, NULL, '2023-09-24 18:00:00', '2023-09-25 08:06:12'),
(57, 'pr-20230925-064441', 45, 1, 2, 1, 2880, 0, 0, 31392, 0, 0, NULL, NULL, 31392, 0, 1, 1, NULL, NULL, '2023-09-24 18:00:00', '2023-09-25 12:44:41'),
(58, 'pr-20230926-034649', 45, 1, 2, 2, 2721.5, 0, 0, 30720, 0, 0, NULL, NULL, 30720, 0, 1, 1, NULL, NULL, '2023-09-25 18:00:00', '2023-09-26 09:46:49'),
(59, 'pr-20230926-075546', 45, 1, 2, 1, 7.925, 0, 0, 3566.25, 0, 0, NULL, NULL, 3566.25, 0, 1, 1, NULL, NULL, '2023-09-25 18:00:00', '2023-09-26 13:55:46'),
(60, 'pr-20230927-113517', 45, 1, 2, 2, 2180.5, 0, 0, 24774, 0, 0, NULL, NULL, 24774, 0, 1, 1, NULL, NULL, '2023-09-26 18:00:00', '2023-09-27 05:35:17'),
(61, 'pr-20230927-060932', 45, 1, 2, 1, 1500, 0, 0, 16350, 0, 0, NULL, NULL, 16350, 0, 1, 1, NULL, NULL, '2023-09-26 18:00:00', '2023-09-27 12:09:32'),
(62, 'pr-20230927-082726', 45, 1, 2, 1, 4.3, 0, 0, 1935, 0, 0, NULL, NULL, 1935, 0, 1, 1, NULL, NULL, '2023-09-26 18:00:00', '2023-09-27 14:27:26');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_product_return`
--

CREATE TABLE `purchase_product_return` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `quotation_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `return_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_purchases`
--

CREATE TABLE `return_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `return_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reward_point_settings`
--

CREATE TABLE `reward_point_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `per_point_amount` double NOT NULL,
  `minimum_amount` double NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reward_point_settings`
--

INSERT INTO `reward_point_settings` (`id`, `per_point_amount`, `minimum_amount`, `duration`, `type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 300, 1000, 1, 'Year', 1, '2021-06-09 03:40:15', '2022-07-31 11:29:38');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `guard_name` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `guard_name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin can access all data...', 'web', 1, '2018-06-02 11:46:44', '2022-07-31 09:19:24'),
(2, 'Owner', 'Staff of shop', 'web', 1, '2018-10-22 14:38:13', '2022-07-31 09:19:37'),
(4, 'Shop Staff', 'staff has specific acess...', 'web', 1, '2018-06-02 12:05:27', '2023-02-26 12:17:57'),
(5, 'Customer', NULL, 'web', 1, '2020-11-05 18:43:16', '2022-07-31 09:20:01'),
(6, 'Super Admin', NULL, 'web', 0, '2023-03-11 06:31:39', '2023-03-11 06:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(4, 1),
(4, 2),
(4, 4),
(4, 6),
(5, 1),
(5, 2),
(5, 4),
(5, 6),
(6, 1),
(6, 2),
(6, 4),
(6, 6),
(7, 1),
(7, 2),
(7, 4),
(7, 6),
(8, 1),
(8, 2),
(8, 4),
(8, 6),
(9, 1),
(9, 2),
(9, 4),
(9, 6),
(10, 1),
(10, 2),
(10, 4),
(10, 6),
(11, 1),
(11, 2),
(11, 4),
(11, 6),
(12, 1),
(12, 2),
(12, 4),
(12, 6),
(13, 1),
(13, 2),
(13, 4),
(13, 6),
(14, 1),
(14, 2),
(14, 4),
(14, 6),
(15, 1),
(15, 2),
(15, 4),
(15, 6),
(16, 1),
(16, 2),
(16, 6),
(17, 1),
(17, 2),
(17, 6),
(18, 1),
(18, 2),
(18, 6),
(19, 1),
(19, 2),
(19, 6),
(20, 1),
(20, 2),
(20, 6),
(21, 1),
(21, 2),
(21, 6),
(22, 1),
(22, 2),
(22, 6),
(23, 1),
(23, 2),
(23, 6),
(24, 1),
(24, 2),
(24, 6),
(25, 1),
(25, 2),
(25, 6),
(26, 1),
(26, 2),
(26, 6),
(27, 1),
(27, 2),
(27, 6),
(28, 1),
(28, 2),
(28, 4),
(28, 6),
(29, 1),
(29, 2),
(29, 4),
(29, 6),
(30, 1),
(30, 2),
(30, 6),
(31, 1),
(31, 2),
(31, 6),
(32, 1),
(32, 2),
(32, 6),
(33, 1),
(33, 2),
(33, 6),
(34, 1),
(34, 2),
(34, 6),
(35, 1),
(35, 2),
(35, 6),
(36, 1),
(36, 2),
(36, 6),
(37, 1),
(37, 2),
(37, 6),
(38, 1),
(38, 2),
(38, 4),
(38, 6),
(39, 1),
(39, 2),
(39, 4),
(39, 6),
(40, 1),
(40, 2),
(40, 4),
(40, 6),
(41, 1),
(41, 2),
(41, 6),
(42, 1),
(42, 2),
(42, 6),
(43, 1),
(43, 2),
(43, 6),
(44, 1),
(44, 2),
(44, 6),
(45, 1),
(45, 2),
(45, 6),
(46, 1),
(46, 2),
(46, 6),
(47, 1),
(47, 2),
(47, 6),
(48, 1),
(48, 2),
(48, 6),
(49, 1),
(49, 2),
(49, 6),
(50, 1),
(50, 2),
(50, 6),
(51, 1),
(51, 2),
(51, 6),
(52, 1),
(52, 2),
(52, 6),
(53, 1),
(53, 2),
(53, 6),
(54, 1),
(54, 2),
(54, 4),
(54, 6),
(55, 1),
(55, 2),
(55, 4),
(55, 6),
(56, 1),
(56, 2),
(56, 4),
(56, 6),
(57, 1),
(57, 2),
(57, 4),
(57, 6),
(58, 1),
(58, 2),
(58, 4),
(58, 6),
(59, 1),
(59, 2),
(59, 6),
(60, 1),
(60, 2),
(60, 6),
(61, 1),
(61, 2),
(61, 6),
(62, 1),
(62, 2),
(62, 6),
(63, 1),
(63, 2),
(63, 6),
(64, 1),
(64, 2),
(64, 6),
(65, 1),
(65, 2),
(65, 6),
(66, 1),
(66, 2),
(66, 6),
(67, 1),
(67, 2),
(67, 6),
(68, 1),
(68, 2),
(68, 6),
(69, 1),
(69, 2),
(69, 6),
(70, 1),
(70, 2),
(70, 6),
(71, 1),
(71, 2),
(71, 6),
(72, 1),
(72, 2),
(72, 6),
(73, 1),
(73, 2),
(73, 6),
(74, 1),
(74, 2),
(74, 6),
(75, 1),
(75, 2),
(75, 6),
(76, 1),
(76, 2),
(76, 6),
(77, 1),
(77, 2),
(77, 6),
(78, 1),
(78, 2),
(78, 6),
(79, 1),
(79, 2),
(79, 6),
(80, 1),
(80, 2),
(80, 6),
(81, 1),
(81, 2),
(81, 6),
(82, 1),
(82, 2),
(82, 4),
(82, 6),
(83, 2),
(84, 1),
(84, 2),
(84, 6),
(85, 1),
(85, 2),
(85, 6),
(86, 1),
(86, 2),
(86, 6),
(87, 1),
(87, 2),
(87, 6),
(88, 1),
(88, 2),
(88, 6),
(89, 1),
(89, 2),
(89, 6),
(90, 1),
(90, 2),
(90, 6),
(91, 1),
(91, 2),
(91, 6),
(92, 1),
(92, 2),
(92, 6),
(93, 1),
(93, 2),
(93, 6),
(94, 1),
(94, 2),
(94, 6),
(95, 1),
(95, 2),
(95, 6),
(96, 1),
(96, 2),
(96, 6),
(97, 1),
(97, 2),
(97, 6),
(98, 1),
(98, 2),
(98, 4),
(98, 6),
(99, 1),
(99, 2),
(99, 6),
(100, 1),
(100, 2),
(100, 6),
(101, 1),
(101, 2),
(101, 6),
(102, 1),
(102, 2),
(102, 6),
(103, 1),
(103, 2),
(103, 6),
(104, 1),
(104, 2),
(104, 6),
(105, 1),
(105, 2),
(105, 6),
(106, 1),
(106, 6),
(107, 1),
(107, 6),
(108, 1),
(108, 6),
(109, 1),
(109, 6),
(110, 1),
(110, 6),
(111, 1),
(111, 6),
(112, 1),
(112, 6),
(113, 1),
(113, 4),
(113, 6),
(114, 1),
(114, 4),
(114, 6),
(115, 1),
(115, 4),
(115, 6),
(116, 1),
(116, 4),
(116, 6),
(117, 1),
(117, 4),
(117, 6),
(118, 1),
(118, 4),
(118, 6),
(119, 1),
(119, 4),
(119, 6),
(120, 1),
(120, 4),
(120, 6),
(121, 1),
(121, 6),
(122, 1),
(122, 6),
(123, 1),
(123, 6),
(124, 1),
(124, 4),
(124, 6),
(125, 1),
(125, 4),
(125, 6);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount_type` varchar(191) DEFAULT NULL,
  `order_discount_value` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `reference_no`, `user_id`, `cash_register_id`, `customer_id`, `warehouse_id`, `biller_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_price`, `grand_total`, `order_tax_rate`, `order_tax`, `order_discount_type`, `order_discount_value`, `order_discount`, `coupon_id`, `coupon_discount`, `shipping_cost`, `sale_status`, `payment_status`, `document`, `paid_amount`, `sale_note`, `staff_note`, `created_at`, `updated_at`) VALUES
(15, 'posr-20230912-094549', 45, 9, 1, 1, 1, 1, 30, 0, 0, 339.9, 339.9, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 339.9, NULL, NULL, '2023-09-12 03:45:49', '2023-09-12 03:45:49'),
(16, 'posr-20230912-094748', 45, 9, 1, 1, 1, 1, 3.66, 0, 0, 585.6, 585.6, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2023-09-12 03:47:48', '2023-09-12 03:47:48'),
(17, 'posr-20230912-095435', 45, 9, 1, 1, 1, 1, 0.9, 0, 0, 279, 279, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 279, NULL, NULL, '2023-09-12 03:54:35', '2023-09-12 03:54:35'),
(18, 'posr-20230912-100752', 45, 9, 1, 1, 1, 1, 1.72, 0, 0, 533.2, 533.2, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 533.2, NULL, NULL, '2023-09-12 04:07:52', '2023-09-12 04:07:52'),
(19, 'posr-20230912-101134', 45, 9, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-12 04:11:34', '2023-09-12 04:11:34'),
(20, 'posr-20230912-101536', 45, 9, 1, 1, 1, 1, 1.34, 0, 0, 415.4, 415.4, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 415.4, NULL, NULL, '2023-09-12 04:15:36', '2023-09-12 04:15:36'),
(21, 'posr-20230912-090402', 45, 9, 1, 1, 1, 5, 5033.3, 0, 0, 78916.1, 78916.1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2023-09-12 15:04:02', '2023-09-12 15:04:02'),
(22, 'posr-20230912-090642', 45, NULL, 1, 1, 1, 1, 9.5, 0, 0, 617.5, 617.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 2, NULL, 0, NULL, NULL, '2023-09-12 15:06:42', '2023-09-12 15:06:42'),
(23, 'posr-20230913-064953', 45, 10, 1, 1, 1, 3, 26.759999999999998, 0, 0, 2281.4, 2281.4, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 2281.4, NULL, NULL, '2023-09-13 12:49:53', '2023-09-13 12:49:53'),
(24, 'posr-20230913-065129', 45, 10, 1, 1, 1, 1, 1.8, 0, 0, 306, 306, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 306, NULL, NULL, '2023-09-13 12:51:29', '2023-09-13 12:51:29'),
(25, 'posr-20230913-070050', 45, 10, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-13 13:00:50', '2023-09-13 13:00:50'),
(26, 'posr-20230913-070830', 45, 10, 1, 1, 1, 3, 15, 0, 0, 748, 748, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 748, NULL, NULL, '2023-09-13 13:08:30', '2023-09-13 13:08:30'),
(27, 'posr-20230913-070959', 45, 10, 1, 1, 1, 1, 13, 0, 0, 149.5, 149.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 149.5, NULL, NULL, '2023-09-13 13:09:59', '2023-09-13 13:09:59'),
(28, 'posr-20230913-072749', 45, 10, 1, 1, 1, 1, 12, 0, 0, 138, 138, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 138, NULL, NULL, '2023-09-13 13:27:49', '2023-09-13 13:27:49'),
(29, 'posr-20230913-073657', 45, 10, 1, 1, 1, 1, 44.1, 0, 0, 7497, 7497, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 7497, NULL, NULL, '2023-09-13 13:36:57', '2023-09-13 13:36:57'),
(30, 'posr-20230913-074148', 45, 10, 1, 1, 1, 1, 35.4, 0, 0, 5664, 5664, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 2, NULL, 5364, 'less for set 360\r\ntotal 5364', NULL, '2023-09-13 13:41:48', '2023-09-13 13:41:48'),
(31, 'posr-20230913-080412', 45, 10, 1, 1, 1, 1, 554, 0, 0, 6249.12, 6249.12, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 6249.12, NULL, NULL, '2023-09-13 14:04:12', '2023-09-13 14:04:12'),
(32, 'posr-20230913-080659', 45, 10, 1, 1, 1, 1, 550, 0, 0, 6209.5, 6209.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 6209.5, NULL, NULL, '2023-09-13 14:06:59', '2023-09-13 14:06:59'),
(33, 'posr-20230913-080720', 45, 10, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-13 14:07:20', '2023-09-13 14:07:20'),
(34, 'posr-20230913-080735', 45, 10, 1, 1, 1, 1, 12, 0, 0, 138, 138, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 138, NULL, NULL, '2023-09-13 14:07:35', '2023-09-13 14:07:35'),
(35, 'posr-20230913-081308', 45, 10, 1, 1, 1, 1, 0.9, 0, 0, 585, 585, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 585, NULL, NULL, '2023-09-13 14:13:08', '2023-09-13 14:13:08'),
(36, 'posr-20230913-081457', 45, 10, 1, 1, 1, 1, 8.6, 0, 0, 559, 559, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 559, NULL, NULL, '2023-09-13 14:14:57', '2023-09-13 14:14:57'),
(37, 'posr-20230913-081621', 45, 10, 1, 1, 1, 1, 4.2, 0, 0, 714, 714, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 714, NULL, NULL, '2023-09-13 14:16:21', '2023-09-13 14:16:21'),
(38, 'posr-20230913-081845', 45, 10, 1, 1, 1, 1, 1.87, 0, 0, 317.9, 317.9, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 317.9, NULL, NULL, '2023-09-13 14:18:45', '2023-09-13 14:18:45'),
(39, 'posr-20230913-082505', 45, 10, 1, 1, 1, 1, 4, 0, 0, 46, 45, 0, 0, 'Flat', 1, 1, NULL, NULL, NULL, 1, 4, NULL, 45, NULL, NULL, '2023-09-13 14:25:05', '2023-09-13 14:25:05'),
(40, 'posr-20230913-082534', 45, 10, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-13 14:25:34', '2023-09-13 14:25:34'),
(41, 'posr-20230913-082830', 45, 10, 1, 1, 1, 2, 3.63, 0, 0, 845.3, 845.3, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 845.3, NULL, NULL, '2023-09-13 14:28:30', '2023-09-13 14:28:30'),
(42, 'posr-20230913-083222', 45, 10, 1, 1, 1, 1, 6.67, 0, 0, 1867.6, 1867.6, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1867.6, NULL, NULL, '2023-09-13 14:32:22', '2023-09-13 14:32:22'),
(43, 'posr-20230913-083951', 45, 10, 1, 1, 1, 1, 2.29, 0, 0, 366.4, 366.4, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 366.4, NULL, NULL, '2023-09-13 14:39:51', '2023-09-13 14:39:51'),
(44, 'posr-20230913-085055', 45, 10, 1, 1, 1, 1, 10.4, 0, 0, 676, 676, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 676, NULL, NULL, '2023-09-13 14:50:55', '2023-09-13 14:50:55'),
(45, 'posr-20230913-093624', 45, 10, 1, 1, 1, 1, 60, 0, 0, 690, 690, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 690, NULL, NULL, '2023-09-13 15:36:24', '2023-09-13 15:36:24'),
(46, 'posr-20230914-110549', 45, 10, 1, 1, 1, 1, 1.9, 0, 0, 304, 304, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 304, NULL, NULL, '2023-09-14 05:05:49', '2023-09-14 05:05:49'),
(47, 'posr-20230914-035915', 45, 11, 1, 1, 1, 1, 100, 0, 0, 1125, 1125, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1125, NULL, NULL, '2023-09-14 09:59:15', '2023-09-14 09:59:15'),
(48, 'posr-20230914-040007', 45, 11, 1, 1, 1, 1, 8, 0, 0, 92, 92, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 92, NULL, NULL, '2023-09-14 10:00:07', '2023-09-14 10:00:07'),
(49, 'posr-20230914-040121', 45, 11, 1, 1, 1, 1, 200, 0, 0, 2250, 2250, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 2250, NULL, NULL, '2023-09-14 10:01:21', '2023-09-14 10:01:21'),
(50, 'posr-20230914-040232', 45, 11, 1, 1, 1, 1, 40, 0, 0, 450, 450, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 450, NULL, NULL, '2023-09-14 10:02:32', '2023-09-14 10:02:32'),
(51, 'posr-20230914-040254', 45, 11, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-14 10:02:54', '2023-09-14 10:02:54'),
(52, 'posr-20230914-042721', 45, 11, 1, 1, 1, 1, 520, 0, 0, 5876, 5876, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 5876, NULL, NULL, '2023-09-14 10:27:21', '2023-09-14 10:27:21'),
(53, 'posr-20230914-043015', 45, 11, 1, 1, 1, 1, 1200, 0, 0, 12840, 12840, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 12840, NULL, NULL, '2023-09-14 10:30:15', '2023-09-14 10:30:15'),
(54, 'posr-20230914-043040', 45, 11, 1, 1, 1, 1, 2, 0, 0, 130, 130, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 130, NULL, NULL, '2023-09-14 10:30:40', '2023-09-14 10:30:40'),
(55, 'posr-20230914-043323', 45, 11, 1, 1, 1, 1, 5, 0, 0, 1525, 1525, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1525, NULL, NULL, '2023-09-14 10:33:23', '2023-09-14 10:33:23'),
(56, 'posr-20230914-050119', 45, 11, 1, 1, 1, 1, 1.54, 0, 0, 477.4, 477.4, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 477.4, NULL, NULL, '2023-09-14 11:01:19', '2023-09-14 11:01:19'),
(57, 'posr-20230914-053421', 45, 11, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-14 11:34:21', '2023-09-14 11:34:21'),
(58, 'posr-20230914-064102', 45, 11, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-14 12:41:02', '2023-09-14 12:41:02'),
(59, 'posr-20230914-064119', 45, 11, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-14 12:41:19', '2023-09-14 12:41:19'),
(60, 'posr-20230914-064720', 45, 11, 1, 1, 1, 1, 0.74, 0, 0, 481, 481, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 481, NULL, NULL, '2023-09-14 12:47:20', '2023-09-14 12:47:20'),
(61, 'posr-20230914-064748', 45, 11, 1, 1, 1, 1, 0.92, 0, 0, 598, 598, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 598, NULL, NULL, '2023-09-14 12:47:48', '2023-09-14 12:47:48'),
(62, 'posr-20230914-065054', 45, 11, 1, 1, 1, 1, 2.91, 0, 0, 902.1, 902.1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 902.1, NULL, NULL, '2023-09-14 12:50:54', '2023-09-14 12:50:54'),
(63, 'posr-20230914-065150', 45, 11, 1, 1, 1, 1, 12, 0, 0, 138, 138, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 138, NULL, NULL, '2023-09-14 12:51:50', '2023-09-14 12:51:50'),
(64, 'posr-20230914-070053', 45, 11, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-14 13:00:53', '2023-09-14 13:00:53'),
(65, 'posr-20230914-070441', 45, 11, 1, 1, 1, 1, 12, 0, 0, 96, 96, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 96, NULL, NULL, '2023-09-14 13:04:41', '2023-09-14 13:04:41'),
(66, 'posr-20230914-070749', 45, 11, 1, 1, 1, 1, 0.74, 0, 0, 229.4, 229.4, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 229.4, NULL, NULL, '2023-09-14 13:07:49', '2023-09-14 13:07:49'),
(67, 'posr-20230914-072824', 45, 11, 1, 1, 1, 1, 2.2, 0, 0, 682, 682, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 682, NULL, NULL, '2023-09-14 13:28:24', '2023-09-14 13:28:24'),
(68, 'posr-20230914-074502', 45, 11, 1, 1, 1, 1, 60, 0, 0, 660, 660, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 660, NULL, NULL, '2023-09-14 13:45:02', '2023-09-14 13:45:02'),
(69, 'posr-20230914-075416', 45, 11, 1, 1, 1, 1, 23.28, 0, 0, 3864.48, 3864.48, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 3864.48, NULL, NULL, '2023-09-14 13:54:16', '2023-09-14 13:54:16'),
(70, 'posr-20230914-075618', 45, 11, 1, 1, 1, 1, 19.5, 0, 0, 3120, 2920, 0, 0, 'Flat', 200, 200, NULL, NULL, NULL, 1, 4, NULL, 2920, 'less 200 set', NULL, '2023-09-14 13:56:18', '2023-09-14 13:56:18'),
(71, 'posr-20230914-080228', 45, 11, 1, 1, 1, 1, 4, 0, 0, 2700, 2700, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 2700, NULL, NULL, '2023-09-14 14:02:28', '2023-09-14 14:02:28'),
(72, 'posr-20230914-081802', 45, 11, 1, 1, 1, 1, 14, 0, 0, 910, 910, 0, 0, 'Flat', 0, 0, NULL, NULL, 0, 1, 2, NULL, 1105, NULL, NULL, '2023-09-13 18:00:00', '2023-09-14 16:09:16'),
(73, 'posr-20230914-082035', 45, 11, 1, 1, 1, 1, 2.6, 0, 0, 442, 442, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 442, NULL, NULL, '2023-09-14 14:20:35', '2023-09-14 14:20:35'),
(74, 'posr-20230914-082150', 45, 11, 1, 1, 1, 1, 15, 0, 0, 172.5, 170.5, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 170.5, NULL, NULL, '2023-09-14 14:21:50', '2023-09-14 14:21:50'),
(75, 'posr-20230914-082232', 45, 11, 1, 1, 1, 1, 12, 0, 0, 138, 138, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 138, NULL, NULL, '2023-09-14 14:22:32', '2023-09-14 14:22:32'),
(76, 'posr-20230914-082336', 45, 11, 1, 1, 1, 1, 2.08, 0, 0, 353.6, 353.6, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 353.6, NULL, NULL, '2023-09-14 14:23:36', '2023-09-14 14:23:36'),
(77, 'posr-20230914-082353', 45, 11, 1, 1, 1, 1, 12, 0, 0, 138, 138, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 138, NULL, NULL, '2023-09-14 14:23:53', '2023-09-14 14:23:53'),
(78, 'posr-20230914-084045', 45, 11, 1, 1, 1, 1, 2.06, 0, 0, 350.2, 350.2, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 350.2, NULL, NULL, '2023-09-14 14:40:45', '2023-09-14 14:40:45'),
(79, 'posr-20230914-101702', 45, 11, 1, 1, 1, 1, 3, 0, 0, 195, 195, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 195, NULL, NULL, '2023-09-14 16:17:02', '2023-09-14 16:17:02'),
(80, 'posr-20230915-041957', 45, 11, 1, 1, 1, 1, 3.2, 0, 0, 992, 992, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 992, NULL, NULL, '2023-09-15 10:19:57', '2023-09-15 10:19:57'),
(81, 'posr-20230915-042046', 45, 11, 1, 1, 1, 1, 0.86, 0, 0, 559, 559, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 559, NULL, NULL, '2023-09-15 10:20:46', '2023-09-15 10:20:46'),
(82, 'posr-20230915-042610', 45, 11, 1, 1, 1, 1, 53.68, 0, 0, 9125.6, 9125.6, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 9125.6, NULL, NULL, '2023-09-15 10:26:10', '2023-09-15 10:26:10'),
(83, 'posr-20230915-042941', 45, 11, 1, 1, 1, 1, 24.5, 0, 0, 4165, 4165, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 4165, NULL, NULL, '2023-09-15 10:29:41', '2023-09-15 10:29:41'),
(84, 'posr-20230915-051143', 45, 11, 1, 1, 1, 1, 400, 0, 0, 4600, 4520, 0, 0, 'Flat', 80, 80, NULL, NULL, NULL, 1, 4, NULL, 4520, NULL, NULL, '2023-09-15 11:11:43', '2023-09-15 11:11:43'),
(85, 'posr-20230915-052211', 45, 12, 1, 1, 1, 1, 1, 0, 0, 170, 170, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 170, NULL, NULL, '2023-09-15 11:22:11', '2023-09-15 11:22:11'),
(86, 'posr-20230915-054236', 45, 12, 1, 1, 1, 1, 40.6, 0, 0, 28420, 28420, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 28420, NULL, NULL, '2023-09-15 11:42:36', '2023-09-15 11:42:36'),
(87, 'posr-20230915-060508', 45, 12, 1, 1, 1, 1, 24, 0, 0, 16800, 16750, 0, 0, 'Flat', 50, 50, NULL, NULL, NULL, 1, 4, NULL, 16750, NULL, NULL, '2023-09-15 12:05:08', '2023-09-15 12:05:08'),
(88, 'posr-20230915-064707', 45, 12, 1, 1, 1, 1, 1510, 0, 0, 17063, 17063, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 17063, NULL, NULL, '2023-09-15 12:47:07', '2023-09-15 12:47:07'),
(89, 'posr-20230915-065213', 45, 12, 1, 1, 1, 1, 4.5, 0, 0, 292.5, 292.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 292.5, NULL, NULL, '2023-09-15 12:52:13', '2023-09-15 12:52:13'),
(90, 'posr-20230915-065614', 45, 12, 1, 1, 1, 1, 2, 0, 0, 340, 340, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 340, NULL, NULL, '2023-09-15 12:56:14', '2023-09-15 12:56:14'),
(91, 'posr-20230915-070025', 45, 12, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-15 13:00:25', '2023-09-15 13:00:25'),
(92, 'posr-20230915-070156', 45, 12, 1, 1, 1, 2, 3.71, 0, 0, 849.1, 839.1, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 839.1, NULL, NULL, '2023-09-15 13:01:56', '2023-09-15 13:01:56'),
(93, 'posr-20230915-070357', 45, 12, 1, 1, 1, 1, 0.5, 0, 0, 32.5, 32.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 32.5, NULL, NULL, '2023-09-15 13:03:57', '2023-09-15 13:03:57'),
(94, 'posr-20230916-012258', 45, 12, 3, 1, 1, 1, 2, 0, 0, 340, 340, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 340, NULL, NULL, '2023-09-16 07:22:58', '2023-09-16 07:22:58'),
(95, 'posr-20230916-013037', 45, 12, 3, 1, 1, 1, 2, 0, 0, 340, 340, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 340, NULL, NULL, '2023-09-16 07:30:37', '2023-09-16 07:30:37'),
(96, 'posr-20230916-023811', 45, 12, 1, 1, 1, 1, 8, 0, 0, 92, 92, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 92, NULL, NULL, '2023-09-16 08:38:11', '2023-09-16 08:38:11'),
(97, 'posr-20230916-023856', 45, 12, 1, 1, 1, 1, 210, 0, 0, 2415, 2350, 0, 0, 'Flat', 65, 65, NULL, NULL, NULL, 1, 4, NULL, 2350, NULL, NULL, '2023-09-16 08:38:56', '2023-09-16 08:38:56'),
(98, 'posr-20230916-023923', 45, 12, 1, 1, 1, 1, 250, 0, 0, 2875, 2800, 0, 0, 'Flat', 75, 75, NULL, NULL, NULL, 1, 4, NULL, 2800, NULL, NULL, '2023-09-16 08:39:23', '2023-09-16 08:39:23'),
(99, 'posr-20230916-023948', 45, 12, 1, 1, 1, 1, 200, 0, 0, 2300, 2250, 0, 0, 'Flat', 50, 50, NULL, NULL, NULL, 1, 4, NULL, 2250, NULL, NULL, '2023-09-16 08:39:48', '2023-09-16 08:39:48'),
(100, 'posr-20230916-024002', 45, 12, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-16 08:40:02', '2023-09-16 08:40:02'),
(101, 'posr-20230916-024017', 45, 12, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-16 08:40:17', '2023-09-16 08:40:17'),
(102, 'posr-20230916-024111', 45, 12, 1, 1, 1, 1, 15, 0, 0, 172.5, 168.5, 0, 0, 'Flat', 4, 4, NULL, NULL, NULL, 1, 4, NULL, 168.5, NULL, NULL, '2023-09-16 08:41:11', '2023-09-16 08:41:11'),
(103, 'posr-20230916-024136', 45, 12, 1, 1, 1, 1, 100, 0, 0, 1150, 1120, 0, 0, 'Flat', 30, 30, NULL, NULL, NULL, 1, 4, NULL, 1120, NULL, NULL, '2023-09-16 08:41:36', '2023-09-16 08:41:37'),
(104, 'posr-20230916-024223', 45, 12, 1, 1, 1, 1, 30, 0, 0, 345, 195, 0, 0, 'Flat', 150, 150, NULL, NULL, NULL, 1, 4, NULL, 195, 'vanga egg', NULL, '2023-09-16 08:42:23', '2023-09-16 08:42:23'),
(105, 'posr-20230916-024301', 45, 12, 1, 1, 1, 1, 30, 0, 0, 345, 330, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 330, NULL, NULL, '2023-09-16 08:43:01', '2023-09-16 08:43:01'),
(106, 'posr-20230916-024326', 45, 12, 1, 1, 1, 1, 30, 0, 0, 345, 340, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 340, NULL, NULL, '2023-09-16 08:43:26', '2023-09-16 08:43:26'),
(107, 'posr-20230916-024337', 45, 12, 1, 1, 1, 1, 12, 0, 0, 138, 138, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 138, NULL, NULL, '2023-09-16 08:43:37', '2023-09-16 08:43:37'),
(108, 'posr-20230916-024407', 45, 12, 1, 1, 1, 1, 62, 0, 0, 713, 713, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 713, NULL, NULL, '2023-09-16 08:44:07', '2023-09-16 08:44:07'),
(109, 'posr-20230916-024429', 45, 12, 1, 1, 1, 1, 2, 0, 0, 130, 120, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 120, NULL, NULL, '2023-09-16 08:44:29', '2023-09-16 08:44:29'),
(110, 'posr-20230916-024447', 45, 12, 1, 1, 1, 1, 0.83, 0, 0, 257.3, 257.3, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 257.3, NULL, NULL, '2023-09-16 08:44:47', '2023-09-16 08:44:47'),
(111, 'posr-20230916-024522', 45, 12, 1, 1, 1, 1, 5, 0, 0, 3450, 3375, 0, 0, 'Flat', 75, 75, NULL, NULL, NULL, 1, 4, NULL, 3375, NULL, NULL, '2023-09-16 08:45:22', '2023-09-16 08:45:22'),
(112, 'posr-20230916-024555', 45, 12, 1, 1, 1, 1, 1, 0, 0, 690, 500, 0, 0, 'Flat', 190, 190, NULL, NULL, NULL, 1, 4, NULL, 500, NULL, NULL, '2023-09-16 08:45:55', '2023-09-16 08:45:55'),
(113, 'posr-20230916-024616', 45, 12, 1, 1, 1, 1, 2, 0, 0, 1380, 1380, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1380, NULL, NULL, '2023-09-16 08:46:16', '2023-09-16 08:46:16'),
(114, 'posr-20230916-024632', 45, 12, 1, 1, 1, 1, 1, 0, 0, 690, 690, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 690, NULL, NULL, '2023-09-16 08:46:32', '2023-09-16 08:46:32'),
(115, 'posr-20230916-025040', 45, 12, 1, 1, 1, 1, 2, 0, 0, 1380, 1600, 0, 0, 'Flat', NULL, 0, NULL, NULL, 220, 1, 4, NULL, 1600, NULL, NULL, '2023-09-16 08:50:40', '2023-09-16 08:50:40'),
(116, 'posr-20230916-025213', 45, 12, 1, 1, 1, 1, 500, 0, 0, 5750, 5650, 0, 0, 'Flat', 100, 100, NULL, NULL, NULL, 1, 4, NULL, 5650, 'bagdad', NULL, '2023-09-16 08:52:13', '2023-09-16 08:52:13'),
(117, 'posr-20230916-025644', 45, 12, 1, 1, 1, 1, 2.32, 0, 0, 394.4, 394.4, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 394.4, NULL, NULL, '2023-09-16 08:56:44', '2023-09-16 08:56:44'),
(118, 'posr-20230916-025707', 45, 12, 1, 1, 1, 1, 2, 0, 0, 340, 340, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 340, NULL, NULL, '2023-09-16 08:57:07', '2023-09-16 08:57:07'),
(119, 'posr-20230916-025741', 45, 12, 1, 1, 1, 1, 6.3, 0, 0, 1071, 1000, 0, 0, 'Flat', 71, 71, NULL, NULL, NULL, 1, 4, NULL, 1000, NULL, NULL, '2023-09-16 08:57:41', '2023-09-16 08:57:41'),
(120, 'posr-20230916-025758', 45, 12, 1, 1, 1, 1, 1.85, 0, 0, 314.5, 314.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 314.5, NULL, NULL, '2023-09-16 08:57:58', '2023-09-16 08:57:58'),
(121, 'posr-20230916-025853', 45, 12, 1, 1, 1, 1, 8.94, 0, 0, 1519.8, 1500.8, 0, 0, 'Flat', 19, 19, NULL, NULL, NULL, 1, 4, NULL, 1500.8, NULL, NULL, '2023-09-16 08:58:53', '2023-09-16 08:58:53'),
(122, 'posr-20230916-025915', 45, 12, 1, 1, 1, 1, 1.94, 0, 0, 329.8, 329.8, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 329.8, NULL, NULL, '2023-09-16 08:59:15', '2023-09-16 08:59:15'),
(123, 'posr-20230916-025941', 45, 12, 1, 1, 1, 1, 1.55, 0, 0, 263.5, 263.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 263.5, NULL, NULL, '2023-09-16 08:59:41', '2023-09-16 08:59:41'),
(124, 'posr-20230916-025955', 45, 12, 1, 1, 1, 1, 2.17, 0, 0, 368.9, 368.9, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 368.9, NULL, NULL, '2023-09-16 08:59:55', '2023-09-16 08:59:55'),
(125, 'posr-20230916-030050', 45, 12, 1, 1, 1, 1, 1.92, 0, 0, 326.4, 300.4, 0, 0, 'Flat', 26, 26, NULL, NULL, NULL, 1, 4, NULL, 300.4, NULL, NULL, '2023-09-16 09:00:50', '2023-09-16 09:00:50'),
(126, 'posr-20230916-030103', 45, 12, 1, 1, 1, 1, 1.92, 0, 0, 326.4, 326.4, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 326.4, NULL, NULL, '2023-09-16 09:01:03', '2023-09-16 09:01:03'),
(127, 'posr-20230916-030126', 45, 12, 1, 1, 1, 1, 2.5, 0, 0, 425, 425, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 425, NULL, NULL, '2023-09-16 09:01:26', '2023-09-16 09:01:26'),
(128, 'posr-20230916-030217', 45, 12, 1, 1, 1, 1, 2.17, 0, 0, 368.9, 368.9, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 368.9, NULL, NULL, '2023-09-16 09:02:17', '2023-09-16 09:02:17'),
(129, 'posr-20230916-030331', 45, 12, 1, 1, 1, 1, 90, 0, 0, 1035, 1017, 0, 0, 'Flat', 18, 18, NULL, NULL, NULL, 1, 4, NULL, 1017, NULL, NULL, '2023-09-16 09:03:31', '2023-09-16 09:03:31'),
(130, 'posr-20230916-045414', 45, 12, 1, 1, 1, 1, 100, 0, 0, 1150, 1125, 0, 0, 'Flat', 25, 25, NULL, NULL, NULL, 1, 4, NULL, 1125, NULL, NULL, '2023-09-16 10:54:14', '2023-09-16 10:54:14'),
(131, 'posr-20230916-045455', 45, 12, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-16 10:54:55', '2023-09-16 10:54:55'),
(132, 'posr-20230916-045520', 45, 12, 1, 1, 1, 1, 100, 0, 0, 1150, 1125, 0, 0, 'Flat', 25, 25, NULL, NULL, NULL, 1, 4, NULL, 1125, NULL, NULL, '2023-09-16 10:55:20', '2023-09-16 10:55:20'),
(133, 'posr-20230916-045623', 45, 12, 1, 1, 1, 1, 0.96, 0, 0, 297.6, 297.6, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 297.6, NULL, NULL, '2023-09-16 10:56:23', '2023-09-16 10:56:23'),
(134, 'posr-20230916-045644', 45, 12, 1, 1, 1, 1, 6, 0, 0, 390, 390, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 390, NULL, NULL, '2023-09-16 10:56:44', '2023-09-16 10:56:44'),
(135, 'posr-20230916-053920', 45, 12, 1, 1, 1, 1, 3.6, 0, 0, 612, 580, 0, 0, 'Flat', 32, 32, NULL, NULL, NULL, 1, 4, NULL, 580, NULL, NULL, '2023-09-16 11:39:20', '2023-09-16 11:39:20'),
(136, 'posr-20230916-054942', 45, 12, 1, 1, 1, 1, 4, 0, 0, 260, 260, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 260, NULL, NULL, '2023-09-16 11:49:42', '2023-09-16 11:49:42'),
(137, 'posr-20230916-055324', 45, 12, 1, 1, 1, 1, 5, 0, 0, 325, 325, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 325, 'basa due', NULL, '2023-09-16 11:53:24', '2023-09-16 11:53:24'),
(138, 'posr-20230916-061216', 45, 12, 1, 1, 1, 1, 4.94, 0, 0, 839.8, 839.8, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 839.8, NULL, NULL, '2023-09-16 12:12:16', '2023-09-16 12:12:16'),
(139, 'posr-20230916-063352', 45, 12, 1, 1, 1, 1, 1.7, 0, 0, 289, 289, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 289, NULL, NULL, '2023-09-16 12:33:52', '2023-09-16 12:33:52'),
(140, 'posr-20230916-064850', 45, 12, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-16 12:48:50', '2023-09-16 12:48:50'),
(141, 'posr-20230916-065315', 45, 12, 1, 1, 1, 1, 20, 0, 0, 1300, 1300, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1300, 'maidul', NULL, '2023-09-16 12:53:15', '2023-09-16 12:53:15'),
(142, 'posr-20230916-070453', 45, 12, 1, 1, 1, 1, 8, 0, 0, 92, 90, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-16 13:04:53', '2023-09-16 13:04:53'),
(143, 'posr-20230916-080413', 45, 12, 1, 1, 1, 1, 5520, 0, 0, 59064, 59064, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 59064, NULL, NULL, '2023-09-16 14:04:13', '2023-09-16 14:04:13'),
(144, 'posr-20230916-080510', 45, 12, 1, 1, 1, 1, 480, 0, 0, 4704, 4704, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 4704, 'small egg', NULL, '2023-09-16 14:05:10', '2023-09-16 14:05:10'),
(145, 'posr-20230916-081109', 45, 12, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-16 14:11:09', '2023-09-16 14:11:09'),
(146, 'posr-20230916-081242', 45, 12, 1, 1, 1, 1, 1.62, 0, 0, 275.4, 275.4, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 275.4, NULL, NULL, '2023-09-16 14:12:42', '2023-09-16 14:12:42'),
(147, 'posr-20230916-082513', 45, 12, 1, 1, 1, 1, 12.41, 0, 0, 1985.6, 1865.6, 0, 0, 'Flat', 120, 120, NULL, NULL, NULL, 1, 4, NULL, 1865.6, 'set 120', NULL, '2023-09-16 14:25:13', '2023-09-16 14:25:13'),
(148, 'posr-20230916-083955', 45, 12, 1, 1, 1, 1, 2.5, 0, 0, 162.5, 162.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 162.5, NULL, NULL, '2023-09-16 14:39:55', '2023-09-16 14:39:55'),
(149, 'posr-20230917-095353', 45, 13, 1, 1, 1, 1, 4, 0, 0, 640, 640, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 640, NULL, NULL, '2023-09-17 03:53:53', '2023-09-17 03:53:53'),
(150, 'posr-20230917-095444', 45, 13, 1, 1, 1, 1, 30, 0, 0, 198, 198, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 198, 'vanga egg', NULL, '2023-09-17 03:54:44', '2023-09-17 03:54:44'),
(151, 'posr-20230917-095506', 45, 13, 1, 1, 1, 1, 30, 0, 0, 345, 340, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 340, NULL, NULL, '2023-09-17 03:55:06', '2023-09-17 03:55:06'),
(152, 'posr-20230917-105628', 45, 13, 1, 1, 1, 1, 1, 0, 0, 690, 690, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 690, NULL, NULL, '2023-09-17 04:56:28', '2023-09-17 04:56:28'),
(153, 'posr-20230917-110221', 45, 13, 1, 1, 1, 1, 4, 0, 0, 46, 30, 0, 0, 'Flat', 16, 16, NULL, NULL, NULL, 1, 4, NULL, 30, 'vanga egg', NULL, '2023-09-17 05:02:21', '2023-09-17 05:02:21'),
(154, 'posr-20230917-110420', 45, 13, 1, 1, 1, 1, 1.83, 0, 0, 311.1, 311.1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 311.1, NULL, NULL, '2023-09-17 05:04:20', '2023-09-17 05:04:20'),
(155, 'posr-20230917-111330', 45, 13, 1, 1, 1, 1, 1, 0, 0, 11.5, 11.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 11.5, NULL, NULL, '2023-09-17 05:13:30', '2023-09-17 05:13:30'),
(156, 'posr-20230917-112216', 45, 13, 1, 1, 1, 1, 2, 0, 0, 340, 330, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 330, NULL, NULL, '2023-09-17 05:22:16', '2023-09-17 05:22:16'),
(157, 'posr-20230917-112456', 45, 13, 1, 1, 1, 1, 150, 0, 0, 1725, 1680, 0, 0, 'Flat', 45, 45, NULL, NULL, NULL, 1, 4, NULL, 1680, NULL, NULL, '2023-09-17 05:24:56', '2023-09-17 05:24:56'),
(158, 'kurigram chal ghar', 45, 13, 1, 1, 1, 1, 300, 0, 0, 3450, 3360, 0, 0, 'Flat', 90, 90, NULL, NULL, NULL, 1, 4, NULL, 3360, 'kurigram chal ghar', NULL, '2023-09-16 18:00:00', '2023-09-17 05:28:34'),
(159, 'posr-20230917-115244', 45, 13, 1, 1, 1, 3, 15.23, 0, 0, 582.1, 582.1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 582.1, NULL, NULL, '2023-09-17 05:52:44', '2023-09-17 05:52:44'),
(160, 'posr-20230917-115646', 45, 13, 1, 1, 1, 1, 1.53, 0, 0, 260.1, 260.1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 260.1, NULL, NULL, '2023-09-17 05:56:46', '2023-09-17 05:56:46'),
(161, 'posr-20230917-122737', 45, 13, 1, 1, 1, 1, 1.619, 0, 0, 501.89, 501.89, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 501.89, NULL, NULL, '2023-09-17 06:27:37', '2023-09-17 06:27:37'),
(162, 'posr-20230917-122813', 45, 13, 1, 1, 1, 1, 2, 0, 0, 130, 120, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 120, NULL, NULL, '2023-09-17 06:28:13', '2023-09-17 06:28:13'),
(163, 'posr-20230917-125847', 45, 13, 1, 1, 1, 2, 3.2, 0, 0, 928, 900, 0, 0, 'Flat', 28, 28, NULL, NULL, NULL, 1, 4, NULL, 900, NULL, NULL, '2023-09-17 06:58:47', '2023-09-17 06:58:47'),
(164, 'posr-20230917-011058', 45, 13, 1, 1, 1, 2, 7.5, 0, 0, 3612.5, 3562.5, 0, 0, 'Flat', 50, 50, NULL, NULL, NULL, 1, 4, NULL, 3562.5, NULL, NULL, '2023-09-17 07:10:58', '2023-09-17 07:10:58'),
(165, 'posr-20230917-013341', 45, 13, 1, 1, 1, 1, 3, 0, 0, 195, 195, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 195, NULL, NULL, '2023-09-17 07:33:41', '2023-09-17 07:33:41'),
(166, 'posr-20230917-013442', 45, 13, 1, 1, 1, 1, 8, 0, 0, 92, 92, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 92, NULL, NULL, '2023-09-17 07:34:42', '2023-09-17 07:34:42'),
(167, 'posr-20230917-013502', 45, 13, 1, 1, 1, 1, 4, 0, 0, 46, 46, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 46, NULL, NULL, '2023-09-17 07:35:02', '2023-09-17 07:35:02'),
(168, 'posr-20230917-014611', 45, 13, 1, 1, 1, 1, 100, 0, 0, 1150, 1120, 0, 0, 'Flat', 30, 30, NULL, NULL, NULL, 1, 4, NULL, 1120, NULL, NULL, '2023-09-17 07:46:11', '2023-09-17 07:46:11'),
(169, 'posr-20230917-021325', 45, 13, 1, 1, 1, 2, 1.49, 0, 0, 351.3, 351.3, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 351.3, 'kata boilar ekta', NULL, '2023-09-17 08:13:25', '2023-09-17 08:13:25'),
(170, 'posr-20230917-021638', 45, 13, 1, 1, 1, 1, 20, 0, 0, 230, 225, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 225, NULL, NULL, '2023-09-17 08:16:38', '2023-09-17 08:16:38'),
(171, 'posr-20230917-050505', 45, 13, 1, 1, 1, 1, 4, 0, 0, 46, 46, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 46, NULL, NULL, '2023-09-17 11:05:05', '2023-09-17 11:05:05'),
(172, 'posr-20230917-050644', 45, 13, 1, 1, 1, 1, 1.54, 0, 0, 477.4, 477.4, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 477.4, NULL, NULL, '2023-09-17 11:06:44', '2023-09-17 11:06:44'),
(173, 'posr-20230917-050735', 45, 13, 1, 1, 1, 1, 2.23, 0, 0, 691.3, 691.3, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 691.3, NULL, NULL, '2023-09-17 11:07:35', '2023-09-17 11:07:35'),
(174, 'posr-20230917-050757', 45, 13, 1, 1, 1, 1, 3, 0, 0, 195, 195, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 195, NULL, NULL, '2023-09-17 11:07:57', '2023-09-17 11:07:57'),
(175, 'posr-20230917-051437', 45, 13, 1, 1, 1, 2, 15, 0, 0, 339, 339, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 339, NULL, NULL, '2023-09-17 11:14:37', '2023-09-17 11:14:37'),
(176, 'posr-20230917-054633', 45, 13, 1, 1, 1, 1, 120, 0, 0, 1350, 1350, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1350, NULL, NULL, '2023-09-17 11:46:33', '2023-09-17 11:46:33'),
(177, 'posr-20230917-054919', 45, 13, 1, 1, 1, 1, 400, 0, 0, 4520, 4520, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 4520, NULL, NULL, '2023-09-17 11:49:19', '2023-09-17 11:49:19'),
(178, 'posr-20230917-054950', 45, 13, 1, 1, 1, 1, 60, 0, 0, 678, 678, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 678, NULL, NULL, '2023-09-17 11:49:50', '2023-09-17 11:49:50'),
(179, 'posr-20230917-055048', 45, 13, 1, 1, 1, 1, 60, 0, 0, 690, 690, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 690, 'basa', NULL, '2023-09-17 11:50:48', '2023-09-17 11:50:48'),
(180, 'posr-20230917-055749', 45, 13, 1, 1, 1, 1, 4, 0, 0, 640, 640, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 640, NULL, NULL, '2023-09-17 11:57:49', '2023-09-17 11:57:49'),
(181, 'posr-20230917-055952', 45, 13, 1, 1, 1, 1, 37.47, 0, 0, 5995.2, 5695.2, 0, 0, 'Flat', 300, 300, NULL, NULL, NULL, 1, 4, NULL, 5695.2, NULL, NULL, '2023-09-17 11:59:52', '2023-09-17 11:59:52'),
(182, 'posr-20230917-060743', 45, 13, 1, 1, 1, 1, 2.2, 0, 0, 374, 374, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 374, NULL, NULL, '2023-09-17 12:07:43', '2023-09-17 12:07:43'),
(183, 'posr-20230917-061327', 45, 13, 1, 1, 1, 1, 1.5, 0, 0, 97.5, 97.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 97.5, NULL, NULL, '2023-09-17 12:13:27', '2023-09-17 12:13:27'),
(184, 'posr-20230917-065430', 45, 13, 1, 1, 1, 1, 0.78, 0, 0, 507, 507, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 507, NULL, NULL, '2023-09-17 12:54:30', '2023-09-17 12:54:30'),
(185, 'posr-20230917-071626', 45, 13, 1, 1, 1, 1, 2.19, 0, 0, 678.9, 678.9, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 678.9, NULL, NULL, '2023-09-17 13:16:26', '2023-09-17 13:16:26'),
(186, 'posr-20230917-073638', 45, 13, 1, 1, 1, 1, 20, 0, 0, 1300, 1300, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1300, NULL, NULL, '2023-09-17 13:36:38', '2023-09-17 13:36:38'),
(187, 'posr-20230917-075707', 45, 13, 1, 1, 1, 1, 2.13, 0, 0, 362.1, 360.1, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 360.1, NULL, NULL, '2023-09-17 13:57:07', '2023-09-17 13:57:07'),
(188, 'posr-20230917-080110', 45, 13, 1, 1, 1, 1, 4.47, 0, 0, 759.9, 759.9, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 759.9, NULL, NULL, '2023-09-17 14:01:10', '2023-09-17 14:01:10'),
(189, 'posr-20230917-080301', 45, 13, 1, 1, 1, 1, 600, 0, 0, 6720, 6720, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 6720, NULL, NULL, '2023-09-17 14:03:01', '2023-09-17 14:03:01'),
(190, 'posr-20230917-081436', 45, 13, 1, 1, 1, 1, 4.2, 0, 0, 714, 714, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 714, 'maidul', NULL, '2023-09-17 14:14:36', '2023-09-17 14:14:36'),
(191, 'posr-20230918-100514', 45, NULL, 1, 1, 1, 1, 2.68, 0, 0, 455.6, 455.6, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 455.6, NULL, NULL, '2023-09-18 04:05:14', '2023-09-18 04:05:14'),
(192, 'posr-20230918-100833', 45, 14, 1, 1, 1, 1, 42, 0, 0, 483, 483, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 483, NULL, NULL, '2023-09-18 04:08:33', '2023-09-18 04:08:33'),
(193, 'posr-20230918-101319', 45, 14, 1, 1, 1, 1, 60, 0, 0, 690, 675, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 675, NULL, NULL, '2023-09-18 04:13:19', '2023-09-18 04:13:19'),
(194, 'posr-20230918-103041', 45, 14, 1, 1, 1, 1, 8, 0, 0, 92, 92, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 92, NULL, NULL, '2023-09-18 04:30:41', '2023-09-18 04:30:41'),
(195, 'posr-20230918-111034', 45, 14, 1, 1, 1, 1, 17, 0, 0, 195.5, 195.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 195.5, NULL, NULL, '2023-09-18 05:10:34', '2023-09-18 05:10:34'),
(196, 'posr-20230918-111227', 45, 14, 1, 1, 1, 1, 30, 0, 0, 345, 200, 0, 0, 'Flat', 145, 145, NULL, NULL, NULL, 1, 4, NULL, 200, NULL, NULL, '2023-09-18 05:12:27', '2023-09-18 05:12:27'),
(197, 'posr-20230918-111326', 45, 14, 1, 1, 1, 1, 100, 0, 0, 1150, 1120, 0, 0, 'Flat', 30, 30, NULL, NULL, NULL, 1, 4, NULL, 1120, NULL, NULL, '2023-09-18 05:13:26', '2023-09-18 05:13:26'),
(198, 'posr-20230918-111434', 45, 14, 1, 1, 1, 1, 2.17, 0, 0, 368.9, 368.9, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 368.9, NULL, NULL, '2023-09-18 05:14:34', '2023-09-18 05:14:34'),
(199, 'posr-20230918-111734', 45, 14, 1, 1, 1, 1, 3.6, 0, 0, 612, 576, 0, 0, 'Flat', 36, 36, NULL, NULL, NULL, 1, 4, NULL, 576, NULL, NULL, '2023-09-18 05:17:34', '2023-09-18 05:17:34'),
(200, 'posr-20230918-111834', 45, 14, 1, 1, 1, 1, 0.8, 0, 0, 520, 520, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 520, NULL, NULL, '2023-09-18 05:18:34', '2023-09-18 05:18:34'),
(201, 'posr-20230918-111941', 45, 14, 1, 1, 1, 1, 5, 0, 0, 3450, 3375, 0, 0, 'Flat', 75, 75, NULL, NULL, NULL, 1, 4, NULL, 3375, NULL, NULL, '2023-09-18 05:19:41', '2023-09-18 05:19:41'),
(202, 'posr-20230918-114835', 45, 14, 1, 1, 1, 1, 1.43, 0, 0, 243.1, 243.1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 243.1, NULL, NULL, '2023-09-18 05:48:35', '2023-09-18 05:48:35'),
(203, 'posr-20230918-120820', 45, 14, 1, 1, 1, 1, 1.26, 0, 0, 214.2, 214.2, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 214.2, NULL, NULL, '2023-09-18 06:08:20', '2023-09-18 06:08:20'),
(204, 'posr-20230918-121003', 45, 14, 1, 1, 1, 1, 4.8, 0, 0, 768, 768, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 768, NULL, NULL, '2023-09-18 06:10:03', '2023-09-18 06:10:03'),
(205, 'posr-20230918-121945', 45, 14, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-18 06:19:45', '2023-09-18 06:19:45'),
(206, 'posr-20230918-122114', 45, 14, 1, 1, 1, 1, 0.8, 0, 0, 520, 520, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 520, NULL, NULL, '2023-09-18 06:21:14', '2023-09-18 06:21:14'),
(207, 'posr-20230918-124518', 45, 14, 1, 1, 1, 1, 100, 0, 0, 1150, 1125, 0, 0, 'Flat', 25, 25, NULL, NULL, NULL, 1, 4, NULL, 1125, NULL, NULL, '2023-09-18 06:45:18', '2023-09-18 06:45:18'),
(209, 'posr-20230918-124753', 45, 14, 1, 1, 1, 1, 2.3, 0, 0, 391, 370, 0, 0, 'Flat', 21, 21, NULL, NULL, NULL, 1, 4, NULL, 370, NULL, NULL, '2023-09-18 06:47:53', '2023-09-18 06:47:53'),
(210, 'posr-20230918-124834', 45, 14, 1, 1, 1, 1, 30, 0, 0, 345, 335, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 335, NULL, NULL, '2023-09-18 06:48:34', '2023-09-18 06:48:34'),
(211, 'posr-20230918-124914', 45, 14, 1, 1, 1, 1, 30, 0, 0, 345, 200, 0, 0, 'Flat', 145, 145, NULL, NULL, NULL, 1, 4, NULL, 200, 'vangga Dim', NULL, '2023-09-18 06:49:14', '2023-09-18 06:49:14'),
(212, 'posr-20230918-012200', 45, 14, 1, 1, 1, 1, 1.3, 0, 0, 221, 221, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 221, NULL, NULL, '2023-09-18 07:22:00', '2023-09-18 07:22:00'),
(213, 'posr-20230918-020636', 45, 14, 1, 1, 1, 1, 100, 0, 0, 1150, 1125, 0, 0, 'Flat', 25, 25, NULL, NULL, NULL, 1, 4, NULL, 1125, NULL, NULL, '2023-09-18 08:06:36', '2023-09-18 08:06:36'),
(214, 'posr-20230918-020752', 45, 14, 1, 1, 1, 1, 8, 0, 0, 92, 60, 0, 0, 'Flat', 32, 32, NULL, NULL, NULL, 1, 4, NULL, 60, 'Vangga Dim', NULL, '2023-09-18 08:07:52', '2023-09-18 08:07:52'),
(215, 'posr-20230918-035145', 45, 14, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-18 09:51:45', '2023-09-18 09:51:45'),
(216, 'posr-20230918-042401', 45, 14, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-18 10:24:01', '2023-09-18 10:24:01'),
(217, 'posr-20230918-044547', 45, 14, 1, 1, 1, 1, 1.92, 0, 0, 326.4, 326.4, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 326.4, NULL, NULL, '2023-09-18 10:45:47', '2023-09-18 10:45:47'),
(218, 'posr-20230918-052010', 45, 14, 1, 1, 1, 1, 100, 0, 0, 1150, 1125, 0, 0, 'Flat', 25, 25, NULL, NULL, NULL, 1, 4, NULL, 1125, NULL, NULL, '2023-09-18 11:20:10', '2023-09-18 11:20:10'),
(219, 'posr-20230918-052809', 45, 14, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-18 11:28:09', '2023-09-18 11:28:09'),
(220, 'posr-20230918-053726', 45, 14, 1, 1, 1, 1, 18.53, 0, 0, 2964.8, 2764.8, 0, 0, 'Flat', 200, 200, NULL, NULL, NULL, 1, 4, NULL, 2764.8, 'set 200', NULL, '2023-09-18 11:37:26', '2023-09-18 11:37:26'),
(221, 'posr-20230918-053834', 45, 14, 1, 1, 1, 1, 3.43, 0, 0, 583.1, 548.1, 0, 0, 'Flat', 35, 35, NULL, NULL, NULL, 1, 4, NULL, 548.1, NULL, NULL, '2023-09-18 11:38:34', '2023-09-18 11:38:34'),
(222, 'posr-20230918-055817', 45, 14, 1, 1, 1, 1, 20, 0, 0, 230, 224, 0, 0, 'Flat', 6, 6, NULL, NULL, NULL, 1, 4, NULL, 224, NULL, NULL, '2023-09-18 11:58:17', '2023-09-18 11:58:17'),
(223, 'posr-20230918-055913', 45, 14, 1, 1, 1, 1, 2.43, 0, 0, 753.3, 753.3, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 753.3, NULL, NULL, '2023-09-18 11:59:13', '2023-09-18 11:59:13'),
(224, 'posr-20230918-060928', 45, 14, 1, 1, 1, 1, 150, 0, 0, 1680, 1680, 0, 0, 'Flat', 0, 0, NULL, NULL, NULL, 1, 4, NULL, 1680, NULL, NULL, '2023-09-18 12:09:28', '2023-09-18 12:09:28'),
(225, 'posr-20230918-060959', 45, 14, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-18 12:09:59', '2023-09-18 12:09:59'),
(226, 'posr-20230918-062415', 45, 14, 1, 1, 1, 1, 1.97, 0, 0, 334.9, 315.9, 0, 0, 'Flat', 19, 19, NULL, NULL, NULL, 1, 4, NULL, 315.9, NULL, NULL, '2023-09-18 12:24:15', '2023-09-18 12:24:15'),
(227, 'posr-20230918-063947', 45, 14, 1, 1, 1, 1, 4, 0, 0, 46, 46, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 46, NULL, NULL, '2023-09-18 12:39:47', '2023-09-18 12:39:47'),
(228, 'posr-20230918-064019', 45, 14, 1, 1, 1, 1, 2, 0, 0, 130, 130, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 130, NULL, NULL, '2023-09-18 12:40:19', '2023-09-18 12:40:19'),
(229, 'posr-20230918-064343', 45, 14, 1, 1, 1, 1, 8, 0, 0, 520, 520, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 520, NULL, NULL, '2023-09-18 12:43:43', '2023-09-18 12:43:43'),
(230, 'posr-20230918-065444', 45, 14, 1, 1, 1, 1, 8, 0, 0, 92, 90, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-18 12:54:44', '2023-09-18 12:54:44'),
(231, 'posr-20230918-071517', 45, 14, 1, 1, 1, 1, 30, 0, 0, 345, 340, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 340, NULL, NULL, '2023-09-18 13:15:17', '2023-09-18 13:15:17'),
(232, 'posr-20230918-072151', 45, 14, 1, 1, 1, 1, 13.4, 0, 0, 2144, 2144, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 2144, NULL, NULL, '2023-09-18 13:21:51', '2023-09-18 13:21:51'),
(233, 'posr-20230918-073207', 45, 14, 1, 1, 1, 1, 30, 0, 0, 345, 335, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 335, NULL, NULL, '2023-09-18 13:32:07', '2023-09-18 13:32:07'),
(234, 'posr-20230918-073243', 45, 14, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-18 13:32:43', '2023-09-18 13:32:43'),
(235, 'posr-20230918-073824', 45, 14, 1, 1, 1, 1, 16, 0, 0, 184, 184, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 184, NULL, NULL, '2023-09-18 13:38:24', '2023-09-18 13:38:24'),
(236, 'posr-20230918-074244', 45, 14, 1, 1, 1, 1, 0.85, 0, 0, 263.5, 263.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 263.5, NULL, NULL, '2023-09-18 13:42:44', '2023-09-18 13:42:44'),
(237, 'posr-20230918-074258', 45, 14, 1, 1, 1, 1, 8, 0, 0, 92, 92, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 92, NULL, NULL, '2023-09-18 13:42:58', '2023-09-18 13:42:58'),
(238, 'posr-20230918-075041', 45, 14, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-18 13:50:41', '2023-09-18 13:50:41'),
(239, 'posr-20230918-075344', 45, 14, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-18 13:53:44', '2023-09-18 13:53:44'),
(240, 'posr-20230918-080854', 45, 14, 1, 1, 1, 1, 1.23, 0, 0, 209.1, 209.1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 209.1, NULL, NULL, '2023-09-18 14:08:54', '2023-09-18 14:08:54'),
(241, 'posr-20230918-080928', 45, 14, 1, 1, 1, 1, 2.29, 0, 0, 709.9, 709.9, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 709.9, NULL, NULL, '2023-09-18 14:09:28', '2023-09-18 14:09:28'),
(242, 'posr-20230918-080956', 45, 14, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-18 14:09:56', '2023-09-18 14:09:56'),
(243, 'posr-20230918-081059', 45, 14, 1, 1, 1, 1, 30, 0, 0, 240, 240, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 240, 'vangga dim', NULL, '2023-09-18 14:10:59', '2023-09-18 14:10:59'),
(244, 'posr-20230918-082456', 45, 14, 1, 1, 1, 1, 330, 0, 0, 3729, 3729, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 3729, NULL, NULL, '2023-09-18 14:24:56', '2023-09-18 14:24:56'),
(245, 'posr-20230918-084853', 45, 14, 5, 1, 1, 1, 50, 0, 0, 575, 575, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 575, NULL, NULL, '2023-09-18 14:48:53', '2023-09-18 14:48:53'),
(246, 'posr-20230918-085009', 45, 14, 1, 1, 1, 1, 50, 0, 0, 575, 560, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 560, NULL, NULL, '2023-09-18 14:50:09', '2023-09-18 14:50:09'),
(247, 'posr-20230918-090337', 45, 14, 7, 1, 1, 2, 751, 0, 0, 13910, 13910, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 13910, NULL, NULL, '2023-09-18 15:03:37', '2023-09-18 15:03:37'),
(248, 'sr-20230918-090824', 45, 14, 1, 1, 1, 1, 1.05, 0, 0, 178.5, 178.5, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 178.5, NULL, NULL, '2023-09-17 18:00:00', '2023-09-18 15:08:24'),
(249, 'posr-20230918-092730', 45, 14, 8, 1, 1, 1, 2.97, 0, 0, 504.9, 504.9, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 504.9, NULL, NULL, '2023-09-18 15:27:30', '2023-09-18 15:27:30'),
(250, 'posr-20230918-094834', 45, 14, 9, 1, 1, 1, 12, 0, 0, 138, 138, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 138, NULL, NULL, '2023-09-18 15:48:34', '2023-09-18 15:48:34'),
(251, 'posr-20230919-121925', 45, 15, 1, 1, 1, 1, 1.3, 0, 0, 221, 220, 0, 0, 'Flat', 1, 1, NULL, NULL, NULL, 1, 4, NULL, 220, NULL, NULL, '2023-09-19 06:19:25', '2023-09-19 06:19:25'),
(252, 'posr-20230919-012922', 45, 15, 1, 1, 1, 1, 150, 0, 0, 1725, 1680, 0, 0, 'Flat', 45, 45, NULL, NULL, NULL, 1, 4, NULL, 1680, NULL, NULL, '2023-09-19 07:29:22', '2023-09-19 07:29:22'),
(253, 'posr-20230919-013047', 45, 15, 1, 1, 1, 1, 1.63, 0, 0, 505.3, 500.3, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 500.3, NULL, NULL, '2023-09-19 07:30:47', '2023-09-19 07:30:47'),
(254, 'posr-20230919-013111', 45, 15, 1, 1, 1, 1, 2, 0, 0, 130, 130, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 130, NULL, NULL, '2023-09-19 07:31:11', '2023-09-19 07:31:11'),
(255, 'posr-20230919-013443', 45, 15, 1, 1, 1, 1, 1, 0, 0, 170, 170, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 170, NULL, NULL, '2023-09-19 07:34:43', '2023-09-19 07:34:43'),
(256, 'posr-20230919-013658', 45, 15, 1, 1, 1, 1, 3.8, 0, 0, 646, 608, 0, 0, 'Flat', 38, 38, NULL, NULL, NULL, 1, 4, NULL, 608, NULL, NULL, '2023-09-19 07:36:58', '2023-09-19 07:36:58'),
(257, 'posr-20230919-013920', 45, 15, 1, 1, 1, 1, 1.3, 0, 0, 221, 221, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 221, NULL, NULL, '2023-09-19 07:39:20', '2023-09-19 07:39:20'),
(258, 'posr-20230919-014435', 45, 15, 1, 1, 1, 1, 2.1, 0, 0, 357, 347, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 347, NULL, NULL, '2023-09-19 07:44:35', '2023-09-19 07:44:35'),
(259, 'posr-20230919-014534', 45, 15, 1, 1, 1, 1, 100, 0, 0, 1150, 1125, 0, 0, 'Flat', 25, 25, NULL, NULL, NULL, 1, 4, NULL, 1125, NULL, NULL, '2023-09-19 07:45:34', '2023-09-19 07:45:34'),
(260, 'posr-20230919-015333', 45, 15, 1, 1, 1, 1, 12, 0, 0, 138, 138, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 138, NULL, NULL, '2023-09-19 07:53:33', '2023-09-19 07:53:33'),
(261, 'posr-20230919-015553', 45, 15, 1, 1, 1, 1, 2.83, 0, 0, 877.3, 849.3, 0, 0, 'Flat', 28, 28, NULL, NULL, NULL, 1, 4, NULL, 849.3, NULL, NULL, '2023-09-19 07:55:53', '2023-09-19 07:55:53'),
(262, 'posr-20230919-021924', 45, 15, 1, 1, 1, 1, 1.095, 0, 0, 339.45, 325.45, 0, 0, 'Flat', 14, 14, NULL, NULL, NULL, 1, 4, NULL, 325.45, NULL, NULL, '2023-09-19 08:19:24', '2023-09-19 08:19:24'),
(263, 'posr-20230919-021950', 45, 15, 1, 1, 1, 1, 4, 0, 0, 260, 260, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 260, NULL, NULL, '2023-09-19 08:19:50', '2023-09-19 08:19:50'),
(264, 'posr-20230919-022454', 45, 15, 1, 1, 1, 1, 5.3, 0, 0, 3657, 3577, 0, 0, 'Flat', 80, 80, NULL, NULL, NULL, 1, 4, NULL, 3577, NULL, NULL, '2023-09-19 08:24:54', '2023-09-19 08:24:54'),
(265, 'posr-20230919-022713', 45, 15, 1, 1, 1, 1, 60, 0, 0, 690, 675, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 675, NULL, NULL, '2023-09-19 08:27:13', '2023-09-19 08:27:13'),
(266, 'posr-20230919-023135', 45, 15, 1, 1, 1, 1, 180, 0, 0, 2070, 2016, 0, 0, 'Flat', 54, 54, NULL, NULL, NULL, 1, 4, NULL, 2016, NULL, NULL, '2023-09-19 08:31:35', '2023-09-19 08:31:35'),
(267, 'posr-20230919-023159', 45, 15, 1, 1, 1, 1, 12, 0, 0, 138, 138, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 138, NULL, NULL, '2023-09-19 08:31:59', '2023-09-19 08:31:59'),
(268, 'posr-20230919-023249', 45, 15, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-19 08:32:49', '2023-09-19 08:32:49'),
(269, 'posr-20230919-023309', 45, 15, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-19 08:33:09', '2023-09-19 08:33:09'),
(270, 'posr-20230919-023336', 45, 15, 1, 1, 1, 1, 16, 0, 0, 184, 184, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 184, NULL, NULL, '2023-09-19 08:33:36', '2023-09-19 08:33:36'),
(271, 'posr-20230919-023618', 45, 15, 1, 1, 1, 1, 1.83, 0, 0, 311.1, 310.1, 0, 0, 'Flat', 1, 1, NULL, NULL, NULL, 1, 4, NULL, 310.1, NULL, NULL, '2023-09-19 08:36:18', '2023-09-19 08:36:18'),
(272, 'posr-20230919-023817', 45, 15, 1, 1, 1, 1, 300, 0, 0, 3450, 3360, 0, 0, 'Flat', 90, 90, NULL, NULL, NULL, 1, 4, NULL, 3360, NULL, NULL, '2023-09-19 08:38:17', '2023-09-19 08:38:17'),
(273, 'posr-20230919-023917', 45, 15, 1, 1, 1, 1, 1.9, 0, 0, 323, 323, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 323, NULL, NULL, '2023-09-19 08:39:17', '2023-09-19 08:39:17'),
(274, 'posr-20230919-024142', 45, 15, 1, 1, 1, 1, 8, 0, 0, 92, 90, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-19 08:41:42', '2023-09-19 08:41:42'),
(275, 'posr-20230919-024333', 45, 15, 1, 1, 1, 1, 2.043, 0, 0, 347.31, 340.31, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 340.31, NULL, NULL, '2023-09-19 08:43:33', '2023-09-19 08:43:33'),
(276, 'posr-20230919-024427', 45, 15, 1, 1, 1, 1, 1.095, 0, 0, 186.15, 185.15, 0, 0, 'Flat', 1, 1, NULL, NULL, NULL, 1, 4, NULL, 185.15, NULL, NULL, '2023-09-19 08:44:27', '2023-09-19 08:44:27'),
(277, 'posr-20230919-024606', 45, 15, 1, 1, 1, 1, 3.6, 0, 0, 612, 575, 0, 0, 'Flat', 37, 37, NULL, NULL, NULL, 1, 4, NULL, 575, NULL, NULL, '2023-09-19 08:46:06', '2023-09-19 08:46:06'),
(278, 'posr-20230919-024710', 45, 15, 1, 1, 1, 1, 1.9, 0, 0, 323, 315, 0, 0, 'Flat', 8, 8, NULL, NULL, NULL, 1, 4, NULL, 315, NULL, NULL, '2023-09-19 08:47:10', '2023-09-19 08:47:10');
INSERT INTO `sales` (`id`, `reference_no`, `user_id`, `cash_register_id`, `customer_id`, `warehouse_id`, `biller_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_price`, `grand_total`, `order_tax_rate`, `order_tax`, `order_discount_type`, `order_discount_value`, `order_discount`, `coupon_id`, `coupon_discount`, `shipping_cost`, `sale_status`, `payment_status`, `document`, `paid_amount`, `sale_note`, `staff_note`, `created_at`, `updated_at`) VALUES
(279, 'posr-20230919-025236', 45, 15, 1, 1, 1, 1, 1.8, 0, 0, 306, 260, 0, 0, 'Flat', 46, 46, NULL, NULL, NULL, 1, 4, NULL, 260, NULL, NULL, '2023-09-19 08:52:36', '2023-09-19 08:52:36'),
(280, 'posr-20230919-025426', 45, 15, 1, 1, 1, 1, 1.94, 0, 0, 329.8, 330.8, 0, 0, 'Flat', NULL, 0, NULL, NULL, 1, 1, 4, NULL, 330.8, NULL, NULL, '2023-09-19 08:54:26', '2023-09-19 08:54:26'),
(281, 'posr-20230919-025736', 45, 15, 1, 1, 1, 1, 6.8, 0, 0, 1156, 1150, 0, 0, 'Flat', 6, 6, NULL, NULL, NULL, 1, 4, NULL, 1150, NULL, NULL, '2023-09-19 08:57:36', '2023-09-19 08:57:36'),
(282, 'posr-20230919-033441', 45, 15, 1, 1, 1, 1, 4, 0, 0, 680, 650, 0, 0, 'Flat', 30, 30, NULL, NULL, NULL, 1, 4, NULL, 650, NULL, NULL, '2023-09-19 09:34:41', '2023-09-19 09:34:41'),
(283, 'posr-20230919-052157', 45, 15, 1, 1, 1, 1, 8, 0, 0, 96, 96, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 96, NULL, NULL, '2023-09-19 11:21:57', '2023-09-19 11:21:57'),
(284, 'posr-20230919-052248', 45, 15, 1, 1, 1, 1, 30, 0, 0, 345, 340, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 340, NULL, NULL, '2023-09-19 11:22:48', '2023-09-19 11:22:48'),
(285, 'posr-20230919-052407', 45, 15, 1, 1, 1, 1, 2.08, 0, 0, 353.6, 353.6, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 353.6, NULL, NULL, '2023-09-19 11:24:07', '2023-09-19 11:24:07'),
(286, 'posr-20230919-052650', 45, 15, 1, 1, 1, 1, 3.6, 0, 0, 612, 605, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 605, NULL, NULL, '2023-09-19 11:26:50', '2023-09-19 11:26:50'),
(287, 'posr-20230919-052841', 45, 15, 1, 1, 1, 1, 1.93, 0, 0, 328.1, 328.1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 328.1, NULL, NULL, '2023-09-19 11:28:41', '2023-09-19 11:28:41'),
(288, 'posr-20230919-055422', 45, 15, 1, 1, 1, 1, 30, 0, 0, 345, 330, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 330, NULL, NULL, '2023-09-19 11:54:22', '2023-09-19 11:54:22'),
(289, 'posr-20230919-061204', 45, 15, 1, 1, 1, 1, 3.6, 0, 0, 612, 576, 0, 0, 'Flat', 36, 36, NULL, NULL, NULL, 1, 4, NULL, 576, NULL, NULL, '2023-09-19 12:12:04', '2023-09-19 12:12:04'),
(290, 'posr-20230919-062026', 45, 15, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-19 12:20:26', '2023-09-19 12:20:26'),
(291, 'posr-20230919-074804', 45, 15, 1, 1, 1, 1, 90, 0, 0, 1035, 1017, 0, 0, 'Flat', 18, 18, NULL, NULL, NULL, 1, 4, NULL, 1017, NULL, NULL, '2023-09-19 13:48:04', '2023-09-19 13:48:04'),
(292, 'posr-20230919-074907', 45, 15, 1, 1, 1, 1, 300, 0, 0, 3450, 3390, 0, 0, 'Flat', 60, 60, NULL, NULL, NULL, 1, 4, NULL, 3390, NULL, NULL, '2023-09-19 13:49:07', '2023-09-19 13:49:07'),
(293, 'posr-20230919-075952', 45, 15, 1, 1, 1, 1, 1500, 0, 0, 17250, 16050, 0, 0, 'Flat', 1200, 1200, NULL, NULL, NULL, 1, 4, NULL, 16050, NULL, NULL, '2023-09-19 13:59:52', '2023-09-19 13:59:52'),
(294, 'posr-20230919-080045', 45, 15, 1, 1, 1, 1, 1.1, 0, 0, 187, 180, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 180, NULL, NULL, '2023-09-19 14:00:45', '2023-09-19 14:00:45'),
(295, 'posr-20230919-080530', 45, 15, 1, 1, 1, 1, 5, 0, 0, 325, 325, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 325, NULL, NULL, '2023-09-19 14:05:30', '2023-09-19 14:05:30'),
(296, 'posr-20230919-080634', 45, 15, 1, 1, 1, 1, 5, 0, 0, 325, 325, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 325, NULL, NULL, '2023-09-19 14:06:34', '2023-09-19 14:06:34'),
(297, 'posr-20230919-080800', 45, 15, 1, 1, 1, 1, 2, 0, 0, 130, 130, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 130, NULL, NULL, '2023-09-19 14:08:00', '2023-09-19 14:08:00'),
(298, 'posr-20230919-080819', 45, 15, 1, 1, 1, 1, 2, 0, 0, 130, 130, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 130, NULL, NULL, '2023-09-19 14:08:19', '2023-09-19 14:08:19'),
(299, 'posr-20230919-081037', 45, 15, 1, 1, 1, 1, 50, 0, 0, 575, 565, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 565, NULL, NULL, '2023-09-19 14:10:37', '2023-09-19 14:10:37'),
(300, 'posr-20230919-081421', 45, 15, 1, 1, 1, 1, 1.7, 0, 0, 289, 272, 0, 0, 'Flat', 17, 17, NULL, NULL, NULL, 1, 4, NULL, 272, NULL, NULL, '2023-09-19 14:14:21', '2023-09-19 14:14:21'),
(301, 'posr-20230919-082959', 45, 15, 1, 1, 1, 1, 13, 0, 0, 149.5, 149.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 149.5, NULL, NULL, '2023-09-19 14:29:59', '2023-09-19 14:29:59'),
(302, 'posr-20230919-083145', 45, 15, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-19 14:31:45', '2023-09-19 14:31:45'),
(303, 'posr-20230919-083207', 45, 15, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-19 14:32:07', '2023-09-19 14:32:07'),
(304, 'posr-20230919-084722', 45, 15, 12, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-19 14:47:22', '2023-09-19 14:47:22'),
(305, 'posr-20230919-091200', 45, 15, 1, 1, 1, 1, 8, 0, 0, 92, 92, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 92, NULL, NULL, '2023-09-19 15:12:00', '2023-09-19 15:12:00'),
(306, 'posr-20230919-092754', 45, 15, 1, 1, 1, 1, 0.87, 0, 0, 269.7, 260.7, 0, 0, 'Flat', 9, 9, NULL, NULL, NULL, 1, 4, NULL, 260.7, NULL, NULL, '2023-09-19 15:27:54', '2023-09-19 15:27:54'),
(307, 'posr-20230919-093526', 45, 15, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-19 15:35:26', '2023-09-19 15:35:26'),
(308, 'posr-20230919-093641', 45, 15, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-19 15:36:41', '2023-09-19 15:36:41'),
(309, 'posr-20230920-102038', 45, 16, 10, 1, 1, 1, 60, 0, 0, 690, 670, 0, 0, 'Flat', 20, 20, NULL, NULL, NULL, 1, 4, NULL, 670, NULL, NULL, '2023-09-20 04:20:38', '2023-09-20 04:20:38'),
(310, 'posr-20230920-102954', 45, 16, 1, 1, 1, 1, 4, 0, 0, 46, 46, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 46, NULL, NULL, '2023-09-20 04:29:54', '2023-09-20 04:29:54'),
(311, 'posr-20230920-111652', 45, 16, 13, 1, 1, 1, 1.18, 0, 0, 200.6, 200.6, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 200.6, NULL, NULL, '2023-09-20 05:16:52', '2023-09-20 05:16:52'),
(312, 'posr-20230920-111742', 45, 16, 1, 1, 1, 1, 150, 0, 0, 1725, 1680, 0, 0, 'Flat', 45, 45, NULL, NULL, NULL, 1, 4, NULL, 1680, NULL, NULL, '2023-09-20 05:17:42', '2023-09-20 05:17:42'),
(313, 'posr-20230920-111820', 45, 16, 1, 1, 1, 1, 0.5, 0, 0, 32.5, 33.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 1, 1, 4, NULL, 33.5, NULL, NULL, '2023-09-20 05:18:20', '2023-09-20 05:18:20'),
(314, 'posr-20230920-111908', 45, 16, 1, 1, 1, 1, 1, 0, 0, 700, 700, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 700, NULL, NULL, '2023-09-20 05:19:08', '2023-09-20 05:19:08'),
(315, 'posr-20230920-112031', 45, 16, 14, 1, 1, 1, 2.05, 0, 0, 348.5, 348.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 348.5, NULL, NULL, '2023-09-20 05:20:31', '2023-09-20 05:20:31'),
(316, 'posr-20230920-112113', 45, 16, 1, 1, 1, 1, 1.965, 0, 0, 334.05, 333.05, 0, 0, 'Flat', 1, 1, NULL, NULL, NULL, 1, 4, NULL, 333.05, NULL, NULL, '2023-09-20 05:21:13', '2023-09-20 05:21:13'),
(317, 'posr-20230920-112158', 45, 16, 1, 1, 1, 1, 3.75, 0, 0, 637.5, 600.5, 0, 0, 'Flat', 37, 37, NULL, NULL, NULL, 1, 4, NULL, 600.5, NULL, NULL, '2023-09-20 05:21:58', '2023-09-20 05:21:58'),
(318, 'posr-20230920-113336', 45, 16, 1, 1, 1, 1, 1.04, 0, 0, 322.4, 312.4, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 312.4, NULL, NULL, '2023-09-20 05:33:36', '2023-09-20 05:33:36'),
(319, 'posr-20230920-113524', 45, 16, 1, 1, 1, 1, 300, 0, 0, 3450, 3360, 0, 0, 'Flat', 90, 90, NULL, NULL, NULL, 1, 4, NULL, 3360, NULL, NULL, '2023-09-20 05:35:24', '2023-09-20 05:35:24'),
(320, 'posr-20230920-115452', 45, 16, 1, 1, 1, 1, 1.86, 0, 0, 316.2, 316.2, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 316.2, NULL, NULL, '2023-09-20 05:54:52', '2023-09-20 05:54:52'),
(321, 'posr-20230920-120814', 45, 16, 1, 1, 1, 1, 0.5, 0, 0, 345, 350, 0, 0, 'Flat', NULL, 0, NULL, NULL, 5, 1, 4, NULL, 350, NULL, NULL, '2023-09-20 06:08:14', '2023-09-20 06:08:14'),
(322, 'posr-20230920-121457', 45, 16, 15, 1, 1, 1, 3.2, 0, 0, 992, 960, 0, 0, 'Flat', 32, 32, NULL, NULL, NULL, 1, 4, NULL, 960, NULL, NULL, '2023-09-20 06:14:57', '2023-09-20 06:14:57'),
(323, 'posr-20230920-123024', 45, 16, 1, 1, 1, 1, 0.76, 0, 0, 524.4, 520.4, 0, 0, 'Flat', 4, 4, NULL, NULL, NULL, 1, 4, NULL, 520.4, NULL, NULL, '2023-09-20 06:30:24', '2023-09-20 06:30:24'),
(324, 'posr-20230920-033239', 45, 16, 1, 1, 1, 1, 4, 0, 0, 46, 46, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 46, NULL, NULL, '2023-09-20 09:32:39', '2023-09-20 09:32:39'),
(325, 'posr-20230920-033426', 45, 16, 1, 1, 1, 1, 100, 0, 0, 1150, 1120, 0, 0, 'Flat', 30, 30, NULL, NULL, NULL, 1, 4, NULL, 1120, NULL, NULL, '2023-09-20 09:34:26', '2023-09-20 09:34:26'),
(326, 'posr-20230920-033620', 45, 16, 16, 1, 1, 1, 30, 0, 0, 345, 336, 0, 0, 'Flat', 9, 9, NULL, NULL, NULL, 1, 4, NULL, 336, NULL, NULL, '2023-09-20 09:36:20', '2023-09-20 09:36:20'),
(327, 'posr-20230920-034033', 45, 16, 17, 1, 1, 1, 1.08, 0, 0, 334.8, 275.8, 0, 0, 'Flat', 59, 59, NULL, NULL, NULL, 1, 4, NULL, 275.8, NULL, NULL, '2023-09-20 09:40:33', '2023-09-20 09:40:33'),
(328, 'posr-20230920-034139', 45, 16, 17, 1, 1, 1, 1, 0, 0, 690, 660, 0, 0, 'Flat', 30, 30, NULL, NULL, NULL, 1, 4, NULL, 660, NULL, NULL, '2023-09-20 09:41:39', '2023-09-20 09:41:39'),
(329, 'posr-20230920-034255', 45, 16, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-20 09:42:55', '2023-09-20 09:42:55'),
(330, 'posr-20230920-050356', 45, 16, 18, 1, 1, 1, 2.08, 0, 0, 353.6, 350.6, 0, 0, 'Flat', 3, 3, NULL, NULL, NULL, 1, 4, NULL, 350.6, NULL, NULL, '2023-09-20 11:03:56', '2023-09-20 11:03:56'),
(331, 'posr-20230920-052309', 45, 16, 1, 1, 1, 1, 0.5, 0, 0, 32.5, 33.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 1, 1, 4, NULL, 33.5, NULL, NULL, '2023-09-20 11:23:09', '2023-09-20 11:23:09'),
(332, 'posr-20230920-052430', 45, 16, 1, 1, 1, 1, 100, 0, 0, 1150, 1130, 0, 0, 'Flat', 20, 20, NULL, NULL, NULL, 1, 4, NULL, 1130, NULL, NULL, '2023-09-20 11:24:30', '2023-09-20 11:24:30'),
(333, 'posr-20230920-055505', 45, 16, 1, 1, 1, 1, 8, 0, 0, 92, 92, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 92, NULL, NULL, '2023-09-20 11:55:05', '2023-09-20 11:55:05'),
(334, 'posr-20230920-060827', 45, 16, 19, 1, 1, 1, 3, 0, 0, 2070, 2100, 0, 0, 'Flat', NULL, 0, NULL, NULL, 30, 1, 4, NULL, 2100, NULL, NULL, '2023-09-20 12:08:27', '2023-09-20 12:08:27'),
(335, 'posr-20230920-083308', 45, 16, 1, 1, 1, 1, 3.5, 0, 0, 595, 560, 0, 0, 'Flat', 35, 35, NULL, NULL, NULL, 1, 4, NULL, 560, NULL, NULL, '2023-09-20 14:33:08', '2023-09-20 14:33:08'),
(336, 'posr-20230920-083439', 45, 16, 1, 1, 1, 1, 1.6, 0, 0, 272, 256, 0, 0, 'Flat', 16, 16, NULL, NULL, NULL, 1, 4, NULL, 256, NULL, NULL, '2023-09-20 14:34:39', '2023-09-20 14:34:39'),
(337, 'posr-20230920-083517', 45, 16, 1, 1, 1, 1, 1.7, 0, 0, 289, 290, 0, 0, 'Flat', NULL, 0, NULL, NULL, 1, 1, 4, NULL, 290, NULL, NULL, '2023-09-20 14:35:17', '2023-09-20 14:35:17'),
(338, 'posr-20230920-083645', 45, 16, 1, 1, 1, 1, 3.68, 0, 0, 1140.8, 1104.8, 0, 0, 'Flat', 36, 36, NULL, NULL, NULL, 1, 4, NULL, 1104.8, NULL, NULL, '2023-09-20 14:36:45', '2023-09-20 14:36:45'),
(339, 'posr-20230920-083713', 45, 16, 1, 1, 1, 1, 1.8, 0, 0, 306, 306, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 306, NULL, NULL, '2023-09-20 14:37:13', '2023-09-20 14:37:13'),
(340, 'posr-20230920-083821', 45, 16, 1, 1, 1, 1, 0.8, 0, 0, 520, 497, 0, 0, 'Flat', 23, 23, NULL, NULL, NULL, 1, 4, NULL, 497, NULL, NULL, '2023-09-20 14:38:21', '2023-09-20 14:38:21'),
(341, 'posr-20230920-083853', 45, 16, 1, 1, 1, 1, 5, 0, 0, 325, 325, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 325, NULL, NULL, '2023-09-20 14:38:53', '2023-09-20 14:38:53'),
(342, 'posr-20230920-083955', 45, 16, 1, 1, 1, 1, 120, 0, 0, 1380, 1344, 0, 0, 'Flat', 36, 36, NULL, NULL, NULL, 1, 4, NULL, 1344, NULL, NULL, '2023-09-20 14:39:55', '2023-09-20 14:39:55'),
(343, 'posr-20230920-084052', 45, 16, 1, 1, 1, 1, 1.1, 0, 0, 341, 333, 0, 0, 'Flat', 8, 8, NULL, NULL, NULL, 1, 4, NULL, 333, NULL, NULL, '2023-09-20 14:40:52', '2023-09-20 14:40:52'),
(344, 'posr-20230920-084121', 45, 16, 1, 1, 1, 1, 2.5, 0, 0, 162.5, 162.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 162.5, NULL, NULL, '2023-09-20 14:41:21', '2023-09-20 14:41:21'),
(345, 'posr-20230920-084236', 45, 16, 1, 1, 1, 1, 4, 0, 0, 260, 240, 0, 0, 'Flat', 20, 20, NULL, NULL, NULL, 1, 4, NULL, 240, NULL, NULL, '2023-09-20 14:42:36', '2023-09-20 14:42:36'),
(346, 'posr-20230920-084303', 45, 16, 1, 1, 1, 1, 2, 0, 0, 130, 130, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 130, NULL, NULL, '2023-09-20 14:43:03', '2023-09-20 14:43:03'),
(347, 'posr-20230920-084353', 45, 16, 1, 1, 1, 1, 2.62, 0, 0, 445.4, 445.4, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 445.4, NULL, NULL, '2023-09-20 14:43:53', '2023-09-20 14:43:53'),
(348, 'posr-20230920-084502', 45, 16, 1, 1, 1, 1, 1.7, 0, 0, 289, 260, 0, 0, 'Flat', 29, 29, NULL, NULL, NULL, 1, 4, NULL, 260, NULL, NULL, '2023-09-20 14:45:02', '2023-09-20 14:45:02'),
(349, 'posr-20230920-084655', 45, 16, 1, 1, 1, 1, 1500, 0, 0, 17250, 16050, 0, 0, 'Flat', 1200, 1200, NULL, NULL, NULL, 1, 4, NULL, 16050, NULL, NULL, '2023-09-20 14:46:55', '2023-09-20 14:46:55'),
(350, 'posr-20230920-084742', 45, 16, 1, 1, 1, 1, 30, 0, 0, 345, 338, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 338, NULL, NULL, '2023-09-20 14:47:42', '2023-09-20 14:47:42'),
(351, 'posr-20230920-084803', 45, 16, 1, 1, 1, 1, 8, 0, 0, 92, 90, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-20 14:48:03', '2023-09-20 14:48:03'),
(352, 'posr-20230920-084846', 45, 16, 1, 1, 1, 1, 5, 0, 0, 3450, 3375, 0, 0, 'Flat', 75, 75, NULL, NULL, NULL, 1, 4, NULL, 3375, NULL, NULL, '2023-09-20 14:48:46', '2023-09-20 14:48:46'),
(353, 'posr-20230921-100921', 45, 17, 5, 1, 1, 1, 5.28, 0, 0, 897.6, 818.6, 0, 0, 'Flat', 79, 79, NULL, NULL, NULL, 1, 4, NULL, 818.6, NULL, NULL, '2023-09-21 04:09:21', '2023-09-21 04:09:21'),
(354, 'posr-20230921-101008', 45, 17, 1, 1, 1, 1, 2.1, 0, 0, 357, 345, 0, 0, 'Flat', 12, 12, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-21 04:10:08', '2023-09-21 04:10:08'),
(355, 'posr-20230921-101042', 45, 17, 1, 1, 1, 1, 8, 0, 0, 92, 92, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 92, NULL, NULL, '2023-09-21 04:10:42', '2023-09-21 04:10:42'),
(356, 'posr-20230921-101133', 45, 17, 1, 1, 1, 1, 30, 0, 0, 345, 340, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 340, NULL, NULL, '2023-09-21 04:11:33', '2023-09-21 04:11:33'),
(357, 'posr-20230921-101322', 45, 17, 1, 1, 1, 1, 28, 0, 0, 322, 275, 0, 0, 'Flat', 47, 47, NULL, NULL, NULL, 1, 4, NULL, 275, NULL, NULL, '2023-09-21 04:13:22', '2023-09-21 04:13:22'),
(358, 'posr-20230921-101344', 45, 17, 1, 1, 1, 1, 12, 0, 0, 138, 138, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 138, NULL, NULL, '2023-09-21 04:13:44', '2023-09-21 04:13:44'),
(359, 'posr-20230921-101831', 45, 17, 1, 1, 1, 1, 0.738, 0, 0, 479.7, 480.7, 0, 0, 'Flat', NULL, 0, NULL, NULL, 1, 1, 4, NULL, 480.7, NULL, NULL, '2023-09-21 04:18:31', '2023-09-21 04:18:31'),
(360, 'posr-20230921-102314', 45, 17, 1, 1, 1, 1, 0.5, 0, 0, 345, 330, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 330, NULL, NULL, '2023-09-21 04:23:14', '2023-09-21 04:23:14'),
(361, 'posr-20230921-102829', 45, 17, 1, 1, 1, 1, 16, 0, 0, 184, 184, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 184, NULL, NULL, '2023-09-21 04:28:29', '2023-09-21 04:28:29'),
(362, 'posr-20230921-105151', 45, 17, 20, 1, 1, 1, 1.54, 0, 0, 261.8, 260.8, 0, 0, 'Flat', 1, 1, NULL, NULL, NULL, 1, 4, NULL, 260.8, NULL, NULL, '2023-09-21 04:51:51', '2023-09-21 04:51:51'),
(363, 'posr-20230921-105405', 45, 17, 1, 1, 1, 1, 3.46, 0, 0, 588.2, 553.2, 0, 0, 'Flat', 35, 35, NULL, NULL, NULL, 1, 4, NULL, 553.2, NULL, NULL, '2023-09-21 04:54:05', '2023-09-21 04:54:05'),
(364, 'posr-20230921-110812', 45, 17, 2, 1, 1, 1, 300, 0, 0, 3450, 3390, 0, 0, 'Flat', 60, 60, NULL, NULL, NULL, 1, 4, NULL, 3390, NULL, NULL, '2023-09-21 05:08:12', '2023-09-21 05:08:12'),
(365, 'posr-20230921-111053', 45, 17, 1, 1, 1, 1, 70, 0, 0, 805, 791, 0, 0, 'Flat', 14, 14, NULL, NULL, NULL, 1, 4, NULL, 791, NULL, NULL, '2023-09-21 05:10:53', '2023-09-21 05:10:53'),
(366, 'posr-20230921-111405', 45, 17, 1, 1, 1, 1, 1.63, 0, 0, 277.1, 260.1, 0, 0, 'Flat', 17, 17, NULL, NULL, NULL, 1, 4, NULL, 260.1, NULL, NULL, '2023-09-21 05:14:05', '2023-09-21 05:14:05'),
(367, 'posr-20230921-114633', 45, 17, 21, 1, 1, 1, 300, 0, 0, 3450, 3360, 0, 0, 'Flat', 90, 90, NULL, NULL, NULL, 1, 4, NULL, 3360, NULL, NULL, '2023-09-21 05:46:33', '2023-09-21 05:46:33'),
(368, 'posr-20230921-124951', 45, 17, 10, 1, 1, 1, 30, 0, 0, 345, 330, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 330, NULL, NULL, '2023-09-21 06:49:51', '2023-09-21 06:49:51'),
(369, 'posr-20230921-125436', 45, 17, 1, 1, 1, 1, 19, 0, 0, 218.5, 174.5, 0, 0, 'Flat', 44, 44, NULL, NULL, NULL, 1, 4, NULL, 174.5, 'Vangga Dim', NULL, '2023-09-21 06:54:36', '2023-09-21 06:54:36'),
(370, 'posr-20230921-125702', 45, 17, 22, 1, 1, 1, 60, 0, 0, 690, 672, 0, 0, 'Flat', 18, 18, NULL, NULL, NULL, 1, 4, NULL, 672, NULL, NULL, '2023-09-21 06:57:02', '2023-09-21 06:57:02'),
(371, 'posr-20230921-125740', 45, 17, 1, 1, 1, 1, 200, 0, 0, 2300, 2240, 0, 0, 'Flat', 60, 60, NULL, NULL, NULL, 1, 4, NULL, 2240, NULL, NULL, '2023-09-21 06:57:40', '2023-09-21 06:57:40'),
(372, 'posr-20230921-125811', 45, 17, 1, 1, 1, 1, 100, 0, 0, 1150, 1120, 0, 0, 'Flat', 30, 30, NULL, NULL, NULL, 1, 4, NULL, 1120, NULL, NULL, '2023-09-21 06:58:11', '2023-09-21 06:58:11'),
(373, 'posr-20230921-125859', 45, 17, 22, 1, 1, 1, 30, 0, 0, 345, 200, 0, 0, 'Flat', 145, 145, NULL, NULL, NULL, 1, 4, NULL, 200, 'Vangga Dim', NULL, '2023-09-21 06:58:59', '2023-09-21 06:58:59'),
(374, 'posr-20230921-010010', 45, 17, 22, 1, 1, 1, 1.93, 0, 0, 328.1, 308.1, 0, 0, 'Flat', 20, 20, NULL, NULL, NULL, 1, 4, NULL, 308.1, NULL, NULL, '2023-09-21 07:00:10', '2023-09-21 07:00:10'),
(375, 'posr-20230921-010101', 45, 17, 22, 1, 1, 1, 5, 0, 0, 3450, 3375, 0, 0, 'Flat', 75, 75, NULL, NULL, NULL, 1, 4, NULL, 3375, NULL, NULL, '2023-09-21 07:01:01', '2023-09-21 07:01:01'),
(376, 'posr-20230921-012556', 45, 17, 1, 1, 1, 1, 1.9, 0, 0, 323, 314, 0, 0, 'Flat', 9, 9, NULL, NULL, NULL, 1, 4, NULL, 314, NULL, NULL, '2023-09-21 07:25:56', '2023-09-21 07:25:56'),
(377, 'posr-20230921-012615', 45, 17, 1, 1, 1, 1, 7, 0, 0, 80.5, 80.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 80.5, NULL, NULL, '2023-09-21 07:26:15', '2023-09-21 07:26:15'),
(378, 'posr-20230921-013902', 45, 17, 1, 1, 1, 1, 0.76, 0, 0, 235.6, 230.6, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 230.6, NULL, NULL, '2023-09-21 07:39:02', '2023-09-21 07:39:02'),
(379, 'posr-20230921-014408', 45, 17, 1, 1, 1, 1, 1.78, 0, 0, 302.6, 300.6, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 300.6, NULL, NULL, '2023-09-21 07:44:08', '2023-09-21 07:44:08'),
(380, 'posr-20230921-014431', 45, 17, 1, 1, 1, 1, 18, 0, 0, 207, 207, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 207, NULL, NULL, '2023-09-21 07:44:31', '2023-09-21 07:44:31'),
(381, 'posr-20230921-020555', 45, 17, 1, 1, 1, 1, 4, 0, 0, 46, 46, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 46, NULL, NULL, '2023-09-21 08:05:55', '2023-09-21 08:05:55'),
(382, 'posr-20230921-020629', 45, 17, 21, 1, 1, 1, 100, 0, 0, 1150, 1120, 0, 0, 'Flat', 30, 30, NULL, NULL, NULL, 1, 4, NULL, 1120, NULL, NULL, '2023-09-21 08:06:29', '2023-09-21 08:06:29'),
(383, 'posr-20230921-022659', 45, 17, 1, 1, 1, 1, 72, 0, 0, 828, 792, 0, 0, 'Flat', 36, 36, NULL, NULL, NULL, 1, 4, NULL, 792, NULL, NULL, '2023-09-21 08:26:59', '2023-09-21 08:26:59'),
(384, 'posr-20230921-030248', 45, 17, 1, 1, 1, 1, 30, 0, 0, 345, 340, 0, 0, 'Flat', 21, 21, NULL, NULL, 16, 1, 4, NULL, 340, NULL, NULL, '2023-09-21 09:02:48', '2023-09-21 09:02:48'),
(385, 'posr-20230921-030335', 45, 17, 10, 1, 1, 1, 70, 0, 0, 805, 784, 0, 0, 'Flat', 21, 21, NULL, NULL, NULL, 1, 4, NULL, 784, NULL, NULL, '2023-09-21 09:03:35', '2023-09-21 09:03:35'),
(386, 'posr-20230921-032602', 45, 17, 23, 1, 1, 1, 1, 0, 0, 690, 660, 0, 0, 'Flat', 30, 30, NULL, NULL, NULL, 1, 4, NULL, 660, NULL, NULL, '2023-09-21 09:26:02', '2023-09-21 09:26:02'),
(387, 'posr-20230921-035712', 45, 17, 1, 1, 1, 1, 1.8, 0, 0, 306, 306, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 306, NULL, NULL, '2023-09-21 09:57:12', '2023-09-21 09:57:12'),
(388, 'posr-20230921-041600', 45, 17, 24, 1, 1, 1, 1.2, 0, 0, 372, 360, 0, 0, 'Flat', 12, 12, NULL, NULL, NULL, 1, 4, NULL, 360, NULL, NULL, '2023-09-21 10:16:00', '2023-09-21 10:16:00'),
(389, 'posr-20230921-041830', 45, 17, 1, 1, 1, 1, 12, 0, 0, 138, 135, 0, 0, 'Flat', 3, 3, NULL, NULL, NULL, 1, 4, NULL, 135, NULL, NULL, '2023-09-21 10:18:30', '2023-09-21 10:18:30'),
(390, 'posr-20230921-042514', 45, 17, 1, 1, 1, 1, 6, 0, 0, 69, 67, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 67, NULL, NULL, '2023-09-21 10:25:14', '2023-09-21 10:25:14'),
(391, 'posr-20230921-045614', 45, 17, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-21 10:56:14', '2023-09-21 10:56:14'),
(392, 'posr-20230921-045633', 45, 17, 1, 1, 1, 1, 4, 0, 0, 46, 46, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 46, NULL, NULL, '2023-09-21 10:56:33', '2023-09-21 10:56:33'),
(393, 'posr-20230921-050341', 45, 17, 1, 1, 1, 1, 5, 0, 0, 325, 325, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 325, NULL, NULL, '2023-09-21 11:03:41', '2023-09-21 11:03:41'),
(394, 'posr-20230921-050551', 45, 17, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-21 11:05:51', '2023-09-21 11:05:51'),
(395, 'posr-20230921-052922', 45, 17, 1, 1, 1, 1, 3.7, 0, 0, 629, 592, 0, 0, 'Flat', 37, 37, NULL, NULL, NULL, 1, 4, NULL, 592, NULL, NULL, '2023-09-21 11:29:22', '2023-09-21 11:29:22'),
(396, 'posr-20230921-061246', 45, 17, 1, 1, 1, 1, 120, 0, 0, 1380, 1320, 0, 0, 'Flat', 60, 60, NULL, NULL, NULL, 1, 4, NULL, 1320, NULL, NULL, '2023-09-21 12:12:46', '2023-09-21 12:12:46'),
(397, 'posr-20230921-061332', 45, 17, 1, 1, 1, 1, 30, 0, 0, 345, 330, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 330, NULL, NULL, '2023-09-21 12:13:32', '2023-09-21 12:13:32'),
(398, 'posr-20230921-061414', 45, 17, 1, 1, 1, 1, 12, 0, 0, 138, 135, 0, 0, 'Flat', 3, 3, NULL, NULL, NULL, 1, 4, NULL, 135, NULL, NULL, '2023-09-21 12:14:14', '2023-09-21 12:14:14'),
(399, 'posr-20230921-061709', 45, 17, 1, 1, 1, 3, 10.879999999999999, 0, 0, 474.6, 474.6, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 474.6, NULL, NULL, '2023-09-21 12:17:09', '2023-09-21 12:17:09'),
(400, 'posr-20230921-061957', 45, 17, 1, 1, 1, 1, 23.6, 0, 0, 7316, 6608, 0, 0, 'Flat', 708, 708, NULL, NULL, NULL, 1, 4, NULL, 6608, NULL, NULL, '2023-09-21 12:19:57', '2023-09-21 12:19:57'),
(401, 'posr-20230921-062710', 45, 17, 6, 1, 1, 1, 5.5, 0, 0, 935, 935, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 935, NULL, NULL, '2023-09-21 12:27:10', '2023-09-21 12:27:10'),
(402, 'posr-20230921-062742', 45, 17, 6, 1, 1, 1, 10, 0, 0, 650, 650, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 650, NULL, NULL, '2023-09-21 12:27:42', '2023-09-21 12:27:42'),
(403, 'posr-20230921-063222', 45, 17, 1, 1, 1, 1, 9, 0, 0, 103.5, 100.5, 0, 0, 'Flat', 3, 3, NULL, NULL, NULL, 1, 4, NULL, 100.5, NULL, NULL, '2023-09-21 12:32:22', '2023-09-21 12:32:22'),
(404, 'posr-20230921-064317', 45, 17, 1, 1, 1, 1, 1.78, 0, 0, 302.6, 302.6, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 302.6, NULL, NULL, '2023-09-21 12:43:17', '2023-09-21 12:43:17'),
(405, 'posr-20230921-064530', 45, 17, 1, 1, 1, 1, 0.58, 0, 0, 179.8, 174.8, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 174.8, NULL, NULL, '2023-09-21 12:45:30', '2023-09-21 12:45:30'),
(406, 'posr-20230921-064628', 45, 17, 1, 1, 1, 1, 0.5, 0, 0, 32.5, 33.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 1, 1, 4, NULL, 33.5, NULL, NULL, '2023-09-21 12:46:28', '2023-09-21 12:46:28'),
(407, 'posr-20230921-065902', 45, 17, 1, 1, 1, 1, 1.68, 0, 0, 285.6, 285.6, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 285.6, NULL, NULL, '2023-09-21 12:59:02', '2023-09-21 12:59:02'),
(408, 'posr-20230921-065939', 45, 17, 1, 1, 1, 1, 20, 0, 0, 230, 225, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 225, NULL, NULL, '2023-09-21 12:59:39', '2023-09-21 12:59:39'),
(409, 'posr-20230921-070023', 45, 17, 1, 1, 1, 1, 1.83, 0, 0, 567.3, 549.3, 0, 0, 'Flat', 18, 18, NULL, NULL, NULL, 1, 4, NULL, 549.3, NULL, NULL, '2023-09-21 13:00:23', '2023-09-21 13:00:23'),
(410, 'posr-20230921-070043', 45, 17, 1, 1, 1, 1, 4, 0, 0, 46, 46, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 46, NULL, NULL, '2023-09-21 13:00:43', '2023-09-21 13:00:43'),
(411, 'posr-20230921-070532', 45, 17, 1, 1, 1, 1, 1.79, 0, 0, 304.3, 299.3, 0, 0, 'Flat', 7, 7, NULL, NULL, 2, 1, 4, NULL, 299.3, NULL, NULL, '2023-09-21 13:05:32', '2023-09-21 13:05:32'),
(412, 'posr-20230921-070622', 45, 17, 1, 1, 1, 1, 1.7, 0, 0, 289, 290, 0, 0, 'Flat', NULL, 0, NULL, NULL, 1, 1, 4, NULL, 290, NULL, NULL, '2023-09-21 13:06:22', '2023-09-21 13:06:22'),
(413, 'posr-20230921-070706', 45, 17, 1, 1, 1, 1, 1.76, 0, 0, 299.2, 300.2, 0, 0, 'Flat', NULL, 0, NULL, NULL, 1, 1, 4, NULL, 300.2, NULL, NULL, '2023-09-21 13:07:06', '2023-09-21 13:07:06'),
(414, 'posr-20230921-071547', 45, 17, 25, 1, 1, 1, 1.87, 0, 0, 317.9, 317.9, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 317.9, NULL, NULL, '2023-09-21 13:15:47', '2023-09-21 13:15:47'),
(415, 'posr-20230921-072835', 45, 17, 1, 1, 1, 1, 1.73, 0, 0, 294.1, 294.1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 294.1, NULL, NULL, '2023-09-21 13:28:35', '2023-09-21 13:28:35'),
(416, 'posr-20230921-072904', 45, 17, 1, 1, 1, 1, 1.77, 0, 0, 300.9, 300.9, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 300.9, NULL, NULL, '2023-09-21 13:29:04', '2023-09-21 13:29:04'),
(417, 'posr-20230921-072935', 45, 17, 1, 1, 1, 1, 8, 0, 0, 92, 90, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-21 13:29:35', '2023-09-21 13:29:35'),
(418, 'posr-20230921-074906', 45, 17, 26, 1, 1, 1, 1.14, 0, 0, 353.4, 330.4, 0, 0, 'Flat', 23, 23, NULL, NULL, NULL, 1, 4, NULL, 330.4, NULL, NULL, '2023-09-21 13:49:06', '2023-09-21 13:49:06'),
(419, 'posr-20230921-075302', 45, 17, 1, 1, 1, 1, 30, 0, 0, 345, 330, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 330, NULL, NULL, '2023-09-21 13:53:02', '2023-09-21 13:53:02'),
(420, 'posr-20230921-081706', 45, 17, 1, 1, 1, 1, 30, 0, 0, 345, 330, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 330, NULL, NULL, '2023-09-21 14:17:06', '2023-09-21 14:17:06'),
(421, 'posr-20230921-081726', 45, 17, 1, 1, 1, 1, 2, 0, 0, 130, 130, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 130, NULL, NULL, '2023-09-21 14:17:26', '2023-09-21 14:17:26'),
(422, 'posr-20230921-082210', 45, 17, 27, 1, 1, 1, 1.7, 0, 0, 289, 290, 0, 0, 'Flat', NULL, 0, NULL, NULL, 1, 1, 4, NULL, 290, NULL, NULL, '2023-09-21 14:22:10', '2023-09-21 14:22:10'),
(423, 'posr-20230921-084750', 45, 17, 28, 1, 1, 1, 1.78, 0, 0, 302.6, 300.6, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 300.6, NULL, NULL, '2023-09-21 14:47:50', '2023-09-21 14:47:50'),
(424, 'posr-20230921-084827', 45, 17, 28, 1, 1, 1, 30, 0, 0, 345, 330, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 330, NULL, NULL, '2023-09-21 14:48:27', '2023-09-21 14:48:27'),
(425, 'posr-20230921-085518', 45, 17, 3, 1, 1, 1, 90, 0, 0, 1035, 945, 0, 0, 'Flat', 90, 90, NULL, NULL, NULL, 1, 4, NULL, 945, NULL, NULL, '2023-09-21 14:55:18', '2023-09-21 14:55:18'),
(426, 'posr-20230921-085630', 45, 17, 1, 1, 1, 1, 1.94, 0, 0, 329.8, 330.8, 0, 0, 'Flat', NULL, 0, NULL, NULL, 1, 1, 4, NULL, 330.8, NULL, NULL, '2023-09-21 14:56:30', '2023-09-21 14:56:30'),
(427, 'posr-20230921-085714', 45, 17, 1, 1, 1, 1, 1.63, 0, 0, 277.1, 277.1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 277.1, NULL, NULL, '2023-09-21 14:57:14', '2023-09-21 14:57:14'),
(428, 'posr-20230921-091526', 45, 17, 1, 1, 1, 1, 0.56, 0, 0, 173.6, 166.6, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 166.6, NULL, NULL, '2023-09-21 15:15:26', '2023-09-21 15:15:26'),
(429, 'posr-20230921-091641', 45, 17, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-21 15:16:41', '2023-09-21 15:16:41'),
(430, 'posr-20230921-092033', 45, 17, 6, 1, 1, 1, 53, 0, 0, 8215, 8215, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 8215, NULL, NULL, '2023-09-21 15:20:33', '2023-09-21 15:20:33'),
(431, 'posr-20230921-092157', 45, 17, 6, 1, 1, 1, 600, 0, 0, 7200, 7200, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 7200, NULL, NULL, '2023-09-21 15:21:57', '2023-09-21 15:21:57'),
(432, 'posr-20230922-082439', 45, 18, 29, 1, 1, 1, 25.4, 0, 0, 4318, 4191, 0, 0, 'Flat', 127, 127, NULL, NULL, NULL, 1, 4, NULL, 4191, NULL, NULL, '2023-09-22 02:24:39', '2023-09-22 02:24:39'),
(433, 'posr-20230922-085457', 45, 18, 10, 1, 1, 1, 100, 0, 0, 1125, 1100, 0, 0, 'Flat', 25, 25, NULL, NULL, NULL, 1, 4, NULL, 1100, NULL, NULL, '2023-09-22 02:54:57', '2023-09-22 02:54:57'),
(434, 'posr-20230922-085650', 45, 18, 30, 1, 1, 1, 10.4, 0, 0, 1768, 1718, 0, 0, 'Flat', 50, 50, NULL, NULL, NULL, 1, 4, NULL, 1718, NULL, NULL, '2023-09-22 02:56:50', '2023-09-22 02:56:50'),
(435, 'posr-20230922-092025', 45, 18, 31, 1, 1, 1, 12, 0, 0, 138, 138, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 138, NULL, NULL, '2023-09-22 03:20:25', '2023-09-22 03:20:25'),
(436, 'posr-20230922-093357', 45, 18, 1, 1, 1, 1, 0.94, 0, 0, 291.4, 291.4, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 291.4, NULL, NULL, '2023-09-22 03:33:57', '2023-09-22 03:33:57'),
(437, 'posr-20230922-094956', 45, 18, 32, 1, 1, 2, 5.9, 0, 0, 369, 369, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 369, NULL, NULL, '2023-09-22 03:49:56', '2023-09-22 03:49:56'),
(438, 'posr-20230922-101502', 45, 18, 33, 1, 1, 1, 3, 0, 0, 2100, 2100, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 2100, NULL, NULL, '2023-09-22 04:15:02', '2023-09-22 04:15:02'),
(439, 'posr-20230922-103529', 45, 18, 1, 1, 1, 1, 2.1, 0, 0, 357, 350, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2023-09-22 04:35:29', '2023-09-22 04:35:29'),
(440, 'posr-20230922-104847', 45, 18, 1, 1, 1, 1, 25.2, 0, 0, 17136, 17136, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 17136, NULL, NULL, '2023-09-22 04:48:47', '2023-09-22 04:48:47'),
(441, 'posr-20230922-120216', 45, 18, 34, 1, 1, 3, 35.99, 0, 0, 1429.5, 1429.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1429.5, NULL, NULL, '2023-09-22 06:02:16', '2023-09-22 06:02:16'),
(442, 'posr-20230922-121242', 45, 18, 1, 1, 1, 1, 300, 0, 0, 3450, 3450, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 3450, NULL, NULL, '2023-09-22 06:12:42', '2023-09-22 06:12:42'),
(443, 'posr-20230922-121742', 45, 18, 1, 1, 1, 1, 1.69, 0, 0, 295.75, 295.75, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 295.75, NULL, NULL, '2023-09-22 06:17:42', '2023-09-22 06:17:42'),
(444, 'posr-20230922-040852', 45, 18, 1, 1, 1, 1, 2.95, 0, 0, 501.5, 500.5, 0, 0, 'Flat', 1, 1, NULL, NULL, NULL, 1, 4, NULL, 500.5, NULL, NULL, '2023-09-22 10:08:52', '2023-09-22 10:08:52'),
(445, 'posr-20230922-041020', 45, 18, 1, 1, 1, 1, 1.33, 0, 0, 226.1, 230.1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 4, 1, 4, NULL, 230.1, NULL, NULL, '2023-09-22 10:10:20', '2023-09-22 10:10:20'),
(446, 'posr-20230922-041115', 45, 18, 1, 1, 1, 1, 1.9, 0, 0, 323, 315, 0, 0, 'Flat', 8, 8, NULL, NULL, NULL, 1, 4, NULL, 315, NULL, NULL, '2023-09-22 10:11:15', '2023-09-22 10:11:15'),
(447, 'posr-20230922-041310', 45, 18, 1, 1, 1, 1, 1.9, 0, 0, 323, 320, 0, 0, 'Flat', 3, 3, NULL, NULL, NULL, 1, 4, NULL, 320, NULL, NULL, '2023-09-22 10:13:10', '2023-09-22 10:13:10'),
(448, 'posr-20230922-041355', 45, 18, 1, 1, 1, 1, 1.9, 0, 0, 323, 315, 0, 0, 'Flat', 8, 8, NULL, NULL, NULL, 1, 4, NULL, 315, NULL, NULL, '2023-09-22 10:13:55', '2023-09-22 10:13:55'),
(449, 'posr-20230922-041436', 45, 18, 1, 1, 1, 1, 2, 0, 0, 340, 332, 0, 0, 'Flat', 8, 8, NULL, NULL, NULL, 1, 4, NULL, 332, NULL, NULL, '2023-09-22 10:14:36', '2023-09-22 10:14:36'),
(450, 'posr-20230922-041830', 45, 18, 1, 1, 1, 1, 22.3, 0, 0, 3791, 3456, 0, 0, 'Flat', 335, 335, NULL, NULL, NULL, 1, 4, NULL, 3456, NULL, NULL, '2023-09-22 10:18:30', '2023-09-22 10:18:30'),
(451, 'posr-20230922-041910', 45, 18, 1, 1, 1, 1, 1.6, 0, 0, 272, 270, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 270, NULL, NULL, '2023-09-22 10:19:10', '2023-09-22 10:19:10'),
(452, 'posr-20230922-042739', 45, 18, 1, 1, 1, 1, 1.9, 0, 0, 323, 315, 0, 0, 'Flat', 8, 8, NULL, NULL, NULL, 1, 4, NULL, 315, NULL, NULL, '2023-09-22 10:27:39', '2023-09-22 10:27:39'),
(453, 'posr-20230922-042931', 45, 18, 1, 1, 1, 1, 1.56, 0, 0, 265.2, 270.2, 0, 0, 'Flat', NULL, 0, NULL, NULL, 5, 1, 4, NULL, 270.2, NULL, NULL, '2023-09-22 10:29:31', '2023-09-22 10:29:31'),
(454, 'posr-20230922-043026', 45, 18, 1, 1, 1, 1, 5.89, 0, 0, 1001.3, 1000.3, 0, 0, 'Flat', 1, 1, NULL, NULL, NULL, 1, 4, NULL, 1000.3, NULL, NULL, '2023-09-22 10:30:26', '2023-09-22 10:30:26'),
(455, 'posr-20230922-043112', 45, 18, 1, 1, 1, 1, 1.67, 0, 0, 283.9, 292.9, 0, 0, 'Flat', NULL, 0, NULL, NULL, 9, 1, 4, NULL, 292.9, NULL, NULL, '2023-09-22 10:31:12', '2023-09-22 10:31:12'),
(456, 'posr-20230922-043211', 45, 18, 1, 1, 1, 1, 1.82, 0, 0, 309.4, 309.4, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 309.4, NULL, NULL, '2023-09-22 10:32:11', '2023-09-22 10:32:11'),
(457, 'posr-20230922-044150', 45, 18, 1, 1, 1, 1, 1.84, 0, 0, 312.8, 321.8, 0, 0, 'Flat', NULL, 0, NULL, NULL, 9, 1, 4, NULL, 321.8, NULL, NULL, '2023-09-22 10:41:50', '2023-09-22 10:41:50'),
(458, 'posr-20230922-050206', 45, 18, 6, 1, 1, 1, 2, 0, 0, 310, 310, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 310, NULL, NULL, '2023-09-22 11:02:06', '2023-09-22 11:02:06'),
(459, 'posr-20230922-050342', 45, 18, 6, 1, 1, 1, 350, 0, 0, 3850, 3850, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 3850, NULL, NULL, '2023-09-22 11:03:42', '2023-09-22 11:03:42'),
(460, 'posr-20230922-050900', 45, 18, 1, 1, 1, 1, 1.5, 0, 0, 255, 262, 0, 0, 'Flat', NULL, 0, NULL, NULL, 7, 1, 4, NULL, 262, NULL, NULL, '2023-09-22 11:09:00', '2023-09-22 11:09:00'),
(461, 'posr-20230922-050957', 45, 18, 1, 1, 1, 1, 2, 0, 0, 340, 348, 0, 0, 'Flat', NULL, 0, NULL, NULL, 8, 1, 4, NULL, 348, NULL, NULL, '2023-09-22 11:09:57', '2023-09-22 11:09:57'),
(462, 'posr-20230922-051226', 45, 18, 1, 1, 1, 1, 1.58, 0, 0, 268.6, 267.6, 0, 0, 'Flat', 1, 1, NULL, NULL, NULL, 1, 4, NULL, 267.6, NULL, NULL, '2023-09-22 11:12:26', '2023-09-22 11:12:26'),
(463, 'posr-20230922-051351', 45, 18, 1, 1, 1, 1, 1.56, 0, 0, 265.2, 262.2, 0, 0, 'Flat', 3, 3, NULL, NULL, NULL, 1, 4, NULL, 262.2, NULL, NULL, '2023-09-22 11:13:51', '2023-09-22 11:13:51'),
(464, 'posr-20230922-051429', 45, 18, 1, 1, 1, 1, 1.69, 0, 0, 287.3, 288.3, 0, 0, 'Flat', NULL, 0, NULL, NULL, 1, 1, 4, NULL, 288.3, NULL, NULL, '2023-09-22 11:14:29', '2023-09-22 11:14:29'),
(465, 'posr-20230922-051512', 45, 18, 1, 1, 1, 1, 1.65, 0, 0, 280.5, 285.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 5, 1, 4, NULL, 285.5, NULL, NULL, '2023-09-22 11:15:12', '2023-09-22 11:15:12'),
(466, 'posr-20230922-051539', 45, 18, 1, 1, 1, 1, 1.53, 0, 0, 260.1, 260.1, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 260.1, NULL, NULL, '2023-09-22 11:15:39', '2023-09-22 11:15:39'),
(467, 'posr-20230922-051632', 45, 18, 1, 1, 1, 1, 1.3, 0, 0, 221, 210, 0, 0, 'Flat', 11, 11, NULL, NULL, NULL, 1, 4, NULL, 210, NULL, NULL, '2023-09-22 11:16:32', '2023-09-22 11:16:32'),
(468, 'posr-20230922-051713', 45, 18, 1, 1, 1, 1, 1.5, 0, 0, 255, 250, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 250, NULL, NULL, '2023-09-22 11:17:13', '2023-09-22 11:17:13'),
(469, 'posr-20230922-051815', 45, 18, 1, 1, 1, 1, 1.54, 0, 0, 261.8, 262.8, 0, 0, 'Flat', 0, 0, NULL, NULL, 1, 1, 4, NULL, 262.8, NULL, NULL, '2023-09-22 11:18:15', '2023-09-22 11:18:15'),
(470, 'posr-20230922-051902', 45, 18, 1, 1, 1, 1, 1.74, 0, 0, 295.8, 293.8, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 293.8, NULL, NULL, '2023-09-22 11:19:02', '2023-09-22 11:19:02'),
(471, 'posr-20230922-051953', 45, 18, 1, 1, 1, 1, 1.52, 0, 0, 258.4, 260.4, 0, 0, 'Flat', NULL, 0, NULL, NULL, 2, 1, 4, NULL, 260.4, NULL, NULL, '2023-09-22 11:19:53', '2023-09-22 11:19:53'),
(472, 'posr-20230922-052054', 45, 18, 1, 1, 1, 1, 1.39, 0, 0, 236.3, 240.3, 0, 0, 'Flat', NULL, 0, NULL, NULL, 4, 1, 4, NULL, 240.3, NULL, NULL, '2023-09-22 11:20:54', '2023-09-22 11:20:54'),
(473, 'posr-20230922-052137', 45, 18, 1, 1, 1, 1, 2.63, 0, 0, 447.1, 450.1, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 450.1, NULL, NULL, '2023-09-22 11:21:37', '2023-09-22 11:21:37'),
(474, 'posr-20230922-052305', 45, 18, 1, 1, 1, 1, 1.6, 0, 0, 272, 262, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 262, NULL, NULL, '2023-09-22 11:23:05', '2023-09-22 11:23:05'),
(475, 'posr-20230922-052331', 45, 18, 1, 1, 1, 1, 0.5, 0, 0, 350, 350, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2023-09-22 11:23:31', '2023-09-22 11:23:31'),
(476, 'posr-20230922-052351', 45, 18, 1, 1, 1, 1, 1, 0, 0, 700, 700, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 700, NULL, NULL, '2023-09-22 11:23:51', '2023-09-22 11:23:51'),
(477, 'posr-20230922-052532', 45, 18, 1, 1, 1, 1, 7, 0, 0, 4900, 4930, 0, 0, 'Flat', NULL, 0, NULL, NULL, 30, 1, 4, NULL, 4930, NULL, NULL, '2023-09-22 11:25:32', '2023-09-22 11:25:32'),
(478, 'posr-20230922-052554', 45, 18, 1, 1, 1, 1, 1.14, 0, 0, 798, 798, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 798, NULL, NULL, '2023-09-22 11:25:54', '2023-09-22 11:25:54'),
(479, 'posr-20230922-052709', 45, 18, 1, 1, 1, 1, 7.5, 0, 0, 5250, 5250, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 5250, NULL, NULL, '2023-09-22 11:27:09', '2023-09-22 11:27:09'),
(480, 'posr-20230922-052728', 45, 18, 1, 1, 1, 1, 1.42, 0, 0, 994, 994, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 994, NULL, NULL, '2023-09-22 11:27:28', '2023-09-22 11:27:28'),
(481, 'posr-20230922-052742', 45, 18, 1, 1, 1, 1, 0.5, 0, 0, 350, 350, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2023-09-22 11:27:42', '2023-09-22 11:27:42'),
(482, 'posr-20230922-052759', 45, 18, 1, 1, 1, 1, 1.28, 0, 0, 896, 896, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 896, NULL, NULL, '2023-09-22 11:27:59', '2023-09-22 11:27:59'),
(483, 'posr-20230922-052814', 45, 18, 1, 1, 1, 1, 4, 0, 0, 2800, 2800, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 2800, NULL, NULL, '2023-09-22 11:28:14', '2023-09-22 11:28:14'),
(484, 'posr-20230922-052830', 45, 18, 1, 1, 1, 1, 0.714, 0, 0, 499.8, 499.8, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 499.8, NULL, NULL, '2023-09-22 11:28:30', '2023-09-22 11:28:30'),
(485, 'posr-20230922-052849', 45, 18, 1, 1, 1, 1, 1.96, 0, 0, 1372, 1372, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1372, NULL, NULL, '2023-09-22 11:28:49', '2023-09-22 11:28:49'),
(486, 'posr-20230922-052917', 45, 18, 1, 1, 1, 1, 2.5, 0, 0, 1750, 1750, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1750, NULL, NULL, '2023-09-22 11:29:17', '2023-09-22 11:29:17'),
(487, 'posr-20230922-053005', 45, 18, 1, 1, 1, 1, 0.92, 0, 0, 644, 644, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 644, NULL, NULL, '2023-09-22 11:30:05', '2023-09-22 11:30:05'),
(488, 'posr-20230922-053017', 45, 18, 1, 1, 1, 1, 0.5, 0, 0, 350, 350, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2023-09-22 11:30:17', '2023-09-22 11:30:17'),
(489, 'posr-20230922-053122', 45, 18, 1, 1, 1, 1, 7, 0, 0, 4900, 4725, 0, 0, 'Flat', 175, 175, NULL, NULL, NULL, 1, 4, NULL, 4725, NULL, NULL, '2023-09-22 11:31:22', '2023-09-22 11:31:22'),
(490, 'posr-20230922-053203', 45, 18, 1, 1, 1, 1, 7, 0, 0, 4900, 4900, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 4900, NULL, NULL, '2023-09-22 11:32:03', '2023-09-22 11:32:03'),
(491, 'posr-20230922-053722', 45, 18, 1, 1, 1, 1, 2.89, 0, 0, 491.3, 478.3, 0, 0, 'Flat', 13, 13, NULL, NULL, NULL, 1, 4, NULL, 478.3, NULL, NULL, '2023-09-22 11:37:22', '2023-09-22 11:37:22'),
(492, 'posr-20230922-053757', 45, 18, 6, 1, 1, 1, 5, 0, 0, 3500, 3500, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 3500, NULL, NULL, '2023-09-22 11:37:57', '2023-09-22 11:37:57'),
(493, 'posr-20230922-053914', 45, 18, 6, 1, 1, 1, 3, 0, 0, 2100, 2100, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 2100, NULL, NULL, '2023-09-22 11:39:14', '2023-09-22 11:39:14'),
(494, 'posr-20230922-054002', 45, 18, 1, 1, 1, 1, 4, 0, 0, 46, 46, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 46, NULL, NULL, '2023-09-22 11:40:02', '2023-09-22 11:40:02'),
(495, 'posr-20230922-054151', 45, 18, 1, 1, 1, 1, 130, 0, 0, 1495, 1456, 0, 0, 'Flat', 39, 39, NULL, NULL, NULL, 1, 4, NULL, 1456, NULL, NULL, '2023-09-22 11:41:51', '2023-09-22 11:41:51'),
(496, 'posr-20230922-054227', 45, 18, 1, 1, 1, 1, 30, 0, 0, 345, 330, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 330, NULL, NULL, '2023-09-22 11:42:27', '2023-09-22 11:42:27'),
(497, 'posr-20230922-054831', 45, 18, 1, 1, 1, 1, 8, 0, 0, 92, 92, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 92, NULL, NULL, '2023-09-22 11:48:31', '2023-09-22 11:48:31'),
(498, 'posr-20230922-061337', 45, 18, 1, 1, 1, 1, 1.58, 0, 0, 276.5, 266.5, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 266.5, NULL, NULL, '2023-09-22 12:13:37', '2023-09-22 12:13:37'),
(499, 'posr-20230922-061506', 45, 18, 1, 1, 1, 1, 30, 0, 0, 345, 345, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 345, NULL, NULL, '2023-09-22 12:15:06', '2023-09-22 12:15:06'),
(500, 'posr-20230922-061643', 45, 18, 1, 1, 1, 1, 180, 0, 0, 2025, 1980, 0, 0, 'Flat', 45, 45, NULL, NULL, NULL, 1, 4, NULL, 1980, NULL, NULL, '2023-09-22 12:16:43', '2023-09-22 12:16:43'),
(501, 'posr-20230922-061708', 45, 18, 1, 1, 1, 1, 30, 0, 0, 337.5, 337.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 337.5, NULL, NULL, '2023-09-22 12:17:08', '2023-09-22 12:17:08'),
(502, 'posr-20230922-061747', 45, 18, 1, 1, 1, 1, 5, 0, 0, 56.25, 56.25, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 56.25, NULL, NULL, '2023-09-22 12:17:47', '2023-09-22 12:17:47'),
(503, 'posr-20230922-061825', 45, 18, 1, 1, 1, 1, 4, 0, 0, 45, 45, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 45, NULL, NULL, '2023-09-22 12:18:25', '2023-09-22 12:18:25'),
(504, 'posr-20230922-061853', 45, 18, 1, 1, 1, 1, 8, 0, 0, 90, 90, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-22 12:18:53', '2023-09-22 12:18:53'),
(505, 'posr-20230922-062133', 45, 18, 1, 1, 1, 1, 22.4, 0, 0, 6720, 6720, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 6720, NULL, NULL, '2023-09-22 12:21:33', '2023-09-22 12:21:33'),
(506, 'posr-20230922-062323', 45, 18, 1, 1, 1, 1, 0.721, 0, 0, 937.3, 830.3, 0, 0, 'Flat', 107, 107, NULL, NULL, NULL, 1, 4, NULL, 830.3, NULL, NULL, '2023-09-22 12:23:23', '2023-09-22 12:23:23'),
(507, 'posr-20230922-062651', 45, 18, 1, 1, 1, 1, 2.3, 0, 0, 1495, 1445, 0, 0, 'Flat', 50, 50, NULL, NULL, NULL, 1, 4, NULL, 1445, NULL, NULL, '2023-09-22 12:26:51', '2023-09-22 12:26:51'),
(508, 'posr-20230922-062848', 45, 18, 1, 1, 1, 1, 0.86, 0, 0, 559, 559, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 559, NULL, NULL, '2023-09-22 12:28:48', '2023-09-22 12:28:48'),
(509, 'posr-20230922-062930', 45, 18, 1, 1, 1, 1, 3, 0, 0, 2100, 2070, 0, 0, 'Flat', 30, 30, NULL, NULL, NULL, 1, 4, NULL, 2070, NULL, NULL, '2023-09-22 12:29:30', '2023-09-22 12:29:30'),
(510, 'posr-20230922-062956', 45, 18, 1, 1, 1, 1, 4, 0, 0, 45, 38, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 38, NULL, NULL, '2023-09-22 12:29:56', '2023-09-22 12:29:56'),
(511, 'posr-20230922-063427', 45, 18, 1, 1, 1, 1, 10, 0, 0, 112.5, 112.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 112.5, NULL, NULL, '2023-09-22 12:34:27', '2023-09-22 12:34:27'),
(512, 'posr-20230922-064133', 45, 18, 2, 1, 1, 1, 300, 0, 0, 3300, 3300, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 3300, NULL, NULL, '2023-09-20 18:00:00', '2023-09-22 12:41:33'),
(513, 'posr-20230922-064617', 45, 18, 38, 1, 1, 1, 130, 0, 0, 1456, 1456, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1456, NULL, NULL, '2023-09-21 18:00:00', '2023-09-22 12:46:17'),
(514, 'posr-20230922-065308', 45, 18, 1, 1, 1, 1, 350, 0, 0, 3850, 3850, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 3850, NULL, NULL, '2023-09-22 12:53:08', '2023-09-22 12:53:08'),
(515, 'posr-20230922-065438', 45, 18, 1, 1, 1, 1, 3, 0, 0, 2400, 2400, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 2400, NULL, NULL, '2023-09-22 12:54:38', '2023-09-22 12:54:38'),
(516, 'posr-20230922-065521', 45, 18, 1, 1, 1, 1, 2, 0, 0, 1400, 1380, 0, 0, 'Flat', 20, 20, NULL, NULL, NULL, 1, 4, NULL, 1380, NULL, NULL, '2023-09-22 12:55:21', '2023-09-22 12:55:21'),
(517, 'posr-20230922-070730', 45, 18, 1, 1, 1, 1, 8, 0, 0, 90, 90, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-22 13:07:30', '2023-09-22 13:07:30'),
(518, 'posr-20230922-071337', 45, 18, 1, 1, 1, 1, 60, 0, 0, 720, 720, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 720, NULL, NULL, '2023-09-22 13:13:37', '2023-09-22 13:13:37'),
(519, 'posr-20230923-103150', 45, 19, 1, 1, 1, 1, 0.5, 0, 0, 350, 350, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2023-09-23 04:31:50', '2023-09-23 04:31:50'),
(520, 'posr-20230923-110649', 45, 19, 1, 1, 1, 3, 32.69, 0, 0, 909.5, 909.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 909.5, NULL, NULL, '2023-09-23 05:06:49', '2023-09-23 05:06:49'),
(521, 'posr-20230923-114811', 45, 19, 40, 1, 1, 1, 1, 0, 0, 700, 700, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 700, NULL, NULL, '2023-09-23 05:48:11', '2023-09-23 05:48:11'),
(522, 'posr-20230923-120613', 45, 19, 1, 1, 1, 1, 0.5, 0, 0, 350, 350, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 350, NULL, NULL, '2023-09-23 06:06:13', '2023-09-23 06:06:13'),
(523, 'posr-20230923-123708', 45, 19, 1, 1, 1, 2, 2.1, 0, 0, 630, 630, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 630, NULL, NULL, '2023-09-23 06:37:08', '2023-09-23 06:37:08'),
(524, 'posr-20230923-123914', 45, 19, 1, 1, 1, 1, 2.02, 0, 0, 353.5, 353.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 353.5, NULL, NULL, '2023-09-23 06:39:14', '2023-09-23 06:39:14'),
(525, 'posr-20230923-124028', 45, 19, 1, 1, 1, 1, 10, 0, 0, 112.5, 112.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 112.5, NULL, NULL, '2023-09-23 06:40:28', '2023-09-23 06:40:28'),
(526, 'posr-20230923-010258', 45, 19, 1, 1, 1, 1, 1.28, 0, 0, 224, 214, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 214, NULL, NULL, '2023-09-23 07:02:58', '2023-09-23 07:02:58'),
(527, 'posr-20230923-010636', 45, 19, 1, 1, 1, 1, 30, 0, 0, 337.5, 240.5, 0, 0, 'Flat', 97, 97, NULL, NULL, NULL, 1, 4, NULL, 240.5, 'Vangga Dim', NULL, '2023-09-23 07:06:36', '2023-09-23 07:06:36'),
(528, 'posr-20230923-010657', 45, 19, 1, 1, 1, 1, 2, 0, 0, 130, 130, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 130, NULL, NULL, '2023-09-23 07:06:57', '2023-09-23 07:06:57'),
(529, 'posr-20230923-012957', 45, 19, 2, 1, 1, 1, 300, 0, 0, 3375, 3300, 0, 0, 'Flat', 75, 75, NULL, NULL, NULL, 1, 4, NULL, 3300, NULL, NULL, '2023-09-23 07:29:57', '2023-09-23 07:29:57'),
(530, 'posr-20230923-013201', 45, 19, 38, 1, 1, 1, 120, 0, 0, 1350, 1332, 0, 0, 'Flat', 18, 18, NULL, NULL, NULL, 1, 4, NULL, 1332, NULL, NULL, '2023-09-23 07:32:01', '2023-09-23 07:32:01'),
(531, 'posr-20230923-014153', 45, 19, 38, 1, 1, 1, 26.8, 0, 0, 4690, 4288, 0, 0, 'Flat', 402, 402, NULL, NULL, NULL, 1, 4, NULL, 4288, NULL, NULL, '2023-09-23 07:41:53', '2023-09-23 07:41:53'),
(532, 'posr-20230923-014307', 45, 19, 38, 1, 1, 1, 31.2, 0, 0, 9360, 8750, 0, 0, 'Flat', 610, 610, NULL, NULL, NULL, 1, 4, NULL, 8750, NULL, NULL, '2023-09-23 07:43:07', '2023-09-23 07:43:07'),
(533, 'posr-20230923-014455', 45, 19, 38, 1, 1, 1, 2, 0, 0, 1600, 1600, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1600, 'Beef Bone', NULL, '2023-09-23 07:44:55', '2023-09-23 07:44:55'),
(534, 'posr-20230923-023457', 45, 19, 41, 1, 1, 1, 0.92, 0, 0, 276, 276, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 276, NULL, NULL, '2023-09-23 08:34:57', '2023-09-23 08:34:57'),
(535, 'posr-20230923-025024', 45, 19, 42, 1, 1, 1, 30, 0, 0, 337.5, 335.5, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 335.5, NULL, NULL, '2023-09-23 08:50:24', '2023-09-23 08:50:24'),
(536, 'posr-20230923-025313', 45, 19, 1, 1, 1, 1, 1.8, 0, 0, 315, 306, 0, 0, 'Flat', 9, 9, NULL, NULL, NULL, 1, 4, NULL, 306, NULL, NULL, '2023-09-23 08:53:13', '2023-09-23 08:53:13'),
(537, 'posr-20230923-025342', 45, 19, 1, 1, 1, 1, 2.8, 0, 0, 840, 840, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 840, NULL, NULL, '2023-09-23 08:53:42', '2023-09-23 08:53:42'),
(538, 'posr-20230923-025420', 45, 19, 1, 1, 1, 1, 30, 0, 0, 337.5, 335.5, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 335.5, NULL, NULL, '2023-09-23 08:54:20', '2023-09-23 08:54:20'),
(539, 'posr-20230923-025513', 45, 19, 21, 1, 1, 1, 100, 0, 0, 1125, 1100, 0, 0, 'Flat', 25, 25, NULL, NULL, NULL, 1, 4, NULL, 1100, NULL, NULL, '2023-09-23 08:55:13', '2023-09-23 08:55:13'),
(540, 'posr-20230923-025757', 45, 19, 1, 1, 1, 1, 30, 0, 0, 337.5, 335.5, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 335.5, NULL, NULL, '2023-09-23 08:57:57', '2023-09-23 08:57:57'),
(541, 'posr-20230923-025757', 45, 19, 1, 1, 1, 1, 30, 0, 0, 337.5, 335.5, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 335.5, NULL, NULL, '2023-09-23 08:57:57', '2023-09-23 08:57:57'),
(542, 'posr-20230923-031116', 45, 19, 1, 1, 1, 1, 12, 0, 0, 135, 135, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 135, NULL, NULL, '2023-09-23 09:11:16', '2023-09-23 09:11:16');
INSERT INTO `sales` (`id`, `reference_no`, `user_id`, `cash_register_id`, `customer_id`, `warehouse_id`, `biller_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_price`, `grand_total`, `order_tax_rate`, `order_tax`, `order_discount_type`, `order_discount_value`, `order_discount`, `coupon_id`, `coupon_discount`, `shipping_cost`, `sale_status`, `payment_status`, `document`, `paid_amount`, `sale_note`, `staff_note`, `created_at`, `updated_at`) VALUES
(543, 'posr-20230923-033122', 45, 19, 1, 1, 1, 1, 1.7, 0, 0, 297.5, 297.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 297.5, NULL, NULL, '2023-09-23 09:31:22', '2023-09-23 09:31:22'),
(544, 'posr-20230923-033606', 45, 19, 10, 1, 1, 1, 60, 0, 0, 675, 660, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 660, NULL, NULL, '2023-09-23 09:36:06', '2023-09-23 09:36:06'),
(545, 'posr-20230923-033644', 45, 19, 1, 1, 1, 1, 6, 0, 0, 67.5, 65.5, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 65.5, NULL, NULL, '2023-09-23 09:36:44', '2023-09-23 09:36:44'),
(546, 'posr-20230923-034043', 45, 19, 1, 1, 1, 1, 100, 0, 0, 1125, 1100, 0, 0, 'Flat', 25, 25, NULL, NULL, NULL, 1, 4, NULL, 1100, NULL, NULL, '2023-09-23 09:40:43', '2023-09-23 09:40:43'),
(547, 'posr-20230923-034729', 45, 19, 22, 1, 1, 2, 35, 0, 0, 3830, 3705, 0, 0, 'Flat', 125, 125, NULL, NULL, NULL, 1, 4, NULL, 3705, NULL, NULL, '2023-09-23 09:47:29', '2023-09-23 09:47:29'),
(548, 'posr-20230923-035550', 45, 19, 44, 1, 1, 1, 0.5, 0, 0, 350, 340, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 340, NULL, NULL, '2023-09-23 09:55:50', '2023-09-23 09:55:50'),
(549, 'posr-20230923-035843', 45, 19, 1, 1, 1, 1, 0.25, 0, 0, 175, 170, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 170, NULL, NULL, '2023-09-23 09:58:43', '2023-09-23 09:58:43'),
(550, 'posr-20230923-040707', 45, 19, 45, 1, 1, 1, 60, 0, 0, 675, 540, 0, 0, 'Flat', 135, 135, NULL, NULL, NULL, 1, 4, NULL, 540, 'Vangga Dim', NULL, '2023-09-23 10:07:07', '2023-09-23 10:07:07'),
(551, 'posr-20230923-041635', 45, 19, 46, 1, 1, 1, 7.7, 0, 0, 1347.5, 1300.5, 0, 0, 'Flat', 47, 47, NULL, NULL, NULL, 1, 4, NULL, 1300.5, NULL, NULL, '2023-09-23 10:16:35', '2023-09-23 10:16:35'),
(552, 'posr-20230923-041949', 45, 19, 46, 1, 1, 1, 72, 0, 0, 810, 720, 0, 0, 'Flat', 90, 90, NULL, NULL, NULL, 1, 4, NULL, 720, 'Vangga Dim', NULL, '2023-09-23 10:19:49', '2023-09-23 10:19:49'),
(553, 'posr-20230923-044454', 45, 19, 1, 1, 1, 1, 3.6, 0, 0, 1080, 1040, 0, 0, 'Flat', 40, 40, NULL, NULL, NULL, 1, 4, NULL, 1040, NULL, NULL, '2023-09-23 10:44:54', '2023-09-23 10:44:54'),
(554, 'posr-20230923-045528', 45, 19, 1, 1, 1, 1, 0.78, 0, 0, 546, 530, 0, 0, 'Flat', 16, 16, NULL, NULL, NULL, 1, 4, NULL, 530, NULL, NULL, '2023-09-23 10:55:28', '2023-09-23 10:55:28'),
(555, 'posr-20230923-050144', 45, 19, 1, 1, 1, 2, 31.7, 0, 0, 627.5, 627.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 627.5, NULL, NULL, '2023-09-23 11:01:44', '2023-09-23 11:01:44'),
(556, 'posr-20230923-050438', 45, 19, 47, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-23 11:04:38', '2023-09-23 11:04:38'),
(557, 'posr-20230923-060514', 45, 19, 1, 1, 1, 1, 150, 0, 0, 1650, 1650, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1650, NULL, NULL, '2023-09-23 12:05:14', '2023-09-23 12:05:14'),
(558, 'posr-20230923-071100', 45, 19, 48, 1, 1, 1, 0.8, 0, 0, 240, 240, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 240, NULL, NULL, '2023-09-23 13:11:00', '2023-09-23 13:11:00'),
(559, 'posr-20230923-072027', 45, 19, 50, 1, 1, 1, 3.6, 0, 0, 594, 590, 0, 0, 'Flat', 4, 4, NULL, NULL, NULL, 1, 4, NULL, 590, NULL, NULL, '2023-09-23 13:20:27', '2023-09-23 13:20:27'),
(560, 'posr-20230923-072208', 45, 19, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-23 13:22:08', '2023-09-23 13:22:08'),
(561, 'posr-20230923-072446', 45, 19, 1, 1, 1, 1, 4, 0, 0, 2800, 2720, 0, 0, 'Flat', 80, 80, NULL, NULL, NULL, 1, 4, NULL, 2720, NULL, NULL, '2023-09-23 13:24:46', '2023-09-23 13:24:46'),
(562, 'posr-20230923-073103', 45, 19, 51, 1, 1, 3, 3.7800000000000002, 0, 0, 667.6, 665.6, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 665.6, NULL, NULL, '2023-09-23 13:31:03', '2023-09-23 13:31:03'),
(563, 'posr-20230923-073740', 45, 19, 1, 1, 1, 1, 1.75, 0, 0, 288.75, 288.75, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 288.75, NULL, NULL, '2023-09-23 13:37:40', '2023-09-23 13:37:40'),
(564, 'posr-20230923-073805', 45, 19, 1, 1, 1, 1, 30, 0, 0, 337.5, 335.5, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 335.5, NULL, NULL, '2023-09-23 13:38:05', '2023-09-23 13:38:05'),
(565, 'posr-20230923-075207', 45, 19, 1, 1, 1, 1, 1, 0, 0, 65, 60, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 60, NULL, NULL, '2023-09-23 13:52:07', '2023-09-23 13:52:07'),
(566, 'posr-20230923-080357', 45, 19, 52, 1, 1, 2, 1.67, 0, 0, 1201, 1200, 0, 0, 'Flat', 1, 1, NULL, NULL, NULL, 1, 4, NULL, 1200, NULL, NULL, '2023-09-23 14:03:57', '2023-09-23 14:03:57'),
(567, 'posr-20230924-100917', 45, 20, 10, 1, 1, 1, 100, 0, 0, 1125, 1100, 0, 0, 'Flat', 25, 25, NULL, NULL, NULL, 1, 4, NULL, 1100, NULL, NULL, '2023-09-24 04:09:17', '2023-09-24 04:09:17'),
(568, 'posr-20230924-101014', 45, 20, 17, 1, 1, 1, 30, 0, 0, 337.5, 325.5, 0, 0, 'Flat', 12, 12, NULL, NULL, NULL, 1, 4, NULL, 325.5, NULL, NULL, '2023-09-24 04:10:14', '2023-09-24 04:10:14'),
(569, 'posr-20230924-101741', 45, 20, 53, 1, 1, 1, 1.88, 0, 0, 329, 330, 0, 0, 'Flat', NULL, 0, NULL, NULL, 1, 1, 4, NULL, 330, NULL, NULL, '2023-09-24 04:17:41', '2023-09-24 04:17:41'),
(570, 'posr-20230924-104221', 45, 20, 54, 1, 1, 1, 1.98, 0, 0, 346.5, 346.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 346.5, NULL, NULL, '2023-09-24 04:42:21', '2023-09-24 04:42:21'),
(571, 'posr-20230924-110957', 45, 20, 54, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-24 05:09:57', '2023-09-24 05:09:57'),
(572, 'posr-20230924-111834', 45, 20, 36, 1, 1, 1, 300, 0, 0, 3375, 3300, 0, 0, 'Flat', 75, 75, NULL, NULL, NULL, 1, 4, NULL, 3300, NULL, NULL, '2023-09-24 05:18:34', '2023-09-24 05:18:34'),
(573, 'posr-20230924-112344', 45, 20, 1, 1, 1, 1, 1.8, 0, 0, 315, 315, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 315, NULL, NULL, '2023-09-24 05:23:44', '2023-09-24 05:23:44'),
(574, 'posr-20230924-113422', 45, 20, 55, 1, 1, 2, 4.5, 0, 0, 77.5, 78.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 1, 1, 4, NULL, 78.5, NULL, NULL, '2023-09-24 05:34:22', '2023-09-24 05:34:22'),
(575, 'posr-20230924-115759', 45, 20, 1, 1, 1, 1, 180, 0, 0, 2025, 1980, 0, 0, 'Flat', 45, 45, NULL, NULL, NULL, 1, 4, NULL, 1980, NULL, NULL, '2023-09-24 05:57:59', '2023-09-24 05:57:59'),
(576, 'posr-20230924-123152', 45, 20, 1, 1, 1, 1, 6.9, 0, 0, 1207.5, 1200.5, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 1200.5, NULL, NULL, '2023-09-24 06:31:52', '2023-09-24 06:31:52'),
(577, 'posr-20230924-124708', 45, 20, 40, 1, 1, 1, 2, 0, 0, 330, 330, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 330, NULL, NULL, '2023-09-24 06:47:08', '2023-09-24 06:47:08'),
(578, 'posr-20230924-124936', 45, 20, 40, 1, 1, 1, 20, 0, 0, 154, 154, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 154, NULL, NULL, '2023-09-24 06:49:36', '2023-09-24 06:49:36'),
(579, 'posr-20230924-010807', 45, 20, 56, 1, 1, 1, 1.84, 0, 0, 322, 322, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 322, NULL, NULL, '2023-09-24 07:08:07', '2023-09-24 07:08:07'),
(580, 'posr-20230924-040223', 45, 20, 1, 1, 1, 1, 1.89, 0, 0, 330.75, 332.75, 0, 0, 'Flat', NULL, 0, NULL, NULL, 2, 1, 4, NULL, 332.75, NULL, NULL, '2023-09-24 10:02:23', '2023-09-24 10:02:23'),
(581, 'posr-20230924-040313', 45, 20, 1, 1, 1, 1, 2, 0, 0, 130, 130, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 130, NULL, NULL, '2023-09-24 10:03:13', '2023-09-24 10:03:13'),
(582, 'posr-20230924-040337', 45, 20, 1, 1, 1, 1, 1, 0, 0, 700, 700, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 700, NULL, NULL, '2023-09-24 10:03:37', '2023-09-24 10:03:37'),
(583, 'posr-20230924-040402', 45, 20, 1, 1, 1, 1, 2, 0, 0, 1400, 1400, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1400, NULL, NULL, '2023-09-24 10:04:02', '2023-09-24 10:04:02'),
(584, 'posr-20230924-040659', 45, 20, 1, 1, 1, 1, 30, 0, 0, 337.5, 360.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 23, 1, 4, NULL, 360.5, 'Try Taka Babod', NULL, '2023-09-24 10:06:59', '2023-09-24 10:06:59'),
(585, 'posr-20230924-040728', 45, 20, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-24 10:07:28', '2023-09-24 10:07:28'),
(586, 'posr-20230924-040759', 45, 20, 1, 1, 1, 1, 100, 0, 0, 1125, 1100, 0, 0, 'Flat', 25, 25, NULL, NULL, NULL, 1, 4, NULL, 1100, NULL, NULL, '2023-09-24 10:07:59', '2023-09-24 10:07:59'),
(587, 'posr-20230924-043511', 45, 20, 57, 1, 1, 1, 200, 0, 0, 2200, 2200, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 2200, NULL, NULL, '2023-09-24 10:35:11', '2023-09-24 10:35:11'),
(588, 'posr-20230924-061949', 45, 20, 22, 1, 1, 3, 68.75, 0, 0, 5848.75, 5673.75, 0, 0, 'Flat', 175, 175, NULL, NULL, NULL, 1, 4, NULL, 5673.75, NULL, NULL, '2023-09-24 12:19:49', '2023-09-24 12:19:49'),
(589, 'posr-20230924-062100', 45, 20, 1, 1, 1, 1, 1.8, 0, 0, 315, 315, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 315, NULL, NULL, '2023-09-24 12:21:00', '2023-09-24 12:21:00'),
(590, 'posr-20230924-062211', 45, 20, 1, 1, 1, 1, 1.76, 0, 0, 308, 300, 0, 0, 'Flat', 8, 8, NULL, NULL, NULL, 1, 4, NULL, 300, NULL, NULL, '2023-09-24 12:22:11', '2023-09-24 12:22:11'),
(591, 'posr-20230924-062354', 45, 20, 1, 1, 1, 1, 16, 0, 0, 180, 176, 0, 0, 'Flat', 4, 4, NULL, NULL, NULL, 1, 4, NULL, 176, NULL, NULL, '2023-09-24 12:23:54', '2023-09-24 12:23:54'),
(592, 'posr-20230924-062542', 45, 20, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-24 12:25:42', '2023-09-24 12:25:42'),
(593, 'posr-20230924-062610', 45, 20, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-24 12:26:10', '2023-09-24 12:26:10'),
(594, 'posr-20230924-062632', 45, 20, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-24 12:26:32', '2023-09-24 12:26:32'),
(595, 'posr-20230924-062654', 45, 20, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-24 12:26:54', '2023-09-24 12:26:54'),
(596, 'posr-20230924-062720', 45, 20, 1, 1, 1, 1, 100, 0, 0, 1125, 1100, 0, 0, 'Flat', 25, 25, NULL, NULL, NULL, 1, 4, NULL, 1100, NULL, NULL, '2023-09-24 12:27:20', '2023-09-24 12:27:20'),
(597, 'posr-20230924-062744', 45, 20, 1, 1, 1, 1, 9, 0, 0, 101.25, 100.25, 0, 0, 'Flat', 1, 1, NULL, NULL, NULL, 1, 4, NULL, 100.25, NULL, NULL, '2023-09-24 12:27:44', '2023-09-24 12:27:44'),
(598, 'posr-20230924-062806', 45, 20, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-24 12:28:06', '2023-09-24 12:28:06'),
(599, 'posr-20230924-062856', 45, 20, 3, 1, 1, 1, 5, 0, 0, 325, 325, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 325, NULL, NULL, '2023-09-24 12:28:56', '2023-09-24 12:28:56'),
(600, 'posr-20230924-062925', 45, 20, 1, 1, 1, 1, 4, 0, 0, 260, 260, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 260, NULL, NULL, '2023-09-24 12:29:25', '2023-09-24 12:29:25'),
(601, 'posr-20230924-063006', 45, 20, 1, 1, 1, 1, 0.65, 0, 0, 455, 450, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 450, NULL, NULL, '2023-09-24 12:30:06', '2023-09-24 12:30:06'),
(602, 'posr-20230924-063440', 45, 20, 1, 1, 1, 1, 15, 0, 0, 168.75, 170.75, 0, 0, 'Flat', NULL, 0, NULL, NULL, 2, 1, 4, NULL, 170.75, NULL, NULL, '2023-09-24 12:34:40', '2023-09-24 12:34:40'),
(603, 'posr-20230924-063559', 45, 20, 58, 1, 1, 1, 100, 0, 0, 1125, 1100, 0, 0, 'Flat', 25, 25, NULL, NULL, NULL, 1, 4, NULL, 1100, NULL, NULL, '2023-09-24 12:35:59', '2023-09-24 12:35:59'),
(604, 'posr-20230924-064357', 45, 20, 1, 1, 1, 1, 4, 0, 0, 45, 45, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 45, NULL, NULL, '2023-09-24 12:43:57', '2023-09-24 12:43:57'),
(605, 'posr-20230924-074210', 45, 20, 5, 1, 1, 1, 90, 0, 0, 990, 990, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 990, NULL, NULL, '2023-09-24 13:42:10', '2023-09-24 13:42:10'),
(606, 'posr-20230924-075831', 45, 20, 59, 1, 1, 1, 5100, 0, 0, 53040, 53040, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 53040, 'Boro Dim', NULL, '2023-09-24 13:58:31', '2023-09-24 13:58:31'),
(607, 'posr-20230924-075942', 45, 20, 59, 1, 1, 1, 1020, 0, 0, 9588, 9588, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 9588, 'Coto Dim', NULL, '2023-09-24 13:59:42', '2023-09-24 13:59:42'),
(608, 'posr-20230924-080034', 45, 20, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-24 14:00:34', '2023-09-24 14:00:34'),
(609, 'posr-20230924-080113', 45, 20, 1, 1, 1, 1, 1.9, 0, 0, 332.5, 330.5, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 330.5, NULL, NULL, '2023-09-24 14:01:13', '2023-09-24 14:01:13'),
(610, 'posr-20230924-081134', 45, 20, 60, 1, 1, 1, 4, 0, 0, 45, 45, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 45, NULL, NULL, '2023-09-24 14:11:34', '2023-09-24 14:11:34'),
(611, 'posr-20230924-083120', 45, 20, 1, 1, 1, 1, 12, 0, 0, 135, 135, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 135, NULL, NULL, '2023-09-24 14:31:20', '2023-09-24 14:31:20'),
(612, 'posr-20230924-083714', 45, 20, 1, 1, 1, 1, 30, 0, 0, 337.5, 330.5, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 330.5, NULL, NULL, '2023-09-24 14:37:14', '2023-09-24 14:37:14'),
(613, 'posr-20230924-083730', 45, 20, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-24 14:37:30', '2023-09-24 14:37:30'),
(614, 'posr-20230924-083740', 45, 20, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-24 14:37:40', '2023-09-24 14:37:40'),
(615, 'posr-20230924-083951', 45, 20, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-24 14:39:51', '2023-09-24 14:39:51'),
(616, 'posr-20230924-090904', 45, 20, 61, 1, 1, 3, 9.84, 0, 0, 696, 690, 0, 0, 'Flat', 6, 6, NULL, NULL, NULL, 1, 4, NULL, 690, NULL, NULL, '2023-09-24 15:09:04', '2023-09-24 15:09:04'),
(617, 'posr-20230924-090953', 45, 20, 1, 1, 1, 1, 12, 0, 0, 135, 135, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 135, NULL, NULL, '2023-09-24 15:09:53', '2023-09-24 15:09:53'),
(618, 'posr-20230924-091505', 45, 20, 1, 1, 1, 1, 1.2, 0, 0, 210, 210, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 210, NULL, NULL, '2023-09-24 15:15:05', '2023-09-24 15:15:05'),
(619, 'posr-20230924-091530', 45, 20, 1, 1, 1, 1, 30, 0, 0, 337.5, 330.5, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 330.5, NULL, NULL, '2023-09-24 15:15:30', '2023-09-24 15:15:30'),
(620, 'posr-20230924-091922', 45, 20, 1, 1, 1, 1, 1.2, 0, 0, 210, 195, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 195, NULL, NULL, '2023-09-24 15:19:22', '2023-09-24 15:19:22'),
(621, 'posr-20230924-092242', 45, 20, 1, 1, 1, 1, 1.8, 0, 0, 315, 315, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 315, NULL, NULL, '2023-09-24 15:22:42', '2023-09-24 15:22:42'),
(622, 'posr-20230924-092511', 45, 20, 2, 1, 1, 1, 300, 0, 0, 3300, 3300, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 3300, NULL, NULL, '2023-09-24 15:25:11', '2023-09-24 15:25:11'),
(623, 'posr-20230924-092603', 45, 20, 1, 1, 1, 1, 300, 0, 0, 3270, 3270, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 3270, NULL, NULL, '2023-09-24 15:26:03', '2023-09-24 15:26:03'),
(624, 'posr-20230924-092635', 45, 20, 38, 1, 1, 1, 115, 0, 0, 1276.5, 1276.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1276.5, NULL, NULL, '2023-09-24 15:26:35', '2023-09-24 15:26:35'),
(625, 'posr-20230924-092903', 45, 20, 1, 1, 1, 2, 3.5999999999999996, 0, 0, 867.5, 867.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 867.5, NULL, NULL, '2023-09-24 15:29:03', '2023-09-24 15:29:03'),
(626, 'posr-20230924-092935', 45, 20, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-24 15:29:35', '2023-09-24 15:29:35'),
(627, 'posr-20230924-093604', 45, 20, 1, 1, 1, 1, 120, 0, 0, 1350, 1320, 0, 0, 'Flat', 30, 30, NULL, NULL, NULL, 1, 4, NULL, 1320, NULL, NULL, '2023-09-24 15:36:04', '2023-09-24 15:36:04'),
(628, 'posr-20230924-093643', 45, 20, 1, 1, 1, 1, 8, 0, 0, 90, 90, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-24 15:36:43', '2023-09-24 15:36:43'),
(629, 'posr-20230924-093853', 45, 20, 1, 1, 1, 1, 1.86, 0, 0, 325.5, 325.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 325.5, NULL, NULL, '2023-09-24 15:38:53', '2023-09-24 15:38:53'),
(630, 'posr-20230924-101241', 45, 20, 6, 1, 1, 1, 18.5, 0, 0, 1202.5, 1202.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1202.5, NULL, NULL, '2023-09-24 16:12:41', '2023-09-24 16:12:41'),
(631, 'posr-20230924-101714', 45, 20, 1, 1, 1, 1, 1, 0, 0, 700, 660, 0, 0, 'Flat', 40, 40, NULL, NULL, NULL, 1, 4, NULL, 660, NULL, NULL, '2023-09-24 16:17:14', '2023-09-24 16:17:14'),
(632, 'posr-20230924-101740', 45, 20, 1, 1, 1, 1, 1.8, 0, 0, 315, 313, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 313, NULL, NULL, '2023-09-24 16:17:40', '2023-09-24 16:17:40'),
(633, 'posr-20230925-042624', 45, 21, 1, 1, 1, 1, 2.2, 0, 0, 385, 374, 0, 0, 'Flat', 11, 11, NULL, NULL, NULL, 1, 4, NULL, 374, NULL, NULL, '2023-09-25 10:26:24', '2023-09-25 10:26:24'),
(634, 'posr-20230925-042749', 45, 21, 1, 1, 1, 1, 2.1, 0, 0, 367.5, 360.5, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 360.5, NULL, NULL, '2023-09-25 10:27:49', '2023-09-25 10:27:49'),
(635, 'posr-20230925-043704', 45, 21, 1, 1, 1, 1, 1.8, 0, 0, 315, 300, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 300, NULL, NULL, '2023-09-25 10:37:04', '2023-09-25 10:37:04'),
(636, 'posr-20230925-043826', 45, 21, 1, 1, 1, 1, 3.3, 0, 0, 577.5, 570.5, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 570.5, NULL, NULL, '2023-09-25 10:38:26', '2023-09-25 10:38:26'),
(637, 'posr-20230925-044748', 45, 21, 1, 1, 1, 1, 2.3, 0, 0, 402.5, 397.5, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 397.5, NULL, NULL, '2023-09-25 10:47:48', '2023-09-25 10:47:48'),
(638, 'posr-20230925-045502', 45, 21, 1, 1, 1, 1, 1.7, 0, 0, 297.5, 297.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 297.5, NULL, NULL, '2023-09-25 10:55:02', '2023-09-25 10:55:02'),
(639, 'posr-20230925-045553', 45, 21, 1, 1, 1, 1, 1.97, 0, 0, 344.75, 336.75, 0, 0, 'Flat', 8, 8, NULL, NULL, NULL, 1, 4, NULL, 336.75, NULL, NULL, '2023-09-25 10:55:53', '2023-09-25 10:55:53'),
(640, 'posr-20230925-045716', 45, 21, 1, 1, 1, 1, 2.1, 0, 0, 367.5, 365.5, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 365.5, NULL, NULL, '2023-09-25 10:57:16', '2023-09-25 10:57:16'),
(641, 'posr-20230925-045831', 45, 21, 1, 1, 1, 1, 2.1, 0, 0, 367.5, 357.5, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 357.5, NULL, NULL, '2023-09-25 10:58:31', '2023-09-25 10:58:31'),
(642, 'posr-20230925-053536', 45, 21, 22, 1, 1, 3, 67.2, 0, 0, 4413, 4413, 0, 0, 'Flat', 0, 0, NULL, NULL, NULL, 1, 4, NULL, 4413, NULL, NULL, '2023-09-25 11:35:36', '2023-09-25 11:35:36'),
(643, 'posr-20230925-053645', 45, 21, 1, 1, 1, 1, 1.45, 0, 0, 253.75, 246.75, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 246.75, NULL, NULL, '2023-09-25 11:36:45', '2023-09-25 11:36:45'),
(644, 'posr-20230925-054824', 45, 21, 29, 1, 1, 1, 650, 0, 0, 7150, 6050, 0, 0, 'Flat', 1100, 1100, NULL, NULL, NULL, 1, 4, NULL, 6050, NULL, NULL, '2023-09-25 11:48:24', '2023-09-25 11:48:24'),
(645, 'posr-20230925-055037', 45, 21, 1, 1, 1, 1, 7.7, 0, 0, 1347.5, 1343.5, 0, 0, 'Flat', 4, 4, NULL, NULL, NULL, 1, 4, NULL, 1343.5, NULL, NULL, '2023-09-25 11:50:37', '2023-09-25 11:50:37'),
(646, 'posr-20230925-055548', 45, 21, 1, 1, 1, 1, 30, 0, 0, 270, 270, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 270, 'VANGGA DIM', NULL, '2023-09-25 11:55:48', '2023-09-25 11:55:48'),
(647, 'posr-20230925-055841', 45, 21, 1, 1, 1, 1, 30, 0, 0, 337.5, 337.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 337.5, NULL, NULL, '2023-09-25 11:58:41', '2023-09-25 11:58:41'),
(648, 'posr-20230925-055937', 45, 21, 1, 1, 1, 1, 4, 0, 0, 45, 40, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 40, NULL, NULL, '2023-09-25 11:59:37', '2023-09-25 11:59:37'),
(649, 'posr-20230925-060015', 45, 21, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-25 12:00:15', '2023-09-25 12:00:15'),
(650, 'posr-20230925-060039', 45, 21, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-25 12:00:39', '2023-09-25 12:00:39'),
(651, 'posr-20230925-060320', 45, 21, 1, 1, 1, 1, 7, 0, 0, 78.75, 70.75, 0, 0, 'Flat', 8, 8, NULL, NULL, NULL, 1, 4, NULL, 70.75, NULL, NULL, '2023-09-25 12:03:20', '2023-09-25 12:03:20'),
(652, 'posr-20230925-060626', 45, 21, 21, 1, 1, 1, 200, 0, 0, 2250, 2160, 0, 0, 'Flat', 90, 90, NULL, NULL, NULL, 1, 4, NULL, 2160, NULL, NULL, '2023-09-25 12:06:26', '2023-09-25 12:06:26'),
(653, 'posr-20230925-060654', 45, 21, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-25 12:06:54', '2023-09-25 12:06:54'),
(654, 'posr-20230925-060903', 45, 21, 1, 1, 1, 1, 4, 0, 0, 45, 45, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 45, NULL, NULL, '2023-09-25 12:09:03', '2023-09-25 12:09:03'),
(655, 'posr-20230925-061047', 45, 21, 1, 1, 1, 1, 150, 0, 0, 1687.5, 1650.5, 0, 0, 'Flat', 37, 37, NULL, NULL, NULL, 1, 4, NULL, 1650.5, NULL, NULL, '2023-09-25 12:10:47', '2023-09-25 12:10:47'),
(656, 'posr-20230925-061218', 45, 21, 1, 1, 1, 1, 5, 0, 0, 56.25, 50.25, 0, 0, 'Flat', 6, 6, NULL, NULL, NULL, 1, 4, NULL, 50.25, 'Vangga Dim', NULL, '2023-09-25 12:12:18', '2023-09-25 12:12:18'),
(657, 'posr-20230925-061815', 45, 21, 1, 1, 1, 1, 15, 0, 0, 168.75, 168.75, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 168.75, NULL, NULL, '2023-09-25 12:18:15', '2023-09-25 12:18:15'),
(658, 'posr-20230925-061903', 45, 21, 1, 1, 1, 1, 0.9, 0, 0, 270, 270, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 270, NULL, NULL, '2023-09-25 12:19:03', '2023-09-25 12:19:03'),
(659, 'posr-20230925-061927', 45, 21, 1, 1, 1, 1, 1.75, 0, 0, 525, 525, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 525, NULL, NULL, '2023-09-25 12:19:27', '2023-09-25 12:19:27'),
(660, 'posr-20230925-062003', 45, 21, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-25 12:20:03', '2023-09-25 12:20:03'),
(661, 'posr-20230925-062017', 45, 21, 1, 1, 1, 1, 2, 0, 0, 130, 130, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 130, NULL, NULL, '2023-09-25 12:20:17', '2023-09-25 12:20:17'),
(662, 'posr-20230925-062108', 45, 21, 1, 1, 1, 1, 0.75, 0, 0, 487.5, 490.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 490.5, NULL, NULL, '2023-09-25 12:21:08', '2023-09-25 12:21:08'),
(663, 'posr-20230925-063503', 45, 21, 1, 1, 1, 1, 3.4, 0, 0, 595, 560, 0, 0, 'Flat', 35, 35, NULL, NULL, NULL, 1, 4, NULL, 560, NULL, NULL, '2023-09-25 12:35:03', '2023-09-25 12:35:03'),
(664, 'posr-20230925-065200', 45, 21, 1, 1, 1, 1, 1.7, 0, 0, 297.5, 290.5, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 290.5, NULL, NULL, '2023-09-25 12:52:00', '2023-09-25 12:52:00'),
(665, 'posr-20230925-065221', 45, 21, 1, 1, 1, 1, 8, 0, 0, 90, 90, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-25 12:52:21', '2023-09-25 12:52:21'),
(666, 'posr-20230925-065239', 45, 21, 1, 1, 1, 1, 8, 0, 0, 90, 90, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-25 12:52:39', '2023-09-25 12:52:39'),
(667, 'posr-20230925-065311', 45, 21, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', 0, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-25 12:53:11', '2023-09-25 12:53:11'),
(668, 'posr-20230925-065433', 45, 21, 38, 1, 1, 1, 60, 0, 0, 675, 654, 0, 0, 'Flat', 21, 21, NULL, NULL, NULL, 1, 4, NULL, 654, NULL, NULL, '2023-09-25 12:54:33', '2023-09-25 12:54:33'),
(669, 'posr-20230925-065550', 45, 21, 2, 1, 1, 1, 300, 0, 0, 3375, 3300, 0, 0, 'Flat', 75, 75, NULL, NULL, NULL, 1, 4, NULL, 3300, NULL, NULL, '2023-09-25 12:55:50', '2023-09-25 12:55:50'),
(670, 'posr-20230925-065653', 45, 21, 1, 1, 1, 1, 300, 0, 0, 3375, 3270, 0, 0, 'Flat', 105, 105, NULL, NULL, NULL, 1, 4, NULL, 3270, NULL, NULL, '2023-09-25 12:56:53', '2023-09-25 12:56:53'),
(671, 'posr-20230925-071303', 45, 21, 1, 1, 1, 1, 2, 0, 0, 130, 130, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 130, NULL, NULL, '2023-09-25 13:13:03', '2023-09-25 13:13:03'),
(672, 'posr-20230925-071930', 45, 21, 1, 1, 1, 1, 8, 0, 0, 90, 90, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-25 13:19:30', '2023-09-25 13:19:30'),
(673, 'posr-20230925-074117', 45, 21, 1, 1, 1, 1, 0.5, 0, 0, 32.5, 32.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 32.5, NULL, NULL, '2023-09-25 13:41:17', '2023-09-25 13:41:17'),
(674, 'posr-20230925-082007', 45, 21, 1, 1, 1, 1, 2.56, 0, 0, 768, 742, 0, 0, 'Flat', 26, 26, NULL, NULL, NULL, 1, 4, NULL, 742, NULL, NULL, '2023-09-25 14:20:07', '2023-09-25 14:20:07'),
(675, 'posr-20230925-082142', 45, 21, 1, 1, 1, 1, 5.3, 0, 0, 927.5, 870.5, 0, 0, 'Flat', 57, 57, NULL, NULL, NULL, 1, 4, NULL, 870.5, NULL, NULL, '2023-09-25 14:21:42', '2023-09-25 14:21:42'),
(676, 'posr-20230925-082230', 45, 21, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-25 14:22:30', '2023-09-25 14:22:30'),
(677, 'posr-20230925-082722', 45, 21, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', 0, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-25 14:27:22', '2023-09-25 14:27:22'),
(678, 'posr-20230925-084217', 45, 21, 6, 1, 1, 1, 12, 0, 0, 780, 780, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 780, NULL, NULL, '2023-09-25 14:42:17', '2023-09-25 14:42:17'),
(679, 'posr-20230925-084518', 45, 21, 5, 1, 1, 1, 40, 0, 0, 450, 440, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 440, NULL, NULL, '2023-09-25 14:45:18', '2023-09-25 14:45:18'),
(680, 'posr-20230925-091110', 45, 21, 1, 1, 1, 1, 2.035, 0, 0, 356.13, 345.13, 0, 0, 'Flat', 11, 11, NULL, NULL, NULL, 1, 4, NULL, 345.13, NULL, NULL, '2023-09-25 15:11:10', '2023-09-25 15:11:10'),
(681, 'posr-20230925-091248', 45, 21, 3, 1, 1, 1, 60, 0, 0, 675, 680, 0, 0, 'Flat', NULL, 0, NULL, NULL, 5, 1, 4, NULL, 680, NULL, NULL, '2023-09-25 15:12:48', '2023-09-25 15:12:48'),
(682, 'posr-20230925-091555', 45, 21, 1, 1, 1, 1, 1.8, 0, 0, 315, 300, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 300, NULL, NULL, '2023-09-25 15:15:55', '2023-09-25 15:15:55'),
(683, 'posr-20230925-092151', 45, 21, 1, 1, 1, 1, 12, 0, 0, 135, 100, 0, 0, 'Flat', 35, 35, NULL, NULL, NULL, 1, 4, NULL, 100, 'Vangga Dim', NULL, '2023-09-25 15:21:51', '2023-09-25 15:21:51'),
(684, 'posr-20230925-093146', 45, 21, 1, 1, 1, 1, 12, 0, 0, 135, 135, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 135, NULL, NULL, '2023-09-25 15:31:46', '2023-09-25 15:31:46'),
(685, 'posr-20230926-120515', 45, 22, 1, 1, 1, 1, 3.5, 0, 0, 612.5, 575.5, 0, 0, 'Flat', 37, 37, NULL, NULL, NULL, 1, 4, NULL, 575.5, NULL, NULL, '2023-09-26 06:05:15', '2023-09-26 06:05:15'),
(686, 'posr-20230926-120741', 45, 22, 1, 1, 1, 1, 5.9, 0, 0, 1032.5, 945.5, 0, 0, 'Flat', 87, 87, NULL, NULL, NULL, 1, 4, NULL, 945.5, NULL, NULL, '2023-09-26 06:07:41', '2023-09-26 06:07:41'),
(687, 'posr-20230926-121152', 45, 22, 1, 1, 1, 1, 3, 0, 0, 195, 195, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 195, NULL, NULL, '2023-09-26 06:11:52', '2023-09-26 06:11:52'),
(688, 'posr-20230926-121749', 45, 22, 1, 1, 1, 1, 1.95, 0, 0, 341.25, 320.25, 0, 0, 'Flat', 21, 21, NULL, NULL, NULL, 1, 4, NULL, 320.25, NULL, NULL, '2023-09-26 06:17:49', '2023-09-26 06:17:49'),
(689, 'posr-20230926-121927', 45, 22, 1, 1, 1, 1, 4, 0, 0, 45, 45, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 45, NULL, NULL, '2023-09-26 06:19:27', '2023-09-26 06:19:27'),
(690, 'posr-20230926-122015', 45, 22, 10, 1, 1, 1, 100, 0, 0, 1125, 1090, 0, 0, 'Flat', 35, 35, NULL, NULL, NULL, 1, 4, NULL, 1090, NULL, NULL, '2023-09-26 06:20:15', '2023-09-26 06:20:15'),
(691, 'posr-20230926-124143', 45, 22, 62, 1, 1, 1, 2.34, 0, 0, 409.5, 398.5, 0, 0, 'Flat', 11, 11, NULL, NULL, NULL, 1, 4, NULL, 398.5, NULL, NULL, '2023-09-26 06:41:43', '2023-09-26 06:41:43'),
(692, 'posr-20230926-124239', 45, 22, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-26 06:42:39', '2023-09-26 06:42:39'),
(693, 'posr-20230926-124411', 45, 22, 1, 1, 1, 1, 8, 0, 0, 90, 90, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-26 06:44:11', '2023-09-26 06:44:11'),
(694, 'posr-20230926-124455', 45, 22, 1, 1, 1, 1, 12, 0, 0, 135, 135, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 135, NULL, NULL, '2023-09-26 06:44:55', '2023-09-26 06:44:55'),
(695, 'posr-20230926-124632', 45, 22, 1, 1, 1, 1, 230, 0, 0, 2587.5, 2484.5, 0, 0, 'Flat', 103, 103, NULL, NULL, NULL, 1, 4, NULL, 2484.5, NULL, NULL, '2023-09-26 06:46:32', '2023-09-26 06:46:32'),
(696, 'posr-20230926-124650', 45, 22, 1, 1, 1, 1, 12, 0, 0, 135, 135, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 135, NULL, NULL, '2023-09-26 06:46:50', '2023-09-26 06:46:50'),
(697, 'posr-20230926-124719', 45, 22, 1, 1, 1, 1, 0.9, 0, 0, 270, 270, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 270, NULL, NULL, '2023-09-26 06:47:19', '2023-09-26 06:47:19'),
(698, 'posr-20230926-011420', 45, 22, 36, 1, 1, 1, 300, 0, 0, 3270, 3270, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 3270, NULL, NULL, '2023-09-26 07:14:20', '2023-09-26 07:14:20'),
(699, 'posr-20230926-020843', 45, 22, 1, 1, 1, 1, 2.043, 0, 0, 357.53, 340.53, 0, 0, 'Flat', 17, 17, NULL, NULL, NULL, 1, 4, NULL, 340.53, NULL, NULL, '2023-09-26 08:08:43', '2023-09-26 08:08:43'),
(700, 'posr-20230926-022505', 45, 22, 1, 1, 1, 1, 30, 0, 0, 337.5, 335.5, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 335.5, NULL, NULL, '2023-09-26 08:25:05', '2023-09-26 08:25:05'),
(701, 'posr-20230926-022632', 45, 22, 1, 1, 1, 1, 0.89, 0, 0, 578.5, 565.5, 0, 0, 'Flat', 13, 13, NULL, NULL, NULL, 1, 4, NULL, 565.5, NULL, NULL, '2023-09-26 08:26:32', '2023-09-26 08:26:32'),
(702, 'posr-20230926-025455', 45, 22, 1, 1, 1, 1, 8, 0, 0, 90, 90, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-26 08:54:55', '2023-09-26 08:54:55'),
(703, 'posr-20230926-035328', 45, 22, 1, 1, 1, 1, 1.875, 0, 0, 328.13, 318.13, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 318.13, NULL, NULL, '2023-09-26 09:53:28', '2023-09-26 09:53:28'),
(704, 'posr-20230926-035357', 45, 22, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-26 09:53:57', '2023-09-26 09:53:57'),
(705, 'posr-20230926-040840', 45, 22, 63, 1, 1, 1, 15, 0, 0, 975, 975, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 975, NULL, NULL, '2023-09-26 10:08:40', '2023-09-26 10:08:40'),
(706, 'posr-20230926-040936', 45, 22, 1, 1, 1, 1, 1.7, 0, 0, 297.5, 290.5, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 290.5, NULL, NULL, '2023-09-26 10:09:36', '2023-09-26 10:09:36'),
(707, 'posr-20230926-041245', 45, 22, 63, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-26 10:12:45', '2023-09-26 10:12:45'),
(708, 'posr-20230926-050530', 45, 22, 1, 1, 1, 1, 8, 0, 0, 90, 70, 0, 0, 'Flat', 20, 20, NULL, NULL, NULL, 1, 4, NULL, 70, 'Vangga Dim', NULL, '2023-09-26 11:05:30', '2023-09-26 11:05:30'),
(709, 'posr-20230926-052148', 45, 22, 1, 1, 1, 1, 1.7, 0, 0, 297.5, 290.5, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 290.5, NULL, NULL, '2023-09-26 11:21:48', '2023-09-26 11:21:48'),
(710, 'posr-20230926-052219', 45, 22, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-26 11:22:19', '2023-09-26 11:22:19'),
(711, 'posr-20230926-052328', 45, 22, 1, 1, 1, 1, 100, 0, 0, 1125, 1100, 0, 0, 'Flat', 25, 25, NULL, NULL, NULL, 1, 4, NULL, 1100, NULL, NULL, '2023-09-26 11:23:28', '2023-09-26 11:23:28'),
(712, 'posr-20230926-060751', 45, 22, 1, 1, 1, 1, 3, 0, 0, 195, 195, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 195, NULL, NULL, '2023-09-26 12:07:51', '2023-09-26 12:07:51'),
(713, 'posr-20230926-060833', 45, 22, 1, 1, 1, 1, 3.37, 0, 0, 589.75, 555.75, 0, 0, 'Flat', 34, 34, NULL, NULL, NULL, 1, 4, NULL, 555.75, NULL, NULL, '2023-09-26 12:08:33', '2023-09-26 12:08:33'),
(714, 'posr-20230926-060927', 45, 22, 1, 1, 1, 1, 1.9, 0, 0, 332.5, 338.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 6, 1, 4, NULL, 338.5, NULL, NULL, '2023-09-26 12:09:27', '2023-09-26 12:09:27'),
(715, 'posr-20230926-061115', 45, 22, 1, 1, 1, 1, 1.8, 0, 0, 315, 306, 0, 0, 'Flat', 9, 9, NULL, NULL, NULL, 1, 4, NULL, 306, NULL, NULL, '2023-09-26 12:11:15', '2023-09-26 12:11:15'),
(716, 'posr-20230926-061139', 45, 22, 1, 1, 1, 1, 8, 0, 0, 90, 90, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-26 12:11:39', '2023-09-26 12:11:39'),
(717, 'posr-20230926-061158', 45, 22, 1, 1, 1, 1, 4, 0, 0, 45, 45, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 45, NULL, NULL, '2023-09-26 12:11:58', '2023-09-26 12:11:58'),
(718, 'posr-20230926-063624', 45, 22, 1, 1, 1, 1, 10, 0, 0, 112.5, 110.5, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 110.5, NULL, NULL, '2023-09-26 12:36:24', '2023-09-26 12:36:24'),
(719, 'posr-20230926-063648', 45, 22, 1, 1, 1, 1, 20, 0, 0, 225, 220, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 220, NULL, NULL, '2023-09-26 12:36:48', '2023-09-26 12:36:48'),
(720, 'posr-20230926-063757', 45, 22, 1, 1, 1, 1, 3.9, 0, 0, 682.5, 664.5, 0, 0, 'Flat', 18, 18, NULL, NULL, NULL, 1, 4, NULL, 664.5, NULL, NULL, '2023-09-26 12:37:57', '2023-09-26 12:37:57'),
(721, 'posr-20230926-063823', 45, 22, 1, 1, 1, 1, 1.4, 0, 0, 420, 420, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 420, NULL, NULL, '2023-09-26 12:38:23', '2023-09-26 12:38:23'),
(722, 'posr-20230926-064454', 45, 22, 1, 1, 1, 1, 12, 0, 0, 135, 135, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 135, NULL, NULL, '2023-09-26 12:44:54', '2023-09-26 12:44:54'),
(723, 'posr-20230926-064818', 45, 22, 1, 1, 1, 1, 8, 0, 0, 90, 90, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-26 12:48:18', '2023-09-26 12:48:18'),
(724, 'posr-20230926-065209', 45, 22, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-26 12:52:09', '2023-09-26 12:52:09'),
(725, 'posr-20230926-065958', 45, 22, 1, 1, 1, 1, 8, 0, 0, 90, 90, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-26 12:59:58', '2023-09-26 12:59:58'),
(726, 'posr-20230926-072255', 45, 22, 1, 1, 1, 3, 33.410000000000004, 0, 0, 1156.75, 1150.75, 0, 0, 'Flat', 6, 6, NULL, NULL, NULL, 1, 4, NULL, 1150.75, NULL, NULL, '2023-09-26 13:22:55', '2023-09-26 13:22:55'),
(727, 'posr-20230926-082909', 45, 22, 1, 1, 1, 1, 1.45, 0, 0, 253.75, 250.75, 0, 0, 'Flat', 3, 3, NULL, NULL, NULL, 1, 4, NULL, 250.75, NULL, NULL, '2023-09-26 14:29:09', '2023-09-26 14:29:09'),
(728, 'posr-20230926-082953', 45, 22, 1, 1, 1, 1, 2, 0, 0, 350, 340, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 340, NULL, NULL, '2023-09-26 14:29:53', '2023-09-26 14:29:53'),
(730, 'posr-20230926-083145', 45, 22, 1, 1, 1, 1, 3.8, 0, 0, 665, 646, 0, 0, 'Flat', 19, 19, NULL, NULL, NULL, 1, 4, NULL, 646, NULL, NULL, '2023-09-26 14:31:45', '2023-09-26 14:31:45'),
(731, 'posr-20230926-083229', 45, 22, 1, 1, 1, 1, 3.55, 0, 0, 1065, 1065, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1065, NULL, NULL, '2023-09-26 14:32:29', '2023-09-26 14:32:29'),
(732, 'posr-20230926-083325', 45, 22, 1, 1, 1, 1, 3.5, 0, 0, 227.5, 230.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 230.5, NULL, NULL, '2023-09-26 14:33:25', '2023-09-26 14:33:25'),
(733, 'posr-20230926-083348', 45, 22, 1, 1, 1, 1, 1.5, 0, 0, 97.5, 98.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 1, 1, 4, NULL, 98.5, NULL, NULL, '2023-09-26 14:33:48', '2023-09-26 14:33:48'),
(734, 'posr-20230926-083444', 45, 22, 1, 1, 1, 1, 60, 0, 0, 675, 660, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 660, NULL, NULL, '2023-09-26 14:34:44', '2023-09-26 14:34:44'),
(735, 'posr-20230926-083504', 45, 22, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-26 14:35:04', '2023-09-26 14:35:04'),
(736, 'posr-20230926-083520', 45, 22, 1, 1, 1, 1, 4, 0, 0, 45, 45, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 45, NULL, NULL, '2023-09-26 14:35:20', '2023-09-26 14:35:20'),
(737, 'posr-20230926-084657', 45, 22, 11, 1, 1, 1, 50, 0, 0, 562.5, 550.5, 0, 0, 'Flat', 12, 12, NULL, NULL, NULL, 1, 4, NULL, 550.5, NULL, NULL, '2023-09-26 14:46:57', '2023-09-26 14:46:57'),
(738, 'posr-20230926-085125', 45, 22, 59, 1, 1, 1, 5370, 0, 0, 60412.5, 55608.5, 0, 0, 'Flat', 4804, 4804, NULL, NULL, NULL, 1, 4, NULL, 55608.5, NULL, NULL, '2023-09-26 14:51:25', '2023-09-26 14:51:25'),
(739, 'posr-20230926-090135', 45, 22, 1, 1, 1, 1, 300, 0, 0, 3375, 3270, 0, 0, 'Flat', 105, 105, NULL, NULL, NULL, 1, 4, NULL, 3270, NULL, NULL, '2023-09-26 15:01:35', '2023-09-26 15:01:35'),
(740, 'posr-20230926-090256', 45, 22, 2, 1, 1, 1, 400, 0, 0, 4500, 4360, 0, 0, 'Flat', 140, 140, NULL, NULL, NULL, 1, 4, NULL, 4360, NULL, NULL, '2023-09-26 15:02:56', '2023-09-26 15:02:56'),
(741, 'posr-20230926-090418', 45, 22, 1, 1, 1, 1, 200, 0, 0, 2250, 2240, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 2240, NULL, NULL, '2023-09-26 15:04:18', '2023-09-26 15:04:18'),
(742, 'posr-20230927-120045', 45, 23, 1, 1, 1, 1, 3.1, 0, 0, 542.5, 530.5, 0, 0, 'Flat', 12, 12, NULL, NULL, NULL, 1, 4, NULL, 530.5, NULL, NULL, '2023-09-27 06:00:45', '2023-09-27 06:00:45'),
(743, 'posr-20230927-121611', 45, 23, 29, 1, 1, 1, 18.5, 0, 0, 3237.5, 3200.5, 0, 0, 'Flat', 37, 37, NULL, NULL, NULL, 1, 4, NULL, 3200.5, NULL, NULL, '2023-09-27 06:16:11', '2023-09-27 06:16:11'),
(744, 'posr-20230927-121710', 45, 23, 1, 1, 1, 1, 1.9, 0, 0, 332.5, 320.5, 0, 0, 'Flat', 12, 12, NULL, NULL, NULL, 1, 4, NULL, 320.5, NULL, NULL, '2023-09-27 06:17:10', '2023-09-27 06:17:10'),
(745, 'posr-20230927-122130', 45, 23, 1, 1, 1, 1, 2.9, 0, 0, 507.5, 500.5, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 500.5, NULL, NULL, '2023-09-27 06:21:30', '2023-09-27 06:21:30'),
(746, 'posr-20230927-122925', 45, 23, 1, 1, 1, 1, 5.5, 0, 0, 962.5, 945.5, 0, 0, 'Flat', 17, 17, NULL, NULL, NULL, 1, 4, NULL, 945.5, NULL, NULL, '2023-09-27 06:29:25', '2023-09-27 06:29:25'),
(747, 'posr-20230927-122958', 45, 23, 1, 1, 1, 1, 1.8, 0, 0, 315, 315, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 315, NULL, NULL, '2023-09-27 06:29:58', '2023-09-27 06:29:58'),
(748, 'posr-20230927-123022', 45, 23, 1, 1, 1, 1, 1.6, 0, 0, 280, 280, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 280, NULL, NULL, '2023-09-27 06:30:22', '2023-09-27 06:30:22'),
(749, 'posr-20230927-123338', 45, 23, 1, 1, 1, 1, 1.7, 0, 0, 297.5, 290.5, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 290.5, NULL, NULL, '2023-09-27 06:33:38', '2023-09-27 06:33:38'),
(750, 'posr-20230927-123501', 45, 23, 1, 1, 1, 1, 1.8, 0, 0, 315, 310, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 310, NULL, NULL, '2023-09-27 06:35:01', '2023-09-27 06:35:01'),
(751, 'posr-20230927-123556', 45, 23, 1, 1, 1, 1, 1.6, 0, 0, 280, 270, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 270, NULL, NULL, '2023-09-27 06:35:56', '2023-09-27 06:35:56'),
(752, 'posr-20230927-124238', 45, 23, 1, 1, 1, 1, 5, 0, 0, 56.25, 55.25, 0, 0, 'Flat', 1, 1, NULL, NULL, NULL, 1, 4, NULL, 55.25, NULL, NULL, '2023-09-27 06:42:38', '2023-09-27 06:42:38'),
(753, 'posr-20230927-124332', 45, 23, 1, 1, 1, 1, 2, 0, 0, 22.5, 20.5, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 20.5, NULL, NULL, '2023-09-27 06:43:32', '2023-09-27 06:43:32'),
(754, 'posr-20230927-124357', 45, 23, 1, 1, 1, 1, 30, 0, 0, 337.5, 330.5, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 330.5, NULL, NULL, '2023-09-27 06:43:57', '2023-09-27 06:43:57'),
(755, 'posr-20230927-124417', 45, 23, 1, 1, 1, 1, 30, 0, 0, 337.5, 330.5, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 330.5, NULL, NULL, '2023-09-27 06:44:17', '2023-09-27 06:44:17'),
(756, 'posr-20230927-124642', 45, 23, 10, 1, 1, 1, 100, 0, 0, 1125, 1090, 0, 0, 'Flat', 35, 35, NULL, NULL, NULL, 1, 4, NULL, 1090, NULL, NULL, '2023-09-27 06:46:42', '2023-09-27 06:46:42'),
(757, 'posr-20230927-010021', 45, 23, 1, 1, 1, 1, 4, 0, 0, 45, 45, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 45, NULL, NULL, '2023-09-27 07:00:21', '2023-09-27 07:00:21'),
(758, 'posr-20230927-010046', 45, 23, 1, 1, 1, 1, 60, 0, 0, 675, 680, 0, 0, 'Flat', NULL, 0, NULL, NULL, 5, 1, 4, NULL, 680, NULL, NULL, '2023-09-27 07:00:46', '2023-09-27 07:00:46'),
(759, 'posr-20230927-010110', 45, 23, 1, 1, 1, 1, 8, 0, 0, 90, 90, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-27 07:01:10', '2023-09-27 07:01:10'),
(760, 'posr-20230927-010310', 45, 23, 21, 1, 1, 1, 100, 0, 0, 1125, 1080, 0, 0, 'Flat', 45, 45, NULL, NULL, NULL, 1, 4, NULL, 1080, NULL, NULL, '2023-09-27 07:03:10', '2023-09-27 07:03:10'),
(761, 'posr-20230927-010704', 45, 23, 22, 1, 1, 3, 68.5, 0, 0, 4627.5, 4632.5, 0, 0, 'Flat', 0, 0, NULL, NULL, 5, 1, 4, NULL, 4632.5, NULL, NULL, '2023-09-27 07:07:04', '2023-09-27 07:07:04'),
(762, 'posr-20230927-010838', 45, 23, 1, 1, 1, 1, 0.8, 0, 0, 140, 130, 0, 0, 'Flat', 10, 10, NULL, NULL, NULL, 1, 4, NULL, 130, 'Kata Boylar', NULL, '2023-09-27 07:08:38', '2023-09-27 07:08:38'),
(763, 'posr-20230927-010929', 45, 23, 1, 1, 1, 1, 0.8, 0, 0, 240, 245, 0, 0, 'Flat', NULL, 0, NULL, NULL, 5, 1, 4, NULL, 245, NULL, NULL, '2023-09-27 07:09:29', '2023-09-27 07:09:29'),
(764, 'posr-20230927-010947', 45, 23, 1, 1, 1, 1, 2, 0, 0, 130, 130, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 130, NULL, NULL, '2023-09-27 07:09:47', '2023-09-27 07:09:47'),
(765, 'posr-20230927-011004', 45, 23, 1, 1, 1, 1, 2, 0, 0, 130, 130, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 130, NULL, NULL, '2023-09-27 07:10:04', '2023-09-27 07:10:04'),
(766, 'posr-20230927-011020', 45, 23, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-27 07:10:20', '2023-09-27 07:10:20'),
(767, 'posr-20230927-011122', 45, 23, 2, 1, 1, 1, 300, 0, 0, 3375, 3270, 0, 0, 'Flat', 105, 105, NULL, NULL, NULL, 1, 4, NULL, 3270, NULL, NULL, '2023-09-27 07:11:22', '2023-09-27 07:11:22'),
(768, 'posr-20230927-011236', 45, 23, 1, 1, 1, 1, 300, 0, 0, 3375, 3240, 0, 0, 'Flat', 135, 135, NULL, NULL, NULL, 1, 4, NULL, 3240, NULL, NULL, '2023-09-27 07:12:36', '2023-09-27 07:12:36'),
(769, 'posr-20230927-011307', 45, 23, 1, 1, 1, 1, 1, 0, 0, 11.25, 10.25, 0, 0, 'Flat', 1, 1, NULL, NULL, NULL, 1, 4, NULL, 10.25, 'Vangga Dim', NULL, '2023-09-27 07:13:07', '2023-09-27 07:13:07'),
(770, 'posr-20230927-012931', 45, 23, 1, 1, 1, 1, 0.8, 0, 0, 240, 240, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 240, NULL, NULL, '2023-09-27 07:29:31', '2023-09-27 07:29:31'),
(771, 'posr-20230927-013002', 45, 23, 1, 1, 1, 1, 1.8, 0, 0, 315, 306, 0, 0, 'Flat', 9, 9, NULL, NULL, NULL, 1, 4, NULL, 306, NULL, NULL, '2023-09-27 07:30:02', '2023-09-27 07:30:02'),
(772, 'posr-20230927-014417', 45, 23, 1, 1, 1, 1, 16, 0, 0, 180, 180, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 180, NULL, NULL, '2023-09-27 07:44:17', '2023-09-27 07:44:17'),
(773, 'posr-20230927-021851', 45, 23, 1, 1, 1, 1, 180, 0, 0, 2025, 1944, 0, 0, 'Flat', 81, 81, NULL, NULL, NULL, 1, 4, NULL, 1944, NULL, NULL, '2023-09-27 08:18:51', '2023-09-27 08:18:51'),
(774, 'posr-20230927-021913', 45, 23, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-27 08:19:13', '2023-09-27 08:19:13'),
(775, 'posr-20230927-022001', 45, 23, 1, 1, 1, 1, 2.34, 0, 0, 702, 700, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 700, NULL, NULL, '2023-09-27 08:20:01', '2023-09-27 08:20:01'),
(776, 'posr-20230927-024104', 45, 23, 1, 1, 1, 1, 0.8, 0, 0, 240, 240, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 240, NULL, NULL, '2023-09-27 08:41:04', '2023-09-27 08:41:04'),
(777, 'posr-20230927-024138', 45, 23, 1, 1, 1, 1, 1.4, 0, 0, 245, 237, 0, 0, 'Flat', 8, 8, NULL, NULL, NULL, 1, 4, NULL, 237, NULL, NULL, '2023-09-27 08:41:38', '2023-09-27 08:41:38'),
(778, 'posr-20230927-052412', 45, 23, 1, 1, 1, 1, 0.258, 0, 0, 45.15, 80.15, 0, 0, 'Flat', NULL, 0, NULL, NULL, 35, 1, 4, NULL, 80.15, 'Kata Murgi', NULL, '2023-09-27 11:24:12', '2023-09-27 11:24:12'),
(779, 'posr-20230927-053458', 45, 23, 1, 1, 1, 1, 2.15, 0, 0, 376.25, 365.25, 0, 0, 'Flat', 11, 11, NULL, NULL, NULL, 1, 4, NULL, 365.25, NULL, NULL, '2023-09-27 11:34:58', '2023-09-27 11:34:58'),
(780, 'posr-20230927-055434', 45, 23, 1, 1, 1, 1, 1.7, 0, 0, 297.5, 300.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 300.5, NULL, NULL, '2023-09-27 11:54:34', '2023-09-27 11:54:34'),
(781, 'posr-20230927-055611', 45, 23, 6, 1, 1, 2, 9.16, 0, 0, 1752.2, 1752.2, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 1752.2, NULL, NULL, '2023-09-27 11:56:11', '2023-09-27 11:56:11'),
(782, 'posr-20230927-055809', 45, 23, 1, 1, 1, 1, 1.8, 0, 0, 315, 310, 0, 0, 'Flat', 5, 5, NULL, NULL, NULL, 1, 4, NULL, 310, NULL, NULL, '2023-09-27 11:58:09', '2023-09-27 11:58:09'),
(783, 'posr-20230927-055838', 45, 23, 1, 1, 1, 1, 4, 0, 0, 45, 45, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 45, NULL, NULL, '2023-09-27 11:58:38', '2023-09-27 11:58:38'),
(784, 'posr-20230927-055930', 45, 23, 1, 1, 1, 1, 6, 0, 0, 67.5, 65.5, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 65.5, NULL, NULL, '2023-09-27 11:59:30', '2023-09-27 11:59:30'),
(785, 'posr-20230927-060006', 45, 23, 1, 1, 1, 1, 100, 0, 0, 1125, 1090, 0, 0, 'Flat', 35, 35, NULL, NULL, NULL, 1, 4, NULL, 1090, NULL, NULL, '2023-09-27 12:00:06', '2023-09-27 12:00:06'),
(786, 'posr-20230927-060139', 45, 23, 1, 1, 1, 1, 60, 0, 0, 675, 680, 0, 0, 'Flat', NULL, 0, NULL, NULL, 5, 1, 4, NULL, 680, NULL, NULL, '2023-09-27 12:01:39', '2023-09-27 12:01:39'),
(787, 'posr-20230927-060202', 45, 23, 1, 1, 1, 1, 2, 0, 0, 130, 130, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 130, NULL, NULL, '2023-09-27 12:02:02', '2023-09-27 12:02:02'),
(788, 'posr-20230927-060323', 45, 23, 1, 1, 1, 1, 0.82, 0, 0, 533, 510, 0, 0, 'Flat', 23, 23, NULL, NULL, NULL, 1, 4, NULL, 510, NULL, NULL, '2023-09-27 12:03:23', '2023-09-27 12:03:23'),
(789, 'posr-20230927-062337', 45, 23, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-27 12:23:37', '2023-09-27 12:23:37'),
(790, 'posr-20230927-062437', 45, 23, 1, 1, 1, 1, 3.3, 0, 0, 577.5, 577.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 577.5, NULL, NULL, '2023-09-27 12:24:37', '2023-09-27 12:24:37'),
(791, 'posr-20230927-062617', 45, 23, 6, 1, 1, 1, 14, 0, 0, 910, 910, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 910, NULL, NULL, '2023-09-27 12:26:17', '2023-09-27 12:26:17'),
(792, 'posr-20230927-062919', 45, 23, 1, 1, 1, 1, 4, 0, 0, 45, 30, 0, 0, 'Flat', 15, 15, NULL, NULL, NULL, 1, 4, NULL, 30, 'Vangga Dim', NULL, '2023-09-27 12:29:19', '2023-09-27 12:29:19'),
(793, 'posr-20230927-064924', 45, 23, 1, 1, 1, 1, 0.84, 0, 0, 403.2, 380.2, 0, 0, 'Flat', 23, 23, NULL, NULL, NULL, 1, 4, NULL, 380.2, NULL, NULL, '2023-09-27 12:49:24', '2023-09-27 12:49:24'),
(794, 'posr-20230927-071855', 45, 23, 1, 1, 1, 1, 30, 0, 0, 337.5, 340.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, 3, 1, 4, NULL, 340.5, NULL, NULL, '2023-09-27 13:18:55', '2023-09-27 13:18:55'),
(795, 'posr-20230927-074044', 45, 23, 1, 1, 1, 1, 1, 0, 0, 65, 65, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 65, NULL, NULL, '2023-09-27 13:40:44', '2023-09-27 13:40:44'),
(796, 'posr-20230927-082557', 45, 23, 1, 1, 1, 1, 1.73, 0, 0, 302.75, 295.75, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 295.75, NULL, NULL, '2023-09-27 14:25:57', '2023-09-27 14:25:57'),
(797, 'posr-20230927-082753', 45, 23, 1, 1, 1, 1, 30, 0, 0, 337.5, 330.5, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 330.5, NULL, NULL, '2023-09-27 14:27:53', '2023-09-27 14:27:53'),
(798, 'posr-20230927-083456', 45, 23, 1, 1, 1, 1, 10, 0, 0, 112.5, 110.5, 0, 0, 'Flat', 2, 2, NULL, NULL, NULL, 1, 4, NULL, 110.5, NULL, NULL, '2023-09-27 14:34:56', '2023-09-27 14:34:56'),
(799, 'posr-20230927-083854', 45, 23, 59, 1, 1, 1, 1200, 0, 0, 12480, 12480, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 12480, NULL, NULL, '2023-09-27 14:38:54', '2023-09-27 14:38:54'),
(800, 'posr-20230927-084043', 45, 23, 1, 1, 1, 1, 30, 0, 0, 337.5, 330.5, 0, 0, 'Flat', 7, 7, NULL, NULL, NULL, 1, 4, NULL, 330.5, NULL, NULL, '2023-09-27 14:40:43', '2023-09-27 14:40:43'),
(801, 'posr-20230927-084834', 45, 23, 1, 1, 1, 1, 8, 0, 0, 90, 90, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 90, NULL, NULL, '2023-09-27 14:48:34', '2023-09-27 14:48:34'),
(802, 'posr-20230927-084850', 45, 23, 1, 1, 1, 1, 2, 0, 0, 22.5, 22.5, 0, 0, 'Flat', NULL, 0, NULL, NULL, NULL, 1, 4, NULL, 22.5, NULL, NULL, '2023-09-27 14:48:50', '2023-09-27 14:48:50');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '2 KG', 1, '2023-10-08 06:13:09', '2023-10-08 06:45:56');

-- --------------------------------------------------------

--
-- Table structure for table `stock_counts`
--

CREATE TABLE `stock_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `category_id` varchar(191) DEFAULT NULL,
  `brand_id` varchar(191) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `initial_file` varchar(191) DEFAULT NULL,
  `final_file` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_adjusted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_counts`
--

INSERT INTO `stock_counts` (`id`, `reference_no`, `warehouse_id`, `category_id`, `brand_id`, `user_id`, `type`, `initial_file`, `final_file`, `note`, `is_adjusted`, `created_at`, `updated_at`) VALUES
(1, 'scr-20230305-121413', 1, NULL, NULL, 1, 'full', '20230305-121413.csv', NULL, NULL, 0, '2023-03-04 18:14:13', '2023-03-04 18:14:13'),
(2, 'scr-20230509-030739', 1, NULL, NULL, 1, 'full', '20230509-030739.csv', NULL, NULL, 0, '2023-05-09 09:07:39', '2023-05-09 09:07:39'),
(3, 'scr-20231004-073035', 1, NULL, NULL, 45, 'full', '20231004-073035.csv', NULL, NULL, 0, '2023-10-04 13:30:35', '2023-10-04 13:30:35');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) NOT NULL,
  `vat_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone_number` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'tests', NULL, 'Test', NULL, 'test@gmail.com', '0130934809340', 'test', 'Rangpur', NULL, NULL, NULL, 0, '2023-09-08 12:43:11', '2023-09-11 11:09:51'),
(2, 'Opening Stock September', NULL, 'Amishghor', NULL, NULL, '01000100', 'Rangpur', 'Rangpur', NULL, NULL, NULL, 1, '2023-09-11 11:09:41', '2023-09-11 11:26:11'),
(3, 'Creative Poultry & Dairy', NULL, 'Creative', NULL, 'cpdfl.bd@gmail.com', '01722934151', 'gongachara', 'Rangpur', NULL, NULL, NULL, 1, '2023-09-18 15:22:31', '2023-09-18 15:22:31'),
(4, 'Muhit', NULL, 'Muhit poultry', NULL, 'seller@gmail.com', '01749411245', 'Rangpur', 'Rangpur', NULL, NULL, NULL, 1, '2023-09-18 15:26:16', '2023-09-18 15:26:16');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `from_warehouse_id` int(11) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `unit_code` varchar(191) NOT NULL,
  `unit_name` varchar(191) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(191) DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit_code`, `unit_name`, `base_unit`, `operator`, `operation_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'piece', 'PC', NULL, '*', 1, 1, '2023-09-08 12:40:59', '2023-09-08 12:40:59'),
(2, 'kg', 'KG', 3, '*', 1000, 1, '2023-09-11 11:05:09', '2023-09-11 11:36:56'),
(3, 'gm', 'GM', NULL, '*', 1, 1, '2023-09-11 11:36:36', '2023-09-11 11:36:36'),
(4, 'dz', 'Dozen', 1, '*', 12, 1, '2023-09-11 11:54:31', '2023-09-11 11:54:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `phone` varchar(191) NOT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `phone`, `company_name`, `role_id`, `biller_id`, `warehouse_id`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
(45, 'admin', 'amishghor@gmail.com', '$2a$12$UXntlKZmjuWCJWBdAkeXae3ip8S7FAjrLJeUgcmr4F.erI5ah/XPi', NULL, '01230493249', 'Amishgor', 1, NULL, NULL, 1, 0, '2023-03-07 11:01:13', '2023-09-11 08:07:08'),
(46, 'seller', 'seller@gmail.com', '$2y$10$2.S.CuvgPkDtN/oCgi.zLepREfUHRzAvJgl6Hoz6LL3Pd/xUKZRGq', NULL, '01000100', 'Amishghor', 4, 1, 1, 1, 0, '2023-09-11 14:26:18', '2023-10-03 05:14:13');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `address` text NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `email`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Amishghor', '01705489142', 'mail@amishghor.com', 'Gangachara Road, Pakarmatha, Rangpur', 1, '2023-02-27 17:09:47', '2023-09-11 11:04:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billers`
--
ALTER TABLE `billers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plans`
--
ALTER TABLE `discount_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plan_customers`
--
ALTER TABLE `discount_plan_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plan_discounts`
--
ALTER TABLE `discount_plan_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dso_alerts`
--
ALTER TABLE `dso_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `money_transfers`
--
ALTER TABLE `money_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owner_transections`
--
ALTER TABLE `owner_transections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_cheque`
--
ALTER TABLE `payment_with_cheque`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_gift_card`
--
ALTER TABLE `payment_with_gift_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_paypal`
--
ALTER TABLE `payment_with_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_setting`
--
ALTER TABLE `pos_setting`
  ADD UNIQUE KEY `pos_setting_id_unique` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_batches`
--
ALTER TABLE `product_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_purchases`
--
ALTER TABLE `product_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_quotation`
--
ALTER TABLE `product_quotation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_returns`
--
ALTER TABLE `product_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sales`
--
ALTER TABLE `product_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_transfer`
--
ALTER TABLE `product_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_product_return`
--
ALTER TABLE `purchase_product_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_purchases`
--
ALTER TABLE `return_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reward_point_settings`
--
ALTER TABLE `reward_point_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_counts`
--
ALTER TABLE `stock_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `billers`
--
ALTER TABLE `billers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_plans`
--
ALTER TABLE `discount_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_plan_customers`
--
ALTER TABLE `discount_plan_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_plan_discounts`
--
ALTER TABLE `discount_plan_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dso_alerts`
--
ALTER TABLE `dso_alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `money_transfers`
--
ALTER TABLE `money_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `owners`
--
ALTER TABLE `owners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `owner_transections`
--
ALTER TABLE `owner_transections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=799;

--
-- AUTO_INCREMENT for table `payment_with_cheque`
--
ALTER TABLE `payment_with_cheque`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_gift_card`
--
ALTER TABLE `payment_with_gift_card`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_paypal`
--
ALTER TABLE `payment_with_paypal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_batches`
--
ALTER TABLE `product_batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_purchases`
--
ALTER TABLE `product_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `product_quotation`
--
ALTER TABLE `product_quotation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_returns`
--
ALTER TABLE `product_returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_sales`
--
ALTER TABLE `product_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=847;

--
-- AUTO_INCREMENT for table `product_transfer`
--
ALTER TABLE `product_transfer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `purchase_product_return`
--
ALTER TABLE `purchase_product_return`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_purchases`
--
ALTER TABLE `return_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_point_settings`
--
ALTER TABLE `reward_point_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=803;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_counts`
--
ALTER TABLE `stock_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
