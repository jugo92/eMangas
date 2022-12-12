-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.36 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour emangas
CREATE DATABASE IF NOT EXISTS `emangas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `emangas`;

-- Listage de la structure de table emangas. announces
CREATE TABLE IF NOT EXISTS `announces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` bigint(20) unsigned DEFAULT NULL,
  `idCategorie` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `inventory` int(11) NOT NULL,
  `nbSales` int(11) NOT NULL,
  `stripe_announce` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_announces_users` (`idUser`),
  KEY `FK_announces_subscriptions` (`stripe_announce`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.announces : 2 rows
/*!40000 ALTER TABLE `announces` DISABLE KEYS */;
INSERT INTO `announces` (`id`, `idUser`, `idCategorie`, `description`, `title`, `slug`, `price`, `inventory`, `nbSales`, `stripe_announce`, `created_at`, `updated_at`) VALUES
	(30, 36, '1,3', 'Tueur en série', 'Dahmer', 'lcfddz', 12, 12, 0, 'fgver', '2022-12-09 19:32:57', '2022-12-09 19:32:57'),
	(1, 1, '3', 'a', 'a', 'blabla7', 1, 1, 0, 'dzzdzdzdz', '2022-12-09 18:55:01', '2022-12-09 18:55:01');
/*!40000 ALTER TABLE `announces` ENABLE KEYS */;

-- Listage de la structure de table emangas. announce_categorie
CREATE TABLE IF NOT EXISTS `announce_categorie` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `announce_id` bigint(20) unsigned DEFAULT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_announce_categorie_announces` (`announce_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.announce_categorie : 0 rows
/*!40000 ALTER TABLE `announce_categorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `announce_categorie` ENABLE KEYS */;

-- Listage de la structure de table emangas. categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.categories : 6 rows
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Shonen', '2022-12-07 18:20:56', '2022-12-07 18:30:00'),
	(5, 'et', '2022-12-11 13:39:34', '2022-12-11 13:39:34'),
	(6, 'quod', '2022-12-11 13:39:34', '2022-12-11 13:39:34'),
	(7, 'quam', '2022-12-11 13:39:34', '2022-12-11 13:39:34'),
	(8, 'tempora', '2022-12-11 13:39:34', '2022-12-11 13:39:34'),
	(9, 'in', '2022-12-11 13:39:34', '2022-12-11 13:39:34');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Listage de la structure de table emangas. failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.failed_jobs : 0 rows
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Listage de la structure de table emangas. likes
CREATE TABLE IF NOT EXISTS `likes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idUser` bigint(20) unsigned DEFAULT NULL,
  `idAnnounce` bigint(20) unsigned DEFAULT NULL,
  `status` enum('like','dislike') DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Listage des données de la table emangas.likes : 2 rows
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` (`id`, `idUser`, `idAnnounce`, `status`) VALUES
	(1, 1, 1, 'like'),
	(2, 1, 1, 'like');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;

-- Listage de la structure de table emangas. migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.migrations : 15 rows
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2022_11_23_142022_add_param_to_users_table', 2),
	(21, '2022_11_23_143028_create_announces_table', 3),
	(22, '2022_11_23_143048_create_payments_table', 3),
	(23, '2022_11_23_143059_create_categories_table', 3),
	(24, '2022_11_23_143128_create_categorieannounces_table', 3),
	(25, '2022_12_07_194857_edit_table_intermediate_table_name', 4),
	(26, '2022_12_08_180857_change_role_in_string_table', 5),
	(30, '2022_12_08_200000_change_announce_id_categorie_type_table', 6),
	(31, '2022_12_09_000309_rename_column_bn_sales', 7),
	(32, '2022_12_10_135548_drop_payments_table', 7),
	(33, '2022_12_10_143622_modfication_announces_table', 8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Listage de la structure de table emangas. password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.password_resets : 0 rows
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Listage de la structure de table emangas. permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.permissions : 0 rows
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Listage de la structure de table emangas. personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.personal_access_tokens : 0 rows
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Listage de la structure de table emangas. subscriptions
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_vendeur` bigint(20) unsigned NOT NULL,
  `id_acheteur` bigint(20) unsigned NOT NULL,
  `stripe_announce` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.subscriptions : 22 rows
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` (`id`, `id_vendeur`, `id_acheteur`, `stripe_announce`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
	(1, 0, 2, 'plan_MxQpBI8Anu0pJb', 1, 0, '2022-12-10 15:33:25', '2022-12-10 15:33:25'),
	(2, 0, 2, 'plan_MxQpBI8Anu0pJb', 1, 0, '2022-12-10 16:13:19', '2022-12-10 16:13:19'),
	(3, 0, 2, 'plan_MxQpBI8Anu0pJb', 1, 0, '2022-12-10 17:47:02', '2022-12-10 17:47:02'),
	(4, 0, 2, 'plan_MxQpBI8Anu0pJb', 1, 0, '2022-12-10 17:53:35', '2022-12-10 17:53:35'),
	(5, 0, 2, 'plan_MxQpBI8Anu0pJb', 1, 0, '2022-12-10 19:02:26', '2022-12-10 19:02:26'),
	(6, 0, 2, 'plan_MxQpBI8Anu0pJb', 1, 0, '2022-12-10 19:03:36', '2022-12-10 19:03:36'),
	(7, 0, 2, 'plan_MxQpBI8Anu0pJb', 1, 0, '2022-12-10 19:04:07', '2022-12-10 19:04:07'),
	(8, 0, 1, 'plan_MxQpBI8Anu0pJb', 1, 0, '2022-12-10 19:07:04', '2022-12-10 19:07:04'),
	(9, 0, 1, 'plan_MxQpBI8Anu0pJb', NULL, 0, '2022-12-10 20:49:50', '2022-12-10 20:49:50'),
	(10, 2, 1, 'plan_MxQpBI8Anu0pJb', NULL, 50, '2022-12-10 21:11:00', '2022-12-10 21:11:00'),
	(11, 1, 1, 'plan_MxWRuBMcLgMiI0', 1, 11, '2022-12-10 21:29:49', '2022-12-10 21:29:49'),
	(12, 1, 1, 'plan_MxWRuBMcLgMiI0', 1, 11, '2022-12-10 22:01:42', '2022-12-10 22:01:42'),
	(13, 2, 1, 'striped', 1, 10, '2022-12-10 22:37:43', '2022-12-10 22:37:43'),
	(14, 1, 2, 'plan_MxWRuBMcLgMiI0', 1, 11, '2022-12-10 22:42:53', '2022-12-10 22:42:53'),
	(15, 1, 2, 'plan_MxWRuBMcLgMiI0', 1, 11, '2022-12-10 22:43:13', '2022-12-10 22:43:13'),
	(16, 52, 1, 'plan_MxkYPDdkaYYXgD', 1, 2, '2022-12-11 11:59:43', '2022-12-11 11:59:43'),
	(17, 52, 1, 'plan_MxkYPDdkaYYXgD', 1, 2, '2022-12-11 12:20:22', '2022-12-11 12:20:22'),
	(18, 52, 1, 'plan_MxkYPDdkaYYXgD', 1, 2, '2022-12-11 12:37:26', '2022-12-11 12:37:26'),
	(19, 52, 1, 'plan_MxkYPDdkaYYXgD', 1, 2, '2022-12-11 12:51:06', '2022-12-11 12:51:06'),
	(20, 52, 1, 'plan_MxkYPDdkaYYXgD', 1, 2, '2022-12-11 12:53:36', '2022-12-11 12:53:36'),
	(21, 52, 1, 'plan_MxlfeNUL0AnV2G', 1, 123, '2022-12-11 13:06:02', '2022-12-11 13:06:02'),
	(22, 56, 1, 'plan_MxluCUbMe2a7Pq', 1, 79651, '2022-12-11 13:20:45', '2022-12-11 13:20:45');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;

-- Listage de la structure de table emangas. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pseudo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` double NOT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` enum('admin','user','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.users : 26 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `firstName`, `pseudo`, `email`, `phoneNumber`, `notes`, `adresse`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Makan', 'Kamissoko', 'mak', 'm@m.fr', 'epaZD6wZBK', 0, 'epaZD6wZBK', 'admin', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2022-11-23 12:53:15', '2022-12-11 15:10:43'),
	(49, 'fUmRaWiNZ2', 'fUmRaWiNZ2', 'fUmRaWiNZ2', 'fUmRaWiNZ2', 'fUmRaWiNZ2', 0, 'fUmRaWiNZ2', 'inactive', '2022-12-09 20:59:03', 'fUmRaWiNZ2', 'ugX2tcEieY', '2022-12-09 20:59:03', '2022-12-11 15:20:59'),
	(45, 'ZubDi89ZnQ', 'ZubDi89ZnQ', 'ZubDi89ZnQ', 'ZubDi89ZnQ', 'ZubDi89ZnQ', 0, 'ZubDi89ZnQ', 'inactive', '2022-12-09 20:59:03', 'ZubDi89ZnQ', 'yVqmbfCVvO', '2022-12-09 20:59:03', '2022-12-11 15:35:50'),
	(44, 'i1cEhbowDq', 'i1cEhbowDq', 'i1cEhbowDq', 'i1cEhbowDq', 'i1cEhbowDq', 0, 'i1cEhbowDq', 'inactive', '2022-12-09 20:59:03', 'i1cEhbowDq', 'PzFeI7y2IN', '2022-12-09 20:59:03', '2022-12-11 15:35:56'),
	(32, 'YTdv32MD5L', 'YTdv32MD5L', 'YTdv32MD5L', 'YTdv32MD5L', 'YTdv32MD5L', 0, 'YTdv32MD5L', 'inactive', '2022-12-08 16:55:05', 'YTdv32MD5L', 'viUEojnPSi', '2022-12-08 16:55:06', '2022-12-11 15:36:53'),
	(43, 'ZssAH4VLak', 'ZssAH4VLak', 'ZssAH4VLak', 'ZssAH4VLak', 'ZssAH4VLak', 0, 'ZssAH4VLak', 'inactive', '2022-12-09 20:59:03', 'ZssAH4VLak', 'wURQCnyS4L', '2022-12-09 20:59:03', '2022-12-11 15:37:12'),
	(53, 'Vh7K6cGr0H', 'Vh7K6cGr0H', 'Vh7K6cGr0H', 'Vh7K6cGr0H', 'Vh7K6cGr0H', 0, 'Vh7K6cGr0H', 'inactive', '2022-12-10 09:53:17', 'Vh7K6cGr0H', 'qUn7epy1XU', '2022-12-10 09:53:18', '2022-12-11 16:25:47'),
	(54, '6fL1oYiLwG', '6fL1oYiLwG', '6fL1oYiLwG', '6fL1oYiLwG', '6fL1oYiLwG', 0, '6fL1oYiLwG', 'inactive', '2022-12-10 09:53:17', '6fL1oYiLwG', 'fHPaXO6yuE', '2022-12-10 09:53:18', '2022-12-11 15:29:07'),
	(55, 'zwXY8Zdcj5', 'zwXY8Zdcj5', 'zwXY8Zdcj5', 'zwXY8Zdcj5', 'zwXY8Zdcj5', 0, 'zwXY8Zdcj5', 'inactive', '2022-12-10 09:53:18', 'zwXY8Zdcj5', '17YEGVJFd6', '2022-12-10 09:53:18', '2022-12-11 15:29:33'),
	(56, '5p5IwfR8ZE', '5p5IwfR8ZE', '5p5IwfR8ZE', '5p5IwfR8ZE', '5p5IwfR8ZE', 0, '5p5IwfR8ZE', 'inactive', '2022-12-10 09:53:18', '5p5IwfR8ZE', '1bYmDRhtsB9OG4Z6kOBNlvNbDkPJKNPeRunA6Cy02g3Wyf9Kec5KZBJiwMwO', '2022-12-10 09:53:18', '2022-12-11 15:30:06'),
	(57, 'BMISQWqREu', 'BMISQWqREu', 'BMISQWqREu', 'BMISQWqREu', 'BMISQWqREu', 0, 'BMISQWqREu', 'inactive', '2022-12-10 09:53:18', 'BMISQWqREu', 'dZujh61uPj', '2022-12-10 09:53:18', '2022-12-11 15:33:00'),
	(58, 'Christop Gottlieb', 'Koch', 'rkuhic', 'blanda.sammie@example.org', '(903) 907-0526', 6, '44606 Crooks Hill Suite 563\nNoelberg, CO 01281', 'user', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4n1U9dlfHS', '2022-12-10 09:53:18', '2022-12-10 09:53:18'),
	(59, 'Alexie Sauer DVM', 'Mohr', 'karelle.runolfsdottir', 'west.tre@example.com', '+1.801.897.6674', 8, '45372 Josiane Shores Apt. 336\nBoehmton, MA 35251-9998', 'user', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lpabnnPMhG', '2022-12-10 09:53:18', '2022-12-10 09:53:18'),
	(60, 'Nichole Hauck', 'Rogahn', 'tod.fay', 'xpadberg@example.net', '+1-276-327-5588', 3, '429 Margarette Terrace\nWilliamsonville, DC 21095-5493', 'user', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lCaAQ6t6Fa', '2022-12-10 09:53:18', '2022-12-10 09:53:18'),
	(61, 'Antonietta Weber', 'Bartoletti', 'russel.rosa', 'tdouglas@example.org', '+1-442-643-5009', 3, '3307 Jarrod Mission\nRathfort, SC 56536-0231', 'user', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'c9sM9v22wn', '2022-12-10 09:53:18', '2022-12-10 09:53:18'),
	(62, 'Ena Daniel', 'Connelly', 'eula97', 'ava61@example.org', '234-643-4216', 4, '627 Lorine Wall\nDurganview, FL 40799-9092', 'user', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jTTcNMCdwh', '2022-12-10 09:53:18', '2022-12-10 09:53:18'),
	(63, 'Kiarra Bashirian', 'Larson', 'rodolfo.spencer', 'wolson@example.com', '1-978-368-6559', 0, '9249 Aimee Station\nSchaeferberg, LA 24032', 'user', '2022-12-11 13:39:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Tmks2XUNYh', '2022-12-11 13:39:34', '2022-12-11 13:39:34'),
	(64, 'Stewart Cartwright', 'Ebert', 'bergstrom.eugenia', 'zohara@example.net', '(856) 691-0414', 6, '953 Miller Locks Apt. 391\nWest Bernitafurt, SD 13123-6514', 'user', '2022-12-11 13:39:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eEjhMYACqE', '2022-12-11 13:39:34', '2022-12-11 13:39:34'),
	(65, 'Frida Kassulke', 'Beier', 'hills.payton', 'bconroy@example.net', '+1.989.988.7763', 9, '618 Kessler Spur\nNew Alliebury, MA 79266', 'user', '2022-12-11 13:39:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'seTQIPTgXW', '2022-12-11 13:39:34', '2022-12-11 13:39:34'),
	(66, 'Athena Haag', 'Bechtelar', 'dylan83', 'leffler.jeramy@example.com', '+1.747.277.3509', 3, '704 Joan Knolls Suite 549\nPort Jakobville, GA 25649', 'user', '2022-12-11 13:39:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XATuB76Gzk', '2022-12-11 13:39:34', '2022-12-11 13:39:34'),
	(67, 'Santina Gleason', 'Schulist', 'justus23', 'aurelio.boyle@example.net', '+1-951-392-5657', 7, '4987 Lura Cove\nOttoview, OK 37250-1477', 'user', '2022-12-11 13:39:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vScqPHoBHE', '2022-12-11 13:39:34', '2022-12-11 13:39:34'),
	(68, 'Princess Jacobi', 'Howe', 'brandy.oreilly', 'slang@example.net', '785-551-2845', 5, '3144 Virginie Islands Apt. 383\nFeilside, NE 60647', 'user', '2022-12-11 13:39:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'mo9BmvNEnY', '2022-12-11 13:39:34', '2022-12-11 13:39:34'),
	(69, 'Dr. Ellsworth Jones', 'McCullough', 'theodore.bailey', 'raltenwerth@example.org', '734.581.8201', 5, '6360 Gilda Forges Suite 524\nMurielbury, AZ 11822-7917', 'user', '2022-12-11 13:39:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HGQrZ6NAie', '2022-12-11 13:39:34', '2022-12-11 13:39:34'),
	(70, 'Dr. Howell Bauch IV', 'Reichel', 'greyson.nader', 'metz.holly@example.org', '1-802-497-2488', 5, '1855 Shaina Grove Apt. 486\nPort Ilenebury, HI 33936-4928', 'user', '2022-12-11 13:39:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EJRO4mYKCP', '2022-12-11 13:39:34', '2022-12-11 13:39:34'),
	(71, 'Cordell Hermann', 'Rogahn', 'predovic.kendrick', 'pmante@example.org', '346-740-3156', 7, '915 Roob Union Apt. 923\nNew Karastad, MT 62797-5414', 'user', '2022-12-11 13:39:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KSUMQJsbCT', '2022-12-11 13:39:34', '2022-12-11 13:39:34'),
	(72, 'Amos Green DDS', 'Beatty', 'sydney66', 'mckenzie.dayana@example.com', '1-512-693-3943', 0, '31544 Mariah Point\nEast Judson, NJ 67858-0596', 'user', '2022-12-11 13:39:34', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8q1BrMKFBu', '2022-12-11 13:39:34', '2022-12-11 13:39:34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
