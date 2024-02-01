default: build up

up:
	cd srcs && docker-compose up -d

down:
	cd srcs && docker-compose down

build:
	cd srcs && docker-compose build

restart:
	cd srcs && docker-compose restart

logs:
	cd srcs && docker-compose logs -f

ps:
	cd srcs && docker-compose ps

rm:
	cd srcs && docker-compose rm

exec:
	cd srcs && docker-compose exec $(c) bash
re : down prune
	sudo rm -rf  /home/mlektaib/data/db/* /home/mlektaib/data/wordpress/* 
	cd srcs && docker-compose build
	cd srcs && docker-compose up -d

prune:
	docker system prune -a