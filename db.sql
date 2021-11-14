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
INSERT INTO test(title,description,image_url) VALUES('김도희','설명','경로');
INSERT INTO test(title,description,image_url) VALUES('김세은','설명','경로');
INSERT INTO test(title,description,image_url) VALUES('김연수','설명','경로');
INSERT INTO test(title,description,image_url) VALUES('유윤지','설명','경로');
INSERT INTO test(title,description,image_url) VALUES('이소현','설명','경로');
INSERT INTO test(title,description,image_url) VALUES('황세현','설명','경로');
INSERT INTO test(title,description,image_url) VALUES('이건아','설명','경로');

CREATE TABLE user(
                     `oid` INT(10) NOT NULL AUTO_INCREMENT,
                     `id` VARCHAR(20) NOT NULL,
                     `password` VARCHAR (100) NOT NULL,
                     `name` VARCHAR (20) NOT NULL,
                     `birthday` DATE,
                     `email` VARCHAR (50),
                     `gender` VARCHAR (5),
                     `phone` VARCHAR (20),
                     `type` VARCHAR (10) NOT NULL,
                     `image_url` VARCHAR (50),
                     `home` VARCHAR (100),
                     `register` DATE DEFAULT NULL,
                     `lastlogin` DATE DEFAULT NULL,
                     PRIMARY KEY (`oid`)
);
INSERT INTO user(oid, id, password, name, birthday, email, gender, phone, type, image_url, home) VALUES(0, 'admin', 'd82494f05d6917ba02f7aaa29689ccb444bb73f20380876cb05d1f37537b7892','관리자','2021-11-10','admin@email.com','무','010-0000-0000','전체관리자', '', '');
CREATE TABLE type (
                     `name` VARCHAR (10) NOT NULL,
                     `level` INT(2) NOT NULL
);

INSERT INTO type(name, level) VALUES('전체관리자', 0);
INSERT INTO type(name, level) VALUES('홈페이지관리자', 1);
INSERT INTO type(name, level) VALUES('스태프', 2);
INSERT INTO type(name, level) VALUES('우수회원', 3);
INSERT INTO type(name, level) VALUES('일반회원', 3);
INSERT INTO type(name, level) VALUES('미승인회원', 4);

CREATE TABLE team (
                      `oid` INT(10) NOT NULL AUTO_INCREMENT,
                      `name` VARCHAR(20) NOT NULL,
                      `group_name` VARCHAR (100) NOT NULL,
                      `image_url` VARCHAR (100) DEFAULT '#',
                      `description` VARCHAR(200) DEFAULT '#',
                      `instagram` VARCHAR (100) DEFAULT '#',
                      `blog` VARCHAR (100) DEFAULT '#',
                      `github` VARCHAR (100) DEFAULT '#',
                            PRIMARY KEY (`oid`)
);


INSERT INTO team(oid, name, group_name, image_url, description, instagram, blog, github) VALUES(0, '윤주현', '전체','','','','','');
INSERT INTO team(name, group_name, image_url, description, instagram, blog, github) VALUES('이소현', '비대면','','','','','');
INSERT INTO team(name, group_name, image_url, description, instagram, blog, github) VALUES('황세현', '비대면','','','','','');
INSERT INTO team(name, group_name, image_url, description, instagram, blog, github) VALUES('이건아', '일요일 토요일','','','','','');
INSERT INTO team(name, group_name, image_url, description, instagram, blog, github) VALUES('김연수', '일요일 수요일','','','','','');
INSERT INTO team(name, group_name, image_url, description, instagram, blog, github) VALUES('김도희', '일요일','','','','','');
INSERT INTO team(name, group_name, image_url, description, instagram, blog, github) VALUES('박소영', '일요일','','','','','');
INSERT INTO team(name, group_name, image_url, description, instagram, blog, github) VALUES('김세은', '일요일','','','','','');
INSERT INTO team(name, group_name, image_url, description, instagram, blog, github) VALUES('박선애', '수요일','','','','','');
INSERT INTO team(name, group_name, image_url, description, instagram, blog, github) VALUES('한상범', '수요일','','','','','');
INSERT INTO team(name, group_name, image_url, description, instagram, blog, github) VALUES('김가영', '수요일','','','','','');
INSERT INTO team(name, group_name, image_url, description, instagram, blog, github) VALUES('남진수', '수요일','','','','','');
INSERT INTO team(name, group_name, image_url, description, instagram, blog, github) VALUES('유윤지', '토요일','','','','','');
INSERT INTO team(name, group_name, image_url, description, instagram, blog, github) VALUES('함현준', '토요일','','','','','');

CREATE TABLE bbs (
                     `id` INT(10) NOT NULL AUTO_INCREMENT,
                     `writer_id` VARCHAR(100) NOT NULL,
                     `writer_name` VARCHAR(100) NOT NULL,
                     `title` VARCHAR(100) NOT NULL,
                     `content` TEXT NOT NULL,
                     `view` INT(10) DEFAULT 0,
                     `date` DATETIME NOT NULL,
                     `category` VARCHAR(100) NOT NULL,
                     `level` INT(10) DEFAULT 0,
                     PRIMARY KEY (`id`)
);

INSERT INTO bbs(writer_id, writer_name, title, content, date, category)VALUES(1,'김도희', '제목1', '내용1', '2021-11-10', '카테고리1');

CREATE TABLE information (
                             `id` INT(10) NOT NULL,
                             `content` TEXT NOT NULL,
                             PRIMARY KEY (`id`)
);
INSERT INTO information(id, content) VALUE(10, 'test10');
INSERT INTO information(id, content) VALUE(11, 'test11');
INSERT INTO information(id, content) VALUE(12, 'test12');
INSERT INTO information(id, content) VALUE(13, 'test13');