-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS swe_hotel DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema swe_hotel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema swe_hotel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS swe_hotel DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE swe_hotel ;

-- -----------------------------------------------------
-- Table swe_hotel.User
-- -----------------------------------------------------
DROP TABLE IF EXISTS swe_hotel.User ;

CREATE TABLE IF NOT EXISTS swe_hotel.User (
  email VARCHAR(45) NOT NULL,
  first_name VARCHAR(45) NULL DEFAULT NULL,
  last_name VARCHAR(45) NULL DEFAULT NULL,
  password VARCHAR(45) NULL DEFAULT NULL,
  date_of_birth VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (email))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table mydb.Hotel
-- -----------------------------------------------------
DROP TABLE IF EXISTS swe_hotel.Hotel ;

CREATE TABLE IF NOT EXISTS swe_hotel.Hotel (
  Hotel_id INT NOT NULL,
  City VARCHAR(45) NULL,
  Hotel_name VARCHAR(45) NULL,
  PRIMARY KEY (Hotel_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.Room
-- -----------------------------------------------------
DROP TABLE IF EXISTS swe_hotel.Room ;

CREATE TABLE IF NOT EXISTS swe_hotel.Room (
  Room_id INT NOT NULL,
  Hotel_Hotel_id INT NOT NULL,
  Room_type VARCHAR(45) NULL,
  Capacity INT NULL,
  Price DOUBLE NULL,
  beds INT NULL,
  PRIMARY KEY (Room_id, Hotel_Hotel_id),
  INDEX fk_Room_Hotel1_idx (Hotel_Hotel_id ASC) VISIBLE,
  CONSTRAINT fk_Room_Hotel1
    FOREIGN KEY (Hotel_Hotel_id)
    REFERENCES swe_hotel.Hotel (Hotel_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.Booking
-- -----------------------------------------------------
DROP TABLE IF EXISTS swe_hotel.Booking ;

CREATE TABLE IF NOT EXISTS mydb.Booking (
  Booking_id INT NOT NULL,
  User_email VARCHAR(45) NOT NULL,
  City VARCHAR(45) NULL,
  Check-in DATE NULL,
  Check-out DATE NULL,
  Guests INT NULL,
  Finished TINYINT NULL,
  Room_Room_id INT NOT NULL,
  Room_Hotel_Hotel_id INT NOT NULL,
  Total_cost DOUBLE NULL,
  PRIMARY KEY (Booking_id, User_email, Room_Room_id, Room_Hotel_Hotel_id),
  INDEX fk_Booking_User_idx (User_email ASC) VISIBLE,
  INDEX fk_Booking_Room1_idx (Room_Room_id ASC, Room_Hotel_Hotel_id ASC) VISIBLE,
  CONSTRAINT fk_Booking_User
    FOREIGN KEY (User_email)
    REFERENCES swe_hotel.User (email)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Booking_Room1
    FOREIGN KEY (Room_Room_id , Room_Hotel_Hotel_id)
    REFERENCES swe_hotel.Room (Room_id , Hotel_Hotel_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE swe_hotel ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;