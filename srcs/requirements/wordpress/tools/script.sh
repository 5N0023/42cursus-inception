#!/bin/bash

wp core download --allow-root

sleep 4

wp config create --dbname=${MYSQL_DB} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASS} --dbhost=mariadb --allow-root

wp core install --url=${DOMAIN_NAME} --title=mlektaib --admin_user=test --admin_password=test --admin_email=test@fds.com --allow-root

wp user create username user@example.com --role=author --user_pass=username --allow-root

wp theme install gutenify-virtual-reality --activate --allow-root

sleep 4

php-fpm7.4 -F