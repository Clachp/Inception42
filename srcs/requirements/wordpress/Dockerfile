FROM debian:buster

# Install php packages
RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install -y nano wget \
	php php-cgi php-fpm php-pdo php-mysql php-gd php-cli

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

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

COPY tools/install.sh /usr/local/bin
RUN chmod +x /usr/local/bin/install.sh

EXPOSE 9000

CMD ["bash", "install.sh"]
