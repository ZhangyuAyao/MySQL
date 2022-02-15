CREATE TABLE dept(/*部门表*/
deptno MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
dname VARCHAR(20) NOT NULL DEFAULT "",
loo VARCHAR(13) NOT NULL DEFAULT ""
);

INSERT INTO dept VALUES(10, 'ACCOUNTING', 'NEW YORK'), 
			(20, 'RESEARCH', 'DALLAS'), 
			(30, 'SALES', 'CHICAGO'),
			(40, 'OPERATIONS', 'BOSTON');

SELECT * FROM dept

DROP TABLE emp
-- 员工表
CREATE TABLE emp(
	empno MEDIUMINT UNSIGNED NOT NULL DEFAULT 0, -- 编号
	ename VARCHAR(20) NOT NULL DEFAULT "", -- 名字
	job VARCHAR(9) NOT NULL DEFAULT "", -- 工作
	mgr MEDIUMINT UNSIGNED, -- 上级编号
	hiredate DATE NOT NULL, -- 入职时间
	sal DECIMAL(7, 2) NOT NULL, -- 薪水
	comm DECIMAL(7, 2), -- 红利
	deptno MEDIUMINT UNSIGNED NOT NULL DEFAULT 0 -- 部门编号
	);
-- 添加测试数据
INSERT INTO emp VALUES(7369, 'SMITH', 'CLERK', 7698, '1991-12-17', 800.00, NULL, 20);
INSERT INTO emp VALUES(7499, 'ALLEN', 'SALEMEN', 7698, '1992-12-17', 1800.00, 300, 30);
INSERT INTO emp VALUES(7521, 'WARD', 'SALEMEN', 7469, '1993-12-17', 1800.00, 500, 30);
INSERT INTO emp VALUES(7566, 'JONES', 'CLERK', 7469, '1994-12-17', 1800.00, NULL, 20);
INSERT INTO emp VALUES(7654, 'MARTIN', 'SALEMEN', 7469, '1990-11-17', 2800.00, NULL, 30);
INSERT INTO emp VALUES(7698, 'BLAKE', 'MANAGER', 7469, '1990-10-17', 900.00, 1400, 30);
INSERT INTO emp VALUES(7782, 'CLARK', 'ANALYST', 7469, '1990-9-17', 700.00, NULL, 10);
INSERT INTO emp VALUES(7123, 'SCOTT', 'CLERK', 7469, '1990-12-17', 1100.00, NULL, 20);
INSERT INTO emp VALUES(7124, 'KING', 'MANAGER', 7469, '1990-6-17', 8100.00, NULL, 20);
INSERT INTO emp VALUES(7890, 'TURNER', 'CLERK', 7124, '1990-5-17', 8600.00, NULL, 30);
INSERT INTO emp VALUES(7469, 'JAMES', 'MANAGER', 7124, '1990-12-2', 2800.00, NULL, 30);
INSERT INTO emp VALUES(7399, 'FORD', 'ANALYST', 7124, '1994-12-17', 3800.00, NULL, 20);
INSERT INTO emp VALUES(7329, 'MILLER', 'ANALYST', 7469, '1990-12-1', 800.00, NULL, 10);

-- 工资级别
# 工资级别表
CREATE TABLE salgrade(
grade MEDIUMINT UNSIGNED NOT NULL DEFAULT 0, -- 工资级别
losal DECIMAL(17,2) NOT NULL, -- 该级别的最低工资
hisal DECIMAL(17,2) NOT NULL-- 该级别的最高工资
);

INSERT INTO salgrade VALUES (1,700,1200);
INSERT INTO salgrade VALUES (2,1201,1400);
INSERT INTO salgrade VALUES (3,1401,2000);
INSERT INTO salgrade VALUES (4,2001,3000);
INSERT INTO salgrade VALUES (5,3001,9999);

SELECT * FROM salgrade

# 演示group by + having
# group by 用于对查询的结果分组统计
# having 子句用于限制分组显示结果.
# 如何显示每个部门的平均工资和最高工资
-- 老韩分析：avg(sal) max(sal)
-- 按照部门来分组查询
SELECT AVG(sal), MAX(sal), deptno
	FROM emp GROUP BY deptno;

-- 显示每个部门的每种岗位的平均工资和最低工资
-- 老师分析 1. 显示每个部门的平均工资和最低工资
-- 	     2. 显示每个部门每种岗位的平均工资和最低工资
SELECT AVG(sal), MIN(sal), deptno, job
	FROM emp GROUP BY deptno, job;

-- 显示平均工资低于2000的部门号和它的平均工资 // 别名
-- 老师分析：[写sql语句的思路是化繁为简，各个击破]
-- 1. 显示各个部门的平均工资和部门号
-- 2. 在1的结果基础上，进行过滤，保留 AVG
-- 3. 使用别名进行过滤

SELECT AVG(sal), deptno
	FROM emp GROUP BY deptno
		HAVING AVG(sal) < 2000;
-- 使用别名
SELECT AVG(sal) AS avg_sal, deptno
	FROM emp GROUP BY deptno
		HAVING avg_sal < 2000;
