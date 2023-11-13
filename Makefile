all: 
	mkdir -p /home/cchapon/data/db
	mkdir -p /home/cchapon/data/wp
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

clean:
	docker container stop nginx mariadb wordpress
	docker network rm inception

fclean: clean
	@sudo rm -rf /home/cchapon/data/db/*
	@sudo rm -rf /home/cchapon/data/wp/*
	@docker system prune -af

re: fclean all

.Phony: all logs clean fclean
