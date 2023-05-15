FROM	debian:buster

RUN	apt-get update && apt-get install mariadb-server -y

COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY	conf/init_mariadb.sh	/etc/mysql/init_mariadb.sh

RUN	chmod 777 /etc/mysql/init_mariadb.sh
CMD	["/etc/mysql/init_mariadb.sh"]
