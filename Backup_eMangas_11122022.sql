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
DROP DATABASE IF EXISTS `emangas`;
CREATE DATABASE IF NOT EXISTS `emangas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `emangas`;

-- Listage de la structure de table emangas. announces
DROP TABLE IF EXISTS `announces`;
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
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.announces : 17 rows
/*!40000 ALTER TABLE `announces` DISABLE KEYS */;
INSERT INTO `announces` (`id`, `idUser`, `idCategorie`, `description`, `title`, `slug`, `price`, `inventory`, `nbSales`, `stripe_announce`, `created_at`, `updated_at`) VALUES
	(1, 1, '1', 'blablabla 30 fois', 'my announce', '', 5.43, 254, 0, '', '2022-12-06 18:38:29', '2022-12-07 17:40:14'),
	(2, 1, '1', 'Encore du blabla', 'Annonce 2', '', 12, 2, 0, '', '2022-12-06 19:03:28', '2022-12-06 19:03:28'),
	(29, 37, '3', 'a', 'a', '', 1, 1, 0, '', '2022-12-09 18:55:01', '2022-12-09 18:55:01'),
	(7, 1, '3', 'Lorem Ipsum Dolor Blabla Sit Amet', 'Annonce en création', '', 223, 4, 0, '', '2022-12-06 20:54:12', '2022-12-06 21:18:43'),
	(12, 1, '1', 'une description', 'Une nouvelle annonce', '', 100, 100, 0, '', '2022-12-07 18:08:17', '2022-12-07 18:08:17'),
	(16, 1, '1', 'blabla', 'blabla', '', 123, 321, 0, '', '2022-12-07 18:40:00', '2022-12-07 18:40:00'),
	(17, 1, '1', 'blabla', 'blabla', '', 123, 321, 0, '', '2022-12-07 18:55:19', '2022-12-07 18:55:19'),
	(18, 1, '1', 'il sert à insérer auto une donnée dans la table de liaison', 'belongsToMany', '', 101, 101, 0, '', '2022-12-07 18:56:25', '2022-12-07 18:56:25'),
	(19, 1, '1', 'test', 'test', '', 602, 620, 0, '', '2022-12-07 18:58:39', '2022-12-07 18:58:39'),
	(21, 1, '1,3', ';o;o;o', ':iio', '', 1414, 141, 0, '', '2022-12-08 19:02:12', '2022-12-08 19:02:12'),
	(22, 1, '1,3', ';o;o;o', ':iio', '', 1414, 141, 0, '', '2022-12-08 19:05:13', '2022-12-08 19:05:13'),
	(23, 1, '1,3', ';o;o;o', ':iio', '', 1414, 141, 0, '', '2022-12-08 19:06:04', '2022-12-08 19:06:04'),
	(24, 1, '1,3', 'my desc', 'my title', '', 21, 15, 0, '', '2022-12-08 19:07:26', '2022-12-08 19:07:26'),
	(25, 1, '3', 'desc my', 'title my', '', 62, 55, 0, '', '2022-12-08 19:07:50', '2022-12-08 19:07:50'),
	(30, 36, '1,3', 'Tueur en série', 'Dahmer', '', 12, 12, 0, '', '2022-12-09 19:32:57', '2022-12-09 19:32:57'),
	(34, 1, '3', 'azazaz', 'azaz', '', 58, 58, 0, '', '2022-12-09 20:36:39', '2022-12-09 20:39:17'),
	(35, 52, '1,3', 'descdesc', 'nouvelle', 'nouvelle', 2, 12, 5, 'plan_MxkYPDdkaYYXgD', '2022-12-11 11:55:11', '2022-12-11 12:53:36');
/*!40000 ALTER TABLE `announces` ENABLE KEYS */;

-- Listage de la structure de table emangas. announce_categorie
DROP TABLE IF EXISTS `announce_categorie`;
CREATE TABLE IF NOT EXISTS `announce_categorie` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `announce_id` bigint(20) unsigned DEFAULT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_announce_categorie_announces` (`announce_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.announce_categorie : 9 rows
/*!40000 ALTER TABLE `announce_categorie` DISABLE KEYS */;
INSERT INTO `announce_categorie` (`id`, `announce_id`, `categorie_id`, `created_at`, `updated_at`) VALUES
	(1, 17, 1, NULL, NULL),
	(2, 18, 1, NULL, NULL),
	(3, 23, 1, NULL, NULL),
	(27, 35, 3, NULL, NULL),
	(26, 35, 1, NULL, NULL),
	(25, 35, 3, NULL, NULL),
	(24, 35, 1, NULL, NULL),
	(23, 34, 3, NULL, NULL),
	(21, 34, 3, NULL, NULL);
/*!40000 ALTER TABLE `announce_categorie` ENABLE KEYS */;

-- Listage de la structure de table emangas. categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.categories : 2 rows
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Shonen', '2022-12-07 18:20:56', '2022-12-07 18:30:00'),
	(3, 'Seinen', '2022-12-07 18:30:31', '2022-12-07 18:30:31');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Listage de la structure de table emangas. failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
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

-- Listage de la structure de table emangas. migrations
DROP TABLE IF EXISTS `migrations`;
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
DROP TABLE IF EXISTS `password_resets`;
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
DROP TABLE IF EXISTS `permissions`;
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
DROP TABLE IF EXISTS `personal_access_tokens`;
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
DROP TABLE IF EXISTS `subscriptions`;
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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.subscriptions : 20 rows
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
	(20, 52, 1, 'plan_MxkYPDdkaYYXgD', 1, 2, '2022-12-11 12:53:36', '2022-12-11 12:53:36');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;

-- Listage de la structure de table emangas. users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pseudo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` double NOT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.users : 22 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `firstName`, `pseudo`, `email`, `phoneNumber`, `notes`, `adresse`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Makan', 'Kamissoko', 'mak', 'm@m.fr', '0606060606', 0, 'Faubourg Saint-Antoine', 'admin', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2022-11-23 12:53:15', '2022-12-09 18:11:01'),
	(52, 'Kavon Graham II', 'Rogahn', 'danika.shields', 'mallie.kuhn@example.com', '(650) 276-4262', 5, '9845 Stroman Passage Suite 021\nDessiefurt, KS 08013', 'user', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EgxfCOQaMfzqnnE6H4mIz4rlMaEFkaB2ob8pTmTGwt09oBdVFIUEvrhU5XpX', '2022-12-09 20:59:03', '2022-12-09 20:59:03'),
	(51, 'Quinten McGlynn', 'Runte', 'erdman.bart', 'parker.bella@example.net', '+14753905386', 2, '7725 Cartwright Freeway\nEast Keagan, IN 05954-7332', 'user', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wO8ohkjOAd', '2022-12-09 20:59:03', '2022-12-09 20:59:03'),
	(50, 'Emilie Nikolaus', 'Windler', 'zolson', 'bins.kyleigh@example.org', '843.429.6484', 8, '99261 Annamae Harbor Suite 136\nNew Malvinastad, IN 00408', 'user', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FqL00QwPmY', '2022-12-09 20:59:03', '2022-12-09 20:59:03'),
	(46, 'Opal Harvey', 'Feeney', 'karianne.bogisich', 'schroeder.kaycee@example.com', '+1.708.303.0971', 1, '7222 Tremblay Flats Suite 486\nNorth Janice, NJ 82457-5995', 'user', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kdyu1cMpFO8vbdHoRAXtO9lGiIRtSGeMc5suwhIqclE64uLlsM1sVrFGF0N7', '2022-12-09 20:59:03', '2022-12-09 20:59:03'),
	(47, 'Prof. Amya Hand', 'Hammes', 'langosh.sabina', 'vcarroll@example.org', '(224) 389-5689', 6, '4933 Kendrick Road Suite 818\nSouth Katelinhaven, MN 85950', 'user', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'k7zKcDd5NT', '2022-12-09 20:59:03', '2022-12-09 20:59:03'),
	(48, 'Cruz Schmeler', 'Williamson', 'considine.tierra', 'ankunding.reece@example.net', '716.534.9081', 2, '331 Borer View Apt. 525\nNorth Maudstad, IL 85139', 'user', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TGbhBM8Lbw', '2022-12-09 20:59:03', '2022-12-09 20:59:03'),
	(49, 'Kaleigh Collins', 'Upton', 'lela.adams', 'ford60@example.com', '304-640-8250', 9, '920 Beer Common\nNorth Rossie, CA 02560-0346', 'user', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ugX2tcEieY', '2022-12-09 20:59:03', '2022-12-09 20:59:03'),
	(45, 'Carmen Harris Sr.', 'Rogahn', 'christina.stokes', 'little.muhammad@example.net', '+1-586-422-0128', 7, '15030 Guadalupe Knoll\nSouth Cortez, GA 49166-2697', 'user', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yVqmbfCVvO', '2022-12-09 20:59:03', '2022-12-09 20:59:03'),
	(44, 'Lance Barrows', 'Paucek', 'josianne.wyman', 'ward80@example.net', '415-521-6383', 5, '127 Rogahn Common Apt. 894\nNew Corneliustown, VT 58123', 'user', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PzFeI7y2IN', '2022-12-09 20:59:03', '2022-12-09 20:59:03'),
	(32, 'Dr. Zachary Hessel', 'Herzog', 'heidenreich.raina', 'raleigh66@example.net', '+15416953282', 4, '8846 Jaylon Summit Suite 053\nBruenhaven, NE 92054', 'user', '2022-12-08 16:55:05', '$2y$10$y4ob57BIOW1UB5AIj6Uj5OcKCQwhKwJX4fR5XoDuNHqIeV.xUiHka', 'viUEojnPSi', '2022-12-08 16:55:06', '2022-12-08 16:55:06'),
	(43, 'Randal Collins MD', 'Friesen', 'cdickinson', 'crona.breanne@example.net', '678-951-2028', 9, '18392 Humberto Parkways\nHahnbury, ME 50721', 'user', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wURQCnyS4L', '2022-12-09 20:59:03', '2022-12-09 20:59:03'),
	(53, 'Rebecca Williamson', 'Wyman', 'kris.lehner', 'oconnell.perry@example.org', '1-267-870-4568', 3, '135 Conn Shores Apt. 708\nSouth Donny, OK 23079-7082', 'user', '2022-12-10 09:53:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qUn7epy1XU', '2022-12-10 09:53:18', '2022-12-10 09:53:18'),
	(54, 'Elfrieda Pouros', 'Leffler', 'jkessler', 'wiegand.paula@example.net', '469-937-8850', 4, '25753 Nolan Squares\nPort Mckenzie, AL 83670', 'user', '2022-12-10 09:53:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fHPaXO6yuE', '2022-12-10 09:53:18', '2022-12-10 09:53:18'),
	(55, 'Haven Monahan', 'Schneider', 'ida96', 'fkohler@example.org', '(573) 746-9811', 7, '3080 Macejkovic Walk\nWest Elliotview, VA 74251', 'user', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '17YEGVJFd6', '2022-12-10 09:53:18', '2022-12-10 09:53:18'),
	(56, 'Miguel Goyette III', 'Spinka', 'gloria67', 'connor.tremblay@example.com', '786-485-3361', 3, '1279 Abelardo Unions Apt. 330\nNorth Mariahbury, PA 20211', 'user', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Rd6Mf6mjhC', '2022-12-10 09:53:18', '2022-12-10 09:53:18'),
	(57, 'Ms. Gladyce Reinger MD', 'Koch', 'ivory44', 'sylvester24@example.net', '(680) 997-8692', 7, '4046 Hermann Crossroad\nPort Anthony, SD 65435-9591', 'user', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dZujh61uPj', '2022-12-10 09:53:18', '2022-12-10 09:53:18'),
	(58, 'Christop Gottlieb', 'Koch', 'rkuhic', 'blanda.sammie@example.org', '(903) 907-0526', 6, '44606 Crooks Hill Suite 563\nNoelberg, CO 01281', 'user', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4n1U9dlfHS', '2022-12-10 09:53:18', '2022-12-10 09:53:18'),
	(59, 'Alexie Sauer DVM', 'Mohr', 'karelle.runolfsdottir', 'west.tre@example.com', '+1.801.897.6674', 8, '45372 Josiane Shores Apt. 336\nBoehmton, MA 35251-9998', 'user', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lpabnnPMhG', '2022-12-10 09:53:18', '2022-12-10 09:53:18'),
	(60, 'Nichole Hauck', 'Rogahn', 'tod.fay', 'xpadberg@example.net', '+1-276-327-5588', 3, '429 Margarette Terrace\nWilliamsonville, DC 21095-5493', 'user', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lCaAQ6t6Fa', '2022-12-10 09:53:18', '2022-12-10 09:53:18'),
	(61, 'Antonietta Weber', 'Bartoletti', 'russel.rosa', 'tdouglas@example.org', '+1-442-643-5009', 3, '3307 Jarrod Mission\nRathfort, SC 56536-0231', 'user', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'c9sM9v22wn', '2022-12-10 09:53:18', '2022-12-10 09:53:18'),
	(62, 'Ena Daniel', 'Connelly', 'eula97', 'ava61@example.org', '234-643-4216', 4, '627 Lorine Wall\nDurganview, FL 40799-9092', 'user', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jTTcNMCdwh', '2022-12-10 09:53:18', '2022-12-10 09:53:18');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
