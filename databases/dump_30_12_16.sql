-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Дек 30 2016 г., 11:48
-- Версия сервера: 5.5.52-0ubuntu0.14.04.1
-- Версия PHP: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `enchilada`
--

-- --------------------------------------------------------

--
-- Структура таблицы `allergen_to_attribute`
--

CREATE TABLE IF NOT EXISTS `allergen_to_attribute` (
  `allergen_group_id` int(11) NOT NULL,
  `allergen_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`allergen_group_id`,`allergen_id`,`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_address`
--

CREATE TABLE IF NOT EXISTS `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_affiliate`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_affiliate_activity`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_activity` (
  `affiliate_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_affiliate_login`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_allergen`
--

CREATE TABLE IF NOT EXISTS `oc_allergen` (
  `allergen_id` int(11) NOT NULL AUTO_INCREMENT,
  `allergen_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`allergen_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `oc_allergen`
--

INSERT INTO `oc_allergen` (`allergen_id`, `allergen_group_id`, `sort_order`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 4),
(4, 1, 6),
(5, 6, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_allergen_description`
--

CREATE TABLE IF NOT EXISTS `oc_allergen_description` (
  `allergen_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`language_id`,`allergen_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_allergen_description`
--

INSERT INTO `oc_allergen_description` (`allergen_id`, `language_id`, `name`, `description`) VALUES
(1, 2, 'G-W', NULL),
(1, 1, 'G-W', NULL),
(1, 3, 'G-W - содержащие клейковину крупы (Пшеница) и изделия из нее', NULL),
(2, 2, 'G-K', NULL),
(2, 1, 'G-K', NULL),
(2, 3, 'G-K - Содержащие клейковину крупы (Камут) и изделия из него ', NULL),
(3, 2, 'G-R', NULL),
(3, 1, 'G-R', NULL),
(3, 3, 'G-R - содержащие клейковину крупы (Рожь) и изделия из нее', NULL),
(4, 2, 'G-G ', 'fdfsddf'),
(4, 1, 'G-G ', 'dffdfdf'),
(4, 3, 'G-G - содержащие клейковину крупы (Ячмень) и изделия из него', 'ddfdfdf'),
(5, 2, 'D-E', 'Не особо полезный аллерген'),
(5, 1, 'D-E', 'Не особо полезный аллерген'),
(5, 3, 'D-E', 'Не особо полезный аллерген');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_allergen_group`
--

CREATE TABLE IF NOT EXISTS `oc_allergen_group` (
  `allergen_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`allergen_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Дамп данных таблицы `oc_allergen_group`
--

INSERT INTO `oc_allergen_group` (`allergen_group_id`, `sort_order`) VALUES
(1, 4),
(2, 5),
(3, 3),
(4, 6),
(5, 2),
(6, 1),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_allergen_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_allergen_group_description` (
  `allergen_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`allergen_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_allergen_group_description`
--

INSERT INTO `oc_allergen_group_description` (`allergen_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'G ', 'содержащие клейковину крупы'),
(1, 2, 'G', 'содержащие клейковину крупы'),
(2, 1, 'Sch', 'кожура плодов'),
(2, 2, 'Sch ', ' кожура плодов'),
(3, 1, 'K', ' ракообразные и продукты из ракообразных'),
(3, 2, 'K', ' ракообразные и продукты из ракообразных'),
(4, 1, 'E', ' яйца и продукты из яиц'),
(5, 1, 'F', 'рыба и продукты из рыбы'),
(5, 2, 'F', 'рыба и продукты из рыбы'),
(6, 1, 'ER', 'арахис и продукты из арахиса'),
(6, 2, 'ER', 'арахис и продукты из арахиса'),
(4, 3, 'E', ' яйца и продукты из яиц'),
(4, 2, 'E', ' яйца и продукты из яиц'),
(2, 3, 'Sch', ' кожура плодов'),
(6, 3, 'ER', 'арахис и продукты из арахиса'),
(5, 3, 'F', 'рыба и продукты из рыбы'),
(1, 3, 'G ', 'содержащие клейковину крупы'),
(3, 3, 'K', ' ракообразные и продукты из ракообразных'),
(8, 2, 'S', ''),
(8, 1, 'S', ''),
(8, 3, 'S', 'Соя и продукты из сои '),
(9, 2, 'M', ''),
(9, 1, 'M', ''),
(9, 3, 'M', 'Молоко и молочные продукты'),
(10, 2, 'SL', ''),
(10, 1, 'SL', ''),
(10, 3, 'SL', 'Сельдерей и продукты из сельдерея'),
(11, 2, 'SE', ''),
(11, 1, 'SE', ''),
(11, 3, 'SE', 'Горчица и продукты из горчицы'),
(12, 2, 'SES', ''),
(12, 1, 'SES', ''),
(12, 3, 'SES', 'Кунжут и продукты из кунжута'),
(13, 2, 'SUL', ''),
(13, 1, 'SUL', ''),
(13, 3, 'SUL', 'Сульфаты'),
(14, 2, 'L', ''),
(14, 1, 'L', ''),
(14, 3, 'L', 'Бобовые'),
(15, 2, 'W', ''),
(15, 1, 'W', ''),
(15, 3, 'W', 'Моллюски '),
(16, 2, 'G-W', ''),
(16, 1, 'G-W', ''),
(16, 3, 'G-W', 'Содержащие клейковину крупы (Пшеница) и изделия из нее '),
(17, 2, 'G-R ', ''),
(17, 1, 'G-R ', ''),
(17, 3, 'G-R ', 'Содержащие клейковину крупы (Рожь) и изделия из нее '),
(18, 2, 'G-G ', ''),
(18, 1, 'G-G ', ''),
(18, 3, 'G-G ', 'Содержащие клейковину крупы (Ячмень) и изделия из него'),
(19, 2, 'G-H', ''),
(19, 1, 'G-H', ''),
(19, 3, 'G-H', 'Содержащие клейковину крупы (Овес) и изделия из него'),
(20, 2, 'G-D', ''),
(20, 1, 'G-D', ''),
(20, 3, 'G-D', 'Содержащие клейковину крупы (Злак) и изделия из него'),
(21, 2, 'G-K', ''),
(21, 1, 'G-K', ''),
(21, 3, 'G-K', 'Содержащие клейковину крупы (Камут) и изделия из него'),
(22, 2, 'Sch-M', ''),
(22, 1, 'Sch-M', ''),
(22, 3, 'Sch-M', 'Кожура плодов (Миндальный) и изделия из него'),
(23, 2, 'Sch-H', ''),
(23, 1, 'Sch-H', ''),
(23, 3, 'Sch-H', 'Кожура плодов (Общий орешник) и изделия из него'),
(24, 2, 'Sch-W', ''),
(24, 1, 'Sch-W', ''),
(24, 3, 'Sch-W', 'Кожура плодов (Грецкий) и изделия из него'),
(25, 2, 'Sch-K', ''),
(25, 1, 'Sch-K', ''),
(25, 3, 'Sch-K', 'Кожура плодов (Анакард) и изделия из него'),
(26, 2, 'Sch-P', ''),
(26, 1, 'Sch-P', ''),
(26, 3, 'Sch-P', 'Кожура плодов (Пекан) и изделия из него'),
(27, 2, 'Sch-PA', ''),
(27, 1, 'Sch-PA', ''),
(27, 3, 'Sch-PA', 'Кожура плодов	(Бразильский) и изделия из него'),
(28, 2, 'Sch-PI', ''),
(28, 1, 'Sch-PI', ''),
(28, 3, 'Sch-PI', 'Кожура плодов (Фисташковый) и изделия из него'),
(29, 2, 'Sch-Q', ''),
(29, 1, 'Sch-Q', ''),
(29, 3, 'Sch-Q', 'Кожура плодов (Королевский) и изделия из него'),
(30, 2, 'Sch-Mac', ''),
(30, 1, 'Sch-Mac', ''),
(30, 3, 'Sch-Mac', 'Кожура плодов (Макадами) и изделия из него');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api`
--

CREATE TABLE IF NOT EXISTS `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `name`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'Yglnwxq5oDL4w3pzDOT6WFQ6fZytaZxuPqigVwUEcd9ryL2Co0De6JCf7gKiBaJO8lUsMnlanYXUKy1W9feLoTZ0Lno7y6awFdCgtT5alIeMBFUhuSjdsgln6OXw62jAPLpWqri0h4iXm928IcikZnM78tzNU4B8RqS8MRjHPg8fhTH2xRXL2cOF0frxuGVdVv9r18xmgVaFEQuAmVN1mOCtE2nRekeSxUsNmolddxmtIKVpzUKpBCXbpySDDeUU', 1, '2016-11-02 18:40:03', '2016-11-02 18:40:03');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api_ip`
--

CREATE TABLE IF NOT EXISTS `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api_session`
--

CREATE TABLE IF NOT EXISTS `oc_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=102 ;

--
-- Дамп данных таблицы `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(37, 5, 0),
(38, 5, 0),
(39, 5, 0),
(40, 5, 0),
(41, 5, 1),
(42, 5, 0),
(43, 5, 0),
(44, 5, 0),
(45, 5, 0),
(46, 5, 0),
(47, 5, 0),
(48, 5, 0),
(49, 5, 0),
(50, 5, 0),
(51, 5, 0),
(52, 5, 0),
(53, 5, 0),
(54, 5, 0),
(55, 5, 0),
(56, 5, 0),
(57, 5, 0),
(58, 5, 0),
(59, 5, 0),
(60, 5, 0),
(61, 5, 0),
(62, 5, 0),
(63, 5, 0),
(64, 5, 0),
(65, 5, 0),
(66, 5, 0),
(67, 5, 0),
(68, 5, 0),
(69, 5, 0),
(70, 5, 0),
(71, 5, 0),
(72, 5, 0),
(73, 5, 0),
(74, 5, 0),
(75, 5, 0),
(76, 5, 0),
(77, 5, 0),
(78, 5, 0),
(79, 5, 0),
(80, 5, 0),
(81, 5, 0),
(82, 5, 0),
(83, 5, 0),
(84, 5, 0),
(85, 5, 0),
(86, 5, 0),
(87, 5, 0),
(88, 5, 0),
(89, 5, 0),
(90, 5, 0),
(91, 5, 0),
(92, 5, 0),
(93, 5, 0),
(94, 5, 0),
(95, 5, 0),
(96, 5, 0),
(97, 5, 0),
(98, 5, 0),
(99, 5, 0),
(100, 5, 0),
(101, 5, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(37, 2, 'Tomato'),
(37, 1, 'Tomato'),
(37, 3, 'Помидор'),
(38, 2, 'Red Salsa '),
(38, 1, 'Red Salsa '),
(38, 3, 'Red Salsa '),
(39, 2, 'Sour Cream '),
(39, 1, 'Sour Cream '),
(39, 3, 'Sour Cream '),
(40, 1, 'Guacamole '),
(40, 2, 'Guacamole '),
(40, 3, 'Guacamole '),
(41, 2, 'Jalapeno-Cheese-Sauce'),
(41, 1, 'Jalapeno-Cheese-Sauce'),
(41, 3, 'Jalapeno-Cheese-Sauce'),
(42, 2, 'Tomatensauce '),
(42, 1, 'Tomatensauce '),
(42, 3, 'Tomatensauce '),
(43, 2, 'Käse'),
(43, 1, 'Käse'),
(43, 3, 'Käse'),
(44, 2, 'Hähnchen-Gemüse-Käse Füllung '),
(44, 1, 'Hähnchen-Gemüse-Käse Füllung '),
(44, 3, 'Hähnchen-Gemüse-Käse Füllung '),
(45, 2, 'Cole Slaw'),
(45, 1, 'Cole Slaw'),
(46, 1, 'Buffalo Wing '),
(46, 2, 'Buffalo Wing '),
(47, 2, 'Taquito con pollo '),
(47, 1, 'Taquito con pollo '),
(47, 3, 'Taquito con pollo '),
(48, 3, 'Quesada'),
(48, 1, 'Quesada'),
(49, 2, 'Maiskolben'),
(49, 1, 'Maiskolben'),
(49, 3, 'Maiskolben'),
(50, 2, 'Shrimpspieß'),
(50, 1, 'Shrimpspieß'),
(50, 3, 'Shrimpspieß'),
(51, 2, 'Kräuterbutter '),
(51, 1, 'Kräuterbutter'),
(51, 3, 'Kräuterbutter'),
(52, 2, 'mexikanischer Reis '),
(52, 1, 'mexikanischer Reis '),
(52, 3, 'mexikanischer Reis '),
(53, 2, 'Dressing Salatbeilage'),
(53, 1, 'Dressing Salatbeilage'),
(54, 3, 'Weizentortillas'),
(54, 2, 'Weizentortillas'),
(55, 2, 'Chilli con carne '),
(55, 1, 'Chilli con carne '),
(55, 3, 'Chilli con carne '),
(56, 2, 'Bohnenmus '),
(56, 1, 'Bohnenmus '),
(56, 3, 'Bohnenmus '),
(57, 2, 'bunte Buttervariation '),
(57, 1, 'bunte Buttervariation '),
(57, 3, 'bunte Buttervariation '),
(58, 2, 'Pfefferkruste'),
(58, 1, 'Pfefferkruste'),
(58, 3, 'Pfefferkruste'),
(59, 2, 'Chipotle Salsa'),
(59, 1, 'Chipotle Salsa'),
(59, 3, 'Chipotle Salsa'),
(60, 2, 'Chicken Wings (Eigenproduktion)'),
(60, 1, 'Chicken Wings (Eigenproduktion)'),
(60, 3, 'Chicken Wings (Eigenproduktion)'),
(61, 1, 'Chicken Wings (Zukauf)'),
(61, 2, 'Chicken Wings (Zukauf)'),
(62, 1, 'BBQ-Sauce '),
(62, 2, 'BBQ-Sauce '),
(63, 2, 'Baguette '),
(63, 1, 'Baguette '),
(54, 1, 'Weizentortillas'),
(45, 3, 'Cole Slaw'),
(48, 2, 'Quesada'),
(53, 3, 'Dressing Salatbeilage'),
(64, 2, 'Hähnchenfüllung '),
(64, 1, 'Hähnchenfüllung '),
(64, 3, 'Hähnchenfüllung '),
(65, 2, 'Frischkäse'),
(65, 1, 'Frischkäse'),
(65, 3, 'Frischkäse'),
(66, 1, 'Streetfood-Taco'),
(66, 2, 'Streetfood-Taco'),
(67, 2, 'Enchilada d. maiz c. pollo'),
(67, 1, 'Enchilada d. maiz c. pollo'),
(67, 3, 'Enchilada d. maiz c. pollo'),
(68, 1, 'Miniburrito verde'),
(68, 2, 'Miniburrito verde'),
(69, 2, 'Buffalo Wing (Eigenproduktion)'),
(69, 1, 'Buffalo Wing (Eigenproduktion)'),
(69, 3, 'Buffalo Wing (Eigenproduktion)'),
(46, 3, 'Buffalo Wing '),
(70, 1, 'Miniburrito mit Gemüse &amp; Käse'),
(70, 3, 'Miniburrito mit Gemüse &amp; Käse'),
(70, 2, 'Miniburrito mit Gemüse &amp; Käse'),
(71, 2, 'Spinat'),
(71, 1, 'Spinat'),
(71, 3, 'Spinat'),
(72, 2, 'Schafskäse '),
(72, 1, 'Schafskäse '),
(72, 3, 'Schafskäse '),
(73, 1, 'Burgersauce'),
(73, 2, 'Burgersauce'),
(74, 1, 'Extra Large White Bap'),
(74, 2, 'Extra Large White Bap'),
(75, 2, 'Ketchup'),
(75, 1, 'Ketchup'),
(75, 3, 'Ketchup'),
(76, 2, 'Cheddarkäse'),
(76, 1, 'Cheddarkäse'),
(76, 3, 'Cheddarkäse'),
(77, 1, 'Röstzwiebeln '),
(77, 2, 'Röstzwiebeln '),
(78, 1, 'Gemüseburger '),
(78, 2, 'Gemüseburger '),
(79, 2, 'Gemüsefüllung '),
(79, 1, 'Gemüsefüllung '),
(79, 3, 'Gemüsefüllung '),
(80, 2, 'Spinatfüllung '),
(80, 1, 'Spinatfüllung '),
(80, 3, 'Spinatfüllung '),
(81, 1, 'Taco Bowl '),
(81, 2, 'Taco Bowl '),
(82, 2, 'Baguette zu Salaten '),
(82, 1, 'Baguette zu Salaten '),
(82, 3, 'Baguette zu Salaten '),
(83, 2, 'Tofu'),
(83, 1, 'Tofu'),
(83, 3, 'Tofu'),
(84, 2, 'Essig-Öl-Dressing'),
(84, 1, 'Essig-Öl-Dressing'),
(84, 3, 'Essig-Öl-Dressing'),
(85, 1, 'Churros'),
(85, 2, 'Churros'),
(86, 2, 'Schokoladensauce'),
(86, 1, 'Schokoladensauce'),
(86, 3, 'Schokoladensauce'),
(87, 1, 'Schokoladenkuchen '),
(87, 2, 'Schokoladenkuchen '),
(88, 2, 'Mövenpick Creme Vanilla'),
(88, 1, 'Mövenpick Creme Vanilla'),
(88, 3, 'Mövenpick Creme Vanilla'),
(89, 2, 'Sahne'),
(89, 1, 'Sahne'),
(89, 3, 'Sahne'),
(90, 1, 'Sweet Chips'),
(90, 2, 'Sweet Chips'),
(91, 2, 'Mövenpick Chocolate Chips '),
(91, 1, 'Mövenpick Chocolate Chips '),
(91, 3, 'Mövenpick Chocolate Chips '),
(92, 2, 'Karamellsauce'),
(92, 1, 'Karamellsauce'),
(92, 3, 'Karamellsauce'),
(93, 2, 'Vanilla'),
(93, 1, 'Vanilla'),
(93, 3, 'Vanilla'),
(94, 2, 'Belgian Chocolate'),
(94, 1, 'Belgian Chocolate'),
(94, 3, 'Belgian Chocolate'),
(95, 2, 'Strawberry Cheesecake'),
(95, 1, 'Strawberry Cheesecake'),
(95, 3, 'Strawberry Cheesecake'),
(96, 1, 'Cookies &amp; Cream'),
(96, 2, 'Cookies &amp; Cream'),
(97, 2, 'Macadamia Nut Brittle '),
(97, 1, 'Macadamia Nut Brittle '),
(97, 3, 'Macadamia Nut Brittle '),
(98, 1, 'Vanilla Caramel Brownie '),
(98, 2, 'Vanilla Caramel Brownie '),
(61, 3, 'Chicken Wings (Zukauf)'),
(62, 3, 'BBQ-Sauce '),
(63, 3, 'Baguette '),
(66, 3, 'Streetfood-Taco'),
(68, 3, 'Miniburrito verde'),
(73, 3, 'Burgersauce'),
(74, 3, 'Extra Large White Bap'),
(77, 3, 'Röstzwiebeln '),
(78, 3, 'Gemüseburger '),
(81, 3, 'Taco Bowl '),
(98, 3, 'Vanilla Caramel Brownie '),
(96, 3, 'Cookies &amp; Cream'),
(90, 3, 'Sweet Chips'),
(87, 3, 'Schokoladenkuchen '),
(85, 3, 'Churros'),
(99, 2, 'Brot'),
(99, 1, 'Brot'),
(99, 3, 'Brot'),
(100, 2, 'Blattspinatfüllung '),
(100, 1, 'Blattspinatfüllung '),
(100, 3, 'Blattspinatfüllung '),
(101, 2, 'Wagyuburger'),
(101, 1, 'Wagyuburger'),
(101, 3, 'Wagyuburger');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_group`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Drinks'),
(4, 3, 'Веган'),
(5, 3, 'Food'),
(4, 1, 'Vegan'),
(5, 1, 'Food'),
(3, 2, 'Getränke'),
(4, 2, 'Vegan'),
(5, 2, 'Food'),
(3, 3, 'Напитки');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_to_allergen`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_to_allergen` (
  `attribute_id` int(11) NOT NULL,
  `allergen_group_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_id`,`allergen_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_to_allergen`
--

INSERT INTO `oc_attribute_to_allergen` (`attribute_id`, `allergen_group_id`) VALUES
(38, 13),
(39, 9),
(40, 9),
(40, 13),
(41, 9),
(42, 13),
(43, 9),
(44, 9),
(44, 10),
(45, 4),
(45, 9),
(45, 10),
(45, 11),
(45, 16),
(46, 10),
(47, 9),
(47, 10),
(48, 9),
(48, 16),
(49, 9),
(50, 3),
(51, 9),
(52, 10),
(53, 9),
(53, 10),
(53, 11),
(53, 16),
(54, 16),
(55, 8),
(55, 9),
(55, 10),
(56, 13),
(57, 9),
(58, 11),
(59, 8),
(60, 10),
(61, 15),
(61, 16),
(62, 18),
(63, 16),
(63, 17),
(64, 9),
(65, 9),
(66, 9),
(66, 13),
(66, 16),
(67, 9),
(67, 10),
(67, 13),
(68, 9),
(68, 10),
(68, 16),
(69, 1),
(69, 10),
(70, 9),
(70, 10),
(70, 16),
(71, 9),
(72, 9),
(73, 4),
(73, 9),
(73, 16),
(74, 8),
(74, 16),
(75, 11),
(76, 9),
(77, 16),
(78, 4),
(78, 16),
(79, 9),
(79, 10),
(80, 9),
(81, 1),
(81, 16),
(82, 1),
(83, 8),
(84, 11),
(84, 13),
(85, 16),
(86, 9),
(87, 4),
(87, 8),
(87, 9),
(87, 16),
(88, 9),
(89, 9),
(90, 16),
(91, 8),
(91, 9),
(92, 9),
(93, 4),
(93, 9),
(94, 4),
(94, 8),
(94, 9),
(95, 4),
(95, 9),
(96, 4),
(96, 9),
(96, 16),
(97, 2),
(97, 4),
(97, 9),
(98, 4),
(98, 8),
(98, 9),
(98, 16),
(99, 16),
(99, 17),
(100, 9),
(101, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner`
--

CREATE TABLE IF NOT EXISTS `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner_image`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=209 ;

--
-- Дамп данных таблицы `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(171, 8, 3, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(172, 8, 3, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(167, 8, 3, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(166, 8, 1, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0),
(165, 8, 1, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(164, 8, 1, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(163, 8, 1, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(162, 8, 1, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(161, 8, 1, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(170, 8, 3, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(160, 8, 1, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(159, 8, 1, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(158, 8, 1, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(157, 8, 1, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(156, 8, 1, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(155, 8, 2, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0),
(154, 8, 2, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(168, 8, 3, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(169, 8, 3, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(153, 8, 2, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(152, 8, 2, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(151, 8, 2, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(150, 8, 2, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(149, 8, 2, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(148, 8, 2, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(147, 8, 2, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(146, 8, 2, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(145, 8, 2, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(204, 7, 1, 'Enchi Hour: Täglich ab 22:30 Uhr Margaritas 4,80, Pitcher....', 'index.php?route=information/information', 'catalog/Beef Enchiladas.jpg', 0),
(173, 8, 3, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(174, 8, 3, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(175, 8, 3, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(176, 8, 3, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(177, 8, 3, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0),
(201, 7, 2, 'Auf Wunsch servieren wir alle Speisen auch extra scharf!', 'index.php?route=information/information', 'catalog/slide.jpg', 1),
(202, 7, 1, 'Auf Wunsch servieren wir alle Speisen auch extra scharf!', 'index.php?route=information/information', 'catalog/slide.jpg', 0),
(203, 7, 1, 'Unsere Cocina hat täglich bis 23.30 Uhr geöffnet', 'index.php?route=information/information', 'catalog/Texas-Fajitas-2-650x433.jpg', 0),
(200, 7, 2, 'Happy Hour', 'index.php?route=information/information', 'catalog/28704.jpg', 0),
(199, 7, 2, 'Enchi Hour: Täglich ab 22:30 Uhr Margaritas 4,80, Pitcher...', 'index.php?route=information/information', 'catalog/Beef Enchiladas.jpg', 0),
(198, 7, 2, 'Unsere Cocina hat täglich bis 23.30 Uhr geöffnet', 'index.php?route=information/information', 'catalog/Texas-Fajitas-2-650x433.jpg', 0),
(205, 7, 1, 'Happy Hour', 'index.php?route=information/information', 'catalog/28704.jpg', 0),
(206, 7, 3, 'Unsere Cocina hat täglich bis 23.30 Uhr geöffnet', 'index.php?route=information/information', 'catalog/Texas-Fajitas-2-650x433.jpg', 0),
(207, 7, 3, 'Auf Wunsch servieren wir alle Speisen auch extra scharf!', 'index.php?route=information/information', 'catalog/slide.jpg', 0),
(208, 7, 3, 'Enchi Hour: Täglich ab 22:30 Uhr Margaritas 4,80, Pitcher...', 'index.php?route=information/information', 'catalog/Beef Enchiladas.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner_image_description`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(123, 2, 7, 'MacBookAir'),
(111, 2, 6, 'HP Banner'),
(132, 1, 8, 'Disney'),
(131, 2, 8, 'Dell'),
(131, 1, 8, 'Dell'),
(130, 2, 8, 'Harley Davidson'),
(123, 1, 7, 'MacBookAir'),
(130, 1, 8, 'Harley Davidson'),
(129, 2, 8, 'Canon'),
(129, 1, 8, 'Canon'),
(128, 2, 8, 'Burger King'),
(122, 2, 7, 'iPhone 6'),
(111, 1, 6, 'HP Banner'),
(128, 1, 8, 'Burger King'),
(127, 2, 8, 'Coca Cola'),
(127, 1, 8, 'Coca Cola'),
(126, 2, 8, 'Sony'),
(122, 1, 7, 'iPhone 6'),
(126, 1, 8, 'Sony'),
(125, 2, 8, 'RedBull'),
(125, 1, 8, 'RedBull'),
(124, 2, 8, 'NFL'),
(124, 1, 8, 'NFL'),
(121, 2, 9, 'Gallery9'),
(121, 1, 9, 'Gallery9'),
(120, 2, 9, 'Gallery8'),
(120, 1, 9, 'Gallery8'),
(119, 2, 9, 'Gallery7'),
(119, 1, 9, 'Gallery7'),
(118, 2, 9, 'Gallery6'),
(118, 1, 9, 'Gallery6'),
(117, 2, 9, 'Gallery5'),
(117, 1, 9, 'Gallery5'),
(116, 2, 9, 'Gallery4'),
(116, 1, 9, 'Gallery4'),
(115, 2, 9, 'Gallery3'),
(115, 1, 9, 'Gallery3'),
(114, 2, 9, 'Gallery2'),
(114, 1, 9, 'Gallery2'),
(113, 2, 9, 'Gallery1'),
(113, 1, 9, 'Gallery1'),
(112, 1, 6, 'Zalupanner'),
(112, 2, 6, 'jhlskjdhalkj'),
(132, 2, 8, 'Disney'),
(133, 1, 8, 'Starbucks'),
(133, 2, 8, 'Starbucks'),
(134, 1, 8, 'Nintendo'),
(134, 2, 8, 'Nintendo');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_cart`
--

CREATE TABLE IF NOT EXISTS `oc_cart` (
  `cart_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category`
--

CREATE TABLE IF NOT EXISTS `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

--
-- Дамп данных таблицы `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(78, 'catalog/icons/enchiladas.png', 59, 0, 2, 0, 1, '2016-11-03 13:39:23', '2016-12-18 18:34:25'),
(77, 'catalog/icons/ketchup.png', 59, 0, 1, 0, 1, '2016-11-03 13:38:26', '2016-11-23 19:23:13'),
(61, 'catalog/menu_tab_3.svg', 0, 0, 1, 2, 1, '2016-11-03 12:53:09', '2016-11-23 20:11:18'),
(60, 'catalog/menu_tab_2.svg', 0, 0, 1, 1, 1, '2016-11-03 12:52:53', '2016-11-23 19:09:52'),
(76, 'catalog/icons/glass-with-wine.png', 60, 0, 1, 0, 1, '2016-11-03 13:37:53', '2016-11-23 19:15:11'),
(92, 'catalog/icons/steak.png', 59, 0, 1, 0, 1, '2016-11-23 17:06:15', '2016-11-23 20:05:58'),
(80, 'catalog/icons/Fajitas.png', 59, 0, 1, 0, 1, '2016-11-03 13:40:35', '2016-11-23 19:20:28'),
(79, 'catalog/icons/140-512.png', 59, 0, 1, 0, 1, '2016-11-03 13:40:12', '2016-11-23 19:17:21'),
(88, 'catalog/icons/salver.png', 59, 0, 1, 0, 1, '2016-11-23 16:42:55', '2016-11-23 19:17:47'),
(70, 'catalog/icons/wine.png', 60, 0, 1, 0, 1, '2016-11-03 13:34:00', '2016-11-23 19:14:20'),
(69, 'catalog/icons/wine.png', 60, 0, 1, 0, 1, '2016-11-03 13:33:42', '2016-11-23 19:16:02'),
(68, 'catalog/icons/wine-glass (1).png', 60, 0, 1, 0, 1, '2016-11-03 13:33:06', '2016-11-23 19:14:02'),
(66, '', 60, 0, 1, 0, 1, '2016-11-03 13:20:31', '2016-11-23 19:15:38'),
(65, 'catalog/icons/tequila.png', 60, 0, 1, 0, 1, '2016-11-03 12:56:12', '2016-11-23 19:14:45'),
(59, 'catalog/menu_tab_1.svg', 0, 0, 1, 0, 1, '2016-11-03 12:52:41', '2016-11-23 19:10:21'),
(93, '', 61, 0, 1, 0, 1, '2016-12-18 21:06:27', '2016-12-18 21:06:27'),
(84, 'catalog/icons/salad.png', 59, 0, 1, 0, 1, '2016-11-03 13:42:31', '2016-11-23 19:18:46'),
(87, '', 59, 0, 1, 0, 1, '2016-11-03 14:02:53', '2016-11-23 19:16:23'),
(89, 'catalog/icons/nachos.png', 59, 0, 1, 1, 1, '2016-11-23 17:03:21', '2016-12-18 18:34:07'),
(90, 'catalog/icons/salver.png', 59, 0, 1, 0, 1, '2016-11-23 17:03:58', '2016-12-18 20:13:41'),
(91, 'catalog/icons/cupcake.png', 59, 0, 1, 0, 1, '2016-11-23 17:05:03', '2016-11-23 19:22:22');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(61, 3, 'Вегетариан', '', 'Vegetarian', '', ''),
(88, 2, 'Carnes', '', 'Carnes', '', ''),
(88, 1, 'Carnes', '', 'Carnes', '', ''),
(65, 2, 'Tequila', '', 'Tequila', '', ''),
(66, 2, 'Wodka', '', 'Vodka', '', ''),
(66, 1, 'Vodka', '', 'Vodka', '', ''),
(68, 1, 'Champagne', '', 'Champagne', '', ''),
(69, 1, 'Wine', '', 'Wine', '', ''),
(70, 3, 'Ром', '', 'Rum', '', ''),
(76, 1, 'Tinto', '', 'Tinto', '', ''),
(79, 2, 'Buriti', '&lt;p&gt;Serviert mit frischem Koriander, Salatbeilage &amp;amp; Sour Cream&amp;nbsp;&lt;br&gt;&lt;/p&gt;', 'Burritos', '', ''),
(80, 2, 'Fajitas', '', 'Fajitas', '', ''),
(92, 2, 'Steaks', '&lt;p&gt;220g bestes Angus Hüftsteaks von glücklichen Kühen - Yee-haw!!!&lt;br&gt;&lt;/p&gt;', 'Steaks', '', ''),
(93, 2, 'Burger ', '', 'Burger', '', ''),
(77, 2, 'Beilagen', '&lt;p&gt;werden nur in Verbindung mit einem Hautgericht serviert&lt;br&gt;&lt;/p&gt;', 'Side Orders', '', ''),
(87, 3, 'Бургеры', '', 'Burgers', '', ''),
(59, 2, 'Essen', '', 'Food', '', ''),
(60, 2, 'Trinken', '', 'Drinks', '', ''),
(61, 1, 'Vegetarian', '', 'Vegetarian', '', ''),
(78, 2, 'Enchiladas', '', 'Enchiladas', '', ''),
(65, 3, 'Текила', '', 'Tequila', '', ''),
(68, 2, 'Champagner', '', 'Champagne', '', ''),
(69, 2, 'Wein', '', 'Wine', '', ''),
(70, 2, 'Rum', '', 'Rum', '', ''),
(70, 1, 'Rum', '', 'Rum', '', ''),
(59, 3, 'Еда', '', 'Food', '', ''),
(89, 2, 'Entradas', '', 'Entradas', '', ''),
(76, 2, 'Tinto', '', 'Tinto', '', ''),
(77, 1, 'Side Orders', '', 'Side Orders', '', ''),
(78, 3, 'Энчиладас', '', 'Enchiladas', '', ''),
(80, 3, 'Фахитас', '', 'Fajitas', '', ''),
(92, 1, 'Steaks', '', 'Steaks', '', ''),
(92, 3, 'Стейки', '', 'Steaks', '', ''),
(84, 1, 'Ensaladas', '', 'Ensaladas', '', ''),
(87, 1, 'Burgers', '', 'Burgers', '', ''),
(59, 1, 'Food', '', 'Food', '', ''),
(60, 1, 'Drinks', '', 'Drinks', '', ''),
(61, 2, 'Vegetarisch', '', 'Vegetarian', '', ''),
(88, 3, 'Карнес', '', 'Carnes', '', ''),
(65, 1, 'Tequila', '', 'Tequila', '', ''),
(66, 3, 'Водка', '', 'Vodka', '', ''),
(68, 3, 'Шампанское ', '', 'Champagne', '', ''),
(69, 3, 'Вино', '', 'Wine', '', ''),
(60, 3, 'Напитки', '', 'Drinks', '', ''),
(76, 3, 'Тинто', '', 'Tinto', '', ''),
(77, 3, 'Гарниры', '', 'Side Orders', '', ''),
(78, 1, 'Enchiladas', '', 'Enchiladas', '', ''),
(79, 3, 'Бурито ', '', 'Burritos', '', ''),
(80, 1, 'Fajitas', '', 'Fajitas', '', ''),
(93, 1, 'Burger', '', 'Burger', '', ''),
(90, 3, 'Специальные', '', 'Especialidades', '', ''),
(87, 2, 'Burgers', '', 'Burgers', '', ''),
(79, 1, 'Buriti', '', 'Burritos', '', ''),
(84, 3, 'Салаты', '', 'Ensaladas', '', ''),
(84, 2, 'Ensaladas', '', 'Ensaladas', '', ''),
(89, 3, 'Энтрадас', '', 'Entradas', '', ''),
(89, 1, 'Entradas', '', 'Entradas', '', ''),
(90, 1, 'Specialties', '', 'Especialidades', '', ''),
(91, 2, 'Postres', '', 'Postres', '', ''),
(91, 1, 'Desserts ', '', 'Postres', '', ''),
(91, 3, 'Десерты', '', 'Postres', '', ''),
(90, 2, 'Especialidades', '', 'Especialidades', '', ''),
(93, 3, 'Burger', '', 'Burger', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_filter`
--

CREATE TABLE IF NOT EXISTS `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_path`
--

CREATE TABLE IF NOT EXISTS `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(80, 80, 1),
(80, 59, 0),
(79, 79, 1),
(79, 59, 0),
(78, 78, 1),
(78, 59, 0),
(77, 77, 1),
(77, 59, 0),
(76, 76, 1),
(76, 60, 0),
(88, 59, 0),
(61, 61, 0),
(60, 60, 0),
(84, 59, 0),
(70, 70, 1),
(70, 60, 0),
(89, 59, 0),
(69, 69, 1),
(69, 60, 0),
(68, 68, 1),
(68, 60, 0),
(88, 88, 1),
(66, 60, 0),
(65, 60, 0),
(66, 66, 1),
(91, 59, 0),
(90, 59, 0),
(65, 65, 1),
(89, 89, 1),
(90, 90, 1),
(59, 59, 0),
(84, 84, 1),
(93, 93, 1),
(93, 61, 0),
(92, 92, 1),
(92, 59, 0),
(87, 59, 0),
(87, 87, 1),
(91, 91, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(59, 0, 0),
(60, 0, 0),
(61, 0, 0),
(88, 0, 0),
(65, 0, 0),
(66, 0, 0),
(68, 0, 0),
(69, 0, 0),
(70, 0, 0),
(76, 0, 0),
(77, 0, 0),
(78, 0, 0),
(79, 0, 0),
(80, 0, 0),
(92, 0, 0),
(84, 0, 0),
(93, 0, 0),
(87, 0, 0),
(89, 0, 0),
(90, 0, 0),
(91, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(59, 0),
(60, 0),
(61, 0),
(65, 0),
(66, 0),
(68, 0),
(69, 0),
(70, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(84, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_country`
--

CREATE TABLE IF NOT EXISTS `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=258 ;

--
-- Дамп данных таблицы `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'South Korea', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon`
--

CREATE TABLE IF NOT EXISTS `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_category`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_history`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_product`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_currency`
--

CREATE TABLE IF NOT EXISTS `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Euro', 'EUR', '', '€', '2', 1.00000000, 1, '2016-12-30 07:26:05');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer`
--

CREATE TABLE IF NOT EXISTS `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_activity`
--

CREATE TABLE IF NOT EXISTS `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_ban_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test'),
(1, 2, 'Default', 'test'),
(1, 3, 'Default', 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_history`
--

CREATE TABLE IF NOT EXISTS `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_login`
--

CREATE TABLE IF NOT EXISTS `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_online`
--

CREATE TABLE IF NOT EXISTS `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_reward`
--

CREATE TABLE IF NOT EXISTS `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_search`
--

CREATE TABLE IF NOT EXISTS `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_wishlist`
--

CREATE TABLE IF NOT EXISTS `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_value`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download`
--

CREATE TABLE IF NOT EXISTS `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download_description`
--

CREATE TABLE IF NOT EXISTS `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_event`
--

CREATE TABLE IF NOT EXISTS `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `date_added`) VALUES
(1, 'voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_extension`
--

CREATE TABLE IF NOT EXISTS `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Дамп данных таблицы `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'theme', 'theme_default'),
(21, 'dashboard', 'activity'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(26, 'dashboard', 'map'),
(27, 'dashboard', 'customer'),
(28, 'dashboard', 'chart'),
(31, 'analytics', 'google_analytics');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter`
--

CREATE TABLE IF NOT EXISTS `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `oc_filter`
--

INSERT INTO `oc_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES
(1, 1, 1),
(2, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filters_to_order`
--

CREATE TABLE IF NOT EXISTS `oc_filters_to_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `filters_info` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=159 ;

--
-- Дамп данных таблицы `oc_filters_to_order`
--

INSERT INTO `oc_filters_to_order` (`id`, `order_id`, `filters_info`) VALUES
(1, 1, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(2, 2, 'a:5:{s:5:"price";i:13;s:4:"kcal";i:22;s:11:"ingredients";i:5;s:9:"allergens";i:4;s:14:"allergenObject";a:3:{i:27;i:10;i:14;i:3;i:24;i:10;}}'),
(3, 3, 'a:5:{s:5:"price";i:10;s:4:"kcal";i:23;s:11:"ingredients";i:14;s:9:"allergens";i:5;s:14:"allergenObject";a:2:{i:9;i:2;i:8;i:3;}}'),
(4, 4, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(5, 5, 'a:5:{s:5:"price";i:5;s:4:"kcal";i:17;s:11:"ingredients";i:4;s:9:"allergens";i:7;s:14:"allergenObject";a:3:{i:6;i:4;i:18;i:4;i:24;i:6;}}'),
(6, 6, 'a:5:{s:5:"price";i:13;s:4:"kcal";i:0;s:11:"ingredients";i:6;s:9:"allergens";i:16;s:14:"allergenObject";a:5:{i:8;i:2;i:24;i:1;i:2;i:2;i:5;i:2;i:17;i:4;}}'),
(7, 7, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(8, 8, 'a:5:{s:5:"price";i:3;s:4:"kcal";i:2;s:11:"ingredients";i:10;s:9:"allergens";i:1;s:14:"allergenObject";a:4:{i:10;i:6;i:20;i:0;i:26;i:3;i:8;i:4;}}'),
(9, 9, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:21;s:11:"ingredients";i:18;s:9:"allergens";i:4;s:14:"allergenObject";a:5:{i:22;i:0;i:17;i:0;i:19;i:6;i:4;i:1;i:29;i:1;}}'),
(10, 10, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(11, 11, 'a:5:{s:5:"price";i:13;s:4:"kcal";i:24;s:11:"ingredients";i:16;s:9:"allergens";i:2;s:14:"allergenObject";a:5:{i:21;i:8;i:24;i:5;i:10;i:8;i:6;i:0;i:26;i:1;}}'),
(12, 12, 'a:5:{s:5:"price";i:1;s:4:"kcal";i:21;s:11:"ingredients";i:8;s:9:"allergens";i:11;s:14:"allergenObject";a:5:{i:17;i:9;i:27;i:5;i:30;i:3;i:26;i:3;i:13;i:2;}}'),
(13, 13, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(14, 14, 'a:5:{s:5:"price";i:1;s:4:"kcal";i:23;s:11:"ingredients";i:0;s:9:"allergens";i:1;s:14:"allergenObject";a:3:{i:27;i:7;i:28;i:8;i:19;i:1;}}'),
(15, 15, 'a:5:{s:5:"price";i:4;s:4:"kcal";i:2;s:11:"ingredients";i:3;s:9:"allergens";i:12;s:14:"allergenObject";a:3:{i:10;i:0;i:11;i:2;i:30;i:2;}}'),
(16, 16, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(17, 17, 'a:5:{s:5:"price";i:12;s:4:"kcal";i:17;s:11:"ingredients";i:4;s:9:"allergens";i:13;s:14:"allergenObject";a:3:{i:6;i:5;i:20;i:6;i:1;i:1;}}'),
(18, 18, 'a:5:{s:5:"price";i:13;s:4:"kcal";i:23;s:11:"ingredients";i:9;s:9:"allergens";i:14;s:14:"allergenObject";a:4:{i:24;i:6;i:6;i:0;i:3;i:5;i:8;i:4;}}'),
(19, 19, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(20, 20, 'a:5:{s:5:"price";i:10;s:4:"kcal";i:1;s:11:"ingredients";i:6;s:9:"allergens";i:6;s:14:"allergenObject";a:5:{i:15;i:3;i:9;i:6;i:5;i:9;i:24;i:2;i:6;i:7;}}'),
(21, 21, 'a:5:{s:5:"price";i:13;s:4:"kcal";i:15;s:11:"ingredients";i:21;s:9:"allergens";i:5;s:14:"allergenObject";a:7:{i:13;i:8;i:21;i:7;i:8;i:1;i:29;i:6;i:23;i:10;i:17;i:0;i:28;i:2;}}'),
(22, 22, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(23, 23, 'a:5:{s:5:"price";i:5;s:4:"kcal";i:18;s:11:"ingredients";i:17;s:9:"allergens";i:7;s:14:"allergenObject";a:2:{i:14;i:6;i:26;i:10;}}'),
(24, 24, 'a:5:{s:5:"price";i:6;s:4:"kcal";i:0;s:11:"ingredients";i:19;s:9:"allergens";i:10;s:14:"allergenObject";a:5:{i:4;i:8;i:25;i:0;i:11;i:7;i:9;i:5;i:21;i:6;}}'),
(25, 25, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(26, 26, 'a:5:{s:5:"price";i:1;s:4:"kcal";i:9;s:11:"ingredients";i:17;s:9:"allergens";i:12;s:14:"allergenObject";a:7:{i:18;i:2;i:2;i:4;i:3;i:6;i:24;i:0;i:20;i:6;i:30;i:0;i:22;i:3;}}'),
(27, 27, 'a:5:{s:5:"price";i:2;s:4:"kcal";i:15;s:11:"ingredients";i:19;s:9:"allergens";i:12;s:14:"allergenObject";a:3:{i:13;i:8;i:6;i:2;i:22;i:2;}}'),
(28, 28, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(29, 29, 'a:5:{s:5:"price";i:7;s:4:"kcal";i:22;s:11:"ingredients";i:13;s:9:"allergens";i:6;s:14:"allergenObject";a:2:{i:1;i:9;i:3;i:10;}}'),
(30, 30, 'a:5:{s:5:"price";i:7;s:4:"kcal";i:25;s:11:"ingredients";i:0;s:9:"allergens";i:2;s:14:"allergenObject";a:3:{i:20;i:2;i:15;i:0;i:14;i:5;}}'),
(31, 31, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(32, 32, 'a:5:{s:5:"price";i:11;s:4:"kcal";i:24;s:11:"ingredients";i:8;s:9:"allergens";i:15;s:14:"allergenObject";a:4:{i:13;i:6;i:12;i:10;i:23;i:10;i:28;i:10;}}'),
(33, 33, 'a:5:{s:5:"price";i:2;s:4:"kcal";i:25;s:11:"ingredients";i:14;s:9:"allergens";i:3;s:14:"allergenObject";a:2:{i:22;i:8;i:4;i:3;}}'),
(34, 34, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(35, 35, 'a:5:{s:5:"price";i:4;s:4:"kcal";i:26;s:11:"ingredients";i:15;s:9:"allergens";i:8;s:14:"allergenObject";a:7:{i:5;i:0;i:13;i:3;i:1;i:2;i:26;i:6;i:22;i:3;i:11;i:3;i:18;i:0;}}'),
(36, 36, 'a:5:{s:5:"price";i:1;s:4:"kcal";i:12;s:11:"ingredients";i:12;s:9:"allergens";i:6;s:14:"allergenObject";a:3:{i:21;i:5;i:29;i:1;i:1;i:7;}}'),
(37, 37, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(38, 38, 'a:5:{s:5:"price";i:10;s:4:"kcal";i:23;s:11:"ingredients";i:3;s:9:"allergens";i:15;s:14:"allergenObject";a:4:{i:10;i:10;i:11;i:5;i:30;i:6;i:29;i:10;}}'),
(39, 39, 'a:5:{s:5:"price";i:1;s:4:"kcal";i:14;s:11:"ingredients";i:5;s:9:"allergens";i:15;s:14:"allergenObject";a:3:{i:27;i:10;i:2;i:1;i:19;i:2;}}'),
(40, 40, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(41, 41, 'a:5:{s:5:"price";i:11;s:4:"kcal";i:10;s:11:"ingredients";i:21;s:9:"allergens";i:1;s:14:"allergenObject";a:3:{i:14;i:4;i:9;i:6;i:22;i:3;}}'),
(42, 42, 'a:5:{s:5:"price";i:5;s:4:"kcal";i:11;s:11:"ingredients";i:15;s:9:"allergens";i:6;s:14:"allergenObject";a:7:{i:25;i:0;i:15;i:3;i:16;i:10;i:19;i:3;i:6;i:10;i:20;i:2;i:14;i:3;}}'),
(43, 43, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(44, 44, 'a:5:{s:5:"price";i:14;s:4:"kcal";i:18;s:11:"ingredients";i:3;s:9:"allergens";i:15;s:14:"allergenObject";a:3:{i:17;i:2;i:27;i:4;i:16;i:8;}}'),
(45, 45, 'a:5:{s:5:"price";i:12;s:4:"kcal";i:5;s:11:"ingredients";i:4;s:9:"allergens";i:5;s:14:"allergenObject";a:4:{i:27;i:5;i:9;i:5;i:25;i:9;i:14;i:1;}}'),
(46, 46, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(47, 47, 'a:5:{s:5:"price";i:10;s:4:"kcal";i:15;s:11:"ingredients";i:1;s:9:"allergens";i:10;s:14:"allergenObject";a:3:{i:8;i:0;i:19;i:2;i:29;i:8;}}'),
(48, 48, 'a:5:{s:5:"price";i:4;s:4:"kcal";i:6;s:11:"ingredients";i:20;s:9:"allergens";i:11;s:14:"allergenObject";a:4:{i:27;i:7;i:8;i:7;i:16;i:0;i:9;i:5;}}'),
(49, 49, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(50, 50, 'a:5:{s:5:"price";i:7;s:4:"kcal";i:7;s:11:"ingredients";i:23;s:9:"allergens";i:13;s:14:"allergenObject";a:3:{i:4;i:1;i:2;i:3;i:18;i:7;}}'),
(51, 51, 'a:5:{s:5:"price";i:3;s:4:"kcal";i:19;s:11:"ingredients";i:8;s:9:"allergens";i:0;s:14:"allergenObject";a:4:{i:5;i:6;i:8;i:10;i:21;i:4;i:13;i:10;}}'),
(52, 52, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(53, 53, 'a:5:{s:5:"price";i:1;s:4:"kcal";i:25;s:11:"ingredients";i:17;s:9:"allergens";i:10;s:14:"allergenObject";a:4:{i:25;i:6;i:22;i:2;i:18;i:4;i:3;i:4;}}'),
(54, 54, 'a:5:{s:5:"price";i:10;s:4:"kcal";i:8;s:11:"ingredients";i:8;s:9:"allergens";i:15;s:14:"allergenObject";a:3:{i:2;i:4;i:18;i:2;i:29;i:9;}}'),
(55, 55, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(56, 56, 'a:5:{s:5:"price";i:3;s:4:"kcal";i:20;s:11:"ingredients";i:6;s:9:"allergens";i:2;s:14:"allergenObject";a:5:{i:4;i:0;i:13;i:4;i:15;i:3;i:28;i:4;i:11;i:7;}}'),
(57, 57, 'a:5:{s:5:"price";i:6;s:4:"kcal";i:3;s:11:"ingredients";i:21;s:9:"allergens";i:0;s:14:"allergenObject";a:5:{i:9;i:10;i:25;i:3;i:11;i:3;i:26;i:5;i:24;i:7;}}'),
(58, 58, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(59, 59, 'a:5:{s:5:"price";i:9;s:4:"kcal";i:2;s:11:"ingredients";i:6;s:9:"allergens";i:11;s:14:"allergenObject";a:2:{i:8;i:0;i:6;i:7;}}'),
(60, 60, 'a:5:{s:5:"price";i:2;s:4:"kcal";i:26;s:11:"ingredients";i:21;s:9:"allergens";i:16;s:14:"allergenObject";a:3:{i:1;i:6;i:28;i:6;i:30;i:6;}}'),
(61, 61, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(62, 62, 'a:5:{s:5:"price";i:11;s:4:"kcal";i:2;s:11:"ingredients";i:23;s:9:"allergens";i:13;s:14:"allergenObject";a:7:{i:6;i:4;i:21;i:3;i:22;i:0;i:14;i:8;i:2;i:5;i:3;i:0;i:4;i:7;}}'),
(63, 63, 'a:5:{s:5:"price";i:11;s:4:"kcal";i:4;s:11:"ingredients";i:19;s:9:"allergens";i:0;s:14:"allergenObject";a:3:{i:15;i:5;i:26;i:9;i:17;i:4;}}'),
(64, 64, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(65, 65, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:21;s:11:"ingredients";i:15;s:9:"allergens";i:15;s:14:"allergenObject";a:2:{i:2;i:5;i:18;i:3;}}'),
(66, 66, 'a:5:{s:5:"price";i:7;s:4:"kcal";i:0;s:11:"ingredients";i:22;s:9:"allergens";i:16;s:14:"allergenObject";a:5:{i:12;i:7;i:26;i:10;i:8;i:1;i:20;i:10;i:19;i:8;}}'),
(67, 67, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(68, 68, 'a:5:{s:5:"price";i:6;s:4:"kcal";i:5;s:11:"ingredients";i:6;s:9:"allergens";i:7;s:14:"allergenObject";a:7:{i:8;i:5;i:15;i:1;i:4;i:8;i:14;i:7;i:22;i:3;i:25;i:7;i:13;i:9;}}'),
(69, 69, 'a:5:{s:5:"price";i:10;s:4:"kcal";i:1;s:11:"ingredients";i:4;s:9:"allergens";i:5;s:14:"allergenObject";a:4:{i:25;i:1;i:3;i:9;i:16;i:1;i:2;i:6;}}'),
(70, 70, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(71, 71, 'a:5:{s:5:"price";i:10;s:4:"kcal";i:4;s:11:"ingredients";i:4;s:9:"allergens";i:1;s:14:"allergenObject";a:3:{i:27;i:5;i:17;i:2;i:16;i:5;}}'),
(72, 72, 'a:5:{s:5:"price";i:3;s:4:"kcal";i:5;s:11:"ingredients";i:18;s:9:"allergens";i:12;s:14:"allergenObject";a:2:{i:25;i:8;i:2;i:7;}}'),
(73, 73, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(74, 74, 'a:5:{s:5:"price";i:13;s:4:"kcal";i:10;s:11:"ingredients";i:23;s:9:"allergens";i:12;s:14:"allergenObject";a:5:{i:25;i:9;i:14;i:8;i:27;i:5;i:5;i:4;i:15;i:8;}}'),
(75, 75, 'a:5:{s:5:"price";i:5;s:4:"kcal";i:9;s:11:"ingredients";i:22;s:9:"allergens";i:14;s:14:"allergenObject";a:7:{i:22;i:2;i:18;i:1;i:14;i:7;i:1;i:1;i:6;i:5;i:30;i:3;i:17;i:3;}}'),
(76, 76, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(77, 77, 'a:5:{s:5:"price";i:7;s:4:"kcal";i:6;s:11:"ingredients";i:17;s:9:"allergens";i:7;s:14:"allergenObject";a:4:{i:19;i:1;i:20;i:4;i:5;i:7;i:22;i:0;}}'),
(78, 78, 'a:5:{s:5:"price";i:4;s:4:"kcal";i:17;s:11:"ingredients";i:6;s:9:"allergens";i:13;s:14:"allergenObject";a:4:{i:23;i:3;i:17;i:9;i:22;i:1;i:24;i:10;}}'),
(79, 79, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(80, 80, 'a:5:{s:5:"price";i:7;s:4:"kcal";i:6;s:11:"ingredients";i:15;s:9:"allergens";i:7;s:14:"allergenObject";a:4:{i:3;i:7;i:18;i:10;i:2;i:2;i:30;i:3;}}'),
(81, 81, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:5;s:11:"ingredients";i:10;s:9:"allergens";i:7;s:14:"allergenObject";a:5:{i:23;i:4;i:22;i:10;i:11;i:1;i:18;i:0;i:14;i:8;}}'),
(82, 82, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(83, 83, 'a:5:{s:5:"price";i:14;s:4:"kcal";i:16;s:11:"ingredients";i:11;s:9:"allergens";i:0;s:14:"allergenObject";a:7:{i:18;i:7;i:22;i:9;i:8;i:0;i:24;i:7;i:16;i:0;i:12;i:0;i:1;i:0;}}'),
(84, 84, 'a:5:{s:5:"price";i:8;s:4:"kcal";i:24;s:11:"ingredients";i:0;s:9:"allergens";i:1;s:14:"allergenObject";a:3:{i:30;i:8;i:26;i:8;i:18;i:10;}}'),
(85, 85, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(86, 86, 'a:5:{s:5:"price";i:11;s:4:"kcal";i:4;s:11:"ingredients";i:7;s:9:"allergens";i:12;s:14:"allergenObject";a:5:{i:25;i:6;i:5;i:9;i:1;i:7;i:30;i:9;i:3;i:4;}}'),
(87, 87, 'a:5:{s:5:"price";i:14;s:4:"kcal";i:14;s:11:"ingredients";i:22;s:9:"allergens";i:6;s:14:"allergenObject";a:6:{i:24;i:3;i:25;i:2;i:18;i:5;i:11;i:2;i:4;i:2;i:22;i:2;}}'),
(88, 88, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(89, 89, 'a:5:{s:5:"price";i:3;s:4:"kcal";i:26;s:11:"ingredients";i:5;s:9:"allergens";i:9;s:14:"allergenObject";a:5:{i:2;i:7;i:4;i:5;i:29;i:4;i:19;i:4;i:22;i:10;}}'),
(90, 90, 'a:5:{s:5:"price";i:10;s:4:"kcal";i:15;s:11:"ingredients";i:13;s:9:"allergens";i:0;s:14:"allergenObject";a:3:{i:28;i:9;i:30;i:5;i:17;i:9;}}'),
(91, 91, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(92, 92, 'a:5:{s:5:"price";i:6;s:4:"kcal";i:5;s:11:"ingredients";i:7;s:9:"allergens";i:7;s:14:"allergenObject";a:4:{i:29;i:5;i:19;i:1;i:23;i:7;i:27;i:7;}}'),
(93, 93, 'a:5:{s:5:"price";i:6;s:4:"kcal";i:10;s:11:"ingredients";i:9;s:9:"allergens";i:6;s:14:"allergenObject";a:4:{i:30;i:2;i:10;i:7;i:15;i:10;i:17;i:8;}}'),
(94, 94, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(95, 95, 'a:5:{s:5:"price";i:10;s:4:"kcal";i:13;s:11:"ingredients";i:13;s:9:"allergens";i:13;s:14:"allergenObject";a:6:{i:30;i:6;i:14;i:7;i:25;i:2;i:22;i:2;i:6;i:7;i:4;i:5;}}'),
(96, 96, 'a:5:{s:5:"price";i:8;s:4:"kcal";i:11;s:11:"ingredients";i:14;s:9:"allergens";i:14;s:14:"allergenObject";a:2:{i:14;i:2;i:16;i:10;}}'),
(97, 97, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(98, 98, 'a:5:{s:5:"price";i:3;s:4:"kcal";i:7;s:11:"ingredients";i:20;s:9:"allergens";i:14;s:14:"allergenObject";a:5:{i:2;i:5;i:29;i:8;i:15;i:10;i:21;i:5;i:3;i:2;}}'),
(99, 99, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:18;s:11:"ingredients";i:21;s:9:"allergens";i:11;s:14:"allergenObject";a:7:{i:10;i:5;i:4;i:7;i:28;i:8;i:18;i:5;i:17;i:5;i:3;i:2;i:24;i:4;}}'),
(100, 100, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(101, 101, 'a:5:{s:5:"price";i:13;s:4:"kcal";i:1;s:11:"ingredients";i:3;s:9:"allergens";i:8;s:14:"allergenObject";a:5:{i:21;i:10;i:4;i:0;i:26;i:9;i:19;i:2;i:11;i:8;}}'),
(102, 102, 'a:5:{s:5:"price";i:14;s:4:"kcal";i:1;s:11:"ingredients";i:11;s:9:"allergens";i:11;s:14:"allergenObject";a:3:{i:30;i:2;i:17;i:9;i:4;i:1;}}'),
(103, 103, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(104, 104, 'a:5:{s:5:"price";i:1;s:4:"kcal";i:5;s:11:"ingredients";i:14;s:9:"allergens";i:4;s:14:"allergenObject";a:5:{i:9;i:3;i:30;i:0;i:23;i:5;i:3;i:8;i:29;i:3;}}'),
(105, 105, 'a:5:{s:5:"price";i:1;s:4:"kcal";i:14;s:11:"ingredients";i:20;s:9:"allergens";i:3;s:14:"allergenObject";a:2:{i:4;i:3;i:27;i:9;}}'),
(106, 106, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(107, 107, 'a:5:{s:5:"price";i:10;s:4:"kcal";i:24;s:11:"ingredients";i:9;s:9:"allergens";i:2;s:14:"allergenObject";a:6:{i:10;i:1;i:26;i:0;i:17;i:0;i:15;i:10;i:20;i:5;i:4;i:8;}}'),
(108, 108, 'a:5:{s:5:"price";i:4;s:4:"kcal";i:6;s:11:"ingredients";i:20;s:9:"allergens";i:10;s:14:"allergenObject";a:7:{i:30;i:6;i:12;i:4;i:22;i:4;i:5;i:5;i:14;i:8;i:16;i:6;i:19;i:10;}}'),
(109, 109, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(110, 110, 'a:5:{s:5:"price";i:10;s:4:"kcal";i:15;s:11:"ingredients";i:21;s:9:"allergens";i:1;s:14:"allergenObject";a:4:{i:24;i:8;i:2;i:0;i:9;i:6;i:8;i:8;}}'),
(111, 111, 'a:5:{s:5:"price";i:8;s:4:"kcal";i:20;s:11:"ingredients";i:23;s:9:"allergens";i:16;s:14:"allergenObject";a:3:{i:24;i:6;i:1;i:5;i:3;i:9;}}'),
(112, 112, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(113, 113, 'a:5:{s:5:"price";i:8;s:4:"kcal";i:22;s:11:"ingredients";i:11;s:9:"allergens";i:13;s:14:"allergenObject";a:5:{i:26;i:10;i:15;i:6;i:16;i:10;i:28;i:5;i:19;i:10;}}'),
(114, 114, 'a:5:{s:5:"price";i:2;s:4:"kcal";i:17;s:11:"ingredients";i:1;s:9:"allergens";i:3;s:14:"allergenObject";a:3:{i:28;i:3;i:22;i:7;i:13;i:8;}}'),
(115, 115, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(116, 116, 'a:5:{s:5:"price";i:6;s:4:"kcal";i:1;s:11:"ingredients";i:18;s:9:"allergens";i:14;s:14:"allergenObject";a:7:{i:19;i:8;i:28;i:8;i:17;i:1;i:8;i:4;i:21;i:9;i:4;i:4;i:30;i:7;}}'),
(117, 117, 'a:5:{s:5:"price";i:1;s:4:"kcal";i:5;s:11:"ingredients";i:3;s:9:"allergens";i:2;s:14:"allergenObject";a:3:{i:12;i:3;i:18;i:6;i:9;i:6;}}'),
(118, 118, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(119, 119, 'a:5:{s:5:"price";i:14;s:4:"kcal";i:5;s:11:"ingredients";i:11;s:9:"allergens";i:12;s:14:"allergenObject";a:6:{i:16;i:6;i:12;i:4;i:19;i:3;i:29;i:6;i:22;i:0;i:25;i:10;}}'),
(120, 120, 'a:5:{s:5:"price";i:14;s:4:"kcal";i:12;s:11:"ingredients";i:7;s:9:"allergens";i:8;s:14:"allergenObject";a:6:{i:22;i:10;i:15;i:3;i:28;i:2;i:4;i:2;i:9;i:1;i:17;i:8;}}'),
(121, 121, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(122, 122, 'a:5:{s:5:"price";i:6;s:4:"kcal";i:25;s:11:"ingredients";i:8;s:9:"allergens";i:12;s:14:"allergenObject";a:2:{i:10;i:1;i:23;i:10;}}'),
(123, 123, 'a:5:{s:5:"price";i:9;s:4:"kcal";i:9;s:11:"ingredients";i:22;s:9:"allergens";i:11;s:14:"allergenObject";a:3:{i:12;i:5;i:18;i:1;i:2;i:10;}}'),
(124, 124, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(125, 125, 'a:5:{s:5:"price";i:9;s:4:"kcal";i:22;s:11:"ingredients";i:2;s:9:"allergens";i:3;s:14:"allergenObject";a:4:{i:4;i:1;i:25;i:4;i:22;i:10;i:2;i:6;}}'),
(126, 126, 'a:5:{s:5:"price";i:9;s:4:"kcal";i:3;s:11:"ingredients";i:12;s:9:"allergens";i:0;s:14:"allergenObject";a:3:{i:28;i:5;i:19;i:4;i:24;i:3;}}'),
(127, 127, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(128, 128, 'a:5:{s:5:"price";i:2;s:4:"kcal";i:19;s:11:"ingredients";i:11;s:9:"allergens";i:7;s:14:"allergenObject";a:6:{i:12;i:1;i:9;i:6;i:10;i:5;i:13;i:6;i:5;i:10;i:14;i:4;}}'),
(129, 129, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:4;s:11:"ingredients";i:8;s:9:"allergens";i:3;s:14:"allergenObject";a:4:{i:17;i:5;i:2;i:0;i:18;i:9;i:3;i:2;}}'),
(130, 130, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(131, 131, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:13;s:11:"ingredients";i:4;s:9:"allergens";i:7;s:14:"allergenObject";a:4:{i:19;i:9;i:12;i:4;i:4;i:5;i:27;i:8;}}'),
(132, 132, 'a:5:{s:5:"price";i:5;s:4:"kcal";i:24;s:11:"ingredients";i:2;s:9:"allergens";i:1;s:14:"allergenObject";a:5:{i:10;i:1;i:28;i:0;i:4;i:7;i:23;i:3;i:26;i:2;}}'),
(133, 133, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(134, 134, 'a:5:{s:5:"price";i:4;s:4:"kcal";i:18;s:11:"ingredients";i:21;s:9:"allergens";i:12;s:14:"allergenObject";a:4:{i:30;i:1;i:1;i:6;i:23;i:9;i:10;i:4;}}'),
(135, 135, 'a:5:{s:5:"price";i:9;s:4:"kcal";i:14;s:11:"ingredients";i:10;s:9:"allergens";i:8;s:14:"allergenObject";a:3:{i:5;i:8;i:2;i:3;i:18;i:3;}}'),
(136, 136, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(137, 137, 'a:5:{s:5:"price";i:14;s:4:"kcal";i:9;s:11:"ingredients";i:15;s:9:"allergens";i:10;s:14:"allergenObject";a:6:{i:5;i:8;i:11;i:7;i:30;i:4;i:17;i:0;i:16;i:6;i:1;i:3;}}'),
(138, 138, 'a:5:{s:5:"price";i:4;s:4:"kcal";i:18;s:11:"ingredients";i:21;s:9:"allergens";i:3;s:14:"allergenObject";a:7:{i:14;i:5;i:24;i:2;i:20;i:9;i:8;i:10;i:30;i:3;i:29;i:1;i:28;i:6;}}'),
(139, 139, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(140, 140, 'a:5:{s:5:"price";i:9;s:4:"kcal";i:21;s:11:"ingredients";i:14;s:9:"allergens";i:7;s:14:"allergenObject";a:3:{i:5;i:10;i:4;i:9;i:9;i:3;}}'),
(141, 141, 'a:5:{s:5:"price";i:1;s:4:"kcal";i:20;s:11:"ingredients";i:12;s:9:"allergens";i:6;s:14:"allergenObject";a:2:{i:25;i:8;i:15;i:7;}}'),
(142, 142, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(143, 143, 'a:5:{s:5:"price";i:7;s:4:"kcal";i:13;s:11:"ingredients";i:3;s:9:"allergens";i:6;s:14:"allergenObject";a:4:{i:24;i:2;i:4;i:7;i:2;i:6;i:20;i:9;}}'),
(144, 144, 'a:5:{s:5:"price";i:11;s:4:"kcal";i:1;s:11:"ingredients";i:12;s:9:"allergens";i:4;s:14:"allergenObject";a:7:{i:2;i:0;i:25;i:7;i:24;i:0;i:11;i:10;i:27;i:1;i:17;i:9;i:9;i:3;}}'),
(145, 145, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(146, 146, 'a:5:{s:5:"price";i:6;s:4:"kcal";i:0;s:11:"ingredients";i:21;s:9:"allergens";i:6;s:14:"allergenObject";a:2:{i:24;i:9;i:29;i:6;}}'),
(147, 147, 'a:5:{s:5:"price";i:13;s:4:"kcal";i:4;s:11:"ingredients";i:18;s:9:"allergens";i:9;s:14:"allergenObject";a:4:{i:18;i:4;i:4;i:7;i:1;i:4;i:23;i:1;}}'),
(148, 148, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(149, 149, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:20;s:11:"ingredients";i:17;s:9:"allergens";i:7;s:14:"allergenObject";a:6:{i:5;i:7;i:18;i:4;i:28;i:4;i:25;i:5;i:30;i:10;i:20;i:6;}}'),
(150, 150, 'a:5:{s:5:"price";i:13;s:4:"kcal";i:25;s:11:"ingredients";i:15;s:9:"allergens";i:8;s:14:"allergenObject";a:3:{i:4;i:9;i:23;i:7;i:18;i:5;}}'),
(151, 151, 'a:5:{s:5:"price";i:0;s:4:"kcal";i:0;s:11:"ingredients";i:0;s:9:"allergens";i:0;s:14:"allergenObject";a:0:{}}'),
(152, 152, 'a:5:{s:5:"price";s:1:"0";s:4:"kcal";s:1:"0";s:11:"ingredients";s:1:"0";s:9:"allergens";s:2:"14";s:14:"allergenObject";a:4:{i:1;s:1:"1";i:4;s:1:"1";i:5;s:1:"5";i:6;s:1:"3";}}'),
(153, 153, 'a:5:{s:5:"price";s:1:"0";s:4:"kcal";s:1:"0";s:11:"ingredients";s:1:"0";s:9:"allergens";s:2:"14";s:14:"allergenObject";a:4:{i:1;s:1:"1";i:4;s:1:"1";i:5;s:1:"5";i:6;s:1:"3";}}'),
(154, 154, 'a:5:{s:5:"price";s:1:"0";s:4:"kcal";s:1:"0";s:11:"ingredients";s:1:"0";s:9:"allergens";s:2:"14";s:14:"allergenObject";a:4:{i:1;s:1:"1";i:4;s:1:"1";i:5;s:1:"5";i:6;s:1:"3";}}'),
(155, 155, 'a:5:{s:5:"price";s:1:"0";s:4:"kcal";s:1:"0";s:11:"ingredients";s:1:"0";s:9:"allergens";s:2:"14";s:14:"allergenObject";a:4:{i:1;s:1:"1";i:4;s:1:"1";i:5;s:1:"5";i:6;s:1:"3";}}'),
(156, 156, 'a:5:{s:5:"price";s:1:"0";s:4:"kcal";s:1:"0";s:11:"ingredients";s:1:"0";s:9:"allergens";s:2:"14";s:14:"allergenObject";a:4:{i:1;s:1:"1";i:4;s:1:"1";i:5;s:1:"5";i:6;s:1:"3";}}'),
(157, 157, 'a:5:{s:5:"price";s:1:"0";s:4:"kcal";s:1:"0";s:11:"ingredients";s:1:"0";s:9:"allergens";s:2:"14";s:14:"allergenObject";a:4:{i:1;s:1:"1";i:4;s:1:"1";i:5;s:1:"5";i:6;s:1:"3";}}'),
(158, 158, 'a:4:{s:5:"price";s:1:"0";s:4:"kcal";s:1:"0";s:11:"ingredients";s:1:"0";s:9:"allergens";s:1:"0";}');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_filter_description`
--

INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES
(1, 1, 1, '0-10$'),
(2, 1, 1, '11-20$'),
(1, 2, 1, '0-10$'),
(2, 2, 1, '11-20$'),
(1, 3, 1, '0-10$'),
(2, 3, 1, '11-20$');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_group`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `oc_filter_group`
--

INSERT INTO `oc_filter_group` (`filter_group_id`, `sort_order`) VALUES
(1, 0),
(2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_filter_group_description`
--

INSERT INTO `oc_filter_group_description` (`filter_group_id`, `language_id`, `name`) VALUES
(1, 1, 'Price'),
(1, 2, 'Price'),
(1, 3, 'Price'),
(2, 2, 'ingridients'),
(2, 1, 'ingridients'),
(2, 3, 'ingridients');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information`
--

CREATE TABLE IF NOT EXISTS `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_description`
--

CREATE TABLE IF NOT EXISTS `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `image`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 1, 'About Us', '&lt;p&gt;\r\n	About Us тфырдволар фдолыврадол фырдвлаор долфывар&lt;/p&gt;\r\n', NULL, 'About Us', '', ''),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', NULL, 'Terms &amp; Conditions', '', ''),
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', NULL, 'Privacy Policy', '', ''),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', NULL, 'Delivery Information', '', ''),
(5, 2, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', NULL, 'Terms &amp; Conditions', '', ''),
(3, 2, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', NULL, 'Privacy Policy', '', ''),
(6, 2, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', NULL, 'Delivery Information', '', ''),
(4, 2, 'About Us', '&lt;p&gt;\r\n	About Us asndfjka;skdf;kaj жывлоар жфлыорвалдор&amp;nbsp;&lt;/p&gt;\r\n', NULL, 'About Us', '', ''),
(5, 3, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', NULL, 'Terms &amp; Conditions', '', ''),
(3, 3, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', NULL, 'Privacy Policy', '', ''),
(6, 3, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', NULL, 'Delivery Information', '', ''),
(4, 3, 'About Us', '&lt;p&gt;\r\n	About Usa askdfljkahsl jkdfhlaksj врадлофр slkdjhflskajhdfl лофрдваол&lt;/p&gt;\r\n', NULL, 'About Us', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(4, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_language`
--

CREATE TABLE IF NOT EXISTS `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'English', 'en-gb', 'en-US,en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 1, 1),
(2, 'Deutsch (German)', 'de-DE', 'de,de-DE,de_DE,de_DE.UTF-8,de-de,de-AT,de-CH,german', 'de-DE.png', '', 1, 1),
(3, 'Русский (Russian)', 'ru-RU', 'ru_RU.UTF-8,ru_RU,ru-gb,russian', 'ru-RU.png', '', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout`
--

CREATE TABLE IF NOT EXISTS `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout_module`
--

CREATE TABLE IF NOT EXISTS `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=75 ;

--
-- Дамп данных таблицы `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'affiliate', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(67, 1, 'carousel.29', 'content_top', 3),
(66, 1, 'slideshow.27', 'content_top', 1),
(65, 1, 'featured.28', 'content_top', 2),
(74, 3, 'banner.30', 'content_top', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout_route`
--

CREATE TABLE IF NOT EXISTS `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- Дамп данных таблицы `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(57, 3, 0, 'product/category'),
(42, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_length_class`
--

CREATE TABLE IF NOT EXISTS `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_length_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in'),
(1, 2, 'Centimeter', 'cm'),
(2, 2, 'Millimeter', 'mm'),
(3, 2, 'Inch', 'in'),
(1, 3, 'Centimeter', 'cm'),
(2, 3, 'Millimeter', 'mm'),
(3, 3, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_location`
--

CREATE TABLE IF NOT EXISTS `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_marketing`
--

CREATE TABLE IF NOT EXISTS `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_megamenu`
--

CREATE TABLE IF NOT EXISTS `oc_megamenu` (
  `megamenu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `is_group` smallint(6) NOT NULL DEFAULT '2',
  `width` varchar(255) DEFAULT NULL,
  `submenu_width` varchar(255) DEFAULT NULL,
  `colum_width` varchar(255) DEFAULT NULL,
  `submenu_colum_width` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `colums` varchar(255) DEFAULT '1',
  `type` varchar(255) NOT NULL,
  `is_content` smallint(6) NOT NULL DEFAULT '2',
  `show_title` smallint(6) NOT NULL DEFAULT '1',
  `type_submenu` varchar(10) NOT NULL DEFAULT '1',
  `level_depth` smallint(6) NOT NULL DEFAULT '0',
  `published` smallint(6) NOT NULL DEFAULT '1',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position` int(11) unsigned NOT NULL DEFAULT '0',
  `show_sub` smallint(6) NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(25) DEFAULT NULL,
  `privacy` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_type` varchar(25) DEFAULT 'top',
  `menu_class` varchar(25) DEFAULT NULL,
  `description` text,
  `content_text` text,
  `submenu_content` text,
  `level` int(11) NOT NULL,
  `left` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  `widget_id` int(11) DEFAULT '0',
  `badges` text,
  PRIMARY KEY (`megamenu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- Дамп данных таблицы `oc_megamenu`
--

INSERT INTO `oc_megamenu` (`megamenu_id`, `image`, `parent_id`, `is_group`, `width`, `submenu_width`, `colum_width`, `submenu_colum_width`, `item`, `colums`, `type`, `is_content`, `show_title`, `type_submenu`, `level_depth`, `published`, `store_id`, `position`, `show_sub`, `url`, `target`, `privacy`, `position_type`, `menu_class`, `description`, `content_text`, `submenu_content`, `level`, `left`, `right`, `widget_id`, `badges`) VALUES
(42, '', 1, 0, NULL, NULL, NULL, '', '', '1', 'url', 0, 1, 'menu', 0, 1, 0, 1, 0, '?route=common/home', NULL, 0, 'top', 'home', NULL, '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 0, 0, 0, 1, NULL),
(43, '', 1, 0, NULL, NULL, NULL, NULL, '25', '1', 'category', 2, 1, 'menu', 0, 1, 0, 4, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1, NULL),
(44, '', 1, 0, NULL, NULL, NULL, NULL, '20', '1', 'category', 2, 1, 'menu', 0, 1, 0, 2, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1, NULL),
(45, '', 1, 0, NULL, NULL, NULL, NULL, '24', '1', 'category', 2, 1, 'menu', 0, 1, 0, 3, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1, NULL),
(47, '', 1, 0, NULL, NULL, NULL, NULL, '17', '1', 'category', 2, 1, 'menu', 0, 1, 0, 5, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1, NULL),
(48, '', 1, 0, NULL, NULL, NULL, NULL, '33', '1', 'category', 2, 1, 'menu', 0, 1, 0, 6, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1, NULL),
(49, '', 47, 0, NULL, NULL, NULL, NULL, '34', '1', 'category', 2, 1, 'menu', 0, 1, 0, 2, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1, NULL),
(50, '', 47, 0, NULL, NULL, NULL, NULL, '57', '1', 'category', 2, 1, 'menu', 0, 1, 0, 7, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1, NULL),
(57, '', 47, 0, NULL, NULL, NULL, NULL, '32', '1', 'category', 2, 1, 'menu', 0, 1, 0, 4, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1, NULL),
(59, '', 47, 0, NULL, NULL, NULL, NULL, '29', '1', 'category', 2, 1, 'menu', 0, 1, 0, 5, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, 0, 0, 0, 1, NULL),
(60, '', 1, 0, NULL, NULL, NULL, '', '', '1', 'url', 0, 1, 'menu', 0, 1, 0, 7, 0, '?route=pavblog/blogs', NULL, 0, 'top', '', NULL, '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 0, 0, 0, 1, NULL),
(61, '', 1, 0, NULL, NULL, NULL, '', '', '1', 'url', 0, 1, 'menu', 0, 1, 0, 99, 0, '', NULL, 0, 'top', '', NULL, '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 0, 0, 0, 1, '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_megamenu_description`
--

CREATE TABLE IF NOT EXISTS `oc_megamenu_description` (
  `megamenu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`megamenu_id`,`language_id`),
  KEY `name` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_megamenu_description`
--

INSERT INTO `oc_megamenu_description` (`megamenu_id`, `language_id`, `title`, `description`) VALUES
(42, 2, 'منزل', ''),
(42, 1, 'Home', ''),
(59, 2, 'Mice and Trackballs', ''),
(59, 1, 'Mice and Trackballs', ''),
(61, 2, '', ''),
(57, 2, 'Web Cameras', ''),
(57, 1, 'Web Cameras', ''),
(61, 1, '', ''),
(44, 1, 'Breakfast', ''),
(60, 1, 'Blog', ''),
(60, 2, 'بلوق', ''),
(50, 2, 'فيتامين', ''),
(50, 1, 'vitamin', ''),
(49, 2, 'نبيذ', ''),
(49, 1, 'wine', ''),
(48, 2, 'المواطنين', ''),
(48, 1, 'Burgers', ''),
(47, 2, 'مشروبات', ''),
(47, 1, 'Drinks', ''),
(45, 2, 'دجاج', ''),
(45, 1, 'Chicken', ''),
(44, 2, 'الإفطار', ''),
(43, 2, 'صلاح الدين', ''),
(43, 1, 'Salads', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_megamenu_widgets`
--

CREATE TABLE IF NOT EXISTS `oc_megamenu_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `type` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Дамп данных таблицы `oc_megamenu_widgets`
--

INSERT INTO `oc_megamenu_widgets` (`id`, `name`, `type`, `params`, `store_id`) VALUES
(1, 'Video Opencart Installation', 'video_code', 'a:1:{s:10:"video_code";s:168:"&lt;iframe width=&quot;300&quot; height=&quot;315&quot; src=&quot;//www.youtube.com/embed/cUhPA5qIxDQ&quot; frameborder=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;";}', 0),
(2, 'Demo HTML Sample', 'html', 'a:1:{s:4:"html";a:1:{i:1;s:275:"Dorem ipsum dolor sit amet consectetur adipiscing elit congue sit amet erat roin tincidunt vehicula lorem in adipiscing urna iaculis vel. Dorem ipsum dolor sit amet consectetur adipiscing elit congue sit amet erat roin tincidunt vehicula lorem in adipiscing urna iaculis vel.";}}', 0),
(3, 'Products Latest', 'product_list', 'a:4:{s:9:"list_type";s:6:"newest";s:5:"limit";s:1:"6";s:11:"image_width";s:3:"120";s:12:"image_height";s:3:"120";}', 0),
(4, 'Products In Cat 20', 'product_category', 'a:4:{s:11:"category_id";s:2:"20";s:5:"limit";s:1:"6";s:11:"image_width";s:3:"120";s:12:"image_height";s:3:"120";}', 0),
(5, 'Manufactures', 'banner', 'a:4:{s:8:"group_id";s:1:"8";s:11:"image_width";s:2:"80";s:12:"image_height";s:2:"80";s:5:"limit";s:2:"12";}', 0),
(6, 'PavoThemes Feed', 'feed', 'a:1:{s:8:"feed_url";s:55:"http://www.pavothemes.com/opencart-themes.feed?type=rss";}', 0),
(16, '', 'product', 'a:10:{s:4:"wkey";s:2:"16";s:5:"wtype";s:7:"product";s:11:"widget_name";s:0:"";s:10:"show_title";s:1:"1";s:14:"widget_title_1";s:14:"Latest Produce";s:14:"widget_title_2";s:14:"Latest Produce";s:12:"addition_cls";s:0:"";s:10:"product_id";s:2:"28";s:11:"image_width";s:3:"200";s:12:"image_height";s:3:"236";}', 0),
(8, '', 'html', 'a:9:{s:4:"wkey";s:1:"8";s:5:"wtype";s:4:"html";s:11:"widget_name";s:0:"";s:10:"show_title";s:1:"1";s:14:"widget_title_1";s:8:"Articles";s:14:"widget_title_2";s:8:"Articles";s:12:"addition_cls";s:0:"";s:13:"htmlcontent_1";s:203:"&lt;p&gt;&lt;img src=&quot;image/catalog/demo/img-menu.jpg&quot; alt=&quot;food&quot;&gt;&lt;/p&gt;&lt;p&gt;Fusce a congue purus, sit amet sollicitudin libero. In hac habitasse platea dictumst.&lt;/p&gt;";s:13:"htmlcontent_2";s:203:"&lt;p&gt;&lt;img src=&quot;image/catalog/demo/img-menu.jpg&quot; alt=&quot;food&quot;&gt;&lt;/p&gt;&lt;p&gt;Fusce a congue purus, sit amet sollicitudin libero. In hac habitasse platea dictumst.&lt;/p&gt;";}', 0),
(17, '', 'product_category', 'a:12:{s:4:"wkey";s:2:"17";s:5:"wtype";s:16:"product_category";s:11:"widget_name";s:0:"";s:10:"show_title";s:1:"1";s:14:"widget_title_1";s:16:"Products Special";s:14:"widget_title_2";s:16:"Products Special";s:12:"addition_cls";s:0:"";s:11:"category_id";s:2:"20";s:5:"limit";s:1:"4";s:6:"column";s:1:"1";s:11:"image_width";s:2:"80";s:12:"image_height";s:2:"95";}', 0),
(10, '', 'sub_categories', 'a:9:{s:4:"wkey";s:2:"10";s:5:"wtype";s:14:"sub_categories";s:11:"widget_name";s:0:"";s:10:"show_title";s:1:"1";s:14:"widget_title_1";s:8:"Category";s:14:"widget_title_2";s:8:"Category";s:12:"addition_cls";s:0:"";s:11:"category_id";s:2:"25";s:5:"limit";s:1:"7";}', 0),
(15, '', 'html', 'a:9:{s:4:"wkey";s:2:"15";s:5:"wtype";s:4:"html";s:11:"widget_name";s:0:"";s:10:"show_title";s:1:"1";s:14:"widget_title_1";s:0:"";s:14:"widget_title_2";s:0:"";s:12:"addition_cls";s:0:"";s:13:"htmlcontent_1";s:150:"&lt;p&gt;The Quickstart Package consists on a complete Opencart! + Template + Various Extensions + Sample Content, excellent for beginner...&lt;/p&gt;";s:13:"htmlcontent_2";s:150:"&lt;p&gt;The Quickstart Package consists on a complete Opencart! + Template + Various Extensions + Sample Content, excellent for beginner...&lt;/p&gt;";}', 0),
(13, '', 'image', 'a:13:{s:4:"wkey";s:2:"13";s:5:"wtype";s:5:"image";s:11:"widget_name";s:0:"";s:10:"show_title";s:1:"1";s:14:"widget_title_1";s:0:"";s:14:"widget_title_2";s:0:"";s:12:"addition_cls";s:0:"";s:9:"imagefile";s:29:"catalog/demo/img-category.jpg";s:4:"size";s:0:"";s:9:"animation";s:1:"1";s:9:"alignment";s:6:"center";s:7:"ispopup";s:1:"1";s:4:"link";s:0:"";}', 0),
(14, '', 'video', 'a:12:{s:4:"wkey";s:2:"14";s:5:"wtype";s:5:"video";s:11:"widget_name";s:0:"";s:10:"show_title";s:1:"1";s:14:"widget_title_1";s:27:"Video Opencart Installation";s:14:"widget_title_2";s:27:"Video Opencart Installation";s:12:"addition_cls";s:0:"";s:10:"video_link";s:40:"http://www.youtube.com/embed/fNEepYl3LAk";s:5:"width";s:3:"400";s:6:"height";s:3:"210";s:9:"subinfo_1";s:3:"300";s:9:"subinfo_2";s:3:"300";}', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_menu`
--

CREATE TABLE IF NOT EXISTS `oc_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `type` varchar(6) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_menu_description`
--

CREATE TABLE IF NOT EXISTS `oc_menu_description` (
  `menu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`menu_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_menu_module`
--

CREATE TABLE IF NOT EXISTS `oc_menu_module` (
  `menu_module_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`menu_module_id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_modification`
--

CREATE TABLE IF NOT EXISTS `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_module`
--

CREATE TABLE IF NOT EXISTS `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Дамп данных таблицы `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category page', 'banner', '{"name":"Category page","banner_id":"7","width":"750","height":"350","status":"1"}'),
(29, 'Home Page', 'carousel', '{"name":"Home Page","banner_id":"8","width":"130","height":"100","status":"1"}'),
(28, 'Home Page', 'featured', '{"name":"Home Page","product":["43","40","42","30"],"limit":"4","width":"200","height":"200","status":"1"}'),
(27, 'Home Page', 'slideshow', '{"name":"Home Page","banner_id":"7","width":"1140","height":"380","status":"1"}');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option`
--

CREATE TABLE IF NOT EXISTS `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(1, 2, 'Radio'),
(2, 2, 'Checkbox'),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 2, 'Select'),
(9, 2, 'Time'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(11, 2, 'Size'),
(1, 3, 'Radio'),
(2, 3, 'Checkbox'),
(4, 3, 'Text'),
(6, 3, 'Textarea'),
(8, 3, 'Date'),
(7, 3, 'File'),
(5, 3, 'Select'),
(9, 3, 'Time'),
(10, 3, 'Date &amp; Time'),
(12, 3, 'Delivery Date'),
(11, 3, 'Size');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Дамп данных таблицы `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(43, 2, 1, 'Large'),
(32, 2, 1, 'Small'),
(45, 2, 2, 'Checkbox 4'),
(44, 2, 2, 'Checkbox 3'),
(31, 2, 1, 'Medium'),
(42, 2, 5, 'Yellow'),
(41, 2, 5, 'Green'),
(39, 2, 5, 'Red'),
(40, 2, 5, 'Blue'),
(23, 2, 2, 'Checkbox 1'),
(24, 2, 2, 'Checkbox 2'),
(48, 2, 11, 'Large'),
(47, 2, 11, 'Medium'),
(46, 2, 11, 'Small'),
(43, 3, 1, 'Large'),
(32, 3, 1, 'Small'),
(45, 3, 2, 'Checkbox 4'),
(44, 3, 2, 'Checkbox 3'),
(31, 3, 1, 'Medium'),
(42, 3, 5, 'Yellow'),
(41, 3, 5, 'Green'),
(39, 3, 5, 'Red'),
(40, 3, 5, 'Blue'),
(23, 3, 2, 'Checkbox 1'),
(24, 3, 2, 'Checkbox 2'),
(48, 3, 11, 'Large'),
(47, 3, 11, 'Medium'),
(46, 3, 11, 'Small');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order`
--

CREATE TABLE IF NOT EXISTS `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_orderenchi`
--

CREATE TABLE IF NOT EXISTS `oc_orderenchi` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) NOT NULL,
  `payment_method` tinyint(11) NOT NULL DEFAULT '1',
  `total` decimal(15,4) DEFAULT NULL,
  `order_status_id` int(11) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=159 ;

--
-- Дамп данных таблицы `oc_orderenchi`
--

INSERT INTO `oc_orderenchi` (`order_id`, `table_id`, `payment_method`, `total`, `order_status_id`, `date_added`, `date_modified`) VALUES
(1, 13, 1, '61.5000', 5, '2016-11-21 15:34:23', '2016-11-21 15:34:23'),
(2, 19, 1, '56.1000', 5, '2016-12-21 15:34:23', '2016-12-21 15:34:23'),
(3, 27, 1, '17.5000', 4, '2016-11-16 15:34:23', '2016-11-16 15:34:23'),
(4, 15, 2, '117.3000', 3, '2016-11-28 15:34:23', '2016-11-28 15:34:23'),
(5, 23, 2, '48.8000', 4, '2016-12-14 15:34:23', '2016-12-14 15:34:23'),
(6, 13, 2, '41.7000', 2, '2016-11-18 15:34:23', '2016-11-18 15:34:23'),
(7, 25, 2, '368.6000', 3, '2016-12-01 15:34:23', '2016-12-01 15:34:23'),
(8, 14, 2, '394.2000', 4, '2016-12-15 15:34:23', '2016-12-15 15:34:23'),
(9, 14, 1, '27.1000', 4, '2016-12-14 15:34:23', '2016-12-14 15:34:23'),
(10, 18, 2, '337.6000', 3, '2016-12-10 15:34:23', '2016-12-10 15:34:23'),
(11, 28, 1, '215.4000', 3, '2016-12-10 15:34:23', '2016-12-10 15:34:23'),
(12, 27, 1, '55.5000', 1, '2016-11-22 15:34:23', '2016-11-22 15:34:23'),
(13, 6, 2, '31.7000', 2, '2016-12-08 15:34:23', '2016-12-08 15:34:23'),
(14, 30, 1, '136.8000', 2, '2016-12-22 15:34:23', '2016-12-22 15:34:23'),
(15, 30, 2, '25.2000', 1, '2016-12-05 15:34:23', '2016-12-05 15:34:23'),
(16, 7, 1, '111.6000', 5, '2016-11-18 15:34:23', '2016-11-18 15:34:23'),
(17, 22, 2, '289.3000', 3, '2016-12-20 15:34:23', '2016-12-20 15:34:23'),
(18, 9, 1, '368.6000', 1, '2016-11-16 15:34:23', '2016-11-16 15:34:23'),
(19, 2, 1, '203.8000', 5, '2016-12-15 15:34:23', '2016-12-15 15:34:23'),
(20, 2, 1, '165.9000', 1, '2016-12-09 15:34:23', '2016-12-09 15:34:23'),
(21, 27, 2, '28.8000', 1, '2016-11-20 15:34:23', '2016-11-20 15:34:23'),
(22, 1, 2, '108.6000', 3, '2016-11-26 15:34:23', '2016-11-26 15:34:23'),
(23, 6, 1, '590.2000', 2, '2016-12-15 15:34:23', '2016-12-15 15:34:23'),
(24, 25, 2, '77.1000', 5, '2016-12-13 15:34:23', '2016-12-13 15:34:23'),
(25, 5, 2, '167.7000', 4, '2016-11-17 15:34:23', '2016-11-17 15:34:23'),
(26, 14, 2, '21.7000', 5, '2016-11-21 15:34:23', '2016-11-21 15:34:23'),
(27, 4, 1, '92.5000', 3, '2016-12-16 15:34:23', '2016-12-16 15:34:23'),
(28, 12, 2, '281.3000', 5, '2016-12-01 15:34:23', '2016-12-01 15:34:23'),
(29, 24, 1, '226.4000', 4, '2016-11-21 15:34:23', '2016-11-21 15:34:23'),
(30, 28, 1, '230.1000', 5, '2016-12-15 15:34:23', '2016-12-15 15:34:23'),
(31, 29, 2, '256.4000', 5, '2016-12-21 15:34:23', '2016-12-21 15:34:23'),
(32, 23, 2, '65.6000', 5, '2016-12-20 15:34:23', '2016-12-20 15:34:23'),
(33, 6, 2, '91.5000', 5, '2016-11-21 15:34:23', '2016-11-21 15:34:23'),
(34, 10, 1, '622.8000', 2, '2016-12-07 15:34:23', '2016-12-07 15:34:23'),
(35, 14, 1, '149.9000', 3, '2016-12-03 15:34:23', '2016-12-03 15:34:23'),
(36, 22, 2, '260.7000', 1, '2016-12-22 15:34:23', '2016-12-22 15:34:23'),
(37, 1, 1, '25.4000', 2, '2016-12-15 15:34:23', '2016-12-15 15:34:23'),
(38, 14, 2, '261.5000', 1, '2016-12-17 15:34:23', '2016-12-17 15:34:23'),
(39, 23, 1, '189.3000', 2, '2016-11-30 15:34:23', '2016-11-30 15:34:23'),
(40, 3, 1, '330.5000', 3, '2016-11-27 15:34:23', '2016-11-27 15:34:23'),
(41, 24, 2, '100.6000', 2, '2016-11-25 15:34:23', '2016-11-25 15:34:23'),
(42, 29, 1, '214.3000', 1, '2016-11-25 15:34:23', '2016-11-25 15:34:23'),
(43, 25, 1, '155.0000', 2, '2016-12-02 15:34:23', '2016-12-02 15:34:23'),
(44, 11, 2, '330.7000', 1, '2016-12-04 15:34:23', '2016-12-04 15:34:23'),
(45, 3, 1, '324.1000', 4, '2016-11-21 15:34:23', '2016-11-21 15:34:23'),
(46, 12, 1, '109.3000', 2, '2016-11-29 15:34:23', '2016-11-29 15:34:23'),
(47, 25, 2, '244.2000', 1, '2016-12-13 15:34:23', '2016-12-13 15:34:23'),
(48, 28, 2, '82.5000', 1, '2016-12-18 15:34:23', '2016-12-18 15:34:23'),
(49, 7, 1, '318.6000', 5, '2016-12-16 15:34:23', '2016-12-16 15:34:23'),
(50, 15, 2, '90.2000', 5, '2016-12-09 15:34:23', '2016-12-09 15:34:23'),
(51, 27, 1, '117.1000', 5, '2016-12-09 15:34:23', '2016-12-09 15:34:23'),
(52, 18, 1, '47.6000', 5, '2016-11-19 15:34:23', '2016-11-19 15:34:23'),
(53, 21, 2, '217.3000', 2, '2016-11-26 15:34:23', '2016-11-26 15:34:23'),
(54, 14, 1, '213.5000', 2, '2016-12-03 15:34:23', '2016-12-03 15:34:23'),
(55, 27, 1, '55.6000', 2, '2016-11-18 15:34:23', '2016-11-18 15:34:23'),
(56, 24, 2, '82.5000', 1, '2016-11-30 15:34:23', '2016-11-30 15:34:23'),
(57, 19, 2, '32.7000', 5, '2016-11-27 15:34:23', '2016-11-27 15:34:23'),
(58, 20, 1, '382.1000', 1, '2016-11-22 15:34:23', '2016-11-22 15:34:23'),
(59, 30, 1, '171.5000', 1, '2016-12-03 15:34:23', '2016-12-03 15:34:23'),
(60, 5, 1, '327.6000', 2, '2016-12-05 15:34:23', '2016-12-05 15:34:23'),
(61, 30, 2, '312.0000', 5, '2016-11-23 15:34:23', '2016-11-23 15:34:23'),
(62, 5, 1, '322.7000', 1, '2016-11-24 15:34:23', '2016-11-24 15:34:23'),
(63, 29, 2, '299.4000', 2, '2016-11-18 15:34:23', '2016-11-18 15:34:23'),
(64, 26, 2, '335.1000', 5, '2016-12-06 15:34:23', '2016-12-06 15:34:23'),
(65, 5, 2, '369.1000', 3, '2016-12-01 15:34:23', '2016-12-01 15:34:23'),
(66, 8, 2, '70.9000', 4, '2016-12-19 15:34:23', '2016-12-19 15:34:23'),
(67, 28, 2, '37.7000', 1, '2016-12-15 15:34:23', '2016-12-15 15:34:23'),
(68, 17, 1, '255.0000', 1, '2016-12-23 15:34:23', '2016-12-23 15:34:23'),
(69, 18, 1, '97.5000', 2, '2016-11-20 15:34:23', '2016-11-20 15:34:23'),
(70, 25, 2, '269.7000', 3, '2016-12-12 15:34:23', '2016-12-12 15:34:23'),
(71, 13, 2, '189.5000', 2, '2016-12-23 15:34:23', '2016-12-23 15:34:23'),
(72, 9, 2, '425.5000', 2, '2016-12-09 15:34:23', '2016-12-09 15:34:23'),
(73, 13, 2, '76.1000', 1, '2016-12-07 15:34:23', '2016-12-07 15:34:23'),
(74, 15, 2, '57.5000', 1, '2016-12-07 15:34:23', '2016-12-07 15:34:23'),
(75, 24, 2, '260.3000', 4, '2016-12-20 15:34:23', '2016-12-20 15:34:23'),
(76, 5, 2, '86.5000', 4, '2016-11-29 15:34:23', '2016-11-29 15:34:23'),
(77, 7, 1, '234.1000', 4, '2016-12-10 15:34:23', '2016-12-10 15:34:23'),
(78, 4, 2, '334.4000', 2, '2016-12-25 15:34:23', '2016-12-25 15:34:23'),
(79, 17, 2, '180.3000', 2, '2016-12-08 15:34:23', '2016-12-08 15:34:23'),
(80, 29, 1, '335.7000', 1, '2016-12-19 15:34:23', '2016-12-19 15:34:23'),
(81, 9, 2, '228.4000', 3, '2016-11-23 15:34:23', '2016-11-23 15:34:23'),
(82, 16, 1, '144.0000', 3, '2016-12-18 15:34:23', '2016-12-18 15:34:23'),
(83, 24, 2, '74.9000', 3, '2016-12-14 15:34:23', '2016-12-14 15:34:23'),
(84, 27, 2, '185.3000', 5, '2016-12-05 15:34:23', '2016-12-05 15:34:23'),
(85, 4, 2, '181.6000', 2, '2016-12-16 15:34:23', '2016-12-16 15:34:23'),
(86, 17, 2, '230.3000', 1, '2016-12-04 15:34:23', '2016-12-04 15:34:23'),
(87, 9, 2, '139.9000', 1, '2016-12-21 15:34:23', '2016-12-21 15:34:23'),
(88, 6, 2, '144.8000', 1, '2016-11-24 15:34:23', '2016-11-24 15:34:23'),
(89, 24, 1, '359.4000', 4, '2016-12-07 15:34:23', '2016-12-07 15:34:23'),
(90, 7, 2, '47.7000', 2, '2016-12-16 15:34:23', '2016-12-16 15:34:23'),
(91, 25, 2, '53.4000', 4, '2016-11-18 15:34:23', '2016-11-18 15:34:23'),
(92, 13, 2, '200.4000', 3, '2016-12-18 15:34:23', '2016-12-18 15:34:23'),
(93, 2, 2, '45.6000', 5, '2016-12-11 15:34:23', '2016-12-11 15:34:23'),
(94, 25, 1, '87.4000', 5, '2016-12-19 15:34:23', '2016-12-19 15:34:23'),
(95, 10, 1, '125.6000', 2, '2016-12-25 15:34:23', '2016-12-25 15:34:23'),
(96, 6, 2, '580.4000', 2, '2016-11-26 15:34:23', '2016-11-26 15:34:23'),
(97, 10, 1, '558.9000', 5, '2016-11-20 15:34:23', '2016-11-20 15:34:23'),
(98, 12, 2, '161.3000', 2, '2016-12-23 15:34:23', '2016-12-23 15:34:23'),
(99, 11, 1, '24.6000', 4, '2016-12-08 15:34:23', '2016-12-08 15:34:23'),
(100, 23, 2, '287.3000', 3, '2016-11-23 15:34:23', '2016-11-23 15:34:23'),
(101, 18, 1, '405.9000', 2, '2016-12-13 15:34:23', '2016-12-13 15:34:23'),
(102, 13, 1, '118.8000', 1, '2016-11-25 15:34:23', '2016-11-25 15:34:23'),
(103, 2, 1, '244.8000', 4, '2016-12-11 15:34:23', '2016-12-11 15:34:23'),
(104, 1, 2, '153.5000', 1, '2016-12-02 15:34:23', '2016-12-02 15:34:23'),
(105, 21, 2, '218.6000', 1, '2016-12-14 15:34:23', '2016-12-14 15:34:23'),
(106, 29, 1, '36.8000', 4, '2016-12-11 15:34:23', '2016-12-11 15:34:23'),
(107, 21, 2, '96.1000', 1, '2016-12-23 15:34:23', '2016-12-23 15:34:23'),
(108, 4, 2, '164.7000', 4, '2016-11-29 15:34:23', '2016-11-29 15:34:23'),
(109, 9, 1, '390.9000', 3, '2016-12-17 15:34:23', '2016-12-17 15:34:23'),
(110, 23, 1, '61.1000', 4, '2016-11-30 15:34:23', '2016-11-30 15:34:23'),
(111, 23, 1, '375.3000', 4, '2016-11-26 15:34:23', '2016-11-26 15:34:23'),
(112, 3, 2, '76.5000', 4, '2016-11-28 15:34:23', '2016-11-28 15:34:23'),
(113, 26, 1, '61.4000', 5, '2016-12-25 15:34:23', '2016-12-25 15:34:23'),
(114, 16, 1, '457.5000', 1, '2016-12-19 15:34:23', '2016-12-19 15:34:23'),
(115, 15, 1, '310.8000', 1, '2016-12-02 15:34:23', '2016-12-02 15:34:23'),
(116, 29, 2, '332.3000', 5, '2016-11-24 15:34:23', '2016-11-24 15:34:23'),
(117, 21, 1, '413.9000', 4, '2016-12-20 15:34:23', '2016-12-20 15:34:23'),
(118, 19, 2, '241.8000', 4, '2016-11-22 15:34:23', '2016-11-22 15:34:23'),
(119, 27, 2, '33.3000', 5, '2016-11-27 15:34:23', '2016-11-27 15:34:23'),
(120, 14, 1, '515.0000', 1, '2016-11-24 15:34:23', '2016-11-24 15:34:23'),
(121, 20, 2, '260.0000', 4, '2016-12-16 15:34:23', '2016-12-16 15:34:23'),
(122, 20, 1, '95.2000', 2, '2016-12-03 15:34:23', '2016-12-03 15:34:23'),
(123, 1, 2, '128.7000', 4, '2016-12-04 15:34:23', '2016-12-04 15:34:23'),
(124, 17, 2, '93.2000', 5, '2016-12-24 15:34:23', '2016-12-24 15:34:23'),
(125, 1, 2, '53.3000', 4, '2016-12-07 15:34:23', '2016-12-07 15:34:23'),
(126, 10, 2, '121.3000', 1, '2016-12-19 15:34:23', '2016-12-19 15:34:23'),
(127, 21, 1, '27.9000', 4, '2016-12-20 15:34:23', '2016-12-20 15:34:23'),
(128, 22, 2, '451.2000', 4, '2016-11-27 15:34:23', '2016-11-27 15:34:23'),
(129, 10, 1, '92.4000', 1, '2016-11-21 15:34:23', '2016-11-21 15:34:23'),
(130, 15, 1, '114.6000', 2, '2016-12-13 15:34:23', '2016-12-13 15:34:23'),
(131, 23, 1, '568.3000', 4, '2016-12-21 15:34:23', '2016-12-21 15:34:23'),
(132, 6, 1, '84.7000', 1, '2016-12-21 15:34:23', '2016-12-21 15:34:23'),
(133, 22, 2, '95.4000', 4, '2016-12-16 15:34:23', '2016-12-16 15:34:23'),
(134, 21, 2, '186.1000', 3, '2016-12-09 15:34:23', '2016-12-09 15:34:23'),
(135, 21, 1, '72.4000', 3, '2016-12-25 15:34:23', '2016-12-25 15:34:23'),
(136, 25, 1, '295.8000', 1, '2016-11-16 15:34:23', '2016-11-16 15:34:23'),
(137, 23, 1, '85.9000', 3, '2016-12-05 15:34:23', '2016-12-05 15:34:23'),
(138, 27, 1, '233.3000', 4, '2016-12-18 15:34:23', '2016-12-18 15:34:23'),
(139, 23, 2, '193.1000', 2, '2016-12-05 15:34:23', '2016-12-05 15:34:23'),
(140, 26, 1, '217.5000', 2, '2016-12-25 15:34:23', '2016-12-25 15:34:23'),
(141, 27, 2, '120.9000', 5, '2016-12-23 15:34:23', '2016-12-23 15:34:23'),
(142, 16, 1, '185.3000', 2, '2016-12-17 15:34:23', '2016-12-17 15:34:23'),
(143, 4, 1, '45.5000', 2, '2016-12-05 15:34:23', '2016-12-05 15:34:23'),
(144, 14, 2, '467.4000', 2, '2016-12-23 15:34:23', '2016-12-23 15:34:23'),
(145, 4, 1, '99.3000', 1, '2016-11-23 15:34:23', '2016-11-23 15:34:23'),
(146, 5, 1, '312.7000', 3, '2016-12-01 15:34:23', '2016-12-01 15:34:23'),
(147, 19, 2, '164.2000', 1, '2016-12-05 15:34:23', '2016-12-05 15:34:23'),
(148, 22, 2, '403.2000', 4, '2016-12-13 15:34:23', '2016-12-13 15:34:23'),
(149, 1, 1, '118.3000', 1, '2016-12-16 15:34:23', '2016-12-16 15:34:23'),
(150, 4, 1, '20.7000', 1, '2016-12-13 15:34:23', '2016-12-13 15:34:23'),
(151, 20, 2, '244.2000', 3, '2016-11-21 15:34:23', '2016-11-21 15:34:23'),
(152, 12, 1, '10.9000', 1, '2016-12-30 11:34:11', '2016-12-30 11:34:11'),
(153, 12, 1, '10.9000', 1, '2016-12-30 11:34:16', '2016-12-30 11:34:16'),
(154, 12, 1, '10.9000', 1, '2016-12-30 11:35:05', '2016-12-30 11:35:05'),
(155, 12, 1, '10.9000', 1, '2016-12-30 11:35:53', '2016-12-30 11:35:53'),
(156, 12, 1, '10.9000', 1, '2016-12-30 11:35:54', '2016-12-30 11:35:54'),
(157, 12, 1, '10.9000', 1, '2016-12-30 11:35:55', '2016-12-30 11:35:55'),
(158, 12, 1, '10.9000', 1, '2016-12-30 11:38:20', '2016-12-30 11:38:20');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_fraud`
--

CREATE TABLE IF NOT EXISTS `oc_order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_history`
--

CREATE TABLE IF NOT EXISTS `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_option`
--

CREATE TABLE IF NOT EXISTS `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_product`
--

CREATE TABLE IF NOT EXISTS `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=538 ;

--
-- Дамп данных таблицы `oc_order_product`
--

INSERT INTO `oc_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`, `comment`) VALUES
(1, 1, 82, 'Chili con carne', '', 2, '12.9000', '25.8000', '0.0000', 0, ''),
(2, 1, 88, 'Streetfood Tacos', '', 3, '11.9000', '35.7000', '0.0000', 0, ''),
(3, 2, 70, 'BIG STARTER PLATTER ', '', 1, '8.7000', '8.7000', '0.0000', 0, ''),
(4, 2, 69, 'CHEESE SKINS ', '', 4, '5.4000', '21.6000', '0.0000', 0, ''),
(5, 2, 82, 'Chili con carne', '', 2, '12.9000', '25.8000', '0.0000', 0, ''),
(6, 3, 65, 'CHIPS Y DIP', '', 2, '3.8000', '7.6000', '0.0000', 0, ''),
(7, 3, 95, 'Ensalada Puebla', '', 1, '9.9000', '9.9000', '0.0000', 0, ''),
(8, 4, 83, 'Fajita Todos', '', 3, '17.9000', '53.7000', '0.0000', 0, ''),
(9, 4, 78, 'Pavo Morelia', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(10, 5, 65, 'CHIPS Y DIP', '', 1, '3.8000', '3.8000', '0.0000', 0, ''),
(11, 5, 97, 'Rum3', '', 1, '45.0000', '45.0000', '0.0000', 0, ''),
(12, 6, 90, 'Clasica', '', 2, '10.9000', '21.8000', '0.0000', 0, ''),
(13, 6, 71, 'Quesadas', '', 1, '4.0000', '4.0000', '0.0000', 0, ''),
(14, 6, 91, 'Double Bacon Cheese Burger', '', 1, '15.9000', '15.9000', '0.0000', 0, ''),
(15, 7, 103, 'Rum', '', 1, '25.0000', '25.0000', '0.0000', 0, ''),
(16, 7, 90, 'Clasica', '', 4, '10.9000', '43.6000', '0.0000', 0, ''),
(17, 7, 105, 'Vodka best', '', 4, '75.0000', '300.0000', '0.0000', 0, ''),
(18, 8, 78, 'Pavo Morelia', '', 3, '15.9000', '47.7000', '0.0000', 0, ''),
(19, 8, 67, 'NACHOS ORIGINAL ', '', 2, '6.4000', '12.8000', '0.0000', 0, ''),
(20, 8, 97, 'Rum3', '', 4, '45.0000', '180.0000', '0.0000', 0, ''),
(21, 8, 103, 'Rum', '', 4, '25.0000', '100.0000', '0.0000', 0, ''),
(22, 8, 84, 'Fajita Parrilla ', '', 3, '17.9000', '53.7000', '0.0000', 0, ''),
(23, 9, 74, 'Enchiladas de maiz con pollo', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(24, 9, 69, 'CHEESE SKINS ', '', 3, '5.4000', '16.2000', '0.0000', 0, ''),
(25, 10, 85, 'Fajita Pollo', '', 2, '15.9000', '31.8000', '0.0000', 0, ''),
(26, 10, 101, 'Absent', '', 3, '90.0000', '270.0000', '0.0000', 0, ''),
(27, 10, 93, 'Wagyu Burger', '', 2, '17.9000', '35.8000', '0.0000', 0, ''),
(28, 11, 77, 'Peppercrust Steak', '', 4, '18.9000', '75.6000', '0.0000', 0, ''),
(29, 11, 87, 'Plato Mexicano', '', 2, '12.9000', '25.8000', '0.0000', 0, ''),
(30, 11, 65, 'CHIPS Y DIP', '', 4, '3.8000', '15.2000', '0.0000', 0, ''),
(31, 11, 105, 'Vodka best', '', 1, '75.0000', '75.0000', '0.0000', 0, ''),
(32, 11, 92, 'El Gaucho', '', 2, '11.9000', '23.8000', '0.0000', 0, ''),
(33, 12, 74, 'Enchiladas de maiz con pollo', '', 4, '10.9000', '43.6000', '0.0000', 0, ''),
(34, 12, 88, 'Streetfood Tacos', '', 1, '11.9000', '11.9000', '0.0000', 0, ''),
(35, 13, 74, 'Enchiladas de maiz con pollo', '', 2, '10.9000', '21.8000', '0.0000', 0, ''),
(36, 13, 94, 'Vegetariana ', '', 1, '9.9000', '9.9000', '0.0000', 0, ''),
(37, 14, 89, 'Plato Verde ', '', 4, '10.9000', '43.6000', '0.0000', 0, ''),
(38, 14, 71, 'Quesadas', '', 4, '4.0000', '16.0000', '0.0000', 0, ''),
(39, 14, 67, 'NACHOS ORIGINAL ', '', 4, '6.4000', '25.6000', '0.0000', 0, ''),
(40, 14, 86, 'Quesadillas Ligeras', '', 3, '11.9000', '35.7000', '0.0000', 0, ''),
(41, 14, 91, 'Double Bacon Cheese Burger', '', 1, '15.9000', '15.9000', '0.0000', 0, ''),
(42, 15, 95, 'Ensalada Puebla', '', 2, '9.9000', '19.8000', '0.0000', 0, ''),
(43, 15, 69, 'CHEESE SKINS ', '', 1, '5.4000', '5.4000', '0.0000', 0, ''),
(44, 16, 83, 'Fajita Todos', '', 4, '17.9000', '71.6000', '0.0000', 0, ''),
(45, 16, 96, 'vodka', '', 4, '10.0000', '40.0000', '0.0000', 0, ''),
(46, 17, 103, 'Rum', '', 4, '25.0000', '100.0000', '0.0000', 0, ''),
(47, 17, 77, 'Peppercrust Steak', '', 4, '18.9000', '75.6000', '0.0000', 0, ''),
(48, 17, 102, 'Koniac', '', 4, '15.0000', '60.0000', '0.0000', 0, ''),
(49, 17, 84, 'Fajita Parrilla ', '', 3, '17.9000', '53.7000', '0.0000', 0, ''),
(50, 18, 88, 'Streetfood Tacos', '', 1, '11.9000', '11.9000', '0.0000', 0, ''),
(51, 18, 105, 'Vodka best', '', 4, '75.0000', '300.0000', '0.0000', 0, ''),
(52, 18, 77, 'Peppercrust Steak', '', 3, '18.9000', '56.7000', '0.0000', 0, ''),
(53, 19, 100, 'Vine', '', 2, '55.0000', '110.0000', '0.0000', 0, ''),
(54, 19, 69, 'CHEESE SKINS ', '', 1, '5.4000', '5.4000', '0.0000', 0, ''),
(55, 19, 77, 'Peppercrust Steak', '', 4, '18.9000', '75.6000', '0.0000', 0, ''),
(56, 19, 67, 'NACHOS ORIGINAL ', '', 2, '6.4000', '12.8000', '0.0000', 0, ''),
(57, 20, 100, 'Vine', '', 2, '55.0000', '110.0000', '0.0000', 0, ''),
(58, 20, 93, 'Wagyu Burger', '', 1, '17.9000', '17.9000', '0.0000', 0, ''),
(59, 20, 70, 'BIG STARTER PLATTER ', '', 3, '8.7000', '26.1000', '0.0000', 0, ''),
(60, 20, 75, 'Enchiladas combinadas', '', 1, '11.9000', '11.9000', '0.0000', 0, ''),
(61, 21, 84, 'Fajita Parrilla ', '', 1, '17.9000', '17.9000', '0.0000', 0, ''),
(62, 21, 73, 'Enchiladas Clasicas', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(63, 22, 70, 'BIG STARTER PLATTER ', '', 4, '8.7000', '34.8000', '0.0000', 0, ''),
(64, 22, 91, 'Double Bacon Cheese Burger', '', 1, '15.9000', '15.9000', '0.0000', 0, ''),
(65, 22, 102, 'Koniac', '', 3, '15.0000', '45.0000', '0.0000', 0, ''),
(66, 22, 80, 'The ultimate Buffalo Wings', '', 1, '12.9000', '12.9000', '0.0000', 0, ''),
(67, 23, 80, 'The ultimate Buffalo Wings', '', 3, '12.9000', '38.7000', '0.0000', 0, ''),
(68, 23, 100, 'Vine', '', 4, '55.0000', '220.0000', '0.0000', 0, ''),
(69, 23, 91, 'Double Bacon Cheese Burger', '', 1, '15.9000', '15.9000', '0.0000', 0, ''),
(70, 23, 104, 'Sem', '', 4, '69.0000', '276.0000', '0.0000', 0, ''),
(71, 23, 94, 'Vegetariana ', '', 4, '9.9000', '39.6000', '0.0000', 0, ''),
(72, 24, 67, 'NACHOS ORIGINAL ', '', 2, '6.4000', '12.8000', '0.0000', 0, ''),
(73, 24, 75, 'Enchiladas combinadas', '', 4, '11.9000', '47.6000', '0.0000', 0, ''),
(74, 24, 74, 'Enchiladas de maiz con pollo', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(75, 24, 68, 'TAQUITOS CON POLLO ', '', 1, '5.8000', '5.8000', '0.0000', 0, ''),
(76, 25, 98, 'Rum 2', '', 3, '50.0000', '150.0000', '0.0000', 0, ''),
(77, 25, 88, 'Streetfood Tacos', '', 1, '11.9000', '11.9000', '0.0000', 0, ''),
(78, 25, 68, 'TAQUITOS CON POLLO ', '', 1, '5.8000', '5.8000', '0.0000', 0, ''),
(79, 26, 68, 'TAQUITOS CON POLLO ', '', 1, '5.8000', '5.8000', '0.0000', 0, ''),
(80, 26, 91, 'Double Bacon Cheese Burger', '', 1, '15.9000', '15.9000', '0.0000', 0, ''),
(81, 27, 96, 'vodka', '', 1, '10.0000', '10.0000', '0.0000', 0, ''),
(82, 27, 82, 'Chili con carne', '', 1, '12.9000', '12.9000', '0.0000', 0, ''),
(83, 27, 102, 'Koniac', '', 2, '15.0000', '30.0000', '0.0000', 0, ''),
(84, 27, 72, 'Enchiladas Vegetarianas', '', 4, '9.9000', '39.6000', '0.0000', 0, ''),
(85, 28, 98, 'Rum 2', '', 3, '50.0000', '150.0000', '0.0000', 0, ''),
(86, 28, 76, 'Steak Suramericano', '', 2, '18.9000', '37.8000', '0.0000', 0, ''),
(87, 28, 84, 'Fajita Parrilla ', '', 1, '17.9000', '17.9000', '0.0000', 0, ''),
(88, 28, 79, 'Plato Enchilada', '', 4, '18.9000', '75.6000', '0.0000', 0, ''),
(89, 29, 103, 'Rum', '', 1, '25.0000', '25.0000', '0.0000', 0, ''),
(90, 29, 71, 'Quesadas', '', 4, '4.0000', '16.0000', '0.0000', 0, ''),
(91, 29, 85, 'Fajita Pollo', '', 3, '15.9000', '47.7000', '0.0000', 0, ''),
(92, 29, 99, 'Tekila', '', 3, '35.0000', '105.0000', '0.0000', 0, ''),
(93, 29, 89, 'Plato Verde ', '', 3, '10.9000', '32.7000', '0.0000', 0, ''),
(94, 30, 83, 'Fajita Todos', '', 3, '17.9000', '53.7000', '0.0000', 0, ''),
(95, 30, 80, 'The ultimate Buffalo Wings', '', 2, '12.9000', '25.8000', '0.0000', 0, ''),
(96, 30, 79, 'Plato Enchilada', '', 4, '18.9000', '75.6000', '0.0000', 0, ''),
(97, 30, 103, 'Rum', '', 3, '25.0000', '75.0000', '0.0000', 0, ''),
(98, 31, 103, 'Rum', '', 2, '25.0000', '50.0000', '0.0000', 0, ''),
(99, 31, 83, 'Fajita Todos', '', 4, '17.9000', '71.6000', '0.0000', 0, ''),
(100, 31, 65, 'CHIPS Y DIP', '', 2, '3.8000', '7.6000', '0.0000', 0, ''),
(101, 31, 91, 'Double Bacon Cheese Burger', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(102, 31, 78, 'Pavo Morelia', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(103, 32, 92, 'El Gaucho', '', 2, '11.9000', '23.8000', '0.0000', 0, ''),
(104, 32, 76, 'Steak Suramericano', '', 1, '18.9000', '18.9000', '0.0000', 0, ''),
(105, 32, 80, 'The ultimate Buffalo Wings', '', 1, '12.9000', '12.9000', '0.0000', 0, ''),
(106, 32, 96, 'vodka', '', 1, '10.0000', '10.0000', '0.0000', 0, ''),
(107, 33, 67, 'NACHOS ORIGINAL ', '', 3, '6.4000', '19.2000', '0.0000', 0, ''),
(108, 33, 90, 'Clasica', '', 3, '10.9000', '32.7000', '0.0000', 0, ''),
(109, 33, 72, 'Enchiladas Vegetarianas', '', 4, '9.9000', '39.6000', '0.0000', 0, ''),
(110, 34, 79, 'Plato Enchilada', '', 4, '18.9000', '75.6000', '0.0000', 0, ''),
(111, 34, 93, 'Wagyu Burger', '', 4, '17.9000', '71.6000', '0.0000', 0, ''),
(112, 34, 104, 'Sem', '', 3, '69.0000', '207.0000', '0.0000', 0, ''),
(113, 34, 105, 'Vodka best', '', 3, '75.0000', '225.0000', '0.0000', 0, ''),
(114, 34, 74, 'Enchiladas de maiz con pollo', '', 4, '10.9000', '43.6000', '0.0000', 0, ''),
(115, 35, 86, 'Quesadillas Ligeras', '', 1, '11.9000', '11.9000', '0.0000', 0, ''),
(116, 35, 104, 'Sem', '', 2, '69.0000', '138.0000', '0.0000', 0, ''),
(117, 36, 78, 'Pavo Morelia', '', 1, '15.9000', '15.9000', '0.0000', 0, ''),
(118, 36, 105, 'Vodka best', '', 3, '75.0000', '225.0000', '0.0000', 0, ''),
(119, 36, 95, 'Ensalada Puebla', '', 2, '9.9000', '19.8000', '0.0000', 0, ''),
(120, 37, 65, 'CHIPS Y DIP', '', 1, '3.8000', '3.8000', '0.0000', 0, ''),
(121, 37, 69, 'CHEESE SKINS ', '', 4, '5.4000', '21.6000', '0.0000', 0, ''),
(122, 38, 87, 'Plato Mexicano', '', 1, '12.9000', '12.9000', '0.0000', 0, ''),
(123, 38, 99, 'Tekila', '', 3, '35.0000', '105.0000', '0.0000', 0, ''),
(124, 38, 78, 'Pavo Morelia', '', 2, '15.9000', '31.8000', '0.0000', 0, ''),
(125, 38, 97, 'Rum3', '', 2, '45.0000', '90.0000', '0.0000', 0, ''),
(126, 38, 90, 'Clasica', '', 2, '10.9000', '21.8000', '0.0000', 0, ''),
(127, 39, 76, 'Steak Suramericano', '', 4, '18.9000', '75.6000', '0.0000', 0, ''),
(128, 39, 105, 'Vodka best', '', 1, '75.0000', '75.0000', '0.0000', 0, ''),
(129, 39, 87, 'Plato Mexicano', '', 3, '12.9000', '38.7000', '0.0000', 0, ''),
(130, 40, 84, 'Fajita Parrilla ', '', 2, '17.9000', '35.8000', '0.0000', 0, ''),
(131, 40, 102, 'Koniac', '', 2, '15.0000', '30.0000', '0.0000', 0, ''),
(132, 40, 98, 'Rum 2', '', 2, '50.0000', '100.0000', '0.0000', 0, ''),
(133, 40, 97, 'Rum3', '', 3, '45.0000', '135.0000', '0.0000', 0, ''),
(134, 40, 95, 'Ensalada Puebla', '', 3, '9.9000', '29.7000', '0.0000', 0, ''),
(135, 41, 85, 'Fajita Pollo', '', 2, '15.9000', '31.8000', '0.0000', 0, ''),
(136, 41, 70, 'BIG STARTER PLATTER ', '', 3, '8.7000', '26.1000', '0.0000', 0, ''),
(137, 41, 74, 'Enchiladas de maiz con pollo', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(138, 41, 91, 'Double Bacon Cheese Burger', '', 2, '15.9000', '31.8000', '0.0000', 0, ''),
(139, 42, 93, 'Wagyu Burger', '', 4, '17.9000', '71.6000', '0.0000', 0, ''),
(140, 42, 69, 'CHEESE SKINS ', '', 4, '5.4000', '21.6000', '0.0000', 0, ''),
(141, 42, 80, 'The ultimate Buffalo Wings', '', 4, '12.9000', '51.6000', '0.0000', 0, ''),
(142, 42, 84, 'Fajita Parrilla ', '', 1, '17.9000', '17.9000', '0.0000', 0, ''),
(143, 42, 87, 'Plato Mexicano', '', 4, '12.9000', '51.6000', '0.0000', 0, ''),
(144, 43, 86, 'Quesadillas Ligeras', '', 1, '11.9000', '11.9000', '0.0000', 0, ''),
(145, 43, 83, 'Fajita Todos', '', 3, '17.9000', '53.7000', '0.0000', 0, ''),
(146, 43, 103, 'Rum', '', 2, '25.0000', '50.0000', '0.0000', 0, ''),
(147, 43, 85, 'Fajita Pollo', '', 2, '15.9000', '31.8000', '0.0000', 0, ''),
(148, 43, 65, 'CHIPS Y DIP', '', 2, '3.8000', '7.6000', '0.0000', 0, ''),
(149, 44, 97, 'Rum3', '', 4, '45.0000', '180.0000', '0.0000', 0, ''),
(150, 44, 103, 'Rum', '', 4, '25.0000', '100.0000', '0.0000', 0, ''),
(151, 44, 91, 'Double Bacon Cheese Burger', '', 1, '15.9000', '15.9000', '0.0000', 0, ''),
(152, 44, 70, 'BIG STARTER PLATTER ', '', 4, '8.7000', '34.8000', '0.0000', 0, ''),
(153, 45, 104, 'Sem', '', 1, '69.0000', '69.0000', '0.0000', 0, ''),
(154, 45, 105, 'Vodka best', '', 3, '75.0000', '225.0000', '0.0000', 0, ''),
(155, 45, 67, 'NACHOS ORIGINAL ', '', 3, '6.4000', '19.2000', '0.0000', 0, ''),
(156, 45, 90, 'Clasica', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(157, 46, 71, 'Quesadas', '', 2, '4.0000', '8.0000', '0.0000', 0, ''),
(158, 46, 84, 'Fajita Parrilla ', '', 4, '17.9000', '71.6000', '0.0000', 0, ''),
(159, 46, 94, 'Vegetariana ', '', 3, '9.9000', '29.7000', '0.0000', 0, ''),
(160, 47, 94, 'Vegetariana ', '', 3, '9.9000', '29.7000', '0.0000', 0, ''),
(161, 47, 104, 'Sem', '', 2, '69.0000', '138.0000', '0.0000', 0, ''),
(162, 47, 80, 'The ultimate Buffalo Wings', '', 3, '12.9000', '38.7000', '0.0000', 0, ''),
(163, 47, 79, 'Plato Enchilada', '', 2, '18.9000', '37.8000', '0.0000', 0, ''),
(164, 48, 70, 'BIG STARTER PLATTER ', '', 4, '8.7000', '34.8000', '0.0000', 0, ''),
(165, 48, 78, 'Pavo Morelia', '', 3, '15.9000', '47.7000', '0.0000', 0, ''),
(166, 49, 78, 'Pavo Morelia', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(167, 49, 98, 'Rum 2', '', 4, '50.0000', '200.0000', '0.0000', 0, ''),
(168, 49, 65, 'CHIPS Y DIP', '', 3, '3.8000', '11.4000', '0.0000', 0, ''),
(169, 49, 89, 'Plato Verde ', '', 4, '10.9000', '43.6000', '0.0000', 0, ''),
(170, 50, 65, 'CHIPS Y DIP', '', 4, '3.8000', '15.2000', '0.0000', 0, ''),
(171, 50, 96, 'vodka', '', 2, '10.0000', '20.0000', '0.0000', 0, ''),
(172, 50, 100, 'Vine', '', 1, '55.0000', '55.0000', '0.0000', 0, ''),
(173, 51, 75, 'Enchiladas combinadas', '', 3, '11.9000', '35.7000', '0.0000', 0, ''),
(174, 51, 77, 'Peppercrust Steak', '', 2, '18.9000', '37.8000', '0.0000', 0, ''),
(175, 51, 73, 'Enchiladas Clasicas', '', 4, '10.9000', '43.6000', '0.0000', 0, ''),
(176, 52, 92, 'El Gaucho', '', 3, '11.9000', '35.7000', '0.0000', 0, ''),
(177, 52, 75, 'Enchiladas combinadas', '', 1, '11.9000', '11.9000', '0.0000', 0, ''),
(178, 53, 77, 'Peppercrust Steak', '', 4, '18.9000', '75.6000', '0.0000', 0, ''),
(179, 53, 78, 'Pavo Morelia', '', 3, '15.9000', '47.7000', '0.0000', 0, ''),
(180, 53, 71, 'Quesadas', '', 1, '4.0000', '4.0000', '0.0000', 0, ''),
(181, 53, 97, 'Rum3', '', 2, '45.0000', '90.0000', '0.0000', 0, ''),
(182, 54, 105, 'Vodka best', '', 2, '75.0000', '150.0000', '0.0000', 0, ''),
(183, 54, 91, 'Double Bacon Cheese Burger', '', 1, '15.9000', '15.9000', '0.0000', 0, ''),
(184, 54, 75, 'Enchiladas combinadas', '', 4, '11.9000', '47.6000', '0.0000', 0, ''),
(185, 55, 94, 'Vegetariana ', '', 4, '9.9000', '39.6000', '0.0000', 0, ''),
(186, 55, 71, 'Quesadas', '', 4, '4.0000', '16.0000', '0.0000', 0, ''),
(187, 56, 77, 'Peppercrust Steak', '', 1, '18.9000', '18.9000', '0.0000', 0, ''),
(188, 56, 91, 'Double Bacon Cheese Burger', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(189, 57, 87, 'Plato Mexicano', '', 1, '12.9000', '12.9000', '0.0000', 0, ''),
(190, 57, 72, 'Enchiladas Vegetarianas', '', 2, '9.9000', '19.8000', '0.0000', 0, ''),
(191, 58, 105, 'Vodka best', '', 3, '75.0000', '225.0000', '0.0000', 0, ''),
(192, 58, 99, 'Tekila', '', 2, '35.0000', '70.0000', '0.0000', 0, ''),
(193, 58, 72, 'Enchiladas Vegetarianas', '', 1, '9.9000', '9.9000', '0.0000', 0, ''),
(194, 58, 87, 'Plato Mexicano', '', 4, '12.9000', '51.6000', '0.0000', 0, ''),
(195, 58, 67, 'NACHOS ORIGINAL ', '', 4, '6.4000', '25.6000', '0.0000', 0, ''),
(196, 59, 103, 'Rum', '', 3, '25.0000', '75.0000', '0.0000', 0, ''),
(197, 59, 74, 'Enchiladas de maiz con pollo', '', 4, '10.9000', '43.6000', '0.0000', 0, ''),
(198, 59, 99, 'Tekila', '', 1, '35.0000', '35.0000', '0.0000', 0, ''),
(199, 59, 83, 'Fajita Todos', '', 1, '17.9000', '17.9000', '0.0000', 0, ''),
(200, 60, 77, 'Peppercrust Steak', '', 1, '18.9000', '18.9000', '0.0000', 0, ''),
(201, 60, 73, 'Enchiladas Clasicas', '', 3, '10.9000', '32.7000', '0.0000', 0, ''),
(202, 60, 104, 'Sem', '', 4, '69.0000', '276.0000', '0.0000', 0, ''),
(203, 61, 99, 'Tekila', '', 3, '35.0000', '105.0000', '0.0000', 0, ''),
(204, 61, 104, 'Sem', '', 3, '69.0000', '207.0000', '0.0000', 0, ''),
(205, 62, 94, 'Vegetariana ', '', 2, '9.9000', '19.8000', '0.0000', 0, ''),
(206, 62, 92, 'El Gaucho', '', 4, '11.9000', '47.6000', '0.0000', 0, ''),
(207, 62, 65, 'CHIPS Y DIP', '', 3, '3.8000', '11.4000', '0.0000', 0, ''),
(208, 62, 79, 'Plato Enchilada', '', 1, '18.9000', '18.9000', '0.0000', 0, ''),
(209, 62, 105, 'Vodka best', '', 3, '75.0000', '225.0000', '0.0000', 0, ''),
(210, 63, 83, 'Fajita Todos', '', 2, '17.9000', '35.8000', '0.0000', 0, ''),
(211, 63, 103, 'Rum', '', 4, '25.0000', '100.0000', '0.0000', 0, ''),
(212, 63, 98, 'Rum 2', '', 2, '50.0000', '100.0000', '0.0000', 0, ''),
(213, 63, 91, 'Double Bacon Cheese Burger', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(214, 64, 101, 'Absent', '', 2, '90.0000', '180.0000', '0.0000', 0, ''),
(215, 64, 69, 'CHEESE SKINS ', '', 2, '5.4000', '10.8000', '0.0000', 0, ''),
(216, 64, 84, 'Fajita Parrilla ', '', 4, '17.9000', '71.6000', '0.0000', 0, ''),
(217, 64, 96, 'vodka', '', 4, '10.0000', '40.0000', '0.0000', 0, ''),
(218, 64, 74, 'Enchiladas de maiz con pollo', '', 3, '10.9000', '32.7000', '0.0000', 0, ''),
(219, 65, 90, 'Clasica', '', 4, '10.9000', '43.6000', '0.0000', 0, ''),
(220, 65, 94, 'Vegetariana ', '', 1, '9.9000', '9.9000', '0.0000', 0, ''),
(221, 65, 104, 'Sem', '', 4, '69.0000', '276.0000', '0.0000', 0, ''),
(222, 65, 72, 'Enchiladas Vegetarianas', '', 4, '9.9000', '39.6000', '0.0000', 0, ''),
(223, 66, 68, 'TAQUITOS CON POLLO ', '', 4, '5.8000', '23.2000', '0.0000', 0, ''),
(224, 66, 85, 'Fajita Pollo', '', 3, '15.9000', '47.7000', '0.0000', 0, ''),
(225, 67, 73, 'Enchiladas Clasicas', '', 2, '10.9000', '21.8000', '0.0000', 0, ''),
(226, 67, 78, 'Pavo Morelia', '', 1, '15.9000', '15.9000', '0.0000', 0, ''),
(227, 68, 105, 'Vodka best', '', 3, '75.0000', '225.0000', '0.0000', 0, ''),
(228, 68, 96, 'vodka', '', 3, '10.0000', '30.0000', '0.0000', 0, ''),
(229, 69, 71, 'Quesadas', '', 4, '4.0000', '16.0000', '0.0000', 0, ''),
(230, 69, 91, 'Double Bacon Cheese Burger', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(231, 69, 93, 'Wagyu Burger', '', 1, '17.9000', '17.9000', '0.0000', 0, ''),
(232, 70, 101, 'Absent', '', 1, '90.0000', '90.0000', '0.0000', 0, ''),
(233, 70, 72, 'Enchiladas Vegetarianas', '', 3, '9.9000', '29.7000', '0.0000', 0, ''),
(234, 70, 105, 'Vodka best', '', 2, '75.0000', '150.0000', '0.0000', 0, ''),
(235, 71, 90, 'Clasica', '', 4, '10.9000', '43.6000', '0.0000', 0, ''),
(236, 71, 83, 'Fajita Todos', '', 1, '17.9000', '17.9000', '0.0000', 0, ''),
(237, 71, 78, 'Pavo Morelia', '', 3, '15.9000', '47.7000', '0.0000', 0, ''),
(238, 71, 70, 'BIG STARTER PLATTER ', '', 1, '8.7000', '8.7000', '0.0000', 0, ''),
(239, 71, 93, 'Wagyu Burger', '', 4, '17.9000', '71.6000', '0.0000', 0, ''),
(240, 72, 88, 'Streetfood Tacos', '', 4, '11.9000', '47.6000', '0.0000', 0, ''),
(241, 72, 83, 'Fajita Todos', '', 1, '17.9000', '17.9000', '0.0000', 0, ''),
(242, 72, 101, 'Absent', '', 4, '90.0000', '360.0000', '0.0000', 0, ''),
(243, 73, 90, 'Clasica', '', 2, '10.9000', '21.8000', '0.0000', 0, ''),
(244, 73, 68, 'TAQUITOS CON POLLO ', '', 4, '5.8000', '23.2000', '0.0000', 0, ''),
(245, 73, 71, 'Quesadas', '', 1, '4.0000', '4.0000', '0.0000', 0, ''),
(246, 73, 74, 'Enchiladas de maiz con pollo', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(247, 73, 69, 'CHEESE SKINS ', '', 3, '5.4000', '16.2000', '0.0000', 0, ''),
(248, 74, 89, 'Plato Verde ', '', 2, '10.9000', '21.8000', '0.0000', 0, ''),
(249, 74, 92, 'El Gaucho', '', 3, '11.9000', '35.7000', '0.0000', 0, ''),
(250, 75, 89, 'Plato Verde ', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(251, 75, 96, 'vodka', '', 1, '10.0000', '10.0000', '0.0000', 0, ''),
(252, 75, 75, 'Enchiladas combinadas', '', 3, '11.9000', '35.7000', '0.0000', 0, ''),
(253, 75, 98, 'Rum 2', '', 3, '50.0000', '150.0000', '0.0000', 0, ''),
(254, 75, 93, 'Wagyu Burger', '', 3, '17.9000', '53.7000', '0.0000', 0, ''),
(255, 76, 77, 'Peppercrust Steak', '', 4, '18.9000', '75.6000', '0.0000', 0, ''),
(256, 76, 90, 'Clasica', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(257, 77, 76, 'Steak Suramericano', '', 3, '18.9000', '56.7000', '0.0000', 0, ''),
(258, 77, 75, 'Enchiladas combinadas', '', 2, '11.9000', '23.8000', '0.0000', 0, ''),
(259, 77, 78, 'Pavo Morelia', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(260, 77, 101, 'Absent', '', 1, '90.0000', '90.0000', '0.0000', 0, ''),
(261, 78, 79, 'Plato Enchilada', '', 4, '18.9000', '75.6000', '0.0000', 0, ''),
(262, 78, 90, 'Clasica', '', 2, '10.9000', '21.8000', '0.0000', 0, ''),
(263, 78, 71, 'Quesadas', '', 3, '4.0000', '12.0000', '0.0000', 0, ''),
(264, 78, 105, 'Vodka best', '', 3, '75.0000', '225.0000', '0.0000', 0, ''),
(265, 79, 105, 'Vodka best', '', 1, '75.0000', '75.0000', '0.0000', 0, ''),
(266, 79, 72, 'Enchiladas Vegetarianas', '', 2, '9.9000', '19.8000', '0.0000', 0, ''),
(267, 79, 91, 'Double Bacon Cheese Burger', '', 3, '15.9000', '47.7000', '0.0000', 0, ''),
(268, 79, 76, 'Steak Suramericano', '', 2, '18.9000', '37.8000', '0.0000', 0, ''),
(269, 80, 104, 'Sem', '', 2, '69.0000', '138.0000', '0.0000', 0, ''),
(270, 80, 85, 'Fajita Pollo', '', 3, '15.9000', '47.7000', '0.0000', 0, ''),
(271, 80, 77, 'Peppercrust Steak', '', 3, '18.9000', '56.7000', '0.0000', 0, ''),
(272, 80, 72, 'Enchiladas Vegetarianas', '', 3, '9.9000', '29.7000', '0.0000', 0, ''),
(273, 80, 78, 'Pavo Morelia', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(274, 81, 85, 'Fajita Pollo', '', 3, '15.9000', '47.7000', '0.0000', 0, ''),
(275, 81, 83, 'Fajita Todos', '', 1, '17.9000', '17.9000', '0.0000', 0, ''),
(276, 81, 86, 'Quesadillas Ligeras', '', 1, '11.9000', '11.9000', '0.0000', 0, ''),
(277, 81, 104, 'Sem', '', 2, '69.0000', '138.0000', '0.0000', 0, ''),
(278, 81, 80, 'The ultimate Buffalo Wings', '', 1, '12.9000', '12.9000', '0.0000', 0, ''),
(279, 82, 73, 'Enchiladas Clasicas', '', 3, '10.9000', '32.7000', '0.0000', 0, ''),
(280, 82, 84, 'Fajita Parrilla ', '', 2, '17.9000', '35.8000', '0.0000', 0, ''),
(281, 82, 91, 'Double Bacon Cheese Burger', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(282, 82, 92, 'El Gaucho', '', 1, '11.9000', '11.9000', '0.0000', 0, ''),
(283, 83, 75, 'Enchiladas combinadas', '', 2, '11.9000', '23.8000', '0.0000', 0, ''),
(284, 83, 96, 'vodka', '', 1, '10.0000', '10.0000', '0.0000', 0, ''),
(285, 83, 69, 'CHEESE SKINS ', '', 1, '5.4000', '5.4000', '0.0000', 0, ''),
(286, 83, 86, 'Quesadillas Ligeras', '', 3, '11.9000', '35.7000', '0.0000', 0, ''),
(287, 84, 103, 'Rum', '', 4, '25.0000', '100.0000', '0.0000', 0, ''),
(288, 84, 72, 'Enchiladas Vegetarianas', '', 1, '9.9000', '9.9000', '0.0000', 0, ''),
(289, 84, 78, 'Pavo Morelia', '', 2, '15.9000', '31.8000', '0.0000', 0, ''),
(290, 84, 73, 'Enchiladas Clasicas', '', 4, '10.9000', '43.6000', '0.0000', 0, ''),
(291, 85, 87, 'Plato Mexicano', '', 3, '12.9000', '38.7000', '0.0000', 0, ''),
(292, 85, 105, 'Vodka best', '', 1, '75.0000', '75.0000', '0.0000', 0, ''),
(293, 85, 100, 'Vine', '', 1, '55.0000', '55.0000', '0.0000', 0, ''),
(294, 85, 80, 'The ultimate Buffalo Wings', '', 1, '12.9000', '12.9000', '0.0000', 0, ''),
(295, 86, 100, 'Vine', '', 2, '55.0000', '110.0000', '0.0000', 0, ''),
(296, 86, 79, 'Plato Enchilada', '', 3, '18.9000', '56.7000', '0.0000', 0, ''),
(297, 86, 85, 'Fajita Pollo', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(298, 87, 89, 'Plato Verde ', '', 2, '10.9000', '21.8000', '0.0000', 0, ''),
(299, 87, 75, 'Enchiladas combinadas', '', 3, '11.9000', '35.7000', '0.0000', 0, ''),
(300, 87, 82, 'Chili con carne', '', 3, '12.9000', '38.7000', '0.0000', 0, ''),
(301, 87, 86, 'Quesadillas Ligeras', '', 3, '11.9000', '35.7000', '0.0000', 0, ''),
(302, 87, 71, 'Quesadas', '', 2, '4.0000', '8.0000', '0.0000', 0, ''),
(303, 88, 96, 'vodka', '', 2, '10.0000', '20.0000', '0.0000', 0, ''),
(304, 88, 86, 'Quesadillas Ligeras', '', 3, '11.9000', '35.7000', '0.0000', 0, ''),
(305, 88, 94, 'Vegetariana ', '', 3, '9.9000', '29.7000', '0.0000', 0, ''),
(306, 88, 95, 'Ensalada Puebla', '', 3, '9.9000', '29.7000', '0.0000', 0, ''),
(307, 88, 72, 'Enchiladas Vegetarianas', '', 3, '9.9000', '29.7000', '0.0000', 0, ''),
(308, 89, 97, 'Rum3', '', 4, '45.0000', '180.0000', '0.0000', 0, ''),
(309, 89, 79, 'Plato Enchilada', '', 3, '18.9000', '56.7000', '0.0000', 0, ''),
(310, 89, 105, 'Vodka best', '', 1, '75.0000', '75.0000', '0.0000', 0, ''),
(311, 89, 92, 'El Gaucho', '', 1, '11.9000', '11.9000', '0.0000', 0, ''),
(312, 89, 83, 'Fajita Todos', '', 2, '17.9000', '35.8000', '0.0000', 0, ''),
(313, 90, 75, 'Enchiladas combinadas', '', 1, '11.9000', '11.9000', '0.0000', 0, ''),
(314, 90, 93, 'Wagyu Burger', '', 2, '17.9000', '35.8000', '0.0000', 0, ''),
(315, 91, 86, 'Quesadillas Ligeras', '', 1, '11.9000', '11.9000', '0.0000', 0, ''),
(316, 91, 67, 'NACHOS ORIGINAL ', '', 4, '6.4000', '25.6000', '0.0000', 0, ''),
(317, 91, 91, 'Double Bacon Cheese Burger', '', 1, '15.9000', '15.9000', '0.0000', 0, ''),
(318, 92, 92, 'El Gaucho', '', 2, '11.9000', '23.8000', '0.0000', 0, ''),
(319, 92, 68, 'TAQUITOS CON POLLO ', '', 2, '5.8000', '11.6000', '0.0000', 0, ''),
(320, 92, 100, 'Vine', '', 3, '55.0000', '165.0000', '0.0000', 0, ''),
(321, 93, 87, 'Plato Mexicano', '', 1, '12.9000', '12.9000', '0.0000', 0, ''),
(322, 93, 90, 'Clasica', '', 3, '10.9000', '32.7000', '0.0000', 0, ''),
(323, 94, 79, 'Plato Enchilada', '', 2, '18.9000', '37.8000', '0.0000', 0, ''),
(324, 94, 86, 'Quesadillas Ligeras', '', 2, '11.9000', '23.8000', '0.0000', 0, ''),
(325, 94, 80, 'The ultimate Buffalo Wings', '', 2, '12.9000', '25.8000', '0.0000', 0, ''),
(326, 95, 76, 'Steak Suramericano', '', 4, '18.9000', '75.6000', '0.0000', 0, ''),
(327, 95, 103, 'Rum', '', 2, '25.0000', '50.0000', '0.0000', 0, ''),
(328, 96, 87, 'Plato Mexicano', '', 2, '12.9000', '25.8000', '0.0000', 0, ''),
(329, 96, 104, 'Sem', '', 4, '69.0000', '276.0000', '0.0000', 0, ''),
(330, 96, 78, 'Pavo Morelia', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(331, 96, 103, 'Rum', '', 3, '25.0000', '75.0000', '0.0000', 0, ''),
(332, 96, 99, 'Tekila', '', 4, '35.0000', '140.0000', '0.0000', 0, ''),
(333, 97, 104, 'Sem', '', 4, '69.0000', '276.0000', '0.0000', 0, ''),
(334, 97, 101, 'Absent', '', 3, '90.0000', '270.0000', '0.0000', 0, ''),
(335, 97, 87, 'Plato Mexicano', '', 1, '12.9000', '12.9000', '0.0000', 0, ''),
(336, 98, 96, 'vodka', '', 4, '10.0000', '40.0000', '0.0000', 0, ''),
(337, 98, 71, 'Quesadas', '', 4, '4.0000', '16.0000', '0.0000', 0, ''),
(338, 98, 77, 'Peppercrust Steak', '', 4, '18.9000', '75.6000', '0.0000', 0, ''),
(339, 98, 72, 'Enchiladas Vegetarianas', '', 3, '9.9000', '29.7000', '0.0000', 0, ''),
(340, 99, 78, 'Pavo Morelia', '', 1, '15.9000', '15.9000', '0.0000', 0, ''),
(341, 99, 70, 'BIG STARTER PLATTER ', '', 1, '8.7000', '8.7000', '0.0000', 0, ''),
(342, 100, 91, 'Double Bacon Cheese Burger', '', 3, '15.9000', '47.7000', '0.0000', 0, ''),
(343, 100, 95, 'Ensalada Puebla', '', 4, '9.9000', '39.6000', '0.0000', 0, ''),
(344, 100, 98, 'Rum 2', '', 4, '50.0000', '200.0000', '0.0000', 0, ''),
(345, 101, 67, 'NACHOS ORIGINAL ', '', 4, '6.4000', '25.6000', '0.0000', 0, ''),
(346, 101, 74, 'Enchiladas de maiz con pollo', '', 3, '10.9000', '32.7000', '0.0000', 0, ''),
(347, 101, 100, 'Vine', '', 3, '55.0000', '165.0000', '0.0000', 0, ''),
(348, 101, 97, 'Rum3', '', 3, '45.0000', '135.0000', '0.0000', 0, ''),
(349, 101, 92, 'El Gaucho', '', 4, '11.9000', '47.6000', '0.0000', 0, ''),
(350, 102, 68, 'TAQUITOS CON POLLO ', '', 4, '5.8000', '23.2000', '0.0000', 0, ''),
(351, 102, 69, 'CHEESE SKINS ', '', 1, '5.4000', '5.4000', '0.0000', 0, ''),
(352, 102, 87, 'Plato Mexicano', '', 3, '12.9000', '38.7000', '0.0000', 0, ''),
(353, 102, 72, 'Enchiladas Vegetarianas', '', 4, '9.9000', '39.6000', '0.0000', 0, ''),
(354, 102, 86, 'Quesadillas Ligeras', '', 1, '11.9000', '11.9000', '0.0000', 0, ''),
(355, 103, 95, 'Ensalada Puebla', '', 2, '9.9000', '19.8000', '0.0000', 0, ''),
(356, 103, 105, 'Vodka best', '', 3, '75.0000', '225.0000', '0.0000', 0, ''),
(357, 104, 97, 'Rum3', '', 1, '45.0000', '45.0000', '0.0000', 0, ''),
(358, 104, 83, 'Fajita Todos', '', 2, '17.9000', '35.8000', '0.0000', 0, ''),
(359, 104, 77, 'Peppercrust Steak', '', 3, '18.9000', '56.7000', '0.0000', 0, ''),
(360, 104, 71, 'Quesadas', '', 4, '4.0000', '16.0000', '0.0000', 0, ''),
(361, 105, 68, 'TAQUITOS CON POLLO ', '', 2, '5.8000', '11.6000', '0.0000', 0, ''),
(362, 105, 104, 'Sem', '', 3, '69.0000', '207.0000', '0.0000', 0, ''),
(363, 106, 77, 'Peppercrust Steak', '', 1, '18.9000', '18.9000', '0.0000', 0, ''),
(364, 106, 84, 'Fajita Parrilla ', '', 1, '17.9000', '17.9000', '0.0000', 0, ''),
(365, 107, 89, 'Plato Verde ', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(366, 107, 72, 'Enchiladas Vegetarianas', '', 1, '9.9000', '9.9000', '0.0000', 0, ''),
(367, 107, 69, 'CHEESE SKINS ', '', 4, '5.4000', '21.6000', '0.0000', 0, ''),
(368, 107, 83, 'Fajita Todos', '', 3, '17.9000', '53.7000', '0.0000', 0, ''),
(369, 108, 72, 'Enchiladas Vegetarianas', '', 3, '9.9000', '29.7000', '0.0000', 0, ''),
(370, 108, 97, 'Rum3', '', 3, '45.0000', '135.0000', '0.0000', 0, ''),
(371, 109, 79, 'Plato Enchilada', '', 1, '18.9000', '18.9000', '0.0000', 0, ''),
(372, 109, 104, 'Sem', '', 3, '69.0000', '207.0000', '0.0000', 0, ''),
(373, 109, 100, 'Vine', '', 3, '55.0000', '165.0000', '0.0000', 0, ''),
(374, 110, 70, 'BIG STARTER PLATTER ', '', 3, '8.7000', '26.1000', '0.0000', 0, ''),
(375, 110, 96, 'vodka', '', 1, '10.0000', '10.0000', '0.0000', 0, ''),
(376, 110, 103, 'Rum', '', 1, '25.0000', '25.0000', '0.0000', 0, ''),
(377, 111, 103, 'Rum', '', 2, '25.0000', '50.0000', '0.0000', 0, ''),
(378, 111, 74, 'Enchiladas de maiz con pollo', '', 2, '10.9000', '21.8000', '0.0000', 0, ''),
(379, 111, 76, 'Steak Suramericano', '', 3, '18.9000', '56.7000', '0.0000', 0, ''),
(380, 111, 105, 'Vodka best', '', 3, '75.0000', '225.0000', '0.0000', 0, ''),
(381, 111, 89, 'Plato Verde ', '', 2, '10.9000', '21.8000', '0.0000', 0, ''),
(382, 112, 79, 'Plato Enchilada', '', 2, '18.9000', '37.8000', '0.0000', 0, ''),
(383, 112, 85, 'Fajita Pollo', '', 1, '15.9000', '15.9000', '0.0000', 0, ''),
(384, 112, 75, 'Enchiladas combinadas', '', 1, '11.9000', '11.9000', '0.0000', 0, ''),
(385, 112, 74, 'Enchiladas de maiz con pollo', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(386, 113, 72, 'Enchiladas Vegetarianas', '', 4, '9.9000', '39.6000', '0.0000', 0, ''),
(387, 113, 74, 'Enchiladas de maiz con pollo', '', 2, '10.9000', '21.8000', '0.0000', 0, ''),
(388, 114, 77, 'Peppercrust Steak', '', 2, '18.9000', '37.8000', '0.0000', 0, ''),
(389, 114, 80, 'The ultimate Buffalo Wings', '', 1, '12.9000', '12.9000', '0.0000', 0, ''),
(390, 114, 102, 'Koniac', '', 1, '15.0000', '15.0000', '0.0000', 0, ''),
(391, 114, 101, 'Absent', '', 4, '90.0000', '360.0000', '0.0000', 0, ''),
(392, 114, 78, 'Pavo Morelia', '', 2, '15.9000', '31.8000', '0.0000', 0, ''),
(393, 115, 93, 'Wagyu Burger', '', 3, '17.9000', '53.7000', '0.0000', 0, ''),
(394, 115, 105, 'Vodka best', '', 1, '75.0000', '75.0000', '0.0000', 0, ''),
(395, 115, 97, 'Rum3', '', 3, '45.0000', '135.0000', '0.0000', 0, ''),
(396, 115, 94, 'Vegetariana ', '', 3, '9.9000', '29.7000', '0.0000', 0, ''),
(397, 115, 68, 'TAQUITOS CON POLLO ', '', 3, '5.8000', '17.4000', '0.0000', 0, ''),
(398, 116, 100, 'Vine', '', 4, '55.0000', '220.0000', '0.0000', 0, ''),
(399, 116, 96, 'vodka', '', 1, '10.0000', '10.0000', '0.0000', 0, ''),
(400, 116, 80, 'The ultimate Buffalo Wings', '', 3, '12.9000', '38.7000', '0.0000', 0, ''),
(401, 116, 91, 'Double Bacon Cheese Burger', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(402, 117, 105, 'Vodka best', '', 3, '75.0000', '225.0000', '0.0000', 0, ''),
(403, 117, 79, 'Plato Enchilada', '', 4, '18.9000', '75.6000', '0.0000', 0, ''),
(404, 117, 84, 'Fajita Parrilla ', '', 3, '17.9000', '53.7000', '0.0000', 0, ''),
(405, 117, 71, 'Quesadas', '', 2, '4.0000', '8.0000', '0.0000', 0, ''),
(406, 117, 82, 'Chili con carne', '', 4, '12.9000', '51.6000', '0.0000', 0, ''),
(407, 118, 103, 'Rum', '', 3, '25.0000', '75.0000', '0.0000', 0, ''),
(408, 118, 89, 'Plato Verde ', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(409, 118, 84, 'Fajita Parrilla ', '', 1, '17.9000', '17.9000', '0.0000', 0, ''),
(410, 118, 104, 'Sem', '', 2, '69.0000', '138.0000', '0.0000', 0, ''),
(411, 119, 68, 'TAQUITOS CON POLLO ', '', 3, '5.8000', '17.4000', '0.0000', 0, ''),
(412, 119, 85, 'Fajita Pollo', '', 1, '15.9000', '15.9000', '0.0000', 0, ''),
(413, 120, 97, 'Rum3', '', 1, '45.0000', '45.0000', '0.0000', 0, ''),
(414, 120, 99, 'Tekila', '', 4, '35.0000', '140.0000', '0.0000', 0, ''),
(415, 120, 102, 'Koniac', '', 4, '15.0000', '60.0000', '0.0000', 0, ''),
(416, 120, 101, 'Absent', '', 3, '90.0000', '270.0000', '0.0000', 0, ''),
(417, 121, 88, 'Streetfood Tacos', '', 2, '11.9000', '23.8000', '0.0000', 0, ''),
(418, 121, 95, 'Ensalada Puebla', '', 1, '9.9000', '9.9000', '0.0000', 0, ''),
(419, 121, 92, 'El Gaucho', '', 4, '11.9000', '47.6000', '0.0000', 0, ''),
(420, 121, 99, 'Tekila', '', 4, '35.0000', '140.0000', '0.0000', 0, ''),
(421, 121, 80, 'The ultimate Buffalo Wings', '', 3, '12.9000', '38.7000', '0.0000', 0, ''),
(422, 122, 88, 'Streetfood Tacos', '', 2, '11.9000', '23.8000', '0.0000', 0, ''),
(423, 122, 92, 'El Gaucho', '', 4, '11.9000', '47.6000', '0.0000', 0, ''),
(424, 122, 86, 'Quesadillas Ligeras', '', 2, '11.9000', '23.8000', '0.0000', 0, ''),
(425, 123, 86, 'Quesadillas Ligeras', '', 3, '11.9000', '35.7000', '0.0000', 0, ''),
(426, 123, 65, 'CHIPS Y DIP', '', 1, '3.8000', '3.8000', '0.0000', 0, ''),
(427, 123, 80, 'The ultimate Buffalo Wings', '', 2, '12.9000', '25.8000', '0.0000', 0, ''),
(428, 123, 89, 'Plato Verde ', '', 4, '10.9000', '43.6000', '0.0000', 0, ''),
(429, 123, 72, 'Enchiladas Vegetarianas', '', 2, '9.9000', '19.8000', '0.0000', 0, ''),
(430, 124, 67, 'NACHOS ORIGINAL ', '', 4, '6.4000', '25.6000', '0.0000', 0, ''),
(431, 124, 91, 'Double Bacon Cheese Burger', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(432, 124, 71, 'Quesadas', '', 1, '4.0000', '4.0000', '0.0000', 0, ''),
(433, 125, 71, 'Quesadas', '', 3, '4.0000', '12.0000', '0.0000', 0, ''),
(434, 125, 96, 'vodka', '', 2, '10.0000', '20.0000', '0.0000', 0, ''),
(435, 125, 69, 'CHEESE SKINS ', '', 1, '5.4000', '5.4000', '0.0000', 0, ''),
(436, 125, 91, 'Double Bacon Cheese Burger', '', 1, '15.9000', '15.9000', '0.0000', 0, ''),
(437, 126, 93, 'Wagyu Burger', '', 4, '17.9000', '71.6000', '0.0000', 0, ''),
(438, 126, 83, 'Fajita Todos', '', 1, '17.9000', '17.9000', '0.0000', 0, ''),
(439, 126, 78, 'Pavo Morelia', '', 2, '15.9000', '31.8000', '0.0000', 0, ''),
(440, 127, 93, 'Wagyu Burger', '', 1, '17.9000', '17.9000', '0.0000', 0, ''),
(441, 127, 96, 'vodka', '', 1, '10.0000', '10.0000', '0.0000', 0, ''),
(442, 128, 101, 'Absent', '', 4, '90.0000', '360.0000', '0.0000', 0, ''),
(443, 128, 93, 'Wagyu Burger', '', 3, '17.9000', '53.7000', '0.0000', 0, ''),
(444, 128, 67, 'NACHOS ORIGINAL ', '', 4, '6.4000', '25.6000', '0.0000', 0, ''),
(445, 128, 88, 'Streetfood Tacos', '', 1, '11.9000', '11.9000', '0.0000', 0, ''),
(446, 129, 92, 'El Gaucho', '', 3, '11.9000', '35.7000', '0.0000', 0, ''),
(447, 129, 79, 'Plato Enchilada', '', 3, '18.9000', '56.7000', '0.0000', 0, ''),
(448, 130, 96, 'vodka', '', 1, '10.0000', '10.0000', '0.0000', 0, ''),
(449, 130, 71, 'Quesadas', '', 4, '4.0000', '16.0000', '0.0000', 0, ''),
(450, 130, 91, 'Double Bacon Cheese Burger', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(451, 130, 103, 'Rum', '', 1, '25.0000', '25.0000', '0.0000', 0, ''),
(452, 131, 89, 'Plato Verde ', '', 3, '10.9000', '32.7000', '0.0000', 0, ''),
(453, 131, 100, 'Vine', '', 4, '55.0000', '220.0000', '0.0000', 0, ''),
(454, 131, 101, 'Absent', '', 3, '90.0000', '270.0000', '0.0000', 0, ''),
(455, 131, 73, 'Enchiladas Clasicas', '', 2, '10.9000', '21.8000', '0.0000', 0, ''),
(456, 131, 86, 'Quesadillas Ligeras', '', 2, '11.9000', '23.8000', '0.0000', 0, ''),
(457, 132, 82, 'Chili con carne', '', 3, '12.9000', '38.7000', '0.0000', 0, ''),
(458, 132, 95, 'Ensalada Puebla', '', 1, '9.9000', '9.9000', '0.0000', 0, ''),
(459, 132, 72, 'Enchiladas Vegetarianas', '', 3, '9.9000', '29.7000', '0.0000', 0, ''),
(460, 132, 67, 'NACHOS ORIGINAL ', '', 1, '6.4000', '6.4000', '0.0000', 0, ''),
(461, 133, 78, 'Pavo Morelia', '', 3, '15.9000', '47.7000', '0.0000', 0, ''),
(462, 133, 91, 'Double Bacon Cheese Burger', '', 3, '15.9000', '47.7000', '0.0000', 0, ''),
(463, 134, 98, 'Rum 2', '', 1, '50.0000', '50.0000', '0.0000', 0, ''),
(464, 134, 79, 'Plato Enchilada', '', 1, '18.9000', '18.9000', '0.0000', 0, ''),
(465, 134, 91, 'Double Bacon Cheese Burger', '', 2, '15.9000', '31.8000', '0.0000', 0, ''),
(466, 134, 89, 'Plato Verde ', '', 2, '10.9000', '21.8000', '0.0000', 0, ''),
(467, 134, 78, 'Pavo Morelia', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(468, 135, 100, 'Vine', '', 1, '55.0000', '55.0000', '0.0000', 0, ''),
(469, 135, 68, 'TAQUITOS CON POLLO ', '', 3, '5.8000', '17.4000', '0.0000', 0, ''),
(470, 136, 97, 'Rum3', '', 1, '45.0000', '45.0000', '0.0000', 0, ''),
(471, 136, 95, 'Ensalada Puebla', '', 3, '9.9000', '29.7000', '0.0000', 0, ''),
(472, 136, 69, 'CHEESE SKINS ', '', 1, '5.4000', '5.4000', '0.0000', 0, ''),
(473, 136, 75, 'Enchiladas combinadas', '', 3, '11.9000', '35.7000', '0.0000', 0, ''),
(474, 136, 101, 'Absent', '', 2, '90.0000', '180.0000', '0.0000', 0, ''),
(475, 137, 103, 'Rum', '', 3, '25.0000', '75.0000', '0.0000', 0, ''),
(476, 137, 74, 'Enchiladas de maiz con pollo', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(477, 138, 82, 'Chili con carne', '', 4, '12.9000', '51.6000', '0.0000', 0, ''),
(478, 138, 90, 'Clasica', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(479, 138, 83, 'Fajita Todos', '', 2, '17.9000', '35.8000', '0.0000', 0, ''),
(480, 138, 97, 'Rum3', '', 3, '45.0000', '135.0000', '0.0000', 0, ''),
(481, 139, 88, 'Streetfood Tacos', '', 3, '11.9000', '35.7000', '0.0000', 0, ''),
(482, 139, 82, 'Chili con carne', '', 4, '12.9000', '51.6000', '0.0000', 0, ''),
(483, 139, 84, 'Fajita Parrilla ', '', 2, '17.9000', '35.8000', '0.0000', 0, ''),
(484, 139, 99, 'Tekila', '', 2, '35.0000', '70.0000', '0.0000', 0, ''),
(485, 140, 104, 'Sem', '', 1, '69.0000', '69.0000', '0.0000', 0, ''),
(486, 140, 90, 'Clasica', '', 3, '10.9000', '32.7000', '0.0000', 0, ''),
(487, 140, 100, 'Vine', '', 2, '55.0000', '110.0000', '0.0000', 0, ''),
(488, 140, 68, 'TAQUITOS CON POLLO ', '', 1, '5.8000', '5.8000', '0.0000', 0, ''),
(489, 141, 71, 'Quesadas', '', 4, '4.0000', '16.0000', '0.0000', 0, ''),
(490, 141, 68, 'TAQUITOS CON POLLO ', '', 1, '5.8000', '5.8000', '0.0000', 0, ''),
(491, 141, 86, 'Quesadillas Ligeras', '', 3, '11.9000', '35.7000', '0.0000', 0, ''),
(492, 141, 94, 'Vegetariana ', '', 2, '9.9000', '19.8000', '0.0000', 0, ''),
(493, 141, 74, 'Enchiladas de maiz con pollo', '', 4, '10.9000', '43.6000', '0.0000', 0, ''),
(494, 142, 78, 'Pavo Morelia', '', 3, '15.9000', '47.7000', '0.0000', 0, ''),
(495, 142, 74, 'Enchiladas de maiz con pollo', '', 2, '10.9000', '21.8000', '0.0000', 0, ''),
(496, 142, 87, 'Plato Mexicano', '', 2, '12.9000', '25.8000', '0.0000', 0, ''),
(497, 142, 101, 'Absent', '', 1, '90.0000', '90.0000', '0.0000', 0, ''),
(498, 143, 91, 'Double Bacon Cheese Burger', '', 1, '15.9000', '15.9000', '0.0000', 0, ''),
(499, 143, 88, 'Streetfood Tacos', '', 2, '11.9000', '23.8000', '0.0000', 0, ''),
(500, 143, 68, 'TAQUITOS CON POLLO ', '', 1, '5.8000', '5.8000', '0.0000', 0, ''),
(501, 144, 79, 'Plato Enchilada', '', 1, '18.9000', '18.9000', '0.0000', 0, ''),
(502, 144, 70, 'BIG STARTER PLATTER ', '', 4, '8.7000', '34.8000', '0.0000', 0, ''),
(503, 144, 84, 'Fajita Parrilla ', '', 3, '17.9000', '53.7000', '0.0000', 0, ''),
(504, 144, 101, 'Absent', '', 4, '90.0000', '360.0000', '0.0000', 0, ''),
(505, 145, 85, 'Fajita Pollo', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(506, 145, 88, 'Streetfood Tacos', '', 3, '11.9000', '35.7000', '0.0000', 0, ''),
(507, 146, 74, 'Enchiladas de maiz con pollo', '', 3, '10.9000', '32.7000', '0.0000', 0, ''),
(508, 146, 101, 'Absent', '', 2, '90.0000', '180.0000', '0.0000', 0, ''),
(509, 146, 67, 'NACHOS ORIGINAL ', '', 3, '6.4000', '19.2000', '0.0000', 0, ''),
(510, 146, 93, 'Wagyu Burger', '', 2, '17.9000', '35.8000', '0.0000', 0, ''),
(511, 146, 97, 'Rum3', '', 1, '45.0000', '45.0000', '0.0000', 0, ''),
(512, 147, 70, 'BIG STARTER PLATTER ', '', 2, '8.7000', '17.4000', '0.0000', 0, ''),
(513, 147, 71, 'Quesadas', '', 1, '4.0000', '4.0000', '0.0000', 0, ''),
(514, 147, 98, 'Rum 2', '', 1, '50.0000', '50.0000', '0.0000', 0, ''),
(515, 147, 104, 'Sem', '', 1, '69.0000', '69.0000', '0.0000', 0, ''),
(516, 147, 92, 'El Gaucho', '', 2, '11.9000', '23.8000', '0.0000', 0, ''),
(517, 148, 76, 'Steak Suramericano', '', 4, '18.9000', '75.6000', '0.0000', 0, ''),
(518, 148, 85, 'Fajita Pollo', '', 4, '15.9000', '63.6000', '0.0000', 0, ''),
(519, 148, 105, 'Vodka best', '', 3, '75.0000', '225.0000', '0.0000', 0, ''),
(520, 148, 70, 'BIG STARTER PLATTER ', '', 2, '8.7000', '17.4000', '0.0000', 0, ''),
(521, 148, 69, 'CHEESE SKINS ', '', 4, '5.4000', '21.6000', '0.0000', 0, ''),
(522, 149, 75, 'Enchiladas combinadas', '', 2, '11.9000', '23.8000', '0.0000', 0, ''),
(523, 149, 79, 'Plato Enchilada', '', 3, '18.9000', '56.7000', '0.0000', 0, ''),
(524, 149, 76, 'Steak Suramericano', '', 2, '18.9000', '37.8000', '0.0000', 0, ''),
(525, 150, 69, 'CHEESE SKINS ', '', 2, '5.4000', '10.8000', '0.0000', 0, ''),
(526, 150, 95, 'Ensalada Puebla', '', 1, '9.9000', '9.9000', '0.0000', 0, ''),
(527, 151, 68, 'TAQUITOS CON POLLO ', '', 1, '5.8000', '5.8000', '0.0000', 0, ''),
(528, 151, 87, 'Plato Mexicano', '', 2, '12.9000', '25.8000', '0.0000', 0, ''),
(529, 151, 88, 'Streetfood Tacos', '', 4, '11.9000', '47.6000', '0.0000', 0, ''),
(530, 151, 100, 'Vine', '', 3, '55.0000', '165.0000', '0.0000', 0, ''),
(531, 152, 90, 'Clasica', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(532, 153, 90, 'Clasica', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(533, 154, 90, 'Clasica', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(534, 155, 90, 'Clasica', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(535, 156, 90, 'Clasica', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(536, 157, 90, 'Clasica', '', 1, '10.9000', '10.9000', '0.0000', 0, ''),
(537, 158, 90, 'Clasica', '', 1, '10.9000', '10.9000', '0.0000', 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_recurring_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_status`
--

CREATE TABLE IF NOT EXISTS `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired'),
(2, 2, 'Processing'),
(3, 2, 'Shipped'),
(7, 2, 'Canceled'),
(5, 2, 'Complete'),
(8, 2, 'Denied'),
(9, 2, 'Canceled Reversal'),
(10, 2, 'Failed'),
(11, 2, 'Refunded'),
(12, 2, 'Reversed'),
(13, 2, 'Chargeback'),
(1, 2, 'Pending'),
(16, 2, 'Voided'),
(15, 2, 'Processed'),
(14, 2, 'Expired'),
(2, 3, 'Processing'),
(3, 3, 'Shipped'),
(7, 3, 'Canceled'),
(5, 3, 'Complete'),
(8, 3, 'Denied'),
(9, 3, 'Canceled Reversal'),
(10, 3, 'Failed'),
(11, 3, 'Refunded'),
(12, 3, 'Reversed'),
(13, 3, 'Chargeback'),
(1, 3, 'Pending'),
(16, 3, 'Voided'),
(15, 3, 'Processed'),
(14, 3, 'Expired');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_total`
--

CREATE TABLE IF NOT EXISTS `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_pavblog_blog`
--

CREATE TABLE IF NOT EXISTS `oc_pavblog_blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `date_modified` date NOT NULL,
  `video_code` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `tags` varchar(255) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `oc_pavblog_blog`
--

INSERT INTO `oc_pavblog_blog` (`blog_id`, `category_id`, `position`, `created`, `status`, `user_id`, `hits`, `image`, `meta_keyword`, `meta_description`, `meta_title`, `date_modified`, `video_code`, `params`, `tags`, `featured`, `keyword`) VALUES
(7, 21, 2, '2013-03-09', 1, 1, 48, 'catalog/demo/pavblog/img-blog1.jpg', '', '', '', '2014-12-23', '', '', 'joomla, prestashop, magento', 1, ''),
(9, 21, 4, '2013-03-09', 1, 1, 75, 'catalog/demo/pavblog/img-blog4.jpg', '', '', '', '2014-12-23', '', '', 'prestashop, magento', 0, ''),
(10, 21, 3, '2013-03-09', 1, 1, 250, 'catalog/demo/pavblog/img-blog3.jpg', 'test test', '', 'Custom SEO Titlte', '2014-12-30', '', '', 'prestashop', 0, ''),
(11, 21, 1, '2013-03-11', 1, 1, 60, 'catalog/demo/pavblog/img-blog5.jpg', '', '', '', '2014-12-23', '', '', 'opencart', 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_pavblog_blog_description`
--

CREATE TABLE IF NOT EXISTS `oc_pavblog_blog_description` (
  `blog_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_pavblog_blog_description`
--

INSERT INTO `oc_pavblog_blog_description` (`blog_id`, `language_id`, `title`, `description`, `content`) VALUES
(11, 1, 'Donec tellus Nulla lorem Nullam elit id ut', '&lt;p&gt;Donec tellus Nulla lorem Nullam elit id ut elit feugiat lacus. Congue eget dapibus congue tincidunt senectus nibh risus Phasellus tristique justo. Justo Pellentesque Donec lobortis faucibus Vestibulum Praesent mauris volutpat vitae metus. Ipsum cursus vestibulum at interdum Vivamus nunc fringilla Curabitur ac quis. Nam lacinia wisi tortor orci quis vitae.&lt;/p&gt;', '&lt;div class=&quot;itemFullText&quot;&gt;&lt;p&gt;Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur magna. Euismod euismod Suspendisse tortor ante adipiscing risus Aenean Lorem vitae id. Odio ut pretium ligula quam Vestibulum consequat convallis fringilla Vestibulum nulla. Accumsan morbi tristique auctor Aenean nulla lacinia Nullam elit vel vel. At risus pretium urna tortor metus fringilla interdum mauris tempor congue.&lt;/p&gt;&lt;p&gt;Donec tellus Nulla lorem Nullam elit id ut elit feugiat lacus. Congue eget dapibus congue tincidunt senectus nibh risus Phasellus tristique justo. Justo Pellentesque Donec lobortis faucibus Vestibulum Praesent mauris volutpat vitae metus. Ipsum cursus vestibulum at interdum Vivamus nunc fringilla Curabitur ac quis. Nam lacinia wisi tortor orci quis vitae.&lt;/p&gt;&lt;p&gt;Sed mauris Pellentesque elit Aliquam at lacus interdum nascetur elit ipsum. Enim ipsum hendrerit Suspendisse turpis laoreet fames tempus ligula pede ac. Et Lorem penatibus orci eu ultrices egestas Nam quam Vivamus nibh. Morbi condimentum molestie Nam enim odio sodales pretium eros sem pellentesque. Sit tellus Integer elit egestas lacus turpis id auctor nascetur ut. Ac elit vitae.&lt;/p&gt;&lt;p&gt;Mi vitae magnis Fusce laoreet nibh felis porttitor laoreet Vestibulum faucibus. At Nulla id tincidunt ut sed semper vel Lorem condimentum ornare. Laoreet Vestibulum lacinia massa a commodo habitasse velit Vestibulum tincidunt In. Turpis at eleifend leo mi elit Aenean porta ac sed faucibus. Nunc urna Morbi fringilla vitae orci convallis condimentum auctor sit dui. Urna pretium elit mauris cursus Curabitur at elit Vestibulum.&lt;/p&gt;&lt;/div&gt;'),
(11, 2, '', '&lt;p&gt;Donec tellus Nulla lorem Nullam elit id ut elit feugiat lacus. Congue eget dapibus congue tincidunt senectus nibh risus Phasellus tristique justo. Justo Pellentesque Donec lobortis faucibus Vestibulum Praesent mauris volutpat vitae metus. Ipsum cursus vestibulum at interdum Vivamus nunc fringilla Curabitur ac quis. Nam lacinia wisi tortor orci quis vitae.&lt;/p&gt;', '&lt;div class=&quot;itemFullText&quot;&gt;&lt;p&gt;Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur magna. Euismod euismod Suspendisse tortor ante adipiscing risus Aenean Lorem vitae id. Odio ut pretium ligula quam Vestibulum consequat convallis fringilla Vestibulum nulla. Accumsan morbi tristique auctor Aenean nulla lacinia Nullam elit vel vel. At risus pretium urna tortor metus fringilla interdum mauris tempor congue.&lt;/p&gt;&lt;p&gt;Donec tellus Nulla lorem Nullam elit id ut elit feugiat lacus. Congue eget dapibus congue tincidunt senectus nibh risus Phasellus tristique justo. Justo Pellentesque Donec lobortis faucibus Vestibulum Praesent mauris volutpat vitae metus. Ipsum cursus vestibulum at interdum Vivamus nunc fringilla Curabitur ac quis. Nam lacinia wisi tortor orci quis vitae.&lt;/p&gt;&lt;p&gt;Sed mauris Pellentesque elit Aliquam at lacus interdum nascetur elit ipsum. Enim ipsum hendrerit Suspendisse turpis laoreet fames tempus ligula pede ac. Et Lorem penatibus orci eu ultrices egestas Nam quam Vivamus nibh. Morbi condimentum molestie Nam enim odio sodales pretium eros sem pellentesque. Sit tellus Integer elit egestas lacus turpis id auctor nascetur ut. Ac elit vitae.&lt;/p&gt;&lt;p&gt;Mi vitae magnis Fusce laoreet nibh felis porttitor laoreet Vestibulum faucibus. At Nulla id tincidunt ut sed semper vel Lorem condimentum ornare. Laoreet Vestibulum lacinia massa a commodo habitasse velit Vestibulum tincidunt In. Turpis at eleifend leo mi elit Aenean porta ac sed faucibus. Nunc urna Morbi fringilla vitae orci convallis condimentum auctor sit dui. Urna pretium elit mauris cursus Curabitur at elit Vestibulum.&lt;/p&gt;&lt;/div&gt;'),
(7, 1, 'Ac tincidunt Suspendisse malesuada', '&lt;p&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum. Praesent Nam adipiscing Aliquam elit accumsan wisi sit semper scelerisque convallis. Sed quisque cum velit&lt;/p&gt;', '&lt;div class=&quot;itemFullText&quot;&gt;&lt;p&gt;Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur magna. Euismod euismod Suspendisse tortor ante adipiscing risus Aenean Lorem vitae id. Odio ut pretium ligula quam Vestibulum consequat convallis fringilla Vestibulum nulla. Accumsan morbi tristique auctor Aenean nulla lacinia Nullam elit vel vel. At risus pretium urna tortor metus fringilla interdum mauris tempor congue.&lt;/p&gt;&lt;p&gt;Donec tellus Nulla lorem Nullam elit id ut elit feugiat lacus. Congue eget dapibus congue tincidunt senectus nibh risus Phasellus tristique justo. Justo Pellentesque Donec lobortis faucibus Vestibulum Praesent mauris volutpat vitae metus. Ipsum cursus vestibulum at interdum Vivamus nunc fringilla Curabitur ac quis. Nam lacinia wisi tortor orci quis vitae.&lt;/p&gt;&lt;p&gt;Sed mauris Pellentesque elit Aliquam at lacus interdum nascetur elit ipsum. Enim ipsum hendrerit Suspendisse turpis laoreet fames tempus ligula pede ac. Et Lorem penatibus orci eu ultrices egestas Nam quam Vivamus nibh. Morbi condimentum molestie Nam enim odio sodales pretium eros sem pellentesque. Sit tellus Integer elit egestas lacus turpis id auctor nascetur ut. Ac elit vitae.&lt;/p&gt;&lt;p&gt;Mi vitae magnis Fusce laoreet nibh felis porttitor laoreet Vestibulum faucibus. At Nulla id tincidunt ut sed semper vel Lorem condimentum ornare. Laoreet Vestibulum lacinia massa a commodo habitasse velit Vestibulum tincidunt In. Turpis at eleifend leo mi elit Aenean porta ac sed faucibus. Nunc urna Morbi fringilla vitae orci convallis condimentum auctor sit dui. Urna pretium elit mauris cursus Curabitur at elit Vestibulum.&lt;/p&gt;&lt;/div&gt;'),
(7, 2, '', '&lt;p&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum. Praesent Nam adipiscing Aliquam elit accumsan wisi sit semper scelerisque convallis. Sed quisque cum velit&lt;/p&gt;', '&lt;div class=&quot;itemFullText&quot;&gt;&lt;p&gt;Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur magna. Euismod euismod Suspendisse tortor ante adipiscing risus Aenean Lorem vitae id. Odio ut pretium ligula quam Vestibulum consequat convallis fringilla Vestibulum nulla. Accumsan morbi tristique auctor Aenean nulla lacinia Nullam elit vel vel. At risus pretium urna tortor metus fringilla interdum mauris tempor congue.&lt;/p&gt;&lt;p&gt;Donec tellus Nulla lorem Nullam elit id ut elit feugiat lacus. Congue eget dapibus congue tincidunt senectus nibh risus Phasellus tristique justo. Justo Pellentesque Donec lobortis faucibus Vestibulum Praesent mauris volutpat vitae metus. Ipsum cursus vestibulum at interdum Vivamus nunc fringilla Curabitur ac quis. Nam lacinia wisi tortor orci quis vitae.&lt;/p&gt;&lt;p&gt;Sed mauris Pellentesque elit Aliquam at lacus interdum nascetur elit ipsum. Enim ipsum hendrerit Suspendisse turpis laoreet fames tempus ligula pede ac. Et Lorem penatibus orci eu ultrices egestas Nam quam Vivamus nibh. Morbi condimentum molestie Nam enim odio sodales pretium eros sem pellentesque. Sit tellus Integer elit egestas lacus turpis id auctor nascetur ut. Ac elit vitae.&lt;/p&gt;&lt;p&gt;Mi vitae magnis Fusce laoreet nibh felis porttitor laoreet Vestibulum faucibus. At Nulla id tincidunt ut sed semper vel Lorem condimentum ornare. Laoreet Vestibulum lacinia massa a commodo habitasse velit Vestibulum tincidunt In. Turpis at eleifend leo mi elit Aenean porta ac sed faucibus. Nunc urna Morbi fringilla vitae orci convallis condimentum auctor sit dui. Urna pretium elit mauris cursus Curabitur at elit Vestibulum.&lt;/p&gt;&lt;/div&gt;'),
(9, 1, 'Commodo laoreet semper tincidunt lorem ', '&lt;p&gt;Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur magna. Euismod euismod Suspendisse tortor ante adipiscing risus Aenean Lorem vitae id. Odio ut pretium ligula quam Vestibulum consequat convallis fringilla Vestibulum nulla. Accumsan morbi tristique auctor Aenean nulla lacinia Nullam elit vel vel. At risus pretium urna tortor metus fringilla interdum mauris tempor congue&lt;/p&gt;', '&lt;div class=&quot;itemFullText&quot;&gt;&lt;p&gt;Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur magna. Euismod euismod Suspendisse tortor ante adipiscing risus Aenean Lorem vitae id. Odio ut pretium ligula quam Vestibulum consequat convallis fringilla Vestibulum nulla. Accumsan morbi tristique auctor Aenean nulla lacinia Nullam elit vel vel. At risus pretium urna tortor metus fringilla interdum mauris tempor congue.&lt;/p&gt;&lt;p&gt;Donec tellus Nulla lorem Nullam elit id ut elit feugiat lacus. Congue eget dapibus congue tincidunt senectus nibh risus Phasellus tristique justo. Justo Pellentesque Donec lobortis faucibus Vestibulum Praesent mauris volutpat vitae metus. Ipsum cursus vestibulum at interdum Vivamus nunc fringilla Curabitur ac quis. Nam lacinia wisi tortor orci quis vitae.&lt;/p&gt;&lt;p&gt;Sed mauris Pellentesque elit Aliquam at lacus interdum nascetur elit ipsum. Enim ipsum hendrerit Suspendisse turpis laoreet fames tempus ligula pede ac. Et Lorem penatibus orci eu ultrices egestas Nam quam Vivamus nibh. Morbi condimentum molestie Nam enim odio sodales pretium eros sem pellentesque. Sit tellus Integer elit egestas lacus turpis id auctor nascetur ut. Ac elit vitae.&lt;/p&gt;&lt;p&gt;Mi vitae magnis Fusce laoreet nibh felis porttitor laoreet Vestibulum faucibus. At Nulla id tincidunt ut sed semper vel Lorem condimentum ornare. Laoreet Vestibulum lacinia massa a commodo habitasse velit Vestibulum tincidunt In. Turpis at eleifend leo mi elit Aenean porta ac sed faucibus. Nunc urna Morbi fringilla vitae orci convallis condimentum auctor sit dui. Urna pretium elit mauris cursus Curabitur at elit Vestibulum.&lt;/p&gt;&lt;/div&gt;'),
(9, 2, '', '&lt;p&gt;Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur magna. Euismod euismod Suspendisse tortor ante adipiscing risus Aenean Lorem vitae id. Odio ut pretium ligula quam Vestibulum consequat convallis fringilla Vestibulum nulla. Accumsan morbi tristique auctor Aenean nulla lacinia Nullam elit vel vel. At risus pretium urna tortor metus fringilla interdum mauris tempor congue&lt;/p&gt;', '&lt;div class=&quot;itemFullText&quot;&gt;&lt;p&gt;Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur magna. Euismod euismod Suspendisse tortor ante adipiscing risus Aenean Lorem vitae id. Odio ut pretium ligula quam Vestibulum consequat convallis fringilla Vestibulum nulla. Accumsan morbi tristique auctor Aenean nulla lacinia Nullam elit vel vel. At risus pretium urna tortor metus fringilla interdum mauris tempor congue.&lt;/p&gt;&lt;p&gt;Donec tellus Nulla lorem Nullam elit id ut elit feugiat lacus. Congue eget dapibus congue tincidunt senectus nibh risus Phasellus tristique justo. Justo Pellentesque Donec lobortis faucibus Vestibulum Praesent mauris volutpat vitae metus. Ipsum cursus vestibulum at interdum Vivamus nunc fringilla Curabitur ac quis. Nam lacinia wisi tortor orci quis vitae.&lt;/p&gt;&lt;p&gt;Sed mauris Pellentesque elit Aliquam at lacus interdum nascetur elit ipsum. Enim ipsum hendrerit Suspendisse turpis laoreet fames tempus ligula pede ac. Et Lorem penatibus orci eu ultrices egestas Nam quam Vivamus nibh. Morbi condimentum molestie Nam enim odio sodales pretium eros sem pellentesque. Sit tellus Integer elit egestas lacus turpis id auctor nascetur ut. Ac elit vitae.&lt;/p&gt;&lt;p&gt;Mi vitae magnis Fusce laoreet nibh felis porttitor laoreet Vestibulum faucibus. At Nulla id tincidunt ut sed semper vel Lorem condimentum ornare. Laoreet Vestibulum lacinia massa a commodo habitasse velit Vestibulum tincidunt In. Turpis at eleifend leo mi elit Aenean porta ac sed faucibus. Nunc urna Morbi fringilla vitae orci convallis condimentum auctor sit dui. Urna pretium elit mauris cursus Curabitur at elit Vestibulum.&lt;/p&gt;&lt;/div&gt;'),
(10, 1, 'Neque porro quisquam est, qui dolorem ipsum', '&lt;p&gt;&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.&lt;/p&gt;', '&lt;p&gt;Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&lt;/p&gt;'),
(10, 2, '', '&lt;p&gt;&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.&lt;/p&gt;', '&lt;p&gt;Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_pavblog_category`
--

CREATE TABLE IF NOT EXISTS `oc_pavblog_category` (
  `category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `is_group` smallint(6) NOT NULL DEFAULT '2',
  `width` varchar(255) DEFAULT NULL,
  `submenu_width` varchar(255) DEFAULT NULL,
  `colum_width` varchar(255) DEFAULT NULL,
  `submenu_colum_width` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `colums` varchar(255) DEFAULT '1',
  `type` varchar(255) NOT NULL,
  `is_content` smallint(6) NOT NULL DEFAULT '2',
  `show_title` smallint(6) NOT NULL DEFAULT '1',
  `meta_keyword` varchar(255) NOT NULL DEFAULT '1',
  `level_depth` smallint(6) NOT NULL DEFAULT '0',
  `published` smallint(6) NOT NULL DEFAULT '1',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position` int(11) unsigned NOT NULL DEFAULT '0',
  `show_sub` smallint(6) NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(25) DEFAULT NULL,
  `privacy` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_type` varchar(25) DEFAULT 'top',
  `menu_class` varchar(25) DEFAULT NULL,
  `description` text,
  `meta_description` text,
  `meta_title` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `left` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Дамп данных таблицы `oc_pavblog_category`
--

INSERT INTO `oc_pavblog_category` (`category_id`, `image`, `parent_id`, `is_group`, `width`, `submenu_width`, `colum_width`, `submenu_colum_width`, `item`, `colums`, `type`, `is_content`, `show_title`, `meta_keyword`, `level_depth`, `published`, `store_id`, `position`, `show_sub`, `url`, `target`, `privacy`, `position_type`, `menu_class`, `description`, `meta_description`, `meta_title`, `level`, `left`, `right`, `keyword`) VALUES
(1, '', 0, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, '1', 0, 1, 0, 0, 0, NULL, NULL, 0, 'top', NULL, NULL, NULL, NULL, -5, 34, 47, ''),
(20, 'data/pavblog/pav-c3.jpg', 22, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, '1', 0, 1, 0, 3, 0, NULL, NULL, 0, 'top', 'test test', NULL, '', '', 0, 0, 0, ''),
(21, 'data/pavblog/pav-c1.jpg', 22, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, '1', 0, 1, 0, 1, 0, NULL, NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, ''),
(22, 'data/demo/canon_eos_5d_1.jpg', 1, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, '1', 0, 1, 0, 1, 0, NULL, NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, ''),
(23, 'data/pavblog/pav-c2.jpg', 22, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, '1', 0, 1, 0, 2, 0, NULL, NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, ''),
(24, 'data/logo.png', 1, 2, NULL, NULL, NULL, NULL, NULL, '1', '', 2, 1, '1', 0, 1, 0, 2, 0, NULL, NULL, 0, 'top', '', NULL, '', '', 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_pavblog_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_pavblog_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_pavblog_category_description`
--

INSERT INTO `oc_pavblog_category_description` (`category_id`, `language_id`, `title`, `description`) VALUES
(1, 1, 'ROOT', 'Menu Root'),
(22, 1, 'Demo Category 1', '&lt;p&gt;Enter your Category 1 Description Here&lt;/p&gt;'),
(24, 1, 'Demo Category 2', '&lt;p&gt;Description Here&lt;/p&gt;\r\n'),
(20, 2, 'Demo Category 1-2', '&lt;p&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum. Praesent Nam adipiscing Aliquam elit accumsan wisi sit semper scelerisque convallis&lt;/p&gt;'),
(21, 1, 'Demo Category 1 2-1', '&lt;p&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum. Praesent Nam adipiscing Aliquam elit accumsan wisi sit semper scelerisque convallis&lt;/p&gt;'),
(23, 1, 'Demo Category 1-2-2', '&lt;p&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum. Praesent Nam adipiscing Aliquam elit accumsan wisi sit semper scelerisque convallis&lt;/p&gt;\r\n'),
(21, 2, 'Demo Category 1 2-1', '&lt;p&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum. Praesent Nam adipiscing Aliquam elit accumsan wisi sit semper scelerisque convallis&lt;/p&gt;'),
(23, 2, 'Demo Category 1-2-2', '&lt;p&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum. Praesent Nam adipiscing Aliquam elit accumsan wisi sit semper scelerisque convallis&lt;/p&gt;'),
(20, 1, 'Demo Category 1-2', '&lt;p&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum. Praesent Nam adipiscing Aliquam elit accumsan wisi sit semper scelerisque convallis&lt;/p&gt;'),
(22, 2, 'Demo Category 1', '&lt;p&gt;Enter your Category 1 Description Here&lt;/p&gt;'),
(24, 2, 'Demo Category 2', '&lt;p&gt;Enter your Category 1 Description Here&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_pavblog_comment`
--

CREATE TABLE IF NOT EXISTS `oc_pavblog_comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) unsigned NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `user` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_blog_comment` (`blog_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `oc_pavblog_comment`
--

INSERT INTO `oc_pavblog_comment` (`comment_id`, `blog_id`, `comment`, `status`, `created`, `user`, `email`) VALUES
(6, 10, 'Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur mag Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur mag', 1, '2013-03-12 14:23:09', 'ha cong tien', 'hatuhn@gmail.com'),
(7, 10, 'Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur mag', 1, '2013-03-12 14:25:19', 'ha cong tien', 'hatuhn@gmail.com'),
(8, 10, 'Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur mag Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur mag', 1, '2013-03-12 14:30:17', 'Test Test ', 'ngoisao@aa.com');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_pavnewsletter_email`
--

CREATE TABLE IF NOT EXISTS `oc_pavnewsletter_email` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `attach` varchar(200) DEFAULT NULL,
  `message` text,
  `customer_group_id` int(11) DEFAULT NULL,
  `affiliate` varchar(255) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `product` varchar(255) DEFAULT NULL,
  `defined` varchar(255) DEFAULT NULL,
  `special` varchar(255) DEFAULT NULL,
  `latest` varchar(255) DEFAULT NULL,
  `popular` varchar(255) DEFAULT NULL,
  `defined_categories` varchar(255) DEFAULT NULL,
  `categories` varchar(255) DEFAULT NULL,
  `defined_products` varchar(255) DEFAULT NULL,
  `defined_products_more` varchar(255) DEFAULT NULL,
  `only_selected_language` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `to` varchar(200) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_pavnewsletter_history`
--

CREATE TABLE IF NOT EXISTS `oc_pavnewsletter_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `public_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `to` varchar(255) NOT NULL,
  `subject` text,
  `message` text,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_pavnewsletter_subscribe`
--

CREATE TABLE IF NOT EXISTS `oc_pavnewsletter_subscribe` (
  `subscribe_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT '0',
  `store_id` int(11) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `action` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`subscribe_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `oc_pavnewsletter_subscribe`
--

INSERT INTO `oc_pavnewsletter_subscribe` (`subscribe_id`, `customer_id`, `store_id`, `email`, `action`) VALUES
(1, 0, 0, 'van@gmail.com', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_pavnewsletter_template`
--

CREATE TABLE IF NOT EXISTS `oc_pavnewsletter_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `hits` tinyint(4) DEFAULT '0',
  `template_file` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_pavnewsletter_template_description`
--

CREATE TABLE IF NOT EXISTS `oc_pavnewsletter_template_description` (
  `template_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `template_message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_pavoslidergroups`
--

CREATE TABLE IF NOT EXISTS `oc_pavoslidergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `oc_pavoslidergroups`
--

INSERT INTO `oc_pavoslidergroups` (`id`, `title`, `params`) VALUES
(1, 'Slider', 'a:28:{s:5:"title";s:6:"Slider";s:5:"delay";s:4:"9000";s:9:"fullwidth";s:0:"";s:5:"width";s:3:"870";s:6:"height";s:3:"447";s:12:"touch_mobile";s:1:"1";s:13:"stop_on_hover";s:1:"0";s:12:"shuffle_mode";s:1:"0";s:14:"image_cropping";s:1:"0";s:11:"shadow_type";s:1:"0";s:14:"show_time_line";s:1:"0";s:18:"time_line_position";s:3:"top";s:16:"background_color";s:0:"";s:6:"margin";s:0:"";s:7:"padding";s:0:"";s:16:"background_image";s:1:"0";s:14:"background_url";s:0:"";s:14:"navigator_type";s:6:"bullet";s:16:"navigator_arrows";s:16:"verticalcentered";s:16:"navigation_style";s:5:"round";s:17:"offset_horizontal";s:1:"0";s:15:"offset_vertical";s:2:"20";s:14:"show_navigator";s:1:"1";s:20:"hide_navigator_after";s:3:"200";s:15:"thumbnail_width";s:3:"100";s:16:"thumbnail_height";s:2:"50";s:16:"thumbnail_amount";s:1:"5";s:17:"hide_screen_width";s:0:"";}');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_pavosliderlayers`
--

CREATE TABLE IF NOT EXISTS `oc_pavosliderlayers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `params` text NOT NULL,
  `layersparams` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  `language_id` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `oc_pavosliderlayers`
--

INSERT INTO `oc_pavosliderlayers` (`id`, `title`, `parent_id`, `group_id`, `params`, `layersparams`, `image`, `status`, `position`, `language_id`) VALUES
(1, 'Slider01', 0, 1, 'a:17:{s:2:"id";s:1:"1";s:15:"slider_group_id";s:1:"1";s:12:"slider_title";s:8:"Slider01";s:18:"slider_language_id";s:1:"1";s:13:"slider_status";s:1:"1";s:17:"slider_transition";s:6:"random";s:11:"slider_slot";s:1:"7";s:15:"slider_rotation";s:1:"0";s:15:"slider_duration";s:3:"300";s:12:"slider_delay";s:1:"0";s:11:"slider_link";s:0:"";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"1";s:12:"slider_image";s:35:"catalog/demo/slider/img-slider1.jpg";}', 'O:8:"stdClass":1:{s:6:"layers";a:6:{i:0;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:1;s:13:"layer_content";s:30:"catalog/demo/slider/image1.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 1";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"164";s:10:"layer_left";s:2:"42";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"365";}i:1;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:2;s:13:"layer_content";s:31:"catalog/demo/slider/saleoff.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 2";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"56";s:10:"layer_left";s:3:"102";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"819";}i:2;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:3;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:16:"large_black_text";s:13:"layer_caption";s:15:"Curabitur velit";s:15:"layer_animation";s:3:"lft";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"80";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"1528";}i:3;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:4;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:11:"small_text ";s:13:"layer_caption";s:88:"Velit in leo tempus velit in leo fermentum &lt;br /&gt; congue odio ac nunc sollicitudin";s:15:"layer_animation";s:3:"lfr";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"150";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2174";}i:4;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:5;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:13:"bold_red_text";s:13:"layer_caption";s:5:"$2600";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"216";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2400";}i:5;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:6;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:27:"tp-button btn-theme-primary";s:13:"layer_caption";s:8:"Shop Now";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"262";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2887";}}}', 'catalog/demo/slider/img-slider1.jpg', 1, 0, 1),
(2, 'Slider02', 0, 1, 'a:17:{s:2:"id";s:1:"2";s:15:"slider_group_id";s:1:"1";s:12:"slider_title";s:8:"Slider02";s:18:"slider_language_id";s:1:"1";s:13:"slider_status";s:1:"1";s:17:"slider_transition";s:6:"random";s:11:"slider_slot";s:1:"7";s:15:"slider_rotation";s:1:"0";s:15:"slider_duration";s:3:"300";s:12:"slider_delay";s:1:"0";s:11:"slider_link";s:0:"";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"2";s:12:"slider_image";s:35:"catalog/demo/slider/img-slider2.jpg";}', 'O:8:"stdClass":1:{s:6:"layers";a:6:{i:0;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:1;s:13:"layer_content";s:30:"catalog/demo/slider/image2.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 1";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"97";s:10:"layer_left";s:2:"57";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"365";}i:1;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:2;s:13:"layer_content";s:31:"catalog/demo/slider/saleoff.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 2";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"56";s:10:"layer_left";s:3:"102";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"819";}i:2;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:3;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:16:"large_black_text";s:13:"layer_caption";s:15:"Curabitur velit";s:15:"layer_animation";s:3:"lft";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"80";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"1528";}i:3;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:4;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:11:"small_text ";s:13:"layer_caption";s:88:"Velit in leo tempus velit in leo fermentum &lt;br /&gt; congue odio ac nunc sollicitudin";s:15:"layer_animation";s:3:"lfr";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"150";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2174";}i:4;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:5;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:13:"bold_red_text";s:13:"layer_caption";s:5:"$2600";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"216";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2400";}i:5;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:6;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:27:"tp-button btn-theme-primary";s:13:"layer_caption";s:8:"Shop Now";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"262";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2887";}}}', 'catalog/demo/slider/img-slider2.jpg', 1, 0, 1),
(3, 'Slider03', 0, 1, 'a:17:{s:2:"id";s:1:"3";s:15:"slider_group_id";s:1:"1";s:12:"slider_title";s:8:"Slider03";s:18:"slider_language_id";s:1:"1";s:13:"slider_status";s:1:"1";s:17:"slider_transition";s:6:"random";s:11:"slider_slot";s:1:"7";s:15:"slider_rotation";s:1:"0";s:15:"slider_duration";s:3:"300";s:12:"slider_delay";s:1:"0";s:11:"slider_link";s:0:"";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"3";s:12:"slider_image";s:35:"catalog/demo/slider/img-slider2.jpg";}', 'O:8:"stdClass":1:{s:6:"layers";a:6:{i:0;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:1;s:13:"layer_content";s:30:"catalog/demo/slider/image3.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 1";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"39";s:10:"layer_left";s:3:"140";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"365";}i:1;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:2;s:13:"layer_content";s:31:"catalog/demo/slider/saleoff.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 2";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"56";s:10:"layer_left";s:3:"102";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"819";}i:2;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:3;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:16:"large_black_text";s:13:"layer_caption";s:15:"Curabitur velit";s:15:"layer_animation";s:3:"lft";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"80";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"1528";}i:3;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:4;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:11:"small_text ";s:13:"layer_caption";s:88:"Velit in leo tempus velit in leo fermentum &lt;br /&gt; congue odio ac nunc sollicitudin";s:15:"layer_animation";s:3:"lfr";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"150";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2174";}i:4;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:5;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:13:"bold_red_text";s:13:"layer_caption";s:5:"$2600";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"216";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2400";}i:5;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:6;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:27:"tp-button btn-theme-primary";s:13:"layer_caption";s:8:"Shop Now";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"262";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2887";}}}', 'catalog/demo/slider/img-slider2.jpg', 1, 0, 1),
(4, 'Slider04', 0, 1, 'a:17:{s:2:"id";s:1:"4";s:15:"slider_group_id";s:1:"1";s:12:"slider_title";s:8:"Slider04";s:18:"slider_language_id";s:1:"1";s:13:"slider_status";s:1:"1";s:17:"slider_transition";s:6:"random";s:11:"slider_slot";s:1:"7";s:15:"slider_rotation";s:1:"0";s:15:"slider_duration";s:3:"300";s:12:"slider_delay";s:1:"0";s:11:"slider_link";s:0:"";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"4";s:12:"slider_image";s:35:"catalog/demo/slider/img-slider1.jpg";}', 'O:8:"stdClass":1:{s:6:"layers";a:6:{i:0;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:1;s:13:"layer_content";s:30:"catalog/demo/slider/image4.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 1";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"58";s:10:"layer_left";s:3:"303";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"365";}i:1;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:2;s:13:"layer_content";s:31:"catalog/demo/slider/saleoff.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 2";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"36";s:10:"layer_left";s:3:"553";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"819";}i:2;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:3;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:16:"large_black_text";s:13:"layer_caption";s:15:"Curabitur velit";s:15:"layer_animation";s:3:"lft";s:12:"layer_easing";s:11:"easeOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"58";s:10:"layer_left";s:2:"70";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"1528";}i:3;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:4;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:11:"small_text ";s:13:"layer_caption";s:88:"Velit in leo tempus velit in leo fermentum &lt;br /&gt; congue odio ac nunc sollicitudin";s:15:"layer_animation";s:3:"lfr";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"162";s:10:"layer_left";s:2:"70";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2174";}i:4;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:5;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:13:"bold_red_text";s:13:"layer_caption";s:5:"$2600";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"227";s:10:"layer_left";s:2:"70";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2400";}i:5;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:6;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:27:"tp-button btn-theme-primary";s:13:"layer_caption";s:8:"Shop Now";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:13:"easeInOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"278";s:10:"layer_left";s:2:"70";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2887";}}}', 'catalog/demo/slider/img-slider1.jpg', 1, 0, 1),
(5, 'Slider05', 0, 1, 'a:17:{s:2:"id";s:1:"5";s:15:"slider_group_id";s:1:"1";s:12:"slider_title";s:8:"Slider05";s:18:"slider_language_id";s:1:"1";s:13:"slider_status";s:1:"1";s:17:"slider_transition";s:6:"random";s:11:"slider_slot";s:1:"7";s:15:"slider_rotation";s:1:"0";s:15:"slider_duration";s:3:"300";s:12:"slider_delay";s:1:"0";s:11:"slider_link";s:0:"";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"5";s:12:"slider_image";s:35:"catalog/demo/slider/img-slider1.jpg";}', 'O:8:"stdClass":1:{s:6:"layers";a:6:{i:0;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:1;s:13:"layer_content";s:30:"catalog/demo/slider/image5.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 1";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"50";s:10:"layer_left";s:3:"463";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"365";}i:1;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:2;s:13:"layer_content";s:31:"catalog/demo/slider/saleoff.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 2";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"36";s:10:"layer_left";s:3:"553";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"819";}i:2;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:3;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:16:"large_black_text";s:13:"layer_caption";s:15:"Curabitur velit";s:15:"layer_animation";s:3:"lft";s:12:"layer_easing";s:11:"easeOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"58";s:10:"layer_left";s:2:"70";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"1528";}i:3;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:4;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:11:"small_text ";s:13:"layer_caption";s:88:"Velit in leo tempus velit in leo fermentum &lt;br /&gt; congue odio ac nunc sollicitudin";s:15:"layer_animation";s:3:"lfr";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"162";s:10:"layer_left";s:2:"70";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2174";}i:4;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:5;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:13:"bold_red_text";s:13:"layer_caption";s:5:"$2600";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"227";s:10:"layer_left";s:2:"70";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2400";}i:5;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:6;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:27:"tp-button btn-theme-primary";s:13:"layer_caption";s:8:"Shop Now";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:13:"easeInOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"278";s:10:"layer_left";s:2:"70";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2887";}}}', 'catalog/demo/slider/img-slider1.jpg', 1, 0, 1),
(6, 'Slider01', 0, 1, 'a:17:{s:2:"id";s:1:"1";s:15:"slider_group_id";s:1:"1";s:12:"slider_title";s:8:"Slider01";s:18:"slider_language_id";s:1:"1";s:13:"slider_status";s:1:"1";s:17:"slider_transition";s:6:"random";s:11:"slider_slot";s:1:"7";s:15:"slider_rotation";s:1:"0";s:15:"slider_duration";s:3:"300";s:12:"slider_delay";s:1:"0";s:11:"slider_link";s:0:"";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"1";s:12:"slider_image";s:35:"catalog/demo/slider/img-slider1.jpg";}', 'O:8:"stdClass":1:{s:6:"layers";a:6:{i:0;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:1;s:13:"layer_content";s:30:"catalog/demo/slider/image1.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 1";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"164";s:10:"layer_left";s:2:"42";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"365";}i:1;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:2;s:13:"layer_content";s:31:"catalog/demo/slider/saleoff.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 2";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"56";s:10:"layer_left";s:3:"102";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"819";}i:2;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:3;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:16:"large_black_text";s:13:"layer_caption";s:15:"Curabitur velit";s:15:"layer_animation";s:3:"lft";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"80";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"1528";}i:3;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:4;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:11:"small_text ";s:13:"layer_caption";s:88:"Velit in leo tempus velit in leo fermentum &lt;br /&gt; congue odio ac nunc sollicitudin";s:15:"layer_animation";s:3:"lfr";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"150";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2174";}i:4;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:5;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:13:"bold_red_text";s:13:"layer_caption";s:5:"$2600";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"216";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2400";}i:5;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:6;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:27:"tp-button btn-theme-primary";s:13:"layer_caption";s:8:"Shop Now";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"262";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2887";}}}', 'catalog/demo/slider/img-slider1.jpg', 1, 0, 2),
(7, 'Slider02', 0, 1, 'a:17:{s:2:"id";s:1:"2";s:15:"slider_group_id";s:1:"1";s:12:"slider_title";s:8:"Slider02";s:18:"slider_language_id";s:1:"1";s:13:"slider_status";s:1:"1";s:17:"slider_transition";s:6:"random";s:11:"slider_slot";s:1:"7";s:15:"slider_rotation";s:1:"0";s:15:"slider_duration";s:3:"300";s:12:"slider_delay";s:1:"0";s:11:"slider_link";s:0:"";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"2";s:12:"slider_image";s:35:"catalog/demo/slider/img-slider2.jpg";}', 'O:8:"stdClass":1:{s:6:"layers";a:6:{i:0;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:1;s:13:"layer_content";s:30:"catalog/demo/slider/image2.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 1";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"97";s:10:"layer_left";s:2:"57";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"365";}i:1;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:2;s:13:"layer_content";s:31:"catalog/demo/slider/saleoff.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 2";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"56";s:10:"layer_left";s:3:"102";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"819";}i:2;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:3;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:16:"large_black_text";s:13:"layer_caption";s:15:"Curabitur velit";s:15:"layer_animation";s:3:"lft";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"80";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"1528";}i:3;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:4;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:11:"small_text ";s:13:"layer_caption";s:88:"Velit in leo tempus velit in leo fermentum &lt;br /&gt; congue odio ac nunc sollicitudin";s:15:"layer_animation";s:3:"lfr";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"150";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2174";}i:4;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:5;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:13:"bold_red_text";s:13:"layer_caption";s:5:"$2600";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"216";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2400";}i:5;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:6;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:27:"tp-button btn-theme-primary";s:13:"layer_caption";s:8:"Shop Now";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"262";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2887";}}}', 'catalog/demo/slider/img-slider2.jpg', 1, 0, 2),
(8, 'Slider03', 0, 1, 'a:17:{s:2:"id";s:1:"3";s:15:"slider_group_id";s:1:"1";s:12:"slider_title";s:8:"Slider03";s:18:"slider_language_id";s:1:"1";s:13:"slider_status";s:1:"1";s:17:"slider_transition";s:6:"random";s:11:"slider_slot";s:1:"7";s:15:"slider_rotation";s:1:"0";s:15:"slider_duration";s:3:"300";s:12:"slider_delay";s:1:"0";s:11:"slider_link";s:0:"";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"3";s:12:"slider_image";s:35:"catalog/demo/slider/img-slider2.jpg";}', 'O:8:"stdClass":1:{s:6:"layers";a:6:{i:0;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:1;s:13:"layer_content";s:30:"catalog/demo/slider/image3.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 1";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"39";s:10:"layer_left";s:3:"140";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"365";}i:1;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:2;s:13:"layer_content";s:31:"catalog/demo/slider/saleoff.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 2";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"56";s:10:"layer_left";s:3:"102";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"819";}i:2;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:3;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:16:"large_black_text";s:13:"layer_caption";s:15:"Curabitur velit";s:15:"layer_animation";s:3:"lft";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"80";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"1528";}i:3;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:4;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:11:"small_text ";s:13:"layer_caption";s:88:"Velit in leo tempus velit in leo fermentum &lt;br /&gt; congue odio ac nunc sollicitudin";s:15:"layer_animation";s:3:"lfr";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"150";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2174";}i:4;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:5;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:13:"bold_red_text";s:13:"layer_caption";s:5:"$2600";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"216";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2400";}i:5;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:6;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:27:"tp-button btn-theme-primary";s:13:"layer_caption";s:8:"Shop Now";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"262";s:10:"layer_left";s:3:"550";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2887";}}}', 'catalog/demo/slider/img-slider2.jpg', 1, 0, 2),
(9, 'Slider04', 0, 1, 'a:17:{s:2:"id";s:1:"4";s:15:"slider_group_id";s:1:"1";s:12:"slider_title";s:8:"Slider04";s:18:"slider_language_id";s:1:"1";s:13:"slider_status";s:1:"1";s:17:"slider_transition";s:6:"random";s:11:"slider_slot";s:1:"7";s:15:"slider_rotation";s:1:"0";s:15:"slider_duration";s:3:"300";s:12:"slider_delay";s:1:"0";s:11:"slider_link";s:0:"";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"4";s:12:"slider_image";s:35:"catalog/demo/slider/img-slider1.jpg";}', 'O:8:"stdClass":1:{s:6:"layers";a:6:{i:0;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:1;s:13:"layer_content";s:30:"catalog/demo/slider/image4.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 1";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"58";s:10:"layer_left";s:3:"303";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"365";}i:1;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:2;s:13:"layer_content";s:31:"catalog/demo/slider/saleoff.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 2";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"36";s:10:"layer_left";s:3:"553";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"819";}i:2;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:3;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:16:"large_black_text";s:13:"layer_caption";s:15:"Curabitur velit";s:15:"layer_animation";s:3:"lft";s:12:"layer_easing";s:11:"easeOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"58";s:10:"layer_left";s:2:"70";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"1528";}i:3;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:4;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:11:"small_text ";s:13:"layer_caption";s:88:"Velit in leo tempus velit in leo fermentum &lt;br /&gt; congue odio ac nunc sollicitudin";s:15:"layer_animation";s:3:"lfr";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"162";s:10:"layer_left";s:2:"70";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2174";}i:4;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:5;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:13:"bold_red_text";s:13:"layer_caption";s:5:"$2600";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"227";s:10:"layer_left";s:2:"70";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2400";}i:5;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:6;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:27:"tp-button btn-theme-primary";s:13:"layer_caption";s:8:"Shop Now";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:13:"easeInOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"278";s:10:"layer_left";s:2:"70";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2887";}}}', 'catalog/demo/slider/img-slider1.jpg', 1, 0, 2),
(10, 'Slider05', 0, 1, 'a:17:{s:2:"id";s:1:"5";s:15:"slider_group_id";s:1:"1";s:12:"slider_title";s:8:"Slider05";s:18:"slider_language_id";s:1:"1";s:13:"slider_status";s:1:"1";s:17:"slider_transition";s:6:"random";s:11:"slider_slot";s:1:"7";s:15:"slider_rotation";s:1:"0";s:15:"slider_duration";s:3:"300";s:12:"slider_delay";s:1:"0";s:11:"slider_link";s:0:"";s:16:"slider_thumbnail";s:0:"";s:15:"slider_usevideo";s:1:"0";s:14:"slider_videoid";s:0:"";s:16:"slider_videoplay";s:1:"0";s:9:"slider_id";s:1:"5";s:12:"slider_image";s:35:"catalog/demo/slider/img-slider1.jpg";}', 'O:8:"stdClass":1:{s:6:"layers";a:6:{i:0;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:1;s:13:"layer_content";s:30:"catalog/demo/slider/image5.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 1";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"50";s:10:"layer_left";s:3:"463";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"365";}i:1;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:2;s:13:"layer_content";s:31:"catalog/demo/slider/saleoff.png";s:10:"layer_type";s:5:"image";s:11:"layer_class";s:0:"";s:13:"layer_caption";s:17:"Your Image Here 2";s:15:"layer_animation";s:12:"randomrotate";s:12:"layer_easing";s:13:"easeInOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"36";s:10:"layer_left";s:3:"553";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:3:"819";}i:2;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:3;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:16:"large_black_text";s:13:"layer_caption";s:15:"Curabitur velit";s:15:"layer_animation";s:3:"lft";s:12:"layer_easing";s:11:"easeOutQuad";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:2:"58";s:10:"layer_left";s:2:"70";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"1528";}i:3;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:4;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:11:"small_text ";s:13:"layer_caption";s:88:"Velit in leo tempus velit in leo fermentum &lt;br /&gt; congue odio ac nunc sollicitudin";s:15:"layer_animation";s:3:"lfr";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"162";s:10:"layer_left";s:2:"70";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2174";}i:4;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:5;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:13:"bold_red_text";s:13:"layer_caption";s:5:"$2600";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:11:"easeOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"227";s:10:"layer_left";s:2:"70";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2400";}i:5;a:20:{s:16:"layer_video_type";s:7:"youtube";s:14:"layer_video_id";s:0:"";s:18:"layer_video_height";s:3:"200";s:17:"layer_video_width";s:3:"300";s:17:"layer_video_thumb";s:0:"";s:8:"layer_id";i:6;s:13:"layer_content";s:12:"no_image.png";s:10:"layer_type";s:4:"text";s:11:"layer_class";s:27:"tp-button btn-theme-primary";s:13:"layer_caption";s:8:"Shop Now";s:15:"layer_animation";s:3:"lfb";s:12:"layer_easing";s:13:"easeInOutExpo";s:11:"layer_speed";s:3:"350";s:9:"layer_top";s:3:"278";s:10:"layer_left";s:2:"70";s:13:"layer_endtime";s:1:"0";s:14:"layer_endspeed";s:3:"300";s:18:"layer_endanimation";s:4:"auto";s:15:"layer_endeasing";s:7:"nothing";s:10:"time_start";s:4:"2887";}}}', 'catalog/demo/slider/img-slider1.jpg', 1, 0, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product`
--

CREATE TABLE IF NOT EXISTS `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `is_vegan` tinyint(1) DEFAULT NULL,
  `energy_value` smallint(4) NOT NULL,
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=106 ;

--
-- Дамп данных таблицы `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `is_vegan`, `energy_value`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(75, '', '', '', '', '', '', '', '', 1, 6, 'catalog/Beef Enchiladas.jpg', 0, 1, '11.90', 0, 0, '2016-12-18', '410.00000000', 2, 0, 410, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 19:44:21', '0000-00-00 00:00:00'),
(76, '', '', '', '', '', '', '', '', 1, 6, 'catalog/28-day-Dry-Aged-Sirloin11.jpg', 0, 1, '18.90', 0, 0, '2016-12-18', '240.00000000', 2, 0, 500, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 19:47:44', '0000-00-00 00:00:00'),
(77, '', '', '', '', '', '', '', '', 1, 6, 'catalog/28-day-Dry-Aged-Sirloin11.jpg', 0, 1, '18.90', 0, 0, '2016-12-18', '260.00000000', 2, 0, 300, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 19:49:41', '0000-00-00 00:00:00'),
(78, '', '', '', '', '', '', '', '', 1, 6, 'catalog/28-day-Dry-Aged-Sirloin11.jpg', 0, 1, '15.90', 0, 0, '2016-12-18', '230.00000000', 2, 0, 380, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 19:50:56', '0000-00-00 00:00:00'),
(79, '', '', '', '', '', '', '', '', 1, 6, 'catalog/carnes.jpg', 0, 1, '18.90', 0, 0, '2016-12-18', '200.00000000', 2, 0, 320, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 19:51:46', '2016-12-18 20:47:04'),
(80, '', '', '', '', '', '', '', '', 1, 6, 'catalog/carnes.jpg', 0, 1, '12.90', 0, 0, '2016-12-18', '380.00000000', 2, 0, 450, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 19:58:49', '2016-12-18 20:46:38'),
(82, '', '', '', '', '', '', '', '', 1, 6, 'catalog/carnes.jpg', 0, 1, '12.90', 0, 0, '2016-12-18', '390.00000000', 2, 0, 410, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 20:05:51', '0000-00-00 00:00:00'),
(83, '', '', '', '', '', '', '', '', 1, 6, 'catalog/Texas-Fajitas-2-650x433.jpg', 0, 1, '17.90', 0, 0, '2016-12-18', '310.00000000', 2, 0, 350, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 20:08:57', '0000-00-00 00:00:00'),
(65, '', '', '', '', '', '', '', '', 1, 6, 'catalog/entradas.jpg', 0, 1, '3.80', 0, 0, '2016-11-28', '150.00000000', 2, 1, 450, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-11-29 00:30:13', '2016-12-18 19:12:00'),
(74, '', '', '', '', '', '', '', '', 1, 6, 'catalog/Beef Enchiladas.jpg', 0, 1, '10.90', 0, 0, '2016-12-18', '290.00000000', 2, 0, 410, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 19:40:34', '2016-12-18 19:45:54'),
(67, '', '', '', '', '', '', '', '', 1, 6, 'catalog/entradas.jpg', 0, 1, '6.40', 0, 0, '2016-11-28', '500.00000000', 2, 1, 700, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-11-29 00:41:09', '2016-12-18 19:24:55'),
(68, '', '', '', '', '', '', '', '', 1, 6, 'catalog/entradas.jpg', 0, 1, '5.80', 0, 0, '2016-11-28', '400.00000000', 2, 0, 200, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-11-29 00:46:46', '2016-12-18 19:11:35'),
(69, '', '', '', '', '', '', '', '', 1, 6, 'catalog/entradas.jpg', 0, 1, '5.40', 0, 0, '2016-11-28', '300.00000000', 2, 1, 230, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-11-29 00:48:01', '2016-12-18 19:12:33'),
(70, '', '', '', '', '', '', '', '', 1, 6, 'catalog/entradas.jpg', 0, 1, '8.70', 0, 0, '2016-11-28', '400.00000000', 2, 0, 370, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-11-29 00:50:31', '2016-12-18 19:12:45'),
(71, '', '', '', '', '', '', '', '', 1, 6, 'catalog/entradas.jpg', 0, 1, '4.00', 0, 0, '2016-12-18', '200.00000000', 2, 0, 350, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 19:11:20', '0000-00-00 00:00:00'),
(72, '', '', '', '', '', '', '', '', 1, 6, 'catalog/Beef Enchiladas.jpg', 0, 1, '9.90', 0, 0, '2016-12-18', '290.00000000', 2, 1, 400, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 19:18:41', '2016-12-18 19:45:24'),
(73, '', '', '', '', '', '', '', '', 1, 6, 'catalog/Beef Enchiladas.jpg', 0, 1, '10.90', 0, 0, '2016-12-18', '300.00000000', 2, 0, 450, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 19:32:14', '2016-12-18 19:45:11'),
(84, '', '', '', '', '', '', '', '', 1, 6, 'catalog/Texas-Fajitas-2-650x433.jpg', 0, 1, '17.90', 0, 0, '2016-12-18', '380.00000000', 2, 0, 410, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 20:10:36', '0000-00-00 00:00:00'),
(85, '', '', '', '', '', '', '', '', 1, 6, 'catalog/Texas-Fajitas-2-650x433.jpg', 0, 1, '15.90', 0, 0, '2016-12-18', '410.00000000', 2, 0, 590, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 20:12:04', '0000-00-00 00:00:00'),
(86, '', '', '', '', '', '', '', '', 1, 6, 'catalog/header_image.jpg', 0, 1, '11.90', 0, 0, '2016-12-18', '290.00000000', 2, 0, 410, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 20:13:07', '2016-12-18 20:31:35'),
(87, '', '', '', '', '', '', '', '', 1, 6, 'catalog/header_image.jpg', 0, 1, '12.90', 0, 0, '2016-12-18', '410.00000000', 2, 0, 370, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 20:34:04', '0000-00-00 00:00:00'),
(88, '', '', '', '', '', '', '', '', 1, 6, 'catalog/header_image.jpg', 0, 1, '11.90', 0, 0, '2016-12-18', '330.00000000', 2, 0, 380, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 20:35:56', '0000-00-00 00:00:00'),
(89, '', '', '', '', '', '', '', '', 1, 6, 'catalog/header_image.jpg', 0, 1, '10.90', 0, 0, '2016-12-18', '230.00000000', 2, 0, 304, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 20:37:25', '0000-00-00 00:00:00'),
(90, '', '', '', '', '', '', '', '', 1, 6, 'catalog/product.jpg', 0, 1, '10.90', 0, 0, '2016-12-18', '514.00000000', 2, 0, 600, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 20:39:01', '0000-00-00 00:00:00'),
(91, '', '', '', '', '', '', '', '', 1, 6, 'catalog/product.jpg', 0, 1, '15.90', 0, 0, '2016-12-18', '300.00000000', 2, 0, 340, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 20:40:21', '0000-00-00 00:00:00'),
(92, '', '', '', '', '', '', '', '', 1, 6, 'catalog/product.jpg', 0, 1, '11.90', 0, 0, '2016-12-18', '310.00000000', 2, 0, 340, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 20:41:36', '0000-00-00 00:00:00'),
(93, '', '', '', '', '', '', '', '', 1, 6, 'catalog/product.jpg', 0, 1, '17.90', 0, 0, '2016-12-18', '450.00000000', 2, 0, 510, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 20:43:01', '2016-12-18 21:19:35'),
(94, '', '', '', '', '', '', '', '', 1, 6, 'catalog/product.jpg', 0, 1, '9.90', 0, 0, '2016-12-18', '310.00000000', 2, 0, 320, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 20:45:50', '2016-12-18 21:06:53'),
(95, '', '', '', '', '', '', '', '', 1, 6, 'catalog/supereasy-greek-salad-20719_l.jpeg', 0, 1, '9.90', 0, 0, '2016-12-18', '190.00000000', 2, 1, 230, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-18 20:53:39', '0000-00-00 00:00:00'),
(96, '', '', '', '', '', '', '', '', 1, 6, '', 0, 1, '10.00', 0, 0, '2016-12-29', '20.00000000', 2, 0, 150, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2016-12-29 11:35:37', '0000-00-00 00:00:00'),
(97, '', '', '', '', '', '', '', '', 1, 6, '', 0, 1, '45.00', 0, 0, '2016-12-29', '50.00000000', 2, 0, 200, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 2, 1, 0, '2016-12-29 11:36:42', '2016-12-29 11:39:59'),
(98, '', '', '', '', '', '', '', '', 1, 6, '', 0, 1, '50.00', 0, 0, '2016-12-29', '100.00000000', 2, 0, 234, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 3, 1, 0, '2016-12-29 11:37:31', '0000-00-00 00:00:00'),
(99, '', '', '', '', '', '', '', '', 1, 6, '', 0, 1, '35.00', 0, 0, '2016-12-29', '50.00000000', 2, 0, 167, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 4, 1, 0, '2016-12-29 11:38:51', '0000-00-00 00:00:00'),
(100, '', '', '', '', '', '', '', '', 1, 6, '', 0, 1, '55.00', 0, 0, '2016-12-29', '50.00000000', 2, 0, 200, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 2, 1, 0, '2016-12-29 11:39:04', '2016-12-29 11:40:37'),
(101, '', '', '', '', '', '', '', '', 1, 6, '', 0, 1, '90.00', 0, 0, '2016-12-29', '50.00000000', 2, 0, 200, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 2, 1, 0, '2016-12-29 11:39:13', '2016-12-29 11:41:21'),
(102, '', '', '', '', '', '', '', '', 1, 6, '', 0, 1, '15.00', 0, 0, '2016-12-29', '50.00000000', 2, 0, 200, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 2, 1, 0, '2016-12-29 11:39:13', '2016-12-29 11:42:30'),
(103, '', '', '', '', '', '', '', '', 1, 6, '', 0, 1, '25.00', 0, 0, '2016-12-29', '50.00000000', 2, 0, 200, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 2, 1, 0, '2016-12-29 11:39:20', '0000-00-00 00:00:00'),
(104, '', '', '', '', '', '', '', '', 1, 6, '', 0, 1, '69.00', 0, 0, '2016-12-29', '50.00000000', 2, 0, 200, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 2, 1, 0, '2016-12-29 11:39:20', '2016-12-29 11:43:18'),
(105, '', '', '', '', '', '', '', '', 1, 6, '', 0, 1, '75.00', 0, 0, '2016-12-29', '100.00000000', 2, 0, 467, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 8, 1, 0, '2016-12-29 11:47:04', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(75, 43, 3, ''),
(75, 41, 2, ''),
(75, 41, 1, ''),
(74, 44, 2, ''),
(74, 44, 1, ''),
(74, 44, 3, ''),
(74, 56, 2, ''),
(74, 43, 1, ''),
(74, 43, 3, ''),
(74, 43, 2, ''),
(75, 54, 2, ''),
(75, 54, 1, ''),
(75, 54, 3, ''),
(75, 100, 2, ''),
(75, 100, 1, ''),
(75, 100, 3, ''),
(75, 79, 2, ''),
(75, 79, 1, ''),
(75, 79, 3, ''),
(75, 43, 2, ''),
(75, 43, 1, ''),
(65, 41, 2, ''),
(65, 41, 1, ''),
(65, 40, 3, ''),
(65, 40, 2, ''),
(65, 40, 1, ''),
(65, 39, 3, ''),
(65, 39, 2, ''),
(73, 55, 1, ''),
(73, 54, 3, ''),
(73, 54, 2, ''),
(73, 54, 1, ''),
(73, 43, 2, ''),
(73, 43, 1, ''),
(73, 43, 3, ''),
(67, 42, 2, ''),
(67, 42, 1, ''),
(67, 42, 3, ''),
(67, 43, 2, ''),
(67, 43, 1, ''),
(67, 39, 2, ''),
(67, 39, 1, ''),
(65, 39, 1, ''),
(65, 38, 3, ''),
(65, 38, 1, ''),
(65, 38, 2, ''),
(74, 56, 1, ''),
(74, 56, 3, ''),
(68, 39, 1, ''),
(68, 39, 2, ''),
(68, 39, 3, ''),
(69, 41, 2, ''),
(69, 38, 3, ''),
(69, 41, 1, ''),
(69, 38, 1, ''),
(69, 38, 2, ''),
(70, 51, 3, ''),
(70, 51, 1, ''),
(70, 51, 2, ''),
(70, 50, 3, ''),
(70, 50, 1, ''),
(70, 50, 2, ''),
(70, 49, 3, ''),
(70, 49, 1, ''),
(70, 49, 2, ''),
(70, 48, 3, ''),
(70, 48, 1, ''),
(70, 48, 2, ''),
(70, 47, 3, ''),
(70, 47, 1, ''),
(70, 47, 2, ''),
(70, 46, 3, ''),
(70, 46, 1, ''),
(70, 46, 2, ''),
(70, 45, 3, ''),
(70, 45, 1, ''),
(70, 45, 2, ''),
(70, 40, 3, ''),
(70, 40, 1, ''),
(70, 40, 2, ''),
(70, 38, 3, ''),
(70, 38, 1, ''),
(70, 38, 2, ''),
(71, 54, 2, ''),
(71, 54, 1, ''),
(71, 54, 3, ''),
(71, 41, 2, ''),
(71, 41, 1, ''),
(71, 41, 3, ''),
(71, 43, 2, ''),
(71, 43, 1, ''),
(71, 43, 3, ''),
(71, 39, 2, ''),
(71, 39, 1, ''),
(71, 39, 3, ''),
(68, 44, 2, ''),
(68, 44, 1, ''),
(68, 44, 3, ''),
(65, 41, 3, ''),
(67, 39, 3, ''),
(67, 38, 3, ''),
(67, 38, 1, ''),
(67, 38, 2, ''),
(69, 41, 3, ''),
(69, 45, 2, ''),
(69, 45, 1, ''),
(69, 45, 3, ''),
(72, 38, 3, ''),
(72, 39, 2, ''),
(72, 39, 1, ''),
(72, 41, 3, ''),
(72, 43, 2, ''),
(72, 38, 1, ''),
(72, 38, 2, ''),
(72, 41, 1, ''),
(72, 41, 2, ''),
(72, 39, 3, ''),
(72, 43, 1, ''),
(72, 43, 3, ''),
(73, 55, 3, ''),
(73, 55, 2, ''),
(67, 43, 3, ''),
(75, 41, 3, ''),
(75, 55, 2, ''),
(75, 55, 1, ''),
(75, 55, 3, ''),
(75, 44, 2, ''),
(75, 44, 1, ''),
(75, 44, 3, ''),
(75, 56, 2, ''),
(75, 56, 1, ''),
(75, 56, 3, ''),
(75, 52, 2, ''),
(75, 52, 1, ''),
(75, 52, 3, ''),
(75, 53, 2, ''),
(75, 53, 1, ''),
(75, 53, 3, ''),
(75, 39, 2, ''),
(75, 39, 1, ''),
(75, 39, 3, ''),
(75, 38, 2, ''),
(75, 38, 1, ''),
(75, 38, 3, ''),
(73, 52, 2, ''),
(73, 52, 1, ''),
(73, 52, 3, ''),
(73, 53, 2, ''),
(73, 53, 1, ''),
(73, 53, 3, ''),
(73, 39, 2, ''),
(73, 39, 1, ''),
(73, 39, 3, ''),
(73, 38, 2, ''),
(73, 38, 1, ''),
(73, 38, 3, ''),
(72, 52, 2, ''),
(72, 52, 1, ''),
(72, 52, 3, ''),
(72, 53, 2, ''),
(72, 53, 1, ''),
(72, 53, 3, ''),
(72, 54, 2, ''),
(72, 54, 1, ''),
(72, 54, 3, ''),
(72, 79, 2, ''),
(72, 79, 1, ''),
(72, 79, 3, ''),
(72, 100, 2, ''),
(72, 100, 1, ''),
(72, 100, 3, ''),
(74, 52, 2, ''),
(74, 52, 1, ''),
(74, 52, 3, ''),
(74, 53, 2, ''),
(74, 53, 1, ''),
(74, 53, 3, ''),
(74, 39, 2, ''),
(74, 39, 1, ''),
(74, 39, 3, ''),
(74, 38, 2, ''),
(74, 38, 1, ''),
(74, 38, 3, ''),
(76, 39, 2, ''),
(76, 39, 1, ''),
(76, 39, 3, ''),
(76, 57, 2, ''),
(76, 57, 1, ''),
(76, 57, 3, ''),
(76, 45, 2, ''),
(76, 45, 1, ''),
(76, 45, 3, ''),
(76, 49, 2, ''),
(76, 49, 1, ''),
(76, 49, 3, ''),
(76, 53, 2, ''),
(76, 53, 1, ''),
(76, 53, 3, ''),
(77, 58, 2, ''),
(77, 58, 1, ''),
(77, 58, 3, ''),
(77, 39, 2, ''),
(77, 39, 1, ''),
(77, 39, 3, ''),
(77, 49, 2, ''),
(77, 49, 1, ''),
(77, 49, 3, ''),
(77, 45, 2, ''),
(77, 45, 1, ''),
(77, 45, 3, ''),
(78, 49, 2, ''),
(78, 49, 1, ''),
(78, 49, 3, ''),
(78, 51, 2, ''),
(78, 51, 1, ''),
(78, 51, 3, ''),
(79, 53, 3, ''),
(79, 56, 2, ''),
(79, 56, 1, ''),
(79, 56, 3, ''),
(79, 59, 2, ''),
(79, 49, 1, ''),
(79, 49, 3, ''),
(79, 50, 2, ''),
(79, 50, 1, ''),
(79, 50, 3, ''),
(79, 51, 2, ''),
(79, 51, 1, ''),
(79, 51, 3, ''),
(79, 53, 2, ''),
(79, 53, 1, ''),
(80, 60, 3, ''),
(80, 61, 2, ''),
(80, 61, 1, ''),
(80, 61, 3, ''),
(80, 60, 2, ''),
(80, 62, 2, ''),
(80, 60, 1, ''),
(80, 45, 3, ''),
(80, 45, 1, ''),
(80, 45, 2, ''),
(79, 49, 2, ''),
(79, 48, 3, ''),
(79, 48, 1, ''),
(79, 48, 2, ''),
(79, 38, 3, ''),
(79, 38, 1, ''),
(79, 38, 2, ''),
(82, 55, 2, ''),
(82, 55, 1, ''),
(82, 55, 3, ''),
(82, 43, 2, ''),
(82, 43, 1, ''),
(82, 43, 3, ''),
(82, 63, 2, ''),
(82, 63, 1, ''),
(82, 63, 3, ''),
(83, 50, 2, ''),
(83, 50, 1, ''),
(83, 50, 3, ''),
(83, 51, 2, ''),
(83, 51, 1, ''),
(83, 51, 3, ''),
(83, 54, 2, ''),
(83, 54, 1, ''),
(83, 54, 3, ''),
(83, 43, 2, ''),
(83, 43, 1, ''),
(83, 43, 3, ''),
(83, 45, 2, ''),
(83, 45, 1, ''),
(83, 45, 3, ''),
(83, 39, 2, ''),
(83, 39, 1, ''),
(83, 39, 3, ''),
(83, 40, 2, ''),
(83, 40, 1, ''),
(83, 40, 3, ''),
(83, 38, 2, ''),
(83, 38, 1, ''),
(83, 38, 3, ''),
(83, 59, 2, ''),
(83, 59, 1, ''),
(83, 59, 3, ''),
(84, 54, 2, ''),
(84, 54, 1, ''),
(84, 54, 3, ''),
(84, 43, 2, ''),
(84, 43, 1, ''),
(84, 43, 3, ''),
(84, 45, 2, ''),
(84, 45, 1, ''),
(84, 45, 3, ''),
(84, 39, 2, ''),
(84, 39, 1, ''),
(84, 39, 3, ''),
(84, 40, 2, ''),
(84, 40, 1, ''),
(84, 40, 3, ''),
(84, 38, 2, ''),
(84, 38, 1, ''),
(84, 38, 3, ''),
(84, 59, 2, ''),
(84, 59, 1, ''),
(84, 59, 3, ''),
(85, 54, 2, ''),
(85, 54, 1, ''),
(85, 54, 3, ''),
(85, 43, 2, ''),
(85, 43, 1, ''),
(85, 43, 3, ''),
(85, 39, 2, ''),
(85, 39, 1, ''),
(85, 39, 3, ''),
(85, 40, 2, ''),
(85, 40, 1, ''),
(85, 40, 3, ''),
(85, 38, 2, ''),
(85, 38, 1, ''),
(85, 38, 3, ''),
(85, 59, 2, ''),
(85, 59, 1, ''),
(85, 59, 3, ''),
(86, 54, 2, ''),
(86, 54, 1, ''),
(86, 54, 3, ''),
(86, 64, 2, ''),
(86, 64, 1, ''),
(86, 64, 3, ''),
(86, 65, 2, ''),
(86, 65, 1, ''),
(86, 65, 3, ''),
(86, 39, 2, ''),
(86, 39, 1, ''),
(86, 39, 3, ''),
(86, 53, 2, ''),
(86, 53, 1, ''),
(86, 53, 3, ''),
(87, 66, 2, ''),
(87, 66, 1, ''),
(87, 66, 3, ''),
(87, 67, 2, ''),
(87, 67, 1, ''),
(87, 67, 3, ''),
(87, 68, 2, ''),
(87, 68, 1, ''),
(87, 68, 3, ''),
(87, 46, 2, ''),
(87, 46, 1, ''),
(87, 46, 3, ''),
(87, 69, 2, ''),
(87, 69, 1, ''),
(87, 69, 3, ''),
(87, 52, 2, ''),
(87, 52, 1, ''),
(87, 52, 3, ''),
(87, 49, 2, ''),
(87, 49, 1, ''),
(87, 49, 3, ''),
(87, 39, 2, ''),
(87, 39, 1, ''),
(87, 39, 3, ''),
(87, 38, 2, ''),
(87, 38, 1, ''),
(87, 38, 3, ''),
(87, 41, 2, ''),
(87, 41, 1, ''),
(87, 41, 3, ''),
(87, 53, 2, ''),
(87, 53, 1, ''),
(87, 53, 3, ''),
(88, 54, 2, ''),
(88, 54, 1, ''),
(88, 54, 3, ''),
(88, 56, 2, ''),
(88, 56, 1, ''),
(88, 56, 3, ''),
(88, 43, 2, ''),
(88, 43, 1, ''),
(88, 43, 3, ''),
(88, 59, 2, ''),
(88, 59, 1, ''),
(88, 59, 3, ''),
(89, 70, 2, ''),
(89, 70, 1, ''),
(89, 70, 3, ''),
(89, 43, 2, ''),
(89, 43, 1, ''),
(89, 43, 3, ''),
(89, 71, 2, ''),
(89, 71, 1, ''),
(89, 71, 3, ''),
(89, 72, 2, ''),
(89, 72, 1, ''),
(89, 72, 3, ''),
(89, 52, 2, ''),
(89, 52, 1, ''),
(89, 52, 3, ''),
(89, 39, 2, ''),
(89, 39, 1, ''),
(89, 39, 3, ''),
(89, 38, 2, ''),
(89, 38, 1, ''),
(89, 38, 3, ''),
(89, 41, 2, ''),
(89, 41, 1, ''),
(89, 41, 3, ''),
(90, 73, 2, ''),
(90, 73, 1, ''),
(90, 73, 3, ''),
(90, 74, 2, ''),
(90, 74, 1, ''),
(90, 74, 3, ''),
(90, 75, 2, ''),
(90, 75, 1, ''),
(90, 75, 3, ''),
(91, 76, 2, ''),
(91, 76, 1, ''),
(91, 76, 3, ''),
(91, 73, 2, ''),
(91, 73, 1, ''),
(91, 73, 3, ''),
(91, 74, 2, ''),
(91, 74, 1, ''),
(91, 74, 3, ''),
(91, 75, 2, ''),
(91, 75, 1, ''),
(91, 75, 3, ''),
(92, 76, 2, ''),
(92, 76, 1, ''),
(92, 76, 3, ''),
(92, 62, 2, ''),
(92, 62, 1, ''),
(92, 62, 3, ''),
(92, 77, 2, ''),
(92, 77, 1, ''),
(92, 77, 3, ''),
(92, 74, 2, ''),
(92, 74, 1, ''),
(92, 74, 3, ''),
(92, 75, 2, ''),
(92, 75, 1, ''),
(92, 75, 3, ''),
(93, 77, 3, ''),
(93, 77, 1, ''),
(93, 74, 3, ''),
(93, 75, 2, ''),
(93, 75, 1, ''),
(93, 75, 3, ''),
(93, 77, 2, ''),
(93, 74, 1, ''),
(93, 74, 2, ''),
(93, 73, 3, ''),
(93, 73, 1, ''),
(93, 73, 2, ''),
(94, 73, 1, ''),
(94, 73, 2, ''),
(94, 75, 2, ''),
(94, 74, 3, ''),
(94, 74, 1, ''),
(94, 74, 2, ''),
(94, 73, 3, ''),
(80, 62, 1, ''),
(80, 62, 3, ''),
(79, 59, 1, ''),
(79, 59, 3, ''),
(95, 83, 2, ''),
(95, 83, 1, ''),
(95, 83, 3, ''),
(95, 84, 2, ''),
(95, 84, 1, ''),
(95, 84, 3, ''),
(95, 63, 2, ''),
(95, 63, 1, ''),
(95, 63, 3, ''),
(94, 75, 1, ''),
(94, 75, 3, ''),
(94, 78, 2, ''),
(94, 78, 1, ''),
(94, 78, 3, ''),
(93, 101, 2, ''),
(93, 101, 1, ''),
(93, 101, 3, '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_description`
--

CREATE TABLE IF NOT EXISTS `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(74, 1, 'Enchiladas de maiz con pollo', '', '', 'Enchiladas de maiz con pollo', '', ''),
(74, 3, 'Enchiladas de maiz con pollo', '', '', 'Enchiladas de maiz con pollo', '', ''),
(74, 2, 'Enchiladas de maiz con pollo', '', '', 'Enchiladas de maiz con pollo', '', ''),
(75, 2, 'Enchiladas combinadas', '', '', 'Enchiladas combinadas', '', ''),
(79, 3, 'Plato Enchilada', '', '', 'Plato Enchilada', '', ''),
(79, 2, 'Plato Enchilada', '', '', 'Plato Enchilada', '', ''),
(79, 1, 'Plato Enchilada', '', '', 'Plato Enchilada', '', ''),
(78, 3, 'Pavo Morelia', '', '', 'Pavo Morelia', '', ''),
(82, 1, 'Chili con carne', '', '', 'Chili con carne', '', ''),
(77, 1, 'Peppercrust Steak', '', '', 'Peppercrust Steak', '', ''),
(77, 3, 'Peppercrust Steak', '', '', 'Peppercrust Steak', '', ''),
(78, 2, 'Pavo Morelia', '', '', 'Pavo Morelia', '', ''),
(78, 1, 'Pavo Morelia', '', '', 'Pavo Morelia', '', ''),
(77, 2, 'Peppercrust Steak', '', '', 'Peppercrust Steak', '', ''),
(75, 1, 'Enchiladas combinadas', '', '', 'Enchiladas combinadas', '', ''),
(75, 3, 'Enchiladas combinadas', '', '', 'Enchiladas combinadas', '', ''),
(76, 2, 'Steak Suramericano', '', '', 'Steak Suramericano', '', ''),
(76, 1, 'Steak Suramericano', '', '', 'Steak Suramericano', '', ''),
(76, 3, 'Steak Suramericano', '', '', 'Steak Suramericano', '', ''),
(65, 1, 'CHIPS Y DIP', '', '', 'CHIPS Y DIP', '', ''),
(65, 3, 'CHIPS Y DIP', '', '', 'CHIPS Y DIP', '', ''),
(65, 2, 'CHIPS Y DIP', '', '', 'CHIPS Y DIP', '', ''),
(67, 3, 'NACHOS ORIGINAL ', '', '', 'NACHOS ORIGINAL ', '', ''),
(73, 2, 'Enchiladas Clasicas', '', '', 'Enchiladas Clasicas', '', ''),
(73, 1, 'Enchiladas Clasicas', '', '', 'Enchiladas Clasicas', '', ''),
(67, 1, 'NACHOS ORIGINAL ', '', '', 'NACHOS ORIGINAL ', '', ''),
(73, 3, 'Enchiladas Clasicas', '', '', 'Enchiladas Clasicas', '', ''),
(68, 1, 'TAQUITOS CON POLLO ', '', '', 'TAQUITOS CON POLLO ', '', ''),
(68, 3, 'TAQUITOS CON POLLO ', '', '', 'TAQUITOS CON POLLO ', '', ''),
(68, 2, 'TAQUITOS CON POLLO ', '', '', 'TAQUITOS CON POLLO ', '', ''),
(69, 1, 'CHEESE SKINS ', '', '', 'CHEESE SKINS ', '', ''),
(69, 3, 'CHEESE SKINS ', '', '', 'CHEESE SKINS ', '', ''),
(69, 2, 'CHEESE SKINS ', '', '', 'CHEESE SKINS ', '', ''),
(70, 1, 'BIG STARTER PLATTER ', '', '', 'BIG STARTER PLATTER ', '', ''),
(70, 3, 'BIG STARTER PLATTER ', '', '', 'BIG STARTER PLATTER ', '', ''),
(70, 2, 'BIG STARTER PLATTER ', '', '', 'BIG STARTER PLATTER ', 'Ab 2 Personen. ', ''),
(71, 2, 'Quesadas', '', '', 'Quesadas', '', ''),
(71, 1, 'Quesadas', '', '', 'Quesadas', '', ''),
(71, 3, 'Quesadas', '', '', 'Quesadas', '', ''),
(67, 2, 'NACHOS ORIGINAL ', '', '', 'NACHOS ORIGINAL ', '', ''),
(72, 3, 'Enchiladas Vegetarianas', '', '', 'Enchiladas Vegetarianas', '', ''),
(72, 1, 'Enchiladas Vegetarianas', '', '', 'Enchiladas Vegetarianas', '', ''),
(72, 2, 'Enchiladas Vegetarianas', '', '', 'Enchiladas Vegetarianas', '', ''),
(82, 3, 'Chili con carne', '', '', 'Chili con carne', '', ''),
(80, 1, 'The ultimate Buffalo Wings', '', '', 'The ultimate Buffalo Wings', '', ''),
(80, 3, 'The ultimate Buffalo Wings', '', '', 'The ultimate Buffalo Wings', '', ''),
(80, 2, 'The ultimate Buffalo Wings', '', '', 'The ultimate Buffalo Wings', '', ''),
(82, 2, 'Chili con carne', '', '', 'Chili con carne', '', ''),
(83, 2, 'Fajita Todos', '', '', 'Fajita Todos', '', ''),
(83, 1, 'Fajita Todos', '', '', 'Fajita Todos', '', ''),
(83, 3, 'Fajita Todos', '', '', 'Fajita Todos', '', ''),
(84, 2, 'Fajita Parrilla ', '', '', 'Fajita Parrilla ', '', ''),
(84, 1, 'Fajita Parrilla ', '', '', 'Fajita Parrilla ', '', ''),
(84, 3, 'Fajita Parrilla ', '', '', 'Fajita Parrilla ', '', ''),
(85, 2, 'Fajita Pollo', '', '', 'Fajita Pollo', '', ''),
(85, 1, 'Fajita Pollo', '', '', 'Fajita Pollo', '', ''),
(85, 3, 'Fajita Pollo', '', '', 'Fajita Pollo', '', ''),
(86, 1, 'Quesadillas Ligeras', '', '', 'Quesadillas Ligeras', '', ''),
(86, 3, 'Quesadillas Ligeras', '', '', 'Quesadillas Ligeras', '', ''),
(86, 2, 'Quesadillas Ligeras', '', '', 'Quesadillas Ligeras', '', ''),
(87, 2, 'Plato Mexicano', '', '', 'Plato Mexicano', '', ''),
(87, 1, 'Plato Mexicano', '', '', 'Plato Mexicano', '', ''),
(87, 3, 'Plato Mexicano', '', '', 'Plato Mexicano', '', ''),
(88, 2, 'Streetfood Tacos', '', '', 'Streetfood Tacos', '', ''),
(88, 1, 'Streetfood Tacos', '', '', 'Streetfood Tacos', '', ''),
(88, 3, 'Streetfood Tacos', '', '', 'Streetfood Tacos', '', ''),
(89, 2, 'Plato Verde ', '', '', 'Plato Verde ', '', ''),
(89, 1, 'Plato Verde ', '', '', 'Plato Verde ', '', ''),
(89, 3, 'Plato Verde ', '', '', 'Plato Verde ', '', ''),
(90, 2, 'Clasica', '', '', 'Clasica', '', ''),
(90, 1, 'Clasica', '', '', 'Clasica', '', ''),
(90, 3, 'Clasica', '', '', 'Clasica', '', ''),
(91, 2, 'Double Bacon Cheese Burger', '', '', 'Double Bacon Cheese Burger', '', ''),
(91, 1, 'Double Bacon Cheese Burger', '', '', 'Double Bacon Cheese Burger', '', ''),
(91, 3, 'Double Bacon Cheese Burger', '', '', 'Double Bacon Cheese Burger', '', ''),
(92, 2, 'El Gaucho', '', '', 'El Gaucho', '', ''),
(92, 1, 'El Gaucho', '', '', 'El Gaucho', '', ''),
(92, 3, 'El Gaucho', '', '', 'El Gaucho', '', ''),
(93, 3, 'Wagyu Burger', '', '', 'Wagyu Burger', '', ''),
(93, 1, 'Wagyu Burger', '', '', 'Wagyu Burger', '', ''),
(93, 2, 'Wagyu Burger', '', '', 'Wagyu Burger', '', ''),
(94, 1, 'Vegetariana ', '', '', 'Vegetariana ', '', ''),
(94, 2, 'Vegetariana ', '', '', 'Vegetariana ', '', ''),
(95, 2, 'Ensalada Puebla', '', '', 'Ensalada Puebla', '', ''),
(95, 1, 'Ensalada Puebla', '', '', 'Ensalada Puebla', '', ''),
(95, 3, 'Ensalada Puebla', '', '', 'Ensalada Puebla', '', ''),
(94, 3, 'Vegetariana ', '', '', 'Vegetariana ', '', ''),
(96, 2, 'Vodka', '', '', 'dsdsa', 'dssds', 'ddsds'),
(96, 1, 'vodka', '', '', 'fsdfdsf', 'dfsdf', 'dasdas'),
(96, 3, 'Водка', '', '', 'вывф', 'сыыф', 'аыв'),
(97, 1, 'Rum3', '', '', 'вывы', 'ававв', 'авава'),
(97, 2, 'Rum3', '', '', 'dfsdfs', 'fsfd', 'dgf'),
(98, 2, 'Rum 2', '', '', 'fsdfs', 'fdsfsd', 'fdfs'),
(98, 1, 'Rum 2', '', '', 'fsdfs', 'ffdg', 'fdfgd'),
(98, 3, 'Ром 2', '', '', 'вавыа', 'авыаы', 'аываы'),
(99, 2, 'Tekila', '', '', 'Tekila', 'Tekila', 'Tekila'),
(99, 1, 'Tekila', '', '', 'Tekila', 'Tekila', 'Tekila'),
(99, 3, 'Tekila', '', '', 'Tekila', 'Tekila', 'Tekila'),
(100, 1, 'Vine', '', '', 'вывы', 'ававв', 'авава'),
(100, 2, 'Vine', '', '', 'dfsdfs', 'fsfd', 'dgf'),
(101, 1, 'Absent', '', '', 'вывы', 'ававв', 'авава'),
(101, 2, 'Absent', '', '', 'dfsdfs', 'fsfd', 'dgf'),
(102, 1, 'Koniac', '', '', 'вывы', 'ававв', 'авава'),
(102, 2, 'Koniac', '', '', 'dfsdfs', 'fsfd', 'dgf'),
(103, 1, 'Rum', '', '', 'вывы', 'ававв', 'авава'),
(103, 2, 'Rum', '', '', 'dfsdfs', 'fsfd', 'dgf'),
(103, 3, 'Ром', '', '', 'аваы', 'аав', 'ммчм'),
(104, 1, 'Sem', '', '', 'вывы', 'ававв', 'авава'),
(104, 2, 'Sem', '', '', 'dfsdfs', 'fsfd', 'dgf'),
(97, 3, 'Ром 3', '', '', 'аваы', 'аав', 'ммчм'),
(100, 3, 'Vine', '', '', 'аваы', 'аав', 'ммчм'),
(101, 3, 'Абсент', '', '', 'аваы', 'аав', 'ммчм'),
(102, 3, 'Коньяк', '', '', 'аваы', 'аав', 'ммчм'),
(104, 3, 'Самогон', '', '', 'аваы', 'аав', 'ммчм'),
(105, 2, 'Vodka best', '', '', 'Vodka best', 'Vodka best', 'Vodka best'),
(105, 1, 'Vodka best', '', '', 'Vodka best', 'Vodka best', 'Vodka best'),
(105, 3, 'Vodka best', '', '', 'Vodka best', 'Vodka best', 'Vodka best');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_discount`
--

CREATE TABLE IF NOT EXISTS `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=441 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_filter`
--

CREATE TABLE IF NOT EXISTS `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_image`
--

CREATE TABLE IF NOT EXISTS `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2352 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_option`
--

CREATE TABLE IF NOT EXISTS `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=227 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_related`
--

CREATE TABLE IF NOT EXISTS `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_reward`
--

CREATE TABLE IF NOT EXISTS `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=546 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_special`
--

CREATE TABLE IF NOT EXISTS `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=440 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_category`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(65, 89),
(67, 89),
(68, 89),
(69, 89),
(70, 89),
(71, 59),
(72, 78),
(74, 78),
(75, 78),
(76, 92),
(77, 92),
(78, 92),
(79, 88),
(80, 88),
(82, 88),
(83, 80),
(84, 80),
(85, 80),
(87, 90),
(88, 90),
(89, 61),
(89, 90),
(90, 87),
(91, 87),
(92, 87),
(93, 87),
(94, 87),
(94, 93),
(95, 61),
(96, 66),
(97, 68),
(98, 70),
(99, 65),
(100, 76),
(101, 76),
(102, 69),
(103, 70),
(104, 66),
(105, 68);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_download`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(74, 0, 0),
(78, 0, 0),
(79, 0, 0),
(76, 0, 0),
(77, 0, 0),
(75, 0, 0),
(80, 0, 0),
(82, 0, 0),
(65, 0, 0),
(73, 0, 0),
(67, 0, 0),
(68, 0, 0),
(69, 0, 0),
(70, 0, 0),
(71, 0, 0),
(72, 0, 0),
(83, 0, 0),
(84, 0, 0),
(85, 0, 0),
(86, 0, 0),
(87, 0, 0),
(88, 0, 0),
(89, 0, 0),
(90, 0, 0),
(91, 0, 0),
(92, 0, 0),
(93, 0, 0),
(94, 0, 0),
(95, 0, 0),
(96, 0, 0),
(97, 0, 0),
(98, 0, 0),
(99, 0, 0),
(100, 0, 0),
(101, 0, 0),
(102, 0, 0),
(103, 0, 0),
(104, 0, 0),
(105, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(65, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_recurring_description`
--

CREATE TABLE IF NOT EXISTS `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return`
--

CREATE TABLE IF NOT EXISTS `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_action`
--

CREATE TABLE IF NOT EXISTS `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_history`
--

CREATE TABLE IF NOT EXISTS `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_reason`
--

CREATE TABLE IF NOT EXISTS `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_status`
--

CREATE TABLE IF NOT EXISTS `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_review`
--

CREATE TABLE IF NOT EXISTS `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_setting`
--

CREATE TABLE IF NOT EXISTS `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1576 ;

--
-- Дамп данных таблицы `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(4, 0, 'voucher', 'voucher_sort_order', '8', 0),
(5, 0, 'voucher', 'voucher_status', '1', 0),
(1565, 0, 'config', 'config_compression', '0', 0),
(1566, 0, 'config', 'config_secure', '0', 0),
(1567, 0, 'config', 'config_password', '1', 0),
(1568, 0, 'config', 'config_shared', '0', 0),
(1569, 0, 'config', 'config_encryption', 'MgpLs7M7fxvheis11J9c0SL33k04wKqVtEQiXSPHdosNuMBQejFRwwiFtrsD05J6xOvJZOzaxQAMCX5XcmGSCzpLgI2qiBdCjR30hMWbSrkfpp7bziTLs1fup7i7Rp1Gt4ucgJ9tcmglRk4rc8UcCqUu2lupBLupNy3TR3juCDCKGB6x8dhphTmVhg0c8nFJ05rQllGyFUjC5No6sXXG9CSMG78MTli8g3dv7GgnhwjbOv30e2xLepG4uArhtGNUxBKAVZkY4gX3xpf1MCXrDKOH3Hv0pOkVwpLuCUyGhoGfpguci8uHcG32vaGKgQM3cp3VXEeau507Ypp9hnkm2jh4QrTqLK78FXRevjGL77Rv2BKakfqkKPqvZsukvbZHDbnUxoPnTLWQzAkwQt4aPwsF8fninGhZDs9hcb2GmzEBKEzUujFBoWd3RiOEtl6cyuwM5UQjHut2FTkvhprizHXmRcXxLy6CNta5aenf4v9IppLEex2WD5VukkXSZpE8hGnKVAmkHy3bSEYHI0l6wLDsrZrHCEvPnbLeGfFYqfcZcOfQ2hhZcm7e7xWH6De2D0cJ6lPdnZ8o0NcfejKsBVtnAx2UhIEpiJGj5GQv3UddYihgHetUg1lcgvm01bWyLyTyV27y1Dp0EgtuHCA5GCccRMPz43Vz32eRxqFltmXO48jjzHCwtiGXxBbzUIgd2zHN1ohHiR47ya8SyNWJxNIx6yLWWB1hn976kna9dt4KuOgCbbTZyO2C4W3Ksu3p3OXtbSZUNBWZflmcDA4zoWJUdm1sbpG9Ewcb8z3deQEo8B3otatIeAYSUBgDeG7SEbW1HXKyimKqbZ0iFeMb1VzurAOxhZbc8pvjlsWLO2COO6tYTvFWyrHfJkbe7CrTesoHN91dyKb1ybCbRH4RVXpYlAJjVyad83zvD3njO8jWaczsLXWRfVurq0zPxP4RCsJrdGflY68Ncnqcj35D6XzhoiI9oZOXoFdANadlEyaH7RBECLbxeM0mukJnP0Zf', 0),
(1570, 0, 'config', 'config_file_max_size', '300000', 0),
(1571, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(1572, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(1573, 0, 'config', 'config_error_display', '1', 0),
(1574, 0, 'config', 'config_error_log', '1', 0),
(1575, 0, 'config', 'config_error_filename', 'error.log', 0),
(95, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(96, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(97, 0, 'shipping', 'shipping_sort_order', '3', 0),
(98, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(99, 0, 'sub_total', 'sub_total_status', '1', 0),
(100, 0, 'tax', 'tax_status', '1', 0),
(101, 0, 'total', 'total_sort_order', '9', 0),
(102, 0, 'total', 'total_status', '1', 0),
(103, 0, 'tax', 'tax_sort_order', '5', 0),
(104, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(105, 0, 'cod', 'cod_sort_order', '5', 0),
(106, 0, 'cod', 'cod_total', '0.01', 0),
(107, 0, 'cod', 'cod_order_status_id', '1', 0),
(108, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(109, 0, 'cod', 'cod_status', '1', 0),
(110, 0, 'shipping', 'shipping_status', '1', 0),
(111, 0, 'shipping', 'shipping_estimator', '1', 0),
(112, 0, 'coupon', 'coupon_sort_order', '4', 0),
(113, 0, 'coupon', 'coupon_status', '1', 0),
(114, 0, 'flat', 'flat_sort_order', '1', 0),
(115, 0, 'flat', 'flat_status', '1', 0),
(116, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(117, 0, 'flat', 'flat_tax_class_id', '9', 0),
(118, 0, 'flat', 'flat_cost', '5.00', 0),
(119, 0, 'credit', 'credit_sort_order', '7', 0),
(120, 0, 'credit', 'credit_status', '1', 0),
(121, 0, 'reward', 'reward_sort_order', '2', 0),
(122, 0, 'reward', 'reward_status', '1', 0),
(123, 0, 'category', 'category_status', '1', 0),
(124, 0, 'account', 'account_status', '1', 0),
(125, 0, 'affiliate', 'affiliate_status', '1', 0),
(942, 0, 'theme_default', 'theme_default_image_cart_width', '47', 0),
(941, 0, 'theme_default', 'theme_default_image_wishlist_height', '47', 0),
(940, 0, 'theme_default', 'theme_default_image_wishlist_width', '47', 0),
(939, 0, 'theme_default', 'theme_default_image_compare_height', '90', 0),
(938, 0, 'theme_default', 'theme_default_image_compare_width', '90', 0),
(937, 0, 'theme_default', 'theme_default_image_related_height', '200', 0),
(936, 0, 'theme_default', 'theme_default_image_related_width', '200', 0),
(935, 0, 'theme_default', 'theme_default_image_additional_height', '74', 0),
(934, 0, 'theme_default', 'theme_default_image_additional_width', '74', 0),
(933, 0, 'theme_default', 'theme_default_image_product_height', '228', 0),
(932, 0, 'theme_default', 'theme_default_image_product_width', '228', 0),
(931, 0, 'theme_default', 'theme_default_image_popup_height', '500', 0),
(930, 0, 'theme_default', 'theme_default_image_popup_width', '500', 0),
(929, 0, 'theme_default', 'theme_default_image_thumb_height', '228', 0),
(928, 0, 'theme_default', 'theme_default_image_thumb_width', '228', 0),
(927, 0, 'theme_default', 'theme_default_image_category_height', '80', 0),
(926, 0, 'theme_default', 'theme_default_image_category_width', '80', 0),
(925, 0, 'theme_default', 'theme_default_product_description_length', '100', 0),
(924, 0, 'theme_default', 'theme_default_product_limit', '15', 0),
(923, 0, 'theme_default', 'theme_default_status', '1', 0),
(922, 0, 'theme_default', 'theme_default_directory', 'enchilada', 0),
(150, 0, 'dashboard_activity', 'dashboard_activity_status', '1', 0),
(151, 0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0),
(152, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(153, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(154, 0, 'dashboard_chart', 'dashboard_chart_status', '1', 0),
(155, 0, 'dashboard_chart', 'dashboard_chart_width', '6', 0),
(156, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(157, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(158, 0, 'dashboard_map', 'dashboard_map_status', '1', 0),
(159, 0, 'dashboard_map', 'dashboard_map_width', '6', 0),
(160, 0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(161, 0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(162, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(163, 0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(164, 0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(165, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(166, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(167, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(168, 0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0),
(169, 0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0),
(170, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(171, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0),
(172, 0, 'dashboard_activity', 'dashboard_activity_width', '4', 0),
(173, 0, 'dashboard_recent', 'dashboard_recent_width', '8', 0),
(1564, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(1563, 0, 'config', 'config_seo_url', '0', 0),
(1562, 0, 'config', 'config_maintenance', '0', 0),
(1561, 0, 'config', 'config_mail_alert_email', '', 0),
(1560, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(1559, 0, 'config', 'config_mail_smtp_port', '25', 0),
(1558, 0, 'config', 'config_mail_smtp_password', '', 0),
(1557, 0, 'config', 'config_mail_smtp_username', '', 0),
(1556, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(1555, 0, 'config', 'config_mail_parameter', '', 0),
(1554, 0, 'config', 'config_mail_protocol', 'mail', 0),
(1552, 0, 'config', 'config_ftp_root', '', 0),
(1553, 0, 'config', 'config_ftp_status', '0', 0),
(1551, 0, 'config', 'config_ftp_password', '', 0),
(1549, 0, 'config', 'config_ftp_port', '21', 0),
(1550, 0, 'config', 'config_ftp_username', '', 0),
(1548, 0, 'config', 'config_ftp_hostname', 'opencart-test', 0),
(1547, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(1546, 0, 'config', 'config_logo', 'catalog/enchilada.png', 0),
(1545, 0, 'config', 'config_captcha_page', '["review","return","contact"]', 1),
(1544, 0, 'config', 'config_captcha', '', 0),
(1543, 0, 'config', 'config_return_status_id', '2', 0),
(1542, 0, 'config', 'config_return_id', '0', 0),
(1541, 0, 'config', 'config_affiliate_id', '4', 0),
(943, 0, 'theme_default', 'theme_default_image_cart_height', '47', 0),
(944, 0, 'theme_default', 'theme_default_image_location_width', '268', 0),
(945, 0, 'theme_default', 'theme_default_image_location_height', '50', 0),
(1540, 0, 'config', 'config_affiliate_commission', '5', 0),
(1539, 0, 'config', 'config_affiliate_auto', '0', 0),
(1538, 0, 'config', 'config_affiliate_approval', '0', 0),
(1537, 0, 'config', 'config_stock_checkout', '0', 0),
(1536, 0, 'config', 'config_stock_warning', '0', 0),
(1535, 0, 'config', 'config_stock_display', '0', 0),
(1533, 0, 'config', 'config_fraud_status_id', '7', 0),
(1534, 0, 'config', 'config_api_id', '1', 0),
(1532, 0, 'config', 'config_complete_status', '["5","3"]', 1),
(1530, 0, 'config', 'config_order_status_id', '1', 0),
(1531, 0, 'config', 'config_processing_status', '["5","1","2","12","3"]', 1),
(1529, 0, 'config', 'config_checkout_id', '5', 0),
(1528, 0, 'config', 'config_checkout_guest', '1', 0),
(1527, 0, 'config', 'config_cart_weight', '1', 0),
(1526, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(1525, 0, 'config', 'config_account_id', '3', 0),
(1524, 0, 'config', 'config_login_attempts', '5', 0),
(1523, 0, 'config', 'config_customer_price', '0', 0),
(1522, 0, 'config', 'config_customer_group_display', '["1"]', 1),
(1521, 0, 'config', 'config_customer_group_id', '1', 0),
(1520, 0, 'config', 'config_customer_search', '0', 0),
(1519, 0, 'config', 'config_customer_activity', '0', 0),
(1518, 0, 'config', 'config_customer_online', '0', 0),
(1517, 0, 'config', 'config_tax_customer', 'shipping', 0),
(1516, 0, 'config', 'config_tax_default', 'shipping', 0),
(1515, 0, 'config', 'config_tax', '1', 0),
(1514, 0, 'config', 'config_voucher_max', '1000', 0),
(1513, 0, 'config', 'config_voucher_min', '1', 0),
(1512, 0, 'config', 'config_review_guest', '1', 0),
(1511, 0, 'config', 'config_review_status', '1', 0),
(1510, 0, 'config', 'config_limit_admin', '20', 0),
(1509, 0, 'config', 'config_product_count', '1', 0),
(1508, 0, 'config', 'config_weight_class_id', '2', 0),
(1507, 0, 'config', 'config_length_class_id', '1', 0),
(1506, 0, 'config', 'config_currency_auto', '1', 0),
(1505, 0, 'config', 'config_currency', 'EUR', 0),
(1504, 0, 'config', 'config_admin_language', 'en-gb', 0),
(1503, 0, 'config', 'config_language', 'en-gb', 0),
(1502, 0, 'config', 'config_zone_id', '3563', 0),
(1501, 0, 'config', 'config_country_id', '222', 0),
(1500, 0, 'config', 'config_comment', '', 0),
(1499, 0, 'config', 'config_open', '', 0),
(1498, 0, 'config', 'config_image', 'catalog/enchilada.png', 0),
(1497, 0, 'config', 'config_fax', '', 0),
(1496, 0, 'config', 'config_telephone', '123456789', 0),
(1495, 0, 'config', 'config_email', 'asdh@ahsjk.com', 0),
(1494, 0, 'config', 'config_geocode', '', 0),
(1493, 0, 'config', 'config_address', 'Address 1', 0),
(1492, 0, 'config', 'config_owner', 'Danilo Gavgonov', 0),
(1491, 0, 'config', 'config_name', 'Enchilada Mexican Food', 0),
(1490, 0, 'config', 'config_layout_id', '4', 0),
(1489, 0, 'config', 'config_theme', 'theme_default', 0),
(1488, 0, 'config', 'config_meta_keyword', '', 0),
(1487, 0, 'config', 'config_meta_description', 'My Store', 0),
(1486, 0, 'config', 'config_meta_title', 'Enchilada', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_stock_status`
--

CREATE TABLE IF NOT EXISTS `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2-3 Days');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_store`
--

CREATE TABLE IF NOT EXISTS `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_class`
--

CREATE TABLE IF NOT EXISTS `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rate`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Дамп данных таблицы `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rule`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- Дамп данных таблицы `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_theme`
--

CREATE TABLE IF NOT EXISTS `oc_theme` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` text NOT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_translation`
--

CREATE TABLE IF NOT EXISTS `oc_translation` (
  `translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`translation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_upload`
--

CREATE TABLE IF NOT EXISTS `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_url_alias`
--

CREATE TABLE IF NOT EXISTS `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=895 ;

--
-- Дамп данных таблицы `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(730, 'manufacturer_id=8', 'apple'),
(881, 'information_id=4', 'about_us'),
(887, 'category_id=93', ''),
(828, 'manufacturer_id=9', 'canon'),
(829, 'manufacturer_id=5', 'htc'),
(830, 'manufacturer_id=7', 'hewlett-packard'),
(831, 'manufacturer_id=6', 'palm'),
(832, 'manufacturer_id=10', 'sony'),
(841, 'information_id=6', 'delivery'),
(842, 'information_id=3', 'privacy'),
(843, 'information_id=5', 'terms'),
(888, 'product_id=96', 'coffee'),
(892, 'product_id=97', 'rum3'),
(890, 'product_id=98', 'fsfsf'),
(891, 'product_id=99', 'Tekilas'),
(893, 'product_id=100', 'Vine'),
(894, 'product_id=105', 'Vodka best');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user`
--

CREATE TABLE IF NOT EXISTS `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', 'a8c0d6748a1ef18a65a1647e86450b1636e4b4e1', '5j2EHPZ0q', 'John', 'Doe', 'asdh@ahsjk.com', 'catalog/logan_lerman_akter_paren_1680x1050.jpg', '', '127.0.0.1', 1, '2016-11-02 18:40:03');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user_group`
--

CREATE TABLE IF NOT EXISTS `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{"access":["catalog\\/allergen","catalog\\/allergen_group","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/language","design\\/layout","design\\/menu","design\\/theme","design\\/translation","event\\/compatibility","event\\/theme","extension\\/analytics\\/google_analytics","extension\\/captcha\\/basic_captcha","extension\\/captcha\\/google_captcha","extension\\/dashboard\\/activity","extension\\/dashboard\\/chart","extension\\/dashboard\\/customer","extension\\/dashboard\\/map","extension\\/dashboard\\/online","extension\\/dashboard\\/order","extension\\/dashboard\\/recent","extension\\/dashboard\\/sale","extension\\/event","extension\\/extension","extension\\/extension\\/analytics","extension\\/extension\\/captcha","extension\\/extension\\/dashboard","extension\\/extension\\/feed","extension\\/extension\\/fraud","extension\\/extension\\/module","extension\\/extension\\/payment","extension\\/extension\\/shipping","extension\\/extension\\/theme","extension\\/extension\\/total","extension\\/feed\\/google_base","extension\\/feed\\/google_sitemap","extension\\/feed\\/openbaypro","extension\\/fraud\\/fraudlabspro","extension\\/fraud\\/ip","extension\\/fraud\\/maxmind","extension\\/installer","extension\\/modification","extension\\/module\\/account","extension\\/module\\/affiliate","extension\\/module\\/amazon_login","extension\\/module\\/amazon_pay","extension\\/module\\/banner","extension\\/module\\/bestseller","extension\\/module\\/carousel","extension\\/module\\/category","extension\\/module\\/divido_calculator","extension\\/module\\/ebay_listing","extension\\/module\\/featured","extension\\/module\\/filter","extension\\/module\\/google_hangouts","extension\\/module\\/html","extension\\/module\\/information","extension\\/module\\/klarna_checkout_module","extension\\/module\\/latest","extension\\/module\\/laybuy_layout","extension\\/module\\/pilibaba_button","extension\\/module\\/pp_button","extension\\/module\\/pp_login","extension\\/module\\/sagepay_direct_cards","extension\\/module\\/sagepay_server_cards","extension\\/module\\/slideshow","extension\\/module\\/special","extension\\/module\\/store","extension\\/openbay","extension\\/openbay\\/amazon","extension\\/openbay\\/amazon_listing","extension\\/openbay\\/amazon_product","extension\\/openbay\\/amazonus","extension\\/openbay\\/amazonus_listing","extension\\/openbay\\/amazonus_product","extension\\/openbay\\/ebay","extension\\/openbay\\/ebay_profile","extension\\/openbay\\/ebay_template","extension\\/openbay\\/etsy","extension\\/openbay\\/etsy_product","extension\\/openbay\\/etsy_shipping","extension\\/openbay\\/etsy_shop","extension\\/openbay\\/fba","extension\\/payment\\/amazon_login_pay","extension\\/payment\\/authorizenet_aim","extension\\/payment\\/authorizenet_sim","extension\\/payment\\/bank_transfer","extension\\/payment\\/bluepay_hosted","extension\\/payment\\/bluepay_redirect","extension\\/payment\\/cardconnect","extension\\/payment\\/cardinity","extension\\/payment\\/cheque","extension\\/payment\\/cod","extension\\/payment\\/divido","extension\\/payment\\/eway","extension\\/payment\\/firstdata","extension\\/payment\\/firstdata_remote","extension\\/payment\\/free_checkout","extension\\/payment\\/g2apay","extension\\/payment\\/globalpay","extension\\/payment\\/globalpay_remote","extension\\/payment\\/klarna_account","extension\\/payment\\/klarna_checkout","extension\\/payment\\/klarna_invoice","extension\\/payment\\/laybuy","extension\\/payment\\/liqpay","extension\\/payment\\/nochex","extension\\/payment\\/paymate","extension\\/payment\\/paypoint","extension\\/payment\\/payza","extension\\/payment\\/perpetual_payments","extension\\/payment\\/pilibaba","extension\\/payment\\/pp_express","extension\\/payment\\/pp_payflow","extension\\/payment\\/pp_payflow_iframe","extension\\/payment\\/pp_pro","extension\\/payment\\/pp_pro_iframe","extension\\/payment\\/pp_standard","extension\\/payment\\/realex","extension\\/payment\\/realex_remote","extension\\/payment\\/sagepay_direct","extension\\/payment\\/sagepay_server","extension\\/payment\\/sagepay_us","extension\\/payment\\/securetrading_pp","extension\\/payment\\/securetrading_ws","extension\\/payment\\/skrill","extension\\/payment\\/twocheckout","extension\\/payment\\/web_payment_software","extension\\/payment\\/worldpay","extension\\/shipping\\/auspost","extension\\/shipping\\/citylink","extension\\/shipping\\/fedex","extension\\/shipping\\/flat","extension\\/shipping\\/free","extension\\/shipping\\/item","extension\\/shipping\\/parcelforce_48","extension\\/shipping\\/pickup","extension\\/shipping\\/royal_mail","extension\\/shipping\\/ups","extension\\/shipping\\/usps","extension\\/shipping\\/weight","extension\\/store","extension\\/theme\\/theme_default","extension\\/total\\/coupon","extension\\/total\\/credit","extension\\/total\\/handling","extension\\/total\\/klarna_fee","extension\\/total\\/low_order_fee","extension\\/total\\/reward","extension\\/total\\/shipping","extension\\/total\\/sub_total","extension\\/total\\/tax","extension\\/total\\/total","extension\\/total\\/voucher","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/customer_search","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","startup\\/compatibility","startup\\/error","startup\\/event","startup\\/login","startup\\/permission","startup\\/router","startup\\/sass","startup\\/startup","statistic\\/bill","tool\\/backup","tool\\/log","tool\\/upload","user\\/api","user\\/user","user\\/user_permission"],"modify":["catalog\\/allergen","catalog\\/allergen_group","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/language","design\\/layout","design\\/menu","design\\/theme","design\\/translation","event\\/compatibility","event\\/theme","extension\\/analytics\\/google_analytics","extension\\/captcha\\/basic_captcha","extension\\/captcha\\/google_captcha","extension\\/dashboard\\/activity","extension\\/dashboard\\/chart","extension\\/dashboard\\/customer","extension\\/dashboard\\/map","extension\\/dashboard\\/online","extension\\/dashboard\\/order","extension\\/dashboard\\/recent","extension\\/dashboard\\/sale","extension\\/event","extension\\/extension","extension\\/extension\\/analytics","extension\\/extension\\/captcha","extension\\/extension\\/dashboard","extension\\/extension\\/feed","extension\\/extension\\/fraud","extension\\/extension\\/module","extension\\/extension\\/payment","extension\\/extension\\/shipping","extension\\/extension\\/theme","extension\\/extension\\/total","extension\\/feed\\/google_base","extension\\/feed\\/google_sitemap","extension\\/feed\\/openbaypro","extension\\/fraud\\/fraudlabspro","extension\\/fraud\\/ip","extension\\/fraud\\/maxmind","extension\\/installer","extension\\/modification","extension\\/module\\/account","extension\\/module\\/affiliate","extension\\/module\\/amazon_login","extension\\/module\\/amazon_pay","extension\\/module\\/banner","extension\\/module\\/bestseller","extension\\/module\\/carousel","extension\\/module\\/category","extension\\/module\\/divido_calculator","extension\\/module\\/ebay_listing","extension\\/module\\/featured","extension\\/module\\/filter","extension\\/module\\/google_hangouts","extension\\/module\\/html","extension\\/module\\/information","extension\\/module\\/klarna_checkout_module","extension\\/module\\/latest","extension\\/module\\/laybuy_layout","extension\\/module\\/pilibaba_button","extension\\/module\\/pp_button","extension\\/module\\/pp_login","extension\\/module\\/sagepay_direct_cards","extension\\/module\\/sagepay_server_cards","extension\\/module\\/slideshow","extension\\/module\\/special","extension\\/module\\/store","extension\\/openbay","extension\\/openbay\\/amazon","extension\\/openbay\\/amazon_listing","extension\\/openbay\\/amazon_product","extension\\/openbay\\/amazonus","extension\\/openbay\\/amazonus_listing","extension\\/openbay\\/amazonus_product","extension\\/openbay\\/ebay","extension\\/openbay\\/ebay_profile","extension\\/openbay\\/ebay_template","extension\\/openbay\\/etsy","extension\\/openbay\\/etsy_product","extension\\/openbay\\/etsy_shipping","extension\\/openbay\\/etsy_shop","extension\\/openbay\\/fba","extension\\/payment\\/amazon_login_pay","extension\\/payment\\/authorizenet_aim","extension\\/payment\\/authorizenet_sim","extension\\/payment\\/bank_transfer","extension\\/payment\\/bluepay_hosted","extension\\/payment\\/bluepay_redirect","extension\\/payment\\/cardconnect","extension\\/payment\\/cardinity","extension\\/payment\\/cheque","extension\\/payment\\/cod","extension\\/payment\\/divido","extension\\/payment\\/eway","extension\\/payment\\/firstdata","extension\\/payment\\/firstdata_remote","extension\\/payment\\/free_checkout","extension\\/payment\\/g2apay","extension\\/payment\\/globalpay","extension\\/payment\\/globalpay_remote","extension\\/payment\\/klarna_account","extension\\/payment\\/klarna_checkout","extension\\/payment\\/klarna_invoice","extension\\/payment\\/laybuy","extension\\/payment\\/liqpay","extension\\/payment\\/nochex","extension\\/payment\\/paymate","extension\\/payment\\/paypoint","extension\\/payment\\/payza","extension\\/payment\\/perpetual_payments","extension\\/payment\\/pilibaba","extension\\/payment\\/pp_express","extension\\/payment\\/pp_payflow","extension\\/payment\\/pp_payflow_iframe","extension\\/payment\\/pp_pro","extension\\/payment\\/pp_pro_iframe","extension\\/payment\\/pp_standard","extension\\/payment\\/realex","extension\\/payment\\/realex_remote","extension\\/payment\\/sagepay_direct","extension\\/payment\\/sagepay_server","extension\\/payment\\/sagepay_us","extension\\/payment\\/securetrading_pp","extension\\/payment\\/securetrading_ws","extension\\/payment\\/skrill","extension\\/payment\\/twocheckout","extension\\/payment\\/web_payment_software","extension\\/payment\\/worldpay","extension\\/shipping\\/auspost","extension\\/shipping\\/citylink","extension\\/shipping\\/fedex","extension\\/shipping\\/flat","extension\\/shipping\\/free","extension\\/shipping\\/item","extension\\/shipping\\/parcelforce_48","extension\\/shipping\\/pickup","extension\\/shipping\\/royal_mail","extension\\/shipping\\/ups","extension\\/shipping\\/usps","extension\\/shipping\\/weight","extension\\/store","extension\\/theme\\/theme_default","extension\\/total\\/coupon","extension\\/total\\/credit","extension\\/total\\/handling","extension\\/total\\/klarna_fee","extension\\/total\\/low_order_fee","extension\\/total\\/reward","extension\\/total\\/shipping","extension\\/total\\/sub_total","extension\\/total\\/tax","extension\\/total\\/total","extension\\/total\\/voucher","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/customer_search","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","startup\\/compatibility","startup\\/error","startup\\/event","startup\\/login","startup\\/permission","startup\\/router","startup\\/sass","startup\\/startup","statistic\\/bill","tool\\/backup","tool\\/log","tool\\/upload","user\\/api","user\\/user","user\\/user_permission"]}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_history`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_weight_class`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(2, '1.00000000'),
(1, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 2, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz'),
(2, 1, 'Gram', 'g'),
(2, 3, 'Gram', 'g');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4236 ;

--
-- Дамп данных таблицы `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M''Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu''a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark''unik''', 'GEG', 1),
(184, 11, 'Kotayk''', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik''', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots'' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Niederösterreich', 'NOS', 1),
(202, 14, 'Oberösterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore''s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel''skaya (Homyel'')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George''s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith''s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M''Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O''Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '''Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma''iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa''id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina''', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina''', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d''Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-Württemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Thüringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand''Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Puducherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'Kalimantan Utara', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta''mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be''er Sheva', 'BS', 1),
(1613, 104, 'Bika''at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '''Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al ''Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa''', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa''', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma''an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P''yongan-bukto', 'PYB', 1),
(1769, 112, 'P''yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P''yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 1),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al ''Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra''', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale''s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha''s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al ''Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati''', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord-Brabant', 'NB', 1),
(2336, 150, 'Noord-Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid-Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke''s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa''id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul''yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust''-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A''ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa''asaleleaga', 'FA', 1),
(2856, 181, 'Gaga''emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa''itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '''Asir', 'AS', 1),
(2882, 184, 'Ha''il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A''ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'Gävleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'Jämtland', 'Z', 1),
(3080, 203, 'Jönköping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, 'Örebro', 'T', 1),
(3085, 203, 'Östergötland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'Södermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'Värmland', 'S', 1),
(3091, 203, 'Västerbotten', 'AC', 1),
(3092, 203, 'Västernorrland', 'Y', 1),
(3093, 203, 'Västmanland', 'U', 1),
(3094, 203, 'Västra Götaland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graubünden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Zürich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t''ou', 'NT', 1),
(3145, 206, 'P''eng-hu', 'PH', 1),
(3146, 206, 'P''ing-tung', 'PT', 1),
(3147, 206, 'T''ai-chung', 'TG', 1),
(3148, 206, 'T''ai-nan', 'TA', 1),
(3149, 206, 'T''ai-pei county', 'TP', 1),
(3150, 206, 'T''ai-tung', 'TT', 1),
(3151, 206, 'T''ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T''ai-chung', 'TH', 1),
(3157, 206, 'T''ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T''ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha''apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava''u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkas''ka Oblast''', '71', 1),
(3481, 220, 'Chernihivs''ka Oblast''', '74', 1),
(3482, 220, 'Chernivets''ka Oblast''', '77', 1),
(3483, 220, 'Crimea', '43', 1),
(3484, 220, 'Dnipropetrovs''ka Oblast''', '12', 1),
(3485, 220, 'Donets''ka Oblast''', '14', 1),
(3486, 220, 'Ivano-Frankivs''ka Oblast''', '26', 1),
(3487, 220, 'Khersons''ka Oblast''', '65', 1),
(3488, 220, 'Khmel''nyts''ka Oblast''', '68', 1),
(3489, 220, 'Kirovohrads''ka Oblast''', '35', 1),
(3490, 220, 'Kyiv', '30', 1),
(3491, 220, 'Kyivs''ka Oblast''', '32', 1),
(3492, 220, 'Luhans''ka Oblast''', '09', 1),
(3493, 220, 'L''vivs''ka Oblast''', '46', 1),
(3494, 220, 'Mykolayivs''ka Oblast''', '48', 1),
(3495, 220, 'Odes''ka Oblast''', '51', 1),
(3496, 220, 'Poltavs''ka Oblast''', '53', 1),
(3497, 220, 'Rivnens''ka Oblast''', '56', 1),
(3498, 220, 'Sevastopol''', '40', 1),
(3499, 220, 'Sums''ka Oblast''', '59', 1),
(3500, 220, 'Ternopil''s''ka Oblast''', '61', 1),
(3501, 220, 'Vinnyts''ka Oblast''', '05', 1),
(3502, 220, 'Volyns''ka Oblast''', '07', 1),
(3503, 220, 'Zakarpats''ka Oblast''', '21', 1),
(3504, 220, 'Zaporiz''ka Oblast''', '23', 1),
(3505, 220, 'Zhytomyrs''ka oblast''', '18', 1),
(3506, 221, 'Abu Dhabi', 'ADH', 1),
(3507, 221, '''Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubai', 'DU', 1),
(3511, 221, 'R''as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg''ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma''rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa''dah', 'SD', 1),
(3805, 235, 'San''a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta''izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Kharkivs''ka Oblast''', '63', 1),
(4225, 118, 'Beirut', 'LB-BR', 1),
(4226, 118, 'Bekaa', 'LB-BE', 1),
(4227, 118, 'Mount Lebanon', 'LB-ML', 1),
(4228, 118, 'Nabatieh', 'LB-NB', 1),
(4229, 118, 'North', 'LB-NR', 1),
(4230, 118, 'South', 'LB-ST', 1),
(4231, 99, 'Telangana', 'TS', 1),
(4232, 44, 'Qinghai', 'QH', 1),
(4233, 100, 'Papua Barat', 'PB', 1),
(4234, 100, 'Sulawesi Barat', 'SR', 1),
(4235, 100, 'Kepulauan Riau', 'KR', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

--
-- Дамп данных таблицы `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
