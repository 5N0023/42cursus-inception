#!/bin/bash

# Ensure necessary directories exist
mkdir -p /var/run/mysqld
mkdir -p /run/mysqld

if [ ! -d /var/lib/mysql/mysql ]; then
    mysql_install_db --user=root
fi

# Start MariaDB
service mariadb start

# Wait for MariaDB to start
while ! mysqladmin ping --silent; do
    sleep 1
done

# Check if the database exists before creating
if ! mysql -uroot --password=$MYSQL_ROOT_PASSWORD -e "USE inception;" 2>/dev/null; then
    mysql -uroot  < /tmp/wordpress.sql
fi

# Start all the services`