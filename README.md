# 環境構築手順

```
$ cp .env.example .env

$ docker-compose up -d

$ docker-compose run --rm composer install

$ docker-compose run --rm node install

$ docker-compose run --rm node run dev

$ docker exec -it sand-app php artisan migrate --seed
```

