#!/bin/bash

service mysql start;

if [ -d "/var/lib/mysql/${DB_NAME}" ]
then

	echo "Database already exists"
#	mysql -uroot -p${DB_ROOT_PASSWORD} -e "SHOW DATABASES;"

else

mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"

mysql -e "SELECT user,host FROM mysql.user;"

mysql -e "GRANT ALL PRIVILEGES ON *.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY \`${DB_ROOT_PASSWORD}\`';"

mysql -u root -p${DB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

echo "MariaDB database and user were created successfully!"

fi

mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown

exec "$@"
