#!/bin/sh

service mysql start 

mysql --user=root <<EOS
UPDATE mysql.user SET Password=PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE User='root';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOS

echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql
echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql
echo "FLUSH PRIVILEGES;" | mysql
echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" | mysql
#echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MSQL_ROOT_PASSWORD}';" | mysql 
#service mysql stop

#exec "$@"
