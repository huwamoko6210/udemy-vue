default: install ide-helper

install:
	docker-compose up -d --build
	docker-compose run --rm composer install
	docker-compose run --rm app php artisan migrate
	docker-compose run --rm app php artisan db:seed
	docker-compose run --rm node install
.PHONY:	install

up:
	docker-compose up -d
.PHONY:	up

clean:
	docker-compose down
.PHONY: clean

ide-helper:
	docker-compose run --rm app php artisan ide-helper:generate
	docker-compose run --rm app php artisan ide-helper:meta
	docker-compose run --rm app php artisan ide-helper:models --nowrite
.PHONY: ide-helper

dump:
	docker-compose run --rm composer dump-autoload
.PHONY:	dump

seed:
	docker-compose run --rm app php artisan migrate:fresh --seed
.PHONY:	seed

node:
	docker-compose run --rm node run dev
.PHONY:	check

reset:
    npm cache clear --force
    npm install
	docker-compose run --rm node run dev
.PHONY:	reset
