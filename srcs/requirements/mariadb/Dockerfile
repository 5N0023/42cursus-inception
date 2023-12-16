FROM debian:bullseye

# Install necessary dependencies
RUN apt-get update && apt-get install -y mariadb-server && apt-get -y install systemctl
# Copy your SQL script to a directory inside the container

COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh


# Start MariaDB when the container starts
CMD ["/tmp/setup.sh"]