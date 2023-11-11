FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y  && \
    apt-get install -y mariadb-server mariadb-client 

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld/ && \
	chmod -R 777 /var/run/mysqld/

COPY tools/setup.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/setup.sh

EXPOSE 3306

ENTRYPOINT ["setup.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]
