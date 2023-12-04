#!/bin/bash
#set -eux

if [ ! -d /run/php ]; then
	mkdir /run/php;
fi

#cd /var/www/html/wordpress

if ! wp core is-installed --allow-root; then

	wp config create --allow-root \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASSWORD \
		--dbhost=$DB_HOST \
		--path='/var/www/html/wordpress';
		#--url=https://$DOMAIN_NAME;

	wp core install	--allow-root \
		--url=https://$DOMAIN_NAME \
		--title=$SITE_TITLE \
		--admin_user=$ADMIN_USER \
		--admin_password=$ADMIN_PASSWORD \
		--admin_email=$ADMIN_EMAIL;

	wp user create --allow-root \
		$USER_LOGIN $USER_MAIL \
		--user_pass=$USER_PASSWORD 

	wp cache flush --allow-root

fi

exec /usr/sbin/php-fpm7.4 -F -R
