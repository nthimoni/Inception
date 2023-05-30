#!/bin/bash

while ! mysqladmin ping -h"mariadb" --silent; do
    sleep 1
done

if ! wp-cli core is-installed --allow-root; then
	echo "Installing wordpress ..."
	wp-cli config create --dbhost="mariadb" --dbname="$SQL_DATABASE" --dbuser="$SQL_USER" --dbpass="$SQL_PASSWORD" --allow-root

	wp-cli core install --url=nthimoni.42.fr --title="$BLOG_NAME" --admin_user="$WP_USER" --admin_password="$WP_PASSWORD" --admin_email="$WP_EMAIL" --allow-root
	wp-cli user create guest guest@guest.fr --user_pass=$WP_PASSWORD --allow-root

else
	echo "Wordpress is already Installed."
fi

exec "$@"
