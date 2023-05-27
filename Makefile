all:
	mkdir -p /home/nthimoni/data/wordpress
	mkdir -p /home/nthimoni/data/mysql
	docker compose -f srcs/docker-compose.yml build
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker system prune -af
	docker compose -f srcs/docker-compose.yml down --volumes

cleandb:
	sudo rm -rf /home/nthimoni/data

fclean: clean cleandb

.PHONY: all down clean cleandb fclean
