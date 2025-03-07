from flask import Flask
import mysql.connector
import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

app = Flask(__name__)

# Database configuration from environment variables
db_config = {
    'host': os.getenv('MYSQL_SERVER'),
    'user': os.getenv('MYSQL_USER'),
    'password': os.getenv('MYSQL_PASSWORD'),
    'database': os.getenv('MYSQL_DB')
}

@app.route('/')
def display_message():
    try:
        # Connect to the MySQL database
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        # Fetch the message from the database
        cursor.execute("SELECT message FROM messages LIMIT 1")
        message = cursor.fetchone()[0]

        # Close the connection
        cursor.close()
        conn.close()

        return f"Message from database: {message}"
    except mysql.connector.Error as err:
        return f"Error: {err}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)