#!/bin/sh

service mysql start 

mysql --user=root <<EOS
-- set root password
UPDATE mysql.user SET Password=PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE User='root';
-- delete anonymous users
DELETE FROM mysql.user WHERE User='';
-- delete remote root capabilities
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
-- drop database 'test'
DROP DATABASE IF EXISTS test;
-- also make sure there are lingering permissions to it
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';

CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MSQL_ROOT_PASSWORD}';
-- make changes immediately
FLUSH PRIVILEGES;
EOS

service mysqld stop

exec mysqld_safe
