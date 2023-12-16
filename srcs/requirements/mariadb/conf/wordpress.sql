use mysql;
CREATE DATABASE inception;
CREATE USER 'test'@'%' IDENTIFIED BY 'test';
GRANT ALL PRIVILEGES ON *.* TO 'test'@'%' IDENTIFIED BY 'test';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'test';