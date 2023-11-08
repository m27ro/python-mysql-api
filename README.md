# python-mysql-api

#Clone the repository:
git clone https://github.com/m27ro/python-mysql-api.git
cd python-mysql-api/

#Run the script to set up the database and start the application:
chmod +x script.sh
./script.sh

#Test the application by using the following commands:
#POST Method - Insert data:
curl -X POST -H "Content-Type: application/json" -d '{"first_name":"", "last_name":""}' http://localhost:8443/post_actor

#GET Method - Fetch data:
curl -L http://localhost:8443/get_actors

#GET Method - Fetch more data:
curl -L http://localhost:8443/get_actors_id
