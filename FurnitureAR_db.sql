/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.27 : Database - furniture_ar
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `admins` */

CREATE TABLE `admins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `u_id` int(11) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admins` */

/*Table structure for table `brands` */

CREATE TABLE `brands` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brands` */

/*Table structure for table `customers` */

CREATE TABLE `customers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `u_id` int(11) unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `user_id_c` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customers` */

/*Table structure for table `order_details` */

CREATE TABLE `order_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `p_id` int(11) unsigned NOT NULL,
  `total_item` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `products_id` FOREIGN KEY (`p_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `order_details` */

/*Table structure for table `order_items` */

CREATE TABLE `order_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `o_id` int(11) unsigned NOT NULL,
  `p_id` int(11) unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `o_id` (`o_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `order_id_oi` FOREIGN KEY (`o_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `product_id_oi` FOREIGN KEY (`p_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `order_items` */

/*Table structure for table `orders` */

CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `c_id` int(11) unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `customer_id` FOREIGN KEY (`c_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orders` */

/*Table structure for table `payment_type` */

CREATE TABLE `payment_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payment_type` */

/*Table structure for table `payments` */

CREATE TABLE `payments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `o_id` int(11) unsigned NOT NULL,
  `pt_id` int(11) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `o_id` (`o_id`),
  KEY `pt_id` (`pt_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`o_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `payment_type_id` FOREIGN KEY (`pt_id`) REFERENCES `payment_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payments` */

/*Table structure for table `product_categories` */

CREATE TABLE `product_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product_categories` */

/*Table structure for table `product_categories_features` */

CREATE TABLE `product_categories_features` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pc_id` int(11) unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pc_id` (`pc_id`),
  CONSTRAINT `product_categorie_id` FOREIGN KEY (`pc_id`) REFERENCES `product_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product_categories_features` */

/*Table structure for table `product_features` */

CREATE TABLE `product_features` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `p_id` int(11) unsigned NOT NULL,
  `pcf_id` int(11) unsigned NOT NULL,
  `material` varchar(50) DEFAULT NULL,
  `warranty` varchar(255) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `width` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `p_id` (`p_id`),
  KEY `product_category_feature` (`pcf_id`),
  CONSTRAINT `product_category_feature_id` FOREIGN KEY (`pcf_id`) REFERENCES `product_categories_features` (`id`),
  CONSTRAINT `product_feature_id` FOREIGN KEY (`p_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product_features` */

/*Table structure for table `products` */

CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `b_id` int(11) unsigned NOT NULL,
  `pc_id` int(11) unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `quality` varchar(50) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `tax` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `3d_model` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `b_id` (`b_id`),
  KEY `product_category` (`pc_id`),
  CONSTRAINT `brand_id` FOREIGN KEY (`b_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `product_category` FOREIGN KEY (`pc_id`) REFERENCES `product_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `products` */

/*Table structure for table `shop` */

CREATE TABLE `shop` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `u_id` int(11) unsigned NOT NULL,
  `b_id` int(11) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `s_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `u_id` (`u_id`),
  KEY `b_id` (`b_id`),
  CONSTRAINT `user_id_s` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`),
  CONSTRAINT `brand_id_s` FOREIGN KEY (`b_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shop` */

/*Table structure for table `users` */

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
