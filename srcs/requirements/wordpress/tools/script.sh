#!/bin/bash

sed -i "s/db_name/${MYSQL_DB}/g" wp-config.php
sed -i "s/db_user/${MYSQL_USER}/g" wp-config.php
sed -i "s/db_pass/${MYSQL_PASS}/g" wp-config.php

sleep 1

php-fpm7.4 -F