FROM debian:bullseye

RUN	apt-get update -y && apt-get upgrade -y && \
	apt-get install -y openssl nginx && \
	mkdir -p /etc/nginx/certificates && \
	openssl req \
	-x509 \
	-nodes \
	-newkey rsa:2048 \
	-keyout /etc/nginx/certificates/inception.key \
	-out /etc/nginx/certificates/inception.crt \
	-days 365 \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=cchapon.42.fr/UID=cchapon"

RUN mkdir -p /var/run/nginx

RUN mkdir -p /var/www/html && chmod -R 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod -R 755 /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
