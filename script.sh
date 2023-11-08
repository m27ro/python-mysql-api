#!/bin/bash

# Start the containers defined in the docker-compose.yml file
docker-compose up -d

#Wait...
echo "		"
echo "		"
echo "		"
echo "Please wait until the database is ready"
sleep 55

# Execute a command inside the container
docker exec -it sakila-db_db_1 bash -c "mysql -uroot -p1234 -e 'CREATE DATABASE sakila;'"

# Execute a command inside the container
docker exec -it sakila-db_db_1 bash -c "mysql -uroot -p1234 -e 'SOURCE sakila-schema.sql;'"

# Execute another command inside the container
docker exec -it sakila-db_db_1 bash -c "mysql -uroot -p1234 -e 'SOURCE sakila-data.sql;'"

