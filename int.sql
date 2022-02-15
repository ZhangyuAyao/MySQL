#演示整型
#老韩使用 tinyint 来演示范围 有符号 -128~127 如果没有符号 0~255
#说明：表的字符集，校验规则，存储引擎，老师使用默认
#1. 如果没有指定 unsinged， 则 TINYINT 就是有符号
#2. 如果指定unsigned，则TINYINT就是无符号 0~255
CREATE TABLE t3 (
	id TINYINT);
	
CREATE TABLE t4 (
	id TINYINT UNSIGNED);
	
INSERT INTO t3 VALUES(127);#这是非常简单的添加语句，输入-129、128就报错

SELECT * FROM t3

INSERT INTO t4 VALUES(255);#输入-1，256就报错
SELECT * FROM t4