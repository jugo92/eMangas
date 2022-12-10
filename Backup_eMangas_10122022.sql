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
  `price` double NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `inventory` int(11) NOT NULL,
  `nbSales` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_announces_users` (`idUser`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.announces : 16 rows
/*!40000 ALTER TABLE `announces` DISABLE KEYS */;
REPLACE INTO `announces` (`id`, `idUser`, `idCategorie`, `description`, `price`, `title`, `inventory`, `nbSales`, `created_at`, `updated_at`) VALUES
	(1, 1, '1', 'blablabla 30 fois', 5.43, 'my announce', 254, 0, '2022-12-06 18:38:29', '2022-12-07 17:40:14'),
	(2, 1, '1', 'Encore du blabla', 12, 'Annonce 2', 2, 0, '2022-12-06 19:03:28', '2022-12-06 19:03:28'),
	(29, 37, '3', 'a', 1, 'a', 1, 0, '2022-12-09 18:55:01', '2022-12-09 18:55:01'),
	(7, 1, '3', 'Lorem Ipsum Dolor Blabla Sit Amet', 223, 'Annonce en création', 4, 0, '2022-12-06 20:54:12', '2022-12-06 21:18:43'),
	(12, 1, '1', 'une description', 100, 'Une nouvelle annonce', 100, 0, '2022-12-07 18:08:17', '2022-12-07 18:08:17'),
	(16, 1, '1', 'blabla', 123, 'blabla', 321, 0, '2022-12-07 18:40:00', '2022-12-07 18:40:00'),
	(17, 1, '1', 'blabla', 123, 'blabla', 321, 0, '2022-12-07 18:55:19', '2022-12-07 18:55:19'),
	(18, 1, '1', 'il sert à insérer auto une donnée dans la table de liaison', 101, 'belongsToMany', 101, 0, '2022-12-07 18:56:25', '2022-12-07 18:56:25'),
	(19, 1, '1', 'test', 602, 'test', 620, 0, '2022-12-07 18:58:39', '2022-12-07 18:58:39'),
	(21, 1, '1,3', ';o;o;o', 1414, ':iio', 141, 0, '2022-12-08 19:02:12', '2022-12-08 19:02:12'),
	(22, 1, '1,3', ';o;o;o', 1414, ':iio', 141, 0, '2022-12-08 19:05:13', '2022-12-08 19:05:13'),
	(23, 1, '1,3', ';o;o;o', 1414, ':iio', 141, 0, '2022-12-08 19:06:04', '2022-12-08 19:06:04'),
	(24, 1, '1,3', 'my desc', 21, 'my title', 15, 0, '2022-12-08 19:07:26', '2022-12-08 19:07:26'),
	(25, 1, '3', 'desc my', 62, 'title my', 55, 0, '2022-12-08 19:07:50', '2022-12-08 19:07:50'),
	(30, 36, '1,3', 'Tueur en série', 12, 'Dahmer', 12, 0, '2022-12-09 19:32:57', '2022-12-09 19:32:57'),
	(34, 1, '3', 'azazaz', 58, 'azaz', 58, 0, '2022-12-09 20:36:39', '2022-12-09 20:39:17');
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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.announce_categorie : 5 rows
/*!40000 ALTER TABLE `announce_categorie` DISABLE KEYS */;
REPLACE INTO `announce_categorie` (`id`, `announce_id`, `categorie_id`, `created_at`, `updated_at`) VALUES
	(1, 17, 1, NULL, NULL),
	(2, 18, 1, NULL, NULL),
	(3, 23, 1, NULL, NULL),
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
REPLACE INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.migrations : 11 rows
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
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
	(26, '2022_12_08_180857_change_role_in_string_table', 5);
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

-- Listage de la structure de table emangas. payments
DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idAnnounce` int(11) NOT NULL,
  `idCustomer` int(11) NOT NULL,
  `date` date NOT NULL,
  `price` double NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.payments : 0 rows
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;

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

-- Listage de la structure de table emangas. users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pseudo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` double NOT NULL,
  `adresse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.users : 12 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `firstName`, `pseudo`, `phoneNumber`, `notes`, `adresse`, `role`) VALUES
	(1, 'Makan', 'makan.kamissoko@hotmail.fr', NULL, '$2y$10$y4ob57BIOW1UB5AIj6Uj5OcKCQwhKwJX4fR5XoDuNHqIeV.xUiHka', NULL, '2022-11-23 12:53:15', '2022-12-09 18:11:01', '', '', '', 0, '', 'admin'),
	(52, 'Kavon Graham II', 'mallie.kuhn@example.com', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ZXW0ix2Rnb', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Rogahn', 'danika.shields', '(650) 276-4262', 5, '9845 Stroman Passage Suite 021\nDessiefurt, KS 08013', 'user'),
	(51, 'Quinten McGlynn', 'parker.bella@example.net', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wO8ohkjOAd', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Runte', 'erdman.bart', '+14753905386', 2, '7725 Cartwright Freeway\nEast Keagan, IN 05954-7332', 'user'),
	(50, 'Emilie Nikolaus', 'bins.kyleigh@example.org', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FqL00QwPmY', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Windler', 'zolson', '843.429.6484', 8, '99261 Annamae Harbor Suite 136\nNew Malvinastad, IN 00408', 'user'),
	(46, 'Opal Harvey', 'schroeder.kaycee@example.com', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'uRRQceAbRx', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Feeney', 'karianne.bogisich', '+1.708.303.0971', 1, '7222 Tremblay Flats Suite 486\nNorth Janice, NJ 82457-5995', 'user'),
	(47, 'Prof. Amya Hand', 'vcarroll@example.org', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'k7zKcDd5NT', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Hammes', 'langosh.sabina', '(224) 389-5689', 6, '4933 Kendrick Road Suite 818\nSouth Katelinhaven, MN 85950', 'user'),
	(48, 'Cruz Schmeler', 'ankunding.reece@example.net', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TGbhBM8Lbw', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Williamson', 'considine.tierra', '716.534.9081', 2, '331 Borer View Apt. 525\nNorth Maudstad, IL 85139', 'user'),
	(49, 'Kaleigh Collins', 'ford60@example.com', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ugX2tcEieY', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Upton', 'lela.adams', '304-640-8250', 9, '920 Beer Common\nNorth Rossie, CA 02560-0346', 'user'),
	(45, 'Carmen Harris Sr.', 'little.muhammad@example.net', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yVqmbfCVvO', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Rogahn', 'christina.stokes', '+1-586-422-0128', 7, '15030 Guadalupe Knoll\nSouth Cortez, GA 49166-2697', 'user'),
	(44, 'Lance Barrows', 'ward80@example.net', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PzFeI7y2IN', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Paucek', 'josianne.wyman', '415-521-6383', 5, '127 Rogahn Common Apt. 894\nNew Corneliustown, VT 58123', 'user'),
	(32, 'Dr. Zachary Hessel', 'raleigh66@example.net', '2022-12-08 16:55:05', '$2y$10$y4ob57BIOW1UB5AIj6Uj5OcKCQwhKwJX4fR5XoDuNHqIeV.xUiHka', 'viUEojnPSi', '2022-12-08 16:55:06', '2022-12-08 16:55:06', 'Herzog', 'heidenreich.raina', '+15416953282', 4, '8846 Jaylon Summit Suite 053\nBruenhaven, NE 92054', 'user'),
	(43, 'Randal Collins MD', 'crona.breanne@example.net', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wURQCnyS4L', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Friesen', 'cdickinson', '678-951-2028', 9, '18392 Humberto Parkways\nHahnbury, ME 50721', 'user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
