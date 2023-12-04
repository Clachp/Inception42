all: 
	mkdir -p /home/cchapon/data/db /home/cchapon/data/wp
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down 

clean: down
	docker volume rm data wordpress

fclean: clean
	@sudo rm -rf /home/cchapon/data/db/*
	@sudo rm -rf /home/cchapon/data/wp/*
	@docker system prune -af

re: fclean all

.Phony: all logs clean fclean
