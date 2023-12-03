#!/bin/bash

service mariadb start;

if [ -d "/var/lib/mysql/${DB_NAME}" ]
then

	echo "Database already exists"
#	mariadb -uroot -p${DB_ROOT_PASSWORD} -e "SHOW DATABASES;"

else

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

mariadb -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"

mariadb -e "SELECT user,host FROM mariadb.user;"

mariadb -e "GRANT ALL PRIVILEGES ON *.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"

mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY \`${DB_ROOT_PASSWORD}\`';"

mariadb -u root -p${DB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

echo "MariaDB database and user were created successfully!"

fi

mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown

exec mysqld_safe
