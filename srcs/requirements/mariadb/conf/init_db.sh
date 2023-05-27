#!/bin/bash

# Create the database

if [ ! -d "/var/lib/mysql/$SQL_DATABASE" ]; then
	echo "Creating database..."
	service mysql start

	sleep 1

	mysql -e "UPDATE mysql.user SET Password = PASSWORD('$SQL_ROOT_PASSWORD') WHERE User = 'root';"
	mysql -e "DELETE FROM mysql.user WHERE User='';"
	mysql -e "DROP DATABASE IF EXISTS test"
	mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
	mysql -e "FLUSH PRIVILEGES;"

	# Create db and user for wordpress
	mysql -e "CREATE DATABASE $SQL_DATABASE;"
	mysql -e "GRANT ALL ON $SQL_DATABASE.* TO '$MYSQL_USER'@'wordpress.inception_network' IDENTIFIED BY '$SQL_PASSWORD';"
	mysql -e "FLUSH PRIVILEGES"

	sleep 1

	service mysql stop
fi

exec "$@"
