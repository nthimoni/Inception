FROM	debian:buster

RUN	apt-get update && apt-get install php-fpm php-curl php-gd php-intl php-mbstring php-mysql php-soap php-xml php-xmlrpc php-zip curl mariadb-client -y

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN	chmod +x wp-cli.phar

RUN	mv wp-cli.phar /usr/local/bin/wp-cli

WORKDIR /var/www/wordpress

RUN	wp-cli core download --allow-root

RUN mkdir /run/php

COPY	conf/wp_setup.sh /usr/local/bin/wp_setup.sh
COPY	conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN	chmod +x /usr/local/bin/wp_setup.sh

EXPOSE	9000

ENTRYPOINT ["/usr/local/bin/wp_setup.sh"]
CMD ["php-fpm7.3", "-F"]	
