# Development of Python application
### 1. Create a Azure VM
- login to the Vm dashboard
- create a Vm with configuration of size
```sh
RG: codefrontier
Standard B2ms
vCPUs: 2
RAM: 8 GiB
```
- Assigned a Static Public given below:
```sh
IP: 135.235.162.200
```
### 2. Create a Azure Mysql database 
- Resource Group: RG
- Server Name: codefrontier
- Location: Central India
- Version: MySQL 8.0
- Compute + Storage: Standard_B1ms (1 vCore, 2 GiB memory, 640 max iops)
- Admin Username: admin123
- Password: Admin@280324
- Connect to the MySQL database using environment variables for
```sh
hostname=codefrontier.mysql.database.azure.com
port=3306
username=admin123
password=Admin@280324
ssl-mode=require
```
- installation of myql server in the ubuntu.
```sh
sudo apt update
sudo apt install mysql-server
```
- Connect to the MySQL Server:
```sh

mysql -h codefrontier.mysql.database.azure.com -P 3306 -u admin123 -p

```
- create a DateBase
```sh
CREATE DATABASE message_db;
```
- Create a User and Grant Permissions:
```sh
CREATE USER 'myuser'@'%' IDENTIFIED BY 'mypassword';
GRANT ALL PRIVILEGES ON message_db.* TO 'myuser'@'%';
FLUSH PRIVILEGES;
```
- Create a init.sql Schema 
```sh
-- Create the database
CREATE DATABASE IF NOT EXISTS message_db;

-- Use the database
USE message_db;

-- Create the messages table
CREATE TABLE IF NOT EXISTS messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message TEXT NOT NULL
);

-- Insert sample data
INSERT INTO messages (message) VALUES ('Hello, World!');
INSERT INTO messages (message) VALUES ('Welcome to the Flask MySQL App!');
```
- Exit from the database and Initialize the Database
```sh

mysql -h codefrontier.mysql.database.azure.com -P 3306 -u admin123 -p message_db < init.sql
```
- login to mysql server and check for the schema
```sh
mysql -h codefrontier.mysql.database.azure.com -P 3306 -u admin123 -p
```
- After Login to Mysql , type below:
```sh
USE message_db;
SELECT * FROM messages;
```
- system has PEP 668 (externally-managed-environment) enabled, which prevents pip from installing packages system-wide
- Create and activate a virtual environment (Recommended):
```sh
python3 -m venv venv
source venv/bin/activate
pip install Flask mysql-connector-python python-dotenv
```
- Create the .env File
```sh
MYSQL_SERVER=codefrontier.mysql.database.azure.com
MYSQL_USER=myuser
MYSQL_PASSWORD=mypassword
MYSQL_DB=message_db
```
- Run the code 
```sh
python app.py
```
- Now , your can access the application 
```sh
http://135.235.162.200:5000/
```

- To exit the virtual environment, simply run:
```sh
deactivate
```