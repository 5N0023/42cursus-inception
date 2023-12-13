FROM debian:bullseye

# Install nginx
RUN apt-get update && apt-get install -y nginx && apt-get install -y openssl

# Create directories for SSL certificates
RUN mkdir -p /etc/nginx/ssl/private/ /etc/nginx/ssl/certs/

# Generate SSL certificates (non-interactive)
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/private/selfsigned.key \
    -out /etc/nginx/ssl/certs/selfsigned.crt \
    -subj "/C=MA/ST=KH/L=Khouribga/O=1337/OU=1337al Unit/CN=home"

# Set permissions for SSL certificates
RUN chmod 600 /etc/nginx/ssl/private/selfsigned.key /etc/nginx/ssl/certs/selfsigned.crt

# Copy nginx config
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
