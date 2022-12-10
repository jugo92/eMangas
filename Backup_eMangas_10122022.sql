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

-- Listage de la structure de table emangas. users
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
  `role` enum('admin','user') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table emangas.users : 22 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `firstName`, `pseudo`, `phoneNumber`, `notes`, `adresse`, `role`) VALUES
	(1, 'Makan', 'm@m.fr', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2022-11-23 12:53:15', '2022-12-09 18:11:01', 'Kamissoko', 'mak', '0606060606', 0, 'Faubourg Saint-Antoine', 'admin'),
	(52, 'Kavon Graham II', 'mallie.kuhn@example.com', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EgxfCOQaMfzqnnE6H4mIz4rlMaEFkaB2ob8pTmTGwt09oBdVFIUEvrhU5XpX', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Rogahn', 'danika.shields', '(650) 276-4262', 5, '9845 Stroman Passage Suite 021\nDessiefurt, KS 08013', 'user'),
	(51, 'Quinten McGlynn', 'parker.bella@example.net', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wO8ohkjOAd', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Runte', 'erdman.bart', '+14753905386', 2, '7725 Cartwright Freeway\nEast Keagan, IN 05954-7332', 'user'),
	(50, 'Emilie Nikolaus', 'bins.kyleigh@example.org', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FqL00QwPmY', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Windler', 'zolson', '843.429.6484', 8, '99261 Annamae Harbor Suite 136\nNew Malvinastad, IN 00408', 'user'),
	(46, 'Opal Harvey', 'schroeder.kaycee@example.com', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kdyu1cMpFO8vbdHoRAXtO9lGiIRtSGeMc5suwhIqclE64uLlsM1sVrFGF0N7', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Feeney', 'karianne.bogisich', '+1.708.303.0971', 1, '7222 Tremblay Flats Suite 486\nNorth Janice, NJ 82457-5995', 'user'),
	(47, 'Prof. Amya Hand', 'vcarroll@example.org', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'k7zKcDd5NT', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Hammes', 'langosh.sabina', '(224) 389-5689', 6, '4933 Kendrick Road Suite 818\nSouth Katelinhaven, MN 85950', 'user'),
	(48, 'Cruz Schmeler', 'ankunding.reece@example.net', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TGbhBM8Lbw', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Williamson', 'considine.tierra', '716.534.9081', 2, '331 Borer View Apt. 525\nNorth Maudstad, IL 85139', 'user'),
	(49, 'Kaleigh Collins', 'ford60@example.com', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ugX2tcEieY', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Upton', 'lela.adams', '304-640-8250', 9, '920 Beer Common\nNorth Rossie, CA 02560-0346', 'user'),
	(45, 'Carmen Harris Sr.', 'little.muhammad@example.net', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yVqmbfCVvO', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Rogahn', 'christina.stokes', '+1-586-422-0128', 7, '15030 Guadalupe Knoll\nSouth Cortez, GA 49166-2697', 'user'),
	(44, 'Lance Barrows', 'ward80@example.net', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PzFeI7y2IN', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Paucek', 'josianne.wyman', '415-521-6383', 5, '127 Rogahn Common Apt. 894\nNew Corneliustown, VT 58123', 'user'),
	(32, 'Dr. Zachary Hessel', 'raleigh66@example.net', '2022-12-08 16:55:05', '$2y$10$y4ob57BIOW1UB5AIj6Uj5OcKCQwhKwJX4fR5XoDuNHqIeV.xUiHka', 'viUEojnPSi', '2022-12-08 16:55:06', '2022-12-08 16:55:06', 'Herzog', 'heidenreich.raina', '+15416953282', 4, '8846 Jaylon Summit Suite 053\nBruenhaven, NE 92054', 'user'),
	(43, 'Randal Collins MD', 'crona.breanne@example.net', '2022-12-09 20:59:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wURQCnyS4L', '2022-12-09 20:59:03', '2022-12-09 20:59:03', 'Friesen', 'cdickinson', '678-951-2028', 9, '18392 Humberto Parkways\nHahnbury, ME 50721', 'user'),
	(53, 'Rebecca Williamson', 'oconnell.perry@example.org', '2022-12-10 09:53:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qUn7epy1XU', '2022-12-10 09:53:18', '2022-12-10 09:53:18', 'Wyman', 'kris.lehner', '1-267-870-4568', 3, '135 Conn Shores Apt. 708\nSouth Donny, OK 23079-7082', 'user'),
	(54, 'Elfrieda Pouros', 'wiegand.paula@example.net', '2022-12-10 09:53:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fHPaXO6yuE', '2022-12-10 09:53:18', '2022-12-10 09:53:18', 'Leffler', 'jkessler', '469-937-8850', 4, '25753 Nolan Squares\nPort Mckenzie, AL 83670', 'user'),
	(55, 'Haven Monahan', 'fkohler@example.org', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '17YEGVJFd6', '2022-12-10 09:53:18', '2022-12-10 09:53:18', 'Schneider', 'ida96', '(573) 746-9811', 7, '3080 Macejkovic Walk\nWest Elliotview, VA 74251', 'user'),
	(56, 'Miguel Goyette III', 'connor.tremblay@example.com', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Rd6Mf6mjhC', '2022-12-10 09:53:18', '2022-12-10 09:53:18', 'Spinka', 'gloria67', '786-485-3361', 3, '1279 Abelardo Unions Apt. 330\nNorth Mariahbury, PA 20211', 'user'),
	(57, 'Ms. Gladyce Reinger MD', 'sylvester24@example.net', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'dZujh61uPj', '2022-12-10 09:53:18', '2022-12-10 09:53:18', 'Koch', 'ivory44', '(680) 997-8692', 7, '4046 Hermann Crossroad\nPort Anthony, SD 65435-9591', 'user'),
	(58, 'Christop Gottlieb', 'blanda.sammie@example.org', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4n1U9dlfHS', '2022-12-10 09:53:18', '2022-12-10 09:53:18', 'Koch', 'rkuhic', '(903) 907-0526', 6, '44606 Crooks Hill Suite 563\nNoelberg, CO 01281', 'user'),
	(59, 'Alexie Sauer DVM', 'west.tre@example.com', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lpabnnPMhG', '2022-12-10 09:53:18', '2022-12-10 09:53:18', 'Mohr', 'karelle.runolfsdottir', '+1.801.897.6674', 8, '45372 Josiane Shores Apt. 336\nBoehmton, MA 35251-9998', 'user'),
	(60, 'Nichole Hauck', 'xpadberg@example.net', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lCaAQ6t6Fa', '2022-12-10 09:53:18', '2022-12-10 09:53:18', 'Rogahn', 'tod.fay', '+1-276-327-5588', 3, '429 Margarette Terrace\nWilliamsonville, DC 21095-5493', 'user'),
	(61, 'Antonietta Weber', 'tdouglas@example.org', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'c9sM9v22wn', '2022-12-10 09:53:18', '2022-12-10 09:53:18', 'Bartoletti', 'russel.rosa', '+1-442-643-5009', 3, '3307 Jarrod Mission\nRathfort, SC 56536-0231', 'user'),
	(62, 'Ena Daniel', 'ava61@example.org', '2022-12-10 09:53:18', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jTTcNMCdwh', '2022-12-10 09:53:18', '2022-12-10 09:53:18', 'Connelly', 'eula97', '234-643-4216', 4, '627 Lorine Wall\nDurganview, FL 40799-9092', 'user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
