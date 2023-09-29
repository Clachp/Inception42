FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y  && \
    apt-get install -y mariadb-server vim

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/setup.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/setup.sh

ENTRYPOINT ["setup.sh"]
