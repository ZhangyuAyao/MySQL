-- class
-- student
-- department

DROP TABLE STUDENT,CLASS,DEPARTMENT

	
CREATE TABLE DEPARTMENT(
	departmentid VARCHAR(32) PRIMARY KEY,
	deptname VARCHAR(32) UNIQUE NOT NULL);
	
CREATE TABLE CLASS (
	classid INT PRIMARY KEY,
	`subject` VARCHAR(32) NOT NULL DEFAULT '',
	`deptname` VARCHAR(32),
	enrolltime INT NOT NULL DEFAULT 2000,
	num INT NOT NULL DEFAULT 0,
	FOREIGN KEY (`deptname`) REFERENCES DEPARTMENT(deptname));

CREATE TABLE STUDENT (
	studentid INT PRIMARY KEY,
	`name` VARCHAR(16) NOT NULL DEFAULT '',
	age INT NOT NULL DEFAULT 0,
	classid INT, 
	FOREIGN KEY (classid) REFERENCES CLASS(classid));
	

	

INSERT INTO DEPARTMENT VALUES('001', '数学');
INSERT INTO DEPARTMENT VALUES('002', '计算机');
INSERT INTO DEPARTMENT VALUES('003', '化学');
INSERT INTO DEPARTMENT VALUES('004', '中文');
INSERT INTO DEPARTMENT VALUES('005', '经济');


	
INSERT INTO CLASS VALUES(101, '软件', '计算机', '1995', 20);
INSERT INTO CLASS VALUES(102, '微电子', '计算机', '1996', 30);
INSERT INTO CLASS VALUES(111, '无机化学', '化学', '1995', 29);
INSERT INTO CLASS VALUES(112, '高分子化学', '化学', '1996', 25);
INSERT INTO CLASS VALUES(121, '统计数学', '数学', '1995', 20);
INSERT INTO CLASS VALUES(131, '现代语言', '中文', '1996', 20);
INSERT INTO CLASS VALUES(141, '国际贸易', '经济', '1997', 30);
INSERT INTO CLASS VALUES(142, '国际金融', '经济', '1996', 14);

INSERT INTO STUDENT VALUES(8101, '张三', 18, 101);
INSERT INTO STUDENT VALUES(8102, '钱四', 16, 121);
INSERT INTO STUDENT VALUES(8103, '王玲', 17, 131);
INSERT INTO STUDENT VALUES(8105, '李飞', 19, 102);
INSERT INTO STUDENT VALUES(8109, '赵四', 18, 141);
INSERT INTO STUDENT VALUES(8110, '李可', 20, 142);
INSERT INTO STUDENT VALUES(8201, '张飞', 18, 111);
INSERT INTO STUDENT VALUES(8302, '周瑜', 16, 112);
INSERT INTO STUDENT VALUES(8203, '王亮', 17, 111);
INSERT INTO STUDENT VALUES(8305, '董庆', 19, 102);
INSERT INTO STUDENT VALUES(8409, '赵龙', 18, 101);

SELECT * FROM STUDENT
SELECT * FROM DEPARTMENT
SELECT * FROM CLASS

DESC class
DESC student
DESC department

-- 1.找出所有姓李的学生 
SELECT * FROM STUDENT 
	WHERE `name` LIKE '李%'
-- 2. 列出所有开设超过1个专业的系的名字
SELECT deptname, COUNT(*) AS num FROM class
	GROUP BY deptname
	HAVING num > 1
-- 3. 列出人数大于等于30的系的编号和名字
-- (1)先查出各个系有多少人

SELECT deptname, SUM(num) AS nums FROM class
	GROUP BY deptname
	HAVING nums > 30
-- (2)将上面的结果看成一个临时表 和 department 联合查询即可
SELECT temp.*, department.`departmentid`
	FROM department, (
		SELECT deptname, SUM(num) AS nums FROM class
		GROUP BY deptname
		HAVING nums > 30 ) temp
	WHERE department.`deptname` = temp.deptname
-- 4. 学校又新增加了一个物理系，编号006
INSERT INTO department VALUES('006', '物理系');

-- 5. 学生张三退学，请更新相关的表
-- （1）张三所在班级的人数-1 （2）将张三从学生表中删除 （3）需要使用事务
START TRANSACTION;
UPDATE class SET num = num + 1
	WHERE classid = (
		SELECT classid FROM student
		WHERE `name` = '张三'
		);

DELETE FROM student
	WHERE `name` = '张三';

COMMIT;
SELECT * FROM student
SELECT * FROM CLASS



