from flask import Flask
import mysql.connector

app = Flask(__name__)

# MySQL connection
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password",
    database="testdb"
)

@app.route("/")
def hello_world():
    cursor = db.cursor()
    cursor.execute("SELECT message FROM messages LIMIT 1")
    result = cursor.fetchone()
    return result[0] if result else "Hello, World!"

if __name__ == "__main__":
    app.run(debug=True)
