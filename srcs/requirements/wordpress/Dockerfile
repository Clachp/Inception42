FROM debian:buster

RUN apt-get update && apt-get upgrade && \
    apt-get -y install wget \
    php-fpm \
    php-mysql \
    mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY conf/auto.sh /usr/local/bin
RUN chmod +x /usr/local/bin/auto.sh
#ENTRYPOINT ["conf/auto.sh"]

EXPOSE 3306

VOLUME /var/www/html

