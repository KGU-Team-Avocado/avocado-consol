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

INSERT INTO test(oid,title,description,image_url) VALUES(1,'윤주현','설명1','test/윤주현.png');
INSERT INTO test(title,description,image_url) VALUES('남진수','설명2','경로');
INSERT INTO test(title,description,image_url) VALUES('한상범','설3명','경로');
INSERT INTO test(title,description,image_url) VALUES('함현준','설명4','경로');
INSERT INTO test(title,description,image_url) VALUES('김가영','설명5','경로');
INSERT INTO test(title,description,image_url) VALUES('박선애','설6명','경로');
INSERT INTO test(title,description,image_url) VALUES('박소영','설7명','경로');


