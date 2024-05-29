-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.3.2-MariaDB - mariadb.org binary distribution
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
) ENGINE=InnoDB AUTO_INCREMENT=16619 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 gompang.basket:~6 rows (대략적) 내보내기
DELETE FROM `basket`;
INSERT INTO `basket` (`bcode`, `username`, `pcode`, `amount`) VALUES
	(2, 'root', 11, 3),
	(3, 'root', 10, 2),
	(4, '1', 12, 1),
	(5, 'root', 23, 1),
	(16617, '1', 11, 2),
	(16618, 'root', 24, 1);

-- 테이블 gompang.filetest 구조 내보내기
CREATE TABLE IF NOT EXISTS `filetest` (
  `url` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 gompang.filetest:~7 rows (대략적) 내보내기
DELETE FROM `filetest`;
INSERT INTO `filetest` (`url`) VALUES
	('1'),
	('151'),
	('응 해봐.jpg'),
	('다크그레이.png'),
	('다크그레이.png'),
	('관리자 페이지.png'),
	('제목 없음.png');

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
  `odate` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`ocode`),
  KEY `FK_offer_members` (`username`),
  KEY `FK_offer_product` (`pcode`),
  CONSTRAINT `FK_offer_members` FOREIGN KEY (`username`) REFERENCES `members` (`membername`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_offer_product` FOREIGN KEY (`pcode`) REFERENCES `product` (`pcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 gompang.offer:~4 rows (대략적) 내보내기
DELETE FROM `offer`;
INSERT INTO `offer` (`ocode`, `username`, `pcode`, `amount`, `odate`) VALUES
	(15, 'root', 2, 5, '2023-12-28'),
	(16, 'root', 11, 2, '2024-01-19'),
	(17, 'root', 14, 1, '2023-08-30'),
	(18, 'root', 7, 3, '2024-05-25');

-- 테이블 gompang.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `pcode` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `img` varchar(50) NOT NULL DEFAULT 'm.jpg',
  `descript` text NOT NULL DEFAULT '설명없음',
  `regdate` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`pcode`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 gompang.product:~19 rows (대략적) 내보내기
DELETE FROM `product`;
INSERT INTO `product` (`pcode`, `pname`, `stock`, `price`, `img`, `descript`, `regdate`) VALUES
	(1, '제품', 0, 99990000, 'm.jpg', '사보던지 ㅋㅋ', '2024-04-28'),
	(2, '아이스 마카롱', 10, 18000, 'm1.jpg', '시원하고 달달하니\r\n맛있겠다...\r\n', '2024-04-28'),
	(3, '크리스피', 5, 12500, 'm2.jpg', '설명없음', '2024-05-25'),
	(4, '밤만쥬', 7, 15000, 'm3.jpg', '설명없음', '2024-05-27'),
	(5, '굿 모닝빵', 16, 4300, 'm4.jpg', '설명없음', '2024-05-25'),
	(6, '아이폰 15 Pro', 2, 1579700, 'm15.jpg', '설명없음', '2024-05-27'),
	(7, '우유 생크림빵', 12, 8700, 'm6.jpg', '설명없음', '2024-05-26'),
	(8, '안흥할매 쌀찐빵', 16, 9990, 'm7.jpg', '설명없음', '2024-05-26'),
	(9, '단호박 팥 미니호빵', 5, 13800, 'm8.jpg', '설명없음', '2024-05-26'),
	(10, '도넛 세트', 5, 22000, 'm9.jpg', '설명없음', '2024-05-28'),
	(11, 'Mini Fresh Donut', 11, 18900, 'm10.jpg', '설명없음', '2024-05-25'),
	(12, '초코 머핀', 19, 9000, 'm11.jpg', '설명없음', '2024-05-28'),
	(13, '치즈 케잌', 15, 17900, 'm12.jpg', '설명없음', '2024-05-28'),
	(14, '아이폰 14', 10, 728640, 'm13.jpg', '설명없음', '2024-05-28'),
	(15, '아이폰 15', 6, 1260000, 'm14.jpg', '설명없음', '2024-05-28'),
	(17, '빵', 11, 5900, 'm5.jpg', '설명없음', '2024-05-28'),
	(18, '제품 대기중', 0, 0, 'm.jpg', '설명없음', '2024-05-28'),
	(23, '응 해봐~', 1, 90000, '응 해봐.jpg', ' **하면 그만이야~', '2024-05-29'),
	(24, '늑대와 양', 1, 17999000, 'sheep_wolf.png', '하나뿐인 그림', '2024-05-30');

-- 테이블 gompang.review 구조 내보내기
CREATE TABLE IF NOT EXISTS `review` (
  `rcode` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL DEFAULT '',
  `pcode` int(11) NOT NULL,
  `commet` int(11) DEFAULT NULL,
  PRIMARY KEY (`rcode`),
  KEY `username` (`username`),
  KEY `pcode` (`pcode`),
  CONSTRAINT `FK_review_members` FOREIGN KEY (`username`) REFERENCES `members` (`membername`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_review_product` FOREIGN KEY (`pcode`) REFERENCES `product` (`pcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 gompang.review:~0 rows (대략적) 내보내기
DELETE FROM `review`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
