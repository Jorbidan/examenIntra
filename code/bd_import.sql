CREATE DATABASE  IF NOT EXISTS `db_examen_intra_AUT20` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `db_examen_intra_AUT20`;

DROP TABLE IF EXISTS `tbl_item_list`;
DROP TABLE IF EXISTS `tbl_user`;


CREATE TABLE `tbl_user` (
    `id_user` INT(11) NOT NULL AUTO_INCREMENT,
    `last_name` VARCHAR(45) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `first_name` VARCHAR(45) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `password_hash` VARCHAR(255) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `email` VARCHAR(45) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `postal_code` VARCHAR(45) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `phone_number` VARCHAR(11) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `address` VARCHAR(45) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `city` VARCHAR(45) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    PRIMARY KEY (`id_user`)
)  ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=UTF8 COLLATE = UTF8_UNICODE_CI;


DROP PROCEDURE IF EXISTS `get_all_users`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_users`()
BEGIN
	SELECT first_name,
    last_name,
    password_hash,
    email,
    postal_code,
    phone_number,
    address,
    city  
  FROM tbl_user;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `get_user_by_id`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_by_id`(
	IN filter_id_user int
)
BEGIN
	SELECT first_name,
    last_name,
    email,
    postal_code,
    phone_number,
    address,
    city 
  FROM tbl_user WHERE id_user = filter_id_user limit 1;
END ;;
DELIMITER ;

DROP procedure IF EXISTS `get_user_credentials_from_email`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_credentials_from_email`(
	IN filter_email VARCHAR(45)
)
BEGIN
	SELECT id_user, password_hash
  FROM tbl_user WHERE email = filter_email limit 1;
END ;;
DELIMITER ;



CREATE TABLE `tbl_item_list` (
    `id_item_list` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) COLLATE UTF8_UNICODE_CI DEFAULT NULL,
    `quantity` INT(11) NOT NULL,
    `id_user` INT(11) NOT NULL,
    PRIMARY KEY (`id_item_list`),
    INDEX (`id_user`),
    FOREIGN KEY (`id_user`)
        REFERENCES tbl_user (`id_user`)
)  ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=UTF8 COLLATE = UTF8_UNICODE_CI;



DROP procedure IF EXISTS `get_items_for_user`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_items_for_user`(
	IN filter_id_user int
)
BEGIN
	SELECT id_item_list, `name`, `quantity`
  FROM tbl_item_list WHERE id_user = filter_id_user;
END ;;
DELIMITER ;


INSERT INTO `tbl_user` 
  VALUES  (1,'Lachance','Jean','$2y$10$2PexAcXPnxCd5PibG.z31uhmUoZsp9NUeBZ3KHrlhSuHr2NaUbDOS','jean.lachance@gmail.com', 'G5Y2V1', '4182263918', '1030 rue du gouverneur','Québec'),
          (2,'Mercier','Roger','$2y$10$2PexAcXPnxCd5PibG.z31uhmUoZsp9NUeBZ3KHrlhSuHr2NaUbDOS','rMercier@hotmail.com', 'G9I3G7', '5182260805', '759 87e rue','Saint-Georges'),
          (3,'Lepetit','Frank','$2y$10$2PexAcXPnxCd5PibG.z31uhmUoZsp9NUeBZ3KHrlhSuHr2NaUbDOS','FL107@outlook.com', 'G8U3B5', '3132256', '750 6e avenue','Beauceville');

INSERT INTO `tbl_item_list` VALUES (1,'Pommes',3,1),(2,'Fraises',20,1),(3,'Oeufs',12,1);

