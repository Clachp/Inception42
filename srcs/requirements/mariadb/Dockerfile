FROM debian:buster
#FROM alpine:3.17
RUN apt-get update && apt-get install -y mariadb-server mariadb-client
#RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils && rm -f /var/cache/apk/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tool/run.sh /usr/local/bin/