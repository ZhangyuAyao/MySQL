-- 直接create user jack 代表 host 为 %，也就是所有的ip地址都能够连接上来
CREATE USER jack

SELECT `host`, `user` FROM mysql.user

-- 你也可以这样指定
-- create user 'xxx'@'192.168.1.%', 表示 xxx用户在192.168.1.*的ip可以登录mysql

CREATE USER 'smith'@'192.168.1.%'

-- 在删除用户的时候，如果 host 不是 %， 需要明确指定 '用户'@’host值'

DROP USER jack -- 默认就是 DROP USER 'jack'@'%'

DROP USER 'smith'@'192.168.1.%' 