CREATE USER 'zhangyu01'@'localhost' IDENTIFIED BY '123';

CREATE DATABASE testdb02;

USE testdb02;

CREATE TABLE news(
	id INT,
	content VARCHAR(32));

GRANT SELECT, INSERT ON testdb02.news TO 'zhangyu01'@'localhost';

SET PASSWORD FOR 'zhangyu01'@'localhost' = PASSWORD('abc');

DROP USER 'zhangyu01'@'localhost'

SET PASSWORD = PASSWORD('hsp');