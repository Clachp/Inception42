FROM debian:buster

RUN apt-get update && apt-get upgrade && \
    apt-get -y install wget \
    php7.3 \
    php-fpm \
    php-mysql \
    mariadb-client

RUN chown -R root:root /var/www/wordpress

#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
 #   chmod +x wp-cli.phar && \
 #   mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.3/fpm/pool.d

COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh
ENTRYPOINT [ "/tools/wpscript.sh" ]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3",  "-F"]
