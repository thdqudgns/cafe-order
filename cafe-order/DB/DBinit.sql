-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cafe
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cafe` ;

-- -----------------------------------------------------
-- Schema cafe
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cafe` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cafe` ;

-- -----------------------------------------------------
-- Table `cafe`.`kind`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cafe`.`kind` ;

CREATE TABLE IF NOT EXISTS `cafe`.`kind` (
  `kind_id` INT NOT NULL,
  `kind_name` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`kind_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cafe`.`menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cafe`.`menu` ;

CREATE TABLE IF NOT EXISTS `cafe`.`menu` (
  `menu_id` INT NOT NULL,
  `kind_id` INT NOT NULL,
  `menu_name` VARCHAR(45) NOT NULL,
  `img_path` VARCHAR(100) NOT NULL,
  `hot_price` INT NULL,
  `iced_price` INT NULL,
  PRIMARY KEY (`menu_id`),
  INDEX `FK_kind_menu_kind_id_idx` (`kind_id` ASC) VISIBLE,
  CONSTRAINT `FK_kind_menu_kind_id`
    FOREIGN KEY (`kind_id`)
    REFERENCES `cafe`.`kind` (`kind_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cafe`.`order_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cafe`.`order_list` ;

CREATE TABLE IF NOT EXISTS `cafe`.`order_list` (
  `order_list_no` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`order_list_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cafe`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cafe`.`user` ;

CREATE TABLE IF NOT EXISTS `cafe`.`user` (
  `user_no` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cafe`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cafe`.`order` ;

CREATE TABLE IF NOT EXISTS `cafe`.`order` (
  `order_list_no` INT NOT NULL,
  `order_no` INT NOT NULL AUTO_INCREMENT,
  `user_no` INT NOT NULL,
  `menu_id` INT NOT NULL,
  `shot` TINYINT NOT NULL DEFAULT 0,
  `heizlenut` TINYINT NOT NULL DEFAULT 0,
  `vanilla` TINYINT NOT NULL DEFAULT 0,
  `cal_price` INT NOT NULL DEFAULT 0,
  `order_date` TIMESTAMP NOT NULL DEFAULT current_timestamp,
  `temperature` TINYINT NULL,
  PRIMARY KEY (`order_no`, `order_list_no`),
  INDEX `FK_order_list_order_order_list_no_idx` (`order_list_no` ASC) VISIBLE,
  INDEX `FK_user_order_user_no_idx` (`user_no` ASC) VISIBLE,
  INDEX `FK_menu_order_menu_id_idx` (`menu_id` ASC) VISIBLE,
  CONSTRAINT `FK_order_list_order_order_list_no`
    FOREIGN KEY (`order_list_no`)
    REFERENCES `cafe`.`order_list` (`order_list_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_user_order_user_no`
    FOREIGN KEY (`user_no`)
    REFERENCES `cafe`.`user` (`user_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_menu_order_menu_id`
    FOREIGN KEY (`menu_id`)
    REFERENCES `cafe`.`menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

desc kind;
desc menu;
desc `order`;
desc order_list;
desc user;

insert into kind values(1, '커피'), (2, '라떼'), (3, '차'), (4, '에이드'), (5, '스무디'), (6, '아이스크림');
select * from kind;
commit;

insert into menu values
(1001, 1, '아메리카노', 'https://i.imgur.com/lff1Z8v.jpg', 1500, 2000),
(1002, 1, '카페라떼', 'https://i.imgur.com/Q1S2oQt.jpg', 2000, 2500),
(1003, 1, '오트라떼', 'https://i.imgur.com/1qap6tO.jpg', null, 3500),
(1004, 1, '디카페인오트라떼', 'https://i.imgur.com/1qap6tO.jpg', null, 4000),
(1005, 1, '연유라떼', 'https://i.imgur.com/XXr81dY.jpg', 2800, 3300),
(1006, 1, '바닐라라떼', 'https://i.imgur.com/A85iYKU.jpg', 2800, 3300),
(1007, 1, '카라멜마끼아또', 'https://i.imgur.com/kV8gzff.jpg', 3000, 3500),
(1008, 1, '카페모카', 'https://i.imgur.com/1tlQ2pM.jpg', 3000, 3500),
(1009, 1, '콜드브루', 'https://i.imgur.com/43yKpmD.jpg', null, 2000),
(1010, 1, '디카페인콜드브루', 'https://i.imgur.com/43yKpmD.jpg', null, 2500),
(1011, 1, '콜드브루라떼', 'https://i.imgur.com/A85iYKU.jpg', null, 2500),
(1012, 1, '디카페인콜드브루라떼', 'https://i.imgur.com/A85iYKU.jpg', null, 3000),

(1013, 2, '그린티라떼', 'https://i.imgur.com/1YVnw62.jpg', 2500, 3000),
(1014, 2, '초코라떼', 'https://i.imgur.com/QCcVMhF.jpg', 2500, 3000),
(1015, 2, '화이트초코라떼', 'https://i.imgur.com/WoJCCwP.jpg', 2500, 3000),
(1016, 2, '곡물라떼', 'https://i.imgur.com/NQoluTH.jpg', 3000, 3300),
(1017, 2, '고구마라떼', 'https://i.imgur.com/kqUofGz.jpg', 3000, 3300),
(1018, 2, '루이보스밀크티', 'https://i.imgur.com/7K7UPIB.jpg', 3000, 3000),
(1019, 2, '딸기라떼', 'https://i.imgur.com/0kzGIxu.jpg', null, 3000),
(1020, 2, '흑당라떼', 'https://i.imgur.com/t8s1Bfy.jpg', null, 3000),

(1021, 3, '얼그레이', 'https://i.imgur.com/4nKVTjT.jpg', 2500, 2500),
(1022, 3, '캐모마일', 'https://i.imgur.com/Smr7iD6.jpg', 2500, 2500),
(1023, 3, '루이보스데바이네', 'https://i.imgur.com/jdA7g8P.jpg', 2500, 2500),
(1024, 3, '버베나오렌지민트', 'https://i.imgur.com/JjVob8r.jpg', 2500, 2500),
(1025, 3, '유자차', 'https://i.imgur.com/Uqpe3Rp.jpg', 2700, 3000),
(1026, 3, '자몽차', 'https://i.imgur.com/LmT7gxq.jpg', 2700, 3000),
(1027, 3, '레몬차', 'https://i.imgur.com/P1wYWpJ.jpg', 2700, 3000),
(1028, 3, '한라봉차', 'https://i.imgur.com/G0WJkrD.jpg', 2700, 3000),
(1029, 3, '자몽허니블랙티', 'https://i.imgur.com/pPKiW9e.jpg', 3000, 3300),
(1030, 3, '유자캐모마일', 'https://i.imgur.com/niY5Ouw.jpg', 3000, 3300),
(1031, 3, '레몬페퍼민트', 'https://i.imgur.com/sE7jf0R.jpg', 3000, 3300),
(1032, 3, '복숭아아이스티', 'https://i.imgur.com/d3s4yf3.jpg', null, 2500),

(1033, 4, '레몬에이드', 'https://i.imgur.com/Nsx3vU0.jpg', null, 3500),
(1034, 4, '자몽에이드', 'https://i.imgur.com/T6ctOgV.jpg', null, 3500),
(1035, 4, '애플망고에이드', 'https://i.imgur.com/H0rj1cH.jpg', null, 3500),
(1036, 4, '한라봉에이드', 'https://i.imgur.com/1aFqzFE.jpg', null, 3500),

(1037, 5, '밀크쉐이크', 'https://i.imgur.com/wfuWPTf.jpg', null, 3500),
(1038, 5, '요거트스무디', 'https://i.imgur.com/Ut1YqLY.jpg', null, 3500),
(1039, 5, '딸기요거트스무디', 'https://i.imgur.com/Og5NfHO.jpg', null, 3800),
(1040, 5, '애플망고스무디', 'https://i.imgur.com/QzbE1nv.jpg', null, 3800),

(1041, 6, '아몬드봉봉', 'https://i.imgur.com/czd5aQO.jpg', null, 3600),
(1042, 6, '쿠키앤크림', 'https://i.imgur.com/i8Nes9E.jpg', null, 3600),
(1043, 6, '초콜릿무스', 'https://i.imgur.com/KRk2lv2.jpg', null, 3600),
(1044, 6, '나와라꼬부기', 'https://i.imgur.com/AHICH2F.jpg', null, 3600),
(1045, 6, '슈팅스타', 'https://i.imgur.com/sitrZF7.jpg', null, 3600),
(1046, 6, '피카피카피카추', 'https://i.imgur.com/naZxuTM.jpg', null, 3600),
(1047, 6, '엄마는외계인', 'https://i.imgur.com/HCTAhll.jpg', null, 3600),
(1048, 6, '체리쥬빌레', 'https://i.imgur.com/oaYlbEI.jpg', null, 3600),
(1049, 6, '이상한나라의솜사탕', 'https://i.imgur.com/u6EWhj5.jpg', null, 3600)
;

select * from menu;
commit;

desc `order`;
desc order_list;
desc user;


