# 演示流程控制语句

# IF(expr1, expr2,expr3) 如果 expr1 为True，则返回 expr2 否则返回 expr3
SELECT IF(TRUE, '北京', '上海') FROM DUAL;
# IFNULL(expr1, expr2)  如果expr1不为空NULL，则返回 expr1，否则返回expr2
SELECT IFNULL('jack', '韩顺平教育') FROM DUAL;
# 

-- 类似java的case语句
SELECT CASE 
	WHEN TRUE THEN 'jack' -- jack
	WHEN FALSE THEN 'tom' -- 
	ELSE 'mary' END
	
-- 1. 查询emp表， 如果 comm 是null， 则显示0.0
-- 老师说明，判断是否为空，要使用is null， 判断不为空 使用is not null
SELECT ename, IF(comm IS NULL, 0.0, comm)
	FROM emp;
	
select ename, ifnull(comm, 0.0)
	from empl
	
-- 2. 如果emp 表的 job 是 CLERK 则显示 职员，如果是 MANAGER 则显示经理
-- 	如果是 SALESMAN 则显示销售人员，其它正常显示

select ename, (SELECT CASE 
		WHEN job = 'CLERK' THEN '职员'
		WHEN job = 'MANAGER' THEN '经理'
		when job = 'SALEMEN' then '销售人员'
		ELSE job END) as 'job'
	from emp
	
select * from emp;
SELECT * FROM deptno;
SELECT * FROM emp;