FROM		debian:buster

RUN		apt-get update && apt-get install mariadb-server -y

COPY		conf/init_db.sh	/usr/local/bin/init_db.sh

RUN		chmod +x /usr/local/bin/init_db.sh

ENTRYPOINT	["/usr/local/bin/init_db.sh"]
CMD		["mysqld_safe", "--bind-address=0.0.0.0"]
