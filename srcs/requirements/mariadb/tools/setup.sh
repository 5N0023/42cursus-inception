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
   echo "use mysql;CREATE DATABASE ${MYSQL_DB};CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';FLUSH PRIVILEGES;ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"| mysql -uroot
fi

# service mariadb stop

while mysqladmin ping --silent; do
    sleep 1
done

# Start all the services
exec mysqld_safe 
# Start all the services`