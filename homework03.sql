-- 13
SELECT * FROM 
	emp
	WHERE ename NOT LIKE '%R%'

HELP CONTAINS

-- 14
SELECT SUBSTRING(ename, 1, 3)
	FROM emp
SELECT LEFT(ename, 3)
	FROM emp

-- 15
-- 思路：1. 显示所有员工姓名
--	2. 取得带有 a 的字符
--	3. 将 a 转化为 A
SELECT * FROM emp

SELECT REPLACE(ename, 'A', 'a')
	FROM emp
-- 16
SELECT ename, hiredate FROM 
	emp
	WHERE DATE_ADD(hiredate, INTERVAL 10 YEAR) <= NOW()
	
-- 17
SELECT * FROM 
	emp 
	ORDER BY ename
	
-- 18
SELECT ename, hiredate 
	FROM emp
	ORDER BY hiredate ASC

-- 19
-- 1. 按工作降序排序
-- 2. 工作相同，则按照薪金排序
SELECT ename, job, sal 
	FROM emp
	ORDER BY job DESC, sal
	
-- 20
SELECT ename, YEAR(hiredate), MONTH(hiredate)
	FROM emp
	ORDER BY MONTH(hiredate), YEAR(hiredate) DESC
	
-- 21
SELECT ename, FLOOR(sal/30) AS '日薪金'
	FROM emp

-- 22
SELECT ename, hiredate
	FROM emp
	WHERE MONTH(hiredate) = 2
	
-- 23
SELECT ename, DATEDIFF(NOW(), hiredate) AS '加入公司的天数'
	FROM emp
	
-- 24
SELECT *
	FROM emp
	WHERE ename LIKE '%A%'

-- 25 以年月日的方式显示所有员工的服务年限
-- （这里年月日不是总和，也就是说不是总计有几个月，而是在算出年后，还剩下几个月）
SELECT FLOOR(DATEDIFF(NOW(), hiredate) / 365) AS '工作年', 
	FLOOR(DATEDIFF(NOW(), hiredate) % 365 / 31) AS '工作月', 
	FLOOR(DATEDIFF(NOW(), hiredate) % 31)  AS 'day' 
	FROM emp
