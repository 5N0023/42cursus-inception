#!/bin/bash

mkdir -p /var/run/mysqld
mkdir -p /run/mysqld

if [ ! -d /var/lib/mysql/mysql ]; then
    mysql_install_db --user=root
fi

service mariadb start

while ! mysqladmin ping --silent; do
    sleep 1
done

if ! mysql -uroot --password=$MYSQL_ROOT_PASSWORD -e "USE inception;" 2>/dev/null; then
   echo "use mysql;CREATE DATABASE ${MYSQL_DB};\
        CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';\
        GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';\
        ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';\
        " | mysql -uroot -p${MYSQL_ROOT_PASSWORD}
fi

kill -9 $(pgrep mariadb)

while mysqladmin ping --silent --user=root --password=$MYSQL_ROOT_PASSWORD; do
    sleep 1
done

exec mysqld_safe
