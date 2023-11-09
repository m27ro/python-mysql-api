# python-mysql-api
This repository contains a Python MySQL API for performing CRUD operations on a database.
## Instructions for running the application and database
1.Clone the repository:

git clone https://github.com/m27ro/python-mysql-api.git

cd python-mysql-api/

2.Run the script to set up the database and start the application:

chmod +x script.sh

./script.sh

3.Test the application by using the following commands:

-**POST Method - Insert data:**
curl -X POST -H "Content-Type: application/json" -d '{"first_name":"", "last_name":""}' http://localhost:8443/post_actor

-**GET Method - Fetch data:**
curl -L http://localhost:8443/get_actors

-**GET Method - Fetch more data:**
curl -L http://localhost:8443/get_actors_id


Please note that you need to have cURL,docker and docker-compose installed on your system to execute the above commands.

Feel free to explore and use this Python MySQL API for your database operations.
