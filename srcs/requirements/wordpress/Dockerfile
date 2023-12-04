FROM debian:bullseye

# Install php packages
RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install -y nano wget \
	php7.4 php-cgi php-fpm php-pdo php-mysql php-gd php-cli \
	default-mysql-client mariadb-client


#Install wordpress latest version
#RUN wget https://wordpress.org/latest.tar.gz -P /var/www/html && \
	#cd /var/www/html && \
#	tar -xzvf latest.tar.gz && \
#	rm latest.tar.gz

#RUN	chown -R root:root /var/www/html/wordpress

# Install worpress-cli to configure wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/* && chmod -R 755 /var/www/*

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/


COPY tools/install.sh /usr/local/bin
RUN chmod +x /usr/local/bin/install.sh

WORKDIR /var/www/html
EXPOSE 9000

ENTRYPOINT ["install.sh"]

