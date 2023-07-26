#!/bin/sh

if [ -f ./wordpress/wp-config.php ]
then
    echo "wordpress already exists"
else
    wget https://wordpress.org/latest.tar.gz -P /var/www
    cd /var/www
    tar -xzvf latest.tar.gz 
    rm -rf latest.tar.gz
    rm -rf /etc/php/7.3/fpm/pool.d/www.conf

    cd /html/wordpress
    sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php