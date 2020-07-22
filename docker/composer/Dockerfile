FROM php:7.4-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libpq-dev \
        git \
    && docker-php-ext-install pdo_pgsql pgsql \
    && docker-php-ext-install opcache

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN composer self-update
RUN composer global require hirak/prestissimo

COPY ./conf.d/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

VOLUME ["/sandbox"]
WORKDIR /sandbox

ENTRYPOINT ["composer"]
CMD ["--help"]
