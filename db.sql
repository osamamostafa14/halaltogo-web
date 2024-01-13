-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2024 at 02:16 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `halal_to_go`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `current_balance` decimal(24,2) NOT NULL,
  `amount` decimal(24,2) NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'collected',
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addon_settings`
--

CREATE TABLE `addon_settings` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_values` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_values` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'live',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `additional_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addon_settings`
--

INSERT INTO `addon_settings` (`id`, `key_name`, `live_values`, `test_values`, `settings_type`, `mode`, `is_active`, `created_at`, `updated_at`, `additional_data`) VALUES
('070c6bbd-d777-11ed-96f4-0c7a158e4469', 'twilio', '{\"gateway\":\"twilio\",\"mode\":\"live\",\"status\":\"0\",\"sid\":\"data\",\"messaging_service_sid\":\"data\",\"token\":\"data\",\"from\":\"data\",\"otp_template\":\"data\"}', '{\"gateway\":\"twilio\",\"mode\":\"live\",\"status\":\"0\",\"sid\":\"data\",\"messaging_service_sid\":\"data\",\"token\":\"data\",\"from\":\"data\",\"otp_template\":\"data\"}', 'sms_config', 'live', 0, NULL, '2023-08-12 07:01:29', NULL),
('070c766c-d777-11ed-96f4-0c7a158e4469', '2factor', '{\"gateway\":\"2factor\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"data\"}', '{\"gateway\":\"2factor\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"data\"}', 'sms_config', 'live', 0, NULL, '2023-08-12 07:01:36', NULL),
('0d8a9308-d6a5-11ed-962c-0c7a158e4469', 'mercadopago', '{\"gateway\":\"mercadopago\",\"mode\":\"live\",\"status\":1,\"access_token\":\"\",\"public_key\":\"\"}', '{\"gateway\":\"mercadopago\",\"mode\":\"live\",\"status\":1,\"access_token\":\"\",\"public_key\":\"\"}', 'payment_config', 'live', 1, NULL, '2023-08-27 11:57:11', '{\"gateway_title\":\"Mercadopago\",\"gateway_image\":null}'),
('0d8a9e49-d6a5-11ed-962c-0c7a158e4469', 'liqpay', '{\"gateway\":\"liqpay\",\"mode\":\"test\",\"status\":\"0\",\"private_key\":\"data\",\"public_key\":\"data\"}', '{\"gateway\":\"liqpay\",\"mode\":\"test\",\"status\":\"0\",\"private_key\":\"data\",\"public_key\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-12 06:32:31', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('101befdf-d44b-11ed-8564-0c7a158e4469', 'paypal', '{\"gateway\":\"paypal\",\"mode\":\"test\",\"status\":\"0\",\"client_id\":\"data\",\"client_secret\":\"data\"}', '{\"gateway\":\"paypal\",\"mode\":\"test\",\"status\":\"0\",\"client_id\":\"data\",\"client_secret\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-30 03:41:32', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('133d9647-cabb-11ed-8fec-0c7a158e4469', 'hyper_pay', '{\"gateway\":\"hyper_pay\",\"mode\":\"test\",\"status\":\"0\",\"entity_id\":\"data\",\"access_code\":\"data\"}', '{\"gateway\":\"hyper_pay\",\"mode\":\"test\",\"status\":\"0\",\"entity_id\":\"data\",\"access_code\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-12 06:32:42', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('1821029f-d776-11ed-96f4-0c7a158e4469', 'msg91', '{\"gateway\":\"msg91\",\"mode\":\"live\",\"status\":\"0\",\"template_id\":\"data\",\"auth_key\":\"data\"}', '{\"gateway\":\"msg91\",\"mode\":\"live\",\"status\":\"0\",\"template_id\":\"data\",\"auth_key\":\"data\"}', 'sms_config', 'live', 0, NULL, '2023-08-12 07:01:48', NULL),
('18210f2b-d776-11ed-96f4-0c7a158e4469', 'nexmo', '{\"gateway\":\"nexmo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\",\"api_secret\":\"\",\"token\":\"\",\"from\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"nexmo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\",\"api_secret\":\"\",\"token\":\"\",\"from\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, '2023-04-10 02:14:44', NULL),
('18fbb21f-d6ad-11ed-962c-0c7a158e4469', 'foloosi', '{\"gateway\":\"foloosi\",\"mode\":\"test\",\"status\":\"0\",\"merchant_key\":\"data\"}', '{\"gateway\":\"foloosi\",\"mode\":\"test\",\"status\":\"0\",\"merchant_key\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-12 06:34:33', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('2767d142-d6a1-11ed-962c-0c7a158e4469', 'paytm', '{\"gateway\":\"paytm\",\"mode\":\"test\",\"status\":\"0\",\"merchant_key\":\"data\",\"merchant_id\":\"data\",\"merchant_website_link\":\"data\"}', '{\"gateway\":\"paytm\",\"mode\":\"test\",\"status\":\"0\",\"merchant_key\":\"data\",\"merchant_id\":\"data\",\"merchant_website_link\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-22 06:30:55', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('3201d2e6-c937-11ed-a424-0c7a158e4469', 'amazon_pay', '{\"gateway\":\"amazon_pay\",\"mode\":\"test\",\"status\":\"0\",\"pass_phrase\":\"data\",\"access_code\":\"data\",\"merchant_identifier\":\"data\"}', '{\"gateway\":\"amazon_pay\",\"mode\":\"test\",\"status\":\"0\",\"pass_phrase\":\"data\",\"access_code\":\"data\",\"merchant_identifier\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-12 06:36:07', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('4593b25c-d6a1-11ed-962c-0c7a158e4469', 'paytabs', '{\"gateway\":\"paytabs\",\"mode\":\"test\",\"status\":\"0\",\"profile_id\":\"data\",\"server_key\":\"data\",\"base_url\":\"data\"}', '{\"gateway\":\"paytabs\",\"mode\":\"test\",\"status\":\"0\",\"profile_id\":\"data\",\"server_key\":\"data\",\"base_url\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-12 06:34:51', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('4e9b8dfb-e7d1-11ed-a559-0c7a158e4469', 'bkash', '{\"gateway\":\"bkash\",\"mode\":\"test\",\"status\":\"0\",\"app_key\":\"data\",\"app_secret\":\"data\",\"username\":\"data\",\"password\":\"data\"}', '{\"gateway\":\"bkash\",\"mode\":\"test\",\"status\":\"0\",\"app_key\":\"data\",\"app_secret\":\"data\",\"username\":\"data\",\"password\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-12 06:39:42', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('544a24a4-c872-11ed-ac7a-0c7a158e4469', 'fatoorah', '{\"gateway\":\"fatoorah\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\"}', '{\"gateway\":\"fatoorah\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-12 06:36:24', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('58c1bc8a-d6ac-11ed-962c-0c7a158e4469', 'ccavenue', '{\"gateway\":\"ccavenue\",\"mode\":\"test\",\"status\":\"0\",\"merchant_id\":\"data\",\"working_key\":\"data\",\"access_code\":\"data\"}', '{\"gateway\":\"ccavenue\",\"mode\":\"test\",\"status\":\"0\",\"merchant_id\":\"data\",\"working_key\":\"data\",\"access_code\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-30 03:42:38', '{\"gateway_title\":null,\"gateway_image\":\"2023-04-13-643783f01d386.png\"}'),
('5e2d2ef9-d6ab-11ed-962c-0c7a158e4469', 'thawani', '{\"gateway\":\"thawani\",\"mode\":\"test\",\"status\":\"0\",\"public_key\":\"data\",\"private_key\":\"data\"}', '{\"gateway\":\"thawani\",\"mode\":\"test\",\"status\":\"0\",\"public_key\":\"data\",\"private_key\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-30 04:50:40', '{\"gateway_title\":null,\"gateway_image\":\"2023-04-13-64378f9856f29.png\"}'),
('60cc83cc-d5b9-11ed-b56f-0c7a158e4469', 'sixcash', '{\"gateway\":\"sixcash\",\"mode\":\"test\",\"status\":\"0\",\"public_key\":\"data\",\"secret_key\":\"data\",\"merchant_number\":\"data\",\"base_url\":\"data\"}', '{\"gateway\":\"sixcash\",\"mode\":\"test\",\"status\":\"0\",\"public_key\":\"data\",\"secret_key\":\"data\",\"merchant_number\":\"data\",\"base_url\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-30 04:16:17', '{\"gateway_title\":null,\"gateway_image\":\"2023-04-12-6436774e77ff9.png\"}'),
('68579846-d8e8-11ed-8249-0c7a158e4469', 'alphanet_sms', '{\"gateway\":\"alphanet_sms\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"alphanet_sms\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, NULL, NULL),
('6857a2e8-d8e8-11ed-8249-0c7a158e4469', 'sms_to', '{\"gateway\":\"sms_to\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"sender_id\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"sms_to\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"sender_id\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, NULL, NULL),
('74c30c00-d6a6-11ed-962c-0c7a158e4469', 'hubtel', '{\"gateway\":\"hubtel\",\"mode\":\"test\",\"status\":\"0\",\"account_number\":\"data\",\"api_id\":\"data\",\"api_key\":\"data\"}', '{\"gateway\":\"hubtel\",\"mode\":\"test\",\"status\":\"0\",\"account_number\":\"data\",\"api_id\":\"data\",\"api_key\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-12 06:37:43', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('74e46b0a-d6aa-11ed-962c-0c7a158e4469', 'tap', '{\"gateway\":\"tap\",\"mode\":\"test\",\"status\":\"0\",\"secret_key\":\"data\"}', '{\"gateway\":\"tap\",\"mode\":\"test\",\"status\":\"0\",\"secret_key\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-30 04:50:09', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('761ca96c-d1eb-11ed-87ca-0c7a158e4469', 'swish', '{\"gateway\":\"swish\",\"mode\":\"test\",\"status\":\"0\",\"number\":\"data\"}', '{\"gateway\":\"swish\",\"mode\":\"test\",\"status\":\"0\",\"number\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-30 04:17:02', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('7b1c3c5f-d2bd-11ed-b485-0c7a158e4469', 'payfast', '{\"gateway\":\"payfast\",\"mode\":\"test\",\"status\":\"0\",\"merchant_id\":\"data\",\"secured_key\":\"data\"}', '{\"gateway\":\"payfast\",\"mode\":\"test\",\"status\":\"0\",\"merchant_id\":\"data\",\"secured_key\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-30 04:18:13', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('8592417b-d1d1-11ed-a984-0c7a158e4469', 'esewa', '{\"gateway\":\"esewa\",\"mode\":\"test\",\"status\":\"0\",\"merchantCode\":\"data\"}', '{\"gateway\":\"esewa\",\"mode\":\"test\",\"status\":\"0\",\"merchantCode\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-30 04:17:38', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('9162a1dc-cdf1-11ed-affe-0c7a158e4469', 'viva_wallet', '{\"gateway\":\"viva_wallet\",\"mode\":\"test\",\"status\":\"0\",\"client_id\": \"\",\"client_secret\": \"\", \"source_code\":\"\"}\n', '{\"gateway\":\"viva_wallet\",\"mode\":\"test\",\"status\":\"0\",\"client_id\": \"\",\"client_secret\": \"\", \"source_code\":\"\"}\n', 'payment_config', 'test', 0, NULL, NULL, NULL),
('998ccc62-d6a0-11ed-962c-0c7a158e4469', 'stripe', '{\"gateway\":\"stripe\",\"mode\":\"test\",\"status\":\"1\",\"api_key\":\"data\",\"published_key\":\"data\"}', '{\"gateway\":\"stripe\",\"mode\":\"test\",\"status\":\"1\",\"api_key\":\"data\",\"published_key\":\"data\"}', 'payment_config', 'test', 1, NULL, '2023-08-30 04:18:55', '{\"gateway_title\":null,\"gateway_image\":\"2023-08-10-64d4bc2bb983a.png\"}'),
('a3313755-c95d-11ed-b1db-0c7a158e4469', 'iyzi_pay', '{\"gateway\":\"iyzi_pay\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\",\"secret_key\":\"data\",\"base_url\":\"data\"}', '{\"gateway\":\"iyzi_pay\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\",\"secret_key\":\"data\",\"base_url\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-30 04:20:02', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('a76c8993-d299-11ed-b485-0c7a158e4469', 'momo', '{\"gateway\":\"momo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"data\",\"api_user\":\"data\",\"subscription_key\":\"data\"}', '{\"gateway\":\"momo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"data\",\"api_user\":\"data\",\"subscription_key\":\"data\"}', 'payment_config', 'live', 0, NULL, '2023-08-30 04:19:28', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('a8608119-cc76-11ed-9bca-0c7a158e4469', 'moncash', '{\"gateway\":\"moncash\",\"mode\":\"test\",\"status\":\"0\",\"client_id\":\"data\",\"secret_key\":\"data\"}', '{\"gateway\":\"moncash\",\"mode\":\"test\",\"status\":\"0\",\"client_id\":\"data\",\"secret_key\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-30 04:47:34', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('ad5af1c1-d6a2-11ed-962c-0c7a158e4469', 'razor_pay', '{\"gateway\":\"razor_pay\",\"mode\":\"test\",\"status\":\"1\",\"api_key\":\"data\",\"api_secret\":\"data\"}', '{\"gateway\":\"razor_pay\",\"mode\":\"test\",\"status\":\"1\",\"api_key\":\"data\",\"api_secret\":\"data\"}', 'payment_config', 'test', 1, NULL, '2023-08-30 04:47:00', '{\"gateway_title\":null,\"gateway_image\":\"2023-08-10-64d4bbeecee6c.png\"}'),
('ad5b02a0-d6a2-11ed-962c-0c7a158e4469', 'senang_pay', '{\"gateway\":\"senang_pay\",\"mode\":\"test\",\"status\":\"0\",\"callback_url\":\"data\",\"secret_key\":\"data\",\"merchant_id\":\"data\"}', '{\"gateway\":\"senang_pay\",\"mode\":\"test\",\"status\":\"0\",\"callback_url\":\"data\",\"secret_key\":\"data\",\"merchant_id\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-27 09:58:57', '{\"gateway_title\":\"data\",\"gateway_image\":\"\"}'),
('b6c333f6-d8e9-11ed-8249-0c7a158e4469', 'akandit_sms', '{\"gateway\":\"akandit_sms\",\"mode\":\"live\",\"status\":0,\"username\":\"\",\"password\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"akandit_sms\",\"mode\":\"live\",\"status\":0,\"username\":\"\",\"password\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, NULL, NULL),
('b6c33c87-d8e9-11ed-8249-0c7a158e4469', 'global_sms', '{\"gateway\":\"global_sms\",\"mode\":\"live\",\"status\":0,\"user_name\":\"\",\"password\":\"\",\"from\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"global_sms\",\"mode\":\"live\",\"status\":0,\"user_name\":\"\",\"password\":\"\",\"from\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, NULL, NULL),
('b8992bd4-d6a0-11ed-962c-0c7a158e4469', 'paymob_accept', '{\"gateway\":\"paymob_accept\",\"mode\":\"live\",\"status\":\"0\",\"callback_url\":null,\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}', '{\"gateway\":\"paymob_accept\",\"mode\":\"live\",\"status\":\"0\",\"callback_url\":null,\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}', 'payment_config', 'live', 1, NULL, NULL, '{\"gateway_title\":\"Paymob accept\",\"gateway_image\":null}'),
('c41c0dcd-d119-11ed-9f67-0c7a158e4469', 'maxicash', '{\"gateway\":\"maxicash\",\"mode\":\"test\",\"status\":\"0\",\"merchantId\":\"data\",\"merchantPassword\":\"data\"}', '{\"gateway\":\"maxicash\",\"mode\":\"test\",\"status\":\"0\",\"merchantId\":\"data\",\"merchantPassword\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-30 04:49:15', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('c9249d17-cd60-11ed-b879-0c7a158e4469', 'pvit', '{\"gateway\":\"pvit\",\"mode\":\"test\",\"status\":\"0\",\"mc_tel_merchant\": \"\",\"access_token\": \"\", \"mc_merchant_code\": \"\"}', '{\"gateway\":\"pvit\",\"mode\":\"test\",\"status\":\"0\",\"mc_tel_merchant\": \"\",\"access_token\": \"\", \"mc_merchant_code\": \"\"}', 'payment_config', 'test', 0, NULL, NULL, NULL),
('cb0081ce-d775-11ed-96f4-0c7a158e4469', 'releans', '{\"gateway\":\"releans\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"from\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"releans\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"from\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, '2023-04-10 02:14:44', NULL),
('d4f3f5f1-d6a0-11ed-962c-0c7a158e4469', 'flutterwave', '{\"gateway\":\"flutterwave\",\"mode\":\"live\",\"status\":1,\"secret_key\":\"\",\"public_key\":\"\",\"hash\":\"\"}', '{\"gateway\":\"flutterwave\",\"mode\":\"live\",\"status\":1,\"secret_key\":\"\",\"public_key\":\"\",\"hash\":\"\"}', 'payment_config', 'live', 1, NULL, '2023-08-30 04:41:03', '{\"gateway_title\":\"Flutterwave\",\"gateway_image\":null}'),
('d822f1a5-c864-11ed-ac7a-0c7a158e4469', 'paystack', '{\"gateway\":\"paystack\",\"mode\":\"test\",\"status\":\"1\",\"public_key\":\"data\",\"secret_key\":\"data\",\"merchant_email\":\"data\"}', '{\"gateway\":\"paystack\",\"mode\":\"test\",\"status\":\"1\"\"public_key\":\"data\",\"secret_key\":\"data\",\"merchant_email\":\"data\"}', 'payment_config', 'test', 1, NULL, '2023-08-30 04:20:45', '{\"gateway_title\":null,\"gateway_image\":\"2023-08-10-64d4bb67d6345.png\"}'),
('daec8d59-c893-11ed-ac7a-0c7a158e4469', 'xendit', '{\"gateway\":\"xendit\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\"}', '{\"gateway\":\"xendit\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-12 06:35:46', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('dc0f5fc9-d6a5-11ed-962c-0c7a158e4469', 'worldpay', '{\"gateway\":\"worldpay\",\"mode\":\"test\",\"status\":\"0\",\"OrgUnitId\":\"data\",\"jwt_issuer\":\"data\",\"mac\":\"data\",\"merchantCode\":\"data\",\"xml_password\":\"data\"}', '{\"gateway\":\"worldpay\",\"mode\":\"test\",\"status\":\"0\",\"OrgUnitId\":\"data\",\"jwt_issuer\":\"data\",\"mac\":\"data\",\"merchantCode\":\"data\",\"xml_password\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-12 06:35:26', '{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('e0450278-d8eb-11ed-8249-0c7a158e4469', 'signal_wire', '{\"gateway\":\"signal_wire\",\"mode\":\"live\",\"status\":0,\"project_id\":\"\",\"token\":\"\",\"space_url\":\"\",\"from\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"signal_wire\",\"mode\":\"live\",\"status\":0,\"project_id\":\"\",\"token\":\"\",\"space_url\":\"\",\"from\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, NULL, NULL),
('e0450b40-d8eb-11ed-8249-0c7a158e4469', 'paradox', '{\"gateway\":\"paradox\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\",\"sender_id\":\"\"}', '{\"gateway\":\"paradox\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\",\"sender_id\":\"\"}', 'sms_config', 'live', 0, NULL, '2023-09-10 01:14:01', NULL),
('ea346efe-cdda-11ed-affe-0c7a158e4469', 'ssl_commerz', '{\"gateway\":\"ssl_commerz\",\"mode\":\"test\",\"status\":\"0\",\"store_id\":\"data\",\"store_password\":\"data\"}', '{\"gateway\":\"ssl_commerz\",\"mode\":\"test\",\"status\":\"0\",\"store_id\":\"data\",\"store_password\":\"data\"}', 'payment_config', 'test', 0, NULL, '2023-08-30 03:43:49', '{\"gateway_title\":null,\"gateway_image\":\"2023-08-20-64e1ec1fb1730.png\"}'),
('eed88336-d8ec-11ed-8249-0c7a158e4469', 'hubtel', '{\"gateway\":\"hubtel\",\"mode\":\"live\",\"status\":0,\"sender_id\":\"\",\"client_id\":\"\",\"client_secret\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"hubtel\",\"mode\":\"live\",\"status\":0,\"sender_id\":\"\",\"client_id\":\"\",\"client_secret\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, NULL, NULL),
('f149c546-d8ea-11ed-8249-0c7a158e4469', 'viatech', '{\"gateway\":\"viatech\",\"mode\":\"live\",\"status\":0,\"api_url\":\"\",\"api_key\":\"\",\"sender_id\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"viatech\",\"mode\":\"live\",\"status\":0,\"api_url\":\"\",\"api_key\":\"\",\"sender_id\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, NULL, NULL),
('f149cd9c-d8ea-11ed-8249-0c7a158e4469', '019_sms', '{\"gateway\":\"019_sms\",\"mode\":\"live\",\"status\":0,\"password\":\"\",\"username\":\"\",\"username_for_token\":\"\",\"sender\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"019_sms\",\"mode\":\"live\",\"status\":0,\"password\":\"\",\"username\":\"\",\"username_for_token\":\"\",\"sender\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `add_ons`
--

CREATE TABLE `add_ons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `zone_id`) VALUES
(1, 'Osama', 'Mostafa', '0112886195', 'admin@admin.com', NULL, '$2y$10$QaCR26qIFWis76zItxFHA.TVsqsShWsghxi9g8GhRbAY10jlz.nnu', 'lNxHgjLiEmyQbOgQQy1gHtqyVRx8QE5J34lxuP4dZeBgYAoY9DQnnd79bwQ2', NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_features`
--

CREATE TABLE `admin_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_special_criterias`
--

CREATE TABLE `admin_special_criterias` (
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_testimonials`
--

CREATE TABLE `admin_testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reviewer_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `total_commission_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `digital_received` decimal(24,2) NOT NULL DEFAULT 0.00,
  `manual_received` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'free_delivery_over', NULL, '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(2, 'app_minimum_version_ios', NULL, '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(3, 'app_minimum_version_android', NULL, '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(4, 'app_url_ios', NULL, '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(5, 'app_url_android', NULL, '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(6, 'dm_maximum_orders', '1', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(7, 'order_confirmation_model', 'deliveryman', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(8, 'popular_food', '1', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(9, 'popular_restaurant', '1', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(10, 'new_restaurant', '1', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(11, 'most_reviewed_foods', '1', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(12, 'flutterwave', '{\"status\":1,\"public_key\":\"\",\"secret_key\":\"\",\"hash\":\"\"}', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(13, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(14, 'landing_page_text', '{\"header_title_1\":\"Food App\",\"header_title_2\":\"Why stay hungry when you can order from StackFood\",\"header_title_3\":\"Get 10% OFF on your first order\",\"about_title\":\"StackFood is Best Delivery Service Near You\",\"why_choose_us\":\"Why Choose Us?\",\"why_choose_us_title\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\",\"testimonial_title\":\"Trusted by Customer & Restaurant Owner\",\"footer_article\":\"Suspendisse ultrices at diam lectus nullam. Nisl, sagittis viverra enim erat tortor ultricies massa turpis. Arcu pulvinar.\"}', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(15, 'landing_page_links', '{\"app_url_android_status\":\"1\",\"app_url_android\":\"https:\\/\\/play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https:\\/\\/www.apple.com\\/app-store\",\"web_app_url_status\":null,\"web_app_url\":\"front_end\"}', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(16, 'speciality', '[{\"img\":\"clean_&_cheap_icon.png\",\"title\":\"Clean & Cheap Price\"},{\"img\":\"best_dishes_icon.png\",\"title\":\"Best Dishes Near You\"},{\"img\":\"virtual_restaurant_icon.png\",\"title\":\"Your Own Virtual Restaurant\"}]', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(17, 'testimonial', '[{\"img\":\"img-1.png\",\"name\":\"Barry Allen\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A\\r\\n                    aliquam amet animi blanditiis consequatur debitis dicta\\r\\n                    distinctio, enim error eum iste libero modi nam natus\\r\\n                    perferendis possimus quasi sint sit tempora voluptatem. Est,\\r\\n                    exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"img-2.png\",\"name\":\"Sophia Martino\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"img-3.png\",\"name\":\"Alan Turing\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"img-4.png\",\"name\":\"Ann Marie\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"}]', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(18, 'landing_page_images', '{\"top_content_image\":\"double_screen_image.png\",\"about_us_image\":\"about_us_image.png\"}', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(19, 'paymob_accept', '{\"status\":\"0\",\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(20, 'show_dm_earning', '0', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(21, 'canceled_by_deliveryman', '0', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(22, 'canceled_by_restaurant', '0', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(23, 'timeformat', '24', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(24, 'toggle_veg_non_veg', NULL, '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(25, 'toggle_dm_registration', '0', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(26, 'toggle_restaurant_registration', '0', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(27, 'recaptcha', '{\"status\":\"0\",\"site_key\":null,\"secret_key\":null}', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(28, 'schedule_order_slot_duration', '30', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(29, 'digit_after_decimal_point', '2', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(30, 'language', '[\"en\",\"fr-FR\"]', '2024-01-02 09:47:10', '2024-01-02 20:09:42'),
(31, 'icon', '2024-01-02-65948975e8c1a.png', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(32, 'wallet_status', '0', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(33, 'loyalty_point_minimum_point', '0', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(34, 'loyalty_point_status', '0', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(35, 'loyalty_point_item_purchase_point', '0', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(36, 'loyalty_point_exchange_rate', '0', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(37, 'wallet_add_refund', '0', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(38, 'order_refunded_message', 'Order refunded successfully', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(39, 'ref_earning_status', '0', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(40, 'ref_earning_exchange_rate', '0', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(41, 'dm_tips_status', '0', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(42, 'theme', '1', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(43, 'delivery_charge_comission', '0', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(44, 'dm_max_cash_in_hand', '10000', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(45, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"0\"},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"}]', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(46, 'fcm_credentials', '{\"apiKey\":\"\",\"authDomain\":\"\",\"projectId\":\"\",\"storageBucket\":\"\",\"messagingSenderId\":\"\",\"appId\":\"\",\"measurementId\":\"\"}', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(47, 'refund_active_status', '1', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(48, 'business_model', '{\"commission\":1,\"subscription\":0}', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(49, 'tax_included', NULL, '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(50, 'site_direction', 'ltr', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(51, 'take_away', '1', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(52, 'repeat_order_option', '1', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(53, 'home_delivery', '1', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(54, 'landing_page', '1', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(55, 'landing_integration_type', 'none', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(56, 'instant_order', '1', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(57, 'logo', '2024-01-02-6594898ccc2a3.png', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(58, 'business_name', 'HalalToGo', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(59, 'footer_text', 'HalalToGo', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(60, 'map_api_key', 'AIzaSyAOmCMG__6_UEnJgBvvkWy_z6WX-MxFxJw', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(61, 'default_location', '{\"lat\":\"48.871924690556774\",\"lng\":\"2.37587102022686\"}', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(62, 'cash_on_delivery', '{\"status\":\"1\"}', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(63, 'guest_checkout_status', '0', NULL, NULL),
(64, 'order_notification_type', NULL, NULL, NULL),
(65, 'additional_charge_status', NULL, NULL, NULL),
(66, 'additional_charge_name', 'Processing fee', NULL, NULL),
(67, 'additional_charge', NULL, NULL, NULL),
(68, 'currency', 'EUR', NULL, NULL),
(69, 'timezone', 'UTC', NULL, NULL),
(70, 'phone', '89374394873', NULL, NULL),
(71, 'email_address', 'halaltogo@gmail.com', NULL, NULL),
(72, 'address', 'Paris, France', NULL, NULL),
(73, 'cookies_text', 'HalalToGo', NULL, NULL),
(74, 'currency_symbol_position', 'left', NULL, NULL),
(75, 'tax', NULL, NULL, NULL),
(76, 'admin_commission', '0', NULL, NULL),
(77, 'country', 'FR', NULL, NULL),
(78, 'admin_order_notification', NULL, NULL, NULL),
(79, 'free_delivery_distance', NULL, NULL, NULL),
(80, 'partial_payment_status', NULL, NULL, NULL),
(81, 'partial_payment_method', NULL, NULL, NULL),
(82, 'system_language', '[{\"id\":1,\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":false},{\"id\":2,\"direction\":\"ltr\",\"code\":\"fr-FR\",\"status\":1,\"default\":true}]', '2024-01-02 19:27:35', '2024-01-02 20:09:49'),
(83, 'digital_payment', '{\"status\":1}', '2024-01-02 19:27:35', '2024-01-02 20:09:49'),
(84, 'customer_verification', '1', '2024-01-02 19:27:35', '2024-01-02 20:09:49'),
(85, 'schedule_order', '0', '2024-01-02 19:27:35', '2024-01-02 20:09:49'),
(86, 'order_delivery_verification', '0', '2024-01-02 19:27:35', '2024-01-02 20:09:49'),
(87, 'map_api_key_server', 'AIzaSyAOmCMG__6_UEnJgBvvkWy_z6WX-MxFxJw', '2024-01-02 09:47:10', '2024-01-02 09:47:10'),
(88, 'instant_order', '1', '2024-01-02 09:47:10', '2024-01-02 09:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_restaurant`
--

CREATE TABLE `campaign_restaurant` (
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `campaign_status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT 0,
  `add_on_ids` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_on_qtys` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(24,3) NOT NULL,
  `quantity` int(11) NOT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `position`, `status`, `created_at`, `updated_at`, `priority`, `slug`) VALUES
(1, 'Fried', '2024-01-09-659d5f4121cec.png', 0, 0, 1, '2024-01-02 12:24:36', '2024-01-09 12:59:13', 1, 'fried-chicken'),
(2, 'Fried Chicken', 'def.png', 1, 1, 1, '2024-01-02 12:25:56', '2024-01-02 12:25:56', 0, 'fried-chicken-2'),
(3, 'Burger', '2024-01-09-659d5f947672b.png', 0, 0, 1, '2024-01-09 12:49:49', '2024-01-09 13:00:36', 0, 'burger'),
(4, 'Noodles', '2024-01-09-659d60e81b589.png', 0, 0, 1, '2024-01-09 12:52:05', '2024-01-09 13:06:16', 0, 'noodles'),
(5, 'Grilled', '2024-01-09-659d6158c1f74.png', 0, 0, 1, '2024-01-09 12:55:02', '2024-01-09 13:08:08', 0, 'grilled'),
(6, 'Sea Food', '2024-01-09-659d628248826.png', 0, 0, 1, '2024-01-09 13:13:06', '2024-01-09 13:17:51', 0, 'shrimps');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `seen` tinyint(1) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sender_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `receiver_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unread_message_count` int(11) DEFAULT NULL,
  `last_message_id` bigint(20) UNSIGNED DEFAULT NULL,
  `last_message_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `sender_id`, `sender_type`, `receiver_id`, `receiver_type`, `unread_message_count`, `last_message_id`, `last_message_time`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', 0, 'admin', 1, 2, '2024-01-09 22:57:20', '2024-01-09 20:56:56', '2024-01-09 20:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `coupon_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `limit` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_uses` bigint(20) DEFAULT 0,
  `restaurant_id` bigint(20) DEFAULT NULL,
  `created_by` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '["all"]',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `code`, `start_date`, `expire_date`, `min_purchase`, `max_discount`, `discount`, `discount_type`, `coupon_type`, `limit`, `status`, `created_at`, `updated_at`, `data`, `total_uses`, `restaurant_id`, `created_by`, `customer_id`, `slug`) VALUES
(1, 'Get 100 EURO Off On All Orders', 'osama5464', '2024-01-09', '2024-01-27', '0.00', '0.00', '100.00', 'amount', 'restaurant_wise', 10, 1, '2024-01-09 10:19:29', '2024-01-09 10:23:39', '[\"1\"]', 0, NULL, 'admin', '[\"all\"]', NULL),
(2, 'Get 10% Off On All Orders', 'osama123', '2024-01-09', '2025-02-09', '0.00', '100000.00', '10.00', 'percent', 'zone_wise', 10, 1, '2024-01-09 10:23:09', '2024-01-09 10:23:09', '[\"1\"]', 0, NULL, 'admin', '[\"all\"]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cuisines`
--

CREATE TABLE `cuisines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cuisines`
--

INSERT INTO `cuisines` (`id`, `name`, `image`, `status`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Chicken', '2024-01-03-6594a5226c39a.png', 1, 'restaurant-1', '2024-01-02 12:07:17', '2024-01-02 22:06:58'),
(2, 'French', '2024-01-09-659d3e45e49a9.png', 1, 'french', '2024-01-09 10:38:30', '2024-01-09 10:38:30'),
(3, 'Fast food', '2024-01-09-659d3ebab5db2.png', 1, 'fast-food', '2024-01-09 10:40:26', '2024-01-09 10:40:26'),
(4, 'Fruit de mer', '2024-01-09-659d3f1006278.png', 1, 'fruit-de-mer', '2024-01-09 10:41:52', '2024-01-09 10:41:52'),
(5, 'Chinese', '2024-01-09-659d3f59b0310.png', 1, 'chinese', '2024-01-09 10:43:05', '2024-01-09 10:43:05'),
(6, 'Mexico', '2024-01-09-659d5bb248815.png', 1, 'mexico', '2024-01-09 12:44:02', '2024-01-09 12:44:02'),
(7, 'Egyptian', '2024-01-09-659d5be254aae.png', 1, 'egyptian', '2024-01-09 12:44:50', '2024-01-09 12:44:50'),
(8, 'Grilled', '2024-01-09-659d5caf66583.png', 1, 'grilled', '2024-01-09 12:47:48', '2024-01-09 12:48:15');

-- --------------------------------------------------------

--
-- Table structure for table `cuisine_restaurant`
--

CREATE TABLE `cuisine_restaurant` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `cuisine_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cuisine_restaurant`
--

INSERT INTO `cuisine_restaurant` (`id`, `restaurant_id`, `cuisine_id`) VALUES
(1, 1, 1),
(2, 2, 5),
(3, 3, 2),
(4, 3, 5),
(5, 4, 2),
(6, 4, 3),
(7, 4, 4),
(8, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency_code`, `currency_symbol`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'France', 'EUR', '€', '1.10', '2024-01-09 00:53:51', '2024-01-10 00:53:51');

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `floor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `road` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_settings`
--

CREATE TABLE `data_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_settings`
--

INSERT INTO `data_settings` (`id`, `key`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'admin_login_url', 'admin', 'login_admin', '2023-06-20 13:55:51', '2023-06-20 13:55:51'),
(2, 'admin_employee_login_url', 'admin-employee', 'login_admin_employee', '2023-06-20 13:55:51', '2023-06-20 13:55:51'),
(3, 'restaurant_login_url', 'restaurant', 'login_restaurant', '2023-06-20 13:55:51', '2023-06-20 13:55:51'),
(4, 'restaurant_employee_login_url', 'restaurant-employee', 'login_restaurant_employee', '2023-06-20 13:55:51', '2023-06-20 13:55:51'),
(5, 'header_title', 'Why stay Hungry !', 'admin_landing_page', '2023-06-20 14:59:39', '2023-06-20 14:59:39'),
(6, 'header_sub_title', 'when you can order always form', 'admin_landing_page', '2023-06-20 14:59:39', '2023-06-20 14:59:39'),
(7, 'header_tag_line', 'Start Your Business or Download the App', 'admin_landing_page', '2023-06-20 14:59:39', '2023-06-20 14:59:39'),
(8, 'header_app_button_name', 'Order Now', 'admin_landing_page', '2023-06-20 14:59:39', '2023-06-20 14:59:39'),
(9, 'header_app_button_status', '1', 'admin_landing_page', '2023-06-20 14:59:39', '2023-06-20 14:59:39'),
(10, 'header_button_content', 'https://stackfood-web.6amtech.com/', 'admin_landing_page', '2023-06-20 14:59:39', '2023-06-20 14:59:39'),
(11, 'header_image_content', '{\"header_content_image\":\"2023-06-20-649195583412a.png\",\"header_bg_image\":\"2023-06-20-6491952b48c1c.png\"}', 'admin_landing_page', '2023-06-20 15:01:47', '2023-06-20 15:02:32'),
(12, 'header_floating_content', '{\"header_floating_total_order\":\"5000\",\"header_floating_total_user\":\"999\",\"header_floating_total_reviews\":\"2330\"}', 'admin_landing_page', '2023-06-20 15:04:04', '2023-06-20 15:04:04'),
(13, 'about_us_image_content', '2023-06-20-6491971deaf62.png', 'admin_landing_page', '2023-06-20 15:10:05', '2023-06-20 15:10:05'),
(14, 'about_us_title', 'Stack Food', 'admin_landing_page', '2023-06-20 15:10:05', '2023-06-20 15:10:05'),
(15, 'about_us_sub_title', 'is Best Delivery Service Near You', 'admin_landing_page', '2023-06-20 15:10:05', '2023-06-20 15:10:05'),
(16, 'about_us_text', 'We make food delivery more interesting.\r\nFind the greatest deals from the restaurants near you.\r\nTesty & healthy dishes. Bring a restaurant into your home.', 'admin_landing_page', '2023-06-20 15:10:06', '2023-06-20 15:12:42'),
(17, 'about_us_app_button_name', 'Download Now', 'admin_landing_page', '2023-06-20 15:10:06', '2023-06-20 15:10:06'),
(18, 'about_us_app_button_status', '1', 'admin_landing_page', '2023-06-20 15:10:06', '2023-06-20 15:10:06'),
(19, 'about_us_button_content', 'https://play.google.com/store/', 'admin_landing_page', '2023-06-20 15:10:06', '2023-06-20 15:10:06'),
(20, 'feature_title', 'Stunning Features', 'admin_landing_page', '2023-06-20 15:13:41', '2023-06-20 15:13:41'),
(21, 'feature_sub_title', 'Remarkable Features that You Can Count!', 'admin_landing_page', '2023-06-20 15:13:41', '2023-06-20 15:13:41'),
(22, 'services_title', 'Our Platform', 'admin_landing_page', '2023-06-20 15:29:43', '2023-06-20 15:29:43'),
(23, 'services_sub_title', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'admin_landing_page', '2023-06-20 15:29:43', '2023-06-20 15:44:11'),
(24, 'services_order_title_1', 'Order your food', 'admin_landing_page', '2023-06-20 15:45:36', '2023-06-20 15:45:36'),
(25, 'services_order_title_2', 'Use stackfood app', 'admin_landing_page', '2023-06-20 15:45:36', '2023-06-20 15:45:36'),
(26, 'services_order_description_1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ex odio,  turpis accumsan congue. Quisque blandit dui P', 'admin_landing_page', '2023-06-20 15:45:36', '2023-06-20 15:45:36'),
(27, 'services_order_description_2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ex odio,  turpis accumsan congue. Quisque blandit dui P', 'admin_landing_page', '2023-06-20 15:45:36', '2023-06-20 15:45:36'),
(28, 'services_order_button_name', 'Download Now', 'admin_landing_page', '2023-06-20 15:45:36', '2023-06-20 15:45:36'),
(29, 'services_order_button_status', '1', 'admin_landing_page', '2023-06-20 15:45:36', '2023-06-20 15:45:36'),
(30, 'services_order_button_link', 'https://play.google.com/store/', 'admin_landing_page', '2023-06-20 15:45:36', '2023-06-20 15:45:36'),
(31, 'services_manage_restaurant_title_1', 'Manage your order', 'admin_landing_page', '2023-06-20 15:47:13', '2023-06-20 15:47:13'),
(32, 'services_manage_restaurant_title_2', 'Manage your wallet', 'admin_landing_page', '2023-06-20 15:47:13', '2023-06-20 15:47:13'),
(33, 'services_manage_restaurant_description_1', 'Manage customer order very easily by using StackFood Restaurant Panel & Restaurant APP', 'admin_landing_page', '2023-06-20 15:47:13', '2023-06-20 15:47:13'),
(34, 'services_manage_restaurant_description_2', 'Manage restaurant wallet and monitor restaurant earnings and transactions.', 'admin_landing_page', '2023-06-20 15:47:13', '2023-06-20 15:47:13'),
(35, 'services_manage_restaurant_button_name', 'Download Now', 'admin_landing_page', '2023-06-20 15:47:13', '2023-06-20 15:47:13'),
(36, 'services_manage_restaurant_button_status', '1', 'admin_landing_page', '2023-06-20 15:47:13', '2023-06-20 15:47:13'),
(37, 'services_manage_restaurant_button_link', 'https://play.google.com/', 'admin_landing_page', '2023-06-20 15:47:13', '2023-06-20 15:47:13'),
(38, 'services_manage_delivery_title_1', 'Deliver your food', 'admin_landing_page', '2023-06-20 15:47:57', '2023-06-20 15:47:57'),
(39, 'services_manage_delivery_title_2', 'Earn by delivery', 'admin_landing_page', '2023-06-20 15:47:57', '2023-06-20 15:47:57'),
(40, 'services_manage_delivery_description_1', 'Download Delivery Man App from Play store & App Store and Register as Delivery Man to provide food all over the area.', 'admin_landing_page', '2023-06-20 15:47:57', '2023-06-20 15:47:57'),
(41, 'services_manage_delivery_description_2', 'Become a delivery man and earn from every food delivery', 'admin_landing_page', '2023-06-20 15:47:57', '2023-06-20 15:47:57'),
(42, 'services_manage_delivery_button_name', 'Download Now', 'admin_landing_page', '2023-06-20 15:47:57', '2023-06-20 15:47:57'),
(43, 'services_manage_delivery_button_status', '1', 'admin_landing_page', '2023-06-20 15:47:57', '2023-06-20 15:47:57'),
(44, 'services_manage_delivery_button_link', 'https://play.google.com/', 'admin_landing_page', '2023-06-20 15:47:57', '2023-06-20 15:47:57'),
(45, 'earn_money_title', 'Why Choose Us?', 'admin_landing_page', '2023-06-20 15:48:17', '2023-06-20 15:48:17'),
(46, 'earn_money_sub_title', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'admin_landing_page', '2023-06-20 15:48:17', '2023-06-20 15:48:17'),
(47, 'earn_money_reg_title', 'Earn Money From StackFood', 'admin_landing_page', '2023-06-20 15:51:41', '2023-06-20 15:51:41'),
(48, 'earn_money_restaurant_req_button_name', 'Be a Seller', 'admin_landing_page', '2023-06-20 15:51:41', '2023-06-20 15:51:41'),
(49, 'earn_money_restaurant_req_button_status', '1', 'admin_landing_page', '2023-06-20 15:51:41', '2023-06-20 15:51:41'),
(50, 'earn_money_restaurant_req_button_link', 'https://play.google.com/', 'admin_landing_page', '2023-06-20 15:51:41', '2023-06-20 15:51:41'),
(51, 'earn_money_delivety_man_req_button_name', 'Be Deliveryman', 'admin_landing_page', '2023-06-20 15:51:41', '2023-06-20 15:51:41'),
(52, 'earn_money_delivery_man_req_button_status', '1', 'admin_landing_page', '2023-06-20 15:51:41', '2023-06-20 15:51:41'),
(53, 'earn_money_delivery_man_req_button_link', 'https://play.google.com/', 'admin_landing_page', '2023-06-20 15:51:41', '2023-06-20 15:51:41'),
(54, 'earn_money_reg_image', '2023-06-20-6491a0dd415b4.png', 'admin_landing_page', '2023-06-20 15:51:41', '2023-06-20 15:51:41'),
(55, 'why_choose_us_title', 'Why Choose Us?', 'admin_landing_page', '2023-06-20 15:51:57', '2023-06-20 15:51:57'),
(56, 'why_choose_us_sub_title', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'admin_landing_page', '2023-06-20 15:51:57', '2023-06-20 15:51:57'),
(57, 'why_choose_us_title_1', 'Find your daily meal', 'admin_landing_page', '2023-06-20 15:53:32', '2023-06-20 15:53:32'),
(58, 'why_choose_us_image_1', '2023-06-20-6491a14caa9cd.png', 'admin_landing_page', '2023-06-20 15:53:32', '2023-06-20 15:53:32'),
(59, 'why_choose_us_title_2', 'Easy to food ordering system', 'admin_landing_page', '2023-06-20 15:53:46', '2023-06-20 15:53:46'),
(60, 'why_choose_us_image_2', '2023-06-20-6491a15a4dd38.png', 'admin_landing_page', '2023-06-20 15:53:46', '2023-06-20 15:53:46'),
(61, 'why_choose_us_title_3', 'Fastest food delivery service', 'admin_landing_page', '2023-06-20 15:54:02', '2023-06-20 15:54:02'),
(62, 'why_choose_us_image_3', '2023-06-20-6491a16a2411c.png', 'admin_landing_page', '2023-06-20 15:54:02', '2023-06-20 15:54:02'),
(63, 'why_choose_us_title_4', 'Track your food order', 'admin_landing_page', '2023-06-20 15:54:19', '2023-06-20 15:54:19'),
(64, 'why_choose_us_image_4', '2023-06-20-6491a17b1b5ce.png', 'admin_landing_page', '2023-06-20 15:54:19', '2023-06-20 15:54:19'),
(65, 'testimonial_title', 'We satisfied some Customer & Restaurant Owners', 'admin_landing_page', '2023-06-21 06:24:53', '2023-06-21 06:24:53'),
(66, 'news_letter_title', 'Sign Up to Our Newsletter', 'admin_landing_page', '2023-06-21 06:25:14', '2023-06-21 06:25:14'),
(67, 'news_letter_sub_title', 'Receive Latest News, Updates and Many Other News Every Week', 'admin_landing_page', '2023-06-21 06:25:14', '2023-06-21 06:25:14'),
(68, 'footer_data', 'Stackfood is a complete package! It\'s time to empower your online food business with powerful features!', 'admin_landing_page', '2023-06-21 06:26:16', '2023-06-21 06:26:16'),
(69, 'react_header_title', 'StackFood', 'react_landing_page', '2023-06-21 06:41:59', '2023-06-21 06:41:59'),
(70, 'react_header_sub_title', 'Find Restaurants Near You', 'react_landing_page', '2023-06-21 06:41:59', '2023-06-21 06:41:59'),
(71, 'react_header_image', '2023-06-21-64927187b29c4.png', 'react_landing_page', '2023-06-21 06:41:59', '2023-06-21 06:41:59'),
(72, 'react_restaurant_section_title', 'Open your own restaurant', 'react_landing_page', '2023-06-21 06:48:57', '2023-06-21 06:48:57'),
(73, 'react_restaurant_section_sub_title', 'Register as seller and open shop to start your business', 'react_landing_page', '2023-06-21 06:48:57', '2023-06-21 06:48:57'),
(74, 'react_restaurant_section_button_name', 'Register', 'react_landing_page', '2023-06-21 06:48:57', '2023-06-21 06:48:57'),
(75, 'react_restaurant_section_button_status', '1', 'react_landing_page', '2023-06-21 06:48:57', '2023-06-21 06:48:57'),
(76, 'react_restaurant_section_image', '2023-06-21-649273298ec53.png', 'react_landing_page', '2023-06-21 06:48:57', '2023-06-21 06:48:57'),
(77, 'react_restaurant_section_link_data', 'https://stackfood-admin.6amtech.com/restaurant/apply', 'react_landing_page', '2023-06-21 06:48:57', '2023-06-21 06:48:57'),
(78, 'react_delivery_section_title', 'Become a Delivery Man', 'react_landing_page', '2023-06-21 06:48:57', '2023-06-21 06:48:57'),
(79, 'react_delivery_section_sub_title', 'Register as delivery man and earn money', 'react_landing_page', '2023-06-21 06:48:57', '2023-06-21 06:48:57'),
(80, 'react_delivery_section_button_name', 'Register', 'react_landing_page', '2023-06-21 06:48:57', '2023-06-21 06:48:57'),
(81, 'react_delivery_section_button_status', '1', 'react_landing_page', '2023-06-21 06:48:57', '2023-06-21 06:48:57'),
(82, 'react_delivery_section_image', '2023-06-21-649273299ff67.png', 'react_landing_page', '2023-06-21 06:48:57', '2023-06-21 06:48:57'),
(83, 'react_delivery_section_link_data', 'https://stackfood-admin.6amtech.com/deliveryman/apply', 'react_landing_page', '2023-06-21 06:48:57', '2023-06-21 06:48:57'),
(84, 'react_download_apps_banner_image', '2023-06-21-6492737ae5e61.png', 'react_landing_page', '2023-06-21 06:50:18', '2023-06-21 06:50:18'),
(85, 'react_download_apps_title', 'Download app to enjoy more!', 'react_landing_page', '2023-06-21 06:52:39', '2023-06-21 06:52:39'),
(86, 'react_download_apps_sub_title', 'All the best restaurants are one click away', 'react_landing_page', '2023-06-21 06:52:39', '2023-06-21 06:52:39'),
(87, 'react_download_apps_tag', 'Download our app from google play store & app store.', 'react_landing_page', '2023-06-21 06:52:39', '2023-06-21 06:52:39'),
(88, 'react_download_apps_button_name', 'https://play.google.com/', 'react_landing_page', '2023-06-21 06:52:39', '2023-06-21 06:52:39'),
(89, 'react_download_apps_button_status', '1', 'react_landing_page', '2023-06-21 06:52:39', '2023-06-21 06:52:39'),
(90, 'react_download_apps_image', '2023-06-21-649274076d0ae.png', 'react_landing_page', '2023-06-21 06:52:39', '2023-06-21 06:52:39'),
(91, 'react_download_apps_link_data', '{\"react_download_apps_link_status\":\"1\",\"react_download_apps_link\":\"https:\\/\\/www.apple.com\\/app-store\\/\"}', 'react_landing_page', '2023-06-21 06:52:39', '2023-06-21 06:52:39'),
(92, 'news_letter_title', 'Lets Connect !', 'react_landing_page', '2023-06-21 06:53:57', '2023-06-21 06:53:57'),
(93, 'news_letter_sub_title', 'Stay upto date with restaurants around you. Subscribe with email.', 'react_landing_page', '2023-06-21 06:53:57', '2023-06-21 06:53:57'),
(94, 'footer_data', 'is Best Delivery Service Near You', 'react_landing_page', '2023-06-21 06:55:11', '2023-06-21 06:55:11');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_wallets`
--

CREATE TABLE `delivery_man_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `earning` tinyint(1) NOT NULL DEFAULT 1,
  `current_orders` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zone_wise',
  `restaurant_id` bigint(20) DEFAULT NULL,
  `application_status` enum('approved','denied','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `order_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `assigned_order_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vehicle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shift_id` bigint(20) UNSIGNED DEFAULT NULL,
  `additional_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_documents` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disbursements`
--

CREATE TABLE `disbursements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` double(23,3) NOT NULL DEFAULT 0.000,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_for` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disbursement_details`
--

CREATE TABLE `disbursement_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `disbursement_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `disbursement_amount` double(23,3) NOT NULL DEFAULT 0.000,
  `payment_method` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disbursement_withdrawal_methods`
--

CREATE TABLE `disbursement_withdrawal_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `withdrawal_method_id` bigint(20) UNSIGNED NOT NULL,
  `method_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_fields` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_m_reviews`
--

CREATE TABLE `d_m_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy` tinyint(1) NOT NULL DEFAULT 0,
  `refund` tinyint(1) NOT NULL DEFAULT 0,
  `cancelation` tinyint(1) NOT NULL DEFAULT 0,
  `contact` tinyint(1) NOT NULL DEFAULT 0,
  `facebook` tinyint(1) NOT NULL DEFAULT 0,
  `instagram` tinyint(1) NOT NULL DEFAULT 0,
  `twitter` tinyint(1) NOT NULL DEFAULT 0,
  `linkedin` tinyint(1) NOT NULL DEFAULT 0,
  `pinterest` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `title`, `body`, `background_image`, `image`, `logo`, `icon`, `button_name`, `button_url`, `footer_text`, `copyright_text`, `type`, `email_type`, `email_template`, `privacy`, `refund`, `cancelation`, `contact`, `facebook`, `instagram`, `twitter`, `linkedin`, `pinterest`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Change Password Request', '<p>The following user has forgotten his password &amp; requested to change/reset their password.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>User Name: {userName}</strong></p>', NULL, NULL, NULL, '2023-06-21-64928742ceb74.png', '', '', 'Footer Text Please contact us for any queries; we’re always happy to help.', '© 2023 StackFood. All rights reserved.', 'admin', 'forget_password', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 15:19:43', '2023-06-20 21:14:42'),
(2, 'New Restaurant Registration Request', '<p>Please find below the details of the new Restaurant registration:</p>\r\n\r\n<p><strong>Restaurant Name: </strong>{restaurantName}</p>\r\n\r\n<p>To review the Restaurant from the respective Module, go to:&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Or you can directly review the Restaurant here &rarr;</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-21-649287b247980.png', '2023-06-21-649287b247c83.png', NULL, 'Review Request', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 StackFood. All rights reserved.', 'admin', 'restaurant_registration', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 15:26:41', '2023-06-20 21:16:34'),
(3, 'New Deliveryman Registration Request', '<p>Please find below the details of the new Deliveryman registration:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Deliveryman Name: </strong>{deliveryManName}</p>\r\n\r\n<p>To review the Restaurant from the respective Module, go to:&nbsp;</p>\r\n\r\n<p><strong>Deliveryman Management&rarr;New Deliveryman</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Or you can directly review the Restaurant here &rarr;</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-21-649287e9b49f8.png', '2023-06-21-649287e9b4d4a.png', NULL, 'Review Request', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 StackFood. All rights reserved.', 'admin', 'dm_registration', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 15:35:57', '2023-06-20 21:18:47'),
(4, 'New Withdraw Request', '<p>Please find below the details of the new Withdraw Request:</p>\r\n\r\n<p><br />\r\n<strong>Restaurant Name: </strong>{restaurantName}</p>\r\n\r\n<p>To review the Refund Request, go to:&nbsp;<br />\r\nTransactions &amp; Reports&rarr;Withdraw Requests</p>\r\n\r\n<p>Or you can directly review the Restaurant here &rarr;</p>', NULL, NULL, NULL, '2023-06-21-6492898f6f2aa.png', 'Review Request', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Stackfood. All rights reserved.', 'admin', 'withdraw_request', '6', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 21:24:31', '2023-06-20 21:24:31'),
(5, '“BUY ONE GET ONE” Campaign Join Request', '<p>Please find below the details of the new Campaign Join Request:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Restaurant Name: </strong>{restaurantName}</p>\r\n\r\n<p>To review the Refund Request, go to:&nbsp;</p>\r\n\r\n<p><strong>Campaigns&rarr;Basic Campaigns&rarr;Buy One Get One</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Or you can directly review the Restaurant here &rarr;</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-21-64928a71d990e.png', '2023-06-21-64928a71d9bca.png', NULL, 'Review Request', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Stack Food. All rights reserved.', 'admin', 'campaign_request', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 21:28:17', '2023-06-20 21:28:17'),
(6, 'You Have A Refund Request.', '<p>Please find below the details of the new Refund Request:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Customer Name: </strong>{userName}</p>\r\n\r\n<p><strong>Order ID: </strong>{orderId}</p>\r\n\r\n<p>Review the Restaurant here &rarr;</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, '2023-06-21-64928b0c3415a.png', NULL, 'Review Request', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 StackFood. All rights reserved.', 'admin', 'refund_request', '2', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 21:30:52', '2023-06-20 21:30:52'),
(7, 'Your Registration has been Submitted Success', '<p>Dear {userName},</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;ve received your Restaurant Registration Request.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Soon you&rsquo;ll know if your Restaurant registration is accepted or declined by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Stay Tuned!</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-21-64928c23e1ee1.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Stack Food. All rights reserved.', 'restaurant', 'registration', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 21:35:31', '2023-06-20 21:36:15'),
(8, 'Congratulations! Your Registration is Approve', '<p>Dear {userName},</p>\r\n\r\n<p>Your registration is approved by the Admin.&nbsp;</p>\r\n\r\n<p><strong>First</strong>, you need to log in to your Restaurant panel.&nbsp;</p>\r\n\r\n<p><strong>After that,</strong> please set up your Restaurant and start selling!&nbsp;</p>\r\n\r\n<p><br />\r\n<strong>Click here</strong><strong> &rarr; </strong><a href=\"https://stackfood-admin.6amtech.com/restaurant-panel/business-settings/restaurant-setup\">https://stackfood-admin.6amtech.com/restaurant-panel/business-settings/restaurant-setup</a></p>', NULL, NULL, NULL, '2023-06-21-64928ccce5098.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 ستاكفود. كل الحقوق محفوظة.', 'restaurant', 'approve', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 21:38:20', '2023-06-20 21:38:20'),
(9, 'Your Registration has been Rejected', '<p>Dear {userName} ,&nbsp;</p>\r\n\r\n<p>We&rsquo;re sorry to announce that your Restaurant registration was rejected by the Admin.&nbsp;</p>\r\n\r\n<p>To find out more, please contact us.&nbsp;</p>', NULL, NULL, NULL, '2023-06-21-64928d568a579.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Stackfood. All rights reserved.', 'restaurant', 'deny', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 21:40:38', '2023-06-20 21:40:38'),
(10, 'Congratulations! Your Withdrawal is Approved!', '<p>Dear {userName},</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The amount you requested to withdraw is approved by the Admin and transferred to your bank account.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-21-64928df27058a.png', 'Review Request', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 StackFood. All rights reserved.', 'restaurant', 'withdraw_approve', '6', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 21:43:14', '2023-06-20 21:43:14'),
(11, 'Your Withdraw Request was Rejected.', '<p>Dear {userName} ,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The amount you requested to withdraw was rejected by the Admin.</p>\r\n\r\n<p>Reason: Insufficient Balance.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-21-64928ead57d52.png', 'Review Request', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 StackFood. All rights reserved.', 'restaurant', 'withdraw_deny', '6', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 21:46:21', '2023-06-20 21:46:21'),
(12, 'Your Request is Completed!', '<p>Dear {userName} ,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;ve received your Campaign Request.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Soon you&rsquo;ll know if your request is approved or rejected by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Stay Tuned!</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-21-64928f57d4793.png', '2023-06-21-64928f57d4a3e.png', NULL, 'See Status', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Stack Food. All rights reserved.', 'restaurant', 'campaign_request', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 21:49:11', '2023-06-20 21:50:03'),
(13, 'Congratulations! Your Request is Approved!', '<p>Dear {userName} ,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your request to join &lsquo;&rsquo;BUY ONE GET ONE&rdquo; campaign is approved by the Admin.</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-21-649290d86eb06.png', '2023-06-21-649290d86ede0.png', NULL, 'View Status', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Stackfood. All rights reserved.', 'restaurant', 'campaign_approve', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 21:55:36', '2023-06-20 21:55:36'),
(14, 'Your Campaign Join Request Was Rejected.', '<p>Dear {userName},</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your request to join the &ldquo;Buy One Get One&rdquo; campaign was rejected by the admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Reason: Irrelevant Foods.</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-21-6492918e7d5f6.png', '2023-06-21-6492918e7da37.png', NULL, '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 StackFood. All rights reserved.', 'restaurant', 'campaign_deny', '7', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 21:58:38', '2023-06-20 21:58:57'),
(15, 'Your Registration is Completed!', '<p>Dear {userName},</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;ve received your Deliveryman Registration Request.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Soon you&rsquo;ll know if your Deliveryman registration is accepted or declined by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Stay Tuned!</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-21-649292352bbb1.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Stack Food. All rights reserved.', 'dm', 'registration', '5', 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, '2023-06-20 22:01:25', '2023-06-20 22:01:25'),
(16, 'Congratulations! Your Registration is Approve', '<p>Dear {deliveryManName} ,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your registration is approved by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Here&rsquo;s what to do next:&nbsp;</strong></p>\r\n\r\n<ol>\r\n	<li>Download the Deliveryman app</li>\r\n	<li>Login with the below credentials.</li>\r\n</ol>\r\n\r\n<p><strong>After that,</strong> please set up your account and start delivery!&nbsp;</p>\r\n\r\n<p><br />\r\n<strong>Click here</strong><strong> to download the app&rarr; </strong><em>Download link to the StackFood Deliveryman app</em></p>', NULL, NULL, NULL, '2023-06-21-649292f1aa096.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Stackfood. All rights reserved.', 'dm', 'approve', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 22:04:33', '2023-06-20 22:04:47'),
(17, 'Your Registration has been Rejected', '<p>Dear {deliveryManName},</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;re sorry to announce that your Deliveryman registration was rejected by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>To find out more, please contact us.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-21-649293646ff54.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 StackFood. All rights reserved.', 'dm', 'deny', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 22:06:28', '2023-06-20 22:06:28'),
(18, 'Your Account is Suspended.', '<p>Dear {deliveryManName},</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your Deliveryman account has been suspended by the Admin/Restaurant.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Please contact the related person to know more.</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-21-649293fa34204.png', '2023-06-21-6492941da37bc.png', NULL, '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Stack Food. All rights reserved.', 'dm', 'suspend', '7', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 22:08:58', '2023-06-20 22:09:33'),
(19, 'Cash Collected.', '<p>Dear User,</p>\r\n\r\n<p>{transactionId}</p>\r\n\r\n<p>The Admin has collected cash from you.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-21-64929477319d2.png', 'See Details', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Stack Food. All rights reserved.', 'dm', 'cash_collect', '6', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 22:11:03', '2023-06-20 22:11:03'),
(20, 'Reset Your Password', '<p>Please click on this link to reset your Password&nbsp;&rarr;</p>', NULL, NULL, NULL, '2023-06-21-649294c9ca03d.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 StackFood. All rights reserved.', 'dm', 'forget_password', '4', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 22:12:25', '2023-06-20 22:12:25'),
(21, 'Your Registration is Successful!', '<p>Congratulations!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You&rsquo;ve successfully registered.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-21-6492959c850ac.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Stackfood. All rights reserved.', 'user', 'registration', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 22:15:56', '2023-06-20 22:15:56'),
(22, 'Please Register with The OTP', '<p>ONE MORE STEP:&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Please copy the following OTP &amp; paste it on your sign-up page to complete your registration.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-21-6492967f1bfac.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Stack Food. All rights reserved.', 'user', 'registration_otp', '4', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 22:19:43', '2023-06-20 22:19:43'),
(23, 'Confirm Your Login with OTP.', '<p>Please copy the following OTP &amp; paste it on your Log in page to confirm your account.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-21-64929700e4548.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 ستاكفود. كل الحقوق محفوظة.', 'user', 'login_otp', '4', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 22:21:13', '2023-06-20 22:21:52'),
(24, 'Please Verify Your Delivery.', '<p>Please give the following OTP to your Deliveryman to ensure your order.</p>', NULL, NULL, NULL, '2023-06-21-64929767a486d.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Stackfood. All rights reserved.', 'user', 'order_verification', '4', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 22:23:35', '2023-06-20 22:23:35'),
(25, 'Your Order is Successful', '<p>Hi {userName},</p>\r\n\r\n<p>Your order is successful. Please find your invoice below.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, 'Review Request', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Stackfood. All rights reserved.', 'user', 'new_order', '3', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 22:25:02', '2023-06-20 22:25:02'),
(26, 'Refund Order', '<p>Hi {userName},</p>\r\n\r\n<p>We&rsquo;ve refunded your requested amount. Please find your refund invoice below.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Stack Food. All rights reserved.', 'user', 'refund_order', '9', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 22:26:53', '2023-06-20 22:27:32'),
(27, 'Your Refund Request was Rejected.', '<p>Dear {userName} ,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The amount you requested for a refund was rejected by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>To know more, please contact us.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, '2023-06-21-649298c0949c3.png', NULL, '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Stackfood. All rights reserved.', 'user', 'refund_request_deny', '8', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 22:29:20', '2023-06-20 22:29:20'),
(28, 'Reset Your Password', '<p>Please click on this link to reset your Password&nbsp;&rarr;</p>', NULL, NULL, NULL, '2023-06-21-64929958a6442.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 StackFood. All rights reserved.', 'user', 'forget_password', '4', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 22:31:52', '2023-06-20 22:31:52'),
(29, 'Fund Added to your Wallet.', '<p>Dear {userName}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The Admin has sent funds to your Wallet.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-21-649299ada7670.png', 'Review Request', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 StackFood. All rights reserved.', 'user', 'add_fund', '6', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-20 22:33:17', '2023-06-20 22:33:17');

-- --------------------------------------------------------

--
-- Table structure for table `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_roles`
--

CREATE TABLE `employee_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'custom',
  `amount` decimal(23,3) NOT NULL DEFAULT 0.000,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'admin',
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `available_time_starts` time DEFAULT NULL,
  `available_time_ends` time DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_count` int(11) NOT NULL DEFAULT 0,
  `avg_rating` double(16,14) NOT NULL DEFAULT 0.00000000000000,
  `rating_count` int(11) NOT NULL DEFAULT 0,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recommended` tinyint(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maximum_cart_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `name`, `description`, `image`, `category_id`, `category_ids`, `variations`, `add_ons`, `attributes`, `choice_options`, `price`, `tax`, `tax_type`, `discount`, `discount_type`, `available_time_starts`, `available_time_ends`, `veg`, `status`, `restaurant_id`, `created_at`, `updated_at`, `order_count`, `avg_rating`, `rating_count`, `rating`, `recommended`, `slug`, `maximum_cart_quantity`) VALUES
(1, 'Fried Chicken Sandwich', 'Club sandwich, medium fries, drink and get free classic large sandwich', '2024-01-02-65941d7fee9b2.png', 2, '[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2}]', '[{\"name\":\"Size\",\"type\":\"multi\",\"min\":\"1\",\"max\":\"3\",\"required\":\"off\",\"values\":[{\"label\":\"Medium\",\"optionPrice\":\"10\"},{\"label\":\"Large\",\"optionPrice\":\"20\"},{\"label\":\"Small\",\"optionPrice\":\"5\"}]}]', '[]', '[]', '[]', '100.00', '0.00', 'percent', '10.00', 'percent', '07:00:00', '06:59:00', 0, 1, 1, '2024-01-02 12:28:15', '2024-01-09 18:35:35', 0, 0.00000000000000, 0, NULL, 0, 'fried-chicken-sandwich', 100),
(2, 'Cheese Burger', 'Big, beautiful, cheesy, sloppy, juicy burgers. That’s what Willy’s Kitchen is all about and we love it! Our favorite is the ‘Smokehouse BBQ’ which is loaded with beef bacon, fried onions, and hickory BBQ sauce.', '2024-01-09-659da9c567b64.png', 3, '[{\"id\":\"3\",\"position\":1}]', '[{\"name\":\"Size\",\"type\":\"multi\",\"min\":\"1\",\"max\":\"3\",\"required\":\"off\",\"values\":[{\"label\":\"Small\",\"optionPrice\":\"0\"},{\"label\":\"Medium\",\"optionPrice\":\"20\"},{\"label\":\"Large\",\"optionPrice\":\"30\"}]}]', '[]', '[]', '[]', '200.00', '0.00', 'percent', '10.00', 'percent', '22:00:00', '09:59:00', 0, 1, 4, '2024-01-09 18:17:09', '2024-01-09 18:36:44', 0, 0.00000000000000, 0, NULL, 0, 'cheese-burger', 10),
(3, 'Shocks Burgers', 'he burger truck taking over the capital by storm. Shocks Burgers serves shockingly delicious burgers with a combination of balanced beef patties, flavorful toppings and one of the best buns in Egypt. The ‘Triple B’ burger is a must-try. This yummy burger is made up of American cheese, beef bacon, BBQ sauce, shocks sauce, tomato and lettuce. The service is quick and the staff are friendly. All in all, you get high quality burgers at a moderate price. We can’t recommend it highly enough.', '2024-01-09-659daa857e3ac.png', 3, '[{\"id\":\"3\",\"position\":1}]', '[{\"name\":\"Size\",\"type\":\"multi\",\"min\":\"1\",\"max\":\"3\",\"required\":\"off\",\"values\":[{\"label\":\"Small\",\"optionPrice\":\"0\"},{\"label\":\"Medium\",\"optionPrice\":\"10\"},{\"label\":\"Large\",\"optionPrice\":\"20\"}]},{\"name\":\"Cheesy\",\"type\":\"multi\",\"min\":\"1\",\"max\":\"2\",\"required\":\"off\",\"values\":[{\"label\":\"Cheese Burger\",\"optionPrice\":\"20\"},{\"label\":\"Not cheese\",\"optionPrice\":\"20\"}]}]', '[]', '[]', '[]', '250.00', '0.00', 'percent', '5.00', 'percent', '22:18:00', '10:18:00', 0, 1, 4, '2024-01-09 18:20:21', '2024-01-09 18:20:21', 0, 0.00000000000000, 0, NULL, 0, 'shocks-burgers', 10),
(4, '1/2 Grilled Boneless Chicken Meal', '1/2 Grilled Boneless Chicken Meal', '2024-01-09-659dac14e0f84.png', 5, '[{\"id\":\"5\",\"position\":1}]', '[]', '[]', '[]', '[]', '300.00', '0.00', 'percent', '10.00', 'percent', '22:24:00', '22:24:00', 0, 1, 1, '2024-01-09 18:27:00', '2024-01-09 18:27:00', 0, 0.00000000000000, 0, NULL, 0, '12-grilled-boneless-chicken-meal', 10),
(5, 'Shish Chicken', NULL, '2024-01-09-659dacf6651ee.png', 5, '[{\"id\":\"5\",\"position\":1}]', '[]', '[]', '[]', '[]', '350.00', '0.00', 'percent', '0.00', 'percent', '22:30:00', '10:30:00', 0, 1, 1, '2024-01-09 18:30:46', '2024-01-09 18:30:46', 0, 0.00000000000000, 0, NULL, 0, 'shish-chicken', 20),
(6, 'Sushi', 'Embracing the harmony of flavors in this sushi masterpiece', '2024-01-09-659dad70d1389.png', 6, '[{\"id\":\"6\",\"position\":1}]', '[]', '[]', '[]', '[]', '500.00', '0.00', 'percent', '10.00', 'percent', '22:32:00', '10:32:00', 0, 1, 3, '2024-01-09 18:32:48', '2024-01-09 18:32:48', 0, 0.00000000000000, 0, NULL, 0, 'sushi', 10);

-- --------------------------------------------------------

--
-- Table structure for table `food_tag`
--

CREATE TABLE `food_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food_tag`
--

INSERT INTO `food_tag` (`id`, `food_id`, `tag_id`) VALUES
(1, 1, 2),
(2, 2, 6),
(3, 3, 6),
(4, 4, 7),
(5, 5, 7),
(6, 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE `guests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guests`
--

INSERT INTO `guests` (`id`, `ip_address`, `fcm_token`, `created_at`, `updated_at`) VALUES
(1, '192.168.0.112', NULL, '2024-01-02 21:56:03', '2024-01-02 21:56:03'),
(2, '192.168.0.112', NULL, '2024-01-08 21:15:22', '2024-01-08 21:15:22'),
(3, '192.168.0.112', NULL, '2024-01-08 21:59:24', '2024-01-08 21:59:24'),
(4, '192.168.0.112', NULL, '2024-01-09 12:32:48', '2024-01-09 12:32:48'),
(5, '192.168.0.112', NULL, '2024-01-10 09:44:58', '2024-01-10 09:44:58');

-- --------------------------------------------------------

--
-- Table structure for table `incentives`
--

CREATE TABLE `incentives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `earning` decimal(23,3) NOT NULL,
  `incentive` decimal(23,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incentive_logs`
--

CREATE TABLE `incentive_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `earning` decimal(23,3) NOT NULL DEFAULT 0.000,
  `incentive` decimal(23,3) NOT NULL DEFAULT 0.000,
  `date` date DEFAULT NULL,
  `today_earning` decimal(23,3) NOT NULL DEFAULT 0.000,
  `working_hours` decimal(23,3) NOT NULL DEFAULT 0.000,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_campaigns`
--

CREATE TABLE `item_campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maximum_cart_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logable_id` bigint(20) UNSIGNED NOT NULL,
  `logable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `action_details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `before_state` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`before_state`)),
  `after_state` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`after_state`)),
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_configs`
--

CREATE TABLE `mail_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encryption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `sender_id`, `message`, `file`, `is_seen`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Hii', NULL, 0, '2024-01-09 20:56:56', '2024-01-09 20:56:56'),
(2, 1, 2, 'hey', NULL, 1, '2024-01-09 20:57:20', '2024-01-11 17:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(7, '2016_06_01_000004_create_oauth_clients_table', 1),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2021_05_05_081114_create_admins_table', 1),
(11, '2021_05_05_102600_create_attributes_table', 1),
(12, '2021_05_05_102742_create_categories_table', 1),
(13, '2021_05_06_102004_create_vendors_table', 1),
(14, '2021_05_06_153204_create_restaurants_table', 1),
(15, '2021_05_08_113436_create_add_ons_table', 1),
(16, '2021_05_08_123446_create_food_table', 1),
(17, '2021_05_08_141209_create_currencies_table', 1),
(18, '2021_05_09_050232_create_orders_table', 1),
(19, '2021_05_09_051907_create_reviews_table', 1),
(20, '2021_05_09_054237_create_order_details_table', 1),
(21, '2021_05_10_105324_create_mail_configs_table', 1),
(22, '2021_05_10_152713_create_business_settings_table', 1),
(23, '2021_05_11_111722_create_banners_table', 1),
(24, '2021_05_11_134442_create_coupons_table', 1),
(25, '2021_05_12_053344_create_conversations_table', 1),
(26, '2021_05_12_055454_create_delivery_men_table', 1),
(27, '2021_05_12_060138_create_d_m_reviews_table', 1),
(28, '2021_05_12_060527_create_track_deliverymen_table', 1),
(29, '2021_05_12_061345_create_email_verifications_table', 1),
(30, '2021_05_12_061454_create_delivery_histories_table', 1),
(31, '2021_05_12_061718_create_wishlists_table', 1),
(32, '2021_05_12_061924_create_notifications_table', 1),
(33, '2021_05_12_062152_create_customer_addresses_table', 1),
(34, '2021_05_12_062412_create_order_delivery_histories_table', 1),
(35, '2021_05_19_115112_create_zones_table', 1),
(36, '2021_05_19_120612_create_restaurant_zone_table', 1),
(37, '2021_06_07_103835_add_column_to_vendor_table', 1),
(38, '2021_06_07_112335_add_column_to_vendors_table', 1),
(39, '2021_06_08_162354_add_column_to_restaurants_table', 1),
(40, '2021_06_09_115719_add_column_to_add_ons_table', 1),
(41, '2021_06_10_091547_add_column_to_coupons_table', 1),
(42, '2021_06_12_070530_rename_banners_table', 1),
(43, '2021_06_12_091154_add_column_on_campaigns_table', 1),
(44, '2021_06_12_091848_create_item_campaigns_table', 1),
(45, '2021_06_13_155531_create_campaign_restaurant_table', 1),
(46, '2021_06_14_090520_add_item_campaign_id_column_to_reviews_table', 1),
(47, '2021_06_14_091735_add_item_campaign_id_column_to_order_details_table', 1),
(48, '2021_06_14_120713_create_new_banners_table', 1),
(49, '2021_06_15_103656_add_zone_id_column_to_banners_table', 1),
(50, '2021_06_16_110322_create_discounts_table', 1),
(51, '2021_06_17_054551_create_soft_credentials_table', 1),
(52, '2021_06_17_145949_create_wallets_table', 1),
(53, '2021_06_17_150243_create_withdraw_requests_table', 1),
(54, '2021_06_19_052600_create_admin_wallets_table', 1),
(55, '2021_06_21_051135_add_delivery_charge_to_orders_table', 1),
(56, '2021_06_23_080009_add_role_id_to_admins_table', 1),
(57, '2021_06_27_140224_add_interest_column_to_users_table', 1),
(58, '2021_06_27_142558_change_column_to_restaurants_table', 1),
(59, '2021_06_27_152139_add_restaurant_id_column_to_wishlists_table', 1),
(60, '2021_06_28_142443_add_restaurant_id_column_to_customer_addresses_table', 1),
(61, '2021_06_29_134119_add_schedule_column_to_orders_table', 1),
(62, '2021_06_30_133932_add_code_column_to_coupons_table', 2),
(63, '2021_07_01_151103_change_column_food_id_from_admin_wallet_histories_table', 2),
(64, '2021_07_04_142159_add_callback_column_to_orders_table', 2),
(65, '2021_07_05_155506_add_cm_firebase_token_to_vendors_table', 2),
(66, '2021_07_05_162404_add_otp_to_orders_table', 2),
(67, '2021_07_13_133941_create_admin_roles_table', 2),
(68, '2021_07_14_074431_add_status_to_delivery_men_table', 2),
(69, '2021_07_14_104102_create_vendor_employees_table', 2),
(70, '2021_07_14_110011_create_employee_roles_table', 2),
(71, '2021_07_15_124141_add_cover_photo_to_restaurants_table', 2),
(72, '2021_07_19_103748_create_delivery_man_wallets_table', 2),
(73, '2021_07_19_105442_create_account_transactions_table', 2),
(74, '2021_07_19_110152_create_order_transactions_table', 2),
(75, '2021_07_19_134356_add_column_to_notifications_table', 2),
(76, '2021_07_25_125316_add_available_to_delivery_men_table', 2),
(77, '2021_07_25_154722_add_columns_to_restaurants_table', 2),
(78, '2021_07_29_162336_add_schedule_order_column_to_restaurants_table', 2),
(79, '2021_07_31_140756_create_phone_verifications_table', 2),
(80, '2021_08_01_151717_add_column_to_order_transactions_table', 2),
(81, '2021_08_01_163520_add_column_to_admin_wallets_table', 2),
(82, '2021_08_02_141909_change_time_column_to_restaurants_table', 2),
(83, '2021_08_02_183356_add_tax_column_to_restaurants_table', 2),
(84, '2021_08_04_215618_add_zone_id_column_to_restaurants_table', 2),
(85, '2021_08_06_123001_add_address_column_to_orders_table', 2),
(86, '2021_08_06_123326_add_zone_wise_topic_column_to_zones_table', 2),
(87, '2021_08_08_112127_add_scheduled_column_on_orders_table', 2),
(88, '2021_08_08_203108_add_status_column_to_users_table', 2),
(89, '2021_08_11_193805_add_product_discount_ammount_column_to_orders_table', 2),
(90, '2021_08_12_112511_add_addons_column_to_order_details_table', 2),
(91, '2021_08_12_195346_add_zone_id_to_notifications_table', 2),
(92, '2021_08_14_110131_create_user_notifications_table', 2),
(93, '2021_08_14_175657_add_order_count_column_to_foods_table', 2),
(94, '2021_08_14_180044_add_order_count_column_to_users_table', 2),
(95, '2021_08_19_051055_add_earnign_column_to_deliverymen_table', 2),
(96, '2021_08_19_051721_add_original_delivery_charge_column_to_orders_table', 2),
(97, '2021_08_19_055839_create_provide_d_m_earnings_table', 2),
(98, '2021_08_19_112810_add_original_delivery_charge_column_to_order_transactions_table', 2),
(99, '2021_08_19_114851_add_columns_to_delivery_man_wallets_table', 2),
(100, '2021_08_21_162616_change_comission_column_to_restaurants_table', 2),
(101, '2021_08_22_232507_add_failed_column_to_orders_table', 2),
(102, '2021_09_04_172723_add_column_reviews_section_to_restaurants_table', 2),
(103, '2021_09_11_164936_change_delivery_address_column_to_orders_table', 2),
(104, '2021_09_11_165426_change_address_column_to_customer_addresses_table', 2),
(105, '2021_09_23_120332_change_available_column_to_delivery_men_table', 2),
(106, '2021_10_03_214536_add_active_column_to_restaurants_table', 2),
(107, '2021_10_04_123739_add_priority_column_to_categories_table', 2),
(108, '2021_10_06_200730_add_restaurant_id_column_to_demiverymen_table', 2),
(109, '2021_10_07_223332_add_self_delivery_column_to_restaurants_table', 2),
(110, '2021_10_11_214123_change_add_ons_column_to_order_details_table', 2),
(111, '2021_10_11_215352_add_adjustment_column_to_orders_table', 2),
(112, '2021_10_24_184553_change_column_to_account_transactions_table', 2),
(113, '2021_10_24_185143_change_column_to_add_ons_table', 2),
(114, '2021_10_24_185525_change_column_to_admin_roles_table', 2),
(115, '2021_10_24_185831_change_column_to_admin_wallets_table', 2),
(116, '2021_10_24_190550_change_column_to_coupons_table', 2),
(117, '2021_10_24_190826_change_column_to_delivery_man_wallets_table', 2),
(118, '2021_10_24_191018_change_column_to_discounts_table', 2),
(119, '2021_10_24_191209_change_column_to_employee_roles_table', 2),
(120, '2021_10_24_191343_change_column_to_food_table', 2),
(121, '2021_10_24_191514_change_column_to_item_campaigns_table', 2),
(122, '2021_10_24_191626_change_column_to_orders_table', 2),
(123, '2021_10_24_191938_change_column_to_order_details_table', 2),
(124, '2021_10_24_192341_change_column_to_order_transactions_table', 2),
(125, '2021_10_24_192621_change_column_to_provide_d_m_earnings_table', 2),
(126, '2021_10_24_192820_change_column_type_to_restaurants_table', 2),
(127, '2021_10_24_192959_change_column_type_to_restaurant_wallets_table', 2),
(128, '2021_11_02_123115_add_delivery_time_column_to_restaurants_table', 2),
(129, '2021_11_02_170217_add_total_uses_column_to_coupons_table', 2),
(130, '2021_12_01_131746_add_status_column_to_reviews_table', 2),
(131, '2021_12_01_135115_add_status_column_to_d_m_reviews_table', 2),
(132, '2021_12_13_125126_rename_comlumn_set_menu_to_food_table', 2),
(133, '2021_12_13_132438_add_zone_id_column_to_admins_table', 2),
(134, '2021_12_18_174714_add_application_status_column_to_delivery_men_table', 2),
(135, '2021_12_20_185736_change_status_column_to_vendors_table', 2),
(136, '2021_12_22_114414_create_translations_table', 2),
(137, '2022_01_05_133920_add_sosial_data_column_to_users_table', 2),
(138, '2022_01_05_172441_add_veg_non_veg_column_to_restaurants_table', 2),
(139, '2022_01_19_060356_create_restaurant_schedule_table', 2),
(140, '2022_01_20_151449_add_restaurant_id_column_on_employee_roles_table', 2),
(141, '2022_01_31_124517_add_veg_column_to_item_campaigns_table', 2),
(142, '2022_02_01_101248_change_coupon_code_column_length_to_coupons_table', 2),
(143, '2022_02_01_104336_change_column_length_to_notifications_table', 2),
(144, '2022_02_06_160701_change_column_length_to_item_campaigns_table', 2),
(145, '2022_02_06_161110_change_column_length_to_campaigns_table', 2),
(146, '2022_02_07_091359_add_zone_id_column_on_orders_table', 2),
(147, '2022_02_07_101547_change_name_column_to_categories_table', 2),
(148, '2022_02_07_152844_add_zone_id_column_to_order_transactions_table', 2),
(149, '2022_02_07_162330_add_zone_id_column_to_users_table', 2),
(150, '2022_02_07_173644_add_column_to_food_table', 2),
(151, '2022_02_07_181314_add_column_to_delivery_men_table', 2),
(152, '2022_02_07_183001_add_total_order_count_column_to_restaurants_table', 2),
(153, '2022_03_31_103418_create_wallet_transactions_table', 2),
(154, '2022_03_31_103827_create_loyalty_point_transactions_table', 2),
(155, '2022_04_09_161150_add_wallet_point_columns_to_users_table', 2),
(156, '2022_04_10_030533_create_newsletters_table', 2),
(157, '2022_04_12_121040_create_social_media_table', 2),
(158, '2022_04_17_140353_change_column_transaction_referance_to_orders_table', 2),
(159, '2022_05_14_122133_add_dm_tips_column_to_orders_table', 2),
(160, '2022_05_14_122603_add_dm_tips_column_to_order_transactions_table', 2),
(161, '2022_05_14_131338_add_processing_time_column_to_orders_table', 2),
(162, '2022_05_17_153333_add_ref_code_to_users_table', 2),
(163, '2022_05_22_162129_add_new_columns_to_customer_addresses_table', 2),
(164, '2022_06_26_170341_add_delivery_fee_comission_to_ordertransactions', 2),
(165, '2022_06_29_112637_add_delivery_fee_column_to_zones_table', 2),
(166, '2022_06_29_125553_add_rename_delivery_charge_column_to_restaurants_table', 2),
(167, '2022_06_29_151416_create_time_logs_table', 2),
(168, '2022_07_31_103626_add_free_delivery_by_column_to_orders_table', 2),
(169, '2022_08_06_122044_create_user_infos_table', 2),
(170, '2022_08_06_124645_create_messages_table', 2),
(171, '2022_09_13_113428_change_data_column_to_user_notifications_table', 3),
(172, '2022_09_20_002050_create_refunds_table', 3),
(173, '2022_09_20_050949_add_refund_request_cancel_column_to_orders_table', 3),
(174, '2022_09_20_233442_create_refund_reasons_table', 3),
(175, '2022_09_29_095242_create_subscription_packages_table', 3),
(176, '2022_09_29_101701_create_restaurant_subscriptions_table', 3),
(177, '2022_09_29_102521_create_subscription_transactions_table', 3),
(178, '2022_10_04_094314_add_restaurant_model_column_to_restaurants_table', 3),
(179, '2022_11_05_105722_alter_table_order_details_change_variation', 3),
(180, '2022_11_13_144443_create_contact_messages_table', 3),
(181, '2022_11_16_091912_create_expenses_table', 3),
(182, '2022_11_16_092235_add_expense_column_to_order_transactions_table', 3),
(183, '2023_01_05_153438_add_status_col_to_campaign_restaurant_table', 3),
(184, '2023_01_07_162303_add_maximum_delivery_charge_col_to_zones_table', 3),
(185, '2023_01_07_162740_add_maximum_delivery_charge_col_to_restaurants_table', 3),
(186, '2023_01_08_104102_create_vehicles_table', 3),
(187, '2023_01_08_124859_add_vehicle_id_col_to_delivery_men_table', 3),
(188, '2023_01_08_152910_create_tags_table', 3),
(189, '2023_01_08_153321_create_food_tags_table', 3),
(190, '2023_01_09_115851_add_max_cod_order_amount_col_to_zones_table', 3),
(191, '2023_01_09_132704_create_order_cancel_reasons_table', 3),
(192, '2023_01_09_132841_add_cancellation_reason_col_to_orders_table', 3),
(193, '2023_01_09_173540_add_recommended_col_to_foods_table', 3),
(194, '2023_01_09_180114_create_cuisines_table', 3),
(195, '2023_01_09_180928_add_cuisine_id_col_to_restaurants_table', 3),
(196, '2023_01_10_112851_alter_refund_amount_col_to_refunds_table', 3),
(197, '2023_01_10_175439_add_tax_status_col_to_orders_table', 3),
(198, '2023_01_12_142420_add_restaurant_id_col_to_expenses_table', 4),
(199, '2023_01_12_143506_add_restaurant_expense_col_to_order_transactions_table', 4),
(200, '2023_01_12_145658_add_coupon_created_by_col_to_orders_table', 4),
(201, '2023_01_14_103226_add_slug_by_col_to_campaigns_table', 4),
(202, '2023_01_14_105544_add_slug_col_to_categories_table', 4),
(203, '2023_01_14_105607_add_slug_by_col_to_restaurants_table', 4),
(204, '2023_01_24_152947_add_vehicle_id_col_to_orders_table', 4),
(205, '2023_01_25_133959_add_slug_col_to_food_table', 4),
(206, '2023_01_25_145750_add_slug_col_to_item_campaigns_table', 4),
(207, '2023_01_28_100238_remane_discription_col_to__order_id_to_expenses_table', 4),
(208, '2023_01_28_100425_add_description_col_to_expenses_table', 4),
(209, '2023_01_28_161813_create_cuisine_restaurants_table', 4),
(210, '2023_01_28_185144_remove_col_cuisine_id_from_restaurant_table', 4),
(211, '2023_01_30_121227_add_col_to_discount_on_product_by_order_table', 4),
(212, '2023_02_01_114155_add_distance_col_to_orders_table', 4),
(213, '2023_02_01_151408_add_commission_percentage_col_to_order_transactions_table', 4),
(214, '2023_02_01_182929_add_discount_amount_by_restaurant_col_to_order_transactions_table', 4),
(215, '2023_02_08_113749_add_ref_by_col_to_users_table', 4),
(216, '2023_02_08_163747_create_withdrawal_methods_table', 4),
(217, '2023_02_08_165109_add_cols_to_withdraw_requests_table', 4),
(218, '2023_02_14_112313_create_incentive_logs_table', 4),
(219, '2023_02_14_112417_create_incentives_table', 4),
(220, '2023_02_14_165851_add_delivery_man_id_col_to_wallet_transactions_table', 4),
(221, '2023_02_14_172250_change_amount_col_to_expenses_table', 4),
(222, '2023_02_15_131107_add_otp_hit_count_cols_in_phone_verifications_table', 4),
(223, '2023_02_16_104809_add_hit_count_at_col_in_password_resets_table', 4),
(224, '2023_02_16_123420_add_increased_delivery_fee_in_zones_table', 4),
(225, '2023_02_16_145350_create_shifts_table', 4),
(226, '2023_02_16_145830_add_shift_id_col_to_time_logs_table', 4),
(227, '2023_02_16_145934_add_shift_id_col_to_delivery_men_table', 4),
(228, '2023_02_18_070327_create_subscriptions_table', 4),
(229, '2023_02_18_070628_create_subscription_logs_table', 4),
(230, '2023_02_18_070757_create_subscription_pauses_table', 4),
(231, '2023_02_18_070826_create_subscription_schedules_table', 4),
(232, '2023_02_18_071042_add_subscription_id_col_to_order_table', 4),
(233, '2023_02_18_071609_add_is_subscription_order_col_to_order_transactions_table', 4),
(234, '2023_02_19_164536_create_visitor_logs_table', 4),
(235, '2023_03_11_120645_add_temp_block_time_col_to_phone_verifications_table', 4),
(236, '2023_03_11_121000_add_temp_block_time_col_to_password_resets_table', 4),
(237, '2023_03_13_144714_create_logs_table', 4),
(238, '2023_03_16_163907_add_order_subscription_col_in_restaurant_table', 4),
(239, '2023_03_18_121906_add_order_cancel_note_col_in_orders_table', 4),
(240, '2023_03_18_144849_add_temp_token_col_in_users_table', 4),
(241, '2023_03_19_153620_add_increase_delivery_charge_message_col_in_zones_table', 4),
(242, '2023_04_08_132653_add_created_by_col_to_password_resets_table', 4),
(243, '2023_04_17_112228_create_notification_messages_table', 4),
(244, '2023_05_07_155839_change_delivery_charge_col_in_admin_wallets_table', 4),
(245, '2023_05_10_162452_create_admin_testimonials_table', 4),
(246, '2023_05_10_184114_create_data_settings_table', 4),
(247, '2023_05_13_115610_create_admin_features_table', 4),
(248, '2023_05_14_092428_create_react_services_table', 4),
(249, '2023_05_14_104308_create_react_promotional_banners_table', 4),
(250, '2023_05_18_161133_create_email_templates_table', 4),
(251, '2023_05_31_154309_create_admin_special_criterias_table', 4),
(252, '2023_06_11_040112_add_cutlery_col_in_orders_table', 4),
(253, '2023_06_11_171524_change_delivery_time_col_in_restaurants_table', 4),
(254, '2023_06_13_112622_add_cutlery_on_restaurants_table', 4),
(255, '2023_07_05_135741_add_service_charge_col_to_orders_table', 4),
(256, '2023_07_05_145800_add_service_charge_col_to_order_transactions_table', 4),
(257, '2023_07_25_130949_create_wallet_payments_table', 4),
(258, '2023_07_25_131036_create_wallet_bonuses_table', 4),
(259, '2023_07_25_131958_add_user_id_col_expenses_table', 4),
(260, '2023_07_26_171058_create_order_payments_table', 4),
(261, '2023_07_31_235517_add_maximum_cart_quantity_col_to_food', 4),
(262, '2023_07_31_235555_add_maximum_cart_quantity_col_to_item_campaigns', 4),
(263, '2023_08_02_043239_add_meta_data_to_restaurants_table', 4),
(264, '2023_08_05_232205_add_payment_status_to_subscription_transactions_table', 4),
(265, '2023_08_30_130431_create_offline_payment_methods_table', 4),
(266, '2023_08_30_130446_create_offline_payments_table', 4),
(267, '2023_08_30_162632_add_announcement_cols_to_restaurants_table', 4),
(268, '2023_08_30_171559_create_guests_table', 4),
(269, '2023_08_30_181336_add_is_guest_col_to_orders_table', 4),
(270, '2023_09_03_174650_add_qr_code_col_to_restaurants_table', 4),
(271, '2023_10_02_114519_create_carts_table', 4),
(272, '2023_10_04_142129_add_free_delivery_distance_col_to_restaurants_table', 4),
(273, '2023_10_18_124954_create_restaurant_configs_table', 4),
(274, '2023_10_19_093057_create_restaurant_tags_table', 4),
(275, '2023_10_22_183705_add_additional_data_col_in_restaurants_table', 4),
(276, '2023_10_25_173519_add_additional_data_col_to_delivery_men_table', 4),
(277, '2023_10_26_105254_change_name_col_on_user_infos', 4),
(278, '2023_10_29_114625_add_created_by_col_to_account_transactions_table', 4),
(279, '2023_10_29_161701_create_disbursements_table', 4),
(280, '2023_10_29_161757_create_disbursement_details_table', 4),
(281, '2023_10_29_183055_create_disbursement_withdrawal_methods_table', 4),
(282, '2023_10_30_093234_add_type_col_to_withdraw_requests_table', 4),
(283, '2023_11_21_132325_add_current_language_key_col_to_users_table', 4),
(284, '2024_01_02_214338_add_created_by_to_coupons', 5),
(285, '2024_01_02_214341_add_customer_id_col_to_coupons_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Subscribers email',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tergat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_messages`
--

CREATE TABLE `notification_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('73ab52dbece5dfd76dd484949c804475cad11a96488b503db2f1b367d8bf86a7aa7f1644b9e5e5ea', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2024-01-10 08:56:42', '2024-01-10 08:56:43', '2025-01-10 10:56:42'),
('a42d9e91dee6c33111d73031fa4210c80f0bda309cdac536f53421cacfbd69fecd8a084ec55db9cd', 6, 1, 'RestaurantCustomerAuth', '[]', 0, '2024-01-09 17:52:51', '2024-01-09 17:52:51', '2025-01-09 19:52:51'),
('bac0c13323b4131217a5866c60187e638f3faa75a422930c21d24569808de947a17d0b74b59e2351', 3, 1, 'RestaurantCustomerAuth', '[]', 0, '2024-01-09 17:10:27', '2024-01-09 17:10:27', '2025-01-09 19:10:27'),
('bda5a3053f612b34f20be23aaba80d138ace83fe57cff84171bee02aefba6bcf8ba28e5d92bd9250', 5, 1, 'RestaurantCustomerAuth', '[]', 0, '2024-01-09 17:52:46', '2024-01-09 17:52:47', '2025-01-09 19:52:46'),
('e6ca794f068910d2242f5a3b5cf7e119794e4b3938ff1c01286de7da65ebbc37d1ad681518eacfb5', 4, 1, 'RestaurantCustomerAuth', '[]', 0, '2024-01-09 17:10:35', '2024-01-09 17:10:35', '2025-01-09 19:10:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'halaltogo', 'akiAKd7J5oIkeklvOT6UznGfGmY0xxZAGy5WhDO6', NULL, 'http://localhost', 1, 0, 0, '2024-01-09 17:10:12', '2024-01-09 17:10:12');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-01-09 17:10:12', '2024-01-09 17:10:12');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_payments`
--

CREATE TABLE `offline_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_info`)),
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_payment_methods`
--

CREATE TABLE `offline_payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_fields` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_informations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `coupon_discount_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `coupon_discount_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_tax_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `schedule_at` timestamp NULL DEFAULT NULL,
  `callback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `confirmed` timestamp NULL DEFAULT NULL,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL,
  `refund_requested` timestamp NULL DEFAULT NULL,
  `refunded` timestamp NULL DEFAULT NULL,
  `delivery_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled` tinyint(1) NOT NULL DEFAULT 0,
  `restaurant_discount_amount` decimal(24,2) NOT NULL,
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `failed` timestamp NULL DEFAULT NULL,
  `adjusment` decimal(24,2) NOT NULL DEFAULT 0.00,
  `edited` tinyint(1) NOT NULL DEFAULT 0,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dm_tips` double(24,2) NOT NULL DEFAULT 0.00,
  `processing_time` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_delivery_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_request_canceled` timestamp NULL DEFAULT NULL,
  `cancellation_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canceled_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount_on_product_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'vendor',
  `distance` double(23,3) DEFAULT 0.000,
  `subscription_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cancellation_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_percentage` double(24,3) DEFAULT NULL,
  `delivery_instruction` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unavailable_item_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cutlery` tinyint(1) NOT NULL DEFAULT 0,
  `additional_charge` double(23,3) NOT NULL DEFAULT 0.000,
  `partially_paid_amount` double(23,3) NOT NULL DEFAULT 0.000,
  `order_proof` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_amount`, `coupon_discount_amount`, `coupon_discount_title`, `payment_status`, `order_status`, `total_tax_amount`, `payment_method`, `transaction_reference`, `delivery_address_id`, `delivery_man_id`, `coupon_code`, `order_note`, `order_type`, `checked`, `restaurant_id`, `created_at`, `updated_at`, `delivery_charge`, `schedule_at`, `callback`, `otp`, `pending`, `accepted`, `confirmed`, `processing`, `handover`, `picked_up`, `delivered`, `canceled`, `refund_requested`, `refunded`, `delivery_address`, `scheduled`, `restaurant_discount_amount`, `original_delivery_charge`, `failed`, `adjusment`, `edited`, `zone_id`, `dm_tips`, `processing_time`, `free_delivery_by`, `refund_request_canceled`, `cancellation_reason`, `canceled_by`, `tax_status`, `coupon_created_by`, `vehicle_id`, `discount_on_product_by`, `distance`, `subscription_id`, `cancellation_note`, `tax_percentage`, `delivery_instruction`, `unavailable_item_note`, `cutlery`, `additional_charge`, `partially_paid_amount`, `order_proof`, `is_guest`) VALUES
(100001, 6, '123.00', '0.00', '', 'unpaid', 'pending', '6.00', 'cash_on_delivery', NULL, NULL, NULL, NULL, 'Hello', 'delivery', 0, 1, '2024-01-09 20:28:04', '2024-01-09 20:28:04', '0.00', '2024-01-09 20:28:04', NULL, '9623', '2024-01-09 20:28:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"contact_person_name\":\"Osama Mostafa\",\"contact_person_number\":\"201128861395\",\"contact_person_email\":\"osamamostafa811@gmail.com\",\"address_type\":\"others\",\"address\":\"Paris, France\",\"floor\":\"2\",\"road\":\"8th district\",\"house\":\"Buikding34\",\"longitude\":\"2.352221868932247\",\"latitude\":\"48.85661390127101\"}', 0, '13.00', '0.00', NULL, '0.00', 0, 1, 0.00, NULL, NULL, NULL, NULL, NULL, 'excluded', NULL, 0, 'vendor', 2.389, NULL, NULL, 5.000, 'Deliver to front door', 'Call me ASAP', 0, 0.000, 0.000, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_cancel_reasons`
--

CREATE TABLE `order_cancel_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery_histories`
--

CREATE TABLE `order_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `food_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_on_food` decimal(24,2) DEFAULT NULL,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `quantity` int(11) NOT NULL DEFAULT 1,
  `tax_amount` decimal(24,2) NOT NULL DEFAULT 1.00,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_add_on_price` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `food_id`, `order_id`, `price`, `food_details`, `variation`, `add_ons`, `discount_on_food`, `discount_type`, `quantity`, `tax_amount`, `variant`, `created_at`, `updated_at`, `item_campaign_id`, `total_add_on_price`) VALUES
(1, 1, 100001, '130.00', '{\"id\":1,\"name\":\"Fried Chicken Sandwich\",\"description\":\"Club sandwich, medium fries, drink and get free classic large sandwich\",\"image\":\"2024-01-02-65941d7fee9b2.png\",\"category_id\":2,\"category_ids\":[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2}],\"variations\":[{\"name\":\"Size\",\"type\":\"multi\",\"min\":\"1\",\"max\":\"3\",\"required\":\"off\",\"values\":[{\"label\":\"Medium\",\"optionPrice\":\"10\"},{\"label\":\"Large\",\"optionPrice\":\"20\"},{\"label\":\"Small\",\"optionPrice\":\"5\"}]}],\"add_ons\":[],\"attributes\":\"[]\",\"choice_options\":\"[]\",\"price\":100,\"tax\":5,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"available_time_starts\":\"07:00:00\",\"available_time_ends\":\"06:59:00\",\"veg\":0,\"status\":1,\"restaurant_id\":1,\"created_at\":\"2024-01-02T14:28:15.000000Z\",\"updated_at\":\"2024-01-09T20:35:35.000000Z\",\"order_count\":0,\"avg_rating\":0,\"rating_count\":0,\"recommended\":0,\"slug\":\"fried-chicken-sandwich\",\"maximum_cart_quantity\":100,\"restaurant_name\":\"WiNGS Fried Chicken\",\"restaurant_status\":1,\"restaurant_discount\":0,\"restaurant_opening_time\":\"10:00\",\"restaurant_closing_time\":\"09:59\",\"schedule_order\":false,\"free_delivery\":0,\"min_delivery_time\":30,\"max_delivery_time\":60,\"cuisines\":[{\"id\":1,\"name\":\"Chicken\",\"image\":\"2024-01-03-6594a5226c39a.png\"}],\"translations\":[{\"id\":7,\"translationable_type\":\"App\\\\Models\\\\Food\",\"translationable_id\":1,\"locale\":\"en\",\"key\":\"name\",\"value\":\"Fried Chicken Sandwich\",\"created_at\":null,\"updated_at\":null},{\"id\":8,\"translationable_type\":\"App\\\\Models\\\\Food\",\"translationable_id\":1,\"locale\":\"en\",\"key\":\"description\",\"value\":\"Club sandwich, medium fries, drink and get free classic large sandwich\",\"created_at\":null,\"updated_at\":null}]}', '[{\"name\":\"Size\",\"type\":\"multi\",\"min\":\"1\",\"max\":\"3\",\"required\":\"off\",\"values\":[{\"label\":\"Medium\",\"optionPrice\":\"10\"},{\"label\":\"Large\",\"optionPrice\":\"20\"}]}]', '[]', '13.00', 'discount_on_product', 1, '6.50', NULL, '2024-01-09 20:28:04', '2024-01-09 20:28:04', NULL, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `order_payments`
--

CREATE TABLE `order_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_amount` decimal(24,2) NOT NULL,
  `restaurant_amount` decimal(24,2) NOT NULL,
  `admin_commission` decimal(24,2) NOT NULL,
  `received_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dm_tips` double(24,2) NOT NULL DEFAULT 0.00,
  `delivery_fee_comission` double(24,2) NOT NULL DEFAULT 0.00,
  `admin_expense` decimal(23,3) DEFAULT 0.000,
  `restaurant_expense` double(23,3) DEFAULT 0.000,
  `commission_percentage` double(16,3) DEFAULT 0.000,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT 0,
  `discount_amount_by_restaurant` double(23,3) DEFAULT 0.000,
  `is_subscription` tinyint(1) DEFAULT 0,
  `additional_charge` double(23,3) NOT NULL DEFAULT 0.000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint(4) NOT NULL DEFAULT 0,
  `is_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `temp_block_time` timestamp NULL DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `gateway_callback_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `success_hook` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failure_hook` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional_data`)),
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payer_information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payer_information`)),
  `external_redirect_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`receiver_information`)),
  `attribute_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_platform` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_verifications`
--

CREATE TABLE `phone_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint(4) NOT NULL DEFAULT 0,
  `is_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `temp_block_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phone_verifications`
--

INSERT INTO `phone_verifications` (`id`, `phone`, `token`, `created_at`, `updated_at`, `otp_hit_count`, `is_blocked`, `is_temp_blocked`, `temp_block_time`) VALUES
(1, '+201128861395', '4017', '2024-01-09 17:10:27', '2024-01-09 17:10:27', 0, 0, 0, NULL),
(2, '201128861395', '7941', '2024-01-09 17:10:35', '2024-01-09 17:10:35', 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provide_d_m_earnings`
--

CREATE TABLE `provide_d_m_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `react_promotional_banners`
--

CREATE TABLE `react_promotional_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `react_services`
--

CREATE TABLE `react_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_amount` decimal(24,3) NOT NULL DEFAULT 0.000,
  `refund_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refund_method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_reasons`
--

CREATE TABLE `refund_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum_order` decimal(24,2) NOT NULL DEFAULT 0.00,
  `comission` decimal(24,2) DEFAULT NULL,
  `opening_time` time DEFAULT '10:00:00',
  `closeing_time` time DEFAULT '23:00:00',
  `free_delivery` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT 1,
  `take_away` tinyint(1) NOT NULL DEFAULT 1,
  `schedule_order` tinyint(1) NOT NULL DEFAULT 0,
  `food_section` tinyint(1) NOT NULL DEFAULT 1,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reviews_section` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `off_day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `gst` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `self_delivery_system` tinyint(1) NOT NULL DEFAULT 0,
  `pos_system` tinyint(1) NOT NULL DEFAULT 0,
  `minimum_shipping_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `delivery_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '30-40',
  `veg` tinyint(1) NOT NULL DEFAULT 1,
  `non_veg` tinyint(1) NOT NULL DEFAULT 1,
  `order_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `per_km_shipping_charge` double(16,3) UNSIGNED DEFAULT NULL,
  `restaurant_model` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'commission',
  `maximum_shipping_charge` double(23,3) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_subscription_active` tinyint(1) DEFAULT 0,
  `cutlery` tinyint(1) NOT NULL DEFAULT 0,
  `meta_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `announcement` tinyint(1) NOT NULL DEFAULT 0,
  `announcement_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_delivery_distance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_documents` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `phone`, `email`, `logo`, `latitude`, `longitude`, `address`, `footer_text`, `minimum_order`, `comission`, `opening_time`, `closeing_time`, `free_delivery`, `status`, `vendor_id`, `created_at`, `updated_at`, `rating`, `cover_photo`, `delivery`, `take_away`, `schedule_order`, `food_section`, `tax`, `zone_id`, `reviews_section`, `active`, `off_day`, `gst`, `self_delivery_system`, `pos_system`, `minimum_shipping_charge`, `delivery_time`, `veg`, `non_veg`, `order_count`, `total_order`, `per_km_shipping_charge`, `restaurant_model`, `maximum_shipping_charge`, `slug`, `order_subscription_active`, `cutlery`, `meta_title`, `meta_description`, `meta_image`, `announcement`, `announcement_message`, `qr_code`, `free_delivery_distance`, `additional_data`, `additional_documents`) VALUES
(1, 'WiNGS Fried Chicken', '89374394873', 'osamamostafa811@gmail.com', '2024-01-09-659d413f7548f.png', '48.85114242818014', '2.3206769420037032', 'Paris, France', NULL, '0.00', NULL, '10:00:00', '09:59:00', 0, 1, 1, '2024-01-02 12:17:20', '2024-01-09 20:28:04', NULL, '2024-01-09-659d413f761e3.png', 1, 1, 0, 1, '5.00', 1, 1, 1, ' ', NULL, 0, 0, '0.00', '30-60-min', 1, 1, 0, 1, NULL, 'none', NULL, 'wings-restaurant', 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(2, 'Lucca Steak House', '98479832742439', 'admin@admin.com', '2024-01-09-659d569a3102a.png', '48.85566047253323', '2.3103772593865157', 'Paris France', NULL, '0.00', NULL, '10:00:00', '09:59:00', 0, 1, 2, '2024-01-09 12:22:18', '2024-01-09 13:15:09', NULL, '2024-01-09-659d569a33e40.png', 1, 1, 0, 1, '10.00', 1, 1, 1, ' ', NULL, 0, 0, '0.00', '30-60-min', 1, 1, 0, 0, NULL, 'none', NULL, 'lucca-steak-house', 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(3, 'Arigato Sushi & Grill', '897321687325', 'arigato@gmail.com', '2024-01-09-659d57ea6631e.png', '48.85566047253323', '2.3426495982537032', 'France, Paris', NULL, '0.00', NULL, '10:00:00', '09:59:00', 0, 1, 3, '2024-01-09 12:27:54', '2024-01-09 13:15:09', NULL, '2024-01-09-659d57eac107b.png', 1, 1, 0, 1, '10.00', 1, 1, 1, ' ', NULL, 0, 0, '0.00', '10-60-min', 1, 1, 0, 0, NULL, 'none', NULL, 'arigato-sushi-grill', 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
(4, 'Norma Restaurant', '98435416461', 'norma@gmail.com.com', '2024-01-09-659d59056c69a.png', '48.835778027480416', '2.3529492808708907', 'Paris, France', NULL, '0.00', NULL, '10:00:00', '09:59:00', 0, 1, 4, '2024-01-09 12:32:37', '2024-01-09 13:15:09', NULL, '2024-01-09-659d59056ee0e.png', 1, 1, 0, 1, '5.00', 1, 1, 1, ' ', NULL, 0, 0, '0.00', '10-60-min', 1, 1, 0, 0, NULL, 'none', NULL, 'norma-restaurant', 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_configs`
--

CREATE TABLE `restaurant_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `instant_order` tinyint(1) NOT NULL DEFAULT 0,
  `customer_date_order_sratus` tinyint(1) NOT NULL DEFAULT 0,
  `customer_order_date` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_schedule`
--

CREATE TABLE `restaurant_schedule` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `day` int(11) NOT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_subscriptions`
--

CREATE TABLE `restaurant_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `expiry_date` date NOT NULL,
  `max_order` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT 0,
  `mobile_app` tinyint(1) NOT NULL DEFAULT 0,
  `chat` tinyint(1) NOT NULL DEFAULT 0,
  `review` tinyint(1) NOT NULL DEFAULT 0,
  `self_delivery` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `total_package_renewed` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_tag`
--

CREATE TABLE `restaurant_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_tag`
--

INSERT INTO `restaurant_tag` (`id`, `restaurant_id`, `tag_id`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 2, 4),
(4, 3, 5),
(5, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_wallets`
--

CREATE TABLE `restaurant_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT 0.00,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_zone`
--

CREATE TABLE `restaurant_zone` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_at` date DEFAULT NULL,
  `end_at` date DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `billing_amount` decimal(23,3) NOT NULL DEFAULT 0.000,
  `paid_amount` decimal(23,3) NOT NULL DEFAULT 0.000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_logs`
--

CREATE TABLE `subscription_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_at` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `confirmed` timestamp NULL DEFAULT NULL,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL,
  `failed` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_packages`
--

CREATE TABLE `subscription_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(24,3) NOT NULL,
  `validity` int(11) NOT NULL,
  `max_order` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unlimited',
  `max_product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unlimited',
  `pos` tinyint(1) NOT NULL DEFAULT 0,
  `mobile_app` tinyint(1) NOT NULL DEFAULT 0,
  `chat` tinyint(1) NOT NULL DEFAULT 0,
  `review` tinyint(1) NOT NULL DEFAULT 0,
  `self_delivery` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `colour` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_pauses`
--

CREATE TABLE `subscription_pauses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_schedules`
--

CREATE TABLE `subscription_schedules` (
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_transactions`
--

CREATE TABLE `subscription_transactions` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(24,3) NOT NULL DEFAULT 0.000,
  `validity` int(11) NOT NULL DEFAULT 0,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double(24,2) NOT NULL,
  `discount` int(11) NOT NULL DEFAULT 0,
  `package_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`package_details`)),
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'success',
  `transaction_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag`, `created_at`, `updated_at`) VALUES
(1, 'chicken', '2024-01-02 12:17:20', '2024-01-02 12:17:20'),
(2, 'fried', '2024-01-02 12:27:58', '2024-01-02 12:27:58'),
(3, 'steak', '2024-01-09 12:22:18', '2024-01-09 12:22:18'),
(4, 'meat', '2024-01-09 12:22:18', '2024-01-09 12:22:18'),
(5, 'sushi', '2024-01-09 12:27:54', '2024-01-09 12:27:54'),
(6, 'Burger', '2024-01-09 18:17:09', '2024-01-09 18:17:09'),
(7, 'grilled', '2024-01-09 18:27:00', '2024-01-09 18:27:00');

-- --------------------------------------------------------

--
-- Table structure for table `time_logs`
--

CREATE TABLE `time_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `online` time DEFAULT NULL,
  `offline` time DEFAULT NULL,
  `working_hour` decimal(23,3) NOT NULL DEFAULT 0.000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shift_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `track_deliverymen`
--

CREATE TABLE `track_deliverymen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `translationable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `translationable_type`, `translationable_id`, `locale`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Zone', 1, 'en', 'name', 'Paris', NULL, NULL),
(2, 'App\\Models\\Cuisine', 1, 'en', 'cuisine_name', 'Chicken', NULL, NULL),
(3, 'App\\Models\\Restaurant', 1, 'en', 'name', 'WiNGS Fried Chicken', NULL, NULL),
(4, 'App\\Models\\Restaurant', 1, 'en', 'address', 'Paris, France', NULL, NULL),
(5, 'App\\Models\\Category', 1, 'en', 'name', 'Fried', NULL, NULL),
(6, 'App\\Models\\Category', 2, 'en', 'name', 'Fried Chicken', NULL, NULL),
(7, 'App\\Models\\Food', 1, 'en', 'name', 'Fried Chicken Sandwich', NULL, NULL),
(8, 'App\\Models\\Food', 1, 'en', 'description', 'Club sandwich, medium fries, drink and get free classic large sandwich', NULL, NULL),
(9, 'App\\Models\\Coupon', 1, 'en', 'title', 'Get 10% Off On All Orders', NULL, NULL),
(10, 'App\\Models\\Coupon', 2, 'en', 'title', 'Get 10% Off On All Orders', NULL, NULL),
(11, 'App\\Models\\Cuisine', 2, 'en', 'cuisine_name', 'French', NULL, NULL),
(12, 'App\\Models\\Cuisine', 3, 'en', 'cuisine_name', 'Fast food', NULL, NULL),
(13, 'App\\Models\\Cuisine', 3, 'fr-FR', 'cuisine_name', 'Fast food', NULL, NULL),
(14, 'App\\Models\\Cuisine', 4, 'en', 'cuisine_name', 'Fruit de mer', NULL, NULL),
(15, 'App\\Models\\Cuisine', 5, 'en', 'cuisine_name', 'Chinese', NULL, NULL),
(16, 'App\\Models\\Cuisine', 5, 'fr-FR', 'cuisine_name', 'Chinois', NULL, NULL),
(17, 'App\\Models\\Restaurant', 1, 'fr-FR', 'name', 'Poulet frit WINGS', NULL, NULL),
(18, 'App\\Models\\Restaurant', 1, 'fr-FR', 'address', 'Paris, France', NULL, NULL),
(19, 'App\\Models\\Restaurant', 2, 'en', 'name', 'Lucca Steak House', NULL, NULL),
(20, 'App\\Models\\Restaurant', 2, 'en', 'address', 'Paris France', NULL, NULL),
(21, 'App\\Models\\Restaurant', 3, 'en', 'name', 'Arigato Sushi & Grill', NULL, NULL),
(22, 'App\\Models\\Restaurant', 3, 'en', 'address', 'France, Paris', NULL, NULL),
(23, 'App\\Models\\Restaurant', 4, 'en', 'name', 'Norma Restaurant', NULL, NULL),
(24, 'App\\Models\\Restaurant', 4, 'en', 'address', 'Paris, France', NULL, NULL),
(25, 'App\\Models\\Cuisine', 6, 'en', 'cuisine_name', 'Mexico', NULL, NULL),
(26, 'App\\Models\\Cuisine', 7, 'en', 'cuisine_name', 'Egyptian', NULL, NULL),
(27, 'App\\Models\\Cuisine', 1, 'fr-FR', 'cuisine_name', 'Poulette', NULL, NULL),
(28, 'App\\Models\\Cuisine', 8, 'en', 'cuisine_name', 'Grilled', NULL, NULL),
(29, 'App\\Models\\Cuisine', 8, 'fr-FR', 'cuisine_name', 'grillé', NULL, NULL),
(30, 'App\\Models\\Category', 3, 'en', 'name', 'Burger', NULL, NULL),
(31, 'App\\Models\\Category', 3, 'fr-FR', 'name', 'Burger', NULL, NULL),
(32, 'App\\Models\\Category', 4, 'en', 'name', 'Noodles', NULL, NULL),
(33, 'App\\Models\\Category', 4, 'fr-FR', 'name', 'Nouilles', NULL, NULL),
(34, 'App\\Models\\Category', 5, 'en', 'name', 'Grilled', NULL, NULL),
(35, 'App\\Models\\Category', 5, 'fr-FR', 'name', 'Grillé', NULL, NULL),
(36, 'App\\Models\\Category', 1, 'fr-FR', 'name', 'Frite', NULL, NULL),
(37, 'App\\Models\\Category', 6, 'en', 'name', 'Sea Food', NULL, NULL),
(38, 'App\\Models\\Category', 6, 'fr-FR', 'name', 'Fruit de mer', NULL, NULL),
(39, 'App\\Models\\Food', 2, 'en', 'name', 'Cheese Burger', NULL, NULL),
(40, 'App\\Models\\Food', 2, 'en', 'description', 'Big, beautiful, cheesy, sloppy, juicy burgers. That’s what Willy’s Kitchen is all about and we love it! Our favorite is the ‘Smokehouse BBQ’ which is loaded with beef bacon, fried onions, and hickory BBQ sauce.', NULL, NULL),
(41, 'App\\Models\\Food', 2, 'fr-FR', 'name', 'Burger au Fromage', NULL, NULL),
(42, 'App\\Models\\Food', 2, 'fr-FR', 'description', 'Des hamburgers gros, beaux, ringards, bâclés et juteux. C’est ce qu’est Willy’s Kitchen et nous l’adorons ! Notre préféré est le « Smokehouse BBQ » qui regorge de bacon de bœuf, d’oignons frits et de sauce barbecue hickory.', NULL, NULL),
(43, 'App\\Models\\Food', 3, 'en', 'name', 'Shocks Burgers', NULL, NULL),
(44, 'App\\Models\\Food', 3, 'en', 'description', 'he burger truck taking over the capital by storm. Shocks Burgers serves shockingly delicious burgers with a combination of balanced beef patties, flavorful toppings and one of the best buns in Egypt. The ‘Triple B’ burger is a must-try. This yummy burger is made up of American cheese, beef bacon, BBQ sauce, shocks sauce, tomato and lettuce. The service is quick and the staff are friendly. All in all, you get high quality burgers at a moderate price. We can’t recommend it highly enough.', NULL, NULL),
(45, 'App\\Models\\Food', 3, 'fr-FR', 'name', 'Shocks Burgers', NULL, NULL),
(46, 'App\\Models\\Food', 3, 'fr-FR', 'description', 'Le camion burger prend d\'assaut la capitale. Shocks Burgers sert des hamburgers incroyablement délicieux avec une combinaison de galettes de bœuf équilibrées, de garnitures savoureuses et de l\'un des meilleurs petits pains d\'Égypte. Le burger « Triple B » est un incontournable. Ce délicieux burger est composé de fromage américain, de bacon de bœuf, de sauce BBQ, de sauce choc, de tomate et de laitue. Le service est rapide et le personnel est sympathique. Dans l’ensemble, vous obtenez des hamburgers de haute qualité à un prix modéré. Nous ne saurions trop le recommander.', NULL, NULL),
(47, 'App\\Models\\Food', 4, 'en', 'name', '1/2 Grilled Boneless Chicken Meal', NULL, NULL),
(48, 'App\\Models\\Food', 4, 'en', 'description', '1/2 Grilled Boneless Chicken Meal', NULL, NULL),
(49, 'App\\Models\\Food', 4, 'fr-FR', 'name', '1/2 repas de poulet désossé grillé', NULL, NULL),
(50, 'App\\Models\\Food', 4, 'fr-FR', 'description', '1/2 repas de poulet désossé grillé', NULL, NULL),
(51, 'App\\Models\\Food', 5, 'en', 'name', 'Shish Chicken', NULL, NULL),
(52, 'App\\Models\\Food', 5, 'en', 'description', NULL, NULL, NULL),
(53, 'App\\Models\\Food', 5, 'fr-FR', 'name', 'Chich Poulet', NULL, NULL),
(54, 'App\\Models\\Food', 5, 'fr-FR', 'description', 'Chich Poulet', NULL, NULL),
(55, 'App\\Models\\Food', 6, 'en', 'name', 'Sushi', NULL, NULL),
(56, 'App\\Models\\Food', 6, 'en', 'description', 'Embracing the harmony of flavors in this sushi masterpiece', NULL, NULL),
(57, 'App\\Models\\Food', 6, 'fr-FR', 'name', 'Sushi', NULL, NULL),
(58, 'App\\Models\\Food', 6, 'fr-FR', 'description', 'Embrasser l\'harmonie des saveurs dans ce chef-d\'œuvre de sushi', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verification_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `order_count` int(11) NOT NULL DEFAULT 0,
  `login_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `wallet_balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `loyalty_point` decimal(24,3) NOT NULL DEFAULT 0.000,
  `ref_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` bigint(20) UNSIGNED DEFAULT NULL,
  `temp_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_language_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `is_phone_verified`, `email_verified_at`, `password`, `email_verification_token`, `cm_firebase_token`, `remember_token`, `created_at`, `updated_at`, `interest`, `status`, `order_count`, `login_medium`, `social_id`, `zone_id`, `wallet_balance`, `loyalty_point`, `ref_code`, `ref_by`, `temp_token`, `current_language_key`) VALUES
(5, 'Osama', 'Mostafa', '201128861395', 'osamamostafa771@gmail.com', NULL, 0, NULL, '$2y$10$M90dMK0wM8RnLcFYTqbf5ODDjY4A1/VInqVvtkcQ2MInDKhUiTIBO', NULL, NULL, NULL, '2024-01-09 17:52:46', '2024-01-09 17:52:46', NULL, 1, 0, NULL, NULL, NULL, '0.000', '0.000', 'GD0AW4PT5U', NULL, NULL, 'en'),
(6, 'Osama', 'Mostafa', '+201128861395', 'osamamostafa811@gmail.com', NULL, 1, NULL, '$2y$10$gut52sEuhHs.SXP.2Y/iAeG4XjUMYiJ2NqJ6SMnSJH5KO3o/XfoQi', NULL, 'evq8PYG_RyiFFqHvGxqlpo:APA91bEvm5PXHpI7sJmmFkM71772kdqrsZsqBNgJZFnfBqXV8XKHtdtQWyWsM-ZjGxZOOVFNSwjTONHASyTUNqUwSsp2x6uPjjses6ySwdb2GIzUOfr2XJX8sxv4ylNU5dbZmIZ7r6gj', NULL, '2024-01-09 17:52:50', '2024-01-10 09:06:45', NULL, 1, 0, NULL, NULL, 1, '0.000', '0.000', 'S1AQM8TWQK', NULL, NULL, 'fr');

-- --------------------------------------------------------

--
-- Table structure for table `user_infos`
--

CREATE TABLE `user_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deliveryman_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_infos`
--

INSERT INTO `user_infos` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `admin_id`, `user_id`, `vendor_id`, `deliveryman_id`, `created_at`, `updated_at`) VALUES
(1, 'Osama', 'Mostafa', '+201128861395', 'osamamostafa811@gmail.com', NULL, NULL, 6, NULL, NULL, '2024-01-09 20:56:48', '2024-01-09 20:56:48'),
(2, 'Osama', 'Mostafa', '0112886195', 'admin@admin.com', NULL, 1, NULL, NULL, NULL, '2024-01-09 20:57:20', '2024-01-09 20:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starting_coverage_area` double(16,2) NOT NULL,
  `maximum_coverage_area` double(16,2) NOT NULL,
  `extra_charges` double(16,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `f_name`, `l_name`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `admin_id`, `created_at`, `updated_at`, `bank_name`, `branch`, `holder_name`, `account_no`, `image`, `status`, `firebase_token`, `auth_token`) VALUES
(1, 'osama', 'mostafa', '89374394873', 'osamamostafa811@gmail.com', NULL, '$2y$10$twi73ftM2alyvBiUYyKYQuVsP3kIkigLAkOB7DrO41O1mOA5bUcm2', NULL, NULL, '2024-01-02 12:17:20', '2024-01-02 12:17:20', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(2, 'osama', 'mostafa', '98479832742439', 'admin@admin.com', NULL, '$2y$10$E1edzFrtYfolljRhJuBpG.dI/0J6YddFyI1Nfz360y/6Y9Q8eaTc.', NULL, NULL, '2024-01-09 12:22:18', '2024-01-09 12:22:18', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(3, 'osama', 'mostafa', '897321687325', 'arigato@gmail.com', NULL, '$2y$10$.r1BFPevNE.kJegzqTVgWudAXk.rzPH.3/WWAQrNR3W0yZAMyKgp2', NULL, NULL, '2024-01-09 12:27:54', '2024-01-09 12:27:54', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(4, 'osama', 'mostafa', '98435416461', 'norma@gmail.com.com', NULL, '$2y$10$xebPFD13.W5qsP6xfTtZ9eZNXdfasrT7njq/Fh1U6/VwlRunZ2GtW', NULL, NULL, '2024-01-09 12:32:37', '2024-01-09 12:32:37', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_employees`
--

CREATE TABLE `vendor_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_role_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_logs`
--

CREATE TABLE `visitor_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `visitor_log_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visitor_log_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `visit_count` int(11) NOT NULL DEFAULT 0,
  `order_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitor_logs`
--

INSERT INTO `visitor_logs` (`id`, `visitor_log_type`, `visitor_log_id`, `user_id`, `visit_count`, `order_count`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Category', 1, 6, 6, 0, '2024-01-09 19:57:53', '2024-01-09 19:57:53'),
(2, 'App\\Models\\Restaurant', 1, 6, 11, 1, '2024-01-10 09:06:19', '2024-01-10 09:06:19'),
(3, 'App\\Models\\Category', 2, 6, 1, 0, '2024-01-09 19:14:15', '2024-01-09 19:14:15'),
(4, 'App\\Models\\Restaurant', 3, 6, 2, 0, '2024-01-09 20:54:30', '2024-01-09 20:54:30'),
(5, 'App\\Models\\Restaurant', 2, 6, 1, 0, '2024-01-09 20:53:47', '2024-01-09 20:53:47'),
(6, 'App\\Models\\Restaurant', 4, 6, 3, 0, '2024-01-09 20:56:05', '2024-01-09 20:56:05');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_bonuses`
--

CREATE TABLE `wallet_bonuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bonus_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bonus_amount` double(23,3) NOT NULL DEFAULT 0.000,
  `minimum_add_amount` double(23,3) NOT NULL DEFAULT 0.000,
  `maximum_bonus_amount` double(23,3) NOT NULL DEFAULT 0.000,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_payments`
--

CREATE TABLE `wallet_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `food_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `food_id`, `created_at`, `updated_at`, `restaurant_id`) VALUES
(1, 6, NULL, '2024-01-09 19:38:02', '2024-01-09 19:38:02', 1),
(2, 6, 1, '2024-01-09 19:38:16', '2024-01-09 19:38:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_methods`
--

CREATE TABLE `withdrawal_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_fields` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(23,3) NOT NULL DEFAULT 0.000,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `withdrawal_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `withdrawal_method_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`withdrawal_method_fields`)),
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'manual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` polygon DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryman_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum_shipping_charge` double(16,3) UNSIGNED DEFAULT NULL,
  `per_km_shipping_charge` double(16,3) UNSIGNED DEFAULT NULL,
  `maximum_shipping_charge` double(23,3) DEFAULT NULL,
  `max_cod_order_amount` double(23,3) DEFAULT NULL,
  `increased_delivery_fee` double(8,2) NOT NULL DEFAULT 0.00,
  `increased_delivery_fee_status` tinyint(1) NOT NULL DEFAULT 0,
  `increase_delivery_charge_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `name`, `coordinates`, `status`, `created_at`, `updated_at`, `restaurant_wise_topic`, `customer_wise_topic`, `deliveryman_wise_topic`, `minimum_shipping_charge`, `per_km_shipping_charge`, `maximum_shipping_charge`, `max_cod_order_amount`, `increased_delivery_fee`, `increased_delivery_fee_status`, `increase_delivery_charge_message`) VALUES
(1, 'Paris', 0x000000000103000000010000000b000000ee2ae36763c10240b2aa320839734840b62ae367331e0340c8bd109d56734840262be36793450340e544bd540b704840b62ae367735603404a5326b4d26b48409a2ae3671b360340477494c7f8694840d22ae3674bd9024098f7ff882d6848407d2ae36783290240aad352e79f6948409a2ae3671bfb0140787e49e5c36b48400a2be367fb0b0240d2b7df89d46e4840ee2ae367e3230240bb3bd037c7714840ee2ae36763c10240b2aa320839734840, 1, '2024-01-02 12:06:04', '2024-01-02 12:06:04', 'zone_1_restaurant', 'zone_1_customer', 'zone_1_delivery_man', 0.000, 0.000, NULL, NULL, 0.00, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addon_settings`
--
ALTER TABLE `addon_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_settings_id_index` (`id`);

--
-- Indexes for table `add_ons`
--
ALTER TABLE `add_ons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_features`
--
ALTER TABLE `admin_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_testimonials`
--
ALTER TABLE `admin_testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `cuisines`
--
ALTER TABLE `cuisines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cuisine_restaurant`
--
ALTER TABLE `cuisine_restaurant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_settings`
--
ALTER TABLE `data_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `disbursements`
--
ALTER TABLE `disbursements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disbursement_details`
--
ALTER TABLE `disbursement_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disbursement_withdrawal_methods`
--
ALTER TABLE `disbursement_withdrawal_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_roles`
--
ALTER TABLE `employee_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_tag`
--
ALTER TABLE `food_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incentives`
--
ALTER TABLE `incentives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incentive_logs`
--
ALTER TABLE `incentive_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_configs`
--
ALTER TABLE `mail_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletters_email_unique` (`email`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_messages`
--
ALTER TABLE `notification_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `offline_payments`
--
ALTER TABLE `offline_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_cancel_reasons`
--
ALTER TABLE `order_cancel_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_transactions_zone_id_index` (`zone_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_verifications_phone_unique` (`phone`);

--
-- Indexes for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `react_promotional_banners`
--
ALTER TABLE `react_promotional_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `react_services`
--
ALTER TABLE `react_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_reasons`
--
ALTER TABLE `refund_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restaurants_phone_unique` (`phone`);

--
-- Indexes for table `restaurant_configs`
--
ALTER TABLE `restaurant_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_schedule`
--
ALTER TABLE `restaurant_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_subscriptions`
--
ALTER TABLE `restaurant_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_tag`
--
ALTER TABLE `restaurant_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_wallets`
--
ALTER TABLE `restaurant_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_zone`
--
ALTER TABLE `restaurant_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_logs`
--
ALTER TABLE `subscription_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_packages`
--
ALTER TABLE `subscription_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_pauses`
--
ALTER TABLE `subscription_pauses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_transactions`
--
ALTER TABLE `subscription_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_logs`
--
ALTER TABLE `time_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_ref_code_unique` (`ref_code`),
  ADD KEY `users_zone_id_index` (`zone_id`);

--
-- Indexes for table `user_infos`
--
ALTER TABLE `user_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_phone_unique` (`phone`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`);

--
-- Indexes for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendor_employees_email_unique` (`email`);

--
-- Indexes for table `visitor_logs`
--
ALTER TABLE `visitor_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_bonuses`
--
ALTER TABLE `wallet_bonuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_payments`
--
ALTER TABLE `wallet_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_methods`
--
ALTER TABLE `withdrawal_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `add_ons`
--
ALTER TABLE `add_ons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_features`
--
ALTER TABLE `admin_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_testimonials`
--
ALTER TABLE `admin_testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cuisines`
--
ALTER TABLE `cuisines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cuisine_restaurant`
--
ALTER TABLE `cuisine_restaurant`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_settings`
--
ALTER TABLE `data_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disbursements`
--
ALTER TABLE `disbursements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disbursement_details`
--
ALTER TABLE `disbursement_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disbursement_withdrawal_methods`
--
ALTER TABLE `disbursement_withdrawal_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_roles`
--
ALTER TABLE `employee_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `food_tag`
--
ALTER TABLE `food_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `incentives`
--
ALTER TABLE `incentives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incentive_logs`
--
ALTER TABLE `incentive_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_configs`
--
ALTER TABLE `mail_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_messages`
--
ALTER TABLE `notification_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offline_payments`
--
ALTER TABLE `offline_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100002;

--
-- AUTO_INCREMENT for table `order_cancel_reasons`
--
ALTER TABLE `order_cancel_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_payments`
--
ALTER TABLE `order_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `react_promotional_banners`
--
ALTER TABLE `react_promotional_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `react_services`
--
ALTER TABLE `react_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_reasons`
--
ALTER TABLE `refund_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `restaurant_configs`
--
ALTER TABLE `restaurant_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_schedule`
--
ALTER TABLE `restaurant_schedule`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_subscriptions`
--
ALTER TABLE `restaurant_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_tag`
--
ALTER TABLE `restaurant_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `restaurant_wallets`
--
ALTER TABLE `restaurant_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_zone`
--
ALTER TABLE `restaurant_zone`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_logs`
--
ALTER TABLE `subscription_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_packages`
--
ALTER TABLE `subscription_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_pauses`
--
ALTER TABLE `subscription_pauses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `time_logs`
--
ALTER TABLE `time_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_infos`
--
ALTER TABLE `user_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_logs`
--
ALTER TABLE `visitor_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wallet_bonuses`
--
ALTER TABLE `wallet_bonuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_payments`
--
ALTER TABLE `wallet_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `withdrawal_methods`
--
ALTER TABLE `withdrawal_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
