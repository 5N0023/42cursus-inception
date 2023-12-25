FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-gd \
    php7.4-curl \
    php7.4-zip \
    php7.4-redis \
    curl \
    && rm -rf /var/lib/apt/lists/*
    
RUN mkdir -p /run/php
WORKDIR /var/www/html
RUN chown -R www-data:www-data /var/www/html/
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/script.sh /tmp/
RUN chmod +x /tmp/script.sh
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

CMD ["/tmp/script.sh"]