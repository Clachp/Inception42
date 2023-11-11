#!/bin/sh

CORE_DIR=${1-'wpdir'}
DB_NAME=${2-'wordpress'}
DB_USER=${3-'root'}
DB_PASS=${4-'password'}

SITE_URL=${5-'https://www.elle.fr'}
SITE_TITLE=${6-'WordPress Site in a Subdirectory'}
SITE_USER=${7-'admin'}
SITE_PASS=${8-'password'}
SITE_EMAIL=${9-'your@email.com'}

#cd /var/www/wordpress

if [ -f ./wordpress/wp-config.php ]
then
    echo "wordpress already exists"
else

# install wordpress
wp core download

# create the wp-config.php file
wp config create --allow-root \
    --dbname=$MYSQL_DATABASE \
    --dbuser=$MYSQL_USER \
    --dbpass=$MYSQL_PASSWORD \
    --dbhost='localhost' \
    --url=http://$SITE_URL;

wp db create

# install WordPress (less than 5 mins)
wp core install --allow-root \
    --url=$SITE_URL \
    --title="$SITE_TITLE" \
    --admin_user=$SITE_USER \
    --admin_password=$SITE_PASS \
    --admin_email=$SITE_EMAIL;

# add second user TODO
wp user create --allow-root \
# wp user create
echo 'core install done'

echo 'Install finished!'

fi

exec "$@"
