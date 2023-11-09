#!/bin/bash

# Start the containers defined in the docker-compose.yml file
docker-compose up -d

#Wait...
echo "		"
echo "		"
echo "		"

bold=$(tput bold)
italic=$(tput sitm)
reset=$(tput sgr0)

echo "${bold}${italic}Please wait until the database is ready.${reset}"

sleep 55

# Execute a command inside the container
docker exec -it sakila bash -c "mysql -uroot -p1234 -e 'CREATE DATABASE sakila;'"

# Execute a command inside the container
docker exec -it sakila bash -c "mysql -uroot -p1234 -e 'SOURCE sakila-schema.sql;'"

# Execute another command inside the container
docker exec -it sakila bash -c "mysql -uroot -p1234 -e 'SOURCE sakila-data.sql;'"


# Install Flask and mysql-connector-python using pip
pip install --upgrade pip
pip install flask mysql-connector-python

# Run the Python script using Python 3.8
python app-api.py
