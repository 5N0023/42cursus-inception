FROM debian:bullseye

# Install nginx
RUN apt-get update && apt-get install -y nginx && apt-get install -y openssl && apt-get -y install systemctl

COPY ./conf/nginx.conf /etc/nginx/conf.d


COPY  ./tools/setup.sh /tmp/
RUN chmod +x /tmp/setup.sh

CMD ["/tmp/setup.sh"]
