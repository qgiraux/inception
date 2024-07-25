FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y mariadb-server

COPY ./tools/maria_script.sh /tmp/maria_script.sh

RUN  chmod +x /tmp/maria_script.sh

RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf 

ENTRYPOINT ["bash", "/tmp/maria_script.sh"]

CMD ["mysqld_safe"]

