FROM alpine:3.17

RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils mysql mysql-client && \
    rm -f /var/cache/apk/*

COPY conf/my.cnf /etc/mysql/my.cnf