FROM debian:bullseye

# Install php packages
RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install -y nano wget \
	php7.4 php-cgi php-fpm php-pdo php-mysql php-gd php-cli \
	default-mysql-client mariadb-client

RUN mkdir /run/php

# Install wordpress latest version
RUN wget https://wordpress.org/latest.tar.gz -P /var/www && \
	cd /var/www && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz

# Install worpress-cli to configure wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

WORKDIR /var/www/html

COPY tools/install.sh /usr/local/bin
RUN chmod +x /usr/local/bin/install.sh

EXPOSE 9000

ENTRYPOINT ["install.sh"]
CMD ["/usr/sbin/php-fpm7.4", "-F", "-R"]
