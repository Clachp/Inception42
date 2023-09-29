#!/bin/sh

if [ -f ./wordpress/wp-config.php ]
then
    echo "wordpress already exists"
else

	wp core download --allow-root

	# create the wp-config.php file
	wp config create --dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=localhost --allow-root

	# install WordPress (less than 5 mins)
	wp core install --allow-root --url=cchapon.42.fr \
		--title=Inception \
		--admin_user=blabla\
		--admin_password=blabla \
		--admin_email=blablabla

	echo 'core install done'

	echo 'Install finished!'

fi

exec "$@"
