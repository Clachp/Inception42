FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y  && \
    apt-get install -y mariadb-server 

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /var/run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chown mysql:mysql /var/run/mysqld/
RUN chmod -R 755 /var/run/mysqld/
RUN chown mysql:mysql /var/lib/mysql/
RUN chmod -R 755 /var/lib/mysql/

COPY tools/setup.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/setup.sh

EXPOSE 3306

ENTRYPOINT ["setup.sh"]

