FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-gd \
    php7.4-curl \
    php7.4-zip \
    wget \
    vim \
    && rm -rf /var/lib/apt/lists/* && apt-get update && apt-get install nano unzip -y
RUN mkdir -p /run/php

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.zip

RUN unzip latest.zip -d /var/www/html/
RUN rm latest.zip
RUN mv /var/www/html/wordpress/* /var/www/html/
RUN rm -rf /var/www/html/wordpress
RUN chown -R www-data:www-data /var/www/html/
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./conf/wp-config.php /var/www/html/

COPY ./tools/script.sh .

RUN chmod +x ./script.sh

CMD ["./script.sh"]