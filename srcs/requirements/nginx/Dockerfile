FROM	debian:buster



RUN	apt-get update && apt-get -y upgrade
RUN	apt-get -y install nginx && apt-get -y install openssl
RUN	mkdir -p /etc/nginx/ssl

RUN openssl req \
	 -newkey rsa:2048 \
	 -x509 \
	 -days 365 -nodes \
	 -out /etc/nginx/ssl/nthimoni.42.fr.crt \
	 -keyout /etc/nginx/ssl/nthimoni.42.fr.key \
	 -subj "/CN=nthimoni.42.fr"

EXPOSE 443

RUN rm /etc/nginx/sites-enabled/default

COPY	conf/nthimoni.conf /etc/nginx/sites-enabled/nthimoni.42.fr.conf

CMD	["nginx", "-g", "daemon off;"]
