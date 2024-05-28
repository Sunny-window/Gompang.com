-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.11.7-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- gompang 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `gompang` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `gompang`;

-- 테이블 gompang.basket 구조 내보내기
CREATE TABLE IF NOT EXISTS `basket` (
  `bcode` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `pcode` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`bcode`),
  KEY `FK_basket_members` (`username`),
  KEY `FK_basket_product` (`pcode`),
  CONSTRAINT `FK_basket_members` FOREIGN KEY (`username`) REFERENCES `members` (`membername`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_basket_product` FOREIGN KEY (`pcode`) REFERENCES `product` (`pcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 gompang.basket:~0 rows (대략적) 내보내기
DELETE FROM `basket`;

-- 테이블 gompang.members 구조 내보내기
CREATE TABLE IF NOT EXISTS `members` (
  `membername` varchar(16) NOT NULL,
  `pwd` varchar(12) NOT NULL,
  `role` varchar(6) NOT NULL DEFAULT 'user' COMMENT 'user or manager',
  PRIMARY KEY (`membername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 gompang.members:~3 rows (대략적) 내보내기
DELETE FROM `members`;
INSERT INTO `members` (`membername`, `pwd`, `role`) VALUES
	('1', '1', 'user'),
	('13', '13', 'user'),
	('root', '1', 'admin');

-- 테이블 gompang.offer 구조 내보내기
CREATE TABLE IF NOT EXISTS `offer` (
  `ocode` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `pcode` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ocode`),
  KEY `FK_offer_members` (`username`),
  KEY `FK_offer_product` (`pcode`),
  CONSTRAINT `FK_offer_members` FOREIGN KEY (`username`) REFERENCES `members` (`membername`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_offer_product` FOREIGN KEY (`pcode`) REFERENCES `product` (`pcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 gompang.offer:~0 rows (대략적) 내보내기
DELETE FROM `offer`;

-- 테이블 gompang.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `pcode` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `img` varchar(50) DEFAULT NULL,
  `descript` text NOT NULL DEFAULT '설명없음',
  PRIMARY KEY (`pcode`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 gompang.product:~17 rows (대략적) 내보내기
DELETE FROM `product`;
INSERT INTO `product` (`pcode`, `pname`, `stock`, `price`, `img`, `descript`) VALUES
	(1, '제품', 0, 99990000, NULL, '사려면 사보던지 ㅋ'),
	(2, '제품명1', 10, 18000, 'm1', '설명없음'),
	(3, '제품명2', 5, 12500, 'm2', '설명없음'),
	(4, '제품명3', 7, 15000, 'm3', '설명없음'),
	(5, '제품명4', 9, 4300, 'm4', '설명없음'),
	(6, '제품 대기중', 0, 0, NULL, '설명없음'),
	(7, '제품명6', 12, 8700, 'm6', '설명없음'),
	(8, '제품명7', 16, 9990, 'm7', '설명없음'),
	(9, '제품명8', 5, 13800, 'm8', '설명없음'),
	(10, '제품명9', 5, 22000, 'm9', '설명없음'),
	(11, '제품명10', 11, 18900, 'm10', '설명없음'),
	(12, '제품명11', 19, 9000, 'm11', '설명없음'),
	(13, '제품명12', 15, 17900, 'm12', '설명없음'),
	(14, '제품명13', 10, 728640, 'm13', '설명없음'),
	(15, '제품명14', 6, 1260000, 'm14', '설명없음'),
	(16, '제품명15', 2, 1579700, 'm15', '설명없음'),
	(17, '제품명5', 11, 5900, 'm5', '설명없음');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
