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

sleep 10

#cd /var/www/wordpress

if [ -f ./wordpress/wp-config.php ]
then
    echo "wordpress already exists"
else

# Installation:

## Download the script to your home directory
# Make sure it has execute permissions (`chmod +x wp-install-core-sub-dir.sh`).
# Install the script in one of the folders in your PATH. (`mv wp-install-core-sub-dir.sh /usr/local/bin/wp-install-core-sub-dir`)

#Usage:

# $ mkdir mysite
# $ cd mysite
# $ wp-install-core-sub-dir {sub-directory} {db_name} {db_user} {db_pass} {site_url} "{site_title}" {admin_user} {admin_pass} {admin_email}

# create the dir for the core files
mkdir $CORE_DIR
cd $CORE_DIR

adduser $SITE_USER 
su $SITE_USER

# download WordPress files
# wp core download

# create the wp-config.php file
wp config create --dbname=$DB_NAME \
    --dbuser=$DB_USER \
    --dbpass=$DB_PASS \
    --dbhost=mariadb:3306 \
    --path='/wordpress'
1/10 [--dbpass=<dbpass>]:
Success: Generated 'wp-config.php' file.


# create the database
wp db create
Success: echo 'Database created.'

# install WordPress (less than 5 mins)
wp core install --url=$SITE_URL --title="$SITE_TITLE" --admin_user=$SITE_USER --admin_password=$SITE_PASS --admin_email=$SITE_EMAIL

# add second user TODO
# wp user create
echo 'core install done'
# Copy (not move) index.php file to root
cd ../
ls 
cp "$CORE_DIR/index.php" ./index.php

# Edit index.php to point to correct path of wp-blog-header.php
perl -p -i -e "s/\/wp-blog-header/\/$CORE_DIR\/wp-blog-header/g" index.php

# Update the siteurl in the database with sub directory path
cd $CORE_DIR
wp option update siteurl $(wp option get siteurl)/$CORE_DIR

# Uncomment the below line if you want the config in root
#cp "$CORE_DIR/wp-config.php" ./wp-config.php

echo 'Install finished!'

su root
fi

exec "$@"