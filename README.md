
# Project Title: Dockerized Environment for Web Development

## Description

This project aims to simplify the process of setting up a web development environment using Docker and Docker Compose. By containerizing services like NGINX, MariaDB, and WordPress, developers can easily deploy a consistent and isolated environment for development, testing, and production purposes. This README outlines the objectives of learning and provides a guide on how to use this project.

## Objectives of Learning

1. Understand Docker and Docker Compose.
2. Discover the different points of the subject d'Inception.
3. Set up an NGINX container.
4. Set up a MariaDB container.
5. Set up a WordPress container.
6. Connect the containers with Docker Compose.
7. Understand the volumes of Docker Compose.
8. Finalize the project.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them:

- Docker
- Docker Compose

You can download Docker Desktop which includes both Docker and Docker Compose from the official [Docker website](https://www.docker.com/products/docker-desktop).

### Installing

A step by step series of examples that tell you how to get a development environment running:

1. Clone the repository to your local machine:

```bash
git clone https://github.com/5N0023/42cursus-inception.git
```
2.  Navigate to the project directory:
```bash
cd 42cursus-inception
```
3. create .env file and fill it
```
	# nginx certs
	CERTS_certs=/etc/nginx/ssl/certs/selfsigned.crt
	CERTS_key=/etc/nginx/ssl/private/selfsigned.key

	# mysql
	MYSQL_ROOT_PASSWORD=root
	MYSQL_PASS=test
	MYSQL_USER=test
	MYSQL_DB=inception
	WORDPRESS_DB_HOST=mariadb

	# wordpress config
	DOMAIN_NAME=mlektaib.42.fr
	WORDPRESS_TITLE=mlektaib

	# wordpress admin
	WORDPRESS_ADMIN_USER=mlektaib
	WORDPRESS_ADMIN_PASSWORD=mlektaib
	WORDPRESS_ADMIN_EMAIL=lektaibim@gmail.com

	# wordpress user
	WORDPRESS_USER=user1
	WORDPRESS_USER_EMAIL=user1@example.com
	WORDPRESS_USER_PASSWORD=user1
	WORDPRESS_USER_ROLE=author
```
4. copy created .env file to srcs folder
5. Add mlektaib.42.fr to /etc/hosts
``` 
127.0.0.1 mlektaib.42.fr
```
6.  Use make to build and start the containers:
``` bash
make up
```
