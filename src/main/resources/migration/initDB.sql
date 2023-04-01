-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema internet_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema internet_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `internet_store` DEFAULT CHARACTER SET utf8mb3 ;
USE `internet_store` ;

-- -----------------------------------------------------
-- Table `internet_store`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internet_store`.`category` (
                                                           `ID` INT NOT NULL AUTO_INCREMENT,
                                                           `category` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`ID`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 5
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `internet_store`.`color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internet_store`.`color` (
                                                        `ID` INT NOT NULL AUTO_INCREMENT,
                                                        `color` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`ID`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 4
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `internet_store`.`size`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internet_store`.`size` (
                                                       `ID` INT NOT NULL AUTO_INCREMENT,
                                                       `size` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`ID`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 5
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `internet_store`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internet_store`.`products` (
                                                           `ID` INT NOT NULL AUTO_INCREMENT,
                                                           `name` VARCHAR(45) NOT NULL,
    `image` VARCHAR(450) NOT NULL,
    `price` INT NOT NULL DEFAULT '0',
    `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `sex` ENUM('Male', 'Female', 'Unisex') NOT NULL DEFAULT 'Unisex',
    `category_ID` INT NULL DEFAULT NULL,
    `color_ID` INT NULL DEFAULT NULL,
    `size_ID` INT NULL DEFAULT NULL,
    PRIMARY KEY (`ID`),
    INDEX `fk_Goods_Category_idx` (`category_ID` ASC) VISIBLE,
    INDEX `fk_Goods_Color1_idx` (`color_ID` ASC) VISIBLE,
    INDEX `fk_Goods_Size1_idx` (`size_ID` ASC) VISIBLE,
    CONSTRAINT `fk_Goods_Category`
    FOREIGN KEY (`category_ID`)
    REFERENCES `internet_store`.`category` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
    CONSTRAINT `fk_Goods_Color1`
    FOREIGN KEY (`color_ID`)
    REFERENCES `internet_store`.`color` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
    CONSTRAINT `fk_Goods_Size1`
    FOREIGN KEY (`size_ID`)
    REFERENCES `internet_store`.`size` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
    ENGINE = InnoDB
    AUTO_INCREMENT = 34
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `internet_store`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internet_store`.`users` (
                                                        `ID` INT NOT NULL AUTO_INCREMENT,
                                                        `login` VARCHAR(45) NOT NULL,
    `password` VARCHAR(45) NOT NULL,
    `role` ENUM('Admin', 'User') NOT NULL DEFAULT 'User',
    `status` ENUM('Blocked', 'Unblocked') NOT NULL DEFAULT 'Unblocked',
    PRIMARY KEY (`ID`),
    UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE)
    ENGINE = InnoDB
    AUTO_INCREMENT = 19
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `internet_store`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `internet_store`.`orders` (
                                                         `ID` INT NOT NULL AUTO_INCREMENT,
                                                         `user_ID` INT NOT NULL,
                                                         `product_ID` INT NOT NULL,
                                                         `status` ENUM('Unregistered', 'Registered', 'Paid', 'Canceled') NOT NULL DEFAULT 'Unregistered',
    `quantity` INT NOT NULL,
    PRIMARY KEY (`ID`, `user_ID`, `product_ID`),
    UNIQUE INDEX `id_UNIQUE` (`ID` ASC) VISIBLE,
    INDEX `fk_Orders_Goods1_idx` (`product_ID` ASC) VISIBLE,
    INDEX `fk_Orders_Users1` (`user_ID` ASC) VISIBLE,
    CONSTRAINT `fk_Orders_Goods1`
    FOREIGN KEY (`product_ID`)
    REFERENCES `internet_store`.`products` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT `fk_Orders_Users1`
    FOREIGN KEY (`user_ID`)
    REFERENCES `internet_store`.`users` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
    ENGINE = InnoDB
    AUTO_INCREMENT = 153
    DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
