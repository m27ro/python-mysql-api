from flask import Flask, jsonify, request
import mysql.connector

app = Flask(__name__)

def connect_to_db():
   cnx = mysql.connector.connect(user='sakila', password='sakila',
                            host='localhost', database='sakila')
   return cnx

@app.route('/get_actors', methods=['GET'])
def get_actors():
   cnx = connect_to_db()
   cursor = cnx.cursor()
   cursor.execute("SELECT first_name, last_name FROM actor")
   rows = cursor.fetchall()
   return jsonify(rows)

@app.route('/get_actors_id', methods=['GET'])
def get_actors_id():
   cnx = connect_to_db()
   cursor = cnx.cursor()
   cursor.execute("SELECT * FROM actor")
   rows = cursor.fetchall()
   return jsonify(rows)

@app.route('/post_actor', methods=['POST'])
def post_actor():
   cnx = connect_to_db()
   cursor = cnx.cursor()
   add_actor = ("INSERT INTO actor "
             "(first_name, last_name) "
             "VALUES (%s, %s)")
   data = (request.json.get('first_name'), request.json.get('last_name'))
   if all(data):
       cursor.execute(add_actor, data)
       cnx.commit()
       return jsonify({'message': 'Actor added successfully'})
   else:
       return jsonify({'message': 'Missing first_name or last_name in request body'}), 400

if __name__ == "__main__":
   app.run(host='0.0.0.0', port=8443)
