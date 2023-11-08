#!/bin/bash

service mysql start;

# log into MariaDB as root and create database and the user
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "SELECT user,host FROM mysql.user;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY \`${MYSQL_ROOT_PASSWORD}\`';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
#mysql -e "SHOW DATABASES;"
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown
exec mysql_safe
#kill $(cat /var/run/mysqld/mysqld.pid)
#mysqld
mysql -e "SHOW DATABASES;"

#print status
echo "MariaDB database and user were created successfully!"
