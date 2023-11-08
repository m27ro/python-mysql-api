FROM mysql:latest
MAINTAINER MehrdadRostami
RUN chown -R mysql:root /var/lib/mysql/
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD
ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
WORKDIR /docker-entrypoint-initdb.d
ADD sakila-data.sql ./sakila-data.sql
ADD sakila-schema.sql ./sakila-schema.sql
ADD sakila.mwb ./sakila.mwb
EXPOSE 3306
