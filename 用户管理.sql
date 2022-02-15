-- Mysql用户的管理
-- 原因：当我们做项目开发时，可以根据不同的开发人员，赋给他相应的Mysql操作权限
-- 所以，Mysql数据库管理人员（root），根据需要创建不同的用户，赋给相应的权限，供开发人员使用

-- 1. 创建新的用户
-- 解读（1） 'hsp_edu'@'localhost' 表示用户的完整信息 'hsp_edu' 用户名 'localhost'
-- (2) 12345 密码，但是注意 存放到mysql.user表时，是pasword('123456')加密后的密码
CREATE USER 'hsp_edu'@'localhost' IDENTIFIED BY '123456'

SELECT PASSWORD('123456');

SELECT `host`, `user`, authentication_string
	FROM mysql.`user`;

-- 2. 删除用户: 用户名+登录地址
DROP USER 'hsp_edu'@'localhost'

-- 3. 登录


