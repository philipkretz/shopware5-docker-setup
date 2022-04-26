#!/usr/bin/env bash
set -e

echo "##### starting containers #####"
docker-compose up -d --build

USER=$(whoami)
GROUP=$(id -g -n)

if [ ! -f ./www/shopware.php ]
then
	echo "##### install shopware #####"
	sudo chown $USER:$GROUP www
	git clone https://github.com/shopware/composer-project.git www/
	cp shopware.env www/.env
	cd www && composer install --no-scripts
  docker-compose exec php-apache app/bin/install.sh
	sudo chown -R $USER:$GROUP www
fi
