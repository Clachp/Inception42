FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y  && \
    apt-get install -y mariadb-server mariadb-client procps

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /var/run/mysqld && \
	chown mysql:mysql /var/run/mysqld/ && \
	chmod -R 755 /var/run/mysqld/

RUN mkdir -p /var/lib/mysql && \
	chown mysql:mysql /var/lib/mysql/ && \
	chmod -R 755 /var/lib/mysql/

COPY tools/setup.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/setup.sh

EXPOSE 3306

ENTRYPOINT ["setup.sh"]

##CMD ["mysqld", "--bind-address=0.0.0.0"]
