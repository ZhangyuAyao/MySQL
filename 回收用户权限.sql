-- 演示 用户权限管理
CREATE USER 'shunping'@'localhost' IDENTIFIED BY '123'

CREATE DATABASE testdb
CREATE TABLE news(
	id INT,
	content VARCHAR(32));

-- 添加一条测试数据
INSERT INTO news VALUES(100, '北京新闻');
SELECT * FROM news;

-- 给 shunping 分配查看 news 表和添加 news 的权限
GRANT SELECT, INSERT 
	ON testdb.news
	TO 'shunping'@'localhost'
	
SET PASSWORD FOR 'shunping'@'localhost' = PASSWORD('abc');

-- 回收 shunping 用户在 testdb.news 表的所有权限
REVOKE SELECT, UPDATE, INSERT ON testdb.news FROM 'shunping'@'localhost';
REVOKE ALL ON testdb.news FROM 'shunping'@'localhost';

-- 删除 shunping
DROP USER 'shunping'@'localhost'