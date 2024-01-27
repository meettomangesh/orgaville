-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 03, 2020 at 12:22 AM
-- Server version: 8.0.22-0ubuntu0.20.04.2
-- PHP Version: 7.2.33-1+ubuntu20.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kisan_farm_fresh`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int UNSIGNED NOT NULL,
  `users_id` int UNSIGNED DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1: Male, 0: Female',
  `contact` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Contact number either phone or mobile',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'User profile picture',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Active, 0: Inactive',
  `user_type_id` int UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands_master`
--

CREATE TABLE `brands_master` (
  `id` int UNSIGNED NOT NULL,
  `cat_id` int UNSIGNED NOT NULL,
  `brand_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_description` text COLLATE utf8mb4_unicode_ci,
  `brand_logo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Active, 0: Inactive',
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories_master`
--

CREATE TABLE `categories_master` (
  `id` int UNSIGNED NOT NULL,
  `cat_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Active, 0: Inactive',
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Active, 0: Inactive',
  `created_by` int UNSIGNED NOT NULL DEFAULT '0',
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `country_id` int UNSIGNED NOT NULL,
  `state_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Active, 0: Inactive',
  `created_by` int UNSIGNED NOT NULL DEFAULT '0',
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `short_code`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Afghanistan', 'af', 1, 0, 0, NULL, NULL, NULL),
(2, 'Albania', 'al', 1, 0, 0, NULL, NULL, NULL),
(3, 'Algeria', 'dz', 1, 0, 0, NULL, NULL, NULL),
(4, 'American Samoa', 'as', 1, 0, 0, NULL, NULL, NULL),
(5, 'Andorra', 'ad', 1, 0, 0, NULL, NULL, NULL),
(6, 'Angola', 'ao', 1, 0, 0, NULL, NULL, NULL),
(7, 'Anguilla', 'ai', 1, 0, 0, NULL, NULL, NULL),
(8, 'Antarctica', 'aq', 1, 0, 0, NULL, NULL, NULL),
(9, 'Antigua and Barbuda', 'ag', 1, 0, 0, NULL, NULL, NULL),
(10, 'Argentina', 'ar', 1, 0, 0, NULL, NULL, NULL),
(11, 'Armenia', 'am', 1, 0, 0, NULL, NULL, NULL),
(12, 'Aruba', 'aw', 1, 0, 0, NULL, NULL, NULL),
(13, 'Australia', 'au', 1, 0, 0, NULL, NULL, NULL),
(14, 'Austria', 'at', 1, 0, 0, NULL, NULL, NULL),
(15, 'Azerbaijan', 'az', 1, 0, 0, NULL, NULL, NULL),
(16, 'Bahamas', 'bs', 1, 0, 0, NULL, NULL, NULL),
(17, 'Bahrain', 'bh', 1, 0, 0, NULL, NULL, NULL),
(18, 'Bangladesh', 'bd', 1, 0, 0, NULL, NULL, NULL),
(19, 'Barbados', 'bb', 1, 0, 0, NULL, NULL, NULL),
(20, 'Belarus', 'by', 1, 0, 0, NULL, NULL, NULL),
(21, 'Belgium', 'be', 1, 0, 0, NULL, NULL, NULL),
(22, 'Belize', 'bz', 1, 0, 0, NULL, NULL, NULL),
(23, 'Benin', 'bj', 1, 0, 0, NULL, NULL, NULL),
(24, 'Bermuda', 'bm', 1, 0, 0, NULL, NULL, NULL),
(25, 'Bhutan', 'bt', 1, 0, 0, NULL, NULL, NULL),
(26, 'Bolivia', 'bo', 1, 0, 0, NULL, NULL, NULL),
(27, 'Bosnia and Herzegovina', 'ba', 1, 0, 0, NULL, NULL, NULL),
(28, 'Botswana', 'bw', 1, 0, 0, NULL, NULL, NULL),
(29, 'Brazil', 'br', 1, 0, 0, NULL, NULL, NULL),
(30, 'British Indian Ocean Territory', 'io', 1, 0, 0, NULL, NULL, NULL),
(31, 'British Virgin Islands', 'vg', 1, 0, 0, NULL, NULL, NULL),
(32, 'Brunei', 'bn', 1, 0, 0, NULL, NULL, NULL),
(33, 'Bulgaria', 'bg', 1, 0, 0, NULL, NULL, NULL),
(34, 'Burkina Faso', 'bf', 1, 0, 0, NULL, NULL, NULL),
(35, 'Burundi', 'bi', 1, 0, 0, NULL, NULL, NULL),
(36, 'Cambodia', 'kh', 1, 0, 0, NULL, NULL, NULL),
(37, 'Cameroon', 'cm', 1, 0, 0, NULL, NULL, NULL),
(38, 'Canada', 'ca', 1, 0, 0, NULL, NULL, NULL),
(39, 'Cape Verde', 'cv', 1, 0, 0, NULL, NULL, NULL),
(40, 'Cayman Islands', 'ky', 1, 0, 0, NULL, NULL, NULL),
(41, 'Central African Republic', 'cf', 1, 0, 0, NULL, NULL, NULL),
(42, 'Chad', 'td', 1, 0, 0, NULL, NULL, NULL),
(43, 'Chile', 'cl', 1, 0, 0, NULL, NULL, NULL),
(44, 'China', 'cn', 1, 0, 0, NULL, NULL, NULL),
(45, 'Christmas Island', 'cx', 1, 0, 0, NULL, NULL, NULL),
(46, 'Cocos Islands', 'cc', 1, 0, 0, NULL, NULL, NULL),
(47, 'Colombia', 'co', 1, 0, 0, NULL, NULL, NULL),
(48, 'Comoros', 'km', 1, 0, 0, NULL, NULL, NULL),
(49, 'Cook Islands', 'ck', 1, 0, 0, NULL, NULL, NULL),
(50, 'Costa Rica', 'cr', 1, 0, 0, NULL, NULL, NULL),
(51, 'Croatia', 'hr', 1, 0, 0, NULL, NULL, NULL),
(52, 'Cuba', 'cu', 1, 0, 0, NULL, NULL, NULL),
(53, 'Curacao', 'cw', 1, 0, 0, NULL, NULL, NULL),
(54, 'Cyprus', 'cy', 1, 0, 0, NULL, NULL, NULL),
(55, 'Czech Republic', 'cz', 1, 0, 0, NULL, NULL, NULL),
(56, 'Democratic Republic of the Congo', 'cd', 1, 0, 0, NULL, NULL, NULL),
(57, 'Denmark', 'dk', 1, 0, 0, NULL, NULL, NULL),
(58, 'Djibouti', 'dj', 1, 0, 0, NULL, NULL, NULL),
(59, 'Dominica', 'dm', 1, 0, 0, NULL, NULL, NULL),
(60, 'Dominican Republic', 'do', 1, 0, 0, NULL, NULL, NULL),
(61, 'East Timor', 'tl', 1, 0, 0, NULL, NULL, NULL),
(62, 'Ecuador', 'ec', 1, 0, 0, NULL, NULL, NULL),
(63, 'Egypt', 'eg', 1, 0, 0, NULL, NULL, NULL),
(64, 'El Salvador', 'sv', 1, 0, 0, NULL, NULL, NULL),
(65, 'Equatorial Guinea', 'gq', 1, 0, 0, NULL, NULL, NULL),
(66, 'Eritrea', 'er', 1, 0, 0, NULL, NULL, NULL),
(67, 'Estonia', 'ee', 1, 0, 0, NULL, NULL, NULL),
(68, 'Ethiopia', 'et', 1, 0, 0, NULL, NULL, NULL),
(69, 'Falkland Islands', 'fk', 1, 0, 0, NULL, NULL, NULL),
(70, 'Faroe Islands', 'fo', 1, 0, 0, NULL, NULL, NULL),
(71, 'Fiji', 'fj', 1, 0, 0, NULL, NULL, NULL),
(72, 'Finland', 'fi', 1, 0, 0, NULL, NULL, NULL),
(73, 'France', 'fr', 1, 0, 0, NULL, NULL, NULL),
(74, 'French Polynesia', 'pf', 1, 0, 0, NULL, NULL, NULL),
(75, 'Gabon', 'ga', 1, 0, 0, NULL, NULL, NULL),
(76, 'Gambia', 'gm', 1, 0, 0, NULL, NULL, NULL),
(77, 'Georgia', 'ge', 1, 0, 0, NULL, NULL, NULL),
(78, 'Germany', 'de', 1, 0, 0, NULL, NULL, NULL),
(79, 'Ghana', 'gh', 1, 0, 0, NULL, NULL, NULL),
(80, 'Gibraltar', 'gi', 1, 0, 0, NULL, NULL, NULL),
(81, 'Greece', 'gr', 1, 0, 0, NULL, NULL, NULL),
(82, 'Greenland', 'gl', 1, 0, 0, NULL, NULL, NULL),
(83, 'Grenada', 'gd', 1, 0, 0, NULL, NULL, NULL),
(84, 'Guam', 'gu', 1, 0, 0, NULL, NULL, NULL),
(85, 'Guatemala', 'gt', 1, 0, 0, NULL, NULL, NULL),
(86, 'Guernsey', 'gg', 1, 0, 0, NULL, NULL, NULL),
(87, 'Guinea', 'gn', 1, 0, 0, NULL, NULL, NULL),
(88, 'Guinea-Bissau', 'gw', 1, 0, 0, NULL, NULL, NULL),
(89, 'Guyana', 'gy', 1, 0, 0, NULL, NULL, NULL),
(90, 'Haiti', 'ht', 1, 0, 0, NULL, NULL, NULL),
(91, 'Honduras', 'hn', 1, 0, 0, NULL, NULL, NULL),
(92, 'Hong Kong', 'hk', 1, 0, 0, NULL, NULL, NULL),
(93, 'Hungary', 'hu', 1, 0, 0, NULL, NULL, NULL),
(94, 'Iceland', 'is', 1, 0, 0, NULL, NULL, NULL),
(95, 'India', 'in', 1, 0, 0, NULL, NULL, NULL),
(96, 'Indonesia', 'id', 1, 0, 0, NULL, NULL, NULL),
(97, 'Iran', 'ir', 1, 0, 0, NULL, NULL, NULL),
(98, 'Iraq', 'iq', 1, 0, 0, NULL, NULL, NULL),
(99, 'Ireland', 'ie', 1, 0, 0, NULL, NULL, NULL),
(100, 'Isle of Man', 'im', 1, 0, 0, NULL, NULL, NULL),
(101, 'Israel', 'il', 1, 0, 0, NULL, NULL, NULL),
(102, 'Italy', 'it', 1, 0, 0, NULL, NULL, NULL),
(103, 'Ivory Coast', 'ci', 1, 0, 0, NULL, NULL, NULL),
(104, 'Jamaica', 'jm', 1, 0, 0, NULL, NULL, NULL),
(105, 'Japan', 'jp', 1, 0, 0, NULL, NULL, NULL),
(106, 'Jersey', 'je', 1, 0, 0, NULL, NULL, NULL),
(107, 'Jordan', 'jo', 1, 0, 0, NULL, NULL, NULL),
(108, 'Kazakhstan', 'kz', 1, 0, 0, NULL, NULL, NULL),
(109, 'Kenya', 'ke', 1, 0, 0, NULL, NULL, NULL),
(110, 'Kiribati', 'ki', 1, 0, 0, NULL, NULL, NULL),
(111, 'Kosovo', 'xk', 1, 0, 0, NULL, NULL, NULL),
(112, 'Kuwait', 'kw', 1, 0, 0, NULL, NULL, NULL),
(113, 'Kyrgyzstan', 'kg', 1, 0, 0, NULL, NULL, NULL),
(114, 'Laos', 'la', 1, 0, 0, NULL, NULL, NULL),
(115, 'Latvia', 'lv', 1, 0, 0, NULL, NULL, NULL),
(116, 'Lebanon', 'lb', 1, 0, 0, NULL, NULL, NULL),
(117, 'Lesotho', 'ls', 1, 0, 0, NULL, NULL, NULL),
(118, 'Liberia', 'lr', 1, 0, 0, NULL, NULL, NULL),
(119, 'Libya', 'ly', 1, 0, 0, NULL, NULL, NULL),
(120, 'Liechtenstein', 'li', 1, 0, 0, NULL, NULL, NULL),
(121, 'Lithuania', 'lt', 1, 0, 0, NULL, NULL, NULL),
(122, 'Luxembourg', 'lu', 1, 0, 0, NULL, NULL, NULL),
(123, 'Macau', 'mo', 1, 0, 0, NULL, NULL, NULL),
(124, 'Macedonia', 'mk', 1, 0, 0, NULL, NULL, NULL),
(125, 'Madagascar', 'mg', 1, 0, 0, NULL, NULL, NULL),
(126, 'Malawi', 'mw', 1, 0, 0, NULL, NULL, NULL),
(127, 'Malaysia', 'my', 1, 0, 0, NULL, NULL, NULL),
(128, 'Maldives', 'mv', 1, 0, 0, NULL, NULL, NULL),
(129, 'Mali', 'ml', 1, 0, 0, NULL, NULL, NULL),
(130, 'Malta', 'mt', 1, 0, 0, NULL, NULL, NULL),
(131, 'Marshall Islands', 'mh', 1, 0, 0, NULL, NULL, NULL),
(132, 'Mauritania', 'mr', 1, 0, 0, NULL, NULL, NULL),
(133, 'Mauritius', 'mu', 1, 0, 0, NULL, NULL, NULL),
(134, 'Mayotte', 'yt', 1, 0, 0, NULL, NULL, NULL),
(135, 'Mexico', 'mx', 1, 0, 0, NULL, NULL, NULL),
(136, 'Micronesia', 'fm', 1, 0, 0, NULL, NULL, NULL),
(137, 'Moldova', 'md', 1, 0, 0, NULL, NULL, NULL),
(138, 'Monaco', 'mc', 1, 0, 0, NULL, NULL, NULL),
(139, 'Mongolia', 'mn', 1, 0, 0, NULL, NULL, NULL),
(140, 'Montenegro', 'me', 1, 0, 0, NULL, NULL, NULL),
(141, 'Montserrat', 'ms', 1, 0, 0, NULL, NULL, NULL),
(142, 'Morocco', 'ma', 1, 0, 0, NULL, NULL, NULL),
(143, 'Mozambique', 'mz', 1, 0, 0, NULL, NULL, NULL),
(144, 'Myanmar', 'mm', 1, 0, 0, NULL, NULL, NULL),
(145, 'Namibia', 'na', 1, 0, 0, NULL, NULL, NULL),
(146, 'Nauru', 'nr', 1, 0, 0, NULL, NULL, NULL),
(147, 'Nepal', 'np', 1, 0, 0, NULL, NULL, NULL),
(148, 'Netherlands', 'nl', 1, 0, 0, NULL, NULL, NULL),
(149, 'Netherlands Antilles', 'an', 1, 0, 0, NULL, NULL, NULL),
(150, 'New Caledonia', 'nc', 1, 0, 0, NULL, NULL, NULL),
(151, 'New Zealand', 'nz', 1, 0, 0, NULL, NULL, NULL),
(152, 'Nicaragua', 'ni', 1, 0, 0, NULL, NULL, NULL),
(153, 'Niger', 'ne', 1, 0, 0, NULL, NULL, NULL),
(154, 'Nigeria', 'ng', 1, 0, 0, NULL, NULL, NULL),
(155, 'Niue', 'nu', 1, 0, 0, NULL, NULL, NULL),
(156, 'North Korea', 'kp', 1, 0, 0, NULL, NULL, NULL),
(157, 'Northern Mariana Islands', 'mp', 1, 0, 0, NULL, NULL, NULL),
(158, 'Norway', 'no', 1, 0, 0, NULL, NULL, NULL),
(159, 'Oman', 'om', 1, 0, 0, NULL, NULL, NULL),
(160, 'Pakistan', 'pk', 1, 0, 0, NULL, NULL, NULL),
(161, 'Palau', 'pw', 1, 0, 0, NULL, NULL, NULL),
(162, 'Palestine', 'ps', 1, 0, 0, NULL, NULL, NULL),
(163, 'Panama', 'pa', 1, 0, 0, NULL, NULL, NULL),
(164, 'Papua New Guinea', 'pg', 1, 0, 0, NULL, NULL, NULL),
(165, 'Paraguay', 'py', 1, 0, 0, NULL, NULL, NULL),
(166, 'Peru', 'pe', 1, 0, 0, NULL, NULL, NULL),
(167, 'Philippines', 'ph', 1, 0, 0, NULL, NULL, NULL),
(168, 'Pitcairn', 'pn', 1, 0, 0, NULL, NULL, NULL),
(169, 'Poland', 'pl', 1, 0, 0, NULL, NULL, NULL),
(170, 'Portugal', 'pt', 1, 0, 0, NULL, NULL, NULL),
(171, 'Puerto Rico', 'pr', 1, 0, 0, NULL, NULL, NULL),
(172, 'Qatar', 'qa', 1, 0, 0, NULL, NULL, NULL),
(173, 'Republic of the Congo', 'cg', 1, 0, 0, NULL, NULL, NULL),
(174, 'Reunion', 're', 1, 0, 0, NULL, NULL, NULL),
(175, 'Romania', 'ro', 1, 0, 0, NULL, NULL, NULL),
(176, 'Russia', 'ru', 1, 0, 0, NULL, NULL, NULL),
(177, 'Rwanda', 'rw', 1, 0, 0, NULL, NULL, NULL),
(178, 'Saint Barthelemy', 'bl', 1, 0, 0, NULL, NULL, NULL),
(179, 'Saint Helena', 'sh', 1, 0, 0, NULL, NULL, NULL),
(180, 'Saint Kitts and Nevis', 'kn', 1, 0, 0, NULL, NULL, NULL),
(181, 'Saint Lucia', 'lc', 1, 0, 0, NULL, NULL, NULL),
(182, 'Saint Martin', 'mf', 1, 0, 0, NULL, NULL, NULL),
(183, 'Saint Pierre and Miquelon', 'pm', 1, 0, 0, NULL, NULL, NULL),
(184, 'Saint Vincent and the Grenadines', 'vc', 1, 0, 0, NULL, NULL, NULL),
(185, 'Samoa', 'ws', 1, 0, 0, NULL, NULL, NULL),
(186, 'San Marino', 'sm', 1, 0, 0, NULL, NULL, NULL),
(187, 'Sao Tome and Principe', 'st', 1, 0, 0, NULL, NULL, NULL),
(188, 'Saudi Arabia', 'sa', 1, 0, 0, NULL, NULL, NULL),
(189, 'Senegal', 'sn', 1, 0, 0, NULL, NULL, NULL),
(190, 'Serbia', 'rs', 1, 0, 0, NULL, NULL, NULL),
(191, 'Seychelles', 'sc', 1, 0, 0, NULL, NULL, NULL),
(192, 'Sierra Leone', 'sl', 1, 0, 0, NULL, NULL, NULL),
(193, 'Singapore', 'sg', 1, 0, 0, NULL, NULL, NULL),
(194, 'Sint Maarten', 'sx', 1, 0, 0, NULL, NULL, NULL),
(195, 'Slovakia', 'sk', 1, 0, 0, NULL, NULL, NULL),
(196, 'Slovenia', 'si', 1, 0, 0, NULL, NULL, NULL),
(197, 'Solomon Islands', 'sb', 1, 0, 0, NULL, NULL, NULL),
(198, 'Somalia', 'so', 1, 0, 0, NULL, NULL, NULL),
(199, 'South Africa', 'za', 1, 0, 0, NULL, NULL, NULL),
(200, 'South Korea', 'kr', 1, 0, 0, NULL, NULL, NULL),
(201, 'South Sudan', 'ss', 1, 0, 0, NULL, NULL, NULL),
(202, 'Spain', 'es', 1, 0, 0, NULL, NULL, NULL),
(203, 'Sri Lanka', 'lk', 1, 0, 0, NULL, NULL, NULL),
(204, 'Sudan', 'sd', 1, 0, 0, NULL, NULL, NULL),
(205, 'Suriname', 'sr', 1, 0, 0, NULL, NULL, NULL),
(206, 'Svalbard and Jan Mayen', 'sj', 1, 0, 0, NULL, NULL, NULL),
(207, 'Swaziland', 'sz', 1, 0, 0, NULL, NULL, NULL),
(208, 'Sweden', 'se', 1, 0, 0, NULL, NULL, NULL),
(209, 'Switzerland', 'ch', 1, 0, 0, NULL, NULL, NULL),
(210, 'Syria', 'sy', 1, 0, 0, NULL, NULL, NULL),
(211, 'Taiwan', 'tw', 1, 0, 0, NULL, NULL, NULL),
(212, 'Tajikistan', 'tj', 1, 0, 0, NULL, NULL, NULL),
(213, 'Tanzania', 'tz', 1, 0, 0, NULL, NULL, NULL),
(214, 'Thailand', 'th', 1, 0, 0, NULL, NULL, NULL),
(215, 'Togo', 'tg', 1, 0, 0, NULL, NULL, NULL),
(216, 'Tokelau', 'tk', 1, 0, 0, NULL, NULL, NULL),
(217, 'Tonga', 'to', 1, 0, 0, NULL, NULL, NULL),
(218, 'Trinidad and Tobago', 'tt', 1, 0, 0, NULL, NULL, NULL),
(219, 'Tunisia', 'tn', 1, 0, 0, NULL, NULL, NULL),
(220, 'Turkey', 'tr', 1, 0, 0, NULL, NULL, NULL),
(221, 'Turkmenistan', 'tm', 1, 0, 0, NULL, NULL, NULL),
(222, 'Turks and Caicos Islands', 'tc', 1, 0, 0, NULL, NULL, NULL),
(223, 'Tuvalu', 'tv', 1, 0, 0, NULL, NULL, NULL),
(224, 'U.S. Virgin Islands', 'vi', 1, 0, 0, NULL, NULL, NULL),
(225, 'Uganda', 'ug', 1, 0, 0, NULL, NULL, NULL),
(226, 'Ukraine', 'ua', 1, 0, 0, NULL, NULL, NULL),
(227, 'United Arab Emirates', 'ae', 1, 0, 0, NULL, NULL, NULL),
(228, 'United Kingdom', 'gb', 1, 0, 0, NULL, NULL, NULL),
(229, 'United States', 'us', 1, 0, 0, NULL, NULL, NULL),
(230, 'Uruguay', 'uy', 1, 0, 0, NULL, NULL, NULL),
(231, 'Uzbekistan', 'uz', 1, 0, 0, NULL, NULL, NULL),
(232, 'Vanuatu', 'vu', 1, 0, 0, NULL, NULL, NULL),
(233, 'Vatican', 'va', 1, 0, 0, NULL, NULL, NULL),
(234, 'Venezuela', 've', 1, 0, 0, NULL, NULL, NULL),
(235, 'Vietnam', 'vn', 1, 0, 0, NULL, NULL, NULL),
(236, 'Wallis and Futuna', 'wf', 1, 0, 0, NULL, NULL, NULL),
(237, 'Western Sahara', 'eh', 1, 0, 0, NULL, NULL, NULL),
(238, 'Yemen', 'ye', 1, 0, 0, NULL, NULL, NULL),
(239, 'Zambia', 'zm', 1, 0, 0, NULL, NULL, NULL),
(240, 'Zimbabwe', 'zw', 1, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_cart`
--

CREATE TABLE `customer_cart` (
  `id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `cart_details` text COLLATE utf8mb4_unicode_ci,
  `platform` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_login_logs`
--

CREATE TABLE `customer_login_logs` (
  `id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `login_through` tinyint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_loyalty`
--

CREATE TABLE `customer_loyalty` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_verified` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1: Yes, 0: No',
  `email_address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1: Yes, 0: No',
  `email_verify_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_1` text COLLATE utf8mb4_unicode_ci,
  `address_2` text COLLATE utf8mb4_unicode_ci,
  `address_3` text COLLATE utf8mb4_unicode_ci,
  `date_of_birth` date DEFAULT NULL,
  `gender` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1: Male, 2: Female',
  `marital_status` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1: Yes, 0: No',
  `anniversary_date` date DEFAULT NULL,
  `spouse_dob` date DEFAULT NULL,
  `city_id` int UNSIGNED NOT NULL DEFAULT '0',
  `pin_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registered_from` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `referral_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referred_by_customer_id` int UNSIGNED NOT NULL DEFAULT '0',
  `is_app_installed` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1: Yes, 0: No',
  `app_installed_date` date DEFAULT NULL,
  `app_installed_browser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Active, 0: Inactive',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_loyalty`
--

INSERT INTO `customer_loyalty` (`id`, `name`, `mobile_number`, `mobile_verified`, `email_address`, `email_verified`, `email_verify_key`, `address_1`, `address_2`, `address_3`, `date_of_birth`, `gender`, `marital_status`, `anniversary_date`, `spouse_dob`, `city_id`, `pin_code`, `registered_from`, `referral_code`, `referred_by_customer_id`, `is_app_installed`, `app_installed_date`, `app_installed_browser`, `status`, `password`, `remember_token`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Mangesh', '9730872969', 0, 'meettomangesh@gmail.com', 0, 'Chxn7tXuAc6tOi8B0YgNaZVOBqgAwp', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, 1, 'nhPvfqxxx', 0, 0, NULL, NULL, 1, '$2y$10$KyTQHYtnAFn/RF/Azn05ROV6lHPRLDdfjuhNhWeK4sLQaEMl.9a0q', NULL, 1, 0, '2020-11-02 13:17:47', '2020-11-02 13:17:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(10,4) NOT NULL COMMENT 'Total points redeemed against this order.',
  `discounted_amount` decimal(14,4) DEFAULT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_items` int UNSIGNED NOT NULL DEFAULT '0',
  `reject_cancel_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchased_from` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `is_coupon_applied` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Yes, 2:No',
  `coupon_applied` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Pending, 2: Ordered, 3: In Process, 4: Completed',
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_order_details`
--

CREATE TABLE `customer_order_details` (
  `id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL DEFAULT '0',
  `order_id` int UNSIGNED NOT NULL DEFAULT '0',
  `products_id` int UNSIGNED NOT NULL,
  `item_quantity` int UNSIGNED NOT NULL,
  `expiry_date` date DEFAULT NULL COMMENT 'The product will not be visible beyond this date.',
  `selling_price` decimal(14,4) NOT NULL,
  `special_price` decimal(14,4) DEFAULT NULL COMMENT 'This is the discounted price',
  `special_price_start_date` date DEFAULT NULL,
  `special_price_end_date` date DEFAULT NULL,
  `reject_cancel_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Pending, 2: Ordered, 3: In Process, 4: Completed',
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_order_status_track`
--

CREATE TABLE `customer_order_status_track` (
  `id` int UNSIGNED NOT NULL,
  `order_details_id` int UNSIGNED NOT NULL DEFAULT '0',
  `order_status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Pending, 2: Ordered, 3: In Process, 4: Completed',
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2020_06_04_000001_create_permissions_table', 1),
(10, '2020_06_04_000002_create_roles_table', 1),
(11, '2020_06_04_000006_create_trips_table', 1),
(12, '2020_06_04_000007_create_permission_role_pivot_table', 1),
(13, '2020_06_04_000008_create_cities_table', 1),
(14, '2020_06_04_000008_create_role_user_pivot_table', 1),
(15, '2020_06_04_000010_add_relationship_fields_to_trips_table', 1),
(16, '2020_10_03_193259_create_products_table', 1),
(17, '2020_10_05_094739_create_admins_table', 1),
(18, '2020_10_06_140834_create_brands_master_table', 1),
(19, '2020_10_06_142815_create_categories_master_table', 1),
(20, '2020_10_06_143224_create_states_table', 1),
(21, '2020_10_06_143539_create_countries_table', 1),
(22, '2020_10_06_143706_create_customer_login_logs_table', 1),
(23, '2020_10_06_144606_create_customer_cart_table', 1),
(24, '2020_10_06_145725_create_customer_loyalty_table', 1),
(25, '2020_10_06_154306_create_customer_orders_table', 1),
(26, '2020_10_06_155720_create_customer_order_details_table', 1),
(27, '2020_10_06_160301_create_customer_order_status_track_table', 1),
(28, '2020_10_06_160501_create_pin_codes_table', 1),
(29, '2020_10_06_162245_create_product_inventory_table', 1),
(30, '2020_10_06_162438_create_user_types_table', 1),
(31, '2020_10_06_162702_create_sms_templates_table', 1),
(32, '2020_10_06_162906_create_system_emails_table', 1),
(33, '2020_10_06_163748_create_unit_master_table', 1),
(34, '2020_11_02_000009_add_relationship_fields_to_cities_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('354a2417a7206b1a5a9a01b02397edba670d14214733599c5a54528f0b29b59339f910bbdfce50ad', 1, 1, '0', '[]', 0, '2020-11-02 13:17:47', '2020-11-02 13:17:47', '2021-11-02 18:47:47'),
('b9543ffd7db2d73a6d26c2dbb4953f27a8001130610ce654eee03095c56150c3fbba7778da49f59f', 1, 1, '0', '[]', 0, '2020-11-02 13:21:34', '2020-11-02 13:21:34', '2021-11-02 18:51:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'Pnon8Xi4wJsxAqPGqdaRQg9oFL9FhAm78eW1dlOu', 'http://localhost', 1, 0, 0, '2020-11-02 13:17:06', '2020-11-02 13:17:06'),
(2, NULL, 'Laravel Password Grant Client', 'bD43moJDoe15r88xI5T73w71cFWsQ8PezlJtTyXB', 'http://localhost', 0, 1, 0, '2020-11-02 13:17:06', '2020-11-02 13:17:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-11-02 13:17:06', '2020-11-02 13:17:06');

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
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'user_management_access', NULL, NULL, NULL),
(2, 'permission_create', NULL, NULL, NULL),
(3, 'permission_edit', NULL, NULL, NULL),
(4, 'permission_show', NULL, NULL, NULL),
(5, 'permission_delete', NULL, NULL, NULL),
(6, 'permission_access', NULL, NULL, NULL),
(7, 'role_create', NULL, NULL, NULL),
(8, 'role_edit', NULL, NULL, NULL),
(9, 'role_show', NULL, NULL, NULL),
(10, 'role_delete', NULL, NULL, NULL),
(11, 'role_access', NULL, NULL, NULL),
(12, 'user_create', NULL, NULL, NULL),
(13, 'user_edit', NULL, NULL, NULL),
(14, 'user_show', NULL, NULL, NULL),
(15, 'user_delete', NULL, NULL, NULL),
(16, 'user_access', NULL, NULL, NULL),
(17, 'country_create', NULL, NULL, NULL),
(18, 'country_edit', NULL, NULL, NULL),
(19, 'country_show', NULL, NULL, NULL),
(20, 'country_delete', NULL, NULL, NULL),
(21, 'country_access', NULL, NULL, NULL),
(22, 'city_create', NULL, NULL, NULL),
(23, 'city_edit', NULL, NULL, NULL),
(24, 'city_show', NULL, NULL, NULL),
(25, 'city_delete', NULL, NULL, NULL),
(26, 'city_access', NULL, NULL, NULL),
(27, 'trip_create', NULL, NULL, NULL),
(28, 'trip_edit', NULL, NULL, NULL),
(29, 'trip_show', NULL, NULL, NULL),
(30, 'trip_delete', NULL, NULL, NULL),
(31, 'trip_access', NULL, NULL, NULL),
(32, 'profile_password_edit', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` int UNSIGNED NOT NULL,
  `permission_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32);

-- --------------------------------------------------------

--
-- Table structure for table `pin_codes`
--

CREATE TABLE `pin_codes` (
  `id` int UNSIGNED NOT NULL,
  `pin_code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Active, 0: Inactive',
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `brand_id` int UNSIGNED NOT NULL DEFAULT '0',
  `product_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `expiry_date` date DEFAULT NULL,
  `custom_text` text COLLATE utf8mb4_unicode_ci,
  `display_custom_text_or_date` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '1: Custom Text, 0: Date',
  `voucher_value` decimal(14,4) DEFAULT NULL,
  `selling_price` decimal(14,4) NOT NULL,
  `special_price` decimal(14,4) DEFAULT NULL COMMENT 'This is the discounted price',
  `special_price_start_date` date DEFAULT NULL,
  `special_price_end_date` date DEFAULT NULL,
  `current_quantity` int UNSIGNED NOT NULL DEFAULT '0',
  `min_quantity` int UNSIGNED NOT NULL DEFAULT '0',
  `max_quantity` int UNSIGNED NOT NULL DEFAULT '0',
  `max_quantity_perday_percust` int UNSIGNED NOT NULL DEFAULT '0',
  `max_quantity_perday_allcust` int UNSIGNED NOT NULL DEFAULT '0',
  `notify_for_qty_below` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `stock_availability` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: In Stock, 0: Out of Stock',
  `show_in_search_results` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Yes, 0: No',
  `pay_for_product_in` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: COD, 0: Online',
  `view_count` int UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Active, 0: Inactive',
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_inventory`
--

CREATE TABLE `product_inventory` (
  `id` int UNSIGNED NOT NULL,
  `products_id` int UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', NULL, NULL, NULL),
(2, 'User', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Active, 0: Inactive',
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int UNSIGNED NOT NULL,
  `country_id` int UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Active, 0: Inactive',
  `created_by` int UNSIGNED NOT NULL DEFAULT '0',
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_emails`
--

CREATE TABLE `system_emails` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_to` text COLLATE utf8mb4_unicode_ci,
  `email_cc` text COLLATE utf8mb4_unicode_ci,
  `email_bcc` text COLLATE utf8mb4_unicode_ci,
  `email_from` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text2` text COLLATE utf8mb4_unicode_ci,
  `email_type` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Active, 0: Inactive',
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` int UNSIGNED NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `adults` int NOT NULL,
  `children` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `city_from_id` int UNSIGNED NOT NULL,
  `city_to_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unit_master`
--

CREATE TABLE `unit_master` (
  `id` int UNSIGNED NOT NULL,
  `cat_id` int UNSIGNED NOT NULL DEFAULT '0',
  `unit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Active, 0: Inactive',
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number_verified_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `mobile_number`, `mobile_number_verified_at`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', '9999999999', NULL, 'admin@admin.com', NULL, '$2y$10$XH232IuTQCcPEkbswdv4UeGvuvnj26M1HLKkXtN4Dgx5gyI1WCIMi', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Active, 0: Inactive',
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD KEY `admins_composite_index_1` (`id`,`users_id`),
  ADD KEY `admins_users_id_index` (`users_id`),
  ADD KEY `admins_email_index` (`email`),
  ADD KEY `admins_first_name_index` (`first_name`),
  ADD KEY `admins_last_name_index` (`last_name`),
  ADD KEY `admins_status_index` (`status`),
  ADD KEY `admins_user_type_id_index` (`user_type_id`);

--
-- Indexes for table `brands_master`
--
ALTER TABLE `brands_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_master_brand_name_unique` (`brand_name`),
  ADD KEY `brands_master_cat_id_index` (`cat_id`),
  ADD KEY `brands_master_status_index` (`status`);

--
-- Indexes for table `categories_master`
--
ALTER TABLE `categories_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_master_cat_name_unique` (`cat_name`),
  ADD KEY `categories_master_status_index` (`status`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cities_name_unique` (`name`),
  ADD KEY `cities_status_index` (`status`),
  ADD KEY `country_fk_1586974` (`country_id`),
  ADD KEY `state_fk_1586974` (`state_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_name_unique` (`name`),
  ADD KEY `countries_status_index` (`status`);

--
-- Indexes for table `customer_cart`
--
ALTER TABLE `customer_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_cart_customer_id_index` (`customer_id`),
  ADD KEY `customer_cart_platform_index` (`platform`);

--
-- Indexes for table `customer_login_logs`
--
ALTER TABLE `customer_login_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_login_logs_customer_id_index` (`customer_id`),
  ADD KEY `customer_login_logs_login_through_index` (`login_through`);

--
-- Indexes for table `customer_loyalty`
--
ALTER TABLE `customer_loyalty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_loyalty_mobile_number_unique` (`mobile_number`),
  ADD UNIQUE KEY `customer_loyalty_email_verify_key_unique` (`email_verify_key`),
  ADD UNIQUE KEY `customer_loyalty_referral_code_unique` (`referral_code`),
  ADD KEY `customer_loyalty_name_index` (`name`),
  ADD KEY `customer_loyalty_mobile_verified_index` (`mobile_verified`),
  ADD KEY `customer_loyalty_email_address_index` (`email_address`),
  ADD KEY `customer_loyalty_email_verified_index` (`email_verified`),
  ADD KEY `customer_loyalty_city_id_index` (`city_id`),
  ADD KEY `customer_loyalty_pin_code_index` (`pin_code`),
  ADD KEY `customer_loyalty_registered_from_index` (`registered_from`),
  ADD KEY `customer_loyalty_referred_by_customer_id_index` (`referred_by_customer_id`),
  ADD KEY `customer_loyalty_is_app_installed_index` (`is_app_installed`),
  ADD KEY `customer_loyalty_status_index` (`status`);

--
-- Indexes for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_orders_customer_id_index` (`customer_id`),
  ADD KEY `customer_orders_payment_id_index` (`payment_id`),
  ADD KEY `customer_orders_total_items_index` (`total_items`),
  ADD KEY `customer_orders_reject_cancel_reason_index` (`reject_cancel_reason`),
  ADD KEY `customer_orders_purchased_from_index` (`purchased_from`),
  ADD KEY `customer_orders_is_coupon_applied_index` (`is_coupon_applied`),
  ADD KEY `customer_orders_order_status_index` (`order_status`);

--
-- Indexes for table `customer_order_details`
--
ALTER TABLE `customer_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_order_details_customer_id_index` (`customer_id`),
  ADD KEY `customer_order_details_order_id_index` (`order_id`),
  ADD KEY `customer_order_details_products_id_index` (`products_id`),
  ADD KEY `customer_order_details_expiry_date_index` (`expiry_date`),
  ADD KEY `customer_order_details_special_price_start_date_index` (`special_price_start_date`),
  ADD KEY `customer_order_details_special_price_end_date_index` (`special_price_end_date`),
  ADD KEY `customer_order_details_reject_cancel_reason_index` (`reject_cancel_reason`),
  ADD KEY `customer_order_details_order_status_index` (`order_status`);

--
-- Indexes for table `customer_order_status_track`
--
ALTER TABLE `customer_order_status_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_order_status_track_order_details_id_index` (`order_details_id`),
  ADD KEY `customer_order_status_track_order_status_index` (`order_status`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `role_id_fk_1586949` (`role_id`),
  ADD KEY `permission_id_fk_1586949` (`permission_id`);

--
-- Indexes for table `pin_codes`
--
ALTER TABLE `pin_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pin_codes_pin_code_index` (`pin_code`),
  ADD KEY `pin_codes_city_id_index` (`city_id`),
  ADD KEY `pin_codes_status_index` (`status`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_brand_id_index` (`brand_id`),
  ADD KEY `products_product_name_index` (`product_name`),
  ADD KEY `products_short_description_index` (`short_description`),
  ADD KEY `products_display_custom_text_or_date_index` (`display_custom_text_or_date`),
  ADD KEY `products_special_price_start_date_index` (`special_price_start_date`),
  ADD KEY `products_special_price_end_date_index` (`special_price_end_date`),
  ADD KEY `products_current_quantity_index` (`current_quantity`),
  ADD KEY `products_min_quantity_index` (`min_quantity`),
  ADD KEY `products_max_quantity_index` (`max_quantity`),
  ADD KEY `products_max_quantity_perday_percust_index` (`max_quantity_perday_percust`),
  ADD KEY `products_max_quantity_perday_allcust_index` (`max_quantity_perday_allcust`),
  ADD KEY `products_notify_for_qty_below_index` (`notify_for_qty_below`),
  ADD KEY `products_stock_availability_index` (`stock_availability`),
  ADD KEY `products_show_in_search_results_index` (`show_in_search_results`),
  ADD KEY `products_pay_for_product_in_index` (`pay_for_product_in`),
  ADD KEY `products_view_count_index` (`view_count`),
  ADD KEY `products_status_index` (`status`);

--
-- Indexes for table `product_inventory`
--
ALTER TABLE `product_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_inventory_products_id_index` (`products_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `user_id_fk_1586958` (`user_id`),
  ADD KEY `role_id_fk_1586958` (`role_id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_templates_title_index` (`title`),
  ADD KEY `sms_templates_name_index` (`name`),
  ADD KEY `sms_templates_message_index` (`message`),
  ADD KEY `sms_templates_sender_id_index` (`sender_id`),
  ADD KEY `sms_templates_status_index` (`status`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `states_name_unique` (`name`),
  ADD KEY `states_country_id_index` (`country_id`),
  ADD KEY `states_status_index` (`status`);

--
-- Indexes for table `system_emails`
--
ALTER TABLE `system_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_emails_name_index` (`name`),
  ADD KEY `system_emails_description_index` (`description`),
  ADD KEY `system_emails_email_from_index` (`email_from`),
  ADD KEY `system_emails_subject_index` (`subject`),
  ADD KEY `system_emails_email_type_index` (`email_type`),
  ADD KEY `system_emails_tags_index` (`tags`),
  ADD KEY `system_emails_status_index` (`status`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_from_fk_1587040` (`city_from_id`),
  ADD KEY `city_to_fk_1587042` (`city_to_id`);

--
-- Indexes for table `unit_master`
--
ALTER TABLE `unit_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_master_cat_id_index` (`cat_id`),
  ADD KEY `unit_master_unit_index` (`unit`),
  ADD KEY `unit_master_status_index` (`status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_mobile_number_unique` (`mobile_number`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_types_name_index` (`name`),
  ADD KEY `user_types_status_index` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands_master`
--
ALTER TABLE `brands_master`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories_master`
--
ALTER TABLE `categories_master`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT for table `customer_cart`
--
ALTER TABLE `customer_cart`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_login_logs`
--
ALTER TABLE `customer_login_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_loyalty`
--
ALTER TABLE `customer_loyalty`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_order_details`
--
ALTER TABLE `customer_order_details`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_order_status_track`
--
ALTER TABLE `customer_order_status_track`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `pin_codes`
--
ALTER TABLE `pin_codes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_inventory`
--
ALTER TABLE `product_inventory`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_emails`
--
ALTER TABLE `system_emails`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit_master`
--
ALTER TABLE `unit_master`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `country_fk_1586974` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `state_fk_1586974` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_id_fk_1586949` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_id_fk_1586949` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_id_fk_1586958` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id_fk_1586958` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `city_from_fk_1587040` FOREIGN KEY (`city_from_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `city_to_fk_1587042` FOREIGN KEY (`city_to_id`) REFERENCES `cities` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
