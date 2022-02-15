-- 增强group by的使用
-- (1)显示每种岗位的雇员总数、平均工资
SELECT COUNT(*), AVG(sal), job 
	FROM emp
	GROUP BY job;
-- (2) 显示雇员总数，以及获得补助的雇员数
-- 思路：获得补助的雇员数 就是 comm 列为非null，就是count（列），如果该列的
-- 值为null，是不会统计,SQL 非常灵活，需要我们动脑筋
SELECT COUNT(*), COUNT(comm)
	FROM emp

-- 老师的扩展要求：统计没有获得补助的雇员数
SELECT COUNT(*), COUNT(IF(comm IS NULL, 1, NULL))
	FROM emp
-- 上面的IF(comm IS NULL, 1, NULL)返回的就是一列
-- select IF(comm IS NULL, 1, NULL) from emp
SELECT COUNT(*), COUNT(*) - COUNT(comm)
	FROM emp
	
-- (3) 显示管理者的总人数，去重使用distinct
SELECT COUNT(DISTINCT mgr)
	FROM emp;
	
-- （4）显示雇员工资的最大差额
-- 思路：max(sal) - min(sal)
SELECT MAX(sal) - MIN(sal)
	FROM emp;

-- 小技巧：尝试写->修改->尝试[慢慢就可以找到正确的写法]


-- 应用案例：请统计各个部门的平均工资，
-- 并且是大于1000的，并且按照平均工资 从高到低排序
-- 取出前两行记录 limit 0, 2
SELECT deptno, AVG(sal) AS avg_sal
	FROM emp
	GROUP BY deptno
	HAVING avg_sal > 1000
	ORDER BY avg_sal DESC
	LIMIT 0, 2
	