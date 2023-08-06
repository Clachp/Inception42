FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server

ENV MYSQL_ROOT_PASSWORD iamroot
ENV MYSQL_USER claire
ENV MYSQL_PASSWORD iam
ENV MYSQL_DATABASE wordpress

#COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
#COPY tools/run.sh /usr/local/bin/
#RUN chmod 777 /usr/local/bin/run.sh

#ENTRYPOINT ["run.sh"]