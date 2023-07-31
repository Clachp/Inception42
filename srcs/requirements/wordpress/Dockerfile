FROM debian:buster

RUN apt-get update && apt-get upgrade && \
    apt-get -y install wget \
    php7.3 \
    php-fpm \
    php-mysql \
    mariadb-client

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && rm -rf latest.tar.gz