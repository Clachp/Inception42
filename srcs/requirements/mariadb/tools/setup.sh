#!/bin/bash
#set -eux

service mariadb start;

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

mariadb -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"

mariadb -e "GRANT ALL PRIVILEGES ON *.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"

mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY \`${DB_ROOT_PASSWORD}\`';"

mariadb -u root -p${DB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown

exec mysqld_safe

echo "MariaDB database and user were created successfully!"
