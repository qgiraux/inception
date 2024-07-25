FROM debian:bullseye

ARG         MYSQL_DATABASE
ARG         MYSQL_USER
ARG         MYSQL_PASSWORD
ARG         MYSQL_ROOT_PASSWORD

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y mariadb-server

COPY ./tools/maria_script.sh /tmp/maria_script.sh

RUN  chmod +x /tmp/maria_script.sh

# Copy the MariaDB configuration file and dump.sql file
COPY        ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/
RUN         chmod 644 /etc/mysql/mariadb.conf.d/mariadb.cnf
COPY        ./conf/dump.sql /usr/local/bin/

COPY        ./tools/maria_script.sh /usr/local/bin/
RUN         bash /usr/local/bin/maria_script.sh

EXPOSE      3306

ENTRYPOINT ["mysqld_safe"]


