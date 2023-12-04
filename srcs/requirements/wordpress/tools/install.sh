#!/bin/bash
#set -eux

sleep 10

if [ ! -d "/run/php" ]; then
	mkdir /run/php;
fi

echo "Checking for wordpress installation..."
# Download wordpress if isn't already done
if [ ! -f "wp-config-sample.php" ]; then
	echo "=> Downloading wordpress..."
	wp core download --allow-root;
	echo "=> Done!"
fi

echo "Checking for wordpress configuration..."

if [ ! -f "wp-config.php" ]; then
	
	echo "=> Create config file..."
	wp config create --allow-root \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASSWORD \
		--dbhost=$DB_HOST \
		--path='/var/www/html/'

	echo "Wordpress config file installed"

	echo "=> Installing wordpress..."
	wp core install	--allow-root \
		--url=$DOMAIN_NAME \
		--title=$SITE_TITLE \
		--admin_user=$ADMIN_USER \
		--admin_password=$ADMIN_PASSWORD \
		--admin_email=$ADMIN_EMAIL;
	echo "Wordpress installed"

	echo "creating user..."
	wp user create --allow-root $USER_LOGIN $USER_EMAIL\
		--user_pass=$USER_PASSWORD;
	echo "user created"
	
	wp cache flush --allow-root;

fi

exec /usr/sbin/php-fpm7.4 -F -R
