-- --------------------------------------------------------
-- Хост:                         localhost
-- Версия сервера:               5.7.19 - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных world
CREATE DATABASE IF NOT EXISTS `world` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `world`;

-- Дамп структуры для таблица world.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `capital_name` varchar(50) NOT NULL DEFAULT '0',
  `area` float NOT NULL DEFAULT '0',
  `region_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `region_id_fk` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы world.countries: ~38 rows (приблизительно)
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`id`, `name`, `capital_name`, `area`, `region_id`) VALUES
	(1, 'Индия', 'Нью-Дели', 3287260, 1),
	(2, 'Марокко', 'Рабат', 446550, 2),
	(3, 'Турция', 'Анкара', 783562, 3),
	(4, 'Германия', 'Берлин', 357022, 4),
	(5, 'Норвегия', 'Осло', 323802, 4),
	(6, 'Ямайка', 'Кингстон', 10991, 5),
	(7, 'Австралия', 'Канберра', 7741220, 6),
	(8, 'Канада', 'Оттава', 9984670, 7),
	(9, 'Аргентина', 'Буэнос-Айрес', 2780400, 9),
	(10, 'Япония', 'Токио', 377915, 1),
	(11, 'Дания', 'Копенгаген', 43094, 4),
	(12, 'Франция', 'Париж', 643801, 4),
	(13, 'Китай', 'Пекин', 9596960, 1),
	(14, 'Бангладеш', 'Дакка', 143998, 1),
	(15, 'Египет', 'Каир', 1001450, 2),
	(16, 'Нигерия', 'Абуджа', 923768, 2),
	(17, 'Тунис', 'Тунис', 163610, 2),
	(18, 'Израиль', 'Иерусалим', 20770, 3),
	(19, 'Армения', 'Ереван', 29743, 3),
	(20, 'Иордания', 'Амман', 89342, 3),
	(21, 'Барбадос', 'Бриджтаун', 430, 5),
	(22, 'Куба', 'Гавана', 110860, 5),
	(23, 'Пуэрто-Рико', 'Сан-Хуан', 13790, 5),
	(24, 'Новая Зеландия', 'Веллингтон', 267710, 6),
	(25, 'Соломоновы Острова', 'Хониара', 28896, 6),
	(26, 'Фиджи', 'Сува', 18274, 6),
	(27, 'Соединенные Штаты Америки', 'Вашингтон', 9826680, 7),
	(28, 'Гренландия', 'Нуук', 2166090, 7),
	(29, 'Мексика', 'Мехико', 1964380, 7),
	(30, 'Никарагуа', 'Манагуа', 130370, 8),
	(31, 'Эль-Сальвадор', 'Сан-Сальвадор', 21041, 8),
	(32, 'Коста-Рика', 'Сан-Хосе', 51100, 8),
	(33, 'Панама', 'Панама', 75420, 8),
	(34, 'Бразилия', 'Бразилиа', 8514880, 9),
	(35, 'Чили', 'Сантьяго', 756102, 9),
	(36, 'Эквадор', 'Кито', 283561, 9);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

-- Дамп структуры для таблица world.regions
CREATE TABLE IF NOT EXISTS `regions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы world.regions: ~8 rows (приблизительно)
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` (`id`, `name`) VALUES
	(1, 'Азия'),
	(2, 'Африка'),
	(3, 'Ближний Восток'),
	(4, 'Европа'),
	(5, 'Карибский бассейн'),
	(6, 'Океания'),
	(7, 'Северная Америка'),
	(8, 'Центральная Америка'),
	(9, 'Южная Америка');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
