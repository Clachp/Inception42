FROM debian:buster

RUN apt-get update && apt-get upgrade && \
    apt-get -y install wget \
    php7.3 \
    php-fpm \
    php-mysql \
    mariadb-client


COPY conf/www.conf /etc/php/7.3/fpm/pool.d

RUN chown -R root:root /var/www/wordpress

WORKDIR /var/www/html/