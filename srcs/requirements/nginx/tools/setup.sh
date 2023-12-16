#!/bin/bash

# Generate SSL certificates (non-interactive)
mkdir -p /etc/nginx/ssl/private/ /etc/nginx/ssl/certs/
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "${CERTS_key}" \
    -out "${CERTS_certs}" \
    -subj "/C=MA/ST=KH/L=Khouribga/O=1337/OU=1337al Unit/CN=home"
chmod 600 ${CERTS_key} ${CERTS_certs}
# Start NGINX
exec nginx -g 'daemon off;'