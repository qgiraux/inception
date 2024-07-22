FROM debian:bullseye

RUN mkdir -p /etc/nginx/ssl

# Update and install required packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx vim openssl

# Create necessary directories
RUN mkdir -p /etc/nginx/ssl /var/run/nginx

# Generate SSL certificate
RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=qgiraux.42.fr/UID=qgiraux"

# Copy custom nginx configuration
RUN mkdir -p /var/run/nginx
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Set permissions
RUN chmod 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html

# Start nginx
CMD ["nginx", "-g", "daemon off;"]