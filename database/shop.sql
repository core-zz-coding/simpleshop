-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.17 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for shoping
CREATE DATABASE IF NOT EXISTS `shoping` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shoping`;


-- Dumping structure for table shoping.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `img` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table shoping.category: ~5 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `name`, `description`, `img`, `is_active`, `created_at`, `modified_at`) VALUES
	(1, 'Shoes', 'Men\'s shoes', NULL, 1, '2014-06-20 11:44:00', NULL),
	(2, 'Glasses', 'Men\'s Glass', NULL, 1, '2014-06-20 11:43:00', NULL),
	(3, 'Pants', 'Men\'s Pants', NULL, 1, '2014-06-20 11:43:00', NULL),
	(4, 'Watches', 'Men\'s Watches', NULL, 1, '2014-06-20 11:53:00', NULL),
	(5, 'Apparel', 'Men\'s Apparel', NULL, 1, '2014-06-20 11:44:00', NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


-- Dumping structure for table shoping.order
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table shoping.order: ~0 rows (approximately)
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;


-- Dumping structure for table shoping.order_item
CREATE TABLE IF NOT EXISTS `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(12,4) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order_item_Order` (`order_id`),
  CONSTRAINT `FK_order_item_Order` FOREIGN KEY (`order_id`) REFERENCES `Order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table shoping.order_item: ~0 rows (approximately)
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;


-- Dumping structure for table shoping.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(12,4) NOT NULL,
  `description` text NOT NULL,
  `short_description` tinytext NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `FK_products_category` (`category_id`),
  CONSTRAINT `FK_products_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Dumping data for table shoping.products: ~20 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `sku`, `name`, `price`, `description`, `short_description`, `img`, `is_active`, `created_at`, `modified_at`, `category_id`) VALUES
	(4, '8Dqw6HrvDPOCT', 'Black Shoe', 2.9900, 'Black leather shoe', 'This is just a short description', NULL, 1, '2014-07-18 11:47:17', NULL, 1),
	(5, 'IPHxe34zh7mqh', 'Reyban Glass', 20.0000, 'reyban glasses', 'This is just a short description', NULL, 1, '2014-07-18 11:47:17', NULL, 2),
	(6, 'e89CzVdFu36aX', 'Black Pants', 20.0000, 'Black pants', 'This is just a short description', NULL, 1, '2014-07-18 11:47:17', NULL, 3),
	(7, 'w47BjwoUJgojG', 'Sunto', 20.0000, 'Watch', 'Great watch', NULL, 1, '2014-07-18 11:47:17', NULL, 4),
	(8, 'Ak8QJlMP0dZWv', 'Red T-shit', 20.0000, 'This is a great red shirt', 'A shirt made of smallest fibers', NULL, 1, '2014-07-18 11:47:17', NULL, 5),
	(9, 'bdUc5CQUD85zB', 'Yellow Pants', 500.0000, 'Yellow leather pants', 'Ugly leather pants', NULL, 1, '2014-07-18 11:47:17', NULL, 3),
	(10, 'EFNohSp4kFrCS', 'Cassio', 19.0000, 'Yellow leather pants', 'Ugly leather pants', NULL, 1, '2014-07-18 11:47:17', NULL, 3),
	(11, 'Lt8eGjs4hc7bx', 'D&G Glass', 200.0000, 'D&G glasses', 'A nice D&G glasses', NULL, 1, '2014-07-18 11:47:17', NULL, 2),
	(12, 'Mg4T0HKrCRNLX', 'Blue T-shirt', 110.0000, 'Blue t-shirt', 'Blue t-shirt', NULL, 1, '2014-07-18 11:47:17', NULL, 5),
	(13, '9aAT82uFqduWh', 'Green T-shirt', 222.0000, 'Green t-shirt', 'Green t-shirt', NULL, 1, '2014-07-18 11:47:17', NULL, 5),
	(14, 'Yxiq7eZGSCGI5', 'Green pants', 500.0000, 'Green leather pants', 'Ugly leather pants that are green', NULL, 1, '2014-07-18 11:47:17', NULL, 3),
	(15, '7S7beVAtuDilS', 'Green Shoe', 2.9900, 'Green leather shoes', 'This is just a short description of green leather shoes', NULL, 1, '2014-07-18 11:47:17', NULL, 1),
	(18, 'Ft0g2hqm6dqiJ', 'Blue Shoe', 30.0000, 'Blue leather shoes', 'This is just a short description of green leather shoes', NULL, 1, '2014-07-18 11:47:17', NULL, 1),
	(19, 'Ti3eKcWO2nF9z', 'Armani Glass', 20.0000, 'Armaniglasses', 'This is just a short description', NULL, 1, '2014-07-18 11:47:17', NULL, 2),
	(20, '7uHCnPclXyMkL', 'Lime Shoe', 30.0000, 'Lime shoes', 'This is just a short description of green leather shoes', NULL, 1, '2014-07-18 11:47:17', NULL, 1),
	(21, 'BHb0wDQu8odhi', 'Bennetton Glass', 20.0000, 'Bennetton glass', 'This is just a short description', NULL, 1, '2014-07-18 11:47:17', NULL, 2),
	(22, 'Cf1lwM7lIGMvl', 'Purple-T-Shirtz', 222.0000, 'Purple t-shirt', 'Purple t-shirt', NULL, 1, '2014-07-18 11:47:17', NULL, 5),
	(23, 'CT0dGEsvYOh3E', 'Purple Pants', 222.0000, 'Purple pants', 'Purple pants', NULL, 1, '2014-07-18 11:47:17', NULL, 3),
	(25, 'N6PH57nzHXD1f', 'Apple Watch', 222.0000, 'Apple Watch', 'Apple Watch', NULL, 1, '2014-07-18 11:47:17', NULL, 4),
	(26, 'vT3PwI3U51rvo', 'HP watch', 222.0000, 'Hp Watch', 'Hp Watch', NULL, 1, '2014-07-18 11:47:17', NULL, 4);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
