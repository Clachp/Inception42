FROM debian:buster

RUN	apt-get update && apt-get upgrade && \
	apt-get install -y openssl nginx curl && \
	mkdir /etc/nginx/certificates && \
	openssl req \
	-x509 \
	-nodes \
	-newkey rsa:2048 \
	-keyout /etc/nginx/certificates/inception.key \
	-out /etc/nginx/certificates/inception.crt \
	-days 365 \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=cchapon.42.fr/UID=cchapon"

RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/hello.html /var/www/html/hello.html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]