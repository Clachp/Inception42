FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server

WORKDIR /etc/mysal/mariadb.conf.d/50-server.cnf

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/run.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/run.sh

EXPOSE 3306

ENTRYPOINT ["usr/local/bin/run.sh"]