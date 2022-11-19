DROP DATABASE if exists game_company;
CREATE DATABASE game_company CHARACTER SET utf8 COLLATE utf8_general_ci;
use game_company;

/*****************************************************/

CREATE TABLE `country` (
	`id` int(3) unsigned NOT NULL AUTO_INCREMENT,
	`country_code` varchar(2) NOT NULL UNIQUE,
	`country_name` varchar(100) NOT NULL UNIQUE,
	PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `coupon` (
    `id` int (11) NOT NULL AUTO_INCREMENT,
    `id_coupon_type` tinyint(2) NOT NULL,
    `quantity` int(2) UNSIGNED,
    `number_uses` int(5) UNSIGNED,
    `remaining_uses` int(5) UNSIGNED,
    `date_create_coupon` datetime,
    `is_active` tinyint(2),
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `coupon_type` (
    `id` tinyint (2) NOT NULL AUTO_INCREMENT,
    `coupon_type` varchar(20) NOT NULL,
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `employee` (
    `id` int (4) NOT NULL AUTO_INCREMENT,
    `id_user` int(11) NOT NULL,
    `id_type_employee` tinyint(2) NULL,
    `id_experience_employee` tinyint(2) NULL,
    `date_start_job` date NULL,
    `date_end_job` date NULL,
    `is_active` tinyint(2),
    `address` varchar(255),
    `personal_phone` varchar(15),
    `business_phone` varchar(15),
    `id_country_birth` int(3) UNSIGNED,
    `created_at` datetime NOT NULL,
	`updated_at` datetime NOT NULL,
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `employee_experience` (
    `id` tinyint (2) NOT NULL AUTO_INCREMENT,
    `name_employee_experience` varchar(40) NOT NULL,
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `employee_participated_gamedev` (
    `id` int(6) NOT NULL AUTO_INCREMENT,
    `id_game` int(3) NOT NULL,
    `id_employee` int(4) NOT NULL,
    `rol_development` varchar(255),
    `date_start_participated` datetime,
    `date_end_participated` datetime,
    `months_participated` int(2) UNSIGNED,
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `employee_salary` (
    `id` int (6) NOT NULL AUTO_INCREMENT,
    `id_employee` int(4) NOT NULL,
    `actual_month` float UNSIGNED,
    `next_month` float UNSIGNED,
    `total_payed` float UNSIGNED,
    `is_payed_actual_month` tinyint(2) NOT NULL,
    `is_actived_salary` tinyint(2) NOT NULL,
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `employee_type` (
    `id` tinyint (2) NOT NULL AUTO_INCREMENT,
    `name_employee_type` varchar(40) NOT NULL,
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `game` (
    `id` int (3) NOT NULL AUTO_INCREMENT,
    `title_game` varchar(60) NOT NULL,
    `id_genre` int(2) NOT NULL,
    `publish_date` date,
    `on_sale` tinyint(2),
    `description` text,
    `id_image_cover` int(6),
    `created_at` datetime NOT NULL,
	`updated_at` datetime NOT NULL,
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `game_genre` (
    `id` int (2) NOT NULL AUTO_INCREMENT,
    `game_genre` varchar(60) NOT NULL,
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `game_platform` (
    `id` int (6) NOT NULL AUTO_INCREMENT,
    `id_game` int(3),
    `id_platform` tinyint(2),
    `actual_price` float,
    `publish_date` datetime,
    `is_publish` tinyint(2),
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `game_serial` (
    `id` int (11) NOT NULL AUTO_INCREMENT,
    `serial` varchar(30) NOT NULL,
    `id_game_platform` int(6),
    `is_active_in_platform` tinyint(2),
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `image` (
    `id` int (6) NOT NULL AUTO_INCREMENT,
    `name_image` varchar(100),
    `location_image` varchar(200),
    `alt_image` varchar(100),
    `is_original_image` tinyint(2),
    `id_original_image` int(6),
    `created_at` datetime,
    `updated_at` datetime,
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `platform` (
    `id` tinyint (2) NOT NULL AUTO_INCREMENT,
    `name_platform` varchar(60) NOT NULL,
    `abbreviation` varchar(10) NOT NULL,
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `transaction` (
    `id` bigint (20) NOT NULL AUTO_INCREMENT,
    `id_user` int(11) NOT NULL,
    `id_serial` int(11),
    `price_total` float UNSIGNED,
    `price_sold` float UNSIGNED,
    `id_coupon` int(11),
    `date_sold` datetime,
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `user` (
    `id` int (11) NOT NULL AUTO_INCREMENT,
    `user_name` varchar(50) NULL,
    `user_surname` varchar(80) NULL,
    `user_email` varchar(120) NULL unique,
    `user_pass` varchar(255) NOT NULL,
    `id_user_type` tinyint(2) NOT NULL,
    `user_status` tinyint(2) NOT NULL,
    `newsletter` tinyint(2) NOT NULL DEFAULT 0,
	`created_at` datetime NOT NULL,
	`updated_at` datetime NOT NULL,
	`deleted_at` datetime NULL,
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `user_buyers_deleted` (
    `id` int (4) NOT NULL AUTO_INCREMENT,
    `id_user` int(11) NOT NULL,
    `user_info` varchar(255),
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `user_type` (
    `id` tinyint (2) NOT NULL AUTO_INCREMENT,
    `name_user_type` varchar(20) NOT NULL,
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `user_cart` (
    `id` int (11) NOT NULL AUTO_INCREMENT,
    `id_user` int(11),
    `id_game_platform` int(6) NOT NULL,
    `date_add` datetime,
    PRIMARY KEY (id)
);

/*****************************************************/

CREATE TABLE `user_favourite_game` (
    `id` int (11) NOT NULL AUTO_INCREMENT,
    `id_user` int(11),
    `id_game_platform` int(6) NOT NULL,
    `date_add` datetime,
    PRIMARY KEY (id)
);
