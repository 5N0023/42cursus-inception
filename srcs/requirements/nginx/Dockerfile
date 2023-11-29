FROM Debian:12.2

# Install nginx
RUN apt-get update && apt-get install -y nginx

# Copy nginx config

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]