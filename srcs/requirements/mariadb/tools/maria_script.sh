#!/bin/bash


#!/bin/bash
set -e

# Start MariaDB in the background with skip networking
mysqld_safe --skip-networking &

# Wait for MariaDB to start
echo "Waiting for MariaDB to start..."
until mysqladmin ping --silent; do
  echo "MariaDB is not ready yet..."
  sleep 2
done
echo "TESTTESTTEST1"
# Apply root password if it has not been set already
ALTER USER 'root'@'localhost' IDENTIFIED BY "${MYSQL_ROOT_PASSWORD}";
flush privileges;

echo "TESTTESTTEST2"
# Create the initial database and user

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# Shutdown MariaDB
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

# Start MariaDB in the foreground
exec mysqld_safe

