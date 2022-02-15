-- 讨论 事务细节
-- 1. 如果不开始事务，默认情况下，dml操作时自动提交的，不能回滚
INSERT INTO t27 VALUES(300, 'milan'); -- 自动提交commit

SELECT * FROM t27;

-- 2。 如果开始一个事务，你没有创建保存点，你可以执行 rollback
-- 默认就是回退到你事务开始的状态
START TRANSACTION;
INSERT INTO t27 VALUES(400, 'king');
INSERT INTO t27 VALUES(500, 'scott');
ROLLBACK -- 表示直接回退到事务开始的状态

-- 3. 你也可以在这个事务中（没有提交前），创建多个保存点

-- 4. 你可以在事务没有提交前，选择回退到哪个保存点

-- 5. InnoDB 存储引擎支持事务，MyISAM 不支持

-- 6. 开始一个事物 start transaction 或 set autocommit=off