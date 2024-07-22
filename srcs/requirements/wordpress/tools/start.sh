#!/bin/bash

# Run WordPress setup
/usr/local/bin/wpscript.sh

# Start PHP-FPM as www-data
exec /usr/sbin/php-fpm7.4 -F -R
