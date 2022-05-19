FROM php:8.0-apache

# PHP extensions

RUN apt-get update
RUN apt-get install -y libzip-dev default-mysql-server
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN apt-get update && apt-get upgrade -y
RUN a2enmod rewrite
