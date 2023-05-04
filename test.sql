-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.11.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for travel
CREATE DATABASE IF NOT EXISTS `travel` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `travel`;

-- Dumping structure for table travel.bookings
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` varchar(36) NOT NULL,
  `createdOnDate` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `createdByUserId` varchar(255) DEFAULT NULL,
  `lastModifiedOnDate` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `lastModifiedByUserId` varchar(255) DEFAULT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  `userId` varchar(255) NOT NULL,
  `hotelId` varchar(255) NOT NULL,
  `chooseDate` varchar(255) NOT NULL,
  `depTime` varchar(255) NOT NULL,
  `person` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_38a69a58a323647f2e75eb994de` (`userId`),
  KEY `FK_6713f297621b99988068dd63fe5` (`hotelId`),
  CONSTRAINT `FK_38a69a58a323647f2e75eb994de` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_6713f297621b99988068dd63fe5` FOREIGN KEY (`hotelId`) REFERENCES `hotels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table travel.bookings: ~0 rows (approximately)
DELETE FROM `bookings`;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` (`id`, `createdOnDate`, `createdByUserId`, `lastModifiedOnDate`, `lastModifiedByUserId`, `deletedAt`, `userId`, `hotelId`, `chooseDate`, `depTime`, `person`, `name`, `number`, `email`) VALUES
	('541344c1-c09b-4cfc-80b8-48a0c275e0ef', '2023-05-02 14:31:33.190623', NULL, '2023-05-02 14:31:33.190623', NULL, NULL, '1', '5ee2a117-3f21-4369-ae76-e49ef1f153cb', '2023-05-05 – 24:00', '2023-05-05 – 24:00', '1', 'thi', '09153139654', 'qtthien@gmail.com');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;

-- Dumping structure for table travel.favorites
CREATE TABLE IF NOT EXISTS `favorites` (
  `id` varchar(36) NOT NULL,
  `createdOnDate` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `createdByUserId` varchar(255) DEFAULT NULL,
  `lastModifiedOnDate` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `lastModifiedByUserId` varchar(255) DEFAULT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  `userId` varchar(255) NOT NULL,
  `hotelId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d6b8cee0555ebb446ee6484a40d` (`hotelId`),
  KEY `FK_e747534006c6e3c2f09939da60f` (`userId`),
  CONSTRAINT `FK_d6b8cee0555ebb446ee6484a40d` FOREIGN KEY (`hotelId`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_e747534006c6e3c2f09939da60f` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table travel.favorites: ~2 rows (approximately)
DELETE FROM `favorites`;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` (`id`, `createdOnDate`, `createdByUserId`, `lastModifiedOnDate`, `lastModifiedByUserId`, `deletedAt`, `userId`, `hotelId`) VALUES
	('829aa66e-edfa-4f02-a278-824191b3cfbf', '2023-05-03 10:33:38.843339', NULL, '2023-05-03 10:33:38.843339', NULL, NULL, '1', '1f684dfa-18ec-4cc4-b962-f8b96461a9e4'),
	('bd153d9a-ef96-42b1-9082-1b40f2dc0236', '2023-05-03 10:37:08.906583', NULL, '2023-05-03 10:37:08.906583', NULL, NULL, '1', '1b09a5c0-99b5-4416-9fa6-ba27727fdad6');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;

-- Dumping structure for table travel.hotels
CREATE TABLE IF NOT EXISTS `hotels` (
  `id` varchar(36) NOT NULL,
  `createdOnDate` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `createdByUserId` varchar(255) DEFAULT NULL,
  `lastModifiedOnDate` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `lastModifiedByUserId` varchar(255) DEFAULT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `decs` text NOT NULL,
  `type` enum('hotel','homestay') NOT NULL DEFAULT 'hotel',
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `provinceId` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `roomAvailable` int(11) NOT NULL DEFAULT 5,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9e3ecdb1b507c6d117b4d7fec85` (`provinceId`),
  CONSTRAINT `FK_9e3ecdb1b507c6d117b4d7fec85` FOREIGN KEY (`provinceId`) REFERENCES `provinces` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table travel.hotels: ~56 rows (approximately)
