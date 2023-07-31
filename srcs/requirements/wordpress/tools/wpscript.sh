#!/bin/sh

sleep 10

if [ -f ./wordpress/wp-config.php ]
then
    echo "wordpress already exists"
else


    echo 'Install finished!'
fi

exec "$@"