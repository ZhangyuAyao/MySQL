-- 创建测试数据库 temp
-- 创建(列)索引，能够提高数据库的性能，加快查询速度
-- 在创建索引前，文件大小是 524m，创建索引后为655m，占用的空间不小
CREATE INDEX empno_index ON emp(empno)

SELECT * 
	FROM emp
	WHERE empno =1234578 -- 0.003s 原来是4.5s

-- 创建索引后，只对创建了索引的列有效
SELECT * 
	FROM emp
	WHERE ename = 'axJxCo' -- 没有在ename创建索引时，时间4.7s
	
CREATE INDEX ename_index ON emp(ename)  -- 创建索引后，速度变快
