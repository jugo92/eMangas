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

-- Listage de la structure de table emangas. announces
DROP TABLE IF EXISTS `announces`;
CREATE TABLE IF NOT EXISTS `announces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idCategorie` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `inventory` int(11) NOT NULL,
  `nbSales` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.announces : 5 rows
/*!40000 ALTER TABLE `announces` DISABLE KEYS */;
REPLACE INTO `announces` (`id`, `idUser`, `idCategorie`, `description`, `price`, `title`, `inventory`, `nbSales`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'blablabla', 5.43, 'my announce', 254, 0, '2022-12-06 18:38:29', '2022-12-06 18:38:29'),
	(2, 1, 1, 'Encore du blabla', 12, 'Annonce 2', 2, 0, '2022-12-06 19:03:28', '2022-12-06 19:03:28'),
	(3, 1, 1, 'toujours du blabla qui coute', 5, 'annonce 3', 1, 0, '2022-12-06 20:07:44', '2022-12-06 20:07:44'),
	(6, 1, 1, 'Lorem Ipsum Blabla Lorem Ipsum BlablaLorem Ipsum Blabla', 23, 'Nouvelle annonce', 1, 0, '2022-12-06 20:32:45', '2022-12-06 20:32:45'),
	(7, 1, 1, 'Lorem Ipsum Dolor Blabla Sit Amet', 223, 'Annonce en création', 4, 0, '2022-12-06 20:54:12', '2022-12-06 21:18:43');
/*!40000 ALTER TABLE `announces` ENABLE KEYS */;

-- Listage de la structure de table emangas. categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.categories : 0 rows
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Listage de la structure de table emangas. categorie_announces
DROP TABLE IF EXISTS `categorie_announces`;
CREATE TABLE IF NOT EXISTS `categorie_announces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idAnnounce` int(11) NOT NULL,
  `idCategorie` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.categorie_announces : 0 rows
/*!40000 ALTER TABLE `categorie_announces` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorie_announces` ENABLE KEYS */;

-- Listage de la structure de table emangas. migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.migrations : 9 rows
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
	(24, '2022_11_23_143128_create_categorieannounces_table', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
