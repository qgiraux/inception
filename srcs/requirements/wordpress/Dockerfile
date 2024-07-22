FROM debian:bullseye

# Update and install necessary packages
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y wget \
    php7.4 php-fpm php-mysql \
    default-mysql-client \
    mariadb-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download and set up wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Download and extract WordPress
RUN wget https://wordpress.org/wordpress-6.6.tar.gz -P /var/www/html \
    && tar -xzf /var/www/html/wordpress-6.6.tar.gz -C /var/www/html \
    && rm /var/www/html/wordpress-6.6.tar.gz

# Create www-data user and group (if not already existing)
RUN usermod -aG www-data www-data

# Ensure proper permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Copy setup and wrapper scripts
COPY ./tools/wpscript.sh /usr/local/bin/wpscript.sh
COPY ./tools/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/wpscript.sh /usr/local/bin/start.sh

# Copy PHP-FPM pool configuration
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Expose port
EXPOSE 9000

# Use the wrapper script as the entrypoint
ENTRYPOINT ["/usr/local/bin/start.sh"]