DELETE FROM `hotels`;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` (`id`, `createdOnDate`, `createdByUserId`, `lastModifiedOnDate`, `lastModifiedByUserId`, `deletedAt`, `name`, `decs`, `type`, `price`, `image`, `provinceId`, `latitude`, `longitude`, `roomAvailable`, `location`) VALUES
	('1b09a5c0-99b5-4416-9fa6-ba27727fdad6', '2023-04-19 22:31:02.173222', NULL, '2023-05-02 10:26:12.936737', NULL, NULL, 'Hostel-John Cafe and Beer', 'Giuong Tang Trong Phong Ngu Tap The Cho Nam Va Nu 1 giuong trong phong tap the 1 giuong don Chi con 3 giuong voi gia nay tren trang cua chung toi', 'homestay', 350000, 'https://cf.bstatic.com/xdata/images/hotel/square600/434111876.webp?k=e86f1e635b5f1e0c3fbd735f7433c5921bed36f512d206152e4af54508adc15f&o=&s=1', '4', '11.92380692684046', '108.44338133757321', 5, 'Da Lat, Lam Dong'),
	('1f684dfa-18ec-4cc4-b962-f8b96461a9e4', '2023-04-19 22:31:02.165018', NULL, '2023-05-02 10:26:36.728399', NULL, NULL, 'HANZ Bao Hoang HotelMo trong cua so moi', 'Phong ngu Tap the 8 Giuong cho ca Nam va Nu 1 phong tap the 2 giuong', 'homestay', 800000, 'https://cf.bstatic.com/xdata/images/hotel/square600/429102953.webp?k=ca61bc55199d7f4dce92c4b7617947eb843c28583d52ff13d636f9decb2518ca&o=&s=1', '4', '11.9375309', '108.4335975', 5, 'Duong Ba Trieu 30, Da Lat, Lam Dong'),
	('206d4e52-409b-4cb6-a05d-f020992b260e', '2023-04-19 22:29:55.203974', NULL, '2023-05-02 10:27:01.102233', NULL, NULL, 'Mc Teddy\'s HomestayMo trong cua so moi', 'Phong Superior Giuong Doi 1 giuong doi lon', 'hotel', 350000, 'https://cf.bstatic.com/xdata/images/hotel/square600/434111876.webp?k=e86f1e635b5f1e0c3fbd735f7433c5921bed36f512d206152e4af54508adc15f&o=&s=1', '3', '10.1928138', '103.9647053', 5, 'Duong Tran Hung Dao 118, Phu Quoc, Kien Giang'),
	('23ebccf8-814c-4621-a915-bbd625e38030', '2023-05-01 22:46:16.432387', NULL, '2023-05-02 10:27:19.830027', NULL, NULL, 'Melia Vinpearl Hue', 'Phu Nhuan', 'hotel', 2300000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20017508-54aefb48af86d0fe31dda06d56dcca19.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '9', '16.4637377', '107.59433919999992', 5, 'Duong Hung Vuong 50, Hue, Thua Thien Hue'),
	('240bd1db-69bb-4aa9-889d-4fe03136e454', '2023-05-01 22:46:16.428577', NULL, '2023-05-02 10:27:47.243196', NULL, NULL, 'The Sunriver Boutique Hotel Hue', 'Phu Hoi', 'hotel', 830000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20015989-bae63db741aad9cdfa68c7184f35677d.png?tr=q-40,w-300,h-300&_src=imagekit', '9', '16.4686867', '107.59377040000004', 5, 'Duong Doi Cung 17, Hue, Thua Thien Hue'),
	('295e39be-7fb5-435e-88b5-5d0a832a6878', '2023-04-19 22:31:02.158175', NULL, '2023-05-02 10:39:58.306563', NULL, NULL, 'Maka Premium Central Apartment', 'Can Ho 5 giuong (3 giuong doi, 1 giuong sofa, 1 giuong doi lon)', 'hotel', 1617000, 'https://cf.bstatic.com/xdata/images/hotel/square600/446885565.webp?k=ac32db01d00af5b7865a62f56f7fcf10583a7ea862689f31d0314627e36da539&o=&s=1', '4', '11.9404996', '108.43505040000002', 5, 'Khai Duy, 8/1, Nam Ky Khoi Nghia, Phuong 1, Da Lat, Lam Dong'),
	('2bb52b0b-260b-42b1-87de-d8132b6fc44d', '2023-05-01 22:45:35.112079', NULL, '2023-05-02 10:40:51.076672', NULL, NULL, 'Citadines Pearl Hoi An', 'Cam An', 'hotel', 550000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20018720-a16ac5aa078e94b1c40f2e9334b6e11c.png?tr=q-40,w-300,h-300&_src=imagekit', '8', '15.9187961', '108.33043169999996', 5, 'Vo Nguyen Giap, Ha My Dong A, Hoi An, Dien Ban, Quang Nam'),
	('305f64b0-a474-46ec-94cd-73115849476c', '2023-05-01 22:45:35.130480', NULL, '2023-05-02 10:51:04.462267', NULL, NULL, 'Hoi An Coco River', 'Cam Thanh', 'homestay', 843000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10023565-f6dd4d5d53e95978038daaefcda1adc8.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '8', '15.869854', '108.3695', 5, 'Cam Thanh, Hoi An, Quang Nam'),
	('354233a7-dd77-427c-a133-45d47305a5e2', '2023-04-19 22:28:52.253691', NULL, '2023-05-02 11:04:49.307602', NULL, NULL, 'Marilyn Boutique Hotel Nha Trang', 'Sunset Studio with Sofa & Mountain View, 01 King Bed 1 studio nguyen can • 1 phong tam • 27m² 2 giuong (1 giuong sofa, 1 giuong doi lon) Chi con 2 can voi gia nay tren trang cua chung toi', 'homestay', 388000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20017982-9c720a2352d76ea36431d4047acc9fff.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '1', '12.276516373841853', '109.2019647741705', 5, 'V3, Dang Tat, Vinh Tho, Nha Trang, Khanh Hoa'),
	('37515b91-1864-46b3-932a-e5edcce325ea', '2023-05-01 22:46:46.177239', NULL, '2023-05-02 11:05:31.284061', NULL, NULL, 'DeLaSol Phat Linh Sapa', 'Trung tam Sapa', 'hotel', 420000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10025991-c0b160f06ab0e2783607bb3b30107f4f.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '10', '22.332449', '103.843619', 5, 'Cau May, Muong Hoa, Sa Pa Ward, Sa Pa, Lao Cai'),
	('3ca138ab-f760-4930-828f-be15bfb6dd94', '2023-04-19 22:32:09.887982', NULL, '2023-05-02 11:10:16.260223', NULL, NULL, 'Dreamy Sky - Airport View Boutique HotelMo trong cua so moi', 'Du lich Ben vung Cap 3 Toa lac tai thanh pho Da Nang, Dreamy Sky - Airport View Boutique Hotel cung cap cho nghi 2 sao voi sanh khach chung va san hien.', 'homestay', 627300, 'https://cf.bstatic.com/xdata/images/hotel/square200/287609949.webp?k=4eae84ad269bf194215b9d1f53bc5b4e9f7129a11048b3948a5bbe272ea31cf9&o=&s=1', '5', '16.067114', '108.243759', 5, 'Dreamy House, k30/3, Kiet 35 Duong Dinh Nghe, Phuong Phuoc My, Son Tra, Da Nang'),
	('407a6b81-caa9-494c-a9b5-a92b748eb4cf', '2023-05-01 22:44:59.507129', NULL, '2023-05-02 11:11:04.145243', NULL, NULL, 'Hanoi De Maison Grand', 'Hang Bong', 'homestay', 400000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10030146-7b73df32d42f8afd54bc6a98fadaaa50.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '7', '21.02987449999999', '105.8461444', 5, 'Khach San Hanoi Gratitude, Hang Bong Street, Phuong Hang Bong, Hoan Kiem District, Hanoi'),
	('4811d359-fcee-4f95-acaf-6adf619b9736', '2023-05-01 22:46:46.192539', NULL, '2023-05-02 11:12:02.274494', NULL, NULL, 'Nomadtrails Boutique', 'Thuan Kieu', 'homestay', 842300, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20007994-80d4f6f760fa59796cf90260c3b76d59.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '10', '22.333392', '103.84148060000007', 5, 'Hung\'s Organic farm, Pho Dong Loi, Sa Pa, Sa Pa, Lao Cai'),
	('49073731-3e2d-4620-ae7d-f92c19259b40', '2023-05-01 22:44:59.488214', NULL, '2023-05-02 11:12:51.972344', NULL, NULL, 'Ha Noi Le Grand Hotel', 'Bach Dang', 'hotel', 1000000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20061391-326893946a4dfa8dbc7b7773b17503cb.png?tr=q-40,w-300,h-300&_src=imagekit', '7', '21.0118758', '105.8653857', 5, 'Dam Trau, Bach Dang, Phuong Bach Dang, Hai Ba Trung District, Hanoi'),
	('49ea3636-a160-4286-b0e0-bc08556003ae', '2023-05-01 22:46:46.195823', NULL, '2023-05-02 11:14:54.983306', NULL, NULL, 'Sapa Grand Hills', 'Phu Thanh', 'homestay', 842300, 'https://ik.imagekit.io/tvlk/apr-asset/Ixf4aptF5N2Qdfmh4fGGYhTN274kJXuNMkUAzpL5HuD9jzSxIGG5kZNhhHY-p7nw/hotel/asset/67834545-4bc6c350450988bec5a022c9e2161d53.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '10', '22.3302207', '103.8457891', 5, 'Family Restaurant - Coffee Fast Food, 043, Muong Hoa, Sa Pa, Sa Pa, Lao Cai'),
	('4e6c6f2d-b6de-4fbd-8dad-2a30f6d4e3e3', '2023-04-19 22:31:32.566093', NULL, '2023-05-02 11:17:44.966839', NULL, NULL, 'Central Hotel by Joi HospitalityMo trong cua so moi', 'Du lich Ben vung Cap 3 Phong Tieu Chuan Giuong Doi 1 giuong doi lon Chi con 3 phong voi gia nay tren trang cua chung toi', 'homestay', 197000, 'https://cf.bstatic.com/xdata/images/hotel/square600/365220799.webp?k=a8b6a1b2929c092ce3ad101e5cf5d8b136f4a706a3f96ba6f90d7a92ec884536&o=&s=1', '2', '10.3376294', '107.08985370000005', 5, 'Da Tuong, Khu pho 1, Thang Tam, Vung Tau, Ba Ria - Vung Tau'),
	('53c043dd-48c9-40ef-92b8-d5e9d4a3021d', '2023-05-01 22:45:35.116755', NULL, '2023-05-02 11:18:38.231948', NULL, NULL, 'The Nam An Villa Hoi An', 'Cam Chau', 'hotel', 900000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20023732-0b1582ccdea3f97d2cdb06af40896191.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '8', '15.890238', '108.33031499999993', 5, 'Duong Hai Thuong Lan Ong, Tan An, Hoi An, Quang Nam'),
	('5ee2a117-3f21-4369-ae76-e49ef1f153cb', '2023-04-19 22:27:26.402338', NULL, '2023-05-02 11:20:02.787150', NULL, NULL, 'Luxury Condo Nha Trang by SEAGROUP', 'With city views, Luxury Condo Nha Trang by SEAGROUP is set in Nha Trang and has a restaurant, room service, bar, garden, year-round outdoor pool and terrace.', 'hotel', 1592500, 'https://cf.bstatic.com/xdata/images/hotel/square600/447454635.webp?k=1c5a99ff51da80b76824e2a292e13546cb0f20649c9bd060db2d83d251974012&o=&s=1', '1', '12.294772576188269', '109.22821998596191', 5, 'Pham Van Dong, Vinh Hoa, Nha Trang, Khanh Hoa'),
	('5fe69de4-ea40-4096-8521-37e1a55d6888', '2023-05-01 22:45:35.125466', NULL, '2023-05-02 11:20:37.456206', NULL, NULL, 'Mulberry Collection Silk Village', 'Tan Thanh', 'homestay', 423000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10022965-9229222373a542a1062ace512d3b3aae.png?tr=q-40,w-300,h-300&_src=imagekit', '8', '15.8893976', '108.320452', 5, 'Pham Van Dong, Tan An, Hoi An, Quang Nam'),
	('7155483f-7c31-40ae-906e-e382dd2f922c', '2023-05-01 22:45:35.134432', NULL, '2023-05-02 11:22:19.353090', NULL, NULL, 'La An Central Boutique', 'Minh An', 'homestay', 230000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20021649-ea6fc56acbb6954a34c85fdc22cccc78.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '8', '15.8746651', '108.32795490000001', 5, '18, Ngo Quyen, An Hoi, Minh An, Hoi An, Quang Nam'),
	('77e2b499-e536-45ba-9dab-b899bac60502', '2023-05-01 22:46:16.445438', NULL, '2023-05-02 11:22:21.379503', NULL, NULL, 'Valentino Homestay', 'Phu Hoi', 'homestay', 420000, 'https://ik.imagekit.io/tvlk/apr-asset/Ixf4aptF5N2Qdfmh4fGGYhTN274kJXuNMkUAzpL5HuD9jzSxIGG5kZNhhHY-p7nw/hotel/asset/67837975-fc3faba16effa1b51d711a5ca1d49a40.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '9', '16.4699039', '107.5983663', 5, '64, Kiet 3 Nguyen Cong Tru, Phuong Phu Hoi, Hue, Thua Thien Hue'),
	('793a9a86-f9a2-425b-9181-9fe41bf9fec7', '2023-05-01 22:44:59.518875', NULL, '2023-05-02 11:23:24.486820', NULL, NULL, 'Hanoi Gatsby', 'Hang Gai', 'homestay', 650000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20022515-e4102970457492494b5919ace14b59e2.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '7', '21.032742', '105.84776699999998', 5, 'Pho Hang Thiec, Phuong Hang Gai, Hoan Kiem District, Hanoi'),
	('7d61db3b-0d20-43bf-b91a-30e44a8e91cc', '2023-04-19 22:31:32.579166', NULL, '2023-05-02 11:24:14.037845', NULL, NULL, 'Can ho The Song by Chatte Home', 'Studio Superior 1 studio nguyen can • 1 phong tam • 1 phong bep • 50m² 3 giuong (1 giuong sofa, 1 giuong doi lon, 1 nem futon) Mien Phi huy phong • Khong can thanh toan truoc Ban co the huy sau, nen hay dat ngay hom nay de co gia tot. Chi con 2 can voi gia nay tren trang cua chung toi', 'homestay', 560000, 'https://cf.bstatic.com/xdata/images/hotel/square600/401859314.webp?k=5ee57ce1fcc08e6aa0237e953ef5a6c0c1dec2444cf866fc2835317d1ec3df96&o=&s=1', '2', '10.4847', '107.454557', 5, 'Duong Ven Bien, Ben Cat, Phuoc Thuan, Xuyen Moc, Ba Ria - Vung Tau'),
	('7eb83fd8-913c-48d5-9ee6-33aafa48d26b', '2023-04-19 22:29:55.232680', NULL, '2023-05-02 11:25:46.008919', NULL, NULL, 'New Life Homestay', 'Phong Tieu Chuan Giuong Doi 1 giuong doi lon Chi con 5 phong voi gia nay tren trang cua chung toi', 'homestay', 350000, 'https://cf.bstatic.com/xdata/images/hotel/square600/434111876.webp?k=e86f1e635b5f1e0c3fbd735f7433c5921bed36f512d206152e4af54508adc15f&o=&s=1', '3', '10.212683848636935', '103.95885944366455', 5, 'Tran Hung Dao, Duong Dong, Phuong Duong Dong, Phu Quoc, Kien Giang'),
	('7eb8c011-3e1c-4284-8fe6-c70913c1ce84', '2023-04-19 22:32:09.875687', NULL, '2023-05-02 11:26:29.608876', NULL, NULL, 'Yen Vy Hotel and Apartment', 'Cach bai bien 300m Toa lac tai thanh pho Da Nang, cach Bai bien My Khe 300 m, Yen Vy Hotel and Apartment cung cap cho nghi ben bo bien voi nhieu tien nghi nhu trung tam the duc, sanh khach chung va san hien.', 'hotel', 842300, 'https://cf.bstatic.com/xdata/images/hotel/square200/407112684.webp?k=b78974136edb65d42243afefbb23fa25fc5f892ac752802492a37731d5f5f6bb&o=&s=1', '5', '16.074482', '108.24223289999998', 5, 'Duong Le Binh, Phuong An Hai Bac, Son Tra District, Da Nang'),
	('84fda98b-f697-4144-9821-870d15dd6fde', '2023-04-19 22:28:52.229837', NULL, '2023-05-02 11:27:10.992432', NULL, NULL, 'Mega Light Hotel Managed by Marcom Jack Lee', 'Phong Tieu Chuan Giuong Doi/2 Giuong Don Nhieu loai giuong Mien Phi huy phong • Khong can thanh toan truoc Ban co the huy sau, nen hay dat ngay hom nay de co gia tot.', 'hotel', 210000, 'https://cf.bstatic.com/xdata/images/hotel/square600/279812130.webp?k=ffef458185a44f061397023e713fdaef4a8a65bec33c43aaaae6590fbbb9b0c8&o=&s=1', '1', '12.2196056', '109.20408640000005', 5, '18, Tran Phu, Vinh Nguyen, Nha Trang, Khanh Hoa'),
	('886d865b-ae86-44ef-8641-d1ad678b0c62', '2023-05-01 22:44:10.448886', NULL, '2023-05-02 11:28:22.647074', NULL, NULL, 'ACE Hotel Saigon', 'Phuong Ben Thanh', 'hotel', 900000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10029650-840x460-FIT_AND_TRIM-4ea0ff8417715477c230d60ff8b4da8b.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '6', '10.768954347460143', '106.69022798538208', 5, 'Nguyen Trai, Ben Thanh, Quan 1, Ho Chi Minh'),
	('8d3b8908-37e7-42ce-a9c3-81578689a863', '2023-04-19 22:29:55.240417', NULL, '2023-05-02 11:29:07.103557', NULL, NULL, 'Ninila Fruit Farm BungalowMo trong cua so moi', 'Bungalow Coco Giuong doi 1 bungalow nguyen can • 1 phong ngu • 1 phong tam • 30m² 1 giuong doi lon Mien Phi huy phong • Khong can thanh toan truoc Ban co the huy sau, nen hay dat ngay hom nay de co gia tot. Chi con 4 can voi gia nay tren trang cua chung toi', 'homestay', 415000, 'https://cf.bstatic.com/xdata/images/hotel/square600/152834247.webp?k=631eb031a80a17695007f228557eaac4f17e097979f79c50d96b57eb6117c671&o=&s=1', '3', '10.2016412', '103.96441570000002', 5, '100, Tran Hung Dao, Phuong Duong Dong, Phu Quoc, Kien Giang'),
	('8e6a8089-a77f-4fc9-a3df-4b94c93d685d', '2023-05-01 22:44:10.432397', NULL, '2023-05-02 11:29:59.558504', NULL, NULL, 'Cozrum Lux Hotel', 'Phuong 8', 'hotel', 830000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/67778274-665e661aa4dc3b70be8ff81d66f71171.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '6', '10.7718955', '106.6905364', 5, 'Duong Bui Thi Xuan, Ben Thanh, Quan 1, Ho Chi Minh'),
	('962b6d71-fc33-4b03-8844-2b5acb4d8df2', '2023-04-19 22:32:09.878796', NULL, '2023-05-02 11:30:42.560649', NULL, NULL, 'Dylan Hotel Danang Managed By Marcom Jack LeeMo trong cua so moi', 'Du lich Ben vung Cap 3 Toa lac tai thanh pho Da Nang, cach bai bien My Khe chua day 1 km, Dylan Hotel Danang Managed By Marcom Jack Lee cung cap cho nghi voi ho boi ngoai troi, cho do xe rieng mien phi, nha hang va quay...', 'hotel', 332000, 'https://cf.bstatic.com/xdata/images/hotel/square200/408166190.webp?k=44c306fc7ca311f4c5c8f0edae6149dd2df54076efa7d3d9e8d65e4416da0fd4&o=&s=1', '5', '16.0892302899787', '108.24932366609573', 5, 'Duong Hoang Sa, Phuong Tho Quang, Son Tra, Da Nang'),
	('97852552-dd63-424b-8416-9a34dfa76593', '2023-04-19 22:28:52.217494', NULL, '2023-05-02 11:31:20.988739', NULL, NULL, 'Luxury Condo Nha Trang by SEAGROUP', 'With city views, Luxury Condo Nha Trang by SEAGROUP is set in Nha Trang and has a restaurant, room service, bar, garden, year-round outdoor pool and terrace.', 'hotel', 1592500, 'https://cf.bstatic.com/xdata/images/hotel/square600/447454635.webp?k=1c5a99ff51da80b76824e2a292e13546cb0f20649c9bd060db2d83d251974012&o=&s=1', '1', '12.294772576188269', '109.22821998596191', 5, 'Pham Van Dong, Vinh Hoa, Nha Trang, Khanh Hoa'),
	('a8bf9b21-6d26-4be2-8341-492223488cc9', '2023-05-01 22:46:46.181788', NULL, '2023-05-02 11:32:07.341218', NULL, NULL, 'KK Sapa Hotel', 'Quang Trung', 'hotel', 942300, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20025473-81fe2fcfa7200376272817561462a723.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '10', '22.3289229', '103.84569439999996', 5, 'Sapa stunning view hotel, Muong Hoa, Sa Pa, Sa Pa, Lao Cai'),
	('a92c900b-caee-400c-b00a-e2f391e72c01', '2023-04-19 22:28:52.236596', NULL, '2023-05-02 11:45:23.887757', NULL, NULL, 'AZ five stars Ocean View Apartment', 'Studio nhin ra quang canh dai duong 1 studio nguyen can • 1 phong tam • 1 phong bep • 45m² 2 giuong (1 giuong doi rat lon, 1 nem futon) Chi con 2 can voi gia nay tren trang cua chung toi', 'homestay', 1235000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20028074-887093055169bc4eab8a5f2d38100e03.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '1', '12.22668', '109.20014', 5, '98b tran phu, Duong Tran Phu, Vinh Nguyen, Nha Trang, Khanh Hoa'),
	('ac1a102d-fded-47c4-807f-7081eb53e71f', '2023-04-19 22:29:55.213813', NULL, '2023-05-02 11:46:00.576068', NULL, NULL, 'Phu House', 'Giuong trong Phong nghi Tap the danh cho ca Nam va Nu 8 Giuong co Tam nhin ra Dai duong 1 giuong trong phong tap the 1 giuong tang Bao bua sang', 'homestay', 180000, 'https://cf.bstatic.com/xdata/images/hotel/square600/434111876.webp?k=e86f1e635b5f1e0c3fbd735f7433c5921bed36f512d206152e4af54508adc15f&o=&s=1', '3', '10.243991', '103.948471', 5, 'Phuong Duong Dong, Phu Quoc, Kien Giang'),
	('af4f1151-b7a2-49f0-a491-d553b815e69d', '2023-04-19 22:31:32.558209', NULL, '2023-05-02 11:47:44.934722', NULL, NULL, 'Star Hotel', 'Phong Tieu Chuan Giuong Doi 1 giuong doi lon Mien Phi huy phong • Khong can thanh toan truoc Ban co the huy sau, nen hay dat ngay hom nay de co gia tot. Chi con 3 phong voi gia nay tren trang cua chung toi', 'hotel', 152145, 'https://cf.bstatic.com/xdata/images/hotel/square600/187838120.webp?k=8265dbdd39c57ddba261c668dacfe1c541ed31edb6427c887a5e622561a1c324&o=&s=1', '2', '10.3499614', '107.0961159', 5, '9, Thi Sach Street, Phuong 8, Vung Tau, Ba Ria - Vung Tau'),
	('b161285f-6f42-42fe-bdfb-e04fef6ce75b', '2023-05-01 22:46:16.454190', NULL, '2023-05-02 11:48:33.642870', NULL, NULL, 'Vedana Lagoon Resort & Spa', 'Thi tran Phu Loc', 'homestay', 420000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20000413-2f7842e30e5fc10c4520a435548a8479.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '9', '16.2840098', '107.8591424', 5, 'Doan Trong Tuyen, Khu 5, Phu Loc, Phu Loc, Thua Thien Hue'),
	('b2954931-06a2-4035-be5d-2be397795bee', '2023-05-01 22:44:59.511906', NULL, '2023-05-02 11:50:17.482506', NULL, NULL, 'Hanoi Calido', 'Cua Dong', 'homestay', 850000, 'https://ik.imagekit.io/tvlk/apr-asset/Ixf4aptF5N2Qdfmh4fGGYhTN274kJXuNMkUAzpL5HuD9jzSxIGG5kZNhhHY-p7nw/hotel/asset/67843214-1e32cca38bc768a1694438f95e2a2c3d.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '7', '21.03215', '105.845773', 5, '22, Pho Nguyen Quang Bich, Phuong Cua Dong, Hoan Kiem, Hanoi'),
	('b2eb21c0-fa00-4504-8189-3d92c797e49b', '2023-05-01 22:45:35.120563', NULL, '2023-05-02 11:51:14.468530', NULL, NULL, 'Silkian Hoian Boutique Hotel & Spa', 'Tan An', 'hotel', 800000, 'https://ik.imagekit.io/tvlk/apr-asset/Ixf4aptF5N2Qdfmh4fGGYhTN274kJXuNMkUAzpL5HuD9jzSxIGG5kZNhhHY-p7nw/hotel/asset/67835327-39f412bdeb7f1eb9ff1ef19a9ef89bea.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '8', '15.89012989999999', '108.3285932', 5, '6, Le Dinh Tham, Tan An, Hoi An, Quang Nam'),
	('bb5a1587-a2a2-4407-bba1-cb48da9d99e1', '2023-04-19 22:31:32.570805', NULL, '2023-05-02 11:52:17.453512', NULL, NULL, 'Luxury apartment rental at The Song Vung Tau', 'Uu Dai Mua Du Lich Can Ho 2 Phong Ngu 1 can ho nguyen can • 2 phong ngu • 1 phong tam • 1 phong bep • 55m² 2 giuong (1 giuong doi, 1 giuong doi lon) Chi con 5 can voi gia nay tren trang cua chung toi', 'homestay', 773000, 'https://cf.bstatic.com/xdata/images/hotel/square600/445727868.webp?k=3134e58e765aacc2af57de55d1dbc21188ab96727b15eebcf03490f418905207&o=&s=1', '2', '10.3354437', '107.0867389', 5, 'Hoang Hoa Tham, A Chau, Phuong 2, Vung Tau, Ba Ria - Vung Tau'),
	('bf2ef50f-25ce-4b54-996a-9c1d9e862813', '2023-04-19 22:32:09.891329', NULL, '2023-05-02 11:53:55.696041', NULL, NULL, 'Titan Hotel Da Nang', 'Nam cach Bai bien My An o thanh pho Da Nang 250 m, Titan Hotel Da Nang co nha hang, quan bar, WiFi mien phi trong tat ca cac khu vuc va nha hang trong khuon vien.', 'homestay', 560000, 'https://cf.bstatic.com/xdata/images/hotel/square200/402476744.webp?k=ae726c443b510c825cde3e58526667afebb7fdb49596f5872428f72375f182a8&o=&s=1', '5', '16.094741667826266', '108.1477395238037', 5, 'Duong Nguyen Tat Thanh, Phuong Hoa Hiep Nam, Quan Lien Chieu, Da Nang'),
	('c0fa38c8-ef95-4d2d-9652-d76b9e954871', '2023-04-19 22:31:32.553422', NULL, '2023-05-02 11:55:01.486600', NULL, NULL, 'Xoai\'s Apartment - The Song Condotel Vung Tau', 'Uu Dai Trong Thoi Gian Co Han Can Ho 2 Phong Ngu 1 can ho nguyen can • 2 phong ngu • 1 phong khach • 1 phong tam • 1 phong bep • 54m² 3 giuong (1 giuong sofa, 2 giuong doi lon) Chi con 1 can voi gia nay tren trang cua chung toi', 'hotel', 613000, 'https://cf.bstatic.com/xdata/images/hotel/square600/448305874.webp?k=7803eb71b49279d49dcabaa0dbdc076aeace9f70063f434db63d380cd5aa73c4&o=&s=1', '2', '10.3322495', '107.0889669', 5, 'Thuy Van, A Chau, Phuong 2, Vung Tau, Ba Ria - Vung Tau'),
	('c1de8eda-7646-4d27-9a83-b7c49d9428b7', '2023-05-01 22:44:10.442181', NULL, '2023-05-02 11:56:11.484271', NULL, NULL, 'Meraki Boutique', 'Phuong 15', 'homestay', 450000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10027042-800x600-FIT_AND_TRIM-013332c7bd84db040158e1699a7adad7.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '6', '10.766674', '106.691978', 5, '90-92, Bui Vien, Pham Ngu Lao, Quan 1, Ho Chi Minh'),
	('c8fde05d-c43e-48c3-b724-27c06fac5b4a', '2023-05-01 22:44:10.423587', NULL, '2023-05-02 11:57:57.276540', NULL, NULL, 'Cozrum Smart - First Target', 'Phuong Ben Nghe', 'homestay', 700000, 'https://ik.imagekit.io/tvlk/apr-asset/Ixf4aptF5N2Qdfmh4fGGYhTN274kJXuNMkUAzpL5HuD9jzSxIGG5kZNhhHY-p7nw/hotel/asset/67807556-1f8f91dc84b7d7a9a983d4390a1415e2.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '6', '10.770963', '106.688628', 5, 'Suong Nguyet Anh, Ben Thanh, Quan 1, Ho Chi Minh City'),
	('ca70de00-df2f-4a45-b339-efbc4037d76b', '2023-05-01 22:46:46.199733', NULL, '2023-05-02 11:58:45.461507', NULL, NULL, 'Pao\'s Sapa Leisure', 'Tan Phu', 'homestay', 842300, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20000718-65e3908544dbb81e59fcb8972f3c472b.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '10', '22.3268721', '103.84683159999997', 5, 'Cau May, Sa Pa, Lao Cai'),
	('ce659fdf-3c46-491e-a490-e592c05eabfc', '2023-05-01 22:46:16.450150', NULL, '2023-05-02 11:59:28.187609', NULL, NULL, 'Amona Hotel', 'Phu Quy', 'homestay', 842300, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20010460-e88fc82cdab78d1552f773a5661cb4b3.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '9', '16.4720185', '107.59589000000005', 5, 'Nguyen Cong Tru, Phuong Phu Hoi, Hue, Thua Thien Hue'),
	('cfc3fbb8-d408-4dba-8ebf-ac045da3c3a1', '2023-05-01 22:44:59.493172', NULL, '2023-05-02 12:00:17.983200', NULL, NULL, 'Classy Boutique Hotel', 'Hang Dao', 'hotel', 700000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10032202-325e6e54667c0f9c23b6cf71defa49fe.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '7', '21.036103', '105.84878700000002', 5, '25, Hang Ca, Phuong Hang Bo, Hoan Kiem, Hanoi'),
	('dc303fc5-a6d5-42a2-9c0c-d08ffdb4822c', '2023-05-01 22:44:59.501867', NULL, '2023-05-02 12:01:06.236310', NULL, NULL, 'Millennium Hanoi Hotel', 'Cua Nam', 'hotel', 700000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20016481-7b4cc5f5cef2b130bfb2c2acc03ca083.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '7', '21.02809458055101', '105.84286944937537', 5, 'Duong Cua Nam, Phuong Cua Nam, Hoan Kiem, Hanoi'),
	('e68a7f1a-4e6e-43c5-a89e-69750439289a', '2023-05-01 22:44:10.415630', NULL, '2023-05-02 12:01:53.433121', NULL, NULL, 'Muong Thanh Luxury Saigon Hotel', 'Phuong 10', 'hotel', 600000, 'https://ik.imagekit.io/tvlk/apr-asset/Ixf4aptF5N2Qdfmh4fGGYhTN274kJXuNMkUAzpL5HuD9jzSxIGG5kZNhhHY-p7nw/hotel/asset/67792655-ad3427ac9d5806721457f5ae7d59faea.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '6', '10.797443', '106.67204', 5, 'Duong Nguyen Van Troi, Phuong 10, Phu Nhuan, Ho Chi Minh'),
	('ebb278d6-bb4a-436b-b5ac-6ff98f99f15f', '2023-04-19 22:29:55.223669', NULL, '2023-05-02 12:02:50.868404', NULL, NULL, 'Hotel Phu quoc Ngoc viet', 'Phong Giuong Doi Hang Tiet Kiem 1 giuong doi lon Mien Phi huy phong • Khong can thanh toan truoc Ban co the huy sau, nen hay dat ngay hom nay de co gia tot. Chi con 4 phong voi gia nay tren trang cua chung toi', 'hotel', 369500, 'https://cf.bstatic.com/xdata/images/hotel/square600/443178279.webp?k=4a0e85c6a70cc3cdbdf0511021550a3f64c3da47b99676f87294362ceb417dec&o=&s=1', '3', '10.1810618', '103.96768859999997', 5, 'DUSIT PRINCESS PHU QUOC'),
	('ed807ab7-e614-4a64-ae74-3a2c7648406d', '2023-04-19 22:28:52.246128', NULL, '2023-05-02 12:03:58.550118', NULL, NULL, 'Khach San Flower Sky Nha Trang', 'Phong 2 Giuong Don Co Tam Nhin 2 giuong doi Mien Phi huy phong • Khong can thanh toan truoc Ban co the huy sau, nen hay dat ngay hom nay de co gia tot. Chi con 6 phong voi gia nay tren trang cua chung toi', 'hotel', 1200000, 'https://cf.bstatic.com/xdata/images/hotel/square600/292292240.webp?k=45ff71b6346d790b5da3abba3b54f37b9ecdd40147486ae1da94e2bdd6444b4f&o=&s=1', '1', '12.241001', '109.19479430000001', 5, '1, Hung Vuong, Loc Tho, Nha Trang, Khanh Hoa'),
	('f482f01a-0abd-457f-8776-6896902c4de5', '2023-05-01 22:46:46.186072', NULL, '2023-05-02 12:04:42.309564', NULL, NULL, 'Sapa Topaz Hotel & Spa', 'Thuan An', 'hotel', 846000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10039293-3e6deeb7e92ce393ee4f673e14113d20.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '10', '22.3365547', '103.83794390000003', 5, 'Duong Thac Bac, Phan Si Pang, Sa Pa, Sa Pa, Lao Cai'),
	('f54f31f5-dbf7-4fe8-b077-0a22690b34ed', '2023-04-19 22:32:09.882361', NULL, '2023-05-02 12:05:59.492084', NULL, NULL, 'Alyssa Hotel Da Nang', 'Du lich Ben vung Cap 1 Toa lac tai thanh pho Da Nang, cach Cau khoa Tinh yeu 1,1 km, Alyssa Hotel Da Nang cung cap cho nghi voi nha hang, cho do xe rieng mien phi, quay bar va khu vuon.', 'homestay', 433210, 'https://cf.bstatic.com/xdata/images/hotel/square200/371241722.webp?k=a16df64e5c79f33e757e071fc59f7644c3bcf41dda4871f5a9222233014ce860&o=&s=1', '5', '16.07357723563992', '108.24233844788512', 5, 'Loseby, Phuong An Hai Bac, Son Tra, Da Nang'),
	('f57210e9-6a37-44ae-bda7-270d5df2cd4b', '2023-05-01 22:44:10.457557', NULL, '2023-05-02 12:06:47.777892', NULL, NULL, 'Thanh Long Homestay', 'Phuong 2', 'homestay', 300000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20031437-abdb7d71114fa640d5b1e2e920628014.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '6', '10.8058408', '106.66543120000006', 5, 'Tra Khuc, Phuong 2, Tan Binh, Ho Chi Minh'),
	('f5bf0a82-7f6d-40b5-9873-1b8fe720956b', '2023-04-19 22:31:02.187278', NULL, '2023-05-02 12:08:02.819116', NULL, NULL, 'ORIANA Da Lat', 'Phong Giuong Doi 1 giuong doi Chi con 3 phong voi gia nay tren trang cua chung toi', 'homestay', 415000, 'https://cf.bstatic.com/xdata/images/hotel/square600/440884323.webp?k=f6d8c1ce5280170e3c9343d4a3a44945eaec903bc48778d501233debfe830b17&o=&s=1', '4', '11.945809', '108.439672', 5, 'Bui Thi Xuan, Phuong 2, Dalat, Lam Dong'),
	('fa64cef7-3742-48aa-90eb-0b731a87a3b9', '2023-05-01 22:46:16.436775', NULL, '2023-05-02 12:08:44.280833', NULL, NULL, 'Lang Co Beach Resort', 'Thi tran Lang Co', 'hotel', 820000, 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10041897-1400x1050-FIT_AND_TRIM-d912793fa56391508a4554767350352b.jpeg?tr=q-40,w-300,h-300&_src=imagekit', '9', '16.2467962', '108.07574109999996', 5, 'Lang Co, Phu Loc, Thua Thien Hue'),
	('fef30fc8-30dd-4ea4-97c2-21729cdeba6e', '2023-04-19 22:31:02.182704', NULL, '2023-04-19 22:31:02.182704', NULL, NULL, 'Ngan Pho Studio & HotelMo trong cua so moi', 'Uu Dai Su Dung Trong Ngay (3 gio) - Phu phi ap dung cho nghi qua dem 1 giuong doi lon Mien Phi huy phong • Khong can thanh toan truoc Ban co the huy sau, nen hay dat ngay hom nay de co gia tot. Chi con 7 phong voi gia nay tren trang cua chung toi', 'hotel', 204750, 'https://cf.bstatic.com/xdata/images/hotel/square600/332106910.webp?k=f0fd9dcd406f272ace6fdfe7b33d1689d00289ad33847e402266a2dda0b48bc6&o=&s=1', '4', '11.9533713', '108.4294361', 5, NULL);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;

-- Dumping structure for table travel.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table travel.migrations: ~7 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `timestamp`, `name`) VALUES
	(1, 1680352199696, 'InitDB1680352199696'),
	(2, 1681917299207, 'ChangeDB1681917299207'),
	(3, 1682827985901, 'AddImageInProvince1682827985901'),
	(4, 1682953161039, 'AddRomFree1682953161039'),
	(5, 1682955605290, 'AddLocation1682955605290'),
	(6, 1682996837675, 'AddBooking1682996837675'),
	(7, 1683012205038, 'FixBooking1683012205038'),
	(8, 1683012994723, 'AddTableFavorite1683012994723');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table travel.provinces
CREATE TABLE IF NOT EXISTS `provinces` (
  `id` varchar(36) NOT NULL,
  `createdOnDate` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `createdByUserId` varchar(255) DEFAULT NULL,
  `lastModifiedOnDate` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `lastModifiedByUserId` varchar(255) DEFAULT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table travel.provinces: ~8 rows (approximately)
DELETE FROM `provinces`;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` (`id`, `createdOnDate`, `createdByUserId`, `lastModifiedOnDate`, `lastModifiedByUserId`, `deletedAt`, `name`, `image`) VALUES
	('1', '2023-04-19 22:09:21.614278', NULL, '2023-04-30 11:14:07.826391', NULL, NULL, 'Nha Trang', 'https://q-xx.bstatic.com/xdata/images/city/300x240/688907.jpg?k=8a219233969467d9f7ff828918cce2a53b4db6f1da1039d27222441ffb97c409&o='),
	('10', '2023-04-30 11:16:41.000000', NULL, '2023-04-30 11:16:55.154617', NULL, NULL, 'Sa Pa', 'https://q-xx.bstatic.com/xdata/images/city/300x240/688898.jpg?k=cf02624b12e35e7e5c6e7b1323f3fd4ef10b8b0676b84ff91b27c8a77f1b5d33&o='),
	('2', '2023-04-19 22:09:32.005871', NULL, '2023-04-30 11:14:15.641103', NULL, NULL, 'Vung Tau', 'https://r-xx.bstatic.com/xdata/images/city/300x240/688956.jpg?k=fc88c6ab5434042ebe73d94991e011866b18ee486476e475a9ac596c79dce818&o='),
	('3', '2023-04-19 22:09:41.324319', NULL, '2023-04-30 11:14:28.300074', NULL, NULL, 'Phu Quoc', 'https://r-xx.bstatic.com/xdata/images/city/300x240/688879.jpg?k=82ca0089828054a1a9c46b14ea7f1625d73d42505ae58761e8bcc067f9e72475&o='),
	('4', '2023-04-19 22:09:52.846606', NULL, '2023-04-30 11:14:46.893360', NULL, NULL, 'Da Lat', 'https://r-xx.bstatic.com/xdata/images/city/300x240/688831.jpg?k=7b999c7babe3487598fc4dd89365db2c4778827eac8cb2a47d48505c97959a78&o='),
	('5', '2023-04-19 22:10:00.749268', NULL, '2023-04-30 11:14:47.348027', NULL, NULL, 'Da Nang', 'https://r-xx.bstatic.com/xdata/images/city/300x240/688844.jpg?k=02892d4252c5e4272ca29db5faf12104004f81d13ff9db724371de0c526e1e15&o='),
	('6', '2023-04-30 11:15:39.745293', NULL, '2023-04-30 11:15:39.745293', NULL, NULL, 'TP Ho Chi Minh', 'https://r-xx.bstatic.com/xdata/images/city/300x240/688831.jpg?k=7b999c7babe3487598fc4dd89365db2c4778827eac8cb2a47d48505c97959a78&o='),
	('7', '2023-04-30 11:16:02.898830', NULL, '2023-04-30 11:16:02.898830', NULL, NULL, 'Ha Noi', 'https://q-xx.bstatic.com/xdata/images/city/300x240/688853.jpg?k=f6427c8fccdf777e4bbc75fcd245e7c66204280181bea23350388c76c57348d1&o='),
	('8', '2023-04-30 11:16:19.813336', NULL, '2023-04-30 11:16:19.813336', NULL, NULL, 'Hoi An', 'https://q-xx.bstatic.com/xdata/images/city/300x240/688866.jpg?k=fc9d2cb9fe2f6d1160e10542cd2b83f5a8008401d33e8750ee3c2691cf4d4f7e&o='),
	('9', '2023-04-30 11:16:32.351941', NULL, '2023-04-30 11:16:32.351941', NULL, NULL, 'Hue', 'https://q-xx.bstatic.com/xdata/images/city/300x240/688886.jpg?k=91c47e49d89f3a4c2408a360bbbe8b08d11e35e3d6d253c7efb27b5ca4d40a61&o=');
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;

-- Dumping structure for table travel.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(36) NOT NULL,
  `createdOnDate` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `createdByUserId` varchar(255) DEFAULT NULL,
  `lastModifiedOnDate` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `lastModifiedByUserId` varchar(255) DEFAULT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `bdd` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_1e3d0240b49c40521aaeb95329` (`phoneNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table travel.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `createdOnDate`, `createdByUserId`, `lastModifiedOnDate`, `lastModifiedByUserId`, `deletedAt`, `phoneNumber`, `password`, `name`, `email`, `otp`, `bdd`) VALUES
	('1', '2023-04-18 20:44:01.060566', NULL, '2023-05-03 16:45:25.000000', NULL, NULL, '0123123', '1', 'thienvo1', 'qtthien@gmail.com', NULL, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
