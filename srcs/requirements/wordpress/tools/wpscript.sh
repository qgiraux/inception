#!/bin/bash
sleep 10
if [ ! -f /var/www/html/wp-config.php ]; then
    

    wp config create	--allow-root \
                        --dbname=$MYSQL_DATABASE \
                        --dbuser=$MYSQL_USER \
                        --dbpass=$MYSQL_PASSWORD \
                        --dbhost=mariadb:3306 --path='/var/www/html' \
                        --skip-check
    
    wp user create guest guest@smth.com --role=author --user_pass=$wp_user_pwd --allow-root
fi

wp core install		--allow-root \
                    --url=qgiraux.42.fr \
                    --title=qgiraux_inception \
                    --admin_user=$WP_USER \
                    --admin_password=$WP_PASSWORD \
                    --admin_email=quentin.giraux@gmail.com \
                    --path='/var/www/html'
                    
php-fpm -F



