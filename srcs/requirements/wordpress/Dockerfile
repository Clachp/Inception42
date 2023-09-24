FROM debian:buster

RUN apt-get update && \
    apt-get install -y nano wget php php-fpm php-mysql mariadb-client

RUN wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz

##RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY conf/wp-config.php /wordpress/
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

##COPY conf/auto.sh /usr/local/bin
##RUN chmod +x /usr/local/bin/auto.sh
#ENTRYPOINT ["conf/auto.sh"]
##USER www-data
