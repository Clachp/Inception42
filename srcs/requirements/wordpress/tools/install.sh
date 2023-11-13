#!/bin/bash

sleep 10

if [ -d "wordpress"]; then
	echo "wordpress already exists"
else
	echo "creating wordpress folder"
	mkdir -p wordpress
	cd wordpress

	wp core download --allow-root

	wp config create --allow-root \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASSWORD \
		--dbhost=$DB_HOST \

	wp core install	--allow-root \
		--url=$DOMAIN_NAME \
		--title=$SITE_TITLE \
		--admin_user=$ADMIN_USER \
		--admin_password=$ADMIN_PASSWORD \
		--admin_email=$ADMIN_EMAIL;

	wp user create --allow-root $USER_LOGIN $USER_MAIL\
		--role=editor \
		--user_pass=$USER_PASSWORD;

	wp cache flush --allow-root

# it provides an easy-to-use interface for creating custom contact forms and managing submissions, as well as supporting various anti-spam techniques
#wp plugin install contact-form-7 --activate

# set the site language to English
#wp language core install en_US --activate

fi
