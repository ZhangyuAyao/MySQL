#演示字符串类型的使用细节
#char(4) 和 varchar(4) 这个4表示的是字符，而不是字节

CREATE TABLE t11(
	`name` CHAR(4)); #name这里是反引号
INSERT INTO t11 VALUES('韩顺平好'); #字符这里是单引号
SELECT * FROM t11;

CREATE TABLE t12(
	`name` VARCHAR(4));
INSERT INTO t12 VALUES('韩顺平好');
INSERT INTO t12 VALUES('ab北京');
SELECT * FROM t12;