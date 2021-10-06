DROP DATABASE if EXISTS avocado ;
CREATE DATABASE avocado DEFAULT CHARACTER SET utf8mb4;
USE avocado ;
CREATE TABLE test(
    `oid` INT(10) NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(100) DEFAULT NULL,
    `description` VARCHAR (100) DEFAULT NULL,
    `image_url` VARCHAR (100) DEFAULT NULL,
    PRIMARY KEY (`oid`)
);

INSERT INTO test(oid,title,description,image_url) VALUES(1,'제목','설명','경로');