#!/bin/bash

wp core download --allow-root

sleep 4

wp config create --dbname=${MYSQL_DB} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASS} --dbhost=${WORDPRESS_DB_HOST} --allow-root

# wp plugin install redis-cache --activate --allow-root

wp core install --url=${DOMAIN_NAME} --title=${WORDPRESS_TITLE} --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root

wp user create ${WORDPRESS_USER} ${WORDPRESS_USER_EMAIL} --role=${WORDPRESS_USER_ROLE} --user_pass=${WORDPRESS_USER_PASSWORD} --allow-root

# redis

wp config set WP_REDIS_HOST redis --allow-root #I put --allowroot because i am on the root user on my VM
wp config set WP_REDIS_PORT 6379 --raw --allow-root
wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
wp config set WP_REDIS_CLIENT phpredis --allow-root
wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root

wp theme install gutenify-virtual-reality --activate --allow-root

sleep 4

php-fpm7.4 -F