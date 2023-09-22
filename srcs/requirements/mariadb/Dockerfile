FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server

ENV MYSQL_ROOT_PASSWORD root123
ENV MYSQL_USER claire
ENV MYSQL_PASSWORD claire123
ENV MYSQL_DATABASE wordpress

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/setup.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/setup.sh

ENTRYPOINT ["setup.sh"]
