FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y  && \
    apt-get install -y mariadb-server mariadb-client

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

##RUN mkdir /docker-entrypoint-initdb.d

COPY tools/setup.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/setup.sh

##ENTRYPOINT ["setup.sh"]
